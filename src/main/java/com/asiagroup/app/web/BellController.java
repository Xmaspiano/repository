package com.asiagroup.app.web;

import com.asiagroup.app.entity.Answer;
import com.asiagroup.app.entity.Pencil;
import com.asiagroup.app.page.BellPage;
import com.asiagroup.app.page.PencilPage;
import com.asiagroup.app.service.AnswerService;
import com.asiagroup.app.service.PencilService;
import com.asiagroup.app.service.TouserService;
import com.asiagroup.util.SystemCommon;
import com.asiagroup.util.subscriber.SubscriberManagerImpl;
import net.sf.json.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * Created by AlbertXmas on 2017/1/13.
 */
@Controller
@RequestMapping(value = {"/bell"})
public class BellController {
    private static final Logger LOGGER = LoggerFactory.getLogger(BellController.class);

    @Autowired
    private TouserService touserService;

    @Autowired
    private PencilService pencilService;

    @Autowired
    private AnswerService answerService;

//    @Autowired
//    PencilService pencilService;

    @Autowired
    private SystemCommon systemCommon;

    @RequestMapping(method = RequestMethod.GET)
    public String index(){
        return "bell";
    }

    @RequestMapping(value="/msg",produces="text/event-stream")
    @ResponseBody
    public String push() throws InterruptedException {
        Map rtnMap = new HashMap();
        Pencil pencil = (Pencil)new SubscriberManagerImpl().getSomeData();

        String[] toUser = pencil.getTouser().split(",");

        BellPage bellPage = null;
        for(String loginid:toUser){
            if(loginid.equals(String.valueOf(getUerId()))){//通知人和当前用户一致
                bellPage = new BellPage(pencil);
                bellPage.setAnswer(true);
            }

        }


        rtnMap.put("pencil",pencil);
        rtnMap.put("bell",bellPage);
        rtnMap.put("bellSize",getSizeByTouser());

        JSONObject jsonObject = JSONObject.fromObject(rtnMap);
//        System.out.println(jsonObject.toString());
        return "event: update\n" +
                "data:"+jsonObject.toString()+"\n\n";
    }

    @RequestMapping("/queryall")
    @ResponseBody
    public Map queryList(@RequestParam(value = "page", defaultValue = "0") Integer page,
                         @RequestParam(value = "bt", defaultValue = "") String bt){
        Map mp = new HashMap();

//        Sort sort = new Sort(Sort.Direction.DESC, "createdate");
        Sort sort = new Sort(Sort.Direction.DESC, "createdate");
        Pageable pageable = new PageRequest(page, 10, sort);
//        return pencilService.findAll(pageable);
        Map qryField = new HashMap();
        if(!bt.equals("")){
            mp.put("bt",bt);
        }

        Page<Pencil> pencilPage = pencilService.findAllByTouserId(getUerId(), mp, pageable);

        Page<BellPage> bells = pageChange(pencilPage, pageable);
        if(bells == null) {
            bells = new PageImpl(new ArrayList<BellPage>());
        }

        for(BellPage bellPage:bells) {
            System.out.println(bellPage.getTouser());
        }

        mp.put("detail", bells);
        mp.put("bellSize",getSizeByTouser());
        return mp;
    }


    @RequestMapping(value="/msgnext")
    @ResponseBody
    public String put(){
        List li = new ArrayList();
        Pencil P = new Pencil();
        P.setBt("111");
        li.add(P);

        SubscriberManagerImpl.homeWatched.setData(li);
        return "success...";
    }

    private long getUerId(){
        return systemCommon.getUserInfo(
                SecurityUtils.getSubject().getPrincipal().toString()
        ).getId();
    }

    private long getSizeByTouser(){
        long touserPencilSize = touserService.countByTouser(
                getUerId()
        );
        return touserPencilSize;
    }

    private Page<BellPage> pageChange(Page<Pencil> pencilPage, Pageable pageable){
        List<BellPage> bellPages = new ArrayList<>();

        BellPage bellPage;
        Long userID = systemCommon.getUserInfo(SecurityUtils.getSubject().getPrincipal().toString()).getId();

        Answer answer;
        for(Pencil pencil:pencilPage){
            bellPage = new BellPage(pencil);
            answer = answerService.findByCreatorAndPencilid(userID, pencil.getId());

            if(answer != null){
                bellPage.setAnswer(true);
            }
            bellPages.add(bellPage);
        }
        return new PageImpl(bellPages, pageable, pencilPage.getTotalElements());
    }
}

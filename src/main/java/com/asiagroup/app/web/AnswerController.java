package com.asiagroup.app.web;

import com.asiagroup.app.entity.Answer;
import com.asiagroup.app.page.AnswerPage;
import com.asiagroup.app.page.PencilPage;
import com.asiagroup.app.service.AnswerService;
import com.asiagroup.app.service.PencilService;
import com.asiagroup.system.entity.Hrmresource;
import com.asiagroup.util.SystemCommon;
import com.drew.imaging.jpeg.JpegProcessingException;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by AlbertXmas on 2017/2/7.
 */
@Controller
@RequestMapping(value = {"/answer"})
public class AnswerController {

    @Autowired
    private AnswerService answerService;

    @Autowired
    private PencilService pencilService;

    @Autowired
    private SystemCommon systemCommon;

    @RequestMapping(method = RequestMethod.GET)
    public String index(@RequestParam("id")long id, Model model){
        String loginid = SecurityUtils.getSubject().getPrincipal().toString();
        List<Answer> answers = answerService.findByPencilId(id);
        AnswerPage answer = new AnswerPage();
//        answer.setCreator(getId(SecurityUtils.getSubject().getPrincipal().toString()));
        answer.setName(getName(Long.valueOf(loginid)));

        List<AnswerPage> answerpages = new ArrayList<AnswerPage>();
        AnswerPage tempVo;
        boolean canEdit = false;
//        System.out.println(answers.size()+":answers.size()");
        long userid = getId(loginid);

        for(Answer a:answers){
//            System.out.println(a);
            tempVo = new AnswerPage();
            tempVo.setAnswerObj(a);
            tempVo.setName(systemCommon.getUserInfoById(a.getCreator()).getLastname());
            answerpages.add(tempVo);

            if(a.getCreator() == userid){
                answer = tempVo;
            }
        }

        String[] tousers = pencilService.findOne(id).getTouser().split(",");
        out:
        for(String userId:tousers){
            if(userId.equals(String.valueOf(userid))){
                canEdit = true;
                break out;
            }
        }

        model.addAttribute("canEdit",canEdit);
        model.addAttribute("pencilid",id);
        model.addAttribute("AnswerPage",answer);
        model.addAttribute("answersList",answerpages);
        return "answer";
    }

    @RequestMapping("/save")
    @ResponseBody
    public String save(Answer answer) throws IOException, CloneNotSupportedException, JpegProcessingException {
        answer.setCreator(getId(SecurityUtils.getSubject().getPrincipal().toString()));
        answerService.save(answer);
        return "success:true";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String save(@RequestParam("id")long id) throws IOException, CloneNotSupportedException, JpegProcessingException {
        answerService.delete(id);
        return "success:true";
    }


    private long getId(String loginid){
        return getHrm(loginid).getId();
    }

    private String getName(long loginid){
        return getHrm(String.valueOf(loginid)).getLastname();
    }

    private Hrmresource getHrm(String loginid){
        return systemCommon.getUserInfo(loginid);
    }
}

package com.asiagroup.app.web;

import com.asiagroup.app.entity.Message;
import com.asiagroup.app.page.MessagePage;
import com.asiagroup.app.service.AnswerService;
import com.asiagroup.app.service.MessageService;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by AlbertXmas on 2017/2/8.
 */
@Controller
@RequestMapping(value = {"/message"})
public class MessageController {

    @Autowired
    private MessageService messageService;

    @Autowired
    private AnswerService answerService;

    @Autowired
    private SystemCommon systemCommon;

    @RequestMapping(method = RequestMethod.GET)
    public String index(@RequestParam("id")long id, Model model){
        List<Message> messages = messageService.findByPencilId(id);
        MessagePage message = new MessagePage();
//        message.setCreator(getId(SecurityUtils.getSubject().getPrincipal().toString()));
        message.setName(getName(Long.valueOf(SecurityUtils.getSubject().getPrincipal().toString())));

        List<MessagePage> messagepages = new ArrayList<MessagePage>();
        MessagePage tempVo;
//        System.out.println(messages.size()+":messages.size()");
        for(Message a:messages){
//            System.out.println(a);
            tempVo = new MessagePage();
            tempVo.setMessageObj(a);
            tempVo.setName(systemCommon.getUserInfoById(a.getCreator()).getLastname());
            messagepages.add(tempVo);
        }

        model.addAttribute("pencilid",id);
        model.addAttribute("messagePage",message);
        model.addAttribute("messagesList",messagepages);
        return "message";
    }

    @RequestMapping("/save")
    @ResponseBody
    public String save(Message message) throws IOException, CloneNotSupportedException, JpegProcessingException {
        message.setCreator(getId(SecurityUtils.getSubject().getPrincipal().toString()));
        messageService.save(message);
        return "success:true";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String save(@RequestParam("id")long id) throws IOException, CloneNotSupportedException, JpegProcessingException {
        messageService.delete(id);
        return "success:true";
    }

    @RequestMapping("/size")
    @ResponseBody
    public Map getMsgSize(@RequestParam("id")long id){
        long sizeMsg = messageService.countByPencilId(id);
        long sizeAse = answerService.countByPencilId(id);
        Map mp = new HashMap();
        mp.put("success",true);
        mp.put("sizeMsg",sizeMsg);
        mp.put("sizeAse",sizeAse);
        return mp;
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

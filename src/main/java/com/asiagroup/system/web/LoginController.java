package com.asiagroup.system.web;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by AlbertXmas on 2017/2/8.
 */
@Controller
@RequestMapping(value = {"/"})
public class LoginController {

//    @RequestMapping(value = "login", method = RequestMethod.GET)
//    public String getLogin(){
//        return "redirect:/login.jsp";
//    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    @ResponseBody
    public Map login(@RequestParam String username,
                     @RequestParam String password,
                     @RequestParam(defaultValue = "false") boolean rememberMe, Model model){

        Map rtnMap = new HashMap();
        String error = null;

        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        subject.getSession(true);
        try {
            //4、登录，即身份验证
            token.setRememberMe(rememberMe);
            subject.login(token);

            rtnMap.put("success", true);
            rtnMap.put("url","/index.jsp");
        } catch (AuthenticationException e) {
            //5、身份验证失败
            e.printStackTrace();
            error = e.getMessage();
            rtnMap.put("success", false);
            rtnMap.put("url","/login.jsp");
            rtnMap.put("error", error);
        }
        return rtnMap;
    }
}

package com.asiagroup.app.web;

import com.asiagroup.app.entity.Pencil;
import com.asiagroup.app.service.PencilService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by AlbertXmas on 2017/1/13.
 */
@Controller
@RequestMapping(value = {"/home"})
public class HomeController {
    private static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    PencilService pencilService;

    @RequestMapping(method = RequestMethod.GET)
    public String index(){
        return "home";
    }

    @RequestMapping("/queryall")
    @ResponseBody
    public Page<Pencil> queryList(@RequestParam(value = "page", defaultValue = "0") Integer page,
                                  @RequestParam(value = "bt", defaultValue = "") String bt){
        Sort sort = new Sort(Sort.Direction.DESC, "createdate");
        Pageable pageable = new PageRequest(page, 10, sort);
//        return pencilService.findAll(pageable);
        Map qryField = new HashMap();
        if(!bt.equals("")){
            qryField.put("bt",bt);
        }
        return pencilService.findAll(qryField,pageable);
    }
}

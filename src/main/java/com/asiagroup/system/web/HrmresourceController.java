package com.asiagroup.system.web;

import com.asiagroup.system.entity.Hrmresource;
import com.asiagroup.system.service.HrmresourceService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
/**
 * Created by AlbertXmas on 2017/1/13.
 */

@Controller
@RequestMapping(value = {"/hrmr"})
public class HrmresourceController {
    private static final Logger LOGGER = LoggerFactory.getLogger(HrmresourceController.class);

    @Autowired
    private HrmresourceService hrmresourceService;

    @RequestMapping
    @ResponseBody
    public List index(){
        List<Hrmresource> hrmresourceList = hrmresourceService.findByDDC();
        return hrmresourceList;
    }

}

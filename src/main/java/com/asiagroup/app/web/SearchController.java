package com.asiagroup.app.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by AlbertXmas on 2017/1/13.
 */
@Controller
@RequestMapping(value = {"/search"})
public class SearchController {
    private static final Logger LOGGER = LoggerFactory.getLogger(SearchController.class);

    @RequestMapping(method = RequestMethod.GET)
    public String index(){
        return "search";
    }

}

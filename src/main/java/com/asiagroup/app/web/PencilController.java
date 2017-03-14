package com.asiagroup.app.web;

import com.asiagroup.app.entity.Pencil;
import com.asiagroup.app.entity.PencilImg;
import com.asiagroup.app.entity.Touser;
import com.asiagroup.app.page.PencilPage;
import com.asiagroup.app.service.PencilImgService;
import com.asiagroup.app.service.PencilService;
import com.asiagroup.app.service.TouserService;
import com.asiagroup.app.service.impl.PencilServiceImpl;
import com.drew.imaging.jpeg.JpegProcessingException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 * Created by AlbertXmas on 2017/1/13.
 */
@Controller
@RequestMapping(value = {"/pencil"})
public class PencilController {
    private static final Logger LOGGER = LoggerFactory.getLogger(PencilController.class);

    @Autowired
    private PencilService pencilService;

    @Autowired
    private PencilImgService pencilImgService;

    @Autowired
    private TouserService touserService;

    @RequestMapping(method = RequestMethod.GET)
    public String index(){
        return "pencil";
    }

    @RequestMapping("/up")
    public String pencilUpdatePage(@RequestParam("id")long id,Model model){
        indexPage(id, model);
        return "pencil";
    }

    @RequestMapping("/web/up")
    public String pencilUpdatePageWeb(@RequestParam("id")long id,Model model){
        indexPage(id, model);
        return "/web/pencilMain";
    }

    private void indexPage(long id,Model model){
        PencilPage pencilPage = new PencilPage().setPencilPage(pencilService.findOne(id));

        List<PencilImg>  pencilImgs = pencilImgService.findByPencilId(id);
        List<Touser> pencilTousers = touserService.findByPencilId(id);

        model.addAttribute(pencilPage);
        model.addAttribute("pencilImgs",pencilImgs);
        model.addAttribute("pencilTousers",pencilTousers);
    }

    @RequestMapping("/save")
    @ResponseBody
    public String save(PencilPage pencilPage) throws IOException, CloneNotSupportedException, JpegProcessingException {
        System.out.println(pencilPage);
        pencilService.saveAndCallBack(pencilPage);
        return "success:true";
    }

    @RequestMapping("/saveandfile")
    public String save(PencilPage pencilPage, @RequestParam("uploaderInput") MultipartFile[] uploaderInput) throws IOException, CloneNotSupportedException, JpegProcessingException {
        pencilPage.setUpFile(uploaderInput);
        pencilService.save(pencilPage);
        return "pencil";
    }

}

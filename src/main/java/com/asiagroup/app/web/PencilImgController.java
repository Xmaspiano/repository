package com.asiagroup.app.web;

import com.asiagroup.app.entity.Pencil;
import com.asiagroup.app.entity.PencilImg;
import com.asiagroup.app.page.PageImgCache;
import com.asiagroup.app.service.PencilImgService;
import com.asiagroup.util.EHCacheTool;
import com.asiagroup.util.SystemCommon;
import com.asiagroup.util.subscriber.SubscriberManagerImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by AlbertXmas on 2017/2/4.
 */
@Controller
@RequestMapping(value = {"/pencilimg"})
public class PencilImgController {

    @Autowired
    private PencilImgService pencilImgService;

    @Autowired
    private SystemCommon systemCommon;

    @Autowired
    private EHCacheTool ehCacheTool;

    @RequestMapping("/getImg")
    @ResponseBody
    public void getImageHtml(@RequestParam("id")long id, HttpServletResponse response) throws IOException {
        PencilImg pencilimg = pencilImgService.findOne(id);

        response.setContentType("image/jpg");
        OutputStream stream = response.getOutputStream();
        stream.write(pencilimg.getImgdata());
        stream.flush();
        stream.close();
    }

    @RequestMapping("/uploadImgDate")
    @ResponseBody
    public Map uploadImageDate(PageImgCache pImgCache) throws Exception {
//        PageImgCache pImgCache = new PageImgCache();
        String uuid = UUID.randomUUID().toString();

//        EHCacheTool ehCacheTool = new EHCacheTool("imgRetryCache");
//        ehCacheTool.getCacheByName("imgRetryCache");
//        ehCacheTool.addToCache(uuid,imgdata);

//        pImgCache.setImgData(imgdata);
        pImgCache.setUuid(uuid);
        pencilImgService.setCache(pImgCache);

        Map rtnMap = new HashMap();
        rtnMap.put("success",true);
        rtnMap.put("ImageId",uuid);
        return rtnMap;
    }

}

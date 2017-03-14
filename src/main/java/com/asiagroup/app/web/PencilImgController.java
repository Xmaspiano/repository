package com.asiagroup.app.web;

import com.asiagroup.app.entity.PencilImg;
import com.asiagroup.app.page.PageImgCache;
import com.asiagroup.app.service.PencilImgService;
import com.asiagroup.util.EHCacheTool;
import com.asiagroup.util.SystemCommon;
import com.drew.imaging.jpeg.JpegProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Encoder;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
//import org.apache.commons.codec.binary.Base64;

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
        Map rtnMap = new HashMap();
        rtnMap.put("success",true);
        rtnMap.put("ImageId",saveCacheImg(pImgCache));
        return rtnMap;
    }

    @RequestMapping("/uploadImgDateWeb")
    @ResponseBody
    public Map save(@RequestParam("uploaderInput") MultipartFile[] uploaderInput) throws IOException, CloneNotSupportedException, JpegProcessingException {

        PageImgCache pImgCache = new PageImgCache();
        BASE64Encoder base64=new BASE64Encoder();
        pImgCache.setImgdata("data:image/png;base64,"+base64.encode(uploaderInput[0].getBytes()));
        Map rtnMap = new HashMap();
        rtnMap.put("success",true);
        rtnMap.put("ImageId",saveCacheImg(pImgCache));
        return rtnMap;
    }

    private String saveCacheImg(PageImgCache pImgCache){
        String uuid = UUID.randomUUID().toString();

        pImgCache.setUuid(uuid);
        pencilImgService.setCache(pImgCache);
        return uuid;
    }

}

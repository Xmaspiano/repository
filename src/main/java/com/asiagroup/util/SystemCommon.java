package com.asiagroup.util;

import com.asiagroup.system.entity.Hrmresource;
import com.asiagroup.system.service.HrmresourceService;
import com.drew.imaging.jpeg.JpegMetadataReader;
import com.drew.imaging.jpeg.JpegProcessingException;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.Tag;
import com.drew.metadata.exif.ExifIFD0Directory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.*;
import java.util.Collection;
import java.util.Iterator;

/**
 * Created by AlbertXmas on 2017/1/12.
 */
@Component
public class SystemCommon {
    private static final Logger LOGGER = LoggerFactory.getLogger(SystemCommon.class);

    @Autowired
    HrmresourceService hrmresourceService;

    public static synchronized String convertStreamToString(InputStream is) {
        /*
          * To convert the InputStream to String we use the BufferedReader.readLine()
          * method. We iterate until the BufferedReader return null which means
          * there's no more data to read. Each line will appended to a StringBuilder
          * and returned as String.
          */
        BufferedReader reader = new BufferedReader(new InputStreamReader(is));
        StringBuilder sb = new StringBuilder();

        String line = null;
        try {
            while ((line = reader.readLine()) != null) {
                sb.append(line + "\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                is.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return sb.toString();
    }

    public Hrmresource getUserInfo(String LoginId) {
        try {
            LOGGER.info("LoginId:" + LoginId + "by " + this.getClass().getName());
            Hrmresource hrmresource = hrmresourceService.findByUser(LoginId);
//            System.out.println(hrmresource+"\n===========loginid by "+LoginId+"======================");
            if(hrmresource == null){
                hrmresource = new Hrmresource();
            }
            return hrmresource;
        }catch (NullPointerException npe){
            npe.printStackTrace();
            return new Hrmresource();
        }
    }

    public Hrmresource getUserInfoById(long Id) {
        try {
            LOGGER.info("hrmresource.id:"+Id+"by "+this.getClass().getName());
            return hrmresourceService.findOne(Id);
        }catch (NullPointerException npe){
            npe.printStackTrace();
            return new Hrmresource();
        }
    }

    public String getImgRotate(byte[] imagedata) throws JpegProcessingException {
        String _rotate = "0";
        InputStream inputStream = new ByteArrayInputStream(imagedata);

        Metadata metadata = JpegMetadataReader.readMetadata(inputStream);
        Directory exif = metadata.getDirectory(ExifIFD0Directory.class);
        Collection<Tag> tags = exif.getTags();
        Iterator<Tag> iter = tags.iterator();

        String _orientation = exif.getString(ExifIFD0Directory.TAG_ORIENTATION);

        if (_orientation.equals("3")) {
            _rotate = "180";
        } else if (_orientation.equals("6")) {
            _rotate = "90";
        } else if (_orientation.equals("8")) {
            _rotate = "270";
        }

        return _rotate;
    }
}

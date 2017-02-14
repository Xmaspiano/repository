package com.asiagroup.app.page;

import com.asiagroup.app.entity.Pencil;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by AlbertXmas on 2017/1/12.
 */
public class PencilPage extends Pencil {
//    private String touser;

    private MultipartFile[] upFile = new MultipartFile[0];
    private List<String> ImageDataId;
//
//    public String getTouser() {
//        return touser;
//    }
//
//    public void setTouser(String touser) {
//        this.touser = touser;
//    }

    public PencilPage(){
        super();
    }

    public PencilPage setPencilPage(Pencil pencil){
        this.setId(pencil.getId());
        this.setBt(pencil.getBt());
        this.setJjcd(pencil.getJjcd());
        this.setWtlb(pencil.getWtlb());
        this.setWtms(pencil.getWtms());
        this.setTouser(pencil.getTouser());
        return this;
    }


    public MultipartFile[] getUpFile() {
        return upFile;
    }

    public void setUpFile(MultipartFile[] upFile) {
        this.upFile = upFile;
    }

    public List<String> getImageDataId() {
        return ImageDataId;
    }

    public void setImageDataId(List<String> imageDataId) {
        ImageDataId = imageDataId;
    }

    /* 后续更新为公用程序,通过反射获取 */
    public Pencil getPencil() throws CloneNotSupportedException {
        Pencil pencil = new Pencil();
        pencil.setId(this.getId());
        pencil.setBt(this.getBt());
        pencil.setJjcd(this.getJjcd());
        pencil.setWtlb(this.getWtlb());
        pencil.setWtms(this.getWtms());
        pencil.setTouser(this.getTouser());
        return pencil;
    }
}

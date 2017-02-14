package com.asiagroup.app.entity;

import com.asiagroup.system.entity.common.EntityBase;
import com.asiagroup.system.entity.common.IdEntity;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;

/**
 * Created by AlbertXmas on 2017/1/13.
 */
@Entity
@Table(name = "pencil")
@SequenceGenerator(name = "SEQ_PENCIL", sequenceName = "SEQ_PENCIL",allocationSize = 1)
public class Pencil extends EntityBase implements Comparable {
    private int jjcd;
    private String bt;
    private int wtlb;
    private String wtms;
    private String touser;
    private String createdate;

    private Long id;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "SEQ_PENCIL")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
//    private long uploadFilesId;

    public int getJjcd() {
        return jjcd;
    }

    public void setJjcd(int jjcd) {
        this.jjcd = jjcd;
    }

    public String getBt() {
        return bt;
    }

    public void setBt(String bt) {
        this.bt = bt;
    }

    public int getWtlb() {
        return wtlb;
    }

    public void setWtlb(int wtlb) {
        this.wtlb = wtlb;
    }

    public String getWtms() {
        return wtms;
    }

    public void setWtms(String wtms) {
        this.wtms = wtms;
    }

    public String getTouser() {
        return touser;
    }

    public void setTouser(String touser) {
        this.touser = touser;
    }

    @Column(insertable = false, updatable = false)
    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    //    public long getUploadFilesId() {
//        return uploadFilesId;
//    }
//
//    public void setUploadFilesId(long uploadFilesId) {
//        this.uploadFilesId = uploadFilesId;
//    }
//
//    @Transient
//    public MultipartFile[] getUploaderInput() {
//        return uploaderInput;
//    }
//
//    public void setUploaderInput(MultipartFile[] uploaderInput) {
//        this.uploaderInput = uploaderInput;
//    }

    @Override
    public int compareTo(Object obj)
    {

        if(obj instanceof Pencil){
        Pencil pencil = (Pencil)obj;

        String createdate = pencil.getCreatedate();
        // note: enum-type's comparation depend on types' list order of enum method
        // so, if compared property is enum-type ,then its comparationfollow ObjEnum.objType order
            return this.createdate.compareTo(createdate);
        }else{
            return 0;
        }
    }
}

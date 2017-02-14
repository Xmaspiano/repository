package com.asiagroup.app.entity;

import javax.persistence.*;
import javax.swing.text.StringContent;

import oracle.sql.BLOB;

/**
 * Created by AlbertXmas on 2017/1/13.
 */
@Entity
@Table(name = "pencilimg")
@SequenceGenerator(name = "SEQ_PENCILIMG", sequenceName = "SEQ_PENCILIMG",allocationSize = 1)
public class PencilImg {
    private Long id;
//    private BLOB imgdata;
    private byte[] imgdata;
    private String rotate;
    private Long pencilid;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "SEQ_PENCILIMG")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

//    public BLOB getImgdata() {
//        return imgdata;
//    }
//
//    public void setImgdata(BLOB imgdata) {
//        this.imgdata = imgdata;
//    }

    @Lob
    @Basic(fetch = FetchType.LAZY)
//    @Column(name=" imgdata", columnDefinition="BLOB", nullable=true)
    @Column(columnDefinition = "mediumtext")
    public byte[] getImgdata() {
        return imgdata;
    }

    public void setImgdata(byte[] imgdata) {
        this.imgdata = imgdata;
    }

    public String getRotate() {
        return rotate;
    }

    public void setRotate(String rotate) {
        this.rotate = rotate;
    }

    public Long getPencilid() {
        return pencilid;
    }

    public void setPencilid(Long pencilid) {
        this.pencilid = pencilid;
    }

    @Transient
    public String getStrImgdata() {
        return new String(this.imgdata);
    }
}

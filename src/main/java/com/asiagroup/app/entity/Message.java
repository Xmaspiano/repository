package com.asiagroup.app.entity;

import com.asiagroup.system.entity.common.EntityBase;

import javax.persistence.*;

/**
 * Created by AlbertXmas on 2017/2/8.
 */
@Entity
@Table(name = "message")
@SequenceGenerator(name = "SEQ_MESSAGE", sequenceName = "SEQ_MESSAGE",allocationSize = 1)
public class Message extends EntityBase {
    private String message;
    private Long pencilid;
    private long creator;
    private String createdate;
    private Long id;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "SEQ_MESSAGE")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public long getCreator() {
        return creator;
    }

    public void setCreator(long creator) {
        this.creator = creator;
    }

    @Column(insertable = false, updatable = false)
    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public Long getPencilid() {
        return pencilid;
    }

    public void setPencilid(Long pencilid) {
        this.pencilid = pencilid;
    }
}


package com.asiagroup.app.entity;

import com.asiagroup.system.entity.common.EntityBase;

import javax.persistence.*;

/**
 * Created by AlbertXmas on 2017/1/13.
 */
@Entity
@Table(name = "touser")
@SequenceGenerator(name = "SEQ_TOUSER", sequenceName = "SEQ_TOUSER",allocationSize = 1)
public class Touser extends EntityBase {
    private Long touser;
    private Long pencilid;
    private String lastname;
    private Long id;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "SEQ_TOUSER")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getTouser() {
        return touser;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public void setTouser(Long touser) {
        this.touser = touser;
    }

    public Long getPencilid() {
        return pencilid;
    }

    public void setPencilid(Long pencilid) {
        this.pencilid = pencilid;
    }
}

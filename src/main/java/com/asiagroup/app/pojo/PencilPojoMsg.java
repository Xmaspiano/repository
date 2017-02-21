package com.asiagroup.app.pojo;

import com.asiagroup.app.entity.Pencil;

/**
 * Created by AlbertXmas on 2017/2/20.
 * call by PencilServiceImpl.saveAndCallBack to send message
 */
public class PencilPojoMsg {
    private Pencil pencil;
    private String[] touser_db;
    private String[] touser_save;

    public Pencil getPencil() {
        return pencil;
    }

    public void setPencil(Pencil pencil) {
        this.pencil = pencil;
    }

    public String[] getTouser_db() {
        return touser_db;
    }

    public void setTouser_db(String[] touser_db) {
        this.touser_db = touser_db;
    }

    public String[] getTouser_save() {
        return touser_save;
    }

    public void setTouser_save(String[] touser_save) {
        this.touser_save = touser_save;
    }
}

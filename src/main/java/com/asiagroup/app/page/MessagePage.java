package com.asiagroup.app.page;

import com.asiagroup.app.entity.Message;

/**
 * Created by AlbertXmas on 2017/2/8.
 */
public class MessagePage extends Message {

    String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setMessageObj(Message Message){
        this.setId(Message.getId());
        this.setPencilid(Message.getPencilid());
        this.setMessage(Message.getMessage());
        this.setCreator(Message.getCreator());
        this.setCreatedate(Message.getCreatedate());
    }

}

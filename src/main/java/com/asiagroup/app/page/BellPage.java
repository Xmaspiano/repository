package com.asiagroup.app.page;

import com.asiagroup.app.entity.Pencil;

/**
 * Created by AlbertXmas on 2017/2/11.
 */
public class BellPage extends Pencil {
    boolean answer = false;

    public BellPage(Pencil pencil){
        this.setId(pencil.getId());
        this.setJjcd(pencil.getJjcd());
        this.setBt(pencil.getBt());
        this.setWtlb(pencil.getWtlb());
        this.setWtms(pencil.getWtms());
        this.setTouser(pencil.getTouser());
        this.setCreatedate(pencil.getCreatedate());
    }

    public boolean isAnswer() {
        return answer;
    }

    public void setAnswer(boolean answer) {
        this.answer = answer;
    }
}

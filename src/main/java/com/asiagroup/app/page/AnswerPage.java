package com.asiagroup.app.page;

import com.asiagroup.app.entity.Answer;
import org.apache.shiro.SecurityUtils;

/**
 * Created by AlbertXmas on 2017/2/8.
 */
public class AnswerPage extends Answer {

    String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAnswerObj(Answer answer){
        this.setId(answer.getId());
        this.setPencilid(answer.getPencilid());
        this.setAnswer(answer.getAnswer());
        this.setCreator(answer.getCreator());
        this.setCreatedate(answer.getCreatedate());
    }
}

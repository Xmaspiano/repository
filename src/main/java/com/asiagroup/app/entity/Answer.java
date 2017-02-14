package com.asiagroup.app.entity;

import com.asiagroup.system.entity.common.EntityBase;

import javax.persistence.*;

/**
 * Created by AlbertXmas on 2017/2/7.
 */
@Entity
@Table(name = "answer")
@SequenceGenerator(name = "SEQ_ANSWER", sequenceName = "SEQ_ANSWER",allocationSize = 1)
public class Answer extends EntityBase {
    private String answer;
    private Long pencilid;
    private long creator;
    private String createdate;
    private Long id;


    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "SEQ_ANSWER")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
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

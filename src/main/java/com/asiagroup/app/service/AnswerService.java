package com.asiagroup.app.service;

import com.asiagroup.app.entity.Answer;
import com.asiagroup.system.service.CommonService;

import java.util.List;

/**
 * Created by AlbertXmas on 2017/2/7.
 */
public interface AnswerService extends CommonService<Answer> {
    public List<Answer> findByPencilId(long id);

    public Long countByPencilId(long id);

    public Answer findByCreatorAndPencilid(long creator, long Pencilid);
}

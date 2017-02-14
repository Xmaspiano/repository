package com.asiagroup.app.service.impl;

import com.asiagroup.app.entity.Answer;
import com.asiagroup.app.repository.AnswerRepository;
import com.asiagroup.app.service.AnswerService;
import com.asiagroup.system.service.impl.CommonServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by AlbertXmas on 2017/2/7.
 */
@Service
@Transactional
public class AnswerServiceImpl
        extends CommonServiceImpl<Answer, AnswerRepository>
        implements AnswerService {

    public List<Answer> findByPencilId(long id){
        return getRepository().findByPencilid(id);
    }

    @Override
    public Long countByPencilId(long id) {
        return getRepository().countByPencilid(id);
    }

    public Answer findByCreatorAndPencilid(long creator, long Pencilid){
        return getRepository().findByCreatorAndPencilid(creator, Pencilid);
    }

}

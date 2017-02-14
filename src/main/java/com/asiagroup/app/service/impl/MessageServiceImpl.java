package com.asiagroup.app.service.impl;

import com.asiagroup.app.entity.Message;
import com.asiagroup.app.repository.MessageRepository;
import com.asiagroup.app.service.MessageService;
import com.asiagroup.system.service.impl.CommonServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by AlbertXmas on 2017/2/8.
 */
@Service
@Transactional
public class MessageServiceImpl
        extends CommonServiceImpl<Message, MessageRepository>
        implements MessageService {

    public List<Message> findByPencilId(long id){
        return getRepository().findByPencilid(id);
    }

    @Override
    public Long countByPencilId(long id) {
        return getRepository().countByPencilid(id);
    }
}

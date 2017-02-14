package com.asiagroup.app.service;

import com.asiagroup.app.entity.Message;
import com.asiagroup.system.service.CommonService;

import java.util.List;

/**
 * Created by AlbertXmas on 2017/2/8.
 */
public interface MessageService extends CommonService<Message> {
    public List<Message> findByPencilId(long id);

    public Long countByPencilId(long id);
}

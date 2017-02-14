package com.asiagroup.app.repository;

import com.asiagroup.app.entity.Message;
import com.asiagroup.system.repository.CommonRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by AlbertXmas on 2017/2/8.
 */
public interface MessageRepository extends CommonRepository<Message, MessageRepository> {
    public List<Message> findByPencilid(long pencilid);

    public Long countByPencilid(long pencilid);
}

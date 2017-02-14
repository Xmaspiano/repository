package com.asiagroup.app.repository;

import com.asiagroup.app.entity.Answer;
import com.asiagroup.system.repository.CommonRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by AlbertXmas on 2017/2/7.
 */
public interface AnswerRepository extends CommonRepository<Answer, AnswerRepository> {
    public List<Answer> findByPencilid(long pencilid);

    public Long countByPencilid(long pencilid);

    public Answer findByCreatorAndPencilid(long creator, long Pencilid);

}

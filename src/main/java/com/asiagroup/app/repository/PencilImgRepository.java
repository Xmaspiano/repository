package com.asiagroup.app.repository;

import com.asiagroup.app.entity.PencilImg;
import com.asiagroup.system.repository.CommonRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by AlbertXmas on 2017/1/13.
 */
public interface PencilImgRepository extends CommonRepository<PencilImg, PencilImgRepository> {

    public List<PencilImg> findByPencilid(long pencilid);
}

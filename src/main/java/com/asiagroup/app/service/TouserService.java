package com.asiagroup.app.service;

import com.asiagroup.app.entity.Pencil;
import com.asiagroup.app.entity.Touser;
import com.asiagroup.system.service.CommonService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Created by AlbertXmas on 2017/1/13.
 */
public interface TouserService extends CommonService<Touser> {

    public List<Touser> findByPencilId(long id);

    public Long countByTouser(long touser);

//    public List<Pencil> findByTouser(long touser);

//    public Page<Pencil> findByTouser(long touser, Pageable pageable);
}

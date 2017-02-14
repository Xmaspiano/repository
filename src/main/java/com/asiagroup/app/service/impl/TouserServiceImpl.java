package com.asiagroup.app.service.impl;

import com.asiagroup.app.entity.Answer;
import com.asiagroup.app.entity.Pencil;
import com.asiagroup.app.entity.Touser;
import com.asiagroup.app.repository.TouserRepository;
import com.asiagroup.app.service.PencilService;
import com.asiagroup.app.service.TouserService;
import com.asiagroup.system.service.impl.CommonServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by AlbertXmas on 2017/1/13.
 */
@Service
@Transactional
public class TouserServiceImpl
        extends CommonServiceImpl<Touser, TouserRepository>
        implements TouserService {

    @Autowired
    private PencilService pencilService;

    @Override
    public List<Touser> findByPencilId(long id) {
        return getRepository().findByPencilid(id);
    }

    @Override
    public Long countByTouser(long touser) {
        return getRepository().countByTouser(touser);
    }

//    @Override
//    public Page<Pencil> findByTouser(long touser, Pageable pageable) {
//        List<Touser> touserList = getRepository().findByTouser(touser);
//
//        List<Long> ids = new ArrayList<>();
//        for(Touser t:touserList){
////            pencils.add(pencilService.findOne(t.getPencilid()));
//            ids.add(t.getPencilid());
//        }
//
//        if(ids.size() > 0) {
//            return pencilService.findAll(ids, pageable);
//        }else{
//            return null;
//        }
//    }


}

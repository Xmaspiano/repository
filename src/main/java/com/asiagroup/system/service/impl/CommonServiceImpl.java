package com.asiagroup.system.service.impl;


import com.asiagroup.app.entity.Pencil;
import com.asiagroup.system.repository.CommonRepository;
import com.asiagroup.system.service.CommonService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
/**
 * Created by AlbertXmas on 2017/1/13.
 */

public abstract class CommonServiceImpl<E, R extends CrudRepository> implements CommonService<E> {
    protected Logger logger = LoggerFactory.getLogger(this.getClass().getName());

    @Autowired
    private CommonRepository<E,R> commonRepository;

    @Override
    public E findOne(Long id) {
        return commonRepository.findOne(id);
    }

    @Override
    public List<E> findAll() {
        return (List<E>)commonRepository.findAll();
    }

//    @Override
//    public Page<E> findAll(Pageable pageable){
//        return commonRepository.findAll(pageable);
//    }

    @Override
    public Page<E> findAll(Specification<E> spec, Pageable pageable) {
        return commonRepository.findAll(spec, pageable);
    }

    @Override
    public E save(E e){
        return commonRepository.save(e);
    }

    @Override
    public Iterable<E> save(Iterable<E> entities){
        return commonRepository.save(entities);
    }

    @Override
    public void delete(Long id) {
        commonRepository.delete(commonRepository.findOne(id));
    }

    public R getRepository() {
        return (R) commonRepository;
    }

}

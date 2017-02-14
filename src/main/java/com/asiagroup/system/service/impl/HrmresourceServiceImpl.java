package com.asiagroup.system.service.impl;

import com.asiagroup.system.entity.Hrmresource;
import com.asiagroup.system.repository.HrmresourceRepository;
import com.asiagroup.system.service.HrmresourceService;
import org.hibernate.annotations.Cache;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
/**
 * Created by AlbertXmas on 2017/1/13.
 */

@Service
public class HrmresourceServiceImpl
        extends CommonServiceImpl<Hrmresource, HrmresourceRepository>
        implements HrmresourceService {
    private static final Logger LOGGER = LoggerFactory.getLogger(HrmresourceServiceImpl.class);

    @Override
    @CachePut(value = "hrmresourceRetryCache", key = "#id")//数据放入缓存
    public Hrmresource findOne(Long id) {
        return getRepository().findOne(id);
    }

    @Override
    @CachePut(value = "hrmresourceRetryCache", key = "#loginid")//数据放入缓存
    public Hrmresource findByUser(String loginid) {
        return getRepository().findByLoginid(loginid);
    }

    @Cacheable(value = "hrmresourceRetryCache")//数据放入缓存
    public List<Hrmresource> findByDDC(){
        return getRepository().findByDDC();
    }
}
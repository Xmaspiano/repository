package com.asiagroup.app.service.impl;

import com.asiagroup.app.entity.PencilImg;
import com.asiagroup.app.page.PageImgCache;
import com.asiagroup.app.repository.PencilImgRepository;
import com.asiagroup.app.service.PencilImgService;
import com.asiagroup.system.service.impl.CommonServiceImpl;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by AlbertXmas on 2017/1/12.
 */
@Service
@Transactional
public class PencilImgServiceImpl
        extends CommonServiceImpl<PencilImg, PencilImgRepository>
            implements PencilImgService  {

    @Override
    public List<PencilImg> findByPencilId(long id) {
        return getRepository().findByPencilid(id);
    }

    @Cacheable(value = "imgRetryCache", key = "#pageImgCache.uuid")//数据放入缓存
    public PageImgCache setCache(PageImgCache pageImgCache){
//        System.out.println(pageImgCache.getImgdata());
        return pageImgCache;
    }

    @Cacheable(value = "imgRetryCache", key = "#uuid")//读取缓存
    public PageImgCache getCache(String uuid){
//        System.out.println("uuid:"+uuid);
        return new PageImgCache();
    }
}

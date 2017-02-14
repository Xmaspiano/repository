package com.asiagroup.app.service;


import com.asiagroup.app.entity.PencilImg;
import com.asiagroup.app.page.PageImgCache;
import com.asiagroup.system.service.CommonService;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;

/**
 * Created by AlbertXmas on 2017/1/13.
 */
public interface PencilImgService extends CommonService<PencilImg> {

    public List<PencilImg> findByPencilId(long id);

    public PageImgCache setCache(PageImgCache pageImgCache);

    public PageImgCache getCache(String uuid);
}

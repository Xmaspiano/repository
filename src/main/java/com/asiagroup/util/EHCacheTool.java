package com.asiagroup.util;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.ehcache.EhCacheFactoryBean;
import org.springframework.stereotype.Component;

/**
 * Created by AlbertXmas on 2017/2/6.
 */
@Component
public class EHCacheTool {
    private static final CacheManager cacheManager = new CacheManager();

//    @Autowired
//    private EhCacheFactoryBean imgRetryCache;

    private Cache cache;

    public EHCacheTool(){
        this.cache=cacheManager.getCache("commonRetryCache");
    }

//    public EHCacheTool(String cacheName){
//        this.cache=springCacheManager.getCache(cacheName);
//    }

    public Cache getCache() {
        return cache;
    }

    public void setCache(Cache cache) {
        this.cache = cache;
    }

    public void getCacheByName(String cacheName) {
        this.cache=cacheManager.getCache(cacheName);
    }



    /*
     * 通过名称从缓存中获取数据
     */
    public Object getCacheElement(String cacheKey) throws Exception {
        net.sf.ehcache.Element e = cache.get(cacheKey);
        if (e == null) {
            return null;
        }
        return e.getValue();
    }
    /*
     * 将对象添加到缓存中
     */
    public void addToCache(String cacheKey, Object result) throws Exception {
        Element element = new Element(cacheKey, result);
        cache.put(element);
    }
}

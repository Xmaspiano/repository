package com.asiagroup.system.service;


import com.asiagroup.system.entity.Hrmresource;

import java.util.List;
/**
 * Created by AlbertXmas on 2017/1/13.
 */

public interface HrmresourceService extends CommonService<Hrmresource> {
    public Hrmresource findByUser(String loginid);

    public List<Hrmresource> findByDDC();
}

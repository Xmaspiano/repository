package com.asiagroup.app.service;


import com.asiagroup.app.entity.Pencil;
import com.asiagroup.app.page.BellPage;
import com.asiagroup.app.page.PencilPage;
import com.asiagroup.system.service.CommonService;
import com.drew.imaging.jpeg.JpegProcessingException;
import com.drew.metadata.MetadataException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by AlbertXmas on 2017/1/13.
 */
public interface PencilService extends CommonService<Pencil> {

    public Pencil saveAndCallBack(PencilPage pencilPage) throws CloneNotSupportedException, IOException, JpegProcessingException;

//    public Page<Pencil> findAllByTouserId(Long touserid,Pageable pageable);

//    public Page<BellPage> findAllByTouserId(Long touserid, Pageable pageable);

    public Page<Pencil> findAllByTouserId(Long touserid, Map mp, Pageable pageable);

    public Page<Pencil> findAll(Map mp, Pageable pageable);
}

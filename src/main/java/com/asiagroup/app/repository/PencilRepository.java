package com.asiagroup.app.repository;

import com.asiagroup.app.entity.Pencil;
import com.asiagroup.system.entity.Hrmresource;
import com.asiagroup.system.repository.CommonRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by AlbertXmas on 2017/1/13.
 */
public interface PencilRepository extends CommonRepository<Pencil, PencilRepository> {

//    Page<Pencil> findBy(Pageable pageable);

//    @Query( value = "select * From Pencil where id in (select distinct pencilid from Touser where touser = ?1 ) order by createdate desc",
//            countQuery = "select count(*) From Pencil where id in (select distinct pencilid from Touser where touser = ?1 )",
//            nativeQuery = true
//    )
    @Query(value = "select p.* From Pencil p where p.id in (select distinct pencilid from Touser where touser = ?1 )  /* #pageable# */",
            countQuery = "select count(*) From Pencil p where p.id in (select distinct pencilid from Touser where touser = ?1 )",
            nativeQuery = true)
    public Page<Pencil> getPencilByTouserId(Long touserid, Pageable pageable);

}
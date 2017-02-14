package com.asiagroup.app.repository;


import com.asiagroup.app.entity.Touser;
import com.asiagroup.system.repository.CommonRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by AlbertXmas on 2017/1/13.
 */
public interface TouserRepository extends CommonRepository<Touser, TouserRepository> {

    public List<Touser> findByPencilid(long pencilid);

    @Query(value = "select count(*) from TOUSER  where pencilid not in (select pencilid from answer where creator =  ?1) and touser = ?1 ",
            nativeQuery = true)
    public Long countByTouser(long touser);

    public List<Touser> findByTouser(long touser);
}

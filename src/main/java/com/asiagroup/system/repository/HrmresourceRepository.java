package com.asiagroup.system.repository;

import com.asiagroup.system.entity.Hrmresource;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by AlbertXmas on 2017/1/13.
 */
public interface HrmresourceRepository extends JpaRepository<Hrmresource,Long>,CommonRepository<Hrmresource, HrmresourceRepository> {

    public Hrmresource findByLoginid(String loginid);

    @Query(nativeQuery = true, value = "select a.* from hrmresource a where a.departmentid in (select b.id from hrmdepartment b where b.id = '2305' or b.supdepid = '2305') and a.loginid is not null order by lastname")
    public List<Hrmresource> findByDDC();
}

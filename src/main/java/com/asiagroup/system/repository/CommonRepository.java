package com.asiagroup.system.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.NoRepositoryBean;

import java.io.Serializable;

/**
 * Created by AlbertXmas on 2017/1/13.
 */
/***
 *
 * @param <R> repository
 */
@NoRepositoryBean
public interface CommonRepository<E, R extends CrudRepository> extends JpaRepository<E, Long>,JpaSpecificationExecutor<E> {

}

package com.asiagroup.util.persistence;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.hibernate5.Hibernate5Module;
/**
 * Created by AlbertXmas on 2017/1/13.
 */
public class HibernateAwareObjectMapper extends ObjectMapper{
    public HibernateAwareObjectMapper() {
        registerModule(new Hibernate5Module());
    }
}

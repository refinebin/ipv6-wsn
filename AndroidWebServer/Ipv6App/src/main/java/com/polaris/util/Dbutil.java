package com.polaris.util;


import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;

public class Dbutil {

    public static SqlSessionFactory sqlSessionFactory = null;
    public SqlSession getSqlsession() throws IOException {
        if (sqlSessionFactory==null){
            Reader reader = null;
            reader= Resources.getResourceAsReader("mybatis.cfg.xml");
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
        }
        return sqlSessionFactory.openSession();
    }
}


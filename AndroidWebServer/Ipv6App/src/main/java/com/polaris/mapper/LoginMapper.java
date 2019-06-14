package com.polaris.mapper;

import org.apache.ibatis.annotations.Param;

public interface LoginMapper {
    String checkPassword(@Param("username") String username);
}

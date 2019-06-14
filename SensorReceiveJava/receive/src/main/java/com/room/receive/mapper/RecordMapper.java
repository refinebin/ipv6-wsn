package com.room.receive.mapper;

import com.room.receive.entity.Record;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * Created by 10238 on 2018/3/8.
 * @author liangjh
 */
@Repository
public interface RecordMapper extends Mapper<Record> {

    int insertRecord(@Param("record") Record record);

}

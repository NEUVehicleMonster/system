package dao;

import domain.CowOxtall;
import domain.Oxtall;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

public interface ICowOxtallDao {

    @Select("select * from oxtall_cow where cow_id=#{id}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "cow_id", column = "cow_id"),
            @Result(property = "oxtall_id", column = "oxtall_id"),
            @Result(property = "oxtall",column = "oxtall_id",javaType = domain.Oxtall.class,one = @One(select = "dao.IOxtallDao.findById"))
    })
    CowOxtall findByCowId(int id);
}

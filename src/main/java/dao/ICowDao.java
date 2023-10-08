package dao;

import domain.Cow;
import domain.Feed;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface ICowDao {

    @Select("select * from cow order by id asc")
    List<Cow> findAll();

    @Insert("insert into cow(weight,var,age,yield,period,grade,node) values(#{weight},#{var},#{age},#{yield},#{period},#{grade},#{node})")
    void save(Cow cow);

    @Select("select * from cow where id=#{id} order by id asc")
    Cow findById(Integer id);

    @Delete("DELETE FROM cow WHERE id=#{id}")
    void dropById(int id);

    @Update("UPDATE cow SET node=#{node},weight=#{weight},var=#{var},age=#{age},yield=#{yield},period=#{period},grade=#{grade} WHERE id=#{id}")
    void updateById(Cow cow);

    @Insert("insert into oxtall_cow(cow_id,oxtall_id) values(#{arg1},#{arg0})")
    void boundCowAndOxtall(int oxtall_id, int cow_id);
}

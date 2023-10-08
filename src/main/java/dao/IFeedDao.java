package dao;

import domain.Feed;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IFeedDao {

    @Select("select * from feed order by id asc")
    List<Feed> findAll();

    @Insert("insert into feed(cow_id,oxtall_id,fodder_id,uselevel,username,timelog) values(#{cow_id},#{oxtall_id},#{fodder_id},#{uselevel},#{username},#{timelog})")
    void save(Feed feed);


    @Select("select * from feed where id=#{id} order by id asc")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "cow_id", column = "cow_id"),
            @Result(property = "oxtall_id", column = "oxtall_id"),
            @Result(property = "fodder_id", column = "fodder_id"),
            @Result(property = "uselevel", column = "uselevel"),
            @Result(property = "username", column = "username"),
            @Result(property = "timelog", column = "timelog"),
            @Result(property = "fodder",column = "fodder_id",javaType = domain.Fodder.class,one = @One(select = "dao.IFodderDao.findById"))
    })
    Feed findById(Integer id);

    @Delete("DELETE FROM feed WHERE id=#{id}")
    void dropById(int id);

    @Update("UPDATE feed SET node=#{node},name=#{name},info=#{info},total=#{total} WHERE id=#{id}")
    void updateById(Feed feed);
}

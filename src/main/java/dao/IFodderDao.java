package dao;

import domain.Fodder;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface IFodderDao {

    @Select("select * from fodder order by id asc")
    List<Fodder> findAll();

    @Insert("insert into fodder(node,name,info,total) values(#{node},#{name},#{info},#{total})")
    void save(Fodder fodder);

    @Select("select * from fodder where id=#{id} order by id asc")
    Fodder findById(Integer id);

    @Delete("DELETE FROM fodder WHERE id=#{id}")
    void dropById(int id);

    @Update("UPDATE fodder SET node=#{node},name=#{name},info=#{info},total=#{total} WHERE id=#{id}")
    void updateById(Fodder fodder);
}

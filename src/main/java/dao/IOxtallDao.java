package dao;

import domain.Oxtall;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface IOxtallDao {

    @Select("select * from oxtall order by id asc")
    List<Oxtall> findAll();

    @Insert("insert into oxtall(area,temperature,humid,capa,node) values(#{area},#{temperature},#{humid},#{capa},#{node})")
    void save(Oxtall oxtall);

    @Select("select * from oxtall where id=#{id} ")
    Oxtall findById(Integer id);

    @Delete("DELETE FROM oxtall WHERE id=#{id}")
    void dropById(int id);

    @Update("UPDATE oxtall SET area=#{area},temperature=#{temperature},humid=#{humid},capa=#{capa},node=#{node} WHERE id=#{id}")
    void updateById(Oxtall oxtall);

    @Select("select * from oxtall where id=#{id} ")
    Oxtall findByCowId(int id);
}

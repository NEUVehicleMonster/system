package dao;

import domain.Role;
import domain.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;


public interface IUserDao {
    @Select("select * from users where id=#{id}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "username", column = "username"),
            @Result(property = "email", column = "email"),
            @Result(property = "password", column = "password"),
            @Result(property = "phoneNum", column = "phoneNum"),
            @Result(property = "status", column = "status"),
            @Result(property = "roles",column = "id",javaType = java.util.List.class,many = @Many(select = "dao.IRoleDao.findRoleByUserId"))
    })
    public UserInfo findById(int id) throws Exception;



    @Select("select * from users where username=#{username}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "username", property = "username"),
            @Result(column = "email", property = "email"),
            @Result(column = "password", property = "password"),
            @Result(column = "phoneNum", property = "phoneNum"),
            @Result(column = "status", property = "status"),
            @Result(column = "id", property = "roles", javaType = java.util.List.class, many =@Many(select = "dao.IRoleDao.findRoleByUserId")) })
    public UserInfo findByUserName(String username);


    @Select("select * from users")
    List<UserInfo> findAll();


    @Insert("insert into users(email,username,password,phoneNum,status) values(#{email},#{username},#{password},#{phoneNum},#{status})")
    void save(UserInfo userInfo);



    @Select("select * from role where id not in (select roleId from users_role where userId=#{userId})")
    List<Role> findOtherRoles(int userId);



    @Insert("insert into users_role(roleId,userId) values(#{arg0},#{arg1})")
    void addRoleToUser(int user_roleId, int userId);


    @Update("UPDATE users SET STATUS=0 WHERE id=#{id}")
    void updateStatuToZeroById(int id);

    @Update("UPDATE users SET STATUS=1 WHERE id=#{id}")
    void updateStatuToOneById(int id);
}

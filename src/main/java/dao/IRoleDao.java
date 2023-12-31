package dao;

import domain.Permission;
import domain.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IRoleDao {


    //根据用户id查询出所有对应的角色
    @Select("select * from role where id in (select roleId from users_role where userId=#{userId})")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "roleName", column = "roleName"),
            @Result(property = "roleDesc", column = "roleDesc"),
            @Result(property = "permissions",column = "id",javaType = java.util.List.class,many = @Many(select = "dao.IPermissionDao.findPermissionByRoleId"))
    })
    public List<Role> findRoleByUserId(String userId) throws Exception;

    @Select("select * from role")
    List<Role> findAll() throws Exception;

    @Insert("insert into role(roleName,roleDesc) values(#{roleName},#{roleDesc})")
    void save(Role role);


    @Select("select * from role where id=#{roleId}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "roleName", column = "roleName"),
            @Result(property = "roleDesc", column = "roleDesc"),
            @Result(property = "permissions",column = "id",javaType = java.util.List.class,many = @Many(select = "dao.IPermissionDao.findPermissionByRoleId"))
    })
    Role findById(int roleId);


    @Select("select * from permission where id not in (select permissionId from role_permission where roleId=#{roleId})")
    List<Permission> findOtherPermission(int roleId);


    @Insert("insert into role_permission(permissionId,roleId) values(#{arg0},#{arg1})")
    void addRoleToUser(int permissionId, int roleId);


    @Select("select * from role where id in (select roleId from role_permission where permissionId=#{id} )")
    List<Role> findRoleByPermissionId(int id) throws Exception;
}

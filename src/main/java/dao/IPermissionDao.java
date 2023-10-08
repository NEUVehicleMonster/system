package dao;

import domain.Permission;
import domain.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IPermissionDao {
    @Select("select * from permission where id in (select permissionId from role_permission where roleId=#{id} )")
    public List<Permission> findPermissionByRoleId(int id) throws Exception;

    @Select("select * from permission")
    List<Permission> findAll() throws Exception ;

    @Insert("insert into permission(permissionName,url) values(#{permissionName},#{url})")
    void save(Permission permission) throws Exception;

    @Select("select * from permission where id=#{permissionId}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "permissionName", column = "permissionName"),
            @Result(property = "url", column = "url"),
            @Result(property = "roles",column = "id",javaType = java.util.List.class,many = @Many(select = "dao.IRoleDao.findRoleByPermissionId"))
    })
    Permission findById(int permissionId) throws Exception;



}

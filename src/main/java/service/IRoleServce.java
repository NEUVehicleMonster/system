package service;

import domain.Permission;
import domain.Role;

import java.util.List;

public interface IRoleServce {


    List<Role> findAll() throws Exception;

    Role findById(int roleId) throws Exception;

    List<Permission> findOtherPermission(int roleId);

    void addPermissionToRole(int[] permissionIds, int roleId)throws Exception;

    void save(Role role)throws Exception;
}

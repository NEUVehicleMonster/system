package service.impl;

import dao.IRoleDao;
import domain.Permission;
import domain.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.IRoleServce;

import java.util.List;

@Service
@Transactional
public class RoleServiceImpl implements IRoleServce {

    @Autowired
    private IRoleDao roleDao;

    @Override
    public List<Role> findAll() throws Exception{
        return roleDao.findAll();
    }

    @Override
    public Role findById(int roleId) throws Exception {
        return roleDao.findById(roleId);
    }

    @Override
    public List<Permission> findOtherPermission(int roleId) {
        return roleDao.findOtherPermission(roleId);
    }

    @Override
    public void addPermissionToRole(int[] permissionIds, int roleId) throws Exception {
        for (int permissionId:permissionIds) {
            System.out.println(permissionId);
            roleDao.addRoleToUser(permissionId,roleId);

        }
    }

    @Override
    public void save(Role role) throws Exception {
        roleDao.save(role);
    }
}

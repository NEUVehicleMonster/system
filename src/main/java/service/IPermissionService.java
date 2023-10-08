package service;


import domain.Permission;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


public interface IPermissionService {

    List<Permission> findAll()throws Exception;

    void save(Permission permission)throws Exception;

    Permission findById(int permissionId)throws Exception;
}

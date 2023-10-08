package service;

import domain.Role;
import domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;


public interface IUserService  extends UserDetailsService {


    List<UserInfo> findAll(int page,int size) throws Exception;

    UserInfo findById(int userId) throws Exception;

    void save(UserInfo userInfo);

    List<Role> findOtherRole(int userId)throws Exception;

    void addRoleToUser(int[] roleIds, int userId) throws Exception;

    void dropByIds(Integer[] ids);

    void enabledByIds(Integer[] ids);
}

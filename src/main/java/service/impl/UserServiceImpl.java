package service.impl;

import com.github.pagehelper.PageHelper;
import dao.IUserDao;
import domain.Role;
import domain.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.IUserService;

import javax.annotation.security.RolesAllowed;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


@Service("userService")
@Transactional
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao userDao;

    @Override
    public UserDetails loadUserByUsername(String username) {
        UserInfo userInfo = null;
        try {
             userInfo =userDao.findByUserName(username);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //"{noop}"不对密码进行加密编码
        //User user = new User(userInfo.getUsername(),"{noop}"+userInfo.getPassword(),getAuthorty(userInfo.getRoles()));
        //{bcrypt}指定加密方式，获取盐解密算式
        //设置账户锁定参数 如果status是0即为不可用
        User user = new User(userInfo.getUsername(),"{bcrypt}"+userInfo.getPassword(),userInfo.getStatus()==0?false:true,true,true,true,getAuthorty(userInfo.getRoles()));
        System.out.println(userInfo);
        return user;
    }


    @Override

    public List<UserInfo> findAll(int page, int size) throws Exception {

        //参数pageNum是页码值 参数pageSize代表每页显示条数,而且pageHelper必须放在return上面
        PageHelper.startPage(page,size);
        return userDao.findAll();
    }

    //权限授予，集合中装入的是角色的权限描述
    public List<SimpleGrantedAuthority> getAuthorty(List<Role> roles){

        List<SimpleGrantedAuthority> list = new ArrayList<>();
        for (Role role: roles) {
            list.add(new SimpleGrantedAuthority("ROLE_"+role.getRoleName()));
        }


        return list;

    }

    @Override
    public UserInfo findById(int userId)  throws Exception{

        return userDao.findById(userId);
    }



    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;//引入加密类

    @Override

    public void save(UserInfo userInfo) {

        //对密码进行加密编码
        userInfo.setPassword(bCryptPasswordEncoder.encode(userInfo.getPassword()));
        userDao.save(userInfo);
    }

    @Override
    public List<Role> findOtherRole(int userId) throws Exception {
        return userDao.findOtherRoles(userId);
    }

    @Override
    public void addRoleToUser(int[] roleIds, int userId)throws Exception {
        for (int roleId:roleIds) {
            System.out.println(roleId);
            userDao.addRoleToUser(roleId,userId);

        }
    }

    @Override
    public void dropByIds(Integer[] ids) {
        for (int id:ids) {
            userDao.updateStatuToZeroById(id);
        }
    }

    @Override
    public void enabledByIds(Integer[] ids) {
        for (int id:ids) {
            userDao.updateStatuToOneById(id);
        }
    }
}

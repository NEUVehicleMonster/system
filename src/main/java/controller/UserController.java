package controller;


import com.github.pagehelper.PageInfo;
import domain.Role;
import domain.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.IUserService;

import javax.annotation.security.RolesAllowed;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {


    @Autowired
    private IUserService userService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page, @RequestParam(name="size",required = true,defaultValue = "4")Integer size) throws Exception{

        ModelAndView modelAndView = new ModelAndView();

        List<UserInfo> userList =  userService.findAll(page,size);


        PageInfo pageInfo = new PageInfo(userList);
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("user-list");
        return modelAndView;
    }

    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam(name = "id",required = true)Integer userId)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        UserInfo userInfo = userService.findById(userId);
        modelAndView.addObject("user",userInfo);
        modelAndView.setViewName("user-show");
        return modelAndView;
    }

    @RequestMapping(path = "/save.do")

    public String save(UserInfo userInfo) throws Exception{
        userService.save(userInfo);
        System.out.println(userInfo);

        return "redirect:findAll.do";
    }


    //查询用户以及用户可以添加的角色
    @RequestMapping(path = "/findUserByIdAndAllRole.do")
    public  ModelAndView findUserByIdAndAllRole(@RequestParam(name = "id",required = true)Integer userId)throws Exception{
        //1.根据用户ID查询用户
        UserInfo userInfo = userService.findById(userId);


        //2。根据用户ID查询可以添加的角色
        List<Role> otherRoles = userService.findOtherRole(userId);


        ModelAndView modelAndView = new ModelAndView();


        modelAndView.addObject("user",userInfo);
        modelAndView.addObject("roleList",otherRoles);
        modelAndView.setViewName("user-role-add");
        return modelAndView;
    }

    //将用户选中的角色添加到数据库
    @RequestMapping(path = "/addRoleToUser.do")
    public String addRoleToUser(@RequestParam(name = "roleIds",required = true)int[] roleIds,@RequestParam(name = "id",required = true)Integer userId)throws Exception{
        userService.addRoleToUser(roleIds,userId);
        return "forward:findById.do";
    }

    //停用用户
    @RequestMapping(path = "/dropByIds.do")
    public String dropByIds(@RequestParam(name = "ids",required = true,defaultValue = "1")Integer[] ids) throws Exception{

        //调用Service中的方法
        userService.dropByIds(ids);
        //响应重定向
        return "redirect:findAll.do";
    }

    //启用用户
    @RequestMapping(path = "/enabledByIds.do")
    public String enabledByIds(@RequestParam(name = "ids",required = true,defaultValue = "1")Integer[] ids) throws Exception{

        //调用Service中的方法
        userService.enabledByIds(ids);
        //响应重定向
        return "redirect:findAll.do";
    }
}

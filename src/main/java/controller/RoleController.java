package controller;


import domain.Permission;
import domain.Role;
import domain.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.IRoleServce;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IRoleServce roleService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll()throws Exception{

        ModelAndView modelAndView = new ModelAndView();

        List<Role> roleList = roleService.findAll();

        modelAndView.addObject("roleList",roleList);
        modelAndView.setViewName("role-list");

        return modelAndView;
    }

    @RequestMapping(path = "/findRoleByIdAndAllPermission.do")
    public ModelAndView findRoleByIdAndAllPermission(@RequestParam(name = "id",required = true)Integer roleId)throws Exception{

        Role role = roleService.findById(roleId);


        //2。根据用户ID查询可以添加的角色
        List<Permission> otherPermissions = roleService.findOtherPermission(roleId);


        ModelAndView modelAndView = new ModelAndView();


        modelAndView.addObject("role",role);
        modelAndView.addObject("permissionList",otherPermissions);
        modelAndView.setViewName("role-permission-add");
        return modelAndView;
    }

    @RequestMapping(path = "/addPermissionToRole.do")
    public String addPermissionToRole(@RequestParam(name = "permissionIds",required = true)int[] permissionIds,@RequestParam(name = "id",required = true)Integer roleId)throws Exception{

        roleService.addPermissionToRole(permissionIds,roleId);
        return "redirect:findAll.do";
    }

    @RequestMapping(path = "/save.do")
    public String save(Role role) throws Exception{
        roleService.save(role);

        return "redirect:findAll.do";
    }

    @RequestMapping(path = "/findById.do")
    public ModelAndView findById(@RequestParam(name = "id",required = true)Integer roleId)throws Exception{
        Role role = roleService.findById(roleId);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("role",role);
        modelAndView.setViewName("role-show");
        return modelAndView;
    }
}

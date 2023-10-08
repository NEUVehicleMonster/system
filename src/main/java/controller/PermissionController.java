package controller;


import domain.Permission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.IPermissionService;

import javax.annotation.security.RolesAllowed;
import java.util.List;


@Controller
@RequestMapping(path = "/permission")
public class PermissionController {

    @Autowired
    private IPermissionService permissionService;


    @RequestMapping(path = "/findAll.do")

    public ModelAndView findAll() throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        List<Permission> permissionList = permissionService.findAll();
        modelAndView.addObject("permissionList",permissionList);
        modelAndView.setViewName("permission-list");
        return modelAndView;

    }

    @RequestMapping(path = "/save.do.do")
    public String save(Permission permission)throws Exception{
        permissionService.save(permission);
        return "redirect:findAll.do";

    }

    @RequestMapping(path = "/findById.do")
    public ModelAndView findById(@RequestParam(name = "id",required = true)Integer permissionId)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        Permission permission = permissionService.findById(permissionId);
        modelAndView.addObject("permission",permission);
        modelAndView.setViewName("permission-show");
        return modelAndView;
    }
}

package controller;


import com.github.pagehelper.PageInfo;
import domain.Cow;
import domain.Fodder;
import domain.Oxtall;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.IOxtallService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(path = "/oxtall")
public class OxtallController {
    @Autowired
    private IOxtallService oxtallService;


    @RequestMapping(path = "/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page, @RequestParam(name="size",required = true,defaultValue = "4")Integer size) throws Exception{
        //实例化模块视图对象
        ModelAndView modelAndView = new ModelAndView();
        //调用Service中的方法
        List<Oxtall> oxtalls = oxtallService.findAll(page,size);
        //分页类实例化
        PageInfo pageInfo = new PageInfo(oxtalls);
        //将分页对象传给前端
        modelAndView.addObject("pageInfo",pageInfo);
        //设置跳转页面
        modelAndView.setViewName("oxtall-list");
        //返回模块视图对象
        return modelAndView;
    }


    @RequestMapping(path = "/save.do")
    public String save(Oxtall oxtall) throws Exception{

        //调用Service中的方法
        oxtallService.save(oxtall);
        //响应重定向
        return "redirect:findAll.do";
    }


    @RequestMapping(path = "/findById.do")
    public ModelAndView findAll(@RequestParam(name = "id",required = true,defaultValue = "1")Integer id) throws Exception{
        //实例化模块视图对象
        ModelAndView modelAndView = new ModelAndView();
        //调用Service中的方法
        Oxtall oxtall = oxtallService.findById(id);
        //将查询出的对象传给前端
        modelAndView.addObject("oxtall",oxtall);
        //设置跳转页面
        modelAndView.setViewName("oxtall-list");
        //返回模块视图对象
        return modelAndView;
    }


    @RequestMapping(path = "/dropByIds.do")
    public String dropByIds(@RequestParam(name = "ids",required = true,defaultValue = "1")Integer[] ids) throws Exception{

        //调用Service中的方法
        oxtallService.dropByIds(ids);
        //响应重定向
        return "redirect:findAll.do";
    }

    @RequestMapping(path = "/updateById.do")
    public String updateById(Oxtall oxtall) throws Exception{

        //调用Service中的方法
        oxtallService.updateById(oxtall);
        //响应重定向
        return "redirect:findAll.do";
    }

    //点击编辑按钮后跳转
    @RequestMapping(path = "/updateBtn.do")
    public ModelAndView updateBtn(@RequestParam(name = "id",required = true,defaultValue = "1")Integer id) throws Exception{
        //实例化模块视图对象
        ModelAndView modelAndView = new ModelAndView();
        //调用Service中的方法
        Oxtall oxtall = oxtallService.findById(id);
        //将查询出的对象传给前端
        modelAndView.addObject("oxtall",oxtall);
        //设置跳转页面
        modelAndView.setViewName("oxtall-update");
        //返回模块视图对象
        return modelAndView;
    }



}

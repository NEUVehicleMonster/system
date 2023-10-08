package controller;


import com.github.pagehelper.PageInfo;
import domain.Fodder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.IFodderService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(path = "/fodder")
public class FodderController {
    @Autowired
    private IFodderService fodderService;


    @RequestMapping(path = "/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page, @RequestParam(name="size",required = true,defaultValue = "4")Integer size) throws Exception{
        //实例化模块视图对象
        ModelAndView modelAndView = new ModelAndView();
        //调用Service中的方法
        List<Fodder> fodders = fodderService.findAll(page,size);
        //分页类实例化
        PageInfo pageInfo = new PageInfo(fodders);
        //将分页对象传给前端
        modelAndView.addObject("pageInfo",pageInfo);
        //设置跳转页面
        modelAndView.setViewName("fodder-list");
        //返回模块视图对象
        return modelAndView;
    }


    @RequestMapping(path = "/save.do")
    public String save(Fodder fodder) throws Exception{

        //调用Service中的方法
        fodderService.save(fodder);
        //响应重定向
        return "redirect:findAll.do";
    }


    @RequestMapping(path = "/findById.do")
    public ModelAndView findAll(@RequestParam(name = "id",required = true,defaultValue = "1")Integer id) throws Exception{
        //实例化模块视图对象
        ModelAndView modelAndView = new ModelAndView();
        //调用Service中的方法
        Fodder fodder = fodderService.findById(id);
        //将查询出的对象传给前端
        modelAndView.addObject("fodder",fodder);
        //设置跳转页面
        modelAndView.setViewName("fodder-list");
        //返回模块视图对象
        return modelAndView;
    }


    @RequestMapping(path = "/dropByIds.do")
    public String dropByIds(@RequestParam(name = "ids",required = true,defaultValue = "1")Integer[] ids) throws Exception{

        //调用Service中的方法
        fodderService.dropByIds(ids);
        //响应重定向
        return "redirect:findAll.do";
    }

    @RequestMapping(path = "/updateById.do")
    public String updateById(Fodder fodder) throws Exception{

        //调用Service中的方法
        fodderService.updateById(fodder);
        //响应重定向
        return "redirect:findAll.do";
    }

    //点击编辑按钮后跳转
    @RequestMapping(path = "/updateBtn.do")
    public ModelAndView updateBtn(@RequestParam(name = "id",required = true,defaultValue = "1")Integer id) throws Exception{
        //实例化模块视图对象
        ModelAndView modelAndView = new ModelAndView();
        //调用Service中的方法
        Fodder fodder = fodderService.findById(id);
        //将查询出的对象传给前端
        modelAndView.addObject("fodder",fodder);
        //设置跳转页面
        modelAndView.setViewName("fodder-update");
        //返回模块视图对象
        return modelAndView;
    }

    //ajax方法通过ID查找
    @RequestMapping(path = "/findByIdForAjax.do")
    @ResponseBody
    public Map<String,Object> findByIdForAjax(@RequestBody Fodder fodder) throws Exception{
        Map<String,Object> map = new HashMap<String,Object>();
        //调用Service中的方法
        int id = fodder.getId();
        Fodder ifodder = fodderService.findById(id);
        //将查询出的对象放入map集合，传给前端
        map.put("fodder",ifodder);
        map.put("success",true);
        //返回Map对象
        return map;
    }

}

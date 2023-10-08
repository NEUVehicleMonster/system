package controller;


import com.github.pagehelper.PageInfo;
import dao.ICowDao;
import domain.Cow;
import domain.Oxtall;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.ICowService;
import service.IOxtallService;

import java.util.List;

@Controller
@RequestMapping(path = "/cow")
public class CowController {
    @Autowired
    private ICowService cowService;


    @RequestMapping(path = "/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page, @RequestParam(name="size",required = true,defaultValue = "4")Integer size) throws Exception{
        //实例化模块视图对象
        ModelAndView modelAndView = new ModelAndView();
        //调用Service中的方法
        List<Cow> cows = cowService.findAll(page,size);
        //分页类实例化
        PageInfo pageInfo = new PageInfo(cows);
        //将分页对象传给前端
        modelAndView.addObject("pageInfo",pageInfo);
        //设置跳转页面
        modelAndView.setViewName("cow-list");
        //返回模块视图对象
        return modelAndView;
    }


    @RequestMapping(path = "/save.do")
    public String save(Cow cow) throws Exception{

        //调用Service中的方法
        cowService.save(cow);
        //响应重定向
        return "redirect:findAll.do";
    }


    @RequestMapping(path = "/findById.do")
    public ModelAndView findAll(@RequestParam(name = "id",required = true,defaultValue = "1")Integer id) throws Exception{
        //实例化模块视图对象
        ModelAndView modelAndView = new ModelAndView();
        //调用Service中的方法
        Cow cow = cowService.findById(id);
        //将查询出的对象传给前端
        modelAndView.addObject("cow",cow);
        //设置跳转页面
        modelAndView.setViewName("cow-list");
        //返回模块视图对象
        return modelAndView;
    }


    @RequestMapping(path = "/dropByIds.do")
    public String dropByIds(@RequestParam(name = "ids",required = true,defaultValue = "1")Integer[] ids) throws Exception{

        //调用Service中的方法
        cowService.dropByIds(ids);
        //响应重定向
        return "redirect:findAll.do";
    }

    @RequestMapping(path = "/updateById.do")
    public String updateById(Cow cow) throws Exception{

        //调用Service中的方法
        cowService.updateById(cow);
        //响应重定向
        return "redirect:findAll.do";
    }

    //点击编辑按钮后跳转
    @RequestMapping(path = "/updateBtn.do")
    public ModelAndView updateBtn(@RequestParam(name = "id",required = true,defaultValue = "1")Integer id) throws Exception{
        //实例化模块视图对象
        ModelAndView modelAndView = new ModelAndView();
        //调用Service中的方法
        Cow cow = cowService.findById(id);
        //将查询出的对象传给前端
        modelAndView.addObject("cow",cow);
        //设置跳转页面
        modelAndView.setViewName("cow-update");
        //返回模块视图对象
        return modelAndView;
    }

    //找到所有牛舍并传到添加页面
    @Autowired
    private IOxtallService oxtallService;
    @RequestMapping(path = "/findAllOxtall.do")
    public ModelAndView findAllOxtall() throws Exception{
        //实例化模块视图对象
        ModelAndView modelAndView = new ModelAndView();
        //调用Service中的方法
        List<Oxtall> oxtalls = oxtallService.findAll();
        //将对象传给前端
        modelAndView.addObject("oxtalls",oxtalls);
        //设置跳转页面
        modelAndView.setViewName("cow-add");
        //返回模块视图对象
        return modelAndView;
    }

}

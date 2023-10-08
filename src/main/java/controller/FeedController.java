package controller;


import com.github.pagehelper.PageInfo;
import domain.Cow;
import domain.Feed;
import domain.Fodder;
import domain.Oxtall;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.ICowService;
import service.IFeedService;
import service.IFodderService;
import service.IOxtallService;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(path = "/feed")
public class FeedController {
    @Autowired
    private IFeedService feedService;

    @Autowired
    private ICowService cowService;

    @Autowired
    private IFodderService fodderService;

    @Autowired
    private IOxtallService oxtallService;


    @RequestMapping(path = "/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page, @RequestParam(name="size",required = true,defaultValue = "4")Integer size) throws Exception{
        //实例化模块视图对象
        ModelAndView modelAndView = new ModelAndView();
        //调用Service中的方法
        List<Feed> feeds = feedService.findAll(page,size);
        //分页类实例化
        PageInfo pageInfo = new PageInfo(feeds);
        //将分页对象传给前端
        modelAndView.addObject("pageInfo",pageInfo);
        //设置跳转页面
        modelAndView.setViewName("feed-list");
        //返回模块视图对象
        return modelAndView;
    }


    @RequestMapping(path = "/save.do")
    public String save(Feed feed) throws Exception{
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        //主体名，即登录用户名
        feed.setUsername(username);
        //获取当前系统时间
        Date now = new Date();
        //存入对象
        feed.setTimelog(now);
        //调用Service中的方法
        feedService.save(feed);
        //响应重定向
        return "redirect:findAll.do";
    }


    @RequestMapping(path = "/findById.do")
    public ModelAndView findAll(@RequestParam(name = "id",required = true,defaultValue = "1")Integer id) throws Exception{
        //实例化模块视图对象
        ModelAndView modelAndView = new ModelAndView();
        //调用Service中的方法
        Feed feed = feedService.findById(id);
        //将查询出的对象传给前端
        modelAndView.addObject("feed",feed);
        //设置跳转页面
        modelAndView.setViewName("feed-list");
        //返回模块视图对象
        return modelAndView;
    }


    @RequestMapping(path = "/dropByIds.do")
    public String dropByIds(@RequestParam(name = "ids",required = true,defaultValue = "1")Integer[] ids) throws Exception{

        //调用Service中的方法
        feedService.dropByIds(ids);
        //响应重定向
        return "redirect:findAll.do";
    }

    @RequestMapping(path = "/updateById.do")
    public String updateById(Feed feed) throws Exception{

        //调用Service中的方法
        feedService.updateById(feed);
        //响应重定向
        return "redirect:findAll.do";
    }

    //点击编辑按钮后跳转
    @RequestMapping(path = "/updateBtn.do")
    public ModelAndView updateBtn(@RequestParam(name = "id",required = true,defaultValue = "1")Integer id) throws Exception{
        //实例化模块视图对象
        ModelAndView modelAndView = new ModelAndView();
        //调用Service中的方法
        Feed feed = feedService.findById(id);
        //将查询出的对象传给前端
        modelAndView.addObject("feed",feed);
        //设置跳转页面
        modelAndView.setViewName("feed-update");
        //返回模块视图对象
        return modelAndView;
    }

    //加载feed-add页面
    @RequestMapping(path = "/add.do")
    public ModelAndView add() throws Exception{
        //实例化模块视图对象
        ModelAndView modelAndView = new ModelAndView();
        //调用Service中的方法
        List<Cow> cows = cowService.findAll();
        List<Fodder> fodders = fodderService.findAll();
        List<Oxtall> oxtalls = oxtallService.findAll();
        //将查询出的对象传给前端
        modelAndView.addObject("cows",cows);
        modelAndView.addObject("fodders",fodders);
        modelAndView.addObject("oxtalls",oxtalls);
        //设置跳转页面
        modelAndView.setViewName("feed-add");
        //返回模块视图对象
        return modelAndView;
    }

}

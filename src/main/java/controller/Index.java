package controller;

import com.github.pagehelper.PageInfo;
import domain.Feed;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.IFeedService;

import java.util.List;

@Controller
@RequestMapping(path = "/index")
public class Index {
    @Autowired
    private IFeedService feedService;



    @RequestMapping(path = "/findAll.do")
    public ModelAndView findAll() throws Exception{
        //实例化模块视图对象
        ModelAndView modelAndView = new ModelAndView();
        //调用Service中的方法
        List<Feed> feeds = feedService.findAll();
        //将分页传给前端
        modelAndView.addObject("feeds",feeds);
        //设置跳转页面
        modelAndView.setViewName("index");
        //返回模块视图对象
        return modelAndView;
    }
}

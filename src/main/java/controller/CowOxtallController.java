package controller;

import domain.Cow;
import domain.CowOxtall;
import domain.Oxtall;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.CowOxtallService;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(path = "/cowOxtall")
public class CowOxtallController {
    @Autowired
    private CowOxtallService cowOxtallService;

    //ajax方法通过ID查找
    @RequestMapping(path = "/findByCowIdForAjax.do")
    @ResponseBody
    public Map<String,Object> findByCowIdForAjax(@RequestBody CowOxtall cowOxtall) throws Exception{
        Map<String,Object> map = new HashMap<String,Object>();
        //调用Service中的方法

        CowOxtall cowOxtallx = cowOxtallService.findByCowId(cowOxtall.getCow_id());
        //将查询出的对象放入map集合，传给前端
        map.put("cowOxtall",cowOxtallx);
        map.put("success",true);
        //返回Map对象
        return map;
    }
}

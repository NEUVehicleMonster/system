package controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class ActionController {

    @RequestMapping(path = "/")
    public String action(){
        return "index";
//          return "index1";
    }

}

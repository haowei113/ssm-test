package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import pojo.Result;
import pojo.User;
import service.UserService;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Objects;

@RestController
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public ModelAndView login(User user)
    {
        User u1=userService.selectAll(user);
        ModelAndView modelAndView =null;
        if(u1!=null) {
            switch (user.getIdentity()){
                case "manager":
                    modelAndView = new ModelAndView("manager.jsp");
                    break;
                case "buyer":
                    modelAndView = new ModelAndView("buyer.jsp");
                    break;
                case "seller":
                    modelAndView = new ModelAndView("seller.jsp");
                    break;
            }
            modelAndView.addObject("inf", user);

        }
        else
        {
            modelAndView = new ModelAndView("login.jsp");
            modelAndView.addObject("flag", "failed");
        }
        return modelAndView;
        }

    @RequestMapping("/updateinformation/{newusername}/{password}/{oldusername}")
    public int updateinformtion(@PathVariable String newusername, @PathVariable String password, @PathVariable String oldusername)
    {
        List<User> userList=userService.selectUserByUsername(newusername);
        if(userList.size()==0|| Objects.equals(userList.get(0).getUsername(), oldusername))
        {
            userService.updateInformation(newusername, password, oldusername);
            return 1;
        }
        else {
            return 0;
        }
    }


}

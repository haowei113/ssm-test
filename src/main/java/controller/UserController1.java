package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import pojo.PageBean;
import pojo.Result;
import pojo.User;


import java.util.List;

@RestController
public class UserController1 {
//    @Autowired
//    private UserService userService;
//
//    @RequestMapping("/selectAll")
//    public Result selectAll()
//    {
//        System.out.println("查询全部部门数据");
//        List<User> userList=userService.selectAll();
//        return new Result(1,"成功",userList);
//    }

//    @RequestMapping("/deleteById/{id}")
//    public Result deleteById(@PathVariable int id)
//    {
//        userService.deleteById(id);
//        return new Result(1,"成功",null);
//    }
//
//    @RequestMapping("/add")
//    public Result add(@RequestBody User user)
//    {
//        userService.add(user);
//        return new Result(1,"成功",null);
//    }
//
//    @RequestMapping("/page1")
//    public Result page(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10")int pageSize)
//    {
//        PageBean pageBean=userService.page1(page,pageSize);
//        return new Result(1,"成功",pageBean);
//    }
//
//    @RequestMapping("/page2")
//    public Result page(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10")int pageSize,int id)
//    {
//        PageBean pageBean=userService.page2(page,pageSize,id);
//        return new Result(1,"成功",pageBean);
//    }
//
//    @RequestMapping("/deleteSome/{ids}")
//    public Result deleteSome(@PathVariable List<Integer> ids)
//    {
//        userService.deleteSome(ids);
//        return new Result(1,"成功",null);
//    }
}

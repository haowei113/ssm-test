package service.impl;
import mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import pojo.PageBean;
import pojo.User;
import service.UserService;

import java.util.List;

@Service
public class UserServiceA implements UserService {
    @Autowired
    private UserMapper userMapper;
//    登录验证
    public User selectAll(User user)
    {
        List<User> list=userMapper.selectAll(user);
        User u1=null;
        if(list.size()!=0)
            u1=list.get(0);
        return u1;
    }


//    根据用户名和密码搜索用户
    public List<User> selectUserByUsername(String username)
    {
        List<User> list=userMapper.selectUserByUsername(username);
        return list;
    }

    public int updateInformation(String newusername,String password,String oldusername)
    {
        int ifsuccess= userMapper.updateInformation(newusername,password,oldusername);
        return ifsuccess;
    }






//    public void deleteById(int id)
//    {
//        usermapper.deletebyid(id);
//    }
//
//    public void add(User user)
//    {
//        usermapper.add(user);
//    }
//
//    public PageBean page1(int page, int pageSize) {
//        long count=usermapper.count();
//        int start=(page-1)*pageSize;
//        List<User> list=usermapper.page1(start,pageSize);
//        PageBean pageBean=new PageBean(count,list);
//        return pageBean;
//    }
//
//    public PageBean page2(int page, int pageSize,int id) {
//        long count=usermapper.count();
//        int start=(page-1)*pageSize;
//        List<User> list=usermapper.page2(start,pageSize,id);
//        PageBean pageBean=new PageBean(count,list);
//        return pageBean;
//    }
//
//    public void deleteSome(List<Integer> ids) {
//        usermapper.deleteSome(ids);
//    }
}

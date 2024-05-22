package service;

import pojo.PageBean;
import pojo.User;

import java.util.List;

public interface UserService {
    User selectAll(User user);

    List<User> selectUserByUsername(String username);

    int updateInformation(String newusername,String password,String oldusername);
//    void deleteById(int id);
//
//    void add(User user);
//
//    PageBean page1(int page, int pageSize);
//
//    PageBean page2(int page, int pageSize,int id);
//
//    void deleteSome(List<Integer> ids);
}

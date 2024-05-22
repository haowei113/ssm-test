package mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import pojo.User;

import java.util.List;
@Mapper
public interface UserMapper {
//    登录身份验证
    @Select("select * from user where username=#{username} and password=#{password} and identity=#{identity}")
    List<User> selectAll(User user);

    @Select("select * from user where username=#{username}")
    List<User> selectUserByUsername(String username);

    @Update("update user set username=#{newusername},password=#{password} where username=#{oldusername}")
    int updateInformation(@Param("newusername")String newusername, @Param("password")String password,@Param("oldusername")String oldusername);
//    @Delete("delete from user where id=#{id}")
//    public void deletebyid(int id);
//
//    @Insert("insert into user values (#{id},#{name},#{age})")
//    public void add(User user);
//
//    @Select("select count(*) from user")
//    public long count();
//
//    @Select("select * from user limit #{start},#{size}")
//    public List<User> page1(@Param("start") int start, @Param("size")int size);
//
//    public List<User> page2(@Param("start") int start, @Param("size")int size,@Param("id")int id);
//
//    public void deleteSome(@Param("ids")List<Integer> ids);
}


package mapper;

import org.apache.ibatis.annotations.*;
import pojo.User;
import pojo.product;

import java.util.List;

@Mapper
public interface SellerMapper {
//    添加商品
    @Insert("insert into product(productName,sellerName,description) values (#{productName},#{sellerName},#{description})")
    int addProduct(@Param("productName") String productName,@Param("sellerName") String sellerName,@Param("description") String description);

    @Select("select * from product where sellerName=#{sellerName} limit #{start},#{size}")
    List <product> selectProductBySeller(@Param("sellerName") String sellerName,@Param("start") int start,@Param("size") int size);

    @Select("select count(*) from product")
    int count();
}

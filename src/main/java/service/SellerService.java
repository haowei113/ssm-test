package service;

import org.apache.ibatis.annotations.Param;
import pojo.PageBean;
import pojo.product;

import java.util.List;

public interface SellerService {
    int addProduct(String productName,String sellerName,String description);

    PageBean selectProductBySeller(String sellerName, int start, int size);


}

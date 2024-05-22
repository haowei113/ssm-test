package service.impl;

import mapper.SellerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.PageBean;
import pojo.product;
import service.SellerService;

import java.util.List;

@Service
public class SellerServiceA implements SellerService {
    @Autowired
    private SellerMapper sellerMapper;

    public int addProduct(String productName,String sellerName,String description)
    {
        return sellerMapper.addProduct(productName,sellerName,description);
    }

    public PageBean selectProductBySeller(String sellerName, int page, int pageSize)
    {
        int count=sellerMapper.count();
        int start=(page-1)*pageSize;
        List<product> list=sellerMapper.selectProductBySeller(sellerName,start,pageSize);
        PageBean pageBean=new PageBean(count,list);
        return pageBean;
    }


}

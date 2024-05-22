package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import pojo.PageBean;
import pojo.Result;
import pojo.User;
import service.SellerService;

@RestController
@RequestMapping("/seller")
public class SellerController {
    @Autowired
    private SellerService sellerService;

    @RequestMapping("/addProduct/{productName}/{sellerName}/{description}")
    public int addProduct(@PathVariable String productName,@PathVariable String sellerName,@PathVariable String description)
    {
        return sellerService.addProduct(productName,sellerName,description);
    }

    @RequestMapping("/selectProductBySeller/{sellerName}/{page}/{pageSize}")
    public PageBean selectProduct(@PathVariable String sellerName, @PathVariable int page, @PathVariable int pageSize)
    {
        return sellerService.selectProductBySeller(sellerName,page,pageSize);
    }
}

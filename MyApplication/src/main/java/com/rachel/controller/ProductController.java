package com.rachel.controller;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.rachel.entities.Product;
import com.rachel.model.ProductModel;
import com.rachel.services.ProductService;

@Controller
@RequestMapping(value = "product")
public class ProductController {
	
	   @Autowired
	    private ProductService productService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		ProductModel productModel = new ProductModel();
		modelMap.put("products", productModel.findAll());
		return "product/index";
	}
	
	   @RequestMapping("/products/index")
	    public String list(HttpServletRequest request) {
	        request.setAttribute("products", productService.list());
	        request.setAttribute("mode", "MODE_ALLPRODUCTS");
	        return "products";

	    }
	

    @RequestMapping("/products/add-product")
    public String add(HttpServletRequest request) {
        request.setAttribute("products", productService.list());
        request.setAttribute("mode", "MODE_ADDPRODUCT");
        return "products";

    }
    

    @RequestMapping("/products/delete-product/{id}")
    public String delete(@PathVariable("id") Integer id, HttpServletRequest request) {
        productService.delete(id);
        request.setAttribute("products", productService.list());
        request.setAttribute("mode", "MODE_ALLPRODUCTS");
        return "products";
    }


    @RequestMapping("/products/edit-product/{id}")
    public String edit(@PathVariable("id") Integer id, HttpServletRequest request) {
        request.setAttribute("product", productService.get(id).get());
        request.setAttribute("mode", "MODE_UPDATEPRODUCT");
        return "products";

    }

    @RequestMapping("/products/save-product")
    public String save(@RequestParam String id, @RequestParam String name, @RequestParam String photo, @RequestParam double price, HttpServletRequest request) {
        Product product = new Product(id, name, photo, price);
        System.out.println("SAVE PRODUCT: " + product.toString());
        productService.save(product);
        request.setAttribute("mode", "MODE_ALLPRODUCTS");
        return "products";
    }
   
    
    @RequestMapping("/products/update-product")
    public String update(@RequestParam String id, @RequestParam String name, @RequestParam String photo, @RequestParam double price, HttpServletRequest request) {
        Optional<Product> optionalProduct = productService.get(Integer.parseInt(id));
        System.out.println("SAVE PRODUCT Found: " + optionalProduct.isPresent());
        if (optionalProduct.isPresent()) {
            Product product = optionalProduct.get();
            product.setName(name);
            product.setPhoto(photo);
            product.setPrice(price);
            productService.save(product);
        }
        request.setAttribute("products", productService.list());
        request.setAttribute("mode", "MODE_ALLPRODUCTS");
        return "products";
    }

}
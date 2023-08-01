package org.sid.lightecomv1.Controller;

import org.sid.lightecomv1.entities.Category;
import org.sid.lightecomv1.entities.Product;
import org.sid.lightecomv1.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Paths;

@CrossOrigin("*")
@RestController
public class
ProductController {

    @Autowired
    ProductService productService;

    @PostMapping(path = "/category/{id}/prod")
    public void addProduct(@RequestBody Product product, @PathVariable Long id) throws Exception{
        Category cat=new Category();
        cat.setId(id);
        product.setCategory(cat);
        productService.addProduct(product);
    }
}

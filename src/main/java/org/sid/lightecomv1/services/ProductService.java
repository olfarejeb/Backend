package org.sid.lightecomv1.services;

import org.sid.lightecomv1.dao.ProductRepository;
import org.sid.lightecomv1.entities.Category;
import org.sid.lightecomv1.entities.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

@Service
public class ProductService {

    @Autowired
    ProductRepository productRepository;
    public void addProduct(Product product){


        productRepository.save(product);
    }
}

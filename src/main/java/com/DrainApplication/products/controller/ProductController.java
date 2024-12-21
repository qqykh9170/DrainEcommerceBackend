package com.DrainApplication.products.controller;

import com.DrainApplication.products.models.entities.Product;
import com.DrainApplication.products.models.request.ProductRequest;
import org.springframework.web.bind.annotation.*;
import com.DrainApplication.products.services.ProductService;

import java.util.List;

@RestController
@RequestMapping("/api/products")
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping
    public List<Product> getAllProducts(){
        return productService.getAllProducts();
    }

    @PostMapping("/create")
    public Product createProduct(@RequestBody ProductRequest product){
        return productService.createProduct(product);
    }

    @DeleteMapping("/{id}")
    public void deleteProduct(@PathVariable Long id){
        productService.deleteProduct(id);
    }

    @PutMapping("/{id}")
    public Product editProduct(@PathVariable Long id, @RequestBody ProductRequest productDetails){
        return productService.editProduct(id, productDetails);
    }

}

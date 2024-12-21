package com.DrainApplication.products.services;

import com.DrainApplication.products.models.request.ProductRequest;
import org.springframework.stereotype.Service;
import com.DrainApplication.products.models.entities.Product;
import com.DrainApplication.products.repository.ProductRepository;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> getAllProducts(){
        return productRepository.findAll();
    }

    public Product createProduct(ProductRequest productRequest){
        Product product = new Product();
        product.setProductName(productRequest.getProductName());
        product.setProductDescription(productRequest.getProductDescription());
        product.setPrice(productRequest.getPrice());
        product.setStockQuantity(productRequest.getStockQuantity());
        return productRepository.save(product);
    }

    public void deleteProduct(Long id){
        productRepository.deleteById(id);
    }

    public Product editProduct(Long id, ProductRequest productDetails){
        Optional<Product> product = productRepository.findByProductId(id);
        if(product.isPresent()){
            product.get().setProductName(productDetails.getProductName());
            product.get().setProductDescription(productDetails.getProductDescription());
            product.get().setPrice(productDetails.getPrice());
            product.get().setStockQuantity(productDetails.getStockQuantity());
            return productRepository.save(product.get());
        }
        return null;
    }
}

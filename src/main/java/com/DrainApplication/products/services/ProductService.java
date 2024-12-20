package DrainApplication.products.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import DrainApplication.products.models.entities.Product;
import DrainApplication.products.models.request.ProductRequest;
import DrainApplication.products.repository.ProductRepository;

import java.util.List;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public List<Product> getAllProducts(){
        return productRepository.findAll();
    }

    public Product createProduct(Product product){
        return productRepository.save(product);
    }

    public void deleteProduct(Long id){
        productRepository.deleteById(id);
    }

    public Product editProduct(Long id, ProductRequest productDetails){
        Product product = productRepository.findById(id).orElseThrow();
        product.setProductName(productDetails.getProductName());
        return productRepository.save(product);
    }

}

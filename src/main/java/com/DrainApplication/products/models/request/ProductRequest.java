package DrainApplication.products.models.request;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductRequest {

    private int productId;
    private String productName;
    private String productDescription;
    private double price;
    private int stockQuantity;
    private int categoryId;

}

package pojo;

public class product {
    String productName;
    String sellerName;
    String description;

    @Override
    public String toString() {
        return "product{" +
                "productName='" + productName + '\'' +
                ", sellerName='" + sellerName + '\'' +
                ", description='" + description + '\'' +
                '}';
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}

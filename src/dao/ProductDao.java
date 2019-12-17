package dao;

import models.Product;

import java.util.List;

public interface ProductDao {
    int addNewProduct(Product product);
    int modifyProduct(Product product);
    List<Product> getAllProduct();
    Product getSomeOneProduct(int id);
}

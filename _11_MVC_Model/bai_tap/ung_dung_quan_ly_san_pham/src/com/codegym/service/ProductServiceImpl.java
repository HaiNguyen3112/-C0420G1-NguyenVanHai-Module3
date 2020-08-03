package com.codegym.service;

import com.codegym.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {

    private static Map<Integer,Product> products;
    static {
        products = new HashMap<>();
        products.put(1,new Product(1,"Iphone","20000000","Red","Apple"));
        products.put(2,new Product(2,"Reno4","15000000","Blue","Oppo"));
        products.put(3,new Product(3,"Galaxy","8000000","Diamond","Samsung"));
        products.put(4,new Product(4,"N1200","10000000","Black","Nokia"));
        products.put(5,new Product(5,"A370","6000000","Red","Samsung"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(),product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id,product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }
}

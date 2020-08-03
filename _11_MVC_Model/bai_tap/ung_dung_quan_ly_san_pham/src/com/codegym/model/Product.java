package com.codegym.model;

public class Product {
    private int id;
    private String productName;
    private String productPrice;
    private String productDescribe;
    private String productBy;

    public Product() {
    }

    public Product(int id, String productName, String productPrice, String productDescribe, String productBy) {
        this.id = id;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productDescribe = productDescribe;
        this.productBy = productBy;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductDescribe() {
        return productDescribe;
    }

    public void setProductDescribe(String productDescribe) {
        this.productDescribe = productDescribe;
    }

    public String getProductBy() {
        return productBy;
    }

    public void setProductBy(String productBy) {
        this.productBy = productBy;
    }
}

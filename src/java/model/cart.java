/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class cart {
    private product product;
    private int num;

    public cart() {
    }

    public cart(product product, int num) {
        this.product = product;
        this.num = num;
    }
    
    public product getProduct() {
        return product;
    }

    public void setProduct(product product) {
        this.product = product;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class product {
    private int id;
    private String name;
    private double price;
    private String image;
    private String description;
    private category category;
    private String color;
    private String material;
    private String stone;
    private String gender;
    private String perfection;
    private int buy;

    // Constructor
    
    public product() {
    }

    public product(int id, String name, double price, String image, String description, category category, String color, String material, String stone, String gender, String perfection, int buy) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
        this.description = description;
        this.category = category;
        this.color = color;
        this.material = material;
        this.stone = stone;
        this.gender = gender;
        this.perfection = perfection;
        this.buy = buy;
    }

  

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public category getCategory() {
        return category;
    }

    public void setCategory(category category) {
        this.category = category;
    }

    

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getStone() {
        return stone;
    }

    public void setStone(String stone) {
        this.stone = stone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPerfection() {
        return perfection;
    }

    public void setPerfection(String perfection) {
        this.perfection = perfection;
    }

    public int getBuy() {
        return buy;
    }

    public void setBuy(int buy) {
        this.buy = buy;
    }
}

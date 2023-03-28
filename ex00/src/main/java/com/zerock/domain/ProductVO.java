package com.zerock.domain;

public class ProductVO {
	
	private String name;
	private double price;
	
	
	// 생성자
	public ProductVO(String name, double price) {
		super();
		this.name = name;
		this.price = price;
	}
	
	//getter
	public String getName() {
		return name;
	}
	
	public double getPrice() {
		return price;
	}
	
	//toString
	@Override
	public String toString() {
		return "ProductVO [name=" + name + ", price=" + price + "]";
	}

}

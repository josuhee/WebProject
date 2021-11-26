package dao;

import java.util.ArrayList;
import dto.Product;

public class ProductRepository {
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	
	public ProductRepository() {}
	
	public ProductRepository(ArrayList<Product> listOfProducts) {
		super();
		this.listOfProducts = listOfProducts;
	}
	
	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}

	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
}

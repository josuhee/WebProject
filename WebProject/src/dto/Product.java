package dto;

public class Product implements Comparable<Product>{
	private int id;
	private String p_name;
	private int price;
	private int cnt;
	private String seller;
	
	public Product() {}
	
	public Product(int id, String p_name, int price, int cnt, String seller) {
		super();
		this.id = id;
		this.p_name = p_name;
		this.price = price;
		this.cnt = cnt;
		this.seller = seller;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	
	public int compareTo(Product product) {
		return this.seller.compareTo(product.seller);
	}
}
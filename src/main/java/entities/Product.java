package entities;

public class Product {
String name;
int price;


public Product(String name2, int price2) {
	// TODO Auto-generated constructor stub
	this.name = name2;
	this.price = price2;
}
public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public int getPrice() {
	return price;
}

public void setPrice(int price) {
	this.price = price;
}


}

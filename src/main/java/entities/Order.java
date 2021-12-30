package entities;

public class Order {
String id,book_id,book_name,email,user_name,total_price,payment_method,address,zipcode;

public Order(String id, String book_id, String book_name, String email, String user_name, String total_price,
		String payment_method, String address, String zipcode) {
	super();
	this.id = id;
	this.book_id = book_id;
	this.book_name = book_name;
	this.email = email;
	this.user_name = user_name;
	this.total_price = total_price;
	this.payment_method = payment_method;
	this.address = address;
	this.zipcode = zipcode;
}

public String getId() {
	return id;
}

public void setId(String id) {
	this.id = id;
}

public String getBook_id() {
	return book_id;
}

public void setBook_id(String book_id) {
	this.book_id = book_id;
}

public String getBook_name() {
	return book_name;
}

public void setBook_name(String book_name) {
	this.book_name = book_name;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getUser_name() {
	return user_name;
}

public void setUser_name(String user_name) {
	this.user_name = user_name;
}

public String getTotal_price() {
	return total_price;
}

public void setTotal_price(String total_price) {
	this.total_price = total_price;
}

public String getPayment_method() {
	return payment_method;
}

public void setPayment_method(String payment_method) {
	this.payment_method = payment_method;
}

public String getAddress() {
	return address;
}

public void setAddress(String address) {
	this.address = address;
}

public String getZipcode() {
	return zipcode;
}

public void setZipcode(String zipcode) {
	this.zipcode = zipcode;
}

}

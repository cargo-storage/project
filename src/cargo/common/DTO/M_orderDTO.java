package cargo.common.DTO;

import java.sql.Date;

public class M_orderDTO { // 아이템 단위로 들어감.
	
	int no, price, quantity;
	String item, name, category, email;
	Date date;
	
	public M_orderDTO() {
	}
	
	public M_orderDTO(int no, int price, int quantity, String item, String name, String category, String email,
			Date date) {
		super();
		this.no = no;
		this.price = price;
		this.quantity = quantity;
		this.item = item;
		this.name = name;
		this.category = category;
		this.email = email;
		this.date = date;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
	
}

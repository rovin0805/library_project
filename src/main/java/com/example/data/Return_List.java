package com.example.data;

import java.sql.Date;

public class Return_List {

	private String Book_name;
	private String return_date;
	private Long extend_confirm;
	
	public Return_List(String Book_name,String return_date,Long extend_confirm) {
		this.Book_name=Book_name;
		this.return_date=return_date;
		this.extend_confirm=extend_confirm;
		
	}

	public String getBook_name() {
		return Book_name;
	}

	public void setBook_name(String book_name) {
		Book_name = book_name;
	}

	public String getReturn_date() {
		return return_date;
	}

	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}

	public Long getExtend_confirm() {
		return extend_confirm;
	}

	public void setExtend_confirm(Long extend_confirm) {
		this.extend_confirm = extend_confirm;
	}
	
	
	
}
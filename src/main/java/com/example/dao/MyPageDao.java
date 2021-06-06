package com.example.dao;

import java.sql.ResultSet;
import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

import com.example.data.Book;
import com.example.data.Return_List;

public class MyPageDao {
	private JdbcTemplate jdbcTemplate;
	public MyPageDao(DataSource dataSource) {
	this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	public List<Return_List> selectReturnAll(String member_id) {//전부다 고르는거
	List<Return_List> results = jdbcTemplate.query(("select book.book_name,borrow_list.book_return_date,extend_confirm from borrow_list Inner join book on borrow_list.book_id=book.book_id where borrow_list.member_id='"+member_id+"';"),
	(ResultSet rs, int rowNum) -> {
		Return_List turn=new Return_List(rs.getString("Book_name"), rs.getString("book_return_date"), rs.getLong("extend_confirm"));
		turn.setBook_name(rs.getString("Book_name"));
	
	return turn;

	});
	return results;
	}
	
}

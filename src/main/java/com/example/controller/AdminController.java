package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dao.AdminDao;
import com.example.dao.BookDao;
import com.example.data.Book;
import com.example.data.Member;

@Controller
public class AdminController {

	@Autowired
	private BookDao bookDao;
	
	@Autowired
	private AdminDao adminDao;
	
	//관리자 페이지 책 기능 (책 생성,수정,삭제)///////////////////////////////////////////////////////////////// 
	
	@GetMapping("/admin/bookInsertPage")
	public String BookInsertPage() {
		return "admin/bookInsertPage";
	}
	 
	
	@RequestMapping("/admin/bookInsert")
	public String bookInsert(@RequestParam("admin_id") Long book_id,
			@RequestParam("book_name") String book_name,
			@RequestParam("writer") String writer,
			@RequestParam("publisher") String publisher,
			@RequestParam("genre") String genre,
			@RequestParam("story") String story,
			@RequestParam("image") String image_thing,Model model) {
        Book newbook = new Book(book_id,book_name,writer,publisher,(long) 0,genre,story,image_thing);
        
        String book_insert=adminDao.insert(newbook);
		
        model.addAttribute("book", book_insert);
        
		return "/admin/bookInsert";
	}
	
}

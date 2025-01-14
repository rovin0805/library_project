<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<HTML>
  <HEAD>
    <TITLE> LIBARAY </TITLE>
    <style>
      body {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        background-color: whitesmoke;
        width: 100%;
        margin: 0;
        height: 100vh;
      }
      header {
        width: 50%;
        display: flex;
        align-items: center;
        justify-content: space-between;
        background-color: #fff;
        padding: 30px;
        box-sizing: border-box;
      }
      a {
        text-decoration: none;
        color: black;
      }
      .background {
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        background-image: url(https://images.unsplash.com/photo-1562932831-afcfe48b5786?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzR8fGxpYnJhcnl8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60);
        width: 100%;
        height: 500px;
        opacity: 0.7;
        /* width: 100%;
        height: 400px; */
        /* overflow: hidden; */
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
      }
      .background > img {
        position: absolute;
        width: 100%;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
      }
      .board {
        background-color: #fff;
        box-sizing: border-box;
        width: 50%;
        height: 35.3vh;
        padding: 30px;
        display: flex;
        /* align-items: center; */
        /* justify-content: space-around; */
        font-size: 20px;
      }
      .title {
        font-size: 50px;
        font-weight: bold;
        color: #ff6d00;
        margin: 20px 0;
      }
      .subTitle {
        font-size: 15px;
        font-weight: bold;
        color: rgb(83, 77, 77);
        margin: 0 10px;
      }
      ul {
        padding: 0;
      }
      li {
        margin-bottom: 10px;
        display: flex;
        justify-content: space-between;
      }
      .notice,
      .thisMonth {
        margin: 10px 15px;
        width: 50%;
      }
      .boardTitle {
        font-size: 25px;
        font-weight: bold;
        border-bottom: 3px solid #ff6d00;
      }
      .search,
      .login,
      .signup {
        font-size: 17px;
        font-weight: bold;
      }
      .login {
        margin-right: 10px;
      }
      input[type="text"] {
        padding: 5px;
        border-radius: 10px;
        width: 250px;
        outline: none;
      }
      input[type="submit"] {
        padding: 5px 10px;
        background-color: #ff6d00;        
        color: white;
        border: none;
        cursor: pointer;
      }
      label {
        font-size: 20px;
      }
      footer {
        width: 50%;
        background-color: white;
        padding: 30px 0;
        display: flex;
        align-items: center;
        justify-content: center;
        border-top: 1px solid lightgray;
      }
      .date {
        color: rgb(83, 77, 77);
      }
    </style>
  </HEAD>
  <body>  
    <header>
      <form action="/search/searchBook" method="POST" class="search">
        <label style="display: block">
          🔎
          <input type="text" name="keyword" />
          <input type="submit" value="검색" />
        </label>
      </form>
      <div class="user">
        <%
        	String id = (String)session.getAttribute("id");
        	String admin = (String)session.getAttribute("admin");
        	if(id == null && admin==null) { %>
		        <span class="login">
		          <a href="/login/login">로그인</a>
		        </span>
		        <span class="signup">
		          <a href="/register/step2">회원가입</a>
		        </span> <%
	        } else if(admin != null &&id==null) { %> 
 	        	<span class="login">
		          <a href="/admin/adminPage?admin_id=<%out.print(admin);%>">관리자페이지</a>
		        </span>
		        <span class="signup">
		          <a href="/login/logout">로그아웃</a>
		        </span> <%    	        	
	        }
        	else if(admin == null &&id!=null) { %>
	        	<span class="login">
		          <a href="/session/mypage?member_id=<%out.print(id);%>">마이페이지</a>
		        </span>
		        <span class="signup">
		          <a href="/login/logout">로그아웃</a>
		        </span> <%
	        } %>
      </div>
    </header>
    <div class="background">
      <!-- <img
        src="https://images.unsplash.com/photo-1507842217343-583bb7270b66?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bGlicmFyeXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
        alt=""
      /> -->
      <div class="title">Spring Library</div>
    </div>
    <div class="board">
      <div class="notice">
        <div class="boardTitle">공지사항</div>
        <ul>
        	<c:forEach var="notice" items="${notice}" varStatus="status">
	          <li>
	            <a href="http://localhost:9200/notice?notice_id=${notice.notice_id}">▪ ${notice.notice_title}</a>
	            <span class="date">${notice.notice_date}</span>
	          </li>        	
        	</c:forEach>
        </ul>
      </div>
      <div class="thisMonth">
        <div class="boardTitle">이번달 소식</div>
        <ul>
          <li>
            <a href="/bestSeller"
              >▪ 인기 도서</a
            >
            <span class="date">2021-06-01</span>
          </li>
          <li>
            <a href="/newBooks">▪ 신작</a>
            <span class="date">2021-06-01</span>
          </li>
        </ul>
      </div>
    </div>
    <footer>
      <span class="subTitle">2017301080 최은정</span>
      <span class="subTitle">2017301004 김가은</span>
    </footer>
  </body>
</HTML>

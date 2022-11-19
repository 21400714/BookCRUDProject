<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.book.bean.BookVO" %>
<%@ page import="com.book.dao.BookDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>서적 정보</title>
</head>
<body>
<%
    BookDAO bookDAO = new BookDAO();
    String id=request.getParameter("id");
    BookVO u= bookDAO.getOne(Integer.parseInt(id));
    request.setAttribute("vo", u);
%>
<h1>서적 정보 보기</h1>
<table id="edit">
    <tr>
        <td>Photo</td><td><c:if test="${vo.getPhoto() ne ''}"><br />
        <img src="${pageContext.request.contextPath}/upload/${vo.getPhoto()}" class="photo"></c:if></td>
    </tr>
    <tr>
        <td>Title</td><td>${vo.getTitle()}</td>
    </tr>
    <tr>
        <td>Writer</td><td>${vo.getWriter()}</td>
    </tr>
    <tr>
        <td>Publisher</td><td>${vo.getPublisher()}</td>
    </tr>
    <tr>
        <td>Price</td><td>${vo.getPrice()}</td>
    </tr>
    <tr>
        <td>Pages</td><td>${vo.getPages()}</td>
    </tr>
    <tr>
        <td>Sizes</td><td>${vo.getSizes()}</td>
    </tr>
    <tr>
        <td>Weight</td><td>${vo.getWeight()}</td>
    </tr>
    <tr>
        <td>Topic</td><td>${vo.getTopic()}</td>
    </tr>
</table>
<button type="button" onclick="history.back()">뒤로 가기</button>
<button type="button" onclick="location.href='editform.jsp?id=${vo.getSid()}'">서적 수정</button>
</body>
</html>

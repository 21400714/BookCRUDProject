<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.book.bean.BookVO" %>
<%@ page import="com.book.dao.BookDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Book</title>
    <link rel="stylesheet" type="text/css" href="book.css">
</head>
<body>
<%
    BookDAO bookDAO = new BookDAO();
    String id=request.getParameter("id");
    BookVO u= bookDAO.getOne(Integer.parseInt(id));
    request.setAttribute("vo", u);
%>
<h1>View Book</h1>
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
<button type="button" class="button button4" onclick="history.back()">Back</button>
<button type="button" class="button button2" onclick="location.href='editform.jsp?id=${vo.getSid()}'">Edit</button>
</body>
</html>

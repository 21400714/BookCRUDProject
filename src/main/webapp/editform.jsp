<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.book.bean.BookVO" %>
<%@ page import="com.book.dao.BookDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>서적 수정</title>
</head>
<body>
<%
    BookDAO bookDAO = new BookDAO();
    String id = request.getParameter("id");
    BookVO u = bookDAO.getOne(Integer.parseInt(id));
    request.setAttribute("vo", u);
%>
<h1>서적 정보 수정</h1>
<form action="edit_ok.jsp" method="post" enctype="multipart/form-data">
    <input type="hidden" name="sid" value="${vo.getSid()}"/>
    <table id="edit">
        <tr>
            <td>Photo</td><td><input type="file" name="photo" value="${vo.getPhoto()}" />
            <c:if test="${vo.getPhoto() ne ''}"><br /><img src="${pageContext.request.contextPath}/upload/${vo.getPhoto()}" class="photo"></c:if></td>
        </tr>
        <tr>
            <td>Title</td><td><input type="text" name="title" value="${vo.getTitle()}" /></td>
        </tr>
        <tr>
            <td>Writer</td><td><input type="text" name="writer" value="${vo.getWriter()}" /></td>
        </tr>
        <tr>
            <td>Publisher</td><td><input type="text" name="publisher" value="${vo.getPublisher()}" /></td>
        </tr>
        <tr>
            <td>Price</td><td><input type="text" name="price" value="${vo.getPrice()}" /></td>
        </tr>
        <tr>
            <td>Pages</td><td><input type="text" name="pages" value="${vo.getPages()}" /></td>
        </tr>
        <tr>
            <td>Sizes</td><td><input type="text" name="sizes" value="${vo.getSizes()}" /></td>
        </tr>
        <tr>
            <td>Weight</td><td><input type="text" name="weight" value="${vo.getWeight()}" /></td>
        </tr>
        <tr>
            <td>Topic</td><td><input type="text" name="topic" value="${vo.getTopic()}" /></td>
        </tr>
    </table>
    <button type="button" onclick="history.back()">뒤로 가기</button>
    <button type="submit">서적 수정</button>
</form>
</body>
</html>

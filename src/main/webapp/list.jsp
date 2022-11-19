<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.book.bean.BookVO" %>
<%@ page import="com.book.dao.BookDAO" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Books</title>
    <link rel="stylesheet" type="text/css" href="book.css">
    <script>
        function delete_ok(id){
            var a = confirm("정말로 삭제하겠습니까?");
            if (a) location.href='delete_ok.jsp?id=' + id;
        }
    </script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>
<body>
<h1>Books</h1>
<%
    BookDAO bookDAO = new BookDAO();
    List<BookVO> list = bookDAO.getList();
    request.setAttribute("list", list);
%>
<button type="button" class="button button4" id="add" onclick="location.href='addform.jsp'">Add</button>
<table id="list" width="90%">
    <tr>
        <th>INDEX</th>
        <th>PHOTO</th>
        <th>TITLE</th>
        <th>WRITER</th>
        <th>PUBLISHER</th>
        <th>PRICE</th>
        <th>REGISTER DATE</th>
        <th colspan="3">MENU</th>
    </tr>
    <c:forEach items="${list}" var="u" varStatus="status">
        <tr>
            <td>${fn:length(list)-status.index}</td>
            <td><img src="${pageContext.request.contextPath}/upload/${u.getPhoto()}"></td>
            <td>${u.getTitle()}</td>
            <td>${u.getWriter()}</td>
            <td>${u.getPublisher()}</td>
            <td>${u.getPrice()}</td>
            <td>${u.getRegdate()}</td>
            <td><a class="fas fa-eye" href="view.jsp?id=${u.getSid()}"></a></td>
            <td><a class="fas fa-edit" href="editform.jsp?id=${u.getSid()}"></a></td>
            <td><a class="fas fa-trash" href="javascript:delete_ok('${u.getSid()}')"></a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
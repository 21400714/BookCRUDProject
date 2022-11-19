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
    <title>free board</title>
    <style>
        #list {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        #list td, #list th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align:center;
        }
        #list tr:nth-child(even){background-color: #f2f2f2;}
        #list tr:hover {background-color: #ddd;}
        #list th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #006bb3;
            color: white;
        }
    </style>
    <script>
        function delete_ok(id){
            var a = confirm("정말로 삭제하겠습니까?");
            if (a) location.href='delete_ok.jsp?id=' + id;
        }
    </script>
</head>
<body>
<h1>서적 목록</h1>
<%
    BookDAO bookDAO = new BookDAO();
    List<BookVO> list = bookDAO.getList();
    request.setAttribute("list", list);
%>
<table id="list" width="90%">
    <tr>
        <th>INDEX</th>
        <th>PHOTO</th>
        <th>TITLE</th>
        <th>WRITER</th>
        <th>PUBLISHER</th>
        <th>PRICE</th>
        <th>REGISTER DATE</th>
        <th>VIEW</th>
        <th>EDIT</th>
        <th>DELETE</th>
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
            <td><a href="view.jsp?id=${u.getSid()}">VIEW</a></td>
            <td><a href="editform.jsp?id=${u.getSid()}">EDIT</a></td>
            <td><a href="javascript:delete_ok('${u.getSid()}')">DELETE</a></td>
        </tr>
    </c:forEach>
</table>
<br/><a href="addform.jsp">ADD NEW BOOK</a>
</body>
</html>
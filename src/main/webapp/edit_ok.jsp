<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.book.bean.BookVO" %>
<%@ page import="com.book.dao.BookDAO" %>
<%@ page import="com.book.common.FileUpload" %>
<%
    request.setCharacterEncoding("UTF-8");
    BookDAO bookDAO = new BookDAO();
    FileUpload upload = new FileUpload();
    BookVO u = upload.uploadPhoto(request);

    int i = bookDAO.updateBook(u);
    String msg = "서적 수정에 성공했습니다.";
    if (i == 0) msg = "서적 수정에 실패했습니다.";
%>

<script>
    alert('<%=msg%>');
    location.href='list.jsp';
</script>
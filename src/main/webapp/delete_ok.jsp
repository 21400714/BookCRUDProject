<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.book.bean.BookVO" %>
<%@ page import="com.book.dao.BookDAO" %>
<%@ page import="com.book.common.FileUpload" %>
<%
    String sid = request.getParameter("id");
    if (sid != "") {
        int id = Integer.parseInt(sid);
        BookDAO bookDAO = new BookDAO();
        String filename = bookDAO.getPhotoFilename(id);
        if (filename != null)
            FileUpload.deleteFile(request, filename);
        bookDAO.deleteBook(id);
    }
    response.sendRedirect("list.jsp");
%>
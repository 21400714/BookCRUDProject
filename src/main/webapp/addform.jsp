<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>서적 추가</title>

</head>
<body>
<h1>신규 서적 추가</h1>
<form action="add_ok.jsp" method="post" enctype="multipart/form-data">
    <table id="edit">
        <tr>
            <td>Photo</td><td><input type="file" name="photo" /></td>
        </tr>
        <tr>
            <td>Title</td><td><input type="text" name="title" /></td>
        </tr>
        <tr>
            <td>Writer</td><td><input type="text" name="writer" /></td>
        </tr>
        <tr>
            <td>Publisher</td><td><input type="text" name="publisher" /></td>
        </tr>
        <tr>
            <td>Price</td><td><input type="text" name="price" /></td>
        </tr>
        <tr>
            <td>Pages</td><td><input type="text" name="pages" /></td>
        </tr>
        <tr>
            <td>Sizes</td><td><input type="text" name="sizes" /></td>
        </tr>
        <tr>
            <td>Weight</td><td><input type="text" name="weight" /></td>
        </tr>
        <tr>
            <td>Topic</td><td><input type="text" name="topic" /></td>
        </tr>
    </table>
    <button type="button" onclick="location.href='list.jsp'">목록 보기</button>
    <button type="submit">서적 추가</button>
</form>

</body>
</html>

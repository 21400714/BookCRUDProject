/*
    MySQL 데이터베이스에서 실행하기 위한 CRUD 쿼리를 구현한 클래스입니다.
*/

package com.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.book.bean.BookVO;
import com.book.common.JDBCUtil;

public class BookDAO {
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;

    private final String BOOK_INSERT = "insert into book(photo, title, writer, publisher, price, pages, sizes, weight, topic) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private final String BOOK_UPDATE = "update book set photo=?, title=?, writer=?, publisher=?, price=?, pages=?, sizes=?, weight=?, topic=? where sid=?";
    private final String BOOK_DELETE = "delete from book where sid=?";
    private final String BOOK_SELECT = "select * from book where sid=?";
    private final String BOOK_LIST = "select * from book order by regdate desc";

    public int insertBook(BookVO data) {
        int result = 0;
        conn = JDBCUtil.getConnection();
        try {
            stmt = conn.prepareStatement(BOOK_INSERT);
            stmt.setString(1, data.getPhoto());
            stmt.setString(2, data.getTitle());
            stmt.setString(3, data.getWriter());
            stmt.setString(4, data.getPublisher());
            stmt.setString(5, data.getPrice());
            stmt.setString(6, data.getPages());
            stmt.setString(7, data.getSizes());
            stmt.setString(8, data.getWeight());
            stmt.setString(9, data.getTopic());
            result = stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public int updateBook(BookVO data) {
        conn = JDBCUtil.getConnection();
        try {
            stmt = conn.prepareStatement(BOOK_UPDATE);
            stmt.setString(1, data.getPhoto());
            stmt.setString(2, data.getTitle());
            stmt.setString(3, data.getWriter());
            stmt.setString(4, data.getPublisher());
            stmt.setString(5, data.getPrice());
            stmt.setString(6, data.getPages());
            stmt.setString(7, data.getSizes());
            stmt.setString(8, data.getWeight());
            stmt.setString(9, data.getTopic());
            stmt.setInt(10, data.getSid());
            stmt.executeUpdate();
            return 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void deleteBook(int sid) {
        conn = JDBCUtil.getConnection();
        try {
            stmt = conn.prepareStatement(BOOK_DELETE);
            stmt.setInt(1, sid);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public BookVO getOne(int sid) {
        BookVO one = null;
        conn = JDBCUtil.getConnection();
        try {
            stmt = conn.prepareStatement(BOOK_SELECT);
            stmt.setInt(1, sid);
            rs = stmt.executeQuery();
            if (rs.next()) {
                one = new BookVO();
                one.setSid(rs.getInt("sid"));
                one.setPhoto(rs.getString("photo"));
                one.setTitle(rs.getString("title"));
                one.setWriter(rs.getString("writer"));
                one.setPublisher(rs.getString("publisher"));
                one.setPrice(rs.getString("price"));
                one.setPages(rs.getString("pages"));
                one.setSizes(rs.getString("sizes"));
                one.setWeight(rs.getString("weight"));
                one.setTopic(rs.getString("topic"));
                one.setRegdate(rs.getDate("regdate"));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return one;
    }

    public ArrayList<BookVO> getList() {
        ArrayList<BookVO> list = null;
        conn = JDBCUtil.getConnection();
        try {
            stmt = conn.prepareStatement(BOOK_LIST);
            rs = stmt.executeQuery();
            list = new ArrayList<BookVO>();
            BookVO one = new BookVO();
            while (rs.next()) {
                one = new BookVO();
                one.setSid(rs.getInt("sid"));
                one.setPhoto(rs.getString("photo"));
                one.setTitle(rs.getString("title"));
                one.setWriter(rs.getString("writer"));
                one.setPublisher(rs.getString("publisher"));
                one.setPrice(rs.getString("price"));
                one.setPages(rs.getString("pages"));
                one.setSizes(rs.getString("sizes"));
                one.setWeight(rs.getString("weight"));
                one.setTopic(rs.getString("topic"));
                one.setRegdate(rs.getDate("regdate"));
                list.add(one);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public String getPhotoFilename(int sid) {
        String filename = null;
        conn = JDBCUtil.getConnection();
        try {
            stmt = conn.prepareStatement(BOOK_SELECT);
            stmt.setInt(1, sid);
            rs = stmt.executeQuery();
            if (rs.next()) {
                filename = rs.getString("photo");
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return filename;
    }
}

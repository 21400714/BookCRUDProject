/*
    MySQL 접속 기능을 수행하는 클래스입니다.
*/

package com.book.common;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCUtil {
    public static Connection getConnection(){
        Connection con = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://walab.handong.edu:3306/p3_21400714","p3_21400714","pu0ohKohph");
        }catch(Exception e){
            System.out.println(e);
        }
        return con;
    }

//	public static void main(String ars[]) {
//		Connection conn = getConnection();
//		if(conn != null)
//			System.out.println("DB 연결에 성공했습니다.");
//		else
//			System.out.println("DB 연결에 실패했습니다.");
//	}
}
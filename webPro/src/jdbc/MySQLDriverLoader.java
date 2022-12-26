package jdbc;

import javax.servlet.http.HttpServlet;

//웹 어플리케이션 구동시 jdbc(mysql driver) 로딩하기
public class MySQLDriverLoader extends HttpServlet{
	
	public void init() {
		//jdbc 드라이버 등록
		try {
			Class.forName("com.mysql.jdbc.Driver"); //mysql 드라이버
			System.out.println("jdbc 드라이버 등록 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException");
			e.printStackTrace();
		}
	}

}

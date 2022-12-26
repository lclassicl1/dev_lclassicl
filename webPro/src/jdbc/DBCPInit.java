package jdbc;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

public class DBCPInit extends HttpServlet {

	@Override
	public void init() throws ServletException { //웹 어플리케이션 시작시 단 한번만 호출이 되는 init method
		System.out.println("init메소드 호출");
		loadJDBCDriver();
		initConnectionPool();
	}
	@Override
	//get방식으로 요청시 호출
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doget");
		super.doGet(req, resp);
	}
	
	
	@Override
	//post 방식으로 요청시 호출
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("dopost");
		super.doPost(req, resp);
	}
	
	
	@Override
	public void destroy() { //종료시 호출되는 method
		System.out.println("destroy 호출");
		super.destroy();
	}

	
	private void loadJDBCDriver() {
		try {
			Class.forName("com.mysql.jdbc.Driver"); //mysql 드라이버
			System.out.println("DBCPInit 드라이버 등록 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException");
			e.printStackTrace();
		}
	}


	private void initConnectionPool() {
		String jdbcUrl = "jdbc:mysql://localhost:3306/chap14?useUnicode=true&characterEncoding=utf8";
		String username = "jspexam";
		String pw = "jsppw";
		
			try {
				ConnectionFactory connFactory = new DriverManagerConnectionFactory(jdbcUrl, username, pw);
		
		
				PoolableConnectionFactory poolableConnFactory = new PoolableConnectionFactory(connFactory, null);
				poolableConnFactory.setValidationQuery("select 1");

		         GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
		         poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
		         poolConfig.setTestWhileIdle(true);
		         poolConfig.setMinIdle(4);
		         poolConfig.setMaxTotal(50);
	
		         GenericObjectPool<PoolableConnection> connectionPool = new GenericObjectPool<>(poolableConnFactory, poolConfig);
		         poolableConnFactory.setPool(connectionPool);
	         
		         Class.forName("org.apache.commons.dbcp2.PoolingDriver");
		         PoolingDriver driver = 
		               (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
		         driver.registerPool("chap14", connectionPool);
		      } catch (Exception e) {
		         throw new RuntimeException(e);
		      }
	}
	
}

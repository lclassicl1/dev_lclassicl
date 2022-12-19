package dateEx;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Date_Ex02_SimpleDateFormat {
	public static void main(String[] args) {
		
		//Date클래스 객체 생성
		Date today = new Date();
		
		//무엇을 어떻게 적용할건지 format을 정하는 과정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String strDate = sdf.format(today);
		System.out.println("today = "+today);
		System.out.println(sdf.format(today));
		
		sdf = new SimpleDateFormat("h:mm a");
		System.out.println("h:mm a=>"+sdf.format(today));
		
		sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println("yyyy-MM-dd HH:mm:ss=>"+sdf.format(today));
		
		sdf = new SimpleDateFormat("yyyy-Www-u");
		System.out.println("yyyy-Www-u=>"+sdf.format(today));
		
		sdf = new SimpleDateFormat("오늘은 E요일");
		System.out.println("오늘은 E요일=>"+sdf.format(today));
		
		sdf = new SimpleDateFormat("올해의 D번째날");
		System.out.println("올해의 D번째날=>"+sdf.format(today));
		
		sdf = new SimpleDateFormat("이달의 d번째날");
		System.out.println("이달의 d번째날=>"+sdf.format(today));
		
	}
}

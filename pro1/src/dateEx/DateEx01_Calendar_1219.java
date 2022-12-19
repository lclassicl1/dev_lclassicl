package dateEx;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateEx01_Calendar_1219 {
	public static void main(String[] args) {
		
		Calendar cal = Calendar.getInstance();
		/* Calendar 클래스는 추상클래스이므로 객체 생성이 아닌 직접 선언방식으로 불러와야한다.
		 	생성자는 존재하지만 객체 생성 방법이 다른 클래스와는 다르다*/
		System.out.println(cal);
		System.out.println(cal.get(cal.YEAR)); //년
		System.out.println(cal.get(1)); //Calendar.YEAR : 1
		System.out.println(cal.get(cal.MONTH)); //월
		System.out.println(cal.get(2)+1); //Calendar.MONTH : 2
		System.out.println(cal.get(cal.DATE)); //날짜
		System.out.println(cal.getTime());
		
		
		System.out.println(cal.get(cal.DAY_OF_WEEK)); //요일
		System.out.println(cal.get(cal.HOUR)); // 시간
		System.out.println(cal.get(cal.WEEK_OF_MONTH)); //번째주
		
		
		
		
		
		
		/*
		 * // Date date = new Date(); // System.out.println(date); // //
		 * System.out.println("getYear()="+date.getYear()); //1900년 기준으로 지난년도를 출력 따라서
		 * 반환되는 숫자 + 1900 해줘야 현재 년도 출력 //
		 * System.out.println("getNowYear()"+(date.getYear()+1900)); // // String
		 * nowMonth = ""; // switch(date.getMonth()) { // case 0: nowMonth = "1월"; //
		 * break; // case 1: nowMonth = "2월"; // break; // case 2: nowMonth = "3월"; //
		 * break; // case 3: nowMonth = "4월"; // break; // case 4: nowMonth = "5월"; //
		 * break; // case 5: nowMonth = "6월"; // break; // case 6: nowMonth = "7월"; //
		 * break; // case 7: nowMonth = "8월"; // break; // case 8: nowMonth = "9월"; //
		 * break; // case 9: nowMonth = "10월"; // break; // case 10: nowMonth = "11월";
		 * // break; // case 11: nowMonth = "12월"; // break; // } // //
		 * System.out.println("getMonth()="+nowMonth); // // // String nowDay = ""; //
		 * // switch(date.getDay()) { // case 0: nowDay = "일요일"; // break; // case 1:
		 * nowDay = "월요일"; // break; // case 2: nowDay = "화요일"; // break; // case 3:
		 * nowDay = "수요일"; // break; // case 4: nowDay = "목요일"; // break; // case 5:
		 * nowDay = "금요일"; // break; // case 6: nowDay = "토요일"; // break; // // } // //
		 * System.out.println("getDay()="+nowDay); //
		 * System.out.println("getDate()="+date.getDate()); //
		 * System.out.println("getHours()="+date.getHours()); //
		 * System.out.println("getMinutes()="+date.getMinutes()); //
		 * System.out.println("getSeconds()="+date.getSeconds()); //
		 * System.out.println("getTime()="+date.getTime()); //
		 * System.out.println("getTimezoneffset()="+date.getTimezoneOffset());
		 */		
		
	}
}

package dateEx;

import java.util.Date;

public class DateEx01_1219 {
	public static void main(String[] args) {
		Date date = new Date();
		System.out.println(date);
		
		System.out.println("getYear()="+date.getYear()); //1900년 기준으로 지난년도를 출력 따라서 반환되는 숫자 + 1900 해줘야 현재 년도 출력
		System.out.println("getNowYear()"+(date.getYear()+1900));
		
		String nowMonth = "";
		switch(date.getMonth()) {
			case 0: nowMonth = "1월";
				break;
			case 1: nowMonth = "2월";
				break;
			case 2: nowMonth = "3월";
				break;
			case 3: nowMonth = "4월";
				break;
			case 4: nowMonth = "5월";
				break;
			case 5: nowMonth = "6월";
				break;
			case 6: nowMonth = "7월";
				break;
			case 7: nowMonth = "8월";
				break;
			case 8: nowMonth = "9월";
				break;
			case 9: nowMonth = "10월";
				break;
			case 10: nowMonth = "11월";
				break;
			case 11: nowMonth = "12월";
				break;
		}
		
		System.out.println("getMonth()="+nowMonth);
		
		
		String nowDay = "";
		
		switch(date.getDay()) {
			case 0: nowDay = "일요일";
				break;
			case 1: nowDay = "월요일";
				break;
			case 2: nowDay = "화요일";
				break;
			case 3: nowDay = "수요일";
				break; 
			case 4: nowDay = "목요일";
				break;
			case 5: nowDay = "금요일";
				break;
			case 6: nowDay = "토요일";
				break;
			
		}
		
		System.out.println("getDay()="+nowDay);
		System.out.println("getDate()="+date.getDate());
		System.out.println("getHours()="+date.getHours());
		System.out.println("getMinutes()="+date.getMinutes());
		System.out.println("getSeconds()="+date.getSeconds());
		System.out.println("getTime()="+date.getTime());
		System.out.println("getTimezoneffset()="+date.getTimezoneOffset());
		
		
	}
}

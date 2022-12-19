package dateEx;

import java.text.DecimalFormat;

public class DecimalFormat_1219 {
	//decimal format 숫자형식 클래스
	
	public static void main(String[] args) {
		double n = 1234567.89;
		
		DecimalFormat df = new DecimalFormat("0");
		System.out.println("=>"+df.format(n));
		
		df = new DecimalFormat("0.0");
		System.out.println("=>"+df.format(n));
		
		df = new DecimalFormat("#");
		System.out.println("=>"+df.format(n));
		
		df = new DecimalFormat("#.#");
		System.out.println("=>"+df.format(n));
		
		df = new DecimalFormat("#.0");
		System.out.println("=>"+df.format(n));
		
		df = new DecimalFormat("+#.0");
		System.out.println("=>"+df.format(n));
		
		
	}
}

package common;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class AgeCalculator {
	public String ageCal(String myAge) {
		Calendar gc = new GregorianCalendar();
		// 현재날짜 구하기
		long l = gc.getTimeInMillis();
		Date d = new Date(l);
		
		// 현재년도 4자리
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY");
		// 현재년도 2자리
		SimpleDateFormat sdf2 = new SimpleDateFormat("YY");

		// 주민 앞자리 2자리
		String age = myAge.substring(0, 2);
		String sysdate = sdf.format(d);
		
		System.out.println(sysdate);
		if (Integer.parseInt(age) > Integer.parseInt(sdf2.format(d))) {
			age = "19" + age;
			age = (Integer.parseInt(sysdate) - Integer.parseInt(age) + 1) + "";
		} else {
			age = "20" + age;
			age = (Integer.parseInt(sysdate) - Integer.parseInt(age) + 1) + "";
		}
		return age;
	}
}

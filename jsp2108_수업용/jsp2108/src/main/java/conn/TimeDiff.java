package conn;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TimeDiff {
	public int timeDiff(String wCdate) {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
		String strToday = sdf.format(cal.getTime());
		
		Date today = null;
		try {
			today = sdf.parse(strToday);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		String strWCdate = wCdate.substring(0, 4) + wCdate.substring(5, 7) + wCdate.substring(8, 10) + wCdate.substring(11, 13) + wCdate.substring(14, 16);

		Date dateWdate = null;
		try {
			dateWdate = sdf.parse(strWCdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		long diffTime = today.getTime() - dateWdate.getTime();
		
		return (int) diffTime * 3600000 + 1;
	}
}

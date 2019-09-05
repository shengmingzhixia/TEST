
package cgy.utils;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


public class GetUnWeekendDays {

    //返回上个月月工作日数
    public static int getAttendance() throws Exception {
        Calendar cale = Calendar.getInstance();
        cale.set(Calendar.DAY_OF_MONTH, 0);
        int count = 0;
        int UnWeek;
        Date date = cale.getTime();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String NowDate = df.format(date);

        String Days = NowDate.substring(8, 10);

        String item = Days.substring(0, 1);
        if (item.equals("0")) {
            Days = Days.substring(1, 2);
        }

        DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
        String strDate = NowDate.substring(0, 10);
        //String strDate = "2016-10-10";	//test by Jiro.Chen

        String item1 = strDate.substring(0, 8);
        String item2 = strDate.substring(8, 10);

        for (int i = 1; i <= Integer.parseInt(item2); i++) {
            strDate = item1 + String.valueOf(i);

            Date dDate = format1.parse(strDate);
            Calendar cal = Calendar.getInstance();
            cal.setTime(dDate);
            if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY || cal.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
                //System.out.println("YES");
                count++;
            } else {
                //System.out.println("NO");
                continue;
            }
        }

        UnWeek = Integer.parseInt(item2) - count;

        return UnWeek;
    }

}


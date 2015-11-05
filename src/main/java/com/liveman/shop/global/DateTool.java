/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.liveman.shop.global;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
import java.util.regex.Pattern;

/**
 *
 * @author Alan Zeng
 */
public class DateTool {

    public static final String PATTERN_DATE_DAY = "yyyy-MM-dd";
    public static final String PATTERN_DATE_MONTH = "yyyy-MM";
    public static final String PATTERN_DATE_YEAR = "yyyy";
    public static final String REGEX_DAY = "^\\d{4}-\\d{1,2}-\\d{1,2}$";
    public static final String REGEX_MONTH = "^\\d{4}-\\d{1,2}$";
    public static final String REGEX_YEAR = "^\\d{4}$";

    public static Calendar parseStringToDate(String startDate) {
        boolean matchesYear = Pattern.matches(REGEX_YEAR, startDate);
        boolean matchesMonth = Pattern.matches(REGEX_MONTH, startDate);
        boolean matchesDay = Pattern.matches(REGEX_DAY, startDate);

        String dateString = PATTERN_DATE_DAY;
        if (matchesYear) {
            dateString = PATTERN_DATE_YEAR;
        } else if (matchesMonth) {
            dateString = PATTERN_DATE_MONTH;
        } else if (matchesDay) {
            dateString = PATTERN_DATE_DAY;
        }

        SimpleDateFormat dateFormat = new SimpleDateFormat(dateString);
        try {
            Date date = dateFormat.parse(startDate);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            if (matchesMonth) {
                String month = "" + Integer.parseInt(startDate.substring(startDate.indexOf("-") + 1));
                String mm = String.valueOf(calendar.get(Calendar.MONTH) + 1);
                if (!month.equals(mm)) {
                    return null;
                }
            }
            if (matchesDay) {
                String month = "" + Integer.parseInt(startDate.substring(startDate.indexOf("-") + 1, startDate.lastIndexOf("-")));
                String day = "" + Integer.parseInt(startDate.substring(startDate.lastIndexOf("-") + 1));
                String mm = String.valueOf(calendar.get(Calendar.MONTH) + 1);
                String dd = String.valueOf(calendar.get(Calendar.DAY_OF_MONTH));
                if (!month.equals(mm) || !day.equals(dd)) {
                    return null;
                }
            }
            return calendar;
        } catch (ParseException ex) {
            ex.getMessage();
        }
        return null;
    }

    public static String parseDateToString(Calendar calendar, String pattern) {
        SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
        return dateFormat.format(calendar.getTime());
    }

    /**
     * @return date in GMT+8:00
     */
    public static String getCurrentDate(String pattern) {
        return getCurrentZoneDate("GMT+8:00", pattern);
    }

    /**
     * @return yyyy-MM-dd GMT+8:00
     */
    public static String getCurrentDate() {
        return getCurrentDateCN();
    }

    /**
     * @return yyyy-MM-dd GMT+8:00
     */
    public static String getCurrentDateCN() {
        return getCurrentZoneDate("GMT+8:00", PATTERN_DATE_DAY);
    }

    /**
     * @return yyyy-MM-dd GMT+0:00
     */
    public static String getCurrentDateUK() {
        return getCurrentZoneDate("GMT+8:00", PATTERN_DATE_DAY);
    }

    /**
     * @return yyyy-MM-dd GMT-6:00
     */
    public static String getCurrentDateUS() {
        return getCurrentZoneDate("GMT-6:00", PATTERN_DATE_DAY);
    }

    /**
     * @return yyyy-MM-dd
     */
    public static String getCurrentZoneDate(String timeZoneID, String pattern) {
        SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
        if (timeZoneID != null && !timeZoneID.trim().equals("")) {
            dateFormat.setTimeZone(TimeZone.getTimeZone(timeZoneID));
        }
        Calendar calendar = Calendar.getInstance();
        String time = dateFormat.format(calendar.getTime());
        return time;
    }

    /**
     * @return yyyy-MM-dd HH:mm:ss GMT+8:00
     */
    public static String getCurrentTime() {
        return getCurrentZoneTime("GMT+8:00");
    }

    /**
     * @return yyyy-MM-dd HH:mm:ss GMT+8:00
     */
    public static String getCurrentTimeCN() {
        return getCurrentZoneTime("GMT+8:00");
    }

    /**
     * @return yyyy-MM-dd HH:mm:ss GMT+0:00
     */
    public static String getCurrentTimeUK() {
        return getCurrentZoneTime("GMT+0:00");
    }

    /**
     * @return yyyy-MM-dd HH:mm:ss GMT-6:00
     */
    public static String getCurrentTimeUS() {
        return getCurrentZoneTime("GMT-6:00");
    }

    /**
     * @return yyyy-MM-dd HH:mm:ss
     */
    public static String getCurrentZoneTime(String timeZoneID) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss zzz");
        if (timeZoneID != null && !timeZoneID.trim().equals("")) {
            dateFormat.setTimeZone(TimeZone.getTimeZone(timeZoneID));
        }
        Calendar calendar = Calendar.getInstance();
        String time = dateFormat.format(calendar.getTime());
        return time;
    }
    
    public static String getCurrentTimeNoZone(){
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	Calendar calendar = Calendar.getInstance();
        String time = dateFormat.format(calendar.getTime());
        return time;
    }

    public static int getTotalMonth(Calendar cMax, Calendar cMin) {
        return (cMax.get(Calendar.YEAR) - cMin.get(Calendar.YEAR)) * 12 - cMin.get(Calendar.MONTH) + cMax.get(Calendar.MONTH);
    }

    public static boolean checkDate(String regex, String pattern, String value) {
        boolean flag = true;
        if (value == null) {
            return false;
        }
        if (DateTool.parseStringToDate(value) == null) {
            return false;
        }
        if (Pattern.matches(regex, value)) {
            SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
            try {
                Date parse = dateFormat.parse(value);
            } catch (ParseException ex) {
                flag = false;
            }
        } else {
            flag = false;
        }
        return flag;
    }
}

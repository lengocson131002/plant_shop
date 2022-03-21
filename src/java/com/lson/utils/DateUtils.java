package com.lson.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DateUtils {

    private static List<SimpleDateFormat> sdfs = new ArrayList<>();

    static {
        sdfs.add(new SimpleDateFormat("dd/MM/yyyy"));
        sdfs.add(new SimpleDateFormat("yyyy-MM-dd"));
    }

    public static Date parse(String dateString) {
        Date date = null;
        for (SimpleDateFormat sdf : sdfs) {
            try {
                date = sdf.parse(dateString);
            } catch (Exception ex) {
            }
        }
        return date;
    }

    public static String format(Date date) {
        String dateString = null;
        for (SimpleDateFormat sdf : sdfs) {
            try {
                dateString = sdf.format(date);
            } catch (Exception ex) {
            }
        }
        return dateString;
    }
}

package org.loushang.ue.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * 时间工具类
 * 
 */
public class TimeUtil {
	// 长度为17的时间日期格式
	private static final SimpleDateFormat sdfDateTime = new SimpleDateFormat(
			"yyyyMMdd HH:mm:ss");

	/**
	 * 取得当前时间
	 * 
	 * @return
	 */
	public static synchronized String getCurrentDateTime() {
		return sdfDateTime.format(Calendar.getInstance().getTime());
	}
}

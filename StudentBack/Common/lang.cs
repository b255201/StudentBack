using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudentBack.Common
{
    public class lang
    {
        public class DateTimeUtil
        {
            #region ToYMD, 日期轉 yyyy/MM/dd
            /// <summary>
            /// 日期轉 yyyy/MM/dd
            /// </summary>
            /// <param name="dt">日期</param>
            /// <returns>已格式化字串</returns>
            public static string ToYMD(DateTime dt)
            {
                return dt.ToString("yyyy/MM/dd");
            }

            /// <summary>
            /// 日期轉 yyyy/MM/dd
            /// </summary>
            /// <param name="dt">日期或 NULL</param>
            /// <returns>已格式化字串或空字串</returns>
            public static string ToYMD(DateTime? dt)
            {
                if (dt.HasValue)
                    return dt.Value.ToString("yyyy/MM/dd");
                else
                    return "";
            }
            #endregion

            #region ToYMD_HMS, 日期轉 yyyy/MM/dd HH:mm:ss
            /// <summary>
            /// 日期轉 yyyy/MM/dd HH:mm:ss
            /// </summary>
            /// <param name="dt">日期</param>
            /// <returns>已格式化字串</returns>
            public static string ToYMD_HMS(DateTime dt)
            {
                return dt.ToString("yyyy/MM/dd HH:mm:ss");
            }

            /// <summary>
            /// 日期轉 yyyy/MM/dd HH:mm:ss
            /// </summary>
            /// <param name="dt">日期或 NULL</param>
            /// <returns>已格式化字串或空字串</returns>
            public static string ToYMD_HMS(DateTime? dt)
            {
                if (dt.HasValue)
                    return dt.Value.ToString("yyyy/MM/dd HH:mm:ss");
                else
                    return "";
            }
            #endregion

            #region ToYMD_HM, 日期轉 yyyy/MM/dd HH:mm
            /// <summary>
            /// 日期轉 yyyy/MM/dd HH:mm
            /// </summary>
            /// <param name="dt">日期</param>
            /// <returns>已格式化字串</returns>
            public static string ToYMD_HM(DateTime dt)
            {
                return dt.ToString("yyyy/MM/dd HH:mm");
            }

            /// <summary>
            /// 日期轉 yyyy/MM/dd HH:mm
            /// </summary>
            /// <param name="dt">日期或 NULL</param>
            /// <returns>已格式化字串或空字串</returns>
            public static string ToYMD_HM(DateTime? dt)
            {
                if (dt.HasValue)
                    return dt.Value.ToString("yyyy/MM/dd HH:mm");
                else
                    return "";
            }
            #endregion

            #region GetStartOfDay, 取得今天開始時間
            /// <summary>
            /// 取得今天開始時間
            /// </summary>
            /// <returns></returns>
            public static DateTime GetStartOfDay()
            {
                DateTime now = DateTime.Now;
                return new DateTime(now.Year, now.Month, now.Day, 0, 0, 0);
            }
            #endregion

            #region GetEndOfDay, 取得今天結束時間
            /// <summary>
            /// 取得今天結束時間
            /// </summary>
            /// <returns></returns>
            public static DateTime GetEndOfDay()
            {
                DateTime now = DateTime.Now;
                return new DateTime(now.Year, now.Month, now.Day, 23, 59, 59);
            }
            #endregion

            #region 西元年轉民國年
            /// <summary>
            /// GetChineseDate
            /// </summary>
            /// <param name="strDate">2017/05/09</param>
            /// <returns>1060509</returns>
            public static string GetChineseDate(string strDate)
            {
                string strRtnDate = string.Empty;
                try
                {
                    if (!string.IsNullOrEmpty(strDate))
                    {
                        DateTime _date;
                        if (DateTime.TryParse(strDate, out _date))
                        {
                            System.Globalization.CultureInfo tc = new System.Globalization.CultureInfo("zh-TW");
                            tc.DateTimeFormat.Calendar = new System.Globalization.TaiwanCalendar();
                            strRtnDate = _date.ToString("yyyMMdd", tc);
                        }
                    }
                }
                catch
                {
                    strRtnDate = string.Empty;
                }

                return strRtnDate;
            }
            #endregion

            #region 民國年轉西元年
            /// <summary>
            /// GetFormatDate
            /// </summary>
            /// <param name="strDate">1060509</param>
            /// <returns>2017/05/09</returns>
            public static string GetFormatDate(string strDate)
            {
                string strRtnDate = string.Empty;
                try
                {
                    if (!string.IsNullOrEmpty(strDate))
                    {
                        System.Globalization.CultureInfo tc = new System.Globalization.CultureInfo("zh-TW");
                        tc.DateTimeFormat.Calendar = new System.Globalization.TaiwanCalendar();

                        strRtnDate = DateTime.ParseExact(strDate.PadLeft(8, '0'), "yyyyMMdd", tc).ToString("yyyy/MM/dd");
                    }
                }
                catch
                {
                    strRtnDate = string.Empty;
                }

                return strRtnDate;
            }
            #endregion

            #region 顯示民國年格式(yyy/MM/dd)
            /// <summary>
            /// ShowChineseDate
            /// </summary>
            /// <param name="strDate">1060509</param>
            /// <returns>106/05/09</returns>
            public static string ShowChineseDate(string strDate)
            {
                string strRtnDate = string.Empty;
                try
                {
                    if (!string.IsNullOrEmpty(strDate) && strDate.Length == 7)
                    {
                        strRtnDate = string.Format("{0}/{1}/{2}", strDate.Substring(0, 3)
                            , strDate.Substring(3, 2)
                            , strDate.Substring(5, 2));
                    }
                }
                catch
                {
                    strRtnDate = string.Empty;
                }

                return strRtnDate;
            }
            #endregion

            #region 顯示民國年格式(yyy-MM-dd)
            /// <summary>
            /// ShowChineseDate
            /// </summary>
            /// <param name="strDate">1060509</param>
            /// <returns>106/05/09</returns>
            public static string ShowChineseDate(string strDate, string symbol)
            {
                string strRtnDate = string.Empty;
                try
                {
                    if (!string.IsNullOrEmpty(strDate) && strDate.Length == 7)
                    {
                        strRtnDate = strDate.Substring(0, 3) + symbol + strDate.Substring(3, 2) + symbol + strDate.Substring(5, 2);
                    }
                }
                catch
                {
                    strRtnDate = string.Empty;
                }

                return strRtnDate;
            }
            #endregion
        }
    }
}
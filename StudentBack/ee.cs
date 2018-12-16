using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace StudentBack
{
    public class PwdSaltPair
    {
        public byte[] HashedPwd { get; set; }
        public byte[] Salt { get; set; }
    }
    public static class ee
    {
        public static PwdSaltPair HashPassword(string strPwd, int saltsize = 20)
        {
            PwdSaltPair result = new PwdSaltPair();
            //把密碼轉成byte[]
            byte[] bytesPwd = Encoding.Unicode.GetBytes(strPwd);
            //製作salt
            byte[] bytesSalt = new byte[saltsize];
            SHA384Managed alog = new SHA384Managed();
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            rng.GetBytes(bytesSalt);
            //把密碼+salt喇一喇
            byte[] bytesHashedPwd = alog.ComputeHash(bytesPwd.Concat(bytesSalt).ToArray());


            result.HashedPwd = bytesHashedPwd;
            result.Salt = bytesSalt;
            return result;
        }

        public static bool ValidatePassword(string strPwd, byte[] saltFromDb, byte[] hashedPwdFromDb)
        {
            SHA384Managed alog = new SHA384Managed();
            byte[] bytesPwd = Encoding.Unicode.GetBytes(strPwd);
            byte[] bytesHashedPwd = alog.ComputeHash(bytesPwd.Concat(saltFromDb).ToArray());
            bool isValid = bytesHashedPwd.SequenceEqual(hashedPwdFromDb);

            return isValid;
        }
    }

    //ForMVC
    public static class console
    {
        //console.log
        static string scriptTag = "<script type=\"\" language=\"\">{0}</script>";

        public static HtmlString log(HtmlString message)
        {
            return new HtmlString($"<script>console.log('{message}');</script>");
        }
        public static HtmlString log(string message)
        {
            return new HtmlString($"<script>console.log('{message}');</script>");
        }

        public static void write(string message)
        {
            string function = "console.log('{0}');";
            string log = string.Format(GenerateCodeFromFunction(function), message);
            HttpContext.Current.Response.Write(log);
        }

        public static void Alert(string message)
        {
            string function = "alert('{0}');";
            string log = string.Format(GenerateCodeFromFunction(function), message);
            HttpContext.Current.Response.Write(log);
        }

        static string GenerateCodeFromFunction(string function)
        {
            return string.Format(scriptTag, function);
        }
    }

    public static class ExtendMethods
    {

        //string
        public static string ExToString<T>(this T[] arr)
        {
            string str = string.Join(", ", arr);
            str = "{" + str + "}";
            return str;
        }

        public static string ToArrayString<T>(this IEnumerable<T> list)
        {
            string str = string.Join(", ", list);
            str = "{" + str + "}";
            return str;
        }

        //套用console writeline
        public static void eeConsoleWriteLine(this object obj, string format, params object[] args)
        {
            AllocConsole();
            switch (args.Length)
            {
                case 0:
                    Console.WriteLine(format);
                    break;
                case 1:
                    Console.WriteLine(format, args[0]);
                    break;
                case 2:
                    Console.WriteLine(format, args[0], args[1]);
                    break;
                case 3:
                    Console.WriteLine(format, args[0], args[1], args[2]);
                    break;
                case 4:
                    Console.WriteLine(format, args[0], args[1], args[2], args[3]);
                    break;
            }
            Console.ReadKey();
            FreeConsole();
        }

        public static void eeConsoleWriteLine(this object obj, object objj)
        {
            AllocConsole();
            Console.WriteLine(objj.ToString());
            Console.ReadKey();
            FreeConsole();
        }

        [DllImport("kernel32.dll")]
        static extern bool AllocConsole();

        [DllImport("kernel32.dll")]
        static extern bool FreeConsole();
    }
}
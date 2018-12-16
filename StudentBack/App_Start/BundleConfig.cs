using System.Web;
using System.Web.Optimization;

namespace StudentBack
{
    public class BundleConfig
    {

        // 如需「搭配」的詳細資訊，請瀏覽 http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                    "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryui").Include("~/Scripts/jquery-ui-1.12.1.js"));
            bundles.Add(new StyleBundle("~/Content/jqueryui").Include("~/Content/themes/base/all.css"));
            // 使用開發版本的 Modernizr 進行開發並學習。然後，當您
            // 準備好可進行生產時，請使用 https://modernizr.com 的建置工具，只挑選您需要的測試。
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css"));

            // jquery datatable
            bundles.Add(new StyleBundle("~/Content/css/datatables").Include(
                      "~/Content/DataTables/css/jquery.dataTables.css",
                      "~/Content/DataTables/css/dataTables.tableTools.css",
                      "~/Content/DataTables/css/dataTables.responsive.css"));

            bundles.Add(new ScriptBundle("~/bundles/datatables").Include(
                      "~/Scripts/DataTables/jquery.dataTables.js",
                      "~/Scripts/DataTables/dataTables.tableTools.js",
                      "~/Scripts/DataTables/dataTables.responsive.js"));
            // jquery DatetimePicker
            bundles.Add(new StyleBundle("~/Content/css/DatetimePicker").Include(
                "~/Content/DatetimePicker/jquery.datetimepicker.css"));
        }
    }
}
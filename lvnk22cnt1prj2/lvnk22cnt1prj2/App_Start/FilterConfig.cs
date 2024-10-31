using System.Web;
using System.Web.Mvc;

namespace lvnk22cnt1prj2
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}

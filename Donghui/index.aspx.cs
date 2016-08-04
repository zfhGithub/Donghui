using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Donghui
{
    public partial class index : System.Web.UI.Page
    {
        public DataTable caseList = new DataTable();
        public Dictionary<string,string> aboutusDic = new Dictionary<string, string> ();
        public List<Dictionary<string, string>> newsList = new List<Dictionary<string, string>>();
        public DataTable advList = new DataTable();
        public List<string> bannerList = new List<string>();
        public Dictionary<string, string> qqList = new Dictionary<string, string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                caseList = com.@case.getCaseListTop3();
                aboutusDic = com.aboutinfo.getAboutUsInfo();
                newsList = com.aboutinfo.getNewsList();
                advList = com.advantage.getAdvantageList("1", "4");
                if (!string.IsNullOrEmpty(aboutusDic["BannerImages"]))
                {
                    string[] banners = aboutusDic["BannerImages"].Split(';');
                    for (int i = 0; i < banners.Length; i++)
                    {
                        bannerList.Add(banners[i]);
                    }
                }
                qqList = com.settings.getQQs();
            }
            catch (Exception)
            {
                 
            }
        }
    }
}
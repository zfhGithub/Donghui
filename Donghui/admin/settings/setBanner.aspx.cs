using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Donghui.admin.settings
{
    public partial class setBanner : com.BaseClass
    {
        public Dictionary<string, string> aboutusDic = new Dictionary<string, string>();
        public List<string> bannerList = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            aboutusDic = com.aboutinfo.getAboutUsInfo(); 
            if (!string.IsNullOrEmpty(aboutusDic["BannerImages"]))
            {
                string[] banners = aboutusDic["BannerImages"].Split(';');
                for (int i = 0; i < banners.Length; i++)
                {
                    bannerList.Add(banners[i]);
                }
            }
        }
    }
}
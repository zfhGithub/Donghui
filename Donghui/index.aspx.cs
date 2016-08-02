using System;
using System.Collections.Generic;
using System.Data;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                caseList = com.@case.getCaseListTop3();
                aboutusDic = com.aboutinfo.getAboutUsInfo();
                newsList = com.aboutinfo.getNewsList();
                advList = com.advantage.getAdvantageList("1", "4");
            }
            catch (Exception)
            {
                 
            }
        }
    }
}
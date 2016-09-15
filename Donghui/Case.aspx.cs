using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Donghui
{
    public partial class Case : System.Web.UI.Page
    {
        public Dictionary<string, string> qqList = new Dictionary<string, string>();
        public List<string> phoneList = new List<string>();
        public DataTable caseList = new DataTable();
        public Dictionary<string, string> aboutusDic = new Dictionary<string, string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            aboutusDic = com.settings.getAboutUsInfo();
            qqList = com.settings.getQQs();
            caseList = com.@case.getCaseList();
            phoneList = com.settings.getPhones();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Donghui
{
    public partial class videos : System.Web.UI.Page
    {
        public Dictionary<string, string> qqList = new Dictionary<string, string>();
        public List<string> phoneList = new List<string>();
        public DataTable caseList = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            qqList = com.settings.getQQs();
            caseList = com.@case.getCaseList();
            phoneList = com.settings.getPhones();
        }
    }
}
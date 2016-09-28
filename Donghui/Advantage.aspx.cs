using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Donghui
{
    public partial class Advantage : System.Web.UI.Page
    {
        public string myCommitHtml="";
        public string title = "";
        public DataTable advList = new DataTable();
        public Dictionary<string, string> qqList = new Dictionary<string, string>();
        public List<string> phoneList = new List<string>();
        public Dictionary<string, string> aboutusDic = new Dictionary<string, string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            aboutusDic = com.settings.getAboutUsInfo();
            qqList = com.settings.getQQs();
            phoneList = com.settings.getPhones();
            advList =  com.advantage.getAdvantageList("1", "4");
            DataTable dt = com.advantage.getMyCommit();
            myCommitHtml = dt.Rows[0]["content"].ToString();
            title = dt.Rows[0]["title"].ToString();
        }
    }
}
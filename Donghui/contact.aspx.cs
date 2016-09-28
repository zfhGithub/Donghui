using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Donghui
{
    public partial class contact : System.Web.UI.Page
    {
        public DataTable contactDt = new DataTable();
        public Dictionary<string, string> qqList = new Dictionary<string, string>();
        public List<string> phoneList = new List<string>();
        public Dictionary<string, string> aboutusDic = new Dictionary<string, string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            aboutusDic = com.settings.getAboutUsInfo();
            contactDt = com.aboutinfo.getAboutInfo();
            qqList = com.settings.getQQs();
            phoneList = com.settings.getPhones();
            if (Request.HttpMethod.ToUpper() =="POST")
            {
                string cname = Request.Form["cname"];
                string cphone = Request.Form["cphone"];
                string cemail = Request.Form["cemail"];
                string cmessage = Request.Form["cmessage"];
                int s = com.message.addMessage(cname, cemail, cphone, cmessage);
                if (s > 0)
                {
                    Response.Write("<script>alert('我们已经收到你的留言！');</script>");
                }

            }
        }
    }
}
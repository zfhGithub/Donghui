using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Donghui
{
    public partial class detail : System.Web.UI.Page
    {
        public Dictionary<string, string> News = new Dictionary<string, string>();
        public DataTable newsList = new DataTable();
        public Dictionary<string, string> qqList = new Dictionary<string, string>();
        public List<string> phoneList = new List<string>();
        public Dictionary<string, string> aboutusDic = new Dictionary<string, string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            aboutusDic = com.settings.getAboutUsInfo();
            try
            {
                int id = int.Parse(Request.QueryString["id"]);
                SqlOper.SQLServerOperating s = new SqlOper.SQLServerOperating();
                DataTable dt = s.Selects(string.Format("select id, type, name, title, subtitle, photo, content, created from News where id= {0} and deleted=0", id));
                DataRow row = dt.Rows[0];
                News.Add("name", row["name"].ToString());
                News.Add("title", row["title"].ToString());
                News.Add("subtitle", row["subtitle"].ToString());
                News.Add("photo", row["photo"].ToString());
                News.Add("content", row["content"].ToString());
                News.Add("created", row["created"].ToString());
                qqList = com.settings.getQQs();
                phoneList = com.settings.getPhones();
                newsList = s.Selects("select top 10 id, type, name, title, subtitle, photo, content, created, deleted from News where  deleted=0 order by created desc");
            }
            catch (Exception)
            {
                Response.Redirect("index.aspx");
            }
           
        }
    }
}
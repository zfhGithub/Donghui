using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace Donghui
{
    public partial class about : System.Web.UI.Page
    {
        public DataTable aboutDt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            aboutDt = com.aboutinfo.getAboutInfo();
        }
    }
}
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
        public DataTable caseList = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
           caseList = com.@case.getCaseList();
        }
    }
}
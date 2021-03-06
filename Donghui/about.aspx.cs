﻿using System;
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
        public Dictionary<string, string> qqList = new Dictionary<string, string>();
        public List<Dictionary<string, string>> newsList = new List<Dictionary<string, string>>();
        public List<string> phoneList = new List<string>();
        public Dictionary<string, string> aboutusDic = new Dictionary<string, string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            aboutusDic = com.settings.getAboutUsInfo();
            aboutDt = com.aboutinfo.getAboutInfo();
            qqList = com.settings.getQQs();
            newsList = com.aboutinfo.getNewsList();
            phoneList = com.settings.getPhones();
        }
    }
}
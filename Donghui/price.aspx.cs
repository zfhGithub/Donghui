using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Donghui
{
    public partial class price : System.Web.UI.Page
    {
        public DataTable priceList = new DataTable();
        public List<Dictionary<string, string>> itemList = new List<Dictionary<string, string>>();
        protected void Page_Load(object sender, EventArgs e)
        {
            priceList = com.price.getPriceTop4();
            foreach (DataRow row in priceList.Rows)
            {
                string pid = row["id"].ToString();
                DataTable dt = com.price.getPriceTop4Item(pid);
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Dictionary<string, string> item = new Dictionary<string, string>() ;
                    item.Add("name", dt.Rows[i]["name"].ToString());
                    item.Add("itemPrice", dt.Rows[i]["itemPrice"].ToString());
                    item.Add("praentId", dt.Rows[i]["praentId"].ToString());
                    itemList.Add(item);
                }
            }
           
        }
    }
}
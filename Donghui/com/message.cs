using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Donghui.com
{
    public class message
    {
        public static int addMessage(string name,string email,string phone,string message)
        {
            string strSql = " insert into Message values('"+name+"','"+ message + "',getdate(),'"+phone+"','"+email+"')";
            SqlOper.SQLServerOperating s = new SqlOper.SQLServerOperating();
            return s.ExecuteSql(strSql);
        }
    }
}
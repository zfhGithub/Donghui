using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Donghui.com
{
    public class price
    {
        public static DataTable getPriceItemList(string pid)
        {
            string strSql = "select id, name, itemPrice, praentId, created from dbo.Price where praentId="+ pid;
            SqlOper.SQLServerOperating s = new SqlOper.SQLServerOperating();
            return s.Selects(strSql);
        }

        public static DataTable getPriceList(string currentIndex,string pageCount)
        {
            string strSql =string.Format(@"select top {0} * from (
                                select ROW_NUMBER() OVER(order by id desc) rowIndex, id, name, itemPrice, praentId, created,(select SUM(itemPrice) from Price p1 where p.id=p1.praentId) as sumprice from Price p where praentId = 0
                                ) t where rowIndex > {0} * ({1} - 1) order by id desc", pageCount,currentIndex);
            SqlOper.SQLServerOperating s = new SqlOper.SQLServerOperating();
            return s.Selects(strSql);
        }

        public static string getPriceListCount()
        {
            string strSql = "select COUNT(*) from Price where praentId=0";
            SqlOper.SQLServerOperating s = new SqlOper.SQLServerOperating();
            return s.Select(strSql);
        }

        public static string addPriceItem(string name,string price,string pid)
        {
            if (string.IsNullOrWhiteSpace( pid ))
            {
                return "-1";
            }
            if (price == "")
            {
                price = "0";
            }
            string strSql = string.Format("insert into Price  values( '{0}','{1}',{2},getdate()) select @@identity", name,price,pid);
            SqlOper.SQLServerOperating s = new SqlOper.SQLServerOperating();
            return s.Select(strSql);
        }

        public static int addPrice(string name)
        {
            string strSql = string.Format("insert into Price  values( '{0}','{1}',{2},getdate() )", name, 0.00, 0);
            SqlOper.SQLServerOperating s = new SqlOper.SQLServerOperating(); 
            return s.ExecuteSql(strSql);
        }

        public static int updatePrice(string id,string name)
        {
            string strSql = string.Format("update Price set name='{0}' where id={1} and praentId=0", name, id);
            SqlOper.SQLServerOperating s = new SqlOper.SQLServerOperating();
            return s.ExecuteSql(strSql);
        }

        public static int deletePriceItem(string id)
        {
            string strSql = "delete from Price where id="+id;
            SqlOper.SQLServerOperating s = new SqlOper.SQLServerOperating();
            return s.ExecuteSql(strSql);
        }


            

    }
}
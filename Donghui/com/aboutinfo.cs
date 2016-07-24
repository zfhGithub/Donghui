using SqlOper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Donghui.com
{
    public class aboutinfo
    {
        public static int setAboutInfo(string aboutText= null, string achievementText = null,string teamText =null)
        {
           
            string strSql = " update Company set ";
            if (aboutText != null)
            {
                // [AboutusText]=@AboutusText,[AchievementText]=@AchievementText ,[MyTeamText]= @MyTeamText 
                strSql += " [AboutusText]=@AboutusText ";
            }
            if (achievementText != null)
            {
                strSql += " [AchievementText]=@AchievementText ";
            }
            if (teamText != null)
            {
                strSql += " [MyTeamText]=@MyTeamText ";
            }
            SqlParameter[] sp = new SqlParameter[] {
                new SqlParameter("AboutusText",aboutText??""),new SqlParameter("AchievementText",achievementText??""),new SqlParameter("MyTeamText",teamText??"")
            };
            SqlOper.SQLServerOperating sql = new SqlOper.SQLServerOperating();
            return sql.ExecuteSql(strSql,sp);
        }
        public static DataTable getAboutInfo()
        {
            string strSql = "SELECT Id, CompanyName, Address,  Email, Phone, Contacts, Introduce, AboutusText, AchievementText, MyTeamText FROM [Donghui].[dbo].[Company]";
            SqlOper.SQLServerOperating s = new SqlOper.SQLServerOperating();
            return s.Selects(strSql );
        }

        public static int setContact(string name,string address,string email,string phone)
        {
            string strSql = " update  Company set CompanyName='"+name+"',Phone='"+phone+"',email='"+email+"',address='"+address+"' ";
            SqlOper.SQLServerOperating s = new SqlOper.SQLServerOperating();
            return s.ExecuteSql(strSql);
        }
    }
}
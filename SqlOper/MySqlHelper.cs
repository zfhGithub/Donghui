
using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;


namespace SqlOper
{
    public class MySqlHelper
    {
        /// <summary>
        /// 创建连接对象
        /// </summary>
        /// <returns>连接对象</returns>
        public static MySqlConnection CreateConn()
        {
            //读取配制文件内的连接字符串"Data Source =.;User ID=sa;Password=52family;database=YiwenGPS ";
            string connStr = ConfigurationManager.ConnectionStrings["StrConnection"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(connStr);
            return connection;
        }
        public Hashtable Select(string MySql, MySqlParameter[] parame = null)
        {
            try
            {
                using (MySqlConnection conn = CreateConn())
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        if (parame != null)
                            cmd.Parameters.AddRange(parame);
                        cmd.CommandText = MySql;
                        cmd.Connection = conn;
                        cmd.CommandType = CommandType.Text;
                        DbDataReader reader = cmd.ExecuteReader();
                        Hashtable table = new Hashtable();
                        if (reader.Read())
                        {
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                table[reader.GetName(i)] = reader.GetValue(i);
                            }
                        }
                        cmd.Parameters.Clear();
                        reader.Close();
                        return table;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public int ExecutionMySql(string strMySql)
        {
            MySqlConnection conn = CreateConn();
            try
            {
                conn.Open();
                using (MySqlCommand cmd = new MySqlCommand(strMySql, conn))
                {
                    return cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            { 
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }


        /// <summary>
        /// 通用的查询多条数据
        /// </summary>
        /// <param name="MySql">MySql语句</param>
        /// <returns>返回多条数据</returns>
        public DataTable Selects(string MySql)
        {
            try
            {
                using (MySqlConnection conn = CreateConn())
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        cmd.Connection = conn;
                        cmd.CommandText = MySql;
                        MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        return ds.Tables[0];
                    }
                }
            }
            catch (Exception ex)                
            {
                throw ex;
            }
        }


        public DataTable Selects(string MySql, MySqlParameter[] parameter)
        {
            try
            {
                using (MySqlConnection conn = CreateConn())
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        cmd.CommandText = MySql;
                        cmd.Connection = conn;
                        cmd.Parameters.AddRange(parameter);
                        MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        cmd.Parameters.Clear();
                        return ds.Tables[0];
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public int ExecutionMySql(string strMySql, MySqlParameter[] MySqlParameter)
        {
            MySqlConnection conn = CreateConn();
            MySqlCommand cmd = null;
            try
            {
                conn.Open();
                cmd = new MySqlCommand();
                cmd.Parameters.AddRange(MySqlParameter);
                cmd.CommandText = strMySql;
                cmd.Connection = conn;
                return cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            { 
                throw ex;
            }
            finally
            {
                cmd.Parameters.Clear();
                conn.Close();
            }
        }

        public int ExecutionMySql(List<string> MySqlList)
        {
            if (MySqlList.Count == 0)
                return 0;
            MySqlConnection conn = CreateConn();
            MySqlTransaction st = null;
            try
            {
                conn.Open();
                st = conn.BeginTransaction();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Transaction = st;
                int count = 0;
                cmd.Connection = conn;
                for (int i = 0; i < MySqlList.Count; i++)
                {
                    cmd.CommandText = MySqlList[i];
                    count += cmd.ExecuteNonQuery();
                }
                st.Commit();
                return count;
            }
            catch (Exception ex)
            {
                st.Rollback();
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }

        /// <summary>
        /// 反序列化，把string转成Dictionary集合
        /// </summary>
        /// <param name="obj"></param>
        //public Dictionary<string, object> ToDict(string obj)
        //{
        //    JavaScriptSerializer js = new JavaScriptSerializer();
        //    return js.Deserialize<Dictionary<string, object>>(obj);
        //}

        /// <summary>
        ///  反序列化，把string转成List集合
        /// </summary>
        /// <param name="obj"></param>
        // public static List<Dictionary<string, object>> ToList(string obj)
        // {
       // JsonSerializer js = new JsonSerializer();

        //JavaScriptSerializer js = new JavaScriptSerializer();
        //  return js.Deserialize<List<Dictionary<string, object>>>(obj);
        //  }
        /// <summary>
        /// 把集合序列化
        /// </summary>
        /// <param name="json"></param>
        public static string ToJosn(object json)
        {
           JavaScriptSerializer  js = new JavaScriptSerializer();
            return js.Serialize(json);
        }

        /// <summary>    
        /// 把表格转换成json数据   
        /// /// 通过表格名查找表格数组中的数据   
        /// /// </summary>    
        /// <param name="table">表格</param>    
        /// <param name="JsonName">表格名称</param>
        /// <returns></returns>    
        public static string DataTableToJSON(DataTable table)
        {
            StringBuilder sb = new StringBuilder();
            StringWriter sw = new StringWriter(sb);
            using (JsonWriter jw = new JsonTextWriter(sw))
            {
                JsonSerializer ser = new JsonSerializer();
                jw.WriteStartObject();
                jw.WritePropertyName("");
                //  表格名           
                jw.WriteStartArray();
                // 表格数组           
                try
                {
                    //   通过循环输出表格中数据               
                    foreach (DataRow dr in table.Rows)
                    {
                        jw.WriteStartObject();
                        foreach (DataColumn dc in table.Columns)
                        {
                            jw.WritePropertyName(dc.ColumnName);
                            ser.Serialize(jw, dr[dc].ToString());
                        }
                        jw.WriteEndObject();//结束输出        
                    }
                    jw.WriteEndArray();//结束表格输出              
                    jw.WriteEndObject();//结束输出     
                }
                catch (Exception ex)
                {
                    string me = ex.Message;
                }
                sw.Close();//关闭流           
                jw.Close();//关闭流      
            }
            return sb.ToString();
        }
        /// <summary>
        /// 通用的添加方法
        /// </summary>
        /// <param name="arr">存放数据集合</param>
        /// <param name="table">表名</param>
        /// <returns></returns>
        public static int insert(Dictionary<string, object> arr, string table)
        {
            MySqlConnection conn = CreateConn();
            try
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand();
                string s1 = "insert into " + table + "(";
                string s2 = ")values(";
                string s3 = ")";
                foreach (KeyValuePair<string, object> item in arr)
                {
                    s1 += item.Key + ",";
                    s2 += "@" + item.Value + ",";
                    cmd.Parameters.AddWithValue("@" + item.Key, item.Value);
                }
                s1 = s1.Substring(0, s1.Length - 1);
                s2 = s2.Substring(0, s2.Length - 1);
                string sql = s1 + s2 + s3;
                cmd.CommandText = sql;
                cmd.Connection = conn;
                return cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return -1;
            }
            finally
            {
                conn.Close();
            }
        }
        /// <summary>
        /// 通用删除方法
        /// </summary>
        /// <param name="arr"></param>
        /// <param name="table"></param>
        /// <returns></returns>
        public static int Delete(Dictionary<string, object> arr, string table)
        {
            MySqlConnection conn = CreateConn();
            try
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand();
                string sql = "delete from" + table + " where ";
                foreach (KeyValuePair<string, object> item in arr)
                {
                    sql += item.Key + "=@" + item.Key + " and ";
                    cmd.Parameters.AddWithValue("@" + item.Key, item.Value);
                }
                sql = sql.Substring(0, sql.Length - 4);
                cmd.CommandText = sql;
                cmd.Connection = conn;
                return cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return -1;

            }
            finally
            {
                conn.Close();
            }
        }
        /// <summary>
        /// 通用查询多条语句
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static List<Dictionary<string, object>> Sels(string sql) {
            List<Dictionary<string, object>> lst = new List<Dictionary<string, object>>();
            MySqlConnection conn = CreateConn();
            MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn);
            DataTable tab = new DataTable();
            adapter.Fill(tab);
            foreach (DataRow row in tab.Rows)
            {
                Dictionary<string, object> di = new Dictionary<string, object>();
                foreach (DataColumn col in tab.Columns)
                {
                    di.Add(col.ColumnName, row[col.ColumnName]);
                }
                lst.Add(di);
            }
            return lst;
        }
        /// <summary>
        /// 分页
        /// </summary>
        /// <param name="table">表数据</param>
        /// <param name="index">当前页</param>
        /// <param name="findex"></param>
        /// <returns></returns>
        public static List<Dictionary<string, object>> Page(string table, ref int index, ref int findex)
        {
          
            HttpRequest request = HttpContext.Current.Request;
            HttpSessionState Session = HttpContext.Current.Session;
            //定义每页显示多少条数据
            int Pagerow = Convert.ToInt16(ConfigurationManager.AppSettings["page"].ToString());
            //定义变量表示当前页index
            if (request["index"] != null)
            {
                index = int.Parse(request["index"]);
            }
            //定义起始位置,结束为止例如：显示5（起始）-10（结束）条数据
            int beginpage, endpage;
            //（5-1）*5+1；
            beginpage = (index - 1) * Pagerow + 1;
            endpage = index * Pagerow;
            //获得主键
            Dictionary<string, object> dic = MySqlHelper.Sel("sp_pkeys" + table);
            string key = dic["COLUMN_NAME"].ToString();
            string sql = @"select * from(select *，row_number(order by " + key + ") as rowId from " + table + ") as a where rowId between " + beginpage + " and " + endpage;
            List<Dictionary<string, object>> lst = Sels(sql);
            //计算尾页

            if (Session["findex"]==null)
            {
                int total = Sels("select * from " + table ).Count;
                findex = total / Pagerow;
                if (findex%Pagerow!=0)
                {
                    findex++;
                    Session["findex"] = findex;
                }
                else
                {
                    findex = int.Parse(Session["findex"].ToString());
                }
            }
            return lst;
            
        }
        /// <summary>
        /// 查询单条数据
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static Dictionary<string, object> Sel(string sql)
        {
            MySqlConnection conn = CreateConn();
            MySqlDataAdapter sda = new MySqlDataAdapter();
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count==0)
            {
                return null;
            }
            Dictionary<string, object> di = new Dictionary<string, object>();
            DataRow row = dt.Rows[0];
            foreach (DataColumn col in dt.Columns)
            {
                di.Add(col.ColumnName, row[col.ColumnName]);
            }
            return di;
        }
    }
     
}

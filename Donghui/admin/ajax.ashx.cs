using SqlOper;
using System;
using System.Collections.Generic;
using System.Data; 
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace Donghui.admin
{
    /// <summary>
    /// ajax 的摘要说明
    /// </summary>
    public class ajax : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string action = context.Request.Params["action"];
            HttpRequest req = context.Request;
            HttpResponse res = context.Response;

            switch (action)
            {
                #region 通用
                case "kindeditor":
                    HttpPostedFile file = req.Files[0];
                    res.Write(Utils.UploadImage(file, req.QueryString["type"]));
                    break;
                #endregion

                #region 关于我们
                case "getaboutinfo":
                    res.Write(Utils.DataTableToJSON(com.aboutinfo.getAboutInfo()));
                    break;
                case "setaboutus":
                    string aboutusText = req.Form["aboutus"];
                    int status = com.aboutinfo.setAboutInfo(aboutusText);
                    context.Response.Write(Utils.GetReulst(200, "设置成功", "设置失败", status));
                    break;
                case "setachievement":
                    string achievementText = req.Form["achievement"];
                    status = com.aboutinfo.setAboutInfo(achievementText: achievementText);
                    context.Response.Write(Utils.GetReulst(200, "设置成功", "设置失败", status));
                    break;
                case "setteam":
                    string teamText = req.Form["team"];
                    status = com.aboutinfo.setAboutInfo(teamText: teamText);
                    context.Response.Write(Utils.GetReulst(200, "设置成功", "设置失败", status));
                    break;
                case "setcontact":
                    status = com.aboutinfo.setContact(req.Form["cname"], req.Form["caddress"], req.Form["cemail"], req.Form["cphone"]);
                    context.Response.Write(Utils.GetReulst(200, "设置成功", "设置失败", status));
                    break;
                #endregion

                #region 留言管理 
                case "messagelist":
                    string currentIndex = req.Form["pageIndex"];
                    string pageCount = req.Form["pageSize"];
                    Dictionary<string, string> jsonDic = new Dictionary<string, string>();
                    jsonDic.Add("data", Utils.DataTableToJSON(com.message.getMessageList(currentIndex, pageCount)));
                    jsonDic.Add("count", com.message.getMessageListCount());
                    JavaScriptSerializer js = new JavaScriptSerializer();
                    res.Write(js.Serialize(jsonDic));
                    break;
                #endregion

                #region 领先优势
                case "setmycommit":
                    string html = req.Form["k_mycommit"];
                    string title = req.Form["mycommit_title"];
                    res.Write(Utils.GetReulst(200, "操作成功", "操作失败", com.advantage.setMyCommit(title, html)));
                    break;
                case "getmycommit":
                    res.Write(Utils.DataTableToJSON(com.advantage.getMyCommit()));
                    break;
                case "addadvantage":
                    status = com.advantage.addAdvantage(req.Form["t_advantage_name"], req.Form["t_advantage_title"], req.Form["hidden_advantagehead"], req.Form["t_advantage_content"]);
                    string reulst = Utils.GetReulst(200, "添加成功！", "添加失败！", status, "true");
                    res.Write(reulst);
                    break;
                case "getadvantagelist":
                    currentIndex = req.Form["pageIndex"];
                    pageCount = req.Form["pageSize"];
                    jsonDic = new Dictionary<string, string>();
                    jsonDic.Add("data", Utils.DataTableToJSON(com.advantage.getAdvantageList(currentIndex, pageCount)));
                    jsonDic.Add("count", com.advantage.getAdvantageCount());
                    js = new JavaScriptSerializer();
                    res.Write(js.Serialize(jsonDic));
                    break;
                case "deleteadvantage":
                    string id = req.QueryString["id"];
                    res.Write(Utils.GetReulst(200,"删除成功！","删除失败！",com.advantage.deleteAdvantageById(id)));
                    break;
                    #endregion
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
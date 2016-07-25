using SqlOper;
using System;
using System.Collections.Generic;
using System.Data; 
using System.Linq;
using System.Web;

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
                case "kindeditor":
                    HttpPostedFile file = req.Files[0];
                    res.Write(Utils.UploadImage(file, req.QueryString["type"]));
                    break;
                case "setcontact":
                    status = com.aboutinfo.setContact(req.Form["cname"], req.Form["caddress"], req.Form["cemail"], req.Form["cphone"]);
                    context.Response.Write(Utils.GetReulst(200, "设置成功", "设置失败", status));
                    break;
                #endregion

                case "messagelist":
                    string currentIndex = req.Form["pageIndex"];
                    string pageCount = req.Form["pageSize"];
                    Dictionary<string, string> jsonDic = new Dictionary<string, string>();
                    jsonDic.Add("data", Utils.DataTableToJSON( com.message.getMessageList(currentIndex, pageCount)));
                    jsonDic.Add("count", com.message.getMessageListCount());
                    res.Write();
                    break;
                       

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
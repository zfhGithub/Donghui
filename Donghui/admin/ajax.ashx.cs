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
                    res.Write(Utils.UploadImage(file, req.QueryString["type"], context));
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
                case "updateadvantage":
                    status = com.advantage.updateAdvantage(req.Params["id"], req.Form["t_advantage_name"], req.Form["t_advantage_title"], req.Form["hidden_advantagehead"], req.Form["t_advantage_content"]);
                    reulst = Utils.GetReulst(200, "修改成功！", "修改失败！", status, "true");
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
                    res.Write(Utils.GetReulst(200, "删除成功！", "删除失败！", com.advantage.deleteAdvantageById(id)));
                    break;
                case "getadvantagedetailbyid":
                    id = req.Params["id"];
                    res.Write(Utils.DataTableToJSON(com.advantage.getAdvantageDetailById(id)));
                    break;
                #endregion

                #region 套餐管理
                case "getpriceitemlist":
                    string pid = req.Form["pid"];
                    res.Write(Utils.DataTableToJSON(com.price.getPriceItemList(pid)));
                    break;
                case "getpricelist":
                    currentIndex = req.Form["pageIndex"];
                    pageCount = req.Form["pageSize"];
                    jsonDic = new Dictionary<string, string>();
                    jsonDic.Add("data", Utils.DataTableToJSON(com.price.getPriceList(currentIndex, pageCount)));
                    jsonDic.Add("count", com.price.getPriceListCount());
                    js = new JavaScriptSerializer();
                    res.Write(js.Serialize(jsonDic));
                    break;
                case "addpriceitem":
                    string priceItemName = req.Params["priceItemName"];
                    string priceItemPrice = req.Params["price"];
                    string priceItemPid = req.Params["pricePid"];
                    string identity = com.price.addPriceItem(priceItemName, priceItemPrice, priceItemPid);
                    if (!string.IsNullOrWhiteSpace(identity))
                        res.Write(Utils.GetReulst(200, "添加成功！", "添加失败！", 1, json: "\"id\":\"" + identity + "\""));
                    else
                        res.Write(Utils.GetReulst(200, "添加成功！", "添加失败！", 0));
                    break;
                case "addprice":
                    string name = req.Form["p_price_name"];
                    string ids = req.Params["ids"];
                    res.Write(Utils.GetReulst(200, "添加成功", "添加失败", com.price.addPrice(name, ids), closeCurrent: "true"));
                    break;
                case "updateprice":
                    name = req.Form["p_price_name"];
                    id = req.Params["updateid"];
                    res.Write(Utils.GetReulst(200, "修改成功", "修改失败", com.price.updatePrice(id, name), closeCurrent: "true"));
                    break;
                case "deletepriceitem":
                    id = req.Params["id"];
                    res.Write(Utils.GetReulst(200, "删除成功！", "删除失败！", com.price.deletePriceItem(id)));
                    break;
                #endregion

                #region 案例管理
                case "getcaselist":
                    currentIndex = req.Form["pageIndex"];
                    pageCount = req.Form["pageSize"];
                    jsonDic = new Dictionary<string, string>();
                    jsonDic.Add("data", Utils.DataTableToJSON(com.@case.getCaseList(currentIndex, pageCount)));
                    jsonDic.Add("count", com.@case.getCaseListCount());
                    js = new JavaScriptSerializer();
                    res.Write(js.Serialize(jsonDic));
                    break;
                case "addcase":
                    title = req.Form["i_case_title"];
                    string subtitle = req.Form["i_case_subtitle"];
                    string photo = req.Form["i_case_photo"];
                    string content = req.Form["i_case_content"];
                    res.Write(Utils.GetReulst(200, "添加成功！", "添加失败", com.@case.addCase(title, subtitle, photo, content), closeCurrent: "true"));
                    break;
                case "deletecase":
                    id = req.Params["id"];
                    res.Write(Utils.GetReulst(200, "删除成功", "删除失败", com.@case.deleteCaseById(id)));
                    break;
                case "updatecase":
                    title = req.Form["i_case_title"];
                    subtitle = req.Form["i_case_subtitle"];
                    photo = req.Form["i_case_photo"];
                    content = req.Form["i_case_content"];
                    id = req.Params["id"];
                    res.Write(Utils.GetReulst(200, "修改成功", "修改失败", com.@case.updateCase(id, title, subtitle, photo, content), closeCurrent: "true"));
                    break;
                case "getcasedetailbyid":
                    id = req.Form["id"];
                    res.Write(Utils.DataTableToJSON(com.@case.getCaseDetailById(id)));
                    break;
                #endregion

                #region 文章管理
                case "getarticlelist":
                    currentIndex = req.Form["pageIndex"];
                    pageCount = req.Form["pageSize"];
                    jsonDic = new Dictionary<string, string>();
                    jsonDic.Add("data", Utils.DataTableToJSON(com.article.getArticleList(currentIndex, pageCount)));
                    jsonDic.Add("count", com.article.getArticleListCount());
                    js = new JavaScriptSerializer();
                    res.Write(js.Serialize(jsonDic));
                    break;
                case "addarticle":
                    title = req.Form["i_article_title"];
                    photo = req.Form["i_article_photo"];
                    content = req.Form["i_article_content"];
                    subtitle = req.Form["i_article_subtitle"];
                    res.Write(Utils.GetReulst(200, "添加成功！", "添加失败", com.article.addArticle(title, subtitle, photo, content), closeCurrent: "true"));
                    break;
                case "deletearticle":
                    id = req.Params["id"];
                    res.Write(Utils.GetReulst(200, "删除成功", "删除失败", com.article.deleteArticleById(id)));
                    break;
                case "updatearticle":
                    title = req.Form["i_article_title"];
                    photo = req.Form["i_article_photo"];
                    content = req.Form["i_article_content"];
                    subtitle = req.Form["i_article_subtitle"];
                    id = req.Params["id"];
                    res.Write(Utils.GetReulst(200, "删除成功", "删除失败", com.article.updateArticle(id, title, subtitle, photo, content), closeCurrent: "true"));
                    break;
                case "getarticledetailbyid":
                    id = req.Form["id"];
                    res.Write(Utils.DataTableToJSON(com.article.getArticleDetailById(id)));
                    break;
                #endregion

                #region 设置
                case "getbanners":
                    js = new JavaScriptSerializer();
                    res.Write(js.Serialize(com.aboutinfo.getAboutUsInfo()));
                    break;
                case "deletebanner":
                    res.Write(Utils.GetReulst(200, "删除成功", "删除失败", Utils.DeleteBanner(req.Params["id"])));
                    break;
                case "getserviceqq":
                    js = new JavaScriptSerializer();
                   var json = js.Serialize(com.settings.getServices());
                    res.Write(json=="[\"\"]"?"":json  );
                    break;
                case "addserviceqq":
                    string qq = req.Form["serviceQQ"];
                    name = req.Form["serviceName"];
                    res.Write(Utils.GetReulst(200, "保存成功", "保存失败", com.settings.addServices(qq, name)));
                    break;
                case "deleteserviceqq":
                    qq = req.Params["id"];
                    name = req.Params["name"];
                    res.Write(Utils.GetReulst(200, "删除成功", "删除失败", com.settings.deleteQQ(qq, name)));
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
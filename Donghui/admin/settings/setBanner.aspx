<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="setBanner.aspx.cs" Inherits="Donghui.admin.settings.setBanner" %>

<div class="bjui-pageHeader">
    <div class="pull-right">

        <!--<div class="btn-group">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" data-icon="copy"> 复选框-批量操作<span class="caret"></span></button>
            <ul class="dropdown-menu right" role="menu" style="min-width: 153px;">
                <li><a href="ajax.ashx?action=ProductDels" data-toggle="doajaxchecked" data-confirm-msg="确定要删除选中项吗？" data-idname="del" data-group="ids">删除选中</a></li>
            </ul>
        </div>-->
    </div>
    <!--<input type="hidden" name="pageSize" value="${model.pageSize}">
     <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
     <input type="hidden" name="orderField" value="${param.orderField}">
     <input type="hidden" name="orderDirection" value="${param.orderDirection}">-->
    <div class="bjui-searchBar">
        &nbsp; 
        <!--<label>套餐名称：</label><input type="text" id="customNo" value="" name="code" class="form-control" size="10">&nbsp;
        <label>价格区间：</label><input type="text" value="" id="customName" name="name" class="form-control" size="8">&nbsp;

      <button type="button" class="showMoreSearch" data-toggle="moresearch" data-name="custom"><i class="fa fa-angle-double-down"></i></button>
        <button type="submit" class="btn-default" data-icon="search" onclick="search()">查询</button>&nbsp;
        <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo" onclick="Clear()">清空查询</a>-->
        <div class="pull-right">
              <button type="button" class="btn-blue" data-url="settings/setLogo.html" data-id="dialog-addprice" data-width="800" data-height="400"
                    data-toggle="dialog" > 设置LOGO </button>

              <button type="button" class="btn-blue" data-url="settings/addBanner.html" data-id="dialog-addprice" data-width="800" data-height="400"
                    data-toggle="dialog" data-on-close="dialog_addbanner_before_close"> 添加轮播图 </button>

          
            <!--<button type="button" class="btn-blue" data-url="/B-JUI/ajaxDone2.html?id={#bjui-selected}" data-toggle="doajax" data-confirm-msg="确定要删除选中项吗？" data-icon="remove" title="可以在控制台(network)查看被删除ID">删除选中行</button>&nbsp;
            <div class="btn-group">
               <button type="button" class="btn-default dropdown-toggle" data-toggle="dropdown" data-icon="copy">复选框-批量操作<span class="caret"></span></button>
                <ul class="dropdown-menu right" role="menu">
                    <li><a href="book1.xlsx" data-toggle="doexport" data-confirm-msg="确定要导出信息吗？">导出<span style="color: green;">全部</span></a></li>
                    <li><a href="book1.xlsx" data-toggle="doexportchecked" data-confirm-msg="确定要导出选中项吗？" data-idname="expids" data-group="ids">导出<span style="color: red;">选中</span></a></li>
                    <li class="divider"></li>
                    <li><a href="/B-JUI/ajaxDone2.html" data-toggle="doajaxchecked" data-confirm-msg="确定要删除选中项吗？" data-idname="delids" data-group="ids">删除选中</a></li>
                </ul>
            </div>-->
        </div>
    </div>
    <!--<div class="bjui-moreSearch">
        <label>职业：</label><input type="text" value="" name="profession" size="15" />
        <label>&nbsp;性别:</label>
        <select name="sex" data-toggle="selectpicker">
            <option value="">全部</option>
            <option value="true">男</option>
            <option value="false">女</option>
        </select>
        <label>&nbsp;手机:</label>
        <input type="text" value="" name="mobile" size="10">
    </div>-->
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true" id="t_price_list">
        <thead>
            <tr>
                <th data-order-field="rowid">序号</th>
                <th data-order-field="id">图片</th>  
                <th data-order-field="price">操作</th>  
            </tr>
        </thead>
        <tbody>
            <%
                for (int i = 0; i <  bannerList.Count; i++)
                {if (!string.IsNullOrEmpty(bannerList[i]))
                    {%>
           
            <tr>
                <td><%= (i + 1) %></td>
                <td>
                    <img src="../assets/images/banner/<%=  bannerList[i]  %>" id="imgBanner<%= i %>" alt="" width="650" height="220" /> </td>
                <td>    
                     <div style="display: inline-block; vertical-align: middle;">
                            <div id="u_banner_pic_up<%= i %>" data-toggle="upload" data-uploader="ajax.ashx?action=kindeditor&type=banner-<%=i %>&oldname=<%=  bannerList[i]  %>"
                                 data-file-size-limit="5242880"
                                 data-file-type-exts="*.jpg;*.png;*.gif;*.mpg"
                                 data-multi="true"
                                 data-drag-drop="true" 
                                 data-button-text="选择上传图片"
                                 data-on-upload-success="case_banner_upload_success"
                                 data-icon="cloud-upload"></div>
                         <%--   <input type="hidden" id="i_banner_pic<%= i %>" value="" data-rule="图片:required">
                            <span id="j_banner_span_pic<%= i %>"></span>--%>
                        </div> 
                    <a href='ajax.ashx?action=deletebanner&id=<%= bannerList[i] %>' class='btn btn-red' data-toggle='doajax' data-confirm-msg='确定要删除该行以及所有的子项目吗？'>删除</a>
                </td>
            </tr>
                <%}
                       }
                 %>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    function case_banner_upload_success(file, data) {
        console.log(file);
        console.log(data);
        var json = $.parseJSON(data)
        console.log(json.fun.split('-')[1]);
        $(this).bjuiajax('ajaxDone', json)
        if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
            $('#imgBanner' + json.fun.split('-')[1]).attr("src", json.url);
            
          //  $('#j_banner_span_pic' + +json.fun.split('-')[1]).html('已上传图片：<img src="' + json.filename + '" width="100">')
        }
    }
    function dialog_addbanner_before_close() {
        $("body").navtab("refresh", "setBanner"); 
        return true;
    }
</script>

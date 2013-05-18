<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="JobCheers.MainFrame.Main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Job Cheers</title>
    <link href="maincss.css" rel="stylesheet" type="text/css" />
    <script src="http://yui.yahooapis.com/3.10.1/build/yui/yui-min.js" type="text/javascript"></script>
    


    <script language="javascript" type="text/javascript">

        YUI().use('node', function (Y) {
            var con = Y.one('#con');
            var daohang = Y.one('#daohang');
            var content = Y.one('#content');
            var foot = Y.one('#foot');

            var ctop = parseInt(con.getStyle('height')) + parseInt(daohang.getStyle('height'));
            var contentH = parseInt(document.documentElement.clientHeight) - parseInt(ctop) - parseInt(foot.getStyle('height'));
            content.setStyle('top', ctop);
            content.setStyle('height', contentH);


            window.onresize = function (e) {
                var con = Y.one('#con');
                var daohang = Y.one('#daohang');
                var content = Y.one('#content');
                var foot = Y.one('#foot');

                var ctop = parseInt(con.getStyle('height')) + parseInt(daohang.getStyle('height'));
                var contentH = parseInt(document.documentElement.clientHeight) - parseInt(ctop) - parseInt(foot.getStyle('height'));
                content.setStyle('top', ctop);
                content.setStyle('height', contentH);
            }

            var boxes = Y.all('.menu li');

            var handleBoxClick = function (e) {

                for (var i = 0; i < boxes._nodes.length; i++) {
                    var tds = boxes._nodes[i].getElementsByTagName("table")[0].getElementsByTagName("td");

                    tds[0].setAttribute('class', 'leftCorner');

                    tds[1].setAttribute('class', 'midmenuitem');

                    tds[2].setAttribute('class', 'rightCorner');
                }

                var newleftsel = e.currentTarget.one('.menutable .leftCorner');
                var newmidsel = e.currentTarget.one('.menutable .midmenuitem');
                var newrightsel = e.currentTarget.one('.menutable .rightCorner');
                if (newleftsel != null) {
                    newleftsel._node.setAttribute('class', 'leftCornersel');
                }
                if (newmidsel != null) {
                    newmidsel._node.setAttribute('class', 'midmenuitemsel');
                }
                if (newrightsel != null) {
                    newrightsel._node.setAttribute('class', 'rightCornersel');
                }
                //查找id
                var industid = newmidsel._node.getAttribute('industid');
                var redirectpath = "../Client/Schedule.aspx?ind=" + industid;

                window.parent.contentFrame.location.href = redirectpath;
            };
            Y.one('.menu').delegate('click', handleBoxClick, 'li');


            var moreclick = function (e) {
                alert("该功能暂未实现");


            }

            Y.one('#morediv').on('click', moreclick);

        });

      </script>
 


</head>
<body id ="head" class="head">

  <div id ="con" class="con" style="height:65px;">
    <div class="conleft"><img src="../images/yahoologo.png" alt=""/></div>
  </div>
  
  <div id="daohang" style="height:45px;" class="daohang">
	 

    <table class="daohanglayout"  cellpadding="0" cellspacing="0">
        <tr>
            <td class="daohanglayoutleft">
                 <ul id="menu" class="menu">
                 <% 
                     foreach (System.Data.DataRow dr in this.industTable.Rows)
                     {
                         //没行生成一个
                         string strHtml = @"<li><table class='menutable'  cellpadding='0' cellspacing='0'><tr><td class='leftCorner'></td><td class='midmenuitem'";
                         strHtml += " industid='";
                         strHtml += dr["IndustryCategory_ID"].ToString();
                         strHtml += "'>";
                         strHtml += dr["IndustryCategory"].ToString();
                         strHtml += "</td><td class='rightCorner'></td></tr></table></li>";
                         this.Response.Write(strHtml);
                         
                     }  
                 %>
                    <%--<li>
                    <table class="menutable"  cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="leftCorner"></td>
                        <td class="midmenuitem">计算机</td>
                        <td class="rightCorner"></td>
                    </tr>
                    </table> 
                    </li>
                    <li>
                    <table class="menutable"  cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="leftCorner"></td>
                        <td class="midmenuitem">金融</td>
                        <td class="rightCorner"></td>
                    </tr>
                    </table> 
                    </li>
                    <li>
                    <table class="menutable"  cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="leftCorner"></td>
                        <td class="midmenuitem">经济</td>
                        <td class="rightCorner"></td>
                    </tr>
                    </table> 
                    </li>
                    <li>
                    <table class="menutable"  cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="leftCorner"></td>
                        <td class="midmenuitem">互联网</td>
                        <td class="rightCorner"></td>
                    </tr>
                    </table> 
                    </li>--%>
                </ul>
            </td>
            <td class="daohanglayoutright">
                <div id="morediv" class="morediv">More •••</div>
            </td>
        </tr>
    </table> 
  </div>
   
  <div id="content" class="content">
        <iframe id="contentFrame"  name="contentFrame"   style="height: 100%; width:100%;padding-top:auto;overflow-x:hidden; overflow:hidden;" frameborder="0" ></iframe>
  </div>

  <div id="foot" class="foot" style="height:38px; padding-left:0px;">
      <div id="copyright" class="copyright" style="height:28px; padding-top:10px;">版权所有 未经书面授权禁止复制</div>
  </div>
</body>
</html>
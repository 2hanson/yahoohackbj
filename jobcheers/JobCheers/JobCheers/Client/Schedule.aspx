<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="JobCheers.Client.Schedule" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title> 
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="http://yui.yahooapis.com/3.10.1/build/yui/yui-min.js" type="text/javascript"></script>
     
    <link href="../ClientCSS/schedule.css" rel="stylesheet" type="text/css" />

    <script language="javascript" type="text/javascript">
        YUI().use('node', function (Y) {

            var handleBoxClick = function (e) { 
                window.location.href = "TimeLine.aspx";
            }; 
            Y.one('.schedulebox').delegate('click', handleBoxClick, 'li');

        });

    </script>

    <script language="javascript" type="text/javascript">


        function waterfalllayout() {//定义成函数便于调用
            var margin = 40; //这里设置间距
            var li = $("li"); //这里是区块名称
            var li_W = $("li")[0].offsetWidth + margin; //取区块的实际宽度（包含间距，这里使用源生的offsetWidth函数，不适用jQuery的width()函数是因为它不能取得实际宽度，例如元素内有pandding就不行了）

            var h = []; //记录区块高度的数组
            var layoutwidth = document.documentElement.offsetWidth - 70;
            if (layoutwidth < 0) {
                layoutwidth = 0;
            }
            var n = layoutwidth / li_W | 0; //窗口的宽度除以区块宽度就是一行能放几个区块
            //alert(n); alert(li_W);
            for (var i = 0; i < li.length; i++) 
            {
                //有多少个li就循环多少次
                li_H = li[i].offsetHeight; //获取每个li的高度
                if (i < n) 
                {
                    //n是一行最多的li，所以小于n就是第一行了
                    h[i] = li_H; //把每个li放到数组里面
                    li.eq(i).css("top", 0); //第一行的Li的top值为0
                    li.eq(i).css("left", i * li_W); //第i个li的左坐标就是i*li的宽度
                }
                else {
                    min_H = Math.min.apply(null, h); //取得数组中的最小值，区块中高度值最小的那个
                    minKey = getarraykey(h, min_H); //最小的值对应的指针
                    h[minKey] += li_H + margin; //加上新高度后更新高度值
                    li.eq(i).css("top", min_H + margin); //先得到高度最小的Li，然后把接下来的li放到它的下面
                    li.eq(i).css("left", minKey * li_W); //第i个li的左坐标就是i*li的宽度
                }
                //$("h3").eq(i).text("编号：" + i + "，高度：" + li_H); //把区块的序号和它的高度值写入对应的区块H3标题里面
            }
        }
        /* 使用for in运算返回数组中某一值的对应项数(比如算出最小的高度值是数组里面的第几个) */
        function getarraykey(s, v) 
        {
            for (k in s) {
                if (s[k] == v) {
                    return k; 
                } 
            } 
        }
        /*这里一定要用onload，因为图片不加载完就不知道高度值*/
        window.onload = function () {
            waterfalllayout(); 
        }
        /*浏览器窗口改变时也运行函数*/
        window.onresize = function () { waterfalllayout(); }
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
    <div id="searchDiv" class="searchDiv">
        <div style="text-align:right; width:80%;">
        <asp:TextBox ID="TextBox1" runat="server" Width="80%" Height="30px"></asp:TextBox>
        <div style="float:right; text-align:left;">
        <asp:ImageButton ID="ImageButton1"  runat="server"   Width="75px" Height="35px" 
                ImageUrl="~/images/sch.png"/> 
        </div>
        </div>
    </div>
    <div id="scheduleDiv" class="scheduleDiv">
      <ul id="schedulebox" class="schedulebox">
      <%
          
          int onlyid = 0;
          foreach (System.Data.DataRow dr in this.schTable.Rows)
          {
              int cuid =Int32.Parse(dr["JLSchedule_ID"].ToString());
              if (onlyid != cuid)
              {
                  string stype = dr["stype"].ToString();
                  if (stype == "0")
                  {
                      stype = "简单"; 
                  }
                  else if (stype == "1")
                  {
                      stype = "中等";
                  }
                  else if (stype == "2")
                  {
                      stype = "困难";
                  }
                  else if (stype == "3")
                  {
                      stype = "综合";
                  }
                  
                  //没行生成一个
                  string strHtml = "<li> <div><div><img src='" + dr["CompanyLogo"].ToString() + "'/> </div>";
                  strHtml += "<div class='scheduletagDiv'><a>●</a>工作攻略</div><div class='scheduleDesDiv'>";
                  strHtml += dr["place"].ToString();
                  strHtml += "  ";
                  strHtml += dr["JobCategory"].ToString();
                  strHtml += "  "; 
                  strHtml += stype;
                  strHtml += "</div></div></li>";
                  this.Response.Write(strHtml);
              }
              onlyid = cuid;
          }  
      %>
     <%-- <li> 
        <div>
            <div><img src="../images/yahoologo.png" /> </div>
            <div class="scheduletagDiv">
               <a>●</a>工作攻略</div>
            <div class="scheduleDesDiv">北京 项目经理</div>
        </div>
      </li>
      <li>
        <div>
            <div><img src="http://fs1.dajie.com/corplogo/50x50.png" width="20px"  height="20px" /> </div>
            <div class="scheduletagDiv">
             <a>●</a>工作攻略</div>
            <div  class="scheduleDesDiv">上海 项目经理</div>
        </div>
      </li>
      <li>
        <div>
            <div><img src="http://0.f1.dajieimg.com/group1/M00/28/68/CgogyFFhTlmAYnMeAAAAe6qVTF0062m.png" width="20px"  height="20px" /> </div>
            <div class="scheduletagDiv"><a>●</a>工作攻略</div>
            <div  class="scheduleDesDiv">上海 项目经理</div> 
        </div>
      </li>
      <li>
        <div>
            <div><img src="http://1.head00.dajieimg.com/2013/01/23/099/13589260990008481m.jpg" width="20px"  height="20px" /> </div>
            <div class="scheduletagDiv"><a>●</a>工作攻略</div>
            <div  class="scheduleDesDiv">上海 项目经理</div>
        </div>
      </li>
      <li>
        <div>
            <div><img src="http://fs1.dajie.com/newcorplogo/sqs/1315344_sqs.png" width="20px"  height="20px" /> </div>
            <div class="scheduletagDiv"><a>●</a>工作攻略</div>
            <div  class="scheduleDesDiv">上海 项目经理</div>
        </div>
      </li>
      <li>
        <div>
            <div><img src="http://fs1.dajie.com/newcorplogo/sqs/1310534_sqs.png" width="20px"  height="20px" /> </div>
            <div class="scheduletagDiv"><a>●</a>工作攻略</div>
            <div  class="scheduleDesDiv">上海 项目经理</div>
        </div>
      </li>
      <li>
        <div>
            <div><img src="http://0.head00.dajieimg.com/2012/09/11/173/13473505730001650m.png" width="20px"  height="20px" /> </div>
            <div class="scheduletagDiv"><a>●</a>工作攻略</div>
            <div  class="scheduleDesDiv">上海 项目经理</div>
        </div>
      </li>
      <li>
        <div>
            <div><img src="http://8.head00.dajieimg.com/2013/01/15/082/13582348820001248m.jpg" width="20px"  height="20px" /> </div>
            <div class="scheduletagDiv"><a>●</a>工作攻略</div>
            <div  class="scheduleDesDiv">上海 项目经理</div>
        </div>
      </li> --%>
    </ul>
    </div>
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TimeLine.aspx.cs" Inherits="JobCheers.Client.TimeLine" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../ClientCSS/timelinecss.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>


    <script language="javascript" type="text/javascript">

        function mylayout() {
            var layoutmid = document.documentElement.offsetWidth / 2;
            layoutmid = layoutmid - 18;
             
            var firstCirle = $("#adsp2");

            firstCirle.css("left", layoutmid);


        }


        window.onload = function () {
            mylayout();
        }
        
        window.onresize = function () { mylayout(); }
    </script>

    <style type="text/css"> 
			.adsp1 {
				position:absolute;
				background-image: url(images/job.png);
    			height: 36px;
    			width: 36px;
    			top: 30px;
    			left:0px;
			}
			.adsp2 {
				position:absolute;
				background-image: url(images/talk.png);
    			height: 36px;
    			width: 36px;
    			top: 210px;
    			left:353px;
			}
			.adsp3 {
				position:absolute;
				background-image: url(images/job.png);
    			height: 36px;
    			width: 36px;
    			top: 170px;
    			left:0px;
			}
			.adsp4 {
				position:absolute;
				background-image: url(images/talk.png);
    			height: 36px;
    			width: 36px;
    			top: 45px;
    			left:0px;
			}
			.adsp5 {
				position:absolute;
				background-image: url(images/job.png);
    			height: 36px;
    			width: 36px;
    			top: 185px;
    			left:0px;
			}
			.adsp6 {
				position:absolute;
				background-image: url(images/job.png);
    			height: 36px;
    			width: 36px;
    			top: 40px;
    			left:0px;
			}
      .havin {
          background-image: url(persons/havin.jpg);
          height: 36px;
          width: 36px;
          margin-bottom: 10px;
      }
		</style>

</head>
<body>
    <form id="form1" runat="server">
    <div style=" text-align:center;"> 
     <div id="emailDiv" class="emailDiv">
        <div style="text-align:right; width:80%;">
        <asp:TextBox ID="TextBox1" runat="server" placeholder="Email" Width="80%" Height="30px"></asp:TextBox>
        <div style="float:right; text-align:left;">
            <asp:Button ID="Button1" runat="server" Text="发送"   Width="75px" Height="35px" />
        </div>
        </div>
    </div>

    	<table id="timelineTb" class="timelineTb" border="0" cellpadding="0" cellspacing="0">
        <tr>
    		<td id="timelinelefttd" class="timelinelefttd">  

   				<table  style="width:100%;">
    			<tr>
                <td class="tiptd">
    			    <div  class="tipdiv">
    				    <div style="padding-left: 17px;">
    					    <div class="tipTopDiv">
    						<br/>
    						<label style="padding-left: 12px;">5月20日</label>
    						<label style="padding-left: 20px;">星期一</label>
    						<label style="padding-left: 120px;">工作</label>      
    					    </div>
    				    </div> 
    				    <br/>
                        <div class="tiplabeldiv">时间：2013-05-20</div>
                        <div class="tiplabeldiv">城市：北京</div>
                        <div class="tiplabeldiv">公司：中航泰克技术(北京)有限公司</div>
                        <div class="tiplabeldiv">  
       				    <label>推荐人: </label>
                        <img src="persons/John.jpg" height="36" width="36" alt="John" title="John"/>
       			         
                        </div>
                    </div>
       			</td>
                </tr>

       			<tr><td><br/></td></tr>

                <tr>
                <td class="tiptd">
    			    <div  class="tipdiv">
    				    <div style="padding-left: 17px;">
    					    <div class="tipTopDiv">
    						<br/>
    						<label style="padding-left: 12px;">5月21日</label>
    						<label style="padding-left: 20px;">星期二</label>
    						<label style="padding-left: 120px;">工作</label>      
    					    </div>
    				    </div>
    				    <br/>
                        <div  class="tiplabeldiv">时间：2013-05-21</div>
                        <div class="tiplabeldiv">城市： 北京</div>
                        <div class="tiplabeldiv">公司： 北京天下互联信息科技有限公司</div>
                        <div class="tiplabeldiv">  
       				    <label>推荐人: </label>
                        <img src="persons/Shiguang.jpg" style="float=right;" height="36" width="36" alt="Shiguang" title="Shiguang"/>
                        <img src="persons/James.jpg" style="float=right;" height="36" width="36" alt="James" title="James"/>
                        </div>
                    </div>
       			</td>
                </tr>

                <tr><td><br/><br/><br/><br/></td></tr>

                <tr>
                <td class="tiptd">
    			    <div  class="tipdiv">
    				    <div style="padding-left: 17px;">
    					    <div class="tipTopDiv">
    						<br/>
    						<label style="padding-left: 12px;">5月23日</label>
    						<label style="padding-left: 20px;">星期四</label>
    						<label style="padding-left: 120px;">工作</label>      
    					    </div>
    				    </div>
    				    <br/>
                        <div  class="tiplabeldiv">时间：2013-05-23</div>
                        <div class="tiplabeldiv">城市：北京</div>
                        <div class="tiplabeldiv">公司：骑士互动（北京）教育科技有限公司</div>
                        <div class="tiplabeldiv">  
       				    <label>推荐人:无 </label>
                         
                        </div>
                    </div>
       			</td>
                </tr>
       			</table>
              
    		</td>

    		<td id="timelinecentertd" class="timelinecentertd">
           <div class="timeline"></div> 
    		</td>

    		<td id="timelinerighttd" class="timelinerighttd">
    			<table border="0" style="width:100%;">
                <tr><td><br/><br/></td></tr>
    			<tr>
                    <td class="tiprtd">
    				<div class="tiprdiv" > 
						<div class="tiprrdiv">
                        <table class="rheadtable" cellpadding="0" cellspacing="0">
                        <tr style=" border:0px;">
                            <td class="rheadtableltd"></td>
                            <td class="rheadtableruptd"> 
                                <div class="rheadtablertddiv"> <br/>
    							<label style="padding-left: 12px;">方正2013实习生招聘北京大学宣讲会</label>
                                </div>  
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                            <div class="rheadtablertddowndiv">
    					    <br/>
                            <div  class="tiplabeldiv">时间：2013-05-20 19:00</div>
                            <div  class="tiplabeldiv">地点：北京大学 英杰交流中心月光厅</div>
                            <div  class="tiplabeldiv">
                            <label>推荐人: </label>
                            <img src="persons/havin.jpg" height="36" width="36" alt="havin" title="havin"/>
       					    </div>
                            </div>  
                            </td>
                        </tr>
                        </table> 
                        </div> 
    				</div>
                    </td>
    			</tr>

       			<tr><td><br/><br/><br/><br/><br/><br/></td></tr>
 
                <tr>
                    <td class="tiprtd">
    				<div class="tiprdiv" > 
						<div class="tiprrdiv">
                        <table class="rheadtable" cellpadding="0" cellspacing="0">
                        <tr style=" border:0px;">
                            <td class="rheadtableltd"></td>
                            <td class="rheadtableruptd"> 
                                <div class="rheadtablertddiv"> <br/>
    							<label style="padding-left: 12px;">深圳航空2013春季校园招聘北京宣讲会</label>
                                </div>  
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                            <div class="rheadtablertddowndiv">
    					    <br/>
                            <div  class="tiplabeldiv">时间：2013-05-22 19:00</div>
                            <div  class="tiplabeldiv">地点：北京北航唯实大厦(海淀区学院路39号)</div> 
                            <div  class="tiplabeldiv">
                            <label>推荐人: 无</label> 
       					    </div>
                            </div>  
                            </td>
                        </tr>
                        </table> 
                        </div> 
    				</div>
                    </td>
    			</tr> 
                 
    			
    			<tr><td><br/><br/><br/><br/><br/><br/></td></tr>
  
                <tr>
                    <td class="tiprtd">
    				<div class="tiprdiv" > 
						<div class="tiprrdiv">
                        <table class="rheadtable" cellpadding="0" cellspacing="0">
                        <tr style=" border:0px;">
                            <td class="rheadtableltd"></td>
                            <td class="rheadtableruptd"> 
                                <div class="rheadtablertddiv"> <br/>
    							<label style="padding-left: 12px;">5月24日</label>
    							<label style="padding-left: 20px;">星期五</label>
   								<label style="padding-left: 100px;">工作</label> 
                                </div>  
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                            <div class="rheadtablertddowndiv">
    					    <br/>
                            <div  class="tiplabeldiv">时间：2013-05-24</div>
                            <div  class="tiplabeldiv">城市：北京</div>
                            <div  class="tiplabeldiv">公司：人人网</div>
                          
                            <div  class="tiplabeldiv">
                            <label>推荐人: 无</label>  
       					    </div>
                            </div>  
                            </td>
                        </tr>
                        </table> 
                        </div> 
    				</div>
                    </td>
    			</tr>
    			</table>
    		</td>
          </tr>
    	</table>
        <div id="adsp2" class="adsp2"/>
        <div class="adsp1"/>
    	
    	<div class="adsp3"/>
    	<div class="adsp4"/>
    	<div class="adsp5"/>
    	<div class="adsp6"/>
      </div>
    </form>
</body>
</html>

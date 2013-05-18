<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TimeLine.aspx.cs" Inherits="JobCheers.Client.TimeLine" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../ClientCSS/timelinecss.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
			.lhbarimg {
    			background-image: url(images/lhb.png);
    			height: 46px;
    			width: 322px;
			}
			.rhbarimg {
    			background-image: url(images/rhbh.png);
    			height: 46px;
    			width: 304px;
    			padding-left: -1px;
    			z-index:1;
			}

			.rhbarheadimg {
    			background-image: url(images/rhb.png);
    			height: 46px;
    			width: 31px;
    			z-index:11;

			}

			.ldetailborder {
    			border-style: outset;
    			width: 330px;
    			border-width: 1px;
    			border-right-width: 1px;
			}

			.timeline {
				border-style: solid;
				height: 500px;
				border-width: 2px;
				width: 0px;
				border-color: rgb(192, 192, 192);
			}
			.rdetailborder {
    			border-style: outset;
    			width: 304px;
    			border-width: 1px;
    			border-left-width: 1px;
			}
			.search {
				width: 300px;
			}
			.adsp1 {
				position:absolute;
				background-image: url(images/job.png);
    			height: 36px;
    			width: 36px;
    			top: 65px;
    			left:353px;
			}
			.adsp2 {
				position:absolute;
				background-image: url(images/talk.png);
    			height: 36px;
    			width: 36px;
    			top: 44px;
    			left:0px;
			}
			.adsp3 {
				position:absolute;
				background-image: url(images/job.png);
    			height: 36px;
    			width: 36px;
    			top: 115px;
    			left:0px;
			}
			.adsp4 {
				position:absolute;
				background-image: url(images/talk.png);
    			height: 36px;
    			width: 36px;
    			top: 40px;
    			left:0px;
			}
			.adsp5 {
				position:absolute;
				background-image: url(images/job.png);
    			height: 36px;
    			width: 36px;
    			top: 115px;
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
         <div style="padding-left: 30px;">
    		<input type="text" placeholder="Email" class="search"/>
    		<button name="quackitButton" value="Submit" type="button">发送</button>
    	</div>

    	<table border="0">
        <tr>
    		<td>
   				<table border="0">
    			<tr>
                <td>
    			<div class="ldetailborder">
    				<div style="padding-left: 17px;">
    					<div class="lhbarimg">
    						<br/>
    						<label style="padding-left: 12px;">5月20日</label>
    						<label style="padding-left: 20px;">星期一</label>
    						<label style="padding-left: 120px;">工作</label>      
    					</div>
    				</div>
    				<br/>
    				<label style="padding-left: 12px;">时间: </label><br/>
       				<label style="padding-left: 12px;">城市: </label><br/>
       				<label style="padding-left: 12px;">推荐人: </label>
              <img src="persons/John.jpg" style="float=right;" height="36" width="36" alt="John" title="John"/>
       			</div>
       			</td>
                </tr>

       			<tr>
                <td></td>
       			<br/>
       			</tr>
       			<tr>
                <td>
    			<div class="ldetailborder">
    				<div style="padding-left: 17px;">
    					<div class="lhbarimg">
    						<br/>
    						<label style="padding-left: 12px;">5月22日</label>
    						<label style="padding-left: 20px;">星期三</label>
    						<label style="padding-left: 120px;">工作</label>      
    					</div>
    				</div>
    				<br/>
    				<label style="padding-left: 12px;">时间: </label><br/>
       				<label style="padding-left: 12px;">城市: </label><br/>
       				<label style="padding-left: 12px;">推荐人: </label>
              <img src="persons/Shiguang.jpg" style="float=right;" height="36" width="36" alt="Shiguang" title="Shiguang"/>
              <img src="persons/James.jpg" style="float=right;" height="36" width="36" alt="James" title="James"/>
       			</div>
       			</td>
                </tr>

       			<tr>
                <td>
       			<br/>
                </td>
       			</tr>
       			<tr><td>
    			<div class="ldetailborder">
    				<div style="padding-left: 17px;">
    					<div class="lhbarimg">
    						<br/>
    						<label style="padding-left: 12px;">5月24日</label>
    						<label style="padding-left: 20px;">星期五</label>
    						<label style="padding-left: 120px;">工作</label>      
    					</div>
    				</div>
    				<br/>
    				<label style="padding-left: 12px;">时间: </label><br/>
    				<label style="padding-left: 12px;">地点: </label><br/>
       				<label style="padding-left: 12px;">城市: </label><br/>
       				<label style="padding-left: 12px;">推荐人: 无</label>
       			</div>
       			</td>
                </tr>

       			</table>
    		</td>

    		<td>
    			<table style="padding-left: 19px;" border="0">
                <tr>
    				<td>
    					<div class="timeline">
    					</div>
    				</td>
                 </tr>
    			</table>
    		</td>

    		<td>
    			<table border="0">
    			<tr><td>
    				<div style="padding-left: 10px;">
						<div class="rhbarheadimg"/>
							<div style="padding-left: 10px;">
       							<div class="rdetailborder">
       								<div class="rhbarimg">
       									<br/>
    									<label style="padding-left: 12px;">5月21日</label>
    									<label style="padding-left: 20px;">星期二</label>
   										<label style="padding-left: 100px;">宣讲会</label>      
   									</div>
    							<br/>
    							<label style="padding-left: 30px;">时间: </label><br/>
    							<label style="padding-left: 30px;">地点: </label><br/>
       							  <label style="padding-left: 30px;">推荐人: </label>
                      <img src="persons/havin.jpg" style="float=right;" height="36" width="36" alt="havin" title="havin"/>
       						</div>
       					</div>
    				</div>
                    </td>
    			</tr>

       			<tr>
                <td>
       			<br/>
       			<br/>
       			<br/>
       			<br/>
       			<br/>
       			<br/>
                </td>
       			</tr>
 
    			<tr>
                <td>
    				<div style="padding-left: 10px;">
						<div class="rhbarheadimg"/>
							<div style="padding-left: 10px;">
       							<div class="rdetailborder">
       								<div class="rhbarimg">
       									<br/>
    									<label style="padding-left: 12px;">5月23日</label>
    									<label style="padding-left: 20px;">星期四</label>
   										<label style="padding-left: 100px;">宣讲会</label>      
   									</div>
    							<br/>
    							<label style="padding-left: 30px;">时间: </label><br/>
    							<label style="padding-left: 30px;">地点: </label><br/>
       							<label style="padding-left: 30px;">城市: </label><br/>
       							<label style="padding-left: 30px;">推荐人: 无</label>
       						</div>
       					</div>
    				</div>
                 </td>
    			</tr>
    			
    			<tr>
                <td>
       			<br/>
       			<br/>
       			<br/>
       			<br/>
       			<br/>
       			<br/>
                </td>
       			</tr>
 
    			<tr>
                <td>
    				<div style="padding-left: 10px;">
						<div class="rhbarheadimg"/>
							<div style="padding-left: 10px;">
       							<div class="rdetailborder">
       								<div class="rhbarimg">
       									<br/>
    									<label style="padding-left: 12px;">5月24日</label>
    									<label style="padding-left: 20px;">星期五</label>
   										<label style="padding-left: 120px;">工作</label>      
   									</div>
    							<br/>
    							<label style="padding-left: 30px;">时间: </label><br/>
    							<label style="padding-left: 30px;">地点: </label><br/>
       							<label style="padding-left: 30px;">城市: </label><br/>
       							<label style="padding-left: 30px;">推荐人: 无</label>
       						</div>
       					</div>
    				</div>
                    </td>
    			</tr>
    			</table>
    		</td>
          </tr>
    	</table>

    	<div class="adsp1"/>
    	<div class="adsp2"/>
    	<div class="adsp3"/>
    	<div class="adsp4"/>
    	<div class="adsp5"/>
    	<div class="adsp6"/>
    </form>
</body>
</html>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace JobCheers.Client
{
    public partial class Schedule : System.Web.UI.Page
    {
        protected DataTable schTable;
        protected int industid;

        protected void Page_Init(object sender, EventArgs e)
        {
            try
            {
                this.industid = System.Int32.Parse(Page.Request["ind"]);
            }
            catch
            {
                this.Response.Redirect("../ErrorPage.aspx", false); 
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                schTable = f_getIndust();

                if (!IsPostBack)
                {
                    this.EnableViewState = true; 
                }
                else
                {
                }
            }
            catch
            {
            }
        }



        private DataTable f_getIndust()
        {
            try
            {
                string sql = @"select distinct a.JLSchedule_ID,a.place, c.JobCategory,d.CompanyLogo
from JL_JobLandingSchedule as a
join JL_TimeLine as b on b.JLSchedule_ID = a.JLSchedule_ID
join JL_PositionOffer as c on c.PositionOffer_ID = b.PositionOffer_ID	
join JL_Company as d on d.Company_ID = c.Company_ID
where a.IndustryCategory_ID=@IndustryCategory_ID and b.PositionOffer_ID is not null 
and a.IsActive = '1' and b.IsActive = '1' and c.IsActive='1' and d.IsActive = '1'
order by a.JLSchedule_ID";
                SqlParameter sp1 = new SqlParameter("@IndustryCategory_ID", this.industid);

                SqlParameter[] sps = new SqlParameter[1] { sp1 };
                DataControlDB dcdb = new DataControlDB();
                dcdb.OpenConnection();
                schTable = dcdb.ExecuteQueryReturnTable(sql, sps);
                dcdb.CloseConnection();
                return schTable;
            }
            catch
            {
                return null;
            }
        }

    }
}
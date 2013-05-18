using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace JobCheers.MainFrame
{
    public partial class Main : System.Web.UI.Page
    {
        protected DataTable industTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                industTable=f_getIndust();

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
                string sql = @"select top 7 a.IndustryCategory_ID,a.IndustryCategory,COUNT(a.IndustryCategory_ID) as industSchCount
from Sys_IndustryCategory as a
left join JL_JobLandingSchedule as b
	on b.IndustryCategory_ID = a.IndustryCategory_ID
where a.IsActive='1' and b.IsActive='1' and a.IndustryCategory <> ' ---'
group by a.IndustryCategory_ID,a.IndustryCategory
order by industSchCount desc";
                 

                SqlParameter[] sps = new SqlParameter[] { };
                DataControlDB dcdb = new DataControlDB();
                dcdb.OpenConnection();
                industTable = dcdb.ExecuteQueryReturnTable(sql, sps);
                dcdb.CloseConnection();
                return industTable;
            }
            catch 
            { 
                return null;
            }
        }

    }
}
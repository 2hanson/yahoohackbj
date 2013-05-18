using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace JobCheers
{
    /// <summary>
    /// DataControlDB 的摘要说明
    /// </summary>
    public class DataControlDB
    {
        #region  字段
        public string error;
        public SqlConnection objConn;
        public SqlDataAdapter objDA;
        protected string ConnectionString;
        public DataTable objDatatable;
        public SqlCommand cm;
        #endregion

        #region 构造函数
        /// <summary> 
        /// 类的构造函数 
        /// </summary> 
        public DataControlDB()
        {
            ConnectionString = GetConnectionString();
            objConn = new SqlConnection(ConnectionString);
            objDA = new SqlDataAdapter("", objConn);
        }

        ~DataControlDB()
        {
            CloseConnection();
        }
        #endregion

        #region 连接串
        /// <summary> 
        /// 从配置文件中加载链接字符串ConnectionString
        /// </summary> 
        /// <returns></returns> 
        public string GetConnectionString()
        {
            string strConnection = "";
            try
            {
                strConnection = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString();

                if (strConnection == "")
                    throw new Exception("Database connection string is not defined");
                else
                    return strConnection;
            }
            catch (Exception e)
            {
                throw new Exception("Error in GetConnectionString!!! Source:" + e.Source.ToString() + " Message:" + e.Message.ToString());
            }
        }
        #endregion

        #region 打开，关闭连接
        public string IsOpenConnection()
        {
            try
            {
                if (objConn.State == ConnectionState.Broken || objConn.State == ConnectionState.Closed)
                {
                    objConn.Open();
                }
                return "";
            }
            catch (Exception e)
            {
                return "Message:" + e.Message.ToString();
                //throw new Exception("Error In Opening Connection!!! Source:" + e.Source.ToString() + " Message:" + e.Message.ToString());
                //return HttpCompileException "Message:"+e.Message.ToString();             
            }
        }
        public bool OpenConnection()
        {
            try
            {
                if (objConn.State == ConnectionState.Broken || objConn.State == ConnectionState.Closed)
                {
                    objConn.Open();
                }
                return true;
            }
            catch (Exception e)
            {
                throw new Exception("Error In Opening Connection!!! Source:" + e.Source.ToString() + " Message:" + e.Message.ToString());
            }
        }
        public void CloseConnection()
        {
            try
            {
                if (objConn.State == ConnectionState.Broken || objConn.State == ConnectionState.Open)
                {
                    objConn.Close();
                }

            }
            catch (Exception e)
            {
                throw new Exception("Error In Closing Connection!!! Source:" + e.Source.ToString() + " Message:" + e.Message.ToString());
            }
        }
        #endregion

        //执行存储过程，不返回值
        public void ExecuteProcedure(string procedureName, SqlParameter[] sps)
        {
            try
            {
                if (objConn.State != ConnectionState.Open)
                {
                    OpenConnection();

                }
                this.cm = new SqlCommand(procedureName, this.objConn);
                this.cm.CommandType = CommandType.StoredProcedure;
                foreach (SqlParameter sp in sps)
                {
                    this.cm.Parameters.Add(sp);
                }
                cm.ExecuteNonQuery();

            }
            catch (Exception e)
            {
                throw new Exception("Error in ExecuteQuery!!! Source:" + e.Source.ToString() + " Message:" + e.Message.ToString());
            }
        }

        //执行存储过程，返回ID值
        public int ExecuteProcedureReturnID(string procedureName, SqlParameter[] sps, string returnField)
        {
            try
            {
                if (objConn.State != ConnectionState.Open)
                {
                    OpenConnection();

                }
                this.cm = new SqlCommand(procedureName, this.objConn);
                this.cm.CommandType = CommandType.StoredProcedure;
                foreach (SqlParameter sp in sps)
                {
                    this.cm.Parameters.Add(sp);
                }

                SqlParameter pId = new SqlParameter(returnField, SqlDbType.Int);
                pId.Direction = ParameterDirection.Output;
                cm.Parameters.Add(pId);

                cm.ExecuteNonQuery();


                return Int32.Parse(pId.Value.ToString());

            }
            catch (Exception e)
            {
                throw new Exception("Error in ExecuteQuery!!! Source:" + e.Source.ToString() + " Message:" + e.Message.ToString());
            }
        }


        #region 查询通用函数
        /// <summary>
        /// 通用查询函数，参数化命令查询
        /// </summary>
        /// <param name="Query">查询语句</param>
        /// <param name="spc">参数集合</param>
        /// <returns>查询结果</returns>
        public DataTable ExecuteQueryReturnTable(string Query, SqlParameterCollection spc)
        {
            try
            {
                objDatatable = new DataTable();
                if (objConn.State != ConnectionState.Open)
                {
                    OpenConnection();

                }
                this.cm = new SqlCommand(Query, this.objConn);
                foreach (SqlParameter sp in spc)
                {
                    this.cm.Parameters.Add(sp);
                }
                this.objDA = new SqlDataAdapter(cm);
                objDA.Fill(objDatatable);
                return objDatatable;
            }
            catch (Exception e)
            {
                throw new Exception("Error in ExecuteQuery!!! Source:" + e.Source.ToString() + " Message:" + e.Message.ToString());
            }
        }



        /// <summary>
        /// 通用查询函数，参数化命令查询
        /// </summary>
        /// <param name="Query">查询语句</param>
        /// <param name="sps">参数数组</param>
        /// <returns>查询结果</returns>
        public DataTable ExecuteQueryReturnTable(string Query, SqlParameter[] sps)
        {
            try
            {
                objDatatable = new DataTable();
                if (objConn.State != ConnectionState.Open)
                {
                    OpenConnection();

                }
                this.cm = new SqlCommand(Query, this.objConn);
                foreach (SqlParameter sp in sps)
                {
                    this.cm.Parameters.Add(sp);
                }
                this.objDA = new SqlDataAdapter(cm);
                objDA.Fill(objDatatable);
                return objDatatable;
            }
            catch (Exception e)
            {
                throw new Exception("Error in ExecuteQuery!!! Source:" + e.Source.ToString() + " Message:" + e.Message.ToString());
            }
        }
        public DataTable ExecuteProccederReturnTable(string proccederName, SqlParameter[] sps)
        {
            try
            {
                objDatatable = new DataTable();
                if (objConn.State != ConnectionState.Open)
                {
                    OpenConnection();

                }
                this.cm = new SqlCommand(proccederName, this.objConn);
                this.cm.CommandType = CommandType.StoredProcedure;
                foreach (SqlParameter sp in sps)
                {
                    this.cm.Parameters.Add(sp);
                }
                this.objDA = new SqlDataAdapter(cm);
                objDA.Fill(objDatatable);
                return objDatatable;
            }
            catch (Exception e)
            {
                throw new Exception("Error in ExecuteQuery!!! Source:" + e.Source.ToString() + " Message:" + e.Message.ToString());
            }
        }
        /// <summary>
        /// 通用查询函数，参数化命令查询（参数名数组的长度必须和参数值数组的长度一致）
        /// </summary>
        /// <param name="Query">查询语句</param>
        /// <param name="parameterNames">参数名数组</param>
        /// <param name="parameterValues">参数值数组</param>
        /// <returns>查询结果</returns>
        public DataTable ExecuteQueryReturnTable(string Query, string[] parameterNames, object[] parameterValues)
        {
            if (parameterNames.Length != parameterValues.Length)
            {
                return null;
            }
            try
            {
                objDatatable = new DataTable();
                if (objConn.State != ConnectionState.Open)
                {
                    OpenConnection();
                }
                this.cm = new SqlCommand(Query, this.objConn);
                for (int i = 0; i < parameterNames.Length; i++)
                {
                    SqlParameter sp = new SqlParameter(parameterNames[i], parameterValues[i]);
                    cm.Parameters.Add(sp);
                }
                this.objDA = new SqlDataAdapter(cm);
                objDA.Fill(objDatatable);
                return objDatatable;
            }
            catch (Exception e)
            {
                throw new Exception("Error in ExecuteQuery!!! Source:" + e.Source.ToString() + " Message:" + e.Message.ToString());
            }
        }
        public DataSet ExecuteQueryReturnDataSet(string Query, SqlParameter[] sps)
        {
            try
            {
                DataSet _ds = new DataSet();
                if (objConn.State != ConnectionState.Open)
                {
                    OpenConnection();

                }

                this.cm = new SqlCommand(Query, this.objConn);
                this.cm.CommandType = CommandType.Text;
                foreach (SqlParameter sp in sps)
                {
                    this.cm.Parameters.Add(sp);
                }
                this.objDA = new SqlDataAdapter(cm);
                objDA.Fill(_ds);
                return _ds;
            }
            catch (Exception e)
            {
                throw new Exception("Error in ExecuteQuery!!! Source:" + e.Source.ToString() + " Message:" + e.Message.ToString());
            }
        }


        /// <summary>
        /// 针对单表或者多表： 获取分页显示数据，以table形式返回相应页的数据
        /// </summary>
        /// <param name="tblName">表名，多表表名之间用逗号隔开</param>
        /// <param name="fldName">字段名：多个字段以逗号隔开</param>
        /// <param name="pageSize">每页包含的记录数</param>
        /// <param name="page">页码</param>
        /// <param name="pageCount">总页数，主要用来返回</param>
        /// <param name="Counts">总记录数目，主要用来返回</param>
        /// <param name="fldSort">按照哪个字段进行排序</param>
        /// <param name="Sort">false时为顺序</param>
        /// <param name="dist">是否添加查询字段的 DISTINCT 默认false不添加/true添加</param>
        /// <param name="strCondition">条件语句，无条件时置为null</param>
        /// <param name="ID">主表的主键字段名称</param>
        /// <returns></returns>
        public DataTable ExecutePagelistProReturnTable(string tblName, string fldName, int pageSize, int page,
             ref int pageCount, ref int Counts, string fldSort, bool Sort, bool dist, string strCondition, string ID)
        {
            objDatatable = new DataTable();
            try
            {
                if (objConn.State != ConnectionState.Open)
                {
                    OpenConnection();
                }
                cm = new SqlCommand("Pagelist", this.objConn);
                cm.CommandType = CommandType.StoredProcedure;

                cm.Parameters.Add(new SqlParameter("@tblName", SqlDbType.NVarChar, 200));
                cm.Parameters.Add(new SqlParameter("@fldName", SqlDbType.NVarChar, 500));
                cm.Parameters.Add(new SqlParameter("@pageSize", SqlDbType.Int));
                cm.Parameters.Add(new SqlParameter("@page", SqlDbType.Int));
                cm.Parameters.Add(new SqlParameter("@pageCount", SqlDbType.Int));
                cm.Parameters["@pageCount"].Direction = ParameterDirection.Output;
                cm.Parameters.Add(new SqlParameter("@Counts", SqlDbType.Int));
                cm.Parameters["@Counts"].Direction = ParameterDirection.Output;
                cm.Parameters.Add(new SqlParameter("@fldSort", SqlDbType.NVarChar, 200));
                cm.Parameters.Add(new SqlParameter("@Sort", SqlDbType.Bit));
                cm.Parameters.Add(new SqlParameter("@strCondition", SqlDbType.NVarChar, 1000));
                cm.Parameters.Add(new SqlParameter("@ID", SqlDbType.NVarChar, 150));
                cm.Parameters.Add(new SqlParameter("@Dist", SqlDbType.Bit));

                cm.Parameters["@tblName"].Value = tblName;
                cm.Parameters["@fldName"].Value = fldName;
                cm.Parameters["@pageSize"].Value = pageSize;
                cm.Parameters["@page"].Value = page;
                cm.Parameters["@pageCount"].Value = pageCount;
                cm.Parameters["@Counts"].Value = Counts;
                cm.Parameters["@fldSort"].Value = fldSort;
                cm.Parameters["@Sort"].Value = Sort;
                cm.Parameters["@strCondition"].Value = strCondition;
                cm.Parameters["@ID"].Value = ID;
                cm.Parameters["@Dist"].Value = dist;

                this.objDA = new SqlDataAdapter(cm);
                this.objDA.Fill(objDatatable);
                pageCount = System.Int32.Parse(cm.Parameters["@pageCount"].Value.ToString());
                Counts = System.Int32.Parse(cm.Parameters["@Counts"].Value.ToString());
                return this.objDatatable;
            }
            catch (Exception e)
            {
                throw new Exception("Error In Error in ExecuteQuery!!! Source:" + e.Source.ToString() + " Message:" + e.Message.ToString());
            }
            //return this.objDatatable;
        }
        /// <summary>
        /// 返回指定页码的数据,实现此功能优先推荐ExecutePagelistProReturnTable方法
        /// </summary> 
        ///<param name="Query">查询串</param>  
        /// <param name="pageSize">单页最大记录数</param>
        /// <param name="page">页号</param>   
        /// <param name="pageCount">页码总数，用来返回</param>
        /// <param name="Counts">总记录数，用来返回</param>
        /// <returns></returns>
        public DataTable GetListPageTable(string Query, int pageSize, int page, ref int pageCount, ref int Counts)
        {
            return null;
        }

        #endregion

        #region 删除，更新通用函数
        public void ExecuteNonQuery(string sqlText, SqlParameterCollection spc)
        {
            try
            {
                if (objConn.State != ConnectionState.Open)
                {
                    OpenConnection();
                }
                this.cm = new SqlCommand(sqlText, this.objConn);
                foreach (SqlParameter sp in spc)
                {
                    this.cm.Parameters.Add(sp);
                }
                cm.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("Error in ExecuteQuery!!! Source:" + e.Source.ToString() + " Message:" + e.Message.ToString());
            }
        }
        public void ExecuteNonQuery(string sqlText, SqlParameter[] sps)
        {
            try
            {
                if (objConn.State != ConnectionState.Open)
                {
                    OpenConnection();
                }
                this.cm = new SqlCommand(sqlText, this.objConn);
                foreach (SqlParameter sp in sps)
                {
                    this.cm.Parameters.Add(sp);
                }
                cm.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("Error in ExecuteQuery!!! Source:" + e.Source.ToString() + " Message:" + e.Message.ToString());
            }
        }

        public void ExecuteNonQuery(string sqlText, string[] parameterNames, object[] parameterValues)
        {
            try
            {
                if (objConn.State != ConnectionState.Open)
                {
                    OpenConnection();
                }
                this.cm = new SqlCommand(sqlText, this.objConn);
                for (int i = 0; i < parameterNames.Length; i++)
                {
                    SqlParameter sp = new SqlParameter(parameterNames[i], parameterValues[i]);
                    cm.Parameters.Add(sp);
                }
                cm.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("Error in ExecuteQuery!!! Source:" + e.Source.ToString() + " Message:" + e.Message.ToString());
            }
        }

        public int ExecuteQuery1(string sqlText, SqlParameter[] sps)
        {
            try
            {
                if (objConn.State != ConnectionState.Open)
                {
                    OpenConnection();
                }
                this.cm = new SqlCommand(sqlText, this.objConn);
                if (sps != null)
                {
                    foreach (SqlParameter sp in sps)
                    {
                        this.cm.Parameters.Add(sp);
                    }
                }
                return cm.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("Error in ExecuteQuery!!! Source:" + e.Source.ToString() + " Message:" + e.Message.ToString());
            }
        }


        public int ExecuteQuery(string sqlText, SqlParameter[] sps)
        {
            try
            {
                if (objConn.State != ConnectionState.Open)
                {
                    OpenConnection();
                }
                this.cm = new SqlCommand(sqlText, this.objConn);
                if (sps != null)
                {
                    foreach (SqlParameter sp in sps)
                    {
                        this.cm.Parameters.Add(sp);
                    }
                }
                int i = Convert.ToInt32(cm.ExecuteScalar());
                return i;
            }
            catch (Exception e)
            {
                throw new Exception("Error in ExecuteQuery!!! Source:" + e.Source.ToString() + " Message:" + e.Message.ToString());
            }
        }


        #endregion

    }
     
}
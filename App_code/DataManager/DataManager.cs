using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

/// <summary>
/// Summary description for DataManager
/// </summary>
public class DataManager
{
    public SqlConnection myConn;
    private SqlTransaction myTrans;
    public int ConnectionTimeOut;

    public DataManager()
    {

    }
    //Get values from config settings
    public static string GetCongig(string configSettingName)
    {
        return
        System.Configuration.ConfigurationManager.AppSettings[configSettingName];
    }

    # region Routine to Establish SQL Connection
    /*------------------------------------------
     Routine to establish SQL Connection
    ------------------------------------------*/
    public bool OpenSQLConnection()
    {
        bool bAttempToConnect = false;
        try
        {
            if (myConn == null)
                bAttempToConnect = true;
            if (bAttempToConnect == false)
            {
                if ((myConn.State == ConnectionState.Closed) || (myConn.State == ConnectionState.Broken))
                    bAttempToConnect = true;
            }
            if (bAttempToConnect)
            {
                myConn = new SqlConnection();
                myConn.ConnectionString = GetConnectionString();
                myConn.Open();
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
        return bAttempToConnect;
    }
    #endregion
    public string ExecuteQuery(string a_strSQLCommand)
    {
        if (OpenSQLConnection())
        {
            System.Data.SqlClient.SqlCommand objCommand = new System.Data.SqlClient.SqlCommand(a_strSQLCommand);
            try
            {
                objCommand.Connection = myConn;
                objCommand.CommandType = CommandType.Text;
                objCommand.ExecuteNonQuery();
                objCommand.Dispose();
                CloseConnection();
                return "Executed Successfully";
            }
            catch (Exception ex)
            {
                return ex.Message.Trim();
            }
        }
        else
        {
            return "Connection Failed";
        }
    }

    #region Routine to Close SQL Connection
    /*--------------------------------------
       ' Routine to Close Connection
       '---------------------------------------*/
    public void CloseConnection()
    {
        try
        {
            if (myConn.State == ConnectionState.Open)
                myConn.Close();
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
    }
    #endregion

    #region Routine to get Connection String from Web.Config
    /*------------------------------------------------
    'Routine to get Connection String from Web.config
    '--------------------------------------------------*/
    public string GetConnectionString()
    {
        //string strConnectionString = ConfigurationSettings.AppSettings["ConnStr"];
        string strConnectionString = ConfigurationManager.AppSettings["ConnStr"];
        return strConnectionString;
    }
    #endregion

    #region Routine to Get DataSet for Passed SQL Command
    /*---------------------------------------------------
    'Routine to get DataSet for Passed SQL Command
    '---------------------------------------------------*/
    public DataSet GetDataSet(string a_strDataSource)
    {
        System.Data.SqlClient.SqlDataAdapter myAdapter;
        DataSet DS;
        try
        {
            DS = new DataSet();
            myAdapter = new
            System.Data.SqlClient.SqlDataAdapter(a_strDataSource, GetConnectionString());
            myAdapter.SelectCommand.CommandTimeout = ConnectionTimeOut;
            myAdapter.Fill(DS);
            myAdapter.Dispose();
            myAdapter = null;
            return DS;
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            return null;
        }
        finally
        {
            //DS.Dispose();
        }
    }
    #endregion




    #region Routine to Execute SQL Command
    /*----------------------------------
     'Routine to Execute SQL Command
     '-----------------------------------*/
    public string ExecuteSQLCommand(string a_strSQLCommand, bool a_bReturnValue)
    {
        if (!a_bReturnValue)
        {
            if (OpenSQLConnection())
            {
                System.Data.SqlClient.SqlCommand objCommand = new System.Data.SqlClient.SqlCommand(a_strSQLCommand);
                try
                {
                    objCommand.Connection = myConn;
                    objCommand.CommandType = CommandType.Text;
                    objCommand.ExecuteNonQuery();
                    objCommand.Dispose();
                    return string.Empty;
                }
                catch (Exception ex)
                {
                    return ex.Message.Trim();
                }
            }
            else
            {
                return "Connection Failed";
            }
        }
        else
        {
            try
            {
                DataView oDv = GetDataView(a_strSQLCommand);
                DataTable oDt = oDv.Table;
                if (oDt == null)
                {
                    return String.Empty;
                }
                String strRetString = String.Empty;
                try
                {
                    strRetString = oDt.Rows[0].ItemArray[0] as string;
                }
                catch (Exception ex)
                {
                    ex.Data.Clear();
                }
                oDt.Dispose();
                oDt = null;
                return strRetString;
            }
            catch (Exception ex)
            {
                ex.Data.Clear();
                return string.Empty;
            }
        }
    }
    #endregion

    #region Routine to execute and return SQLDataReader
    /*----------------------------------------------
     * 'Routine to execute and return SQLDataReader
     '-----------------------------------------------*/
    public SqlDataReader GetSQLDataReader(string a_strSQLCommand)
    {
        System.Data.SqlClient.SqlDataReader oSQLDR;
        System.Data.SqlClient.SqlCommand objCommand;
        try
        {
            bool AttemptToConnect = OpenSQLConnection();
            objCommand = new
            System.Data.SqlClient.SqlCommand(a_strSQLCommand);
            objCommand.Connection = myConn;
            objCommand.CommandTimeout = ConnectionTimeOut;
            objCommand.CommandType = CommandType.Text;
            oSQLDR = objCommand.ExecuteReader();
            objCommand.Dispose();
            return oSQLDR;
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            return null;
        }
    }
    #endregion

    #region Routine to Check whether the Record Exists in Data Base
    /*------------------------------------------------------------
       'Routine to Check whether the Record Exists in Data Base
       '----------------------------------------------------------*/
    public bool CheckIsRecordExist(string a_strChkSQLCommand)
    {
        System.Data.SqlClient.SqlCommand objCommand;
        bool RecordExists = false;
        try
        {
            bool AttemptToConnect = OpenSQLConnection();
            objCommand = new
            System.Data.SqlClient.SqlCommand(a_strChkSQLCommand);
            objCommand.Connection = myConn;
            objCommand.CommandTimeout = ConnectionTimeOut;
            objCommand.CommandType = CommandType.Text;
            string result = Convert.ToString(objCommand.ExecuteScalar());
            objCommand.Dispose();
            if (result != "")
            {
                RecordExists = true;
            }
            return RecordExists;
        }
        catch (SqlException ex)
        {
            ex.Data.Clear();
            return RecordExists;
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            return RecordExists;
        }
        finally
        {
            CloseConnection();
        }
    }
    #endregion


    public DataView GetDataView(string a_strSQLCommand)
    {

        DataView oDV = new DataView();
        try
        {
            DataTable oDT;
            System.Data.SqlClient.SqlDataReader oSQLDR = GetSQLDataReader(a_strSQLCommand);
            oDT = new DataTable("tmpTable");
            DataRow oDR;
            for (int iCount = 0; iCount < oSQLDR.FieldCount - 1; iCount++)
            {
                oDT.Columns.Add(oSQLDR.GetName(iCount), oSQLDR.GetFieldType(iCount));
            }
            while (oSQLDR.Read())
            {
                oDR = oDT.NewRow();
                for (int iCount = 0; iCount < oSQLDR.FieldCount - 1; iCount++)
                {
                    oDR.ItemArray[iCount] = oSQLDR.GetValue(iCount);
                }
                oDT.Rows.Add(oDR);
            }
            oSQLDR.Close();
            oDV.AllowDelete = false;
            oDV.AllowEdit = false;
            oDV.AllowNew = false;

        }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
        return oDV;
    }
    #region to Bind data to Grid
    public string BindtoGrid(GridView grdDefault, string strSql)
    {
        string count = "0";
        try
        {
            DataSet DS = new DataSet();
            DS = GetDataSet(strSql);
            grdDefault.DataSource = DS.Tables[0];
            count = DS.Tables[0].Rows.Count.ToString();
            grdDefault.DataBind();
        }
        catch
        {
            count = "0";
        }
        return count;
    }
    #endregion

    #region to Bind Dropdown
    public void BindToDDL(DropDownList drpexpl, string strQry)
    {
        try
        {
            DataSet ds;
            ds = GetDataSet(strQry);
            drpexpl.DataSource = ds.Tables[0];
            drpexpl.DataTextField = ds.Tables[0].Columns[1].ToString();
            drpexpl.DataValueField = ds.Tables[0].Columns[1].ToString();
        }
        catch (Exception ex)
        {
        }
    }
    #endregion
}
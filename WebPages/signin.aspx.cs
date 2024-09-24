using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;



public partial class WebPages_signin : System.Web.UI.Page
{
    DataManager dm = new DataManager();
    protected void Page_Load(object sender, EventArgs e)
    {  if (!IsPostBack)
        Fillcaptcha();

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        
        Fillcaptcha();
    }



    protected void signInbtn_Click(object sender, EventArgs e)
    {
        int result = 0;
        string email = emailtxtbx.Text;
        string password = pastxtbx.Text;

        if (txtStopSpam.Text == ViewState["spam"].ToString())
        {
            string qry = "select std_masterId,student_email,student_password from tbl_signin where student_email='" + email + "' and student_password ='" + password + "' and student_ActiveFlag=1";
            DataSet ds = dm.GetDataSet(qry);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    result = int.Parse(ds.Tables[0].Rows[0]["std_masterId"].ToString());
                }
            }
            if (result > 0)
            {
                ////login successful message
                //lable.Text = "login successful";
                //lable.ForeColor = System.Drawing.Color.White;
                //Response.Write("successfull");
                //Response.Redirect("student.aspx");
                ShowMessageAndRedirect("login successful", "student.aspx");


            }
            else
            {
                //login not successful message
                //lable.Text = "login unsuccessful";
                //lable.ForeColor = System.Drawing.Color.Black;
                //ShowMessage("login unsuccesful");
                ShowMessage("Invalid E-mail or password");
            }

        }
        else
        {
            //lable.Text = "Invalid captcha";
            ShowMessage("Invalid captcha");
        }

    }


    protected void LinkButton2_Click(object sender, EventArgs e)
    {

        Fillcaptcha();


    }






    private void Fillcaptcha()
    {
        Random r = new Random();
        int fno = r.Next(1, 9);
        int sno = r.Next(1, 9);
        ViewState["spam"] = fno + sno;
        lb1StopSpam.Text = fno.ToString() + "+" + sno.ToString() + "=";
    
    }


    protected void resetbtn_Click(object sender, EventArgs e)
    {

        emailtxtbx.Text = String.Empty;
        pastxtbx.Text = String.Empty;
        txtStopSpam.Text = String.Empty;
       

    }



    public void ShowMessage(string msg)
    {
        String Message = "alert('" + msg + "');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Message", Message, true);
    }

    private void ShowMessageAndRedirect(string msg, string url)
    {
        try
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("function Redirect()");
            sb.Append("{");
            sb.Append(" window.location.href='" + url + "'");
            sb.Append("}");
            sb.Append("alert('" + msg + "');");
            sb.Append("setTimeout('Redirect()',1000);");
            Response.Write("<script>" + sb + "</script>");
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            //Response.Redirect("oops.aspx");
        }
    }


}

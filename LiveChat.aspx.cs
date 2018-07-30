/***************************************************************************************
Program Name    :  LiveChat.aspx.cs
Written By      :  Sanket Khedekar
Written On      :  06/06/2016
Called From     :  LiveChat.aspx
Purpose         :  Live Chat Function
***************************************************************************************/

using System;
using System.Web.UI;
using System.Windows.Forms;
using System.Windows.Controls;

public partial class LiveChat : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        /*try
        {
            if (Session["User_Id"] != null || Session["UserId"] != null)
            {
                string strRole = Convert.ToString(Session["Role"]);
                if (strRole == "Admin" || strRole == "SuperAdmin" || Session["EmailID"] != "")
                {
                    pUsers.Visible = false;
                    pChat.Visible = true;
                }
                else
                {
                    pUsers.Visible = true;
                    pChat.Visible = false;
                }
            }
            else
            {
                pUsers.Visible = true;
                pChat.Visible = false;
            }
        }

        catch (Exception ex)
        {
            throw (ex);
        }*/
        if (!IsPostBack)
        {
            Application["Message"] = null;
        }
        else
        {
            string Message = (string)Application["Message"];
            txtChatMessage.Text = Message;            
        }
    }

    protected void GetMessage(object sender, EventArgs e)
    {
        string Message = (string)Application["Message"];
        txtChatMessage.Text = Message;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            Session["EmailID"] = txtEmailID.Text.ToString().Trim();
            Session["LiveChatUserName"] = txtUserName.Text.ToString().Trim();
            lblUserName.Text = "Welcome " + txtUserName.Text.ToString();
            txtUserName.Text = string.Empty;
            pUsers.Visible = false;
            pChat.Visible = true;
        }

        catch (Exception ex)
        {
            throw (ex);
        }
    }
    
    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            
            string Name = string.Empty;
            /*string strRole = Convert.ToString(Session["Role"]);
            if (strRole == "Admin" || strRole == "SuperAdmin")
            {
                Name = "Admin";
            }
            else
            {*/
                Name = Session["LiveChatUserName"].ToString().Trim();
            //}
            string Chat = txtChat.Text.ToString();
            string Message = Name + ":: " + Chat;

            Application["Message"] = Message + Environment.NewLine + Application["Message"];
            txtChat.Text = string.Empty;
        }

        catch (Exception ex)
        {
            throw (ex);
        }
    }

}
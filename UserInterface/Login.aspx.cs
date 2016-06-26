using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserInterface.RogersWS;

namespace UserInterface
{
    public partial class Login : System.Web.UI.Page
    {
        private Rogers_API api = new Rogers_API();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                Validate();
            } else
            {
                Session["user"] = null;
            }
        }

        public void UserValidate(object source, ServerValidateEventArgs args)
        {   
            if (api.searchEmployee(txtUser.Text) == null)
            {
                 args.IsValid = (api.searchEmployee(txtUser.Text).First() == null);
            } else
            {
                args.IsValid = false;
            }
            
        }

        public void PasswordValidate(object source, ServerValidateEventArgs args)
        {
            if (api.searchEmployee(txtUser.Text) == null)
            {
                args.IsValid = ((api.searchEmployee(txtUser.Text).First()).PASSWORD == txtPassword.Text);
            }
            else
            {
                args.IsValid = false;
            }
        }

        

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                Employee employee = api.searchEmployee(txtUser.Text).First();
                Session["user"] = employee;
                if (employee.isADMIN)
                {
                    Response.Redirect("Administrator/Default.aspx");
                }

                
            }
        }
    }
}
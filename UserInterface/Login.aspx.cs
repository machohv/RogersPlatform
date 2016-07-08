using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
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
                FormsAuthentication.SignOut();
            }
        }

        public void UserValidate(object source, ServerValidateEventArgs args)
        {   
            if (api.searchEmployeeSOAP(txtUser.Text) != null)
            {
                 args.IsValid = true;
            } else
            {
                args.IsValid = false;
            }
            
        }

        public void PasswordValidate(object source, ServerValidateEventArgs args)
        {
            if (api.searchEmployeeSOAP(txtUser.Text) != null)
            {
                args.IsValid = api.verifyPasswordSOAP((api.searchEmployeeSOAP(txtUser.Text).First()).PERSON_ID, txtPassword.Text);
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
                Employee employee = api.searchEmployeeSOAP(txtUser.Text).First();
                Session["user"] = employee;

                if (employee.isADMIN)
                {
                    FormsAuthentication.RedirectFromLoginPage
                   (employee.USERNAME, true);
                    Response.Redirect("Administrator/Default.aspx");
                } else if (!employee.isADMIN) {
                    FormsAuthentication.RedirectFromLoginPage
                   (employee.USERNAME, true);
                    Response.Redirect("Cocina/OrderList.aspx");
                }

                
            }
        }
    }
}
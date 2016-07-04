using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserInterface.RogersWS;

namespace UserInterface.Administrator
{
    public partial class EditEmployee : System.Web.UI.Page
    {
        private Employee employee;
        private Rogers_API api = new Rogers_API();
        protected void Page_Load(object sender, EventArgs e)
        {
            employee = api.searchEmployeeByIdSOAP((Request.QueryString["employeeID"]));
            if (!IsPostBack)
            {
                fillData();
            }
        }

        public void fillData()
        {
            txtNombre.Text = employee.FULLNAME;
            txtUsername.Text = employee.USERNAME;
            ddlJob.SelectedValue = employee.isADMIN + "";
        }

        protected void btnEditEmployee_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtNombre.Text) &&
                 !string.IsNullOrEmpty(txtUsername.Text) &&
                 !string.IsNullOrEmpty(txtPassword.Text))
            {

                Rogers_API api = new Rogers_API();

                api.updateEmployeeSOAP(txtNombre.Text, txtPassword.Text, txtUsername.Text, bool.Parse(ddlJob.SelectedValue));
                Response.Redirect("AdminEmployees.aspx");

            }
        }
    }
}
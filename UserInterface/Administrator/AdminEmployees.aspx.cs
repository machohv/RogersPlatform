using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserInterface.RogersWS;

namespace UserInterface.Administrator
{
    public partial class AdminEmployees : System.Web.UI.Page
    {
        private Rogers_API api = new Rogers_API();
        protected void Page_Load(object sender, EventArgs e)
        {
            fillData(Request.QueryString["employee"]);
        }
        public void fillData(string employee)
        {
            if (employee == null)
                employee = "";

            grdPlatos.DataSource = api.searchEmployeeSOAP(employee);
            grdPlatos.DataBind();
        }

        protected void search(object sender, EventArgs e)
        {
            Response.Redirect("AdminEmployees.aspx?employee=" + txtBuscar.Text);
        }
    }
}
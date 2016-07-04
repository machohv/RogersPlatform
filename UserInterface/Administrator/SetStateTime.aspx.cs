using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserInterface.RogersWS;

namespace UserInterface.Administrator
{
    public partial class SetStateTime : System.Web.UI.Page
    {

        private Rogers_API api = new Rogers_API();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlState.DataSource = api.searchOrderStatesSOAP();
                ddlState.DataTextField = "NAME";
                ddlState.DataValueField = "orderStateID";
                ddlState.DataBind();
            }
        }

        protected void btnEditTime_Click(object sender, EventArgs e)
        {
            int id = int.Parse(ddlState.SelectedValue);
            int time = int.Parse(txtTiempo.Text);
            api.setTimeSOAP(id, time);
        }
    }
}
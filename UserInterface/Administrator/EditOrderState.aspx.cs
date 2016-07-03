using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserInterface.RogersWS;

namespace UserInterface.Administrator
{
    public partial class EditOrderState : System.Web.UI.Page
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

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            int OrderId = int.Parse(Request.QueryString["OrderId"]);
            int OrderStateId = int.Parse(ddlState.SelectedValue);
            api.updateOrderState(OrderId, OrderStateId);
            Response.Redirect("AdminOrders.aspx");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminOrders.aspx");
        }
    }
}
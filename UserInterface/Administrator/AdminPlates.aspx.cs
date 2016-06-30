using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserInterface.RogersWS;
using System.Data;
namespace UserInterface.Administrator
{
    public partial class AdminPlates : System.Web.UI.Page
    {
        private Rogers_API api = new Rogers_API();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Remove("plate");
            fillData(Request.QueryString["product"]);
        }
        public void fillData(string product)
        {
            if (product == null)
                product = "";

            grdPlatos.DataSource = api.searchProductSOAP(product);
            grdPlatos.DataBind();
        }

        protected void search(object sender, EventArgs e)
        {
            Response.Redirect("AdminPlates.aspx?product=" + txtBuscar.Text);
        }
        
    }
}
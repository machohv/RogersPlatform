using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserInterface.RogersWS;

namespace UserInterface.Administrator
{
    public partial class AdminClients : System.Web.UI.Page
    {
        private Rogers_API api = new Rogers_API();
        protected void Page_Load(object sender, EventArgs e)
        {
            fillData(Request.QueryString["client"]);
        }
        public void fillData(string client)
        {
            if (client == null)
                client = "";
            
            grdPlatos.DataSource = api.searchClientsSOAP(client);
            grdPlatos.DataBind();
        }

        protected void search(object sender, EventArgs e)
        {
            Response.Redirect("AdminClients.aspx?client=" + txtBuscar.Text);
        }
    }
}
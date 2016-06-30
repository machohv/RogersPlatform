using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserInterface.RogersWS;

namespace UserInterface.Administrator
{
    public partial class AdminOrders : System.Web.UI.Page
    {
        private Rogers_API api = new Rogers_API();
        protected void Page_Load(object sender, EventArgs e)
        {
            fillData();
        }
        public void fillData()
        {
            //grdPedidos.DataSource = api.searchOrdersSOAP("");
            grdPedidos.DataSource = getOrders();
            grdPedidos.DataBind();
           
        }

        public List<Order> getOrders()
        {
            List<Order> retorno = new List<Order>();

            for (int i = 0; i < 10; i++)
            {
                retorno.Add(new Order
                {
                    FULLNAME = "CHA" + i,
                    DATETTIME = System.DateTime.Today,
                    ORDERID = "jua" + i
                });
            }
            return retorno;
        }
        
    }
}
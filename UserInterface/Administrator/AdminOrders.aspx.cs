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
        Order[] ordenes;
        OrderState[] orderState;


        protected void Page_Load(object sender, EventArgs e)
        {
            ordenes = api.searchOrdersSOAP();
            orderState = api.searchOrderStatesSOAP();

            if (!IsPostBack)
            {
                fillData();
                ViewState["Nombre"] = "";
                ViewState["FechaInicio"] = "";
                ViewState["FechaFinal"] = "";
                ViewState["State"] = "";
            }
            
        }
        public void fillData()
        {
            grdPedidos.DataSource = ordenes;
            grdPedidos.DataBind();
            ddlEstado.DataSource = orderState;
            ddlEstado.DataTextField = "NAME";
            ddlEstado.DataValueField = "orderStateID";
            ddlEstado.DataBind();
        }

        protected void search(object sender, EventArgs e)
        {
            ViewState["Nombre"] = txtNombre.Text;
            ViewState["State"] = ddlEstado.SelectedValue;
            ViewState["FechaInicio"] = txtFechaInicio.Text;
            ViewState["FechaFinal"] = txtFechaFin.Text;
            FilterData();
        }

        public string getState(string val)
        {
            int id = int.Parse(val);
            for (int i = 0; i < orderState.Length; i++)
            {
                if (orderState[i].orderStateID == id)
                {
                    return orderState[i].NAME;
                }
            }
            return "";
        }
        

        private void FilterData()
        {
            string name = ViewState["Nombre"].ToString();
            string state = ViewState["State"].ToString();
            DateTime? initialDate;
            DateTime? finalDate;
            try
            {
                initialDate = DateTime.Parse(ViewState["FechaInicio"].ToString());
            } catch (Exception e)
            {
                initialDate = null;
            }
            try
            {
                finalDate = DateTime.Parse(ViewState["FechaFinal"].ToString());
            }
            catch (Exception e)
            {
                finalDate = null;
            }

            List<Order> ordenesFiltradas = new List<Order>();
            bool add = false;
            for (int i = 0; i < ordenes.Length; i++)
            {
                //Validar nombre
                if (string.IsNullOrEmpty(name))
                {
                    add = true;
                }
                else
                {
                    if (name == ordenes[i].FULLNAME)
                    {
                        add = true;
                    }
                    else
                    {
                        add = false;
                    }
                }

                if (!add)
                    continue;

                //Validar fecha inicial
                if (initialDate == null)
                {
                    add = true;
                }
                else
                {
                    int result = DateTime.Compare(initialDate ?? DateTime.Today, ordenes[i].DATETTIME);

                    if (result <= 0) {
                        add = true;
                    }
                    else
                    {
                        add = false;
                    }

                }

                if (!add)
                    continue;
                //Validar fecha final
                if (finalDate == null)
                {
                    add = true;
                }
                else
                {
                    int result = DateTime.Compare(finalDate ?? DateTime.Today, ordenes[i].DATETTIME);

                    if (result >= 0)
                    {
                        add = true;
                    }
                    else
                    {
                        add = false;
                    }

                }

                if (!add)
                    continue;

                //Validar estado
                if (string.IsNullOrEmpty(state) || state == "0")
                {
                    add = true;
                }
                else
                {
                    if (int.Parse(state) == ordenes[i].ORDERSTATEID)
                    {
                        add = true;
                    }
                    else
                    {
                        add = false;
                    }
                }

                if (add)
                {
                    ordenesFiltradas.Add(ordenes[i]);
                }
            }
            grdPedidos.DataSource = ordenesFiltradas;
            grdPedidos.DataBind();
        }
    }
}
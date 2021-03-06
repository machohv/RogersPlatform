﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserInterface.RogersWS;

namespace UserInterface.Administrator
{
    public partial class RemovePlate : System.Web.UI.Page
    {
        public string Nombre { get; set; }
        private Product plate;
        private Rogers_API api = new Rogers_API();
        protected void Page_Load(object sender, EventArgs e)
        {
            plate = api.searchProductByIdSOAP((Request.QueryString["productID"]));
            Nombre = plate.PRODUCTNAME;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPlates.aspx");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            api.deleteProductSOAP(plate.PRODUCT_ID);
            Response.Redirect("AdminPlates.aspx");
        }
    }
}
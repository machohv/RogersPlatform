using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserInterface.RogersWS;

namespace UserInterface.Administrator
{
    public partial class AddPlate : System.Web.UI.Page
    {
        private string imageUri = "";
        private Product plate;
        protected void Page_Load(object sender, EventArgs e)
        {
            plate = (Product)Session["plate"];
            imageUri = Request.QueryString["imageUrl"];
            if (FileUpload1.HasFile)
            {
                imageUri = getImagePath();
            }
            Image.ImageUrl = imageUri;
            if (plate != null)
            {
                fillData();
            }
            resizeImage();
        }

        public void resizeImage()
        {
            if (string.IsNullOrEmpty(imageUri))
            {
                Image.Height = 0;
                Image.Width = 0;
            }
            else
            {
                Image.Height = 200;
                Image.Width = 300;
            }
        }
        public void fillData()
        {
            txtNombre.Text = plate.PRODUCTNAME;
            txtDescripcion.Text = plate.DESCRIPTION;
            txtPrecio.Text = plate.PRICE + "";
        }

        public void fillPlate()
        {
            try
            {
                if (string.IsNullOrEmpty(imageUri))
                {
                    imageUri = getImagePath();
                }
                double precio = double.Parse(txtPrecio.Text);
                plate = new Product {
                    PRODUCTNAME = txtNombre.Text,
                    DESCRIPTION = txtDescripcion.Text,
                    PRICE = precio,
                    IMAGEURI = imageUri,
                    isoutofstock = true,
                    category = ""
                };
            }
            catch (Exception ex)
            {
            }
        }

        protected void btnAddPlate_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtNombre.Text) &&
                !string.IsNullOrEmpty(txtPrecio.Text))
            {
                try
                {
                    fillPlate();
                    Rogers_API api = new Rogers_API();

                    api.addproductSOAP(plate.PRODUCTNAME, plate.DESCRIPTION,
                        plate.PRICE, plate.IMAGEURI, plate.isoutofstock, plate.category);
                    Session.Remove("plate");
                    Response.Redirect("AdminPlates.aspx");
                }
                catch (Exception ex)
                {
                }

            }
        }

        public string getImagePath()
        {
            string retorno = "";
            if (FileUpload1.HasFile)
            {
                string fileName = FileUpload1.FileName;
                FileUpload1.PostedFile.SaveAs(Server.MapPath(".") + "//../images//" + fileName);

                retorno = "http://rogersrestaurant.azurewebsites.net/images/" + fileName;
            }
            return retorno;
        }

        protected void btnSearchImage_Click(object sender, EventArgs e)
        {
            fillPlate();
            Session["plate"] = plate;
            Response.Redirect("ImageSearch.aspx?type=Add");
        }
    }
}
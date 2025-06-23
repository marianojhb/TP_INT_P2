using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_INT_P2
{
    public partial class Inicio : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || string.IsNullOrEmpty(Session["Username"].ToString()))
            {
                Response.Redirect("~/Login.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }

            else if (Session["Tipo"].ToString() == "01")
            {
                Response.Redirect("~/InicioAdministrador.aspx", false);
                Context.ApplicationInstance.CompleteRequest();

            }
            else if (Session["Tipo"].ToString() == "02")
            {
                Response.Redirect("~/InicioMedico.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_INT_P2
{
    public partial class ListadoTurnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Tipo"] == null || Session["Tipo"].ToString() != "02")
            {
                Response.Redirect("~/Login.aspx");
            }
            Response.Write("Pagina no implementada");
        }
    }
}

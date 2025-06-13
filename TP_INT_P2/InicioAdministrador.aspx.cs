using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_INT_P2
{
    public partial class InicioAdministrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Tipo"] == null || Session["Tipo"].ToString() != "01")
                {
                    Response.Redirect("~/Login.aspx");
                }

            }
        }
        protected void btnAgregarMedico_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AgregarMedico.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }


        protected void btnAgregarTurnos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AgregarTurno.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
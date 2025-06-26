using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_INT_P2
{
    public partial class InicioMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Tipo"] == null || Session["Tipo"].ToString() != "02")
                {
                    Response.Redirect("~/Login.aspx");
                }
                Medico medico = Session["Medico"] as Medico;
                lblName.Text = Session["FullName"].ToString();
                imgMedico.ImageUrl = medico.Imagen;
            }
        }

        protected void btnAgregarPaciente_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AgregarPaciente.aspx");
        }

        protected void btnMisHorarios_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MisHorarios.aspx");
        }

        protected void btnVerTurnos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ListadoTurnos.aspx");
        }

    }
}
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_INT_P2
{
    public partial class AgregarTurno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Tipo"] == null || Session["Tipo"].ToString() != "01")
                {
                    Response.Redirect("~/Login.aspx");
                }
                CargarEspecialidades();
                CargarMedicos();
            }
        }
        protected void CargarEspecialidades()
        {
            NegocioEspecialidad negocioEspecialidad = new NegocioEspecialidad();

            ddlEspecialidades.DataSource = negocioEspecialidad.GetEspecialidades();
            ddlEspecialidades.DataValueField = "CodEspecialidad"; // Getter de la clase Especialidad
            ddlEspecialidades.DataTextField = "Nombre"; // Getter de la clase Especialidad
            ddlEspecialidades.DataBind();
        }

        protected void CargarMedicos()
        {
            // Obtener el cod especialidad del combo box enlazado:
            string codEspecialidad = ddlEspecialidades.SelectedValue;

            // Buscar los médicos con esa especialidad
            NegocioMedico negocioMedico = new NegocioMedico();
            ddlMedicos.DataSource = negocioMedico.GetMedicosPorEspecialidad(codEspecialidad);
            ddlMedicos.DataValueField = "Legajo";
            ddlMedicos.DataTextField = "FullName";
            ddlMedicos.DataBind();

        }

        protected void ddlEspecialidades_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarMedicos();
        }
    }
}
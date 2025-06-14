using Entidades;
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
                CargarFechas("3");
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

        protected void CargarFechas(string legajo)
        {
            // TODO: GUARDAR EN UN LISTA LOS DIAS QUE ESTA DISPONIBLE EL MEDICO
            //SELECT
            //    distinct dia_h
            //  FROM HORARIOS
            //  where legajo_h = 1 and disponible_h = 1

            NegocioTurno negocioTurno = new NegocioTurno();
            List<DateTime> lista = negocioTurno.BuscarFechasDisponibles(legajo);
            foreach (var item in lista)
            {
                Response.Write(item + "<br />");
                
            }

            //ddlDias.DataSource = ....

            // TODO CON ESA LISTA HACER OTRA CONSULTA A LA BASE DE DATOS
            // PARA GENERAR UNA LISTA DE FECHAS 
            // PAR LOS PROXIMOS 60 DIAS, CUYOS DIAS DE LA SEMANA
            // COINCIDAN CON LA LISTA DE DISPONBILIDAD DEL MEDICO
            // ES DECIR, EJ DEL 13/6 AL 13/8 LOS DIAS 1 Y 5 (LUNES Y VIERNES)
            // ESTO ME DARA UNA NUEVA LISTA PARA POPULAR EL DDL

            // FINALMENTE CON ESA LISTA CRUZARLA NUEVAMENTE CON LA TABLA
            // TURNOS, Y SI NO COINCIDE: DIA MES AÑO + LEGAJO, ANOTAR
            // EL TURNO
        }


    }
}
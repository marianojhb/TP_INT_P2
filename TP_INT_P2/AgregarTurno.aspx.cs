using Entidades;
using Negocio;
using System;
using System.Collections;
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
            }

        }
        protected void ddlEspecialidades_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarMedicos();

            // Limpiar listas dependientes
            ddlFechas.Items.Clear();
            ddlHoras.Items.Clear();
        }
        protected void ddlMedicos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string legajo = ddlMedicos.SelectedValue;
            
            CargarFechas(legajo);

            // Limpiar listas dependientes
            ddlHoras.Items.Clear();
        }
        protected void ddlFechas_SelectedIndexChanged(object sender, EventArgs e)
        {
            string legajo = ddlMedicos.SelectedValue;
            DateTime fecha = Convert.ToDateTime(ddlFechas.SelectedValue);
            CargarHoras(legajo, fecha);

        }
        protected void CargarEspecialidades()
        {
            NegocioEspecialidad negocioEspecialidad = new NegocioEspecialidad();

            ddlEspecialidades.DataSource = negocioEspecialidad.GetEspecialidades();
            ddlEspecialidades.DataValueField = "CodEspecialidad"; // Getter de la clase Especialidad
            ddlEspecialidades.DataTextField = "Nombre"; // Getter de la clase Especialidad
            ddlEspecialidades.DataBind();

            ddlEspecialidades.Items.Insert(0, new ListItem("-- Seleccione una especialidad --", "0"));
        }

        protected void CargarMedicos()
        {
            // Obtener el cod especialidad del combo box enlazado:
            string codEspecialidad = ddlEspecialidades.SelectedValue;

            // Buscar los médicos con esa especialidad
            NegocioMedico negocioMedico = new NegocioMedico();
            List<Medico> medicos = negocioMedico.GetMedicosPorEspecialidad(codEspecialidad);
            ddlMedicos.DataSource = medicos;
            ddlMedicos.DataValueField = "Legajo";
            ddlMedicos.DataTextField = "FullName";
            ddlMedicos.DataBind();

            ddlMedicos.Items.Insert(0, new ListItem("-- Seleccione una médico --", "0"));
        }


        protected void CargarFechas(string legajo)
        {

            NegocioTurno negocioTurno = new NegocioTurno();
            List<DateTime> lista = negocioTurno.BuscarFechasDisponibles(legajo);
            ddlFechas.DataSource = lista
                .Select(f => new
                {
                    Fecha = f.ToString("yyyy-MM-dd")
                })
                .ToList();
            ddlFechas.DataTextField = "Fecha";
            ddlFechas.DataValueField = "Fecha";
            ddlFechas.DataBind();

            ddlFechas.Items.Insert(0, new ListItem("-- Seleccione un día --", "0"));


        }
        protected void CargarHoras(string legajo, DateTime fecha) // fecha: 2025-06-23 10:00
        {
            NegocioTurno negocioTurno = new NegocioTurno();
            fecha = Convert.ToDateTime(ddlFechas.SelectedValue);// fecha: 2025-06-23 10:00
            List<DateTime> lista = negocioTurno.BuscarFechasDisponibles(legajo); // 2025-06-23 10:00 2025-06-23 11:00 2025-06-23 10:00
            List<DateTime> horas = new List<DateTime>(); // vacio

            foreach (DateTime dateTime in lista) // para cada una de las fechas en {2025-06-23 10:00 2025-06-23 11:00 }
                
                if (dateTime.Date.Equals(fecha.Date))
                // si una fecha en particular 2025-06-23 10:00 coincide con 2025-06-23 10:00
                {
                    horas.Add(dateTime); 

                }
                        // entonces agrego 2025-06-23 10:00, PERO YO NECESITABA LOS DIAS PARA LUEGO CARGAR LAS HORAS
                        // O SEA QUE DEBO COMPARAR DIAS CON DIAS, NO FECHAS COMPLETAS


            ddlHoras.DataSource = horas
                .Select(h => new {
                    Hora = h.ToString("HH:mm tt"),
                    Valor = h.ToString("HH:mm") // o .ToString("yyyy-MM-dd HH:mm") si necesitás la fecha completa como valor
                })
                .ToList();

            ddlHoras.DataTextField = "Hora";
            ddlHoras.DataValueField = "Valor";
            ddlHoras.DataBind();
        }

    }
}
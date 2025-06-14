using Entidades;
using Negocio;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
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
                CargarPacientes();
            }

        }
        protected void ddlEspecialidades_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarMedicos();
            ddlMedicos.Items.Insert(0, new ListItem("-- Seleccione un médico --", "0"));

            // Limpiar listas dependientes
            ddlFechas.Items.Clear();
            ddlHoras.Items.Clear();
        }
        protected void ddlMedicos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string legajo = ddlMedicos.SelectedValue;
            
            CargarFechas(legajo);
            ddlFechas.Items.Insert(0, new ListItem("-- Seleccione una fecha --", "0"));

            // Limpiar listas dependientes
            ddlHoras.Items.Clear();

            // Guardo en la instancia de nuevo registro de turno
            lblLegajo.Text = legajo;
        }
        protected void ddlFechas_SelectedIndexChanged(object sender, EventArgs e)
        {
            string legajo = ddlMedicos.SelectedValue;
            DateTime fecha = Convert.ToDateTime(ddlFechas.SelectedValue);
            CargarHoras(legajo, fecha);
            ddlHoras.Items.Insert(0, new ListItem("-- Seleccione una hora --", "0"));

            // Guardo en la instancia de nuevo registro de turno
            lblFecha.Text = fecha.ToString("yyyy-MM-dd");
        }
        protected void ddlHoras_SelectedIndexChanged(object sender, EventArgs e)
        {
            string hora = ddlHoras.SelectedValue;

            // Guardo en la instancia de nuevo registro de turno
            lblHora.Text = hora.ToString();
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
        protected void CargarPacientes()
        {
            NegocioPaciente negocioPaciente = new NegocioPaciente();
            gvPaciente.DataSource = negocioPaciente.GetPacientes();
            gvPaciente.DataBind();

        }

        protected void GetPaciente(string dni)
        {
            NegocioPaciente negocioPaciente = new NegocioPaciente();
            gvPaciente.DataSource = negocioPaciente.GetPaciente(dni);
            gvPaciente.DataBind();
        }

        protected void btnBuscarPaciente_Click(object sender, EventArgs e)
        {
            if (txtBuscar.Text.Length > 0)
            {
                GetPaciente(txtBuscar.Text);
            }
            else
            {
                CargarPacientes();
            }
            txtBuscar.Text = String.Empty;
        }

        protected void gvPaciente_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            string dni = ((Label)(gvPaciente.Rows[e.NewSelectedIndex].FindControl("lbl_it_DNI"))).Text;

            // Guardo en la instancia de nuevo registro de turno
            lblDNI.Text = dni.ToString();
        }

        protected void gvPaciente_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPaciente.PageIndex = e.NewPageIndex;
            CargarPacientes();
        }

        protected void gvPaciente_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow &&
                    e.Row.RowIndex == gvPaciente.SelectedIndex)
            {
                e.Row.CssClass = "table-success"; // clase Bootstrap para fila resaltada en verde
            }
        }

        protected void gvPaciente_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarPacientes();
        }

        protected void btnAsignarTurno_Click(object sender, EventArgs e)
        {

            bool validado = ((lblFecha.Text != null) && (lblHora.Text != null) && (lblLegajo.Text != null) && (lblDNI.Text != null));
            
            // Compongo la fecha y hora del turno elegido
            DateTime fechahora = Convert.ToDateTime(lblFecha.Text + " " + lblHora.Text);

            // Creo la instancia
            Turno turno = new Turno
            {
                Fecha = fechahora,
                Legajo = lblLegajo.Text,
                DNI = lblDNI.Text
            };
            NegocioTurno negocioTurno = new NegocioTurno();
            int insercionOK = negocioTurno.AgregarTurno(turno);



            if (insercionOK > 0)
            {
                pnlExito.Visible = true;
                pnlError.Visible = false;

                // Mostrar toast éxito y ocultarlo luego
                string script = @"
                            var toastEl = document.querySelector('#" + pnlExito.ClientID + @" .toast');
                            if (toastEl) {
                                var bsToast = new bootstrap.Toast(toastEl);
                                bsToast.show();
                                setTimeout(function(){ toastEl.classList.remove('show'); }, 10000);
                            }";
                ClientScript.RegisterStartupScript(this.GetType(), "MostrarToastExito", script, true);
            }
            else
            {
                pnlExito.Visible = false;
                pnlError.Visible = true;

                // Mostrar toast error y ocultarlo luego
                string script = @"
                            var toastEl = document.querySelector('#" + pnlError.ClientID + @" .toast');
                            if (toastEl) {
                                var bsToast = new bootstrap.Toast(toastEl);
                                bsToast.show();
                                setTimeout(function(){ toastEl.classList.remove('show'); }, 10000);
                            }";
                ClientScript.RegisterStartupScript(this.GetType(), "MostrarToastError", script, true);
            }

            // Limpiar listas dependientes
            ddlEspecialidades.SelectedIndex = -1;
            ddlMedicos.Items.Clear();
            ddlFechas.Items.Clear();
            ddlHoras.Items.Clear();

            // Limpiar selección del GridView
            gvPaciente.SelectedIndex = -1;

            // Volver a cargar la grilla
            CargarPacientes();


        }

    }

}
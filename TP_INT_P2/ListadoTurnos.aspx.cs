using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace TP_INT_P2
{
    public partial class ListadoTurnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string legajo = Session["legajo"]?.ToString() ?? "";

            if (Session["Tipo"] == null || (Session["Tipo"].ToString() != "02" && Session["Tipo"].ToString() != "01"))
            {
                Response.Redirect("~/Login.aspx");
            }

            // EN POSTBACK:
            if (!Page.IsPostBack)
            {
                CargarMedicos();
                CargarTurnos("");

                // Turnos:
                if (Session["Tipo"].ToString() == "02") CargarTurnos(legajo);
                else if (Session["Tipo"].ToString() == "01") CargarTurnos("");

            }

            // FUERA DE POSTBACK:
            if (Session["Tipo"].ToString() == "02")
            {
                // Badges:
                Informe informe = CargarBadges(legajo);
                lblBadgeTodos.Text = informe.T10TotalTurnos.ToString();
                lblBadgePasados.Text = informe.T40TotalTurnosPasados.ToString();
                lblBadgeFuturos.Text = informe.T20TotalTurnosFuturos.ToString();
                lblBadgeProxSemana.Text = informe.T30TotalTurnosProximaSemana.ToString();


                // ddl Especialidades:
                ddlMedicos.SelectedValue = legajo;
                div_Especialista.Style["display"] = "none";

            }
            else if (Session["Tipo"].ToString() == "01")
            {
                Informe informe = CargarBadges("");
                lblBadgeTodos.Text = informe.T10TotalTurnos.ToString();
                lblBadgePasados.Text = informe.T40TotalTurnosPasados.ToString();
                lblBadgeFuturos.Text = informe.T20TotalTurnosFuturos.ToString();
                lblBadgeProxSemana.Text = informe.T30TotalTurnosProximaSemana.ToString();
            }

        }
        protected void CargarTurnos(string legajo)
        {
            NegocioTurno negocioTurno = new NegocioTurno();
            DataTable dt = negocioTurno.GetListadoTurnosReservados(legajo);

            if (dt != null && dt.Rows.Count > 0)
            {
                gvTurnos.DataSource = dt;
                gvTurnos.DataBind();
            }
            else if (dt == null || dt.Rows.Count == 0)
            {
                dt = new DataTable();
                gvTurnos.DataSource = dt;
                gvTurnos.DataBind();
            }
        }
    
        protected Informe CargarBadges(string legajo)
        {
            Informe informe = new Informe();
            NegocioTurno negocioTurno = new NegocioTurno();
            informe = negocioTurno.CargarBadges(legajo);
            return informe;
        }
    
        protected void gvTurnos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DateTime fecha = Convert.ToDateTime(gvTurnos.DataKeys[e.RowIndex]["fecha_T"]);
            string legajo = gvTurnos.DataKeys[e.RowIndex]["legajo_T"].ToString();
            string dni = ((Label)gvTurnos.Rows[e.RowIndex].FindControl("lbl_it_DNI")).Text;

            Turno turno = new Turno(fecha, legajo, dni);

            NegocioTurno negocioTurno = new NegocioTurno();

            negocioTurno.EliminarTurno(turno);

            CargarTurnos(Session["Legajo"].ToString());
            CargarBadges(Session["Legajo"].ToString());
        }

        protected void gvTurnos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvTurnos.EditIndex = e.NewEditIndex;
            CargarTurnos(Session["Legajo"].ToString());
            CargarBadges(Session["Legajo"].ToString());
        }

        protected void gvTurnos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvTurnos.EditIndex = -1;
            CargarTurnos(Session["Legajo"].ToString());
            CargarBadges(Session["Legajo"].ToString());
        }

        protected void gvTurnos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Turno turno = new Turno();
        
            // Campos lectura
            turno.Fecha = Convert.ToDateTime(gvTurnos.DataKeys[e.RowIndex]["fecha_T"]);
            turno.Legajo = gvTurnos.DataKeys[e.RowIndex]["legajo_T"].ToString();

            // Campos escritura
            CheckBox tbAsistencia = (CheckBox)gvTurnos.Rows[e.RowIndex].FindControl("chb_eit_Asistencia");
            turno.Asistencia = tbAsistencia.Checked;
            TextBox tbObservacion = (TextBox)gvTurnos.Rows[e.RowIndex].FindControl("tb_eit_Observacion");
            turno.Observacion = tbObservacion.Text;
            CheckBox tbCancelado = (CheckBox)gvTurnos.Rows[e.RowIndex].FindControl("chb_eit_Cancelado");
            turno.Cancelado = tbCancelado.Checked;

            NegocioTurno negocioTurno = new NegocioTurno();
            negocioTurno.ActualizarTurno(turno);

            gvTurnos.EditIndex = -1;
            CargarTurnos(Session["Legajo"].ToString());
            CargarBadges(Session["Legajo"].ToString());
        }


        protected void gvTurnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTurnos.PageIndex = e.NewPageIndex;
            CargarTurnos(Session["Legajo"].ToString());
            CargarBadges(Session["Legajo"].ToString());
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            NegocioTurno negocioTurno = new NegocioTurno();
            gvTurnos.DataSource = negocioTurno.Buscar(txtTurnosDesde.Text, txtTurnosHasta.Text, ddlMedicos.SelectedValue, txtBuscarPorPalabraClave.Text);
            gvTurnos.DataBind();
        }


        protected void btnReset_Click(object sender, EventArgs e)
        {
            ResetearFormulario();
        }
        protected void CargarMedicos()
        {
            // Buscar los médicos con esa especialidad
            NegocioMedico negocioMedico = new NegocioMedico();
            List<Medico> medicos = negocioMedico.GetMedicosPorEspecialidad("");
            ddlMedicos.DataSource = medicos;
            ddlMedicos.DataValueField = "Legajo";
            ddlMedicos.DataTextField = "FullName";
            ddlMedicos.DataBind();
            ddlMedicos.Items.Insert(0, new ListItem("-- Seleccione --", "0"));

        }

        protected void ResetearFormulario()
        {
            string legajo = Session["legajo"]?.ToString() ?? "";
            txtTurnosDesde.Text = "Inicio";
            txtTurnosHasta.Text = "Fin";
            ddlMedicos.SelectedValue = "0";
            txtBuscarPorPalabraClave.Text = String.Empty;
            NegocioTurno negocioTurno = new NegocioTurno();
            legajo = Session["legajo"]?.ToString() ?? "";
            CargarTurnos(Session["Legajo"].ToString());
            CargarBadges(Session["Legajo"].ToString());
            gvTurnos.DataBind();
        }

        protected void lbTodos_Click(object sender, EventArgs e)
        {
            NegocioTurno negocioTurno = new NegocioTurno();
            gvTurnos.DataSource = negocioTurno.Buscar(null, null, ddlMedicos.SelectedValue, txtBuscarPorPalabraClave.Text);
            gvTurnos.DataBind();
        }

        protected void lbPasados_Click(object sender, EventArgs e)
        {
            NegocioTurno negocioTurno = new NegocioTurno();
            gvTurnos.DataSource = negocioTurno.Buscar(null, DateTime.Now.AddDays(1).ToString(), ddlMedicos.SelectedValue, txtBuscarPorPalabraClave.Text);
            gvTurnos.DataBind();
        }

        protected void lbFuturos_Click(object sender, EventArgs e)
        {
            NegocioTurno negocioTurno = new NegocioTurno();
            gvTurnos.DataSource = negocioTurno.Buscar(DateTime.Now.ToString(), null, ddlMedicos.SelectedValue, txtBuscarPorPalabraClave.Text);
            gvTurnos.DataBind();

        }

        protected void lbProxSemana_Click(object sender, EventArgs e)
        {
            NegocioTurno negocioTurno = new NegocioTurno();
            string semanaProxima = DateTime.Now.AddDays(7).ToString();
            gvTurnos.DataSource = negocioTurno.Buscar(DateTime.Now.ToString(), semanaProxima, ddlMedicos.SelectedValue, txtBuscarPorPalabraClave.Text);
            gvTurnos.DataBind();

        }

    }



}


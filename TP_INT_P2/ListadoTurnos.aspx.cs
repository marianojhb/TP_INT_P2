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
            if (Session["Tipo"] == null || (Session["Tipo"].ToString() != "02" && Session["Tipo"].ToString() != "01"))
            {
                Response.Redirect("~/Login.aspx");
            }
            if (!Page.IsPostBack)
            {
                CargarMedicos();
                
            }
            if ( Session["Tipo"].ToString() == "02") 
            {
                string legajo = Session["legajo"]?.ToString() ?? "";
                CargarTurnos(legajo);
                ddlMedicos.SelectedValue = legajo;
                div_Especialista.Style["display"] = "none";
            }
            else if (Session["Tipo"].ToString() == "01")
            {
                CargarTurnos("");
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
    
        protected void gvTurnos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string fechaString = ((Label)gvTurnos.Rows[e.RowIndex].FindControl("lbl_it_fecha")).Text;
            DateTime fecha = Convert.ToDateTime(fechaString);
            string legajo = ((HiddenField)gvTurnos.Rows[e.RowIndex].FindControl("hfLegajo")).Value;
            string dni = ((Label)gvTurnos.Rows[e.RowIndex].FindControl("lbl_it_DNI")).Text;

            Turno turno = new Turno(fecha, legajo, dni);

            NegocioTurno negocioTurno = new NegocioTurno();

            negocioTurno.EliminarTurno(turno);

            legajo = Session["legajo"]?.ToString() ?? "";
            CargarTurnos(legajo);
        }

        protected void gvTurnos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            string legajo = Session["legajo"]?.ToString() ?? "";
            gvTurnos.EditIndex = e.NewEditIndex;
            
            CargarTurnos(legajo);
        }

        protected void gvTurnos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            string legajo = Session["legajo"]?.ToString() ?? "";
            gvTurnos.EditIndex = -1;
            CargarTurnos(legajo);
        }

        protected void gvTurnos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string legajo = Session["legajo"]?.ToString() ?? "";
            DateTime fecha;
            bool asistencia;
            string observacion;
            bool cancelado;

            string fechaString = ((Label)gvTurnos.Rows[e.RowIndex].FindControl("lbl_eit_Fecha")).Text;
            fecha = Convert.ToDateTime(fechaString);

            asistencia = ((CheckBox)gvTurnos.Rows[e.RowIndex].FindControl("chb_eit_Asistencia")).Checked;

            observacion = ((TextBox)gvTurnos.Rows[e.RowIndex].FindControl("tb_eit_Observacion")).Text;

            cancelado = ((CheckBox)gvTurnos.Rows[e.RowIndex].FindControl("chb_eit_Cancelado")).Checked;

            Turno turno = new Turno();


            turno.Fecha = fecha;
            turno.Legajo = legajo;
            turno.Asistencia = asistencia;
            turno.Observacion = observacion;
            turno.Cancelado = cancelado;

            NegocioTurno negocioTurno = new NegocioTurno();
            negocioTurno.ActualizarTurno(turno);

            gvTurnos.EditIndex = -1;
            CargarTurnos(legajo);
        }






        protected void gvTurnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            string legajo = Session["legajo"]?.ToString() ?? "";
            gvTurnos.PageIndex = e.NewPageIndex;
            CargarTurnos(legajo);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            NegocioTurno negocioTurno = new NegocioTurno();

            // 1. Fecha desde
            DateTime? turnosDesde = null;
            if (DateTime.TryParse(txtTurnosDesde.Text, out DateTime fechaDesde))
                turnosDesde = fechaDesde;

            // 2. Fecha hasta
            DateTime? turnosHasta = null;
            if (DateTime.TryParse(txtTurnosHasta.Text, out DateTime fechaHasta))
                turnosHasta = fechaHasta;

            // 3. Legajo (médico)
            int? legajo = null;
            if (!string.IsNullOrWhiteSpace(ddlMedicos.SelectedValue) && ddlMedicos.SelectedValue != "0")
            {
                if (int.TryParse(ddlMedicos.SelectedValue, out int parsedLegajo))
                    legajo = parsedLegajo;
            }

            // 4. Palabra clave (nombre, apellido, DNI)
            string palabraClave = string.IsNullOrWhiteSpace(txtBuscarPorPalabraClave.Text)
                                  ? null
                                  : txtBuscarPorPalabraClave.Text.Trim();

            // Buscar en la base de datos
            gvTurnos.DataSource = negocioTurno.Buscar(turnosDesde, turnosHasta, legajo, palabraClave);
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

        //protected void ddlMedicos_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    txtBuscarPorPalabraClave.Text = String.Empty;
        //    NegocioTurno negocioTurno = new NegocioTurno();
        //    if (ddlMedicos.SelectedValue != "0")
        //    { 
        //        gvTurnos.DataSource = negocioTurno.BuscarPorMedico(ddlMedicos.SelectedValue);
        //        gvTurnos.DataBind();
        //    }
        //    else
        //    {
        //        ResetearFormulario();
        //    }
        //}
        protected void ResetearFormulario()
        {
            string legajo = Session["legajo"]?.ToString() ?? "";
            txtTurnosDesde.Text = String.Empty;
            txtTurnosHasta.Text = String.Empty;
            ddlMedicos.SelectedValue = "0";
            txtBuscarPorPalabraClave.Text = String.Empty;
            NegocioTurno negocioTurno = new NegocioTurno();
            legajo = Session["legajo"]?.ToString() ?? "";
            CargarTurnos(legajo);
            gvTurnos.DataBind();
        }

        protected void lbPasados_Click(object sender, EventArgs e)
        {
            NegocioTurno negocioTurno = new NegocioTurno();
            DateTime ayer = DateTime.Today.AddDays(-1);

            BuscarPorFecha(null, ayer);
        }

        protected void lbFuturos_Click(object sender, EventArgs e)
        {
            NegocioTurno negocioTurno = new NegocioTurno();
            DateTime hoy = DateTime.Today;

            BuscarPorFecha(hoy, null);

        }
        protected void BuscarPorFecha (DateTime? inicio, DateTime? fin )
        {
            NegocioTurno negocioTurno = new NegocioTurno();
            //gvTurnos.DataSource = negocioTurno.BuscarPorFecha(inicio, fin);
            gvTurnos.DataBind();
        }

    }



}


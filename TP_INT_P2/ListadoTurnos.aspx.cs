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
        string legajo;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Tipo"] == null || (Session["Tipo"].ToString() != "02" && Session["Tipo"].ToString() != "01"))
            {
                Response.Redirect("~/Login.aspx");
            }
            if (!Page.IsPostBack)
            {
                legajo = Session["legajo"]?.ToString()?? "";
                CargarTurnos(legajo);
                lblLegajo.Text = legajo;
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

            gvTurnos.EditIndex = e.NewEditIndex;
            legajo = Session["legajo"]?.ToString() ?? "";
            CargarTurnos(legajo);
        }

        protected void gvTurnos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvTurnos.EditIndex = -1;
            legajo = Session["legajo"]?.ToString() ?? "";
            CargarTurnos(legajo);
        }

        protected void gvTurnos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            legajo = Session["legajo"]?.ToString() ?? "";
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
            gvTurnos.PageIndex = e.NewPageIndex;
            legajo = Session["legajo"]?.ToString() ?? "";
            CargarTurnos(legajo);
        }
    }

}


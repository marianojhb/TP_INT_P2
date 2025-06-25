using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_INT_P2
{
    public partial class ListadoPacientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Tipo"] == null || (Session["Tipo"].ToString() != "02" && Session["Tipo"].ToString() != "01"))

            {
                Response.Redirect("~/Login.aspx");
            }
            if (!Page.IsPostBack)
            {
                CargarPacientes();
            }
        }
        protected void CargarPacientes()
        {
            NegocioPaciente negocioPaciente = new NegocioPaciente();
            DataTable dt = negocioPaciente.GetPacientes();

            if (dt != null && dt.Rows.Count > 0)
            {
                gvPacientes.DataSource = dt;
                gvPacientes.DataBind();
            }
            else if (dt == null || dt.Rows.Count == 0)
            {
                dt = new DataTable();
                gvPacientes.DataSource = dt;
                gvPacientes.DataBind();
            }

        }

        protected void gvPacientes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string dni = ((Label)gvPacientes.Rows[e.RowIndex].FindControl("lbl_it_DNI")).Text;

            Paciente paciente = new Paciente(dni);

            NegocioPaciente negPaciente = new NegocioPaciente();
            
            negPaciente.EliminarPaciente(paciente);

            CargarPacientes();
        }

        protected void gvPacientes_RowEditing(object sender, GridViewEditEventArgs e)
        {

            gvPacientes.EditIndex = e.NewEditIndex;

            CargarPacientes();
        }

        protected void gvPacientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvPacientes.EditIndex = -1;
            CargarPacientes();
        }

        protected void gvPacientes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string dni;
            string nombre;
            string apellido;
            char sexo;
            string nacionalidad;
            DateTime fechaNacimiento;
            string direccion;
            int idLocalidad;
            int idProvincia;
            string email;
            string telefono;

            dni = ((Label)gvPacientes.Rows[e.RowIndex].FindControl("lbl_eit_DNI")).Text;
            nombre = ((TextBox)gvPacientes.Rows[e.RowIndex].FindControl("tb_eit_Nombre")).Text;
            apellido = ((TextBox)gvPacientes.Rows[e.RowIndex].FindControl("tb_eit_Apellido")).Text;
            sexo = Convert.ToChar(((DropDownList)gvPacientes.Rows[e.RowIndex].FindControl("ddlSexo")).Text);
            nacionalidad = ((TextBox)gvPacientes.Rows[e.RowIndex].FindControl("tb_eit_Nacionalidad")).Text;
            fechaNacimiento = Convert.ToDateTime(((TextBox)gvPacientes.Rows[e.RowIndex].FindControl("tb_eit_FechaNac")).Text);
            direccion = ((TextBox)gvPacientes.Rows[e.RowIndex].FindControl("tb_eit_Direccion")).Text;
            DropDownList ddlLocalidades = (DropDownList)gvPacientes.Rows[e.RowIndex].FindControl("ddlLocalidades");
            idLocalidad = Convert.ToInt32(ddlLocalidades.SelectedValue);
            DropDownList ddlProvincias = (DropDownList)gvPacientes.Rows[e.RowIndex].FindControl("ddlProvincias");
            idProvincia = Convert.ToInt32(ddlProvincias.SelectedValue);
            email = ((TextBox)gvPacientes.Rows[e.RowIndex].FindControl("tb_eit_Email")).Text;
            telefono = ((TextBox)gvPacientes.Rows[e.RowIndex].FindControl("tb_eit_Telefono")).Text;

            Paciente paciente = new Paciente(dni, nombre, apellido, sexo, nacionalidad, fechaNacimiento, direccion, idLocalidad, idProvincia, telefono, email);
            NegocioPaciente negPaciente = new NegocioPaciente();
            negPaciente.ActualizarPaciente(paciente);
            gvPacientes.EditIndex = -1;
            CargarPacientes();
        }

        protected void gvPacientes_DataBound(object sender, EventArgs e)
        {

        }

        protected void gvPacientes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                DropDownList ddlProvincias = (DropDownList)e.Row.FindControl("ddlProvincias");
                DropDownList ddlLocalidades = (DropDownList)e.Row.FindControl("ddlLocalidades");

                NegocioProvincia negocioProvincia = new NegocioProvincia();
                ddlProvincias.DataSource = negocioProvincia.GetProvincias();
                ddlProvincias.DataValueField = "IdProvincia"; // Getter de la clase Provincia
                ddlProvincias.DataTextField = "Nombre"; // Getter de la clase Provincia
                ddlProvincias.DataBind();

                // Obtener el idProvincia actual desde el DataItem
                string idProvinciaActual = DataBinder.Eval(e.Row.DataItem, "idProvincia_P").ToString();
                ddlProvincias.SelectedValue = idProvinciaActual.ToString();

                // (Opcional) Cargar las localidades correspondientes
                NegocioLocalidad negocioLocalidad = new NegocioLocalidad();
                ddlLocalidades.DataSource = negocioLocalidad.GetLocalidadesPorProvincia(idProvinciaActual);
                ddlLocalidades.DataValueField = "IdLocalidad"; // Getter de la clase Localidad
                ddlLocalidades.DataTextField = "Nombre"; // Getter de la clase Localidad
                ddlLocalidades.DataBind();

                string idLocalidadActual = DataBinder.Eval(e.Row.DataItem, "idLocalidad_P").ToString();
                ddlLocalidades.SelectedValue = idLocalidadActual;


            }
        }

        protected void ddlProvincias_SelectedIndexChanged(object sender, EventArgs e)
        {

            DropDownList ddlProvincias = (DropDownList)sender;

            // Obtener la fila del GridView que contiene el DropDownList
            GridViewRow row = (GridViewRow)ddlProvincias.NamingContainer;

            // Encontrar el ddlLocalidades dentro de la misma fila
            DropDownList ddlLocalidades = (DropDownList)row.FindControl("ddlLocalidades");

            if (ddlLocalidades != null)
            {
                int idProvincia;
                if (int.TryParse(ddlProvincias.SelectedValue, out idProvincia))
                {
                    NegocioLocalidad negocioLocalidad = new NegocioLocalidad();
                    var localidades = negocioLocalidad.GetLocalidadesPorProvincia(idProvincia.ToString()); // Asegurate de que este método existe

                    ddlLocalidades.DataSource = localidades;
                    ddlLocalidades.DataTextField = "Nombre";
                    ddlLocalidades.DataValueField = "idLocalidad";
                    ddlLocalidades.DataBind();

                    ddlLocalidades.Items.Insert(0, new ListItem("-- Seleccione una localidad --", "0"));
                }
            }
        }

        protected void gvPacientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPacientes.PageIndex = e.NewPageIndex;
            CargarPacientes();
        }

        protected void btnBuscarPorNombreOApellido_Click(object sender, EventArgs e)
        {

        }

        protected void gvPacientes_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
           
        }
    }
    
}
using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_INT_P2
{
    public partial class ListadoMedicos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Tipo"] == null || (Session["Tipo"].ToString() != "02" && Session["Tipo"].ToString() != "01"))
                {
                    Response.Redirect("~/Login.aspx");
                }
                MostrarBotonAgregarMedico();
            }
        }
        protected void btnAgregarMedico_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AgregarMedico.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void lvListadoMedicos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void lvListadoMedicos_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                var dataItem = (DataRowView)e.Item.DataItem;  // o tu tipo concreto, según la fuente de datos

                DropDownList ddlProvincias = (DropDownList)e.Item.FindControl("ddlProvincias");
                DropDownList ddlLocalidades = (DropDownList)e.Item.FindControl("ddlLocalidades");

                if (ddlProvincias != null && ddlLocalidades != null)
                {
                    NegocioProvincia negocioProvincia = new NegocioProvincia();
                    var provincias = negocioProvincia.GetProvincias();

                    ddlProvincias.DataSource = provincias;
                    ddlProvincias.DataTextField = "Nombre";
                    ddlProvincias.DataValueField = "idProvincia";
                    ddlProvincias.DataBind();

                    ddlProvincias.Items.Insert(0, new ListItem("-- Seleccione una provincia --", "0"));

                    // Seleccionar la provincia que tenga el dato actual
                    int idProvinciaActual = Convert.ToInt32(dataItem["idProvincia_U"]);
                    ListItem provinciaSeleccionada = ddlProvincias.Items.FindByValue(idProvinciaActual.ToString());
                    if (provinciaSeleccionada != null)
                    {
                        ddlProvincias.ClearSelection();
                        provinciaSeleccionada.Selected = true;

                        // Cargar localidades según la provincia seleccionada
                        NegocioLocalidad negocioLocalidad = new NegocioLocalidad();
                        var localidades = negocioLocalidad.GetLocalidades(idProvinciaActual.ToString());

                        ddlLocalidades.DataSource = localidades;
                        ddlLocalidades.DataTextField = "Nombre";
                        ddlLocalidades.DataValueField = "idLocalidad";
                        ddlLocalidades.DataBind();

                        ddlLocalidades.Items.Insert(0, new ListItem("-- Seleccione una localidad --", "0"));

                        // Seleccionar la localidad que tenga el dato actual
                        int idLocalidadActual = Convert.ToInt32(dataItem["idLocalidad_U"]);
                        ListItem localidadSeleccionada = ddlLocalidades.Items.FindByValue(idLocalidadActual.ToString());
                        if (localidadSeleccionada != null)
                        {
                            ddlLocalidades.ClearSelection();
                            localidadSeleccionada.Selected = true;
                        }
                    }
                }
            }
        }

        protected void ddlProvincias_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlProvincias = (DropDownList)sender;

            // Obtener el ListViewItem que contiene este dropdown
            ListViewItem item = (ListViewItem)ddlProvincias.NamingContainer;

            // Encontrar el ddlLocalidades dentro del mismo ítem
            DropDownList ddlLocalidades = (DropDownList)item.FindControl("ddlLocalidades");

            if (ddlLocalidades != null)
            {
                int idProvincia = int.Parse(ddlProvincias.SelectedValue);

                NegocioLocalidad negocioLocalidad = new NegocioLocalidad();
                var localidades = negocioLocalidad.GetLocalidades(idProvincia.ToString());

                ddlLocalidades.DataSource = localidades;
                ddlLocalidades.DataTextField = "Nombre";
                ddlLocalidades.DataValueField = "idLocalidad";
                ddlLocalidades.DataBind();

                ddlLocalidades.Items.Insert(0, new ListItem("-- Seleccione una localidad --", "0"));
            }
        }

        protected void MostrarBotonAgregarMedico()
        {
            if (Session["Tipo"].ToString() == "01")
            {
                btnAgregarMedico.Visible = true;
            }
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }

}
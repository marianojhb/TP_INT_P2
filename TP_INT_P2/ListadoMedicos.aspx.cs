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
                if (Session["Tipo"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                else if (Session["Tipo"].ToString() == "02")
                {
                    paginaBloqueada.Text = "Sección exclusiva para usuarios Admin";
                    panelContenidoListadoMedicos.Visible = false;
                } 
                else if (Session["Tipo"].ToString() != "01")
                {
                    MostrarBotonAgregarMedico();
                }

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
                        var localidades = negocioLocalidad.GetLocalidadesPorProvincia(idProvinciaActual.ToString());

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
                var localidades = negocioLocalidad.GetLocalidadesPorProvincia(idProvincia.ToString());

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

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void lvMedicos_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            lvMedicos.EditIndex = e.NewEditIndex;
            lvMedicos.DataBind();
        }

        protected void lvMedicos_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            lvMedicos.EditIndex = -1;
            lvMedicos.DataBind();
        }

        protected void lvMedicos_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            var item = lvMedicos.Items[e.ItemIndex];
            var fu = item.FindControl("fuImagenURL") as FileUpload;
            var txt = item.FindControl("imagen_PTextBox") as TextBox;

            if (fu != null && fu.HasFile)
                e.NewValues["imagen_M"] = "~/imagenes/perfiles/" + fu.FileName;
            else if (txt != null)
                e.NewValues["imagen_M"] = txt.Text;



            // Acá podés acceder a los valores nuevos y actualizarlos manualmente si no usás SqlDataSource
            // O dejás que el SqlDataSource lo maneje
            lvMedicos.EditIndex = -1;
            lvMedicos.DataBind();
        }

        protected void lvMedicos_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            // Cambiar la página del DataPager asociado
            DataPager dp = lvMedicos.FindControl("dpMedicos") as DataPager;
            if (dp != null)
            {
                dp.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            }

            // Reasignar los datos
            lvMedicos.DataBind();
        }




        protected void lvMedicos_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            
        }

        protected void lvMedicos_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            if (e.Exception == null)
            {
                pnlExito.Visible = true;
                pnlError.Visible = false;

                // Mostrar toast éxito y ocultarlo luego
                string script = @"
                            var toastEl = document.querySelector('#" + pnlExito.ClientID + @" .toast');
                            if (toastEl) {
                                var bsToast = new bootstrap.Toast(toastEl);
                                bsToast.show();
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
                            }";
                ClientScript.RegisterStartupScript(this.GetType(), "MostrarToastError", script, true);
                e.ExceptionHandled = true;
            }
        }

        protected void lvMedicos_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {
            if (e.Exception == null)
            {
                pnlExitoUpdate.Visible = true;
                pnlError.Visible = false;

                // Mostrar toast éxito y ocultarlo luego
                string script = @"
                            var toastEl = document.querySelector('#" + pnlExitoUpdate.ClientID + @" .toast');
                            if (toastEl) {
                                var bsToast = new bootstrap.Toast(toastEl);
                                bsToast.show();
                            }";
                ClientScript.RegisterStartupScript(this.GetType(), "MostrarToastExito", script, true);
            }
            else
            {
                pnlExitoUpdate.Visible = false;
                pnlError.Visible = true;

                // Mostrar toast error y ocultarlo luego
                string script = @"
                            var toastEl = document.querySelector('#" + pnlError.ClientID + @" .toast');
                            if (toastEl) {
                                var bsToast = new bootstrap.Toast(toastEl);
                                bsToast.show();
                            }";
                ClientScript.RegisterStartupScript(this.GetType(), "MostrarToastError", script, true);
                e.ExceptionHandled = true;
            }
        }
    }


}
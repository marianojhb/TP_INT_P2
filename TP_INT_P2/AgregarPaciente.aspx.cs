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
    public partial class AgregarPaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None; // para los validadores de WebForms

            if (Session["Tipo"] == null || (Session["Tipo"].ToString() != "02" && Session["Tipo"].ToString() != "01"))
            {
                Response.Redirect("~/Login.aspx");
            }

            if (!IsPostBack)
            {
                CargarProvincias();
                CargarLocalidades(ddlProvincias.SelectedValue);
                CargarCamposObligatorios();
            }
        }

        protected void CargarCamposObligatorios()
        {
            btnChequearDNI.Attributes.Add("formnovalidate", "true");
        }
        protected void CargarProvincias()
        {
            {
                NegocioProvincia negocioProvincia = new NegocioProvincia();
                List<Provincia> provincias = negocioProvincia.GetProvincias();

                ddlProvincias.DataSource = provincias;
                ddlProvincias.DataTextField = "Nombre";
                ddlProvincias.DataValueField = "idProvincia";
                ddlProvincias.DataBind();

                ddlProvincias.Items.Insert(0, new ListItem("-- Seleccione una provincia --", "0"));
            }
        }
        protected void CargarLocalidades(string provincia)
        {
            {
                NegocioLocalidad negocioLocalidad = new NegocioLocalidad();
                List<Localidad> localidades = negocioLocalidad.GetLocalidadesPorProvincia(provincia);

                ddlLocalidades.DataSource = localidades;
                ddlLocalidades.DataTextField = "Nombre";
                ddlLocalidades.DataValueField = "idLocalidad";
                ddlLocalidades.DataBind();

                ddlLocalidades.Items.Insert(0, new ListItem("-- Seleccione una localidad --", "0"));
            }
        }

        protected void ddlProvincias_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarLocalidades(ddlProvincias.SelectedValue);
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            LimpiarFormularioAgregarPaciente();

        }

        protected void LimpiarFormularioAgregarPaciente()
        {
            txtDni.Text = String.Empty;
            txtNombre.Text = String.Empty;
            txtApellido.Text = String.Empty;
            txtEmail.Text = String.Empty;
            txtTelefono.Text = String.Empty;
            txtNacionalidad.Text = String.Empty;
            txtFechaNac.Text = String.Empty;
            rbMasculino.Checked = false;
            rbFemenino.Checked = false;
            txtDireccion.Text = String.Empty;
            ddlProvincias.SelectedValue = "0";
            ddlLocalidades.SelectedValue = "0";
            lblChequearDNIValido.Text = String.Empty;
            lblChequearDNI.Text = String.Empty;
        }

        // Valida que el RadioButton sexo esté chequeado con alguna alternativa
        protected void cvSexo_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rbMasculino.Checked || rbFemenino.Checked;
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            Paciente paciente = new Paciente();

            // TABLA PERSONA
            paciente.DNI = txtDni.Text.Trim();
            paciente.Nombre = txtNombre.Text.Trim();
            paciente.Apellido = txtApellido.Text.Trim();

            // Radio button de Sexo:
            {
                string sexoSeleccionado = "";
                if (rbMasculino.Checked)
                    sexoSeleccionado = "M";
                else if (rbFemenino.Checked)
                    sexoSeleccionado = "F";
                paciente.Sexo = string.IsNullOrEmpty(sexoSeleccionado) ? 'M' : sexoSeleccionado[0];
            }
            paciente.Email = txtEmail.Text.Trim();
            paciente.Nacionalidad = txtNacionalidad.Text.Trim();
            if (string.IsNullOrWhiteSpace(txtFechaNac.Text))
            {
                rfvFechaNac.IsValid = false;
                return;
            }
            paciente.FechaNac = Convert.ToDateTime(txtFechaNac.Text.Trim());
            paciente.Direccion = txtDireccion.Text.Trim();
            paciente.IdLocalidad = Convert.ToInt32(ddlLocalidades.SelectedValue);
            paciente.IdProvincia = Convert.ToInt32(ddlProvincias.SelectedValue);
            paciente.Telefono = txtTelefono.Text.Trim();
            
            // TABLA PACIENTE
            // PK DNI ya preparado en PERSONA

            // PREPARAMOS PARA CHEQUEAR LA BBDD PARA VALIDACIONES

            NegocioPaciente negocioPaciente = new NegocioPaciente();
            bool ingresoValidado = false;


            // VALIDACION 1. CHEQUEAMOS SI EXISTE EL DNI

            ingresoValidado = !negocioPaciente.ExisteDNI(paciente.DNI); //si no existe dni se valida


            //TODO: CARGAR EN LA BASE DE DATOS
            if (ingresoValidado)
            {


                int insercionOK = negocioPaciente.AgregarPaciente(paciente);



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
            }
            LimpiarFormularioAgregarPaciente();
        }

        protected void btnChequearDNI_Click(object sender, EventArgs e)
        {
            lblChequearDNI.Text = "";
            lblChequearDNIValido.Text = "";
            lblChequearDNIHint.Text = "";
            NegocioPaciente negocioPaciente = new NegocioPaciente();
            bool existeDNI;
            if (txtDni.Text.Length != 8 || !txtDni.Text.All(char.IsDigit))
            {
                lblChequearDNI.Text = "Nro inválido";
            }
            else
            {
                if (existeDNI = negocioPaciente.ExisteDNI(txtDni.Text))

                {
                    lblChequearDNI.Text = "DNI ya existe";
                }
                else
                {
                    lblChequearDNIValido.Text = "Validado";
                }
            }

        }
    }
}
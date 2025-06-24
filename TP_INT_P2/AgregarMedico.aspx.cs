using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_INT_P2
{
    public partial class AgregarMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None; // para los validadores de WebForms

            if (Session["Tipo"] == null || Session["Tipo"].ToString() != "01")
            {
                Response.Redirect("~/Login.aspx");
            }

            if (!IsPostBack)
            {
                CargarLegajoNuevo();
                CargarProvincias();
                CargarLocalidades(ddlProvincias.SelectedValue);
                CargarEspecialidades();
                CargarCamposObligatorios();
            }
        }

        protected void CargarLegajoNuevo()
        {
            NegocioMedico negMedico = new NegocioMedico();
            txtLegajo.Text = negMedico.ProximoLegajo().ToString(); ;
        }
        protected void CargarCamposObligatorios()
        {
            // Permite al botón de chequear DNI se ejecute antes del postback de todo el formulario.
            btnChequearDNI.Attributes.Add("formnovalidate", "true");

        }

        // Valida que el RadioButton sexo esté chequeado con alguna alternativa
        protected void cvSexo_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rbMasculino.Checked || rbFemenino.Checked;
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
            LimpiarFormularioAgregarMedico();

        }

        // Función que limpia el formulario con el botón Limpiar
        protected void LimpiarFormularioAgregarMedico()
        {
            txtDni.Text = String.Empty;
            txtNombre.Text = String.Empty;
            txtApellido.Text = String.Empty;
            txtEmail.Text = String.Empty;
            txtTelefono.Text = String.Empty;
            txtNacionalidad.Text = String.Empty;
            txtFechaNac.Text = String.Empty;
            txtHorario.Text = String.Empty;
            ddlEspecialidades.SelectedValue = "0";
            rbMasculino.Checked = false;
            rbFemenino.Checked = false;
            txtDireccion.Text = String.Empty;
            ddlProvincias.SelectedValue = "0";
            ddlLocalidades.SelectedValue = "0";
            txtUsername.Text = String.Empty;
            txtPassword.Text = String.Empty;
        }

        protected void CargarEspecialidades()
        {
            {
                NegocioEspecialidad negocioEspecialidad = new NegocioEspecialidad();
                List<Especialidad> especialidades = negocioEspecialidad.GetEspecialidades();

                ddlEspecialidades.DataSource = especialidades;
                ddlEspecialidades.DataTextField = "Nombre";
                ddlEspecialidades.DataValueField = "codEspecialidad";
                ddlEspecialidades.DataBind();

                ddlEspecialidades.Items.Insert(0, new ListItem("-- Seleccione una especialidad --", "0"));
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            else
            {
                Medico m = new Medico();

                // TABLA PERSONA
                m.DNI = txtDni.Text.Trim();
                m.Nombre = txtNombre.Text.Trim();
                m.Apellido = txtApellido.Text.Trim();

                // Radio button de Sexo:
                {
                    string sexoSeleccionado = "";
                    if (rbMasculino.Checked)
                        sexoSeleccionado = "M";
                    else if (rbFemenino.Checked)
                        sexoSeleccionado = "F";
                    m.Sexo = string.IsNullOrEmpty(sexoSeleccionado) ? 'M' : sexoSeleccionado[0];
                }
                m.Email = txtEmail.Text.Trim();
                m.Nacionalidad = txtNacionalidad.Text.Trim();
                if (string.IsNullOrWhiteSpace(txtFechaNac.Text))
                {
                    rfvFechaNac.IsValid = false;
                    return;
                }
                m.FechaNac = Convert.ToDateTime(txtFechaNac.Text.Trim());
                m.Direccion = txtDireccion.Text.Trim();
                m.IdLocalidad = Convert.ToInt32(ddlLocalidades.SelectedValue);
                m.IdProvincia = Convert.ToInt32(ddlProvincias.SelectedValue);
                m.Telefono = txtTelefono.Text.Trim();

                // TABLA MEDICOS
                m.Legajo = Convert.ToInt32(txtLegajo.Text);
                m.CodEspecialidad = Convert.ToInt32(ddlEspecialidades.SelectedValue);
                m.Horario = txtHorario.Text.Trim();
                m.Imagen = fuImagenURL?.HasFile == true ? "~/imagenes/perfiles/" + fuImagenURL.FileName : m.Imagen; // operador ternario doble

                // TABLA USUARIOS
                m.Username = txtUsername.Text.Trim();
                m.Password = txtPassword.Text.Trim();


                // PREPARAMOS PARA CHEQUEAR LA BBDD PARA VALIDACIONES

                NegocioMedico negocioMedico = new NegocioMedico();
                bool ingresoValidado = false;


                // CHEQUEAMOS SI EXISTE EL DNI

                ingresoValidado = !negocioMedico.ExisteDNI(m.DNI); //si no existe dni se valida


                
                if (ingresoValidado)
                {


                    // SI TODO ESTA OK: AGREGA EL NUEVO REGISTRO:
                    int insercionOK = negocioMedico.AgregarMedico(m);



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
                LimpiarFormularioAgregarMedico();
            }
        }

        protected void btnChequearDNI_Click(object sender, EventArgs e)
        {
            lblChequearDNI.Text = "";
            lblChequearDNIValido.Text = "";
            lblChequearDNIHint.Text = "";
            NegocioMedico negMedico = new NegocioMedico();
            bool existeDNI;
            if ( txtDni.Text.Length != 8 || !txtDni.Text.All(char.IsDigit))
            {
                lblChequearDNI.Text = "Nro inválido";
            }
            else
            { 
                if (existeDNI = negMedico.ExisteDNI(txtDni.Text)) 
                
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
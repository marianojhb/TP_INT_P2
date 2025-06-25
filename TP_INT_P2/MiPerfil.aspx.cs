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
    public partial class MiPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None; // para los validadores de WebForms

            if (Session["Tipo"] == null || Session["Tipo"].ToString() != "02")
            {
                Response.Redirect("~/Login.aspx");
            }

            if (!IsPostBack)
            {
                // CARGAR EL USUARIO ACTUAL
                Medico medico = Session["Medico"] as Medico;
                CargarPerfil(medico);

                CargarProvincias();
                CargarLocalidades(ddlProvincias.SelectedValue);
                CargarEspecialidades();
            }
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
            LimpiarFormularioMiPerfil();

        }

        protected void LimpiarFormularioMiPerfil()
        {
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
            if (!Page.IsValid) return;

            // Medico actual:
            Medico medicoActual = Session["Medico"] as Medico;



            // Medico actualizado:
            Medico medicoActualizado = new Medico();


            // TABLA PERSONA
            medicoActualizado.DNI = txtDni.Text.Trim();
            medicoActualizado.Nombre = txtNombre.Text.Trim();
            medicoActualizado.Apellido = txtApellido.Text.Trim();

            // Radio button de Sexo:
            {
                string sexoSeleccionado = "";
                if (rbMasculino.Checked)
                    sexoSeleccionado = "M";
                else if (rbFemenino.Checked)
                    sexoSeleccionado = "F";
                medicoActualizado.Sexo = string.IsNullOrEmpty(sexoSeleccionado) ? 'M' : sexoSeleccionado[0];
            }
            medicoActualizado.Email = medicoActual.Email;
            medicoActualizado.EmailNuevo = txtEmail.Text.Trim();
            medicoActualizado.Nacionalidad = txtNacionalidad.Text.Trim();
            medicoActualizado.FechaNac = Convert.ToDateTime(txtFechaNac.Text.Trim());
            medicoActualizado.Direccion = txtDireccion.Text.Trim();
            medicoActualizado.IdLocalidad = Convert.ToInt32(ddlLocalidades.SelectedValue);
            medicoActualizado.IdProvincia = Convert.ToInt32(ddlProvincias.SelectedValue);
            medicoActualizado.Telefono = txtTelefono.Text.Trim();

            // TABLA MEDICOS
            medicoActualizado.Legajo = Convert.ToInt32(txtLegajo.Text);
            medicoActualizado.CodEspecialidad = Convert.ToInt32(ddlEspecialidades.SelectedValue);
            medicoActualizado.Horario = txtHorario.Text.Trim();
            medicoActualizado.Imagen = fuImagenURL?.HasFile == true ? "~/imagenes/perfiles/" + fuImagenURL.FileName : medicoActual.Imagen; // operador ternario doble

            // TABLA USUARIOS
            if (txtUsername.Text != medicoActual.Username)
            {
                medicoActualizado.Username = txtUsername.Text;
            }
            else
            {
                medicoActualizado.Username = medicoActual.Username;
            }

            if (string.IsNullOrEmpty(txtPassword.Text))
            {
                medicoActualizado.Password = medicoActual.Password;
            }
            else
            {
                medicoActualizado.Password = txtPassword.Text;
            }


            // PREPARAMOS PARA CHEQUEAR LA BBDD PARA VALIDACIONES

            NegocioMedico negocioMedico = new NegocioMedico();

            // CARGAR EN LA BASE DE DATOS
            if (Page.IsValid)
            {


                int actualizarOK = negocioMedico.ActualizarMedicoConEmailUsuarioContrasena(medicoActualizado);
                



                if (actualizarOK > 0)
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
            
        }

        protected void CargarPerfil(Medico medico)
        {
            txtLegajo.Text = medico.Legajo.ToString();
            txtDni.Text = medico.DNI;
            txtNombre.Text = medico.Nombre;
            txtApellido.Text = medico.Apellido;
            if (medico.Sexo.ToString() == "M")
            {
                rbMasculino.Checked = true;
            }
            else if (medico.Sexo.ToString() == "F")
            {
                rbFemenino.Checked = true;
            }
            
            txtNacionalidad.Text = medico.Nacionalidad;
            ddlProvincias.SelectedValue = medico.IdProvincia.ToString();
            ddlLocalidades.SelectedValue = medico.IdLocalidad.ToString();
            txtFechaNac.Text = (medico.FechaNac).ToString("yyyy-MM-dd");
            txtDireccion.Text = medico.Direccion;
            txtEmail.Text = medico.Email;
            txtTelefono.Text = medico.Telefono;
            txtHorario.Text = medico.Horario;
            ddlEspecialidades.SelectedValue = medico.CodEspecialidad.ToString();
            txtUsername.Text = medico.Username;
            txtPassword.Text = medico.Password;
            
            
        }

        // Valida que el RadioButton sexo esté chequeado con alguna alternativa
        protected void cvSexo_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rbMasculino.Checked || rbFemenino.Checked;
        }
    }
}
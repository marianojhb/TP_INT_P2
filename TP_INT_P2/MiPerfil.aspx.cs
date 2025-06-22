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
                CargarPerfil(Session["Username"].ToString());

                CargarProvincias();
                CargarLocalidades(ddlProvincias.SelectedValue);
                CargarEspecialidades();
                CargarCamposObligatorios();
            }
        }

        protected void CargarCamposObligatorios()
        {
            txtTelefono.Attributes.Add("required", "true");

            txtDni.Attributes.Add("required", "true");
            txtNombre.Attributes.Add("required", "true");
            txtApellido.Attributes.Add("required", "true");
            txtEmail.Attributes.Add("required", "true");
            txtTelefono.Attributes.Add("required", "true");
            txtNacionalidad.Attributes.Add("required", "true");
            txtFechaNac.Attributes.Add("required", "true");
            txtHorario.Attributes.Add("required", "true");
            //ddlEspecialidades.SelectedValue = "0";
            //rbMasculino.Checked = false;
            //rbFemenino.Checked = false;
            txtDireccion.Attributes.Add("required", "true");
            //ddlProvincias.SelectedValue = "0";
            //ddlLocalidades.SelectedValue = "0";
            txtUsername.Attributes.Add("required", "true");
            txtPassword.Attributes.Add("required", "true");

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

            //TODO: CARGAR EN LA BASE DE DATOS
            if (Page.IsValid)
            {


                int actualizarOK = negocioMedico.ActualizarMedico(m);
                



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
            LimpiarFormularioMiPerfil();
        }

        protected void CargarPerfil(string usuario)
        {
            NegocioMedico negocioMedico = new NegocioMedico();
            NegocioUsuario negocioUsuario = new NegocioUsuario();
            Medico m = new Medico();
            Usuario u = new Usuario();
            u.Username = Session["Username"].ToString();


            u = negocioUsuario.GetData(u); // completa los datos
            m = negocioMedico.getDatos(u); // con el atributo email de la instancia usuario, consigo los datos del medico actual.
            txtLegajo.Text = m.Legajo.ToString();
            txtDni.Text = m.DNI.ToString();
            txtNombre.Text = m.Nombre.ToString();
            txtApellido.Text = m.Apellido.ToString();
            if (m.Sexo == 'M')
            {
                rbMasculino.Checked = true;
            }
            else if (m.Sexo == 'F')
            {
                rbFemenino.Checked = true;
            }
            
            txtNacionalidad.Text = m.Nacionalidad.ToString();
            ddlProvincias.DataValueField = m.Provincia.ToString();
            ddlLocalidades.DataValueField = m.Localidad.ToString() ;
            txtFechaNac.Text = m.FechaNac.ToString();
            txtDireccion.Text = m.Direccion.ToString();
            txtEmail.Text = m.Email.ToString();
            txtTelefono.Text = m.Telefono.ToString();
            txtHorario.Text = m.Horario.ToString();
            ddlEspecialidades.SelectedValue = m.CodEspecialidad.ToString();
            txtUsername.Text = m.Username.ToString();
            txtPassword.Text = m.Password.ToString();
        }
    }
}
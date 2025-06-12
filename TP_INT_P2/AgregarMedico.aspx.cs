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
    public partial class AgregarMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Tipo"] == null || (Session["Tipo"].ToString() != "02" && Session["Tipo"].ToString() != "01"))
            {
                Response.Redirect("~/Login.aspx");
            }

            if (!IsPostBack)
            {
                CargarLegajoNuevo();
                CargarProvincias();
                CargarLocalidades(ddlProvincias.SelectedValue);
                CargarEspecialidades();
                //CargarCamposObligatorios();
            }
        }

        protected void CargarLegajoNuevo()
        {
            NegocioMedico negMedico = new NegocioMedico();
            txtLegajo.Text = negMedico.ProximoLegajo().ToString(); ;
        }
        protected void CargarCamposObligatorios()
        {
            txtTelefono.Attributes.Add("required", "true");

            txtDni.Attributes.Add("required", "true");
            btnChequearDNI.Attributes.Add("formnovalidate", "true");
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
                List<Localidad> localidades = negocioLocalidad.GetLocalidades(provincia);

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
            m.FechaNac = txtFechaNac.Text.Trim();
            m.Direccion = txtDireccion.Text.Trim();
            m.IdLocalidad = Convert.ToInt32(ddlLocalidades.SelectedValue);
            m.IdProvincia = Convert.ToInt32(ddlProvincias.SelectedValue);
            m.Telefono = txtTelefono.Text.Trim();
            
            // TABLA MEDICOS
            m.Legajo = txtLegajo.Text;
            m.CodEspecialidad = Convert.ToInt32(ddlEspecialidades.SelectedValue);
            m.Horario = txtHorario.Text.Trim();
            m.Imagen = fuImagenURL?.HasFile == true ? "~/imagenes/perfiles/" + fuImagenURL.FileName : m.Imagen; // operador ternario doble
            
            // TABLA USUARIOS
            m.Username = txtUsername.Text.Trim();
            m.Password = txtPassword.Text.Trim();


            // PREPARAMOS PARA CHEQUEAR LA BBDD PARA VALIDACIONES

            NegocioMedico negocioMedico = new NegocioMedico();
            bool ingresoValidado = false; 
            

            // VALIDACION 1. CHEQUEAMOS SI EXISTE EL DNI

            ingresoValidado = !negocioMedico.AgregarMedicoCheckDNI(m);

            //TODO: CARGAR EN LA BASE DE DATOS
            if (ingresoValidado)
            {
                //Response.Write(ingresoValidado);
                int insercionOK = negocioMedico.AgregarMedico(m);
                if (insercionOK == 1)
                {
                    // Si fue exitoso
                    pnlExito.Visible = true;
                    pnlError.Visible = false;


                    // Registrar script para ocultar el panel después de 3 segundos
                    ClientScript.RegisterStartupScript(this.GetType(), "OcultarPanel", "<script>setTimeout(ocultarPanel, 3000);</script>", false);

                }
                else
                {
                    // Si falló
                    pnlExito.Visible = false;
                    pnlError.Visible = true;
                }
            }
        }

        protected void btnChequearDNI_Click(object sender, EventArgs e)
        {
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
                    lblChequearDNI.Text = "Aprobado!";
                }
            }

        }
    }
}
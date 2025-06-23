using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace TP_INT_P2
{
    public partial class Login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            // Chequea variables de sesion para Depurar:
            //foreach (string key in Session.Keys)
            //{
            //    Response.Write($"<p><strong>{key}</strong>: {Session[key]}</p>");
            //}
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            NegocioUsuario negUsuario = new NegocioUsuario();
            Usuario usuario = new Usuario(txtUsername.Text, txtPassword.Text);

            bool accesoAprobado = negUsuario.LoginOK(usuario);

            if (accesoAprobado)
            {
                // Si hay una persona logueada, muestro cartel de Cerrar Sesión
                Master.FindControl("cerrarSesion").Visible = true;

                // Guardo el nombre de usuario logueado en una variable de sesión para usar en toda la app
                Session["Username"] = txtUsername.Text;


                // Busco el rol de la persona logueada para ver a donde la redirijo
                usuario = negUsuario.GetData(usuario);
                
                Session["Tipo"] = usuario.Tipo;

                if (usuario.Tipo == "01")
                {
                    Session["FullName"] = "Administrador";
                    Session["Legajo"] = String.Empty;
                    Response.Redirect("~/InicioAdministrador.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();

                }
                else if (usuario.Tipo == "02")
                {
                    // Busco datos de la persona que se logueó:
                    NegocioMedico negocioMedico = new NegocioMedico();
                    Medico medico = new Medico();
                    medico = negocioMedico.getDatos(usuario);
                    Session["FullName"] = $"{medico.Nombre} {medico.Apellido}";
                    Session["Name"] = $"{medico.Nombre}";
                    Session["Legajo"] = medico.Legajo;
                    Session["Medico"] = medico;

                    Response.Redirect("~/InicioMedico.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
            else
            {
                lblError.Visible = true;
                lblError.Text = "Usuario y contraseña inválidos";
            }
        }
    }
}
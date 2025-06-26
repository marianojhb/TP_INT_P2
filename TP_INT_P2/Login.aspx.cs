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

            // Gestion de cookies para la imagen del login
            {
                HttpCookie ckPerfilImageUrl = Request.Cookies["ckPerfilImageUrl"];
                HttpCookie ckUsername = Request.Cookies["ckUsername"];

                

                string perfilImageUrl = Session["ImgPerfilUrl"] as string;
                if (!string.IsNullOrEmpty(perfilImageUrl))
                {
                    // Poner la imagen guardada en sesión
                    imgPerfilUrl.ImageUrl = perfilImageUrl;
                }

                else if (ckPerfilImageUrl != null && !string.IsNullOrEmpty(ckPerfilImageUrl.Value))
                {
                    // Si hay cookie pero no sesión, uso la cookie
                    perfilImageUrl = ckPerfilImageUrl.Value;
                    imgPerfilUrl.ImageUrl = perfilImageUrl;
                    Session["ImgPerfilUrl"] = perfilImageUrl;
                }

                else
                {
                    // Si no hay nada, default
                    perfilImageUrl = "~/imagenes/perfiles/img_avatar.png";
                    imgPerfilUrl.ImageUrl = perfilImageUrl;

                    ckPerfilImageUrl = new HttpCookie("ckPerfilImageUrl", perfilImageUrl);
                    ckPerfilImageUrl.Expires = DateTime.Now.AddMinutes(10);
                    this.Response.Cookies.Add(ckPerfilImageUrl);

                    Session["ImgPerfilUrl"] = perfilImageUrl;
                }
            }
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
                    Session["FullName"] = $"{usuario.Username} (Admin)";
                    Session["ImgPerfilUrl"] = usuario.Imagen;
                    Session["Legajo"] = String.Empty;
                    Response.Redirect("~/InicioAdministrador.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                    HttpCookie ckPerfilImageUrl = new HttpCookie("ckPerfilImageUrl", Session["ImgPerfilUrl"].ToString());
                    ckPerfilImageUrl.Expires = DateTime.Now.AddDays(365);
                    this.Response.Cookies.Add(ckPerfilImageUrl);
                }
                else if (usuario.Tipo == "02")
                {
                    // Busco datos de la persona que se logueó:
                    NegocioMedico negocioMedico = new NegocioMedico();
                    Medico medico = new Medico();
                    medico = negocioMedico.getDatos(usuario);
                    Session["FullName"] = $"{medico.Nombre} {medico.Apellido}";
                    Session["Name"] = medico.Nombre;
                    Session["Legajo"] = medico.Legajo;
                    Session["Medico"] = medico;
                    Session["ImgPerfilUrl"] = medico.Imagen;

                    
                    HttpCookie ckPerfilImageUrl = new HttpCookie("ckPerfilImageUrl", Session["ImgPerfilUrl"].ToString());
                    ckPerfilImageUrl.Expires = DateTime.Now.AddMinutes(10);
                    this.Response.Cookies.Add(ckPerfilImageUrl);

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
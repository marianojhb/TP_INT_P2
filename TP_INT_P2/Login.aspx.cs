
using Entidades;
using Negocio;
using System;
using System.Web;
using System.Web.UI;

namespace TP_INT_P2
{
    public partial class Login : System.Web.UI.Page
    {
        private const string ImagenDefault = "~/imagenes/perfiles/img_avatar.png";

        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie ckPerfilImageUrl = Request.Cookies["ckPerfilImageUrl"];

            string perfilImageUrl = Session["ImgPerfilUrl"] as string;

            if (string.IsNullOrWhiteSpace(perfilImageUrl))
            {
                if (ckPerfilImageUrl != null &&
                    !string.IsNullOrWhiteSpace(ckPerfilImageUrl.Value))
                {
                    perfilImageUrl = ckPerfilImageUrl.Value;
                }
                else
                {
                    perfilImageUrl = ImagenDefault;
                    GuardarCookieImagen(perfilImageUrl, 10);
                }

                Session["ImgPerfilUrl"] = perfilImageUrl;
            }

            imgPerfilUrl.ImageUrl = perfilImageUrl;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            NegocioUsuario negUsuario = new NegocioUsuario();
            Usuario usuario = new Usuario(txtUsername.Text, txtPassword.Text);

            bool accesoAprobado = negUsuario.LoginOK(usuario);

            if (!accesoAprobado)
            {
                MostrarError("Usuario y contraseña inválidos");
                return;
            }

            // Recuperar los datos del usuario autenticado
            usuario = negUsuario.GetData(usuario);

            if (usuario == null)
            {
                MostrarError("No se pudieron recuperar los datos del usuario.");
                return;
            }

            if (usuario.Tipo == "01")
            {
                // Administrador
                Session["Username"] = txtUsername.Text;
                Session["Tipo"] = usuario.Tipo;
                Session["FullName"] = $"{usuario.Username} (Admin)";
                Session["Legajo"] = string.Empty;

                string imagen = ObtenerImagenSegura(usuario.Imagen);

                Session["ImgPerfilUrl"] = imagen;
                GuardarCookieImagen(imagen, 365 * 24 * 60);

                Response.Redirect("~/InicioAdministrador.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            else if (usuario.Tipo == "02")
            {
                // Médico
                NegocioMedico negocioMedico = new NegocioMedico();
                Medico medico = negocioMedico.getDatos(usuario);

                if (medico == null)
                {
                    MostrarError("No se encontraron los datos del médico.");
                    return;
                }

                Session["Username"] = txtUsername.Text;
                Session["Tipo"] = usuario.Tipo;
                Session["FullName"] = $"{medico.Nombre} {medico.Apellido}";
                Session["Name"] = medico.Nombre;
                Session["Legajo"] = medico.Legajo;
                Session["Medico"] = medico;

                string imagen = ObtenerImagenSegura(medico.Imagen);

                Session["ImgPerfilUrl"] = imagen;
                GuardarCookieImagen(imagen, 10);

                Response.Redirect("~/InicioMedico.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            else
            {
                MostrarError("El usuario no tiene un rol válido.");
            }
        }

        private string ObtenerImagenSegura(string imagen)
        {
            return string.IsNullOrWhiteSpace(imagen)
                ? ImagenDefault
                : imagen;
        }

        private void GuardarCookieImagen(string imagen, int minutos)
        {
            HttpCookie cookie = new HttpCookie("ckPerfilImageUrl", imagen);

            cookie.Expires = DateTime.Now.AddMinutes(minutos);
            cookie.HttpOnly = true;
            cookie.Secure = Request.IsSecureConnection;

            Response.Cookies.Add(cookie);
        }

        private void MostrarError(string mensaje)
        {
            lblError.Visible = true;
            lblError.Text = mensaje;
        }
    }
}

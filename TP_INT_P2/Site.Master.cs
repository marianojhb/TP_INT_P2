using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_INT_P2
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Gestión de cookies
            {
                HttpCookie ckTema = Request.Cookies["Tema"];

                // Si existe la cookie del tema la aplico
                if (ckTema != null && !string.IsNullOrEmpty(ckTema.Value))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "ActualizarTema", "document.documentElement.setAttribute('data-bs-theme', '" + ckTema.Value + "');", true);
                }
                // Si no existe la cookie, la creo:
                else
                {
                    ckTema = new HttpCookie("Tema", "light");
                    ckTema.Expires = DateTime.Now.AddDays(365);
                    this.Response.Cookies.Add(ckTema);
                }
            }
            if (!IsPostBack)
            {


                // Gestión de usuario:
                {
                    string usuario = Session["Usuario"] as string;

                    if (!string.IsNullOrEmpty(usuario))
                    {
                        lblUsuario.Text = "Usuario: " + usuario;
                        lblFullName.Text = Session["FullName"] as string;
                        cerrarSesion.Visible = true;
                    }
                    else
                    {
                        lblUsuario.Text = "Usuario: Invitado";
                        cerrarSesion.Visible = false;
                    }
                    string tema = Session["Tema"] as string ?? "light";
                    htmlTag.Attributes["data-bs-theme"] = tema;
                }

            }

        }

        protected void cerrarSesion_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = String.Empty;
            cerrarSesion.Visible = true;
            Response.Redirect("~/Inicio.aspx");
        }

        protected void cambiarTema_Click(object sender, EventArgs e)
        {
            string temaActual = Session["Tema"] as string;
            string nuevoTema = (temaActual == "dark") ? "light" : "dark";
            Session["Tema"] = nuevoTema;
            htmlTag.Attributes["data-bs-theme"] = nuevoTema;

            HttpCookie ckTema = new HttpCookie("Tema", nuevoTema);
            ckTema.Expires = DateTime.Now.AddDays(365);
            this.Response.Cookies.Set(ckTema);
        }

        public void CambiarTema(string tema)
        {
            htmlTag.Attributes["data-bs-theme"] = tema;
        }
    }
}
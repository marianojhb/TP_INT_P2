using Entidades;
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
            // Gestión de cookies para los Temas Light y Dark
            {
                HttpCookie ckTema = Request.Cookies["Tema"];
                string tema = Session["Tema"] as string;

                if (!string.IsNullOrEmpty(tema))
                {
                    // Poner el tema guardado en sesión
                    htmlTag.Attributes["data-bs-theme"] = tema;
                }
                else if (ckTema != null && !string.IsNullOrEmpty(ckTema.Value))
                {
                    // Si hay cookie pero no sesión, uso la cookie
                    tema = ckTema.Value;
                    htmlTag.Attributes["data-bs-theme"] = tema;
                    Session["Tema"] = tema;
                }
                else
                {
                    // Si no hay nada, default light
                    tema = "light";
                    htmlTag.Attributes["data-bs-theme"] = tema;

                    ckTema = new HttpCookie("Tema", tema);
                    ckTema.Expires = DateTime.Now.AddDays(365);
                    this.Response.Cookies.Add(ckTema);

                    Session["Tema"] = tema;
                }
            }



            // Gestión de visibilidad de páginas
            string tipo = Session["Tipo"] as string;
            if (tipo == "01")
            {
                li_Inicio.Style["display"] = "block";
                li_ListadoMedicos.Style["display"] = "block";
                li_ListadoPacientes.Style["display"] = "block";
                li_ListadoTurnos.Style["display"] = "block";
                li_Informes.Style["display"] = "block";
                li_MiPerfil.Style["display"] = "none";
                li_MisHorarios.Style["display"] = "none";
                imgPerfilUrl.Style["display"] = "inline";
            }
            else if (tipo == "02")
            {
                li_Inicio.Style["display"] = "block";
                li_ListadoMedicos.Style["display"] = "none";
                li_ListadoPacientes.Style["display"] = "block";
                li_ListadoTurnos.Style["display"] = "block";
                li_Informes.Style["display"] = "block";
                li_MiPerfil.Style["display"] = "block";
                li_MisHorarios.Style["display"] = "block";
                imgPerfilUrl.Style["display"] = "inline";
            }
            else if (string.IsNullOrEmpty(tipo))
            {
                li_Inicio.Style["display"] = "none";
                li_ListadoMedicos.Style["display"] = "none";
                li_ListadoPacientes.Style["display"] = "none";
                li_ListadoTurnos.Style["display"] = "none";
                li_Informes.Style["display"] = "none";
                li_MiPerfil.Style["display"] = "none";
                li_MisHorarios.Style["display"] = "none";
                imgPerfilUrl.Style["display"] = "none";
            }


            if (!IsPostBack)
            {
                

                // Gestión de usuario:
                {
                    string username = Session["Username"] as string;

                    if (!string.IsNullOrEmpty(username))
                    {
                        lblUsuario.Text = "Usuario: " + username;
                        lblFullName.Text = Session["FullName"] as string;
                        cerrarSesion.Visible = true;
                        imgPerfilUrl.ImageUrl = Session["ImgPerfilUrl"].ToString();
                    }
                    else
                    {
                        lblUsuario.Text = "Usuario: Invitado";
                        cerrarSesion.Visible = false;
                        imgPerfilUrl.ImageUrl = "";
                    }
                    string tema = Session["Tema"] as string ?? "light";
                    htmlTag.Attributes["data-bs-theme"] = tema;
                }

            }

        }

        protected void cerrarSesion_Click(object sender, EventArgs e)
        {
            Session["Username"] = String.Empty;
            Session["FullName"] = String.Empty;
            Session["Legajo"] = String.Empty;
            Session["Tipo"] = String.Empty;
            Session["Medico"] = String.Empty;
            Session["ImgPerfilUrl"] = String.Empty;
            cerrarSesion.Visible = true;
            Response.Redirect("~/Inicio.aspx");
        }

        protected void cambiarTema_Click(object sender, EventArgs e)
        {
            string temaActual = Session["Tema"] as string;
            string nuevoTema = (temaActual == "dark") ? "light" : "dark";
            Session["Tema"] = nuevoTema;

            HttpCookie ckTema = new HttpCookie("Tema", nuevoTema);
            ckTema.Expires = DateTime.Now.AddDays(365);
            this.Response.Cookies.Set(ckTema);

            // Actualizar el atributo html en el servidor para cuando se renderice la página
            htmlTag.Attributes["data-bs-theme"] = nuevoTema;

            // Registrar script para actualizar el tema en el cliente inmediatamente
            ScriptManager.RegisterStartupScript(this, GetType(), "ActualizarTema", $"document.documentElement.setAttribute('data-bs-theme', '{nuevoTema}');", true);
        }

        public void CambiarTema(string tema)
        {
            htmlTag.Attributes["data-bs-theme"] = tema;
        }
    }
}
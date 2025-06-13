using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_INT_P2
{
    public partial class MisHorarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Tipo"] == null || Session["Tipo"].ToString() != "02")
                {
                    Response.Redirect("~/Login.aspx");
                }
                
                
                string legajo = Session["Legajo"].ToString();
                CargarHorarios(legajo);
            }
            

        }
        protected void CargarHorarios(string legajo)
        {
            DataTable horarios = GetHorariosDataTable(legajo); // <-- ¡este es el correcto!
            gvHorarios.DataSource = horarios;
            gvHorarios.DataBind();

        }

        private DataTable GetHorariosDataTable(string legajo)
        {
            NegocioHorario negocioHorario = new NegocioHorario();
            
            // 1. Obtener los datos "planos" de la base: legajo, día, hora, disponibilidad (bool)
            DataTable dtPlanos = negocioHorario.GenerarHorarioPivotado( legajo); // Debés crear este método

            // 2. Crear tabla pivote para el GridView
            DataTable dtPivot = new DataTable();
            dtPivot.Columns.Add("hora_H", typeof(int));
            dtPivot.Columns.Add("lunes_disponible", typeof(bool));
            dtPivot.Columns.Add("martes_disponible", typeof(bool));
            dtPivot.Columns.Add("miercoles_disponible", typeof(bool));
            dtPivot.Columns.Add("jueves_disponible", typeof(bool));
            dtPivot.Columns.Add("viernes_disponible", typeof(bool));

            // Horas fijas (ejemplo 10 a 17)
            for (int hora = 10; hora <= 17; hora++)
            {
                DataRow fila = dtPivot.NewRow();
                fila["hora_H"] = hora;
                fila["lunes_disponible"] = false;
                fila["martes_disponible"] = false;
                fila["miercoles_disponible"] = false;
                fila["jueves_disponible"] = false;
                fila["viernes_disponible"] = false;

                // Buscar en dtPlanos si hay disponibilidad para esa hora y día
                foreach (DataRow plano in dtPlanos.Rows)
                {
                    int dia = Convert.ToInt32(plano["dia_H"]); // 1=lunes,... 5=viernes
                    int horaPlano = Convert.ToInt32(plano["hora_H"]);
                    bool disponible = Convert.ToBoolean(plano["disponible_H"]);

                    if (horaPlano == hora && disponible)
                    {
                        switch (dia)
                        {
                            case 1: fila["lunes_disponible"] = true; break;
                            case 2: fila["martes_disponible"] = true; break;
                            case 3: fila["miercoles_disponible"] = true; break;
                            case 4: fila["jueves_disponible"] = true; break;
                            case 5: fila["viernes_disponible"] = true; break;
                        }
                    }
                }

                dtPivot.Rows.Add(fila);
            }

            return dtPivot;
        }

        protected void gvHorarios_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvHorarios.EditIndex = -1;
            BindGridView();
        }

        protected void gvHorarios_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvHorarios.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void gvHorarios_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvHorarios.Rows[e.RowIndex];

            int hora = Convert.ToInt32(gvHorarios.DataKeys[e.RowIndex].Value); // Necesitas configurar DataKeyNames = "hora_H"

            // Obtener los checkbox desde la fila
            CheckBox chkLunes = (CheckBox)row.FindControl("chkLunes");
            CheckBox chkMartes = (CheckBox)row.FindControl("chkMartes");
            CheckBox chkMiercoles = (CheckBox)row.FindControl("chkMiercoles");
            CheckBox chkJueves = (CheckBox)row.FindControl("chkJueves");
            CheckBox chkViernes = (CheckBox)row.FindControl("chkViernes");

            // Aquí guardás los cambios en base de datos o en tu estructura temporal
            bool lunes = chkLunes.Checked;
            bool martes = chkMartes.Checked;
            bool miercoles = chkMiercoles.Checked;
            bool jueves = chkJueves.Checked;
            bool viernes = chkViernes.Checked;

            // TODO: Guardar disponibilidad para esa hora en DB
            string legajo = Session["Legajo"].ToString();
            GuardarDisponibilidad(legajo, hora, lunes, martes, miercoles, jueves, viernes);

            gvHorarios.EditIndex = -1;
            BindGridView();
        }

        private void BindGridView()
        {
            // Reobtenés los datos de la base o de donde guardes
            
            string legajo = Session["Legajo"].ToString();
            DataTable dt = GetHorariosDataTable(legajo);
            foreach (DataColumn col in dt.Columns)
            {
                System.Diagnostics.Debug.WriteLine("Columna: " + col.ColumnName);
            }
            gvHorarios.DataSource = dt;

            gvHorarios.DataBind();
        }
        public void GuardarDisponibilidad(string legajo, int hora, bool lunes, bool martes, bool miercoles, bool jueves, bool viernes)
        {
            // Ejemplo pseudocódigo:
            // Por cada día (1 a 5), actualizar o insertar la disponibilidad según corresponda
            for (int dia = 1; dia <= 5; dia++)
            {
                bool disponible = false;
                switch (dia)
                {
                    case 1: disponible = lunes; break;
                    case 2: disponible = martes; break;
                    case 3: disponible = miercoles; break;
                    case 4: disponible = jueves; break;
                    case 5: disponible = viernes; break;
                }
                // Ejecutar UPDATE o INSERT según corresponda en la tabla HORARIOS
                // que tiene legajo, dia, hora, disponibilidad
                NegocioHorario negocioHorario = new NegocioHorario();
                
                negocioHorario.ActualizarDisponibilidad(Convert.ToInt32(legajo), hora, dia, disponible);
            }
        }

    }

}
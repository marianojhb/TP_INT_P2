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
    public partial class Informes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Tipo"] == null || (Session["Tipo"].ToString() != "02" && Session["Tipo"].ToString() != "01"))

            {
                Response.Redirect("~/Login.aspx");
            }
            if (!IsPostBack)
            {
                Informe informe = ObtenerInforme(DateTime.Now, DateTime.Now);

                lblTotalMedicos.Text                                    = informe.M10TotalMedicos == 0 ? "No hay médicos" : (informe.M10TotalMedicos == 1 ? "1 médico" : informe.M10TotalMedicos + " médicos");
                lblTotalMedicosActivos.Text                             = informe.M20TotalMedicosActivos == 0 ? "No hay médicos" : (informe.M20TotalMedicosActivos == 1 ? "1 médico" : informe.M20TotalMedicosActivos + " médicos");
                lblTotalMedicosInactivos.Text                           = informe.M30TotalMedicosInactivos == 0 ? "No hay médicos" : (informe.M30TotalMedicosInactivos == 1 ? "1 médico" : informe.M30TotalMedicosInactivos + " médicos");
                lblPorcentajeMedicosConTurnosSobreMedicosActivos.Text   = informe.M40PorcentajeMedicosConTurnosSobreMedicosActivos.ToString() + "%";
                gvTotalMedicosPorEspecialidad.DataSource                = informe.M50TotalMedicosPorEspecialidad;
                gvTotalMedicosPorEspecialidad.DataBind(); 
                Medico medicoConMayorAtencionSemanal                    = informe.H10MedicoConMayorAtencionSemanal;
                lblmedicoConMayorAtencionSemanalNombre.Text             = medicoConMayorAtencionSemanal.Nombre;
                lblmedicoConMayorAtencionSemanalApellido.Text           = medicoConMayorAtencionSemanal.Apellido;
                lblTurnosSemanalesHabilitadosTotales.Text               = informe.H20TurnosSemanalesHabilitadosTotales == 0 ? "No hay turnos" : (informe.H20TurnosSemanalesHabilitadosTotales == 1 ? "1 turnos" : informe.H20TurnosSemanalesHabilitadosTotales + " turnos");
                lblTotalPacientes.Text                                  = informe.P10TotalPacientes == 0 ? "No hay pacientes" : (informe.P10TotalPacientes == 1 ? "1 paciente" : informe.P10TotalPacientes + " pacientes");
                lblTotalPacientesActivos.Text                           = informe.P20TotalPacientesActivos == 0 ? "No hay pacientes" : (informe.P20TotalPacientesActivos == 1 ? "1 paciente" : informe.P20TotalPacientesActivos + " pacientes");
                lblTotalPacientesInactivos.Text                         = informe.P30TotalPacientesInactivos == 0 ? "No hay pacientes" : (informe.P30TotalPacientesInactivos == 1 ? "1 paciente" : informe.P30TotalPacientesInactivos + " pacientes");
                lblPacientesAdultosMayores.Text                         = informe.P40PacientesAdultosMayores == 0 ? "No hay pacientes" : (informe.P40PacientesAdultosMayores == 1 ? "1 paciente" : informe.P40PacientesAdultosMayores + " pacientes");
                lblPacientesAdultos.Text                                = informe.P50PacientesAdultos == 0 ? "No hay pacientes" : (informe.P50PacientesAdultos == 1 ? "1 paciente" : informe.P50PacientesAdultos + " pacientes");
                lblPacientesJuveniles.Text                              = informe.P60PacientesJuveniles == 0 ? "No hay pacientes" : (informe.P60PacientesJuveniles == 1 ? "1 paciente" : informe.P60PacientesJuveniles + " pacientes");
                lblPacientesInfantiles.Text                             = informe.P70PacientesInfantiles == 0 ? "No hay pacientes" : (informe.P70PacientesInfantiles == 1 ? "1 paciente" : informe.P70PacientesInfantiles + " pacientes");
                lblPacientesPreescolares.Text                           = informe.P80PacientesPreescolares == 0 ? "No hay pacientes" : (informe.P80PacientesPreescolares == 1 ? "1 paciente" : informe.P80PacientesPreescolares + " pacientes");
                lblPacientesLactantes.Text                              = informe.P90PacientesLactantes == 0 ? "No hay pacientes" : (informe.P90PacientesLactantes == 1 ? "1 paciente" : informe.P90PacientesLactantes + " pacientes");
                lblTotalTurnos.Text                                     = informe.T10TotalTurnos == 0 ? "No hay turnos" : (informe.T10TotalTurnos == 1 ? "1 turnos" : informe.T10TotalTurnos + " turnos");
                lblTotalTurnosFuturos.Text                              = informe.T20TotalTurnosFuturos == 0 ? "No hay turnos" : (informe.T20TotalTurnosFuturos == 1 ? "1 turnos" : informe.T20TotalTurnosFuturos + " turnos");
                lblTotalTurnosProximaSemana.Text                        = informe.T30TotalTurnosProximaSemana == 0 ? "No hay turnos" : (informe.T30TotalTurnosProximaSemana == 1 ? "1 turnos" : informe.T30TotalTurnosProximaSemana + " turnos");
                lblTotalTurnosPasados.Text                              = informe.T40TotalTurnosPasados == 0 ? "No hay turnos" : (informe.T40TotalTurnosPasados == 1 ? "1 turnos" : informe.T40TotalTurnosPasados + " turnos");
                lblTotalTurnosAusentes.Text                             = informe.T50TotalTurnosAusentes == 0 ? "No hay turnos" : (informe.T50TotalTurnosAusentes == 1 ? "1 turnos" : informe.T50TotalTurnosAusentes + " turnos");
                lblPorcentajeTurnosAusentes.Text                        = informe.T60PorcentajeTurnosAusentesSobreTurnosPasados.ToString() + "%";
                gvTotalTurnosAusentesPorMedico.DataSource               = informe.T70TotalTurnosAusentesPorMedico;
                gvTotalTurnosAusentesPorMedico.DataBind();
            }
        }
        protected Informe ObtenerInforme(DateTime inicio, DateTime fin)
        {
            NegocioInforme negocioInforme = new NegocioInforme();
            
            Informe informe = new Informe();
            informe = negocioInforme.ObtenerInforme(inicio, fin);
            return informe;
        }
    }
}
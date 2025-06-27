using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Entidades
{
    public class Informe
    {
        public DateTime Inicio { get; set; }
        public DateTime Fin { get; set; }
        public Informe() { }
        public Informe(DateTime inicio, DateTime fin)
        {
            Inicio = inicio;
            Fin = fin;
        }

        // Medicos
        public int M10TotalMedicos { get; set; }
        public int M20TotalMedicosActivos { get; set; }
        public int M30TotalMedicosInactivos { get; set; }
        public double M40PorcentajeMedicosConTurnosSobreMedicosActivos { get; set; }
        public int M41TotalMedicosConTurnos { get; set; }
        public DataTable M50TotalMedicosPorEspecialidad { get; set; }

        // Horarios
        public Medico H10MedicoConMayorAtencionSemanal { get; set; }
        public int H20TurnosSemanalesHabilitadosTotales { get; set; }

        // Pacientes
        public int P10TotalPacientes { get; set; }
        public int P20TotalPacientesActivos { get; set; }
        public int P30TotalPacientesInactivos { get; set; }
        public int P40PacientesAdultosMayores { get; set; } // +65
        public int P50PacientesAdultos { get; set; } // 18-64
        public int P60PacientesJuveniles { get; set; } // 13-17
        public int P70PacientesInfantiles { get; set; } // 6-13
        public int P80PacientesPreescolares { get; set; } // 3-5
        public int P90PacientesLactantes { get; set; } // 0-2 
        
        // Turnos
        public int T10TotalTurnos { get; set; }
        public int T20TotalTurnosFuturos { get; set; }
        public int T30TotalTurnosProximaSemana { get; set; }
        public int T40TotalTurnosPasados { get; set; }
        public int T50TotalTurnosAusentes { get; set; }
        public double T60PorcentajeTurnosAusentesSobreTurnosPasados { get; set; }
        public DataTable T70TotalTurnosAusentesPorMedico { get; set; }

    }
}

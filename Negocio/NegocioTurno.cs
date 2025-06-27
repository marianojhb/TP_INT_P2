using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioTurno
    {
        DaoTurno daoTurno = new DaoTurno();
        public List<DateTime> BuscarFechasDisponibles(string legajo)
        {
            // Busco en la BBDD los dias de atencion
            List<int> diasDeAtencion = BuscarDiasAtiende(legajo);

            // Establezco un limite de plazo desde hoy hasta X dias hacia adelante
            // para ofrecer reservar turnos
            List<DateTime> rango = RangoDeFechas(60); // rango dentro de los 60 dias

            // Filtrar el rango de acuerdo a los dias de atencion
            List<DateTime> rangoFiltrado = FiltrarRango(diasDeAtencion, rango);

            // Obtener horarios que atiende médico (todos) de la tabla Horarios:
            List<Horario> horario = daoTurno.HorariosDisponibles(legajo);

            // Agregar a las fechas, los horarios de atencion - Serían todos los turnos para los próximos x dias
            List<DateTime> turnosTodos = CombinarFechasYHorarios(rangoFiltrado, horario);

            // Traer las turnos ya reservados
            List<Turno> turnosReservados = GetTurnosReservados(legajo);

            // A todos los turnos, le resto los turnos reservados, quedan los turnos libres
            List<DateTime> turnosLibres = ObtenerTurnosLibres(turnosTodos, turnosReservados);

            // aca vamos armando la lista de fechas para retornar al codigo detras 
            // y rellenar dos drop downs (fechas y horas)
            return turnosLibres;
        }

        public List<int> BuscarDiasAtiende(string legajo)
        {

            return daoTurno.BuscarDiasAtiende(legajo);
        }

        public List<DateTime> RangoDeFechas (int dias)
        {
            DateTime inicio = DateTime.Now.Date;
            DateTime fin = inicio.AddDays(dias);
            List<DateTime> rango = new List<DateTime>();

            for (DateTime dt = inicio ; dt < fin ; dt=dt.AddDays(1) )
            {
                rango.Add(dt);
            }
            return rango;
        }
        public List<DateTime> FiltrarRango(List<int> dias, List<DateTime> rango)
        {
            List<DateTime> rangoFiltrado = new List<DateTime>();

            foreach (DateTime dt in rango)
            {
                if (dias.Contains((int)dt.DayOfWeek))
                    rangoFiltrado.Add(dt);
                
            }
            return rangoFiltrado;
        }
        public List<DateTime> CombinarFechasYHorarios(List<DateTime> fechas, List <Horario> horarios)
        {
            List<DateTime> resultado = new List<DateTime>();

            foreach (DateTime fecha in fechas)
            {
                int diaSemana = (int)fecha.DayOfWeek; // Domingo = 0, Lunes = 1, ...

                foreach (Horario horario in horarios)
                {
                    if (horario.Dia == diaSemana)
                    {
                        // Combinar fecha + hora
                        TimeSpan tsHora = TimeSpan.FromHours(horario.Hora);
                        DateTime fechaConHora = fecha.Date + tsHora;
                        resultado.Add(fechaConHora);
                    }
                }
            }

            return resultado;
        }
        public List<Turno> GetTurnosReservados(string legajo)
        {
            List<Turno> turnosReservados = new List<Turno>();
            return turnosReservados = daoTurno.GetTurnosReservados(legajo);
        }

        public List<DateTime> ObtenerTurnosLibres(List<DateTime> turnosTodos, List<Turno> turnosReservados)
        {
            List<DateTime> turnosLibres = new List<DateTime>();

            bool encontrado = false;

            foreach (DateTime turno in turnosTodos)
            {
                foreach(Turno turnoReservado in turnosReservados)
                {
                    if(turno == turnoReservado.Fecha)
                    {
                        encontrado = true;
                        break;
                       
                    }

                }
                if (!encontrado)
                    turnosLibres.Add(turno);

                encontrado = false;
            }

            return turnosLibres;
        }
        public int AgregarTurno(Turno turno)
        {
            return daoTurno.AgregarTurno(turno);
        }
        public DataTable GetListadoTurnosReservados(string legajo)
        {
            return daoTurno.GetListadoTurnosReservados(legajo);
        }
        public void EliminarTurno(Turno turno)
        {
            daoTurno.EliminarTurno(turno);
        }
        public void ActualizarTurno(Turno turno)
        {
            daoTurno.ActualizarTurno(turno);
        }

        public DataTable Buscar(string turnosDesde, string turnosHasta, string strLegajo, string strPalabraClave)
        {
            // 1. Fecha desde

            DateTime? fechaDesde = null;

            if (!string.IsNullOrWhiteSpace(turnosDesde) && DateTime.TryParse(turnosDesde, out DateTime fDesde))
            {
                fechaDesde = fDesde;
                
            }

            // 2. Fecha hasta
            DateTime? fechaHasta = null;

            if (!string.IsNullOrWhiteSpace(turnosHasta) && DateTime.TryParse(turnosHasta, out DateTime fHasta))
            {
                fechaHasta = fHasta;
            }

            // 3. Legajo (médico)

            int? legajo = null;
            if (!string.IsNullOrWhiteSpace(strLegajo) &&  (strLegajo  != "0") && int.TryParse(strLegajo, out int parsedLegajo))
            {
                legajo = parsedLegajo;
            }

            // 4. Palabra clave (nombre, apellido, DNI)

            string palabraClave = null;
            if (!string.IsNullOrEmpty(strPalabraClave))
            {
                palabraClave = strPalabraClave;
            }

            return daoTurno.Buscar(fechaDesde, fechaHasta, legajo, palabraClave);
        }
        public Informe CargarBadges(string legajo)
        {            
            return daoTurno.CargarBadges(legajo);
        }

    }
}


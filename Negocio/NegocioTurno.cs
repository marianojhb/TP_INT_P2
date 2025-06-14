using Datos;
using Entidades;
using System;
using System.Collections.Generic;
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

            // Filtro el rango de acuerdo a los dias de atencion
            List<DateTime> rangoFiltrado = FiltrarRango(diasDeAtencion, rango);

            // Horarios que atiende completo:
            List<Horario> horario = daoTurno.HorariosDisponibles(legajo);

            // Agregar a las fechas, los horarios de atencion
            List<DateTime> rangoConHorarios = CombinarFechasYHorarios(rangoFiltrado, horario);

            // Filtro el rango eliminando las fechas ya 
            //List<DateTime> turnosReservados = 
            
            // aca vamos armando la lista de fechas para retornar al codigo detras 
            // y rellenar dos drop downs (fechas y horas)
            return rangoConHorarios;
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

    }
}


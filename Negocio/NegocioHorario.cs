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
    public class NegocioHorario
    {
        DaoHorario daoHorario = new DaoHorario();

        public DataTable GenerarHorarioPivotado(string legajo)
        {
            return daoHorario.GetHorariosDataTable(legajo);
        }
        public void ActualizarDisponibilidad(int legajo, int hora, int dia, bool disponible)
        {
            daoHorario.ActualizarDisponibilidad(legajo, hora, dia, disponible);

        }
    }
}

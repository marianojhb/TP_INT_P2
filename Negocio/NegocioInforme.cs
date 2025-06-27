using Entidades;
using Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioInforme
    {
        DaoInforme daoInforme = new DaoInforme();
        public Informe ObtenerInforme(DateTime inicio, DateTime fin)
        {
            return daoInforme.ObtenerInforme(inicio, fin);
        }
    }
}

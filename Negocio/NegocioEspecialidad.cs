using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioEspecialidad
    {
        DaoEspecialidad daoEspecialidad = new DaoEspecialidad();

        public List<Especialidad> GetEspecialidades()
        {
            DaoEspecialidad dao = new DaoEspecialidad();
            return dao.GetEspecialidades();
        }
    }
}

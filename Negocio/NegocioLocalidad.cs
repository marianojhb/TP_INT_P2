using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioLocalidad
    {
        public List<Localidad> GetLocalidades(string provincia)
        {
            DaoLocalidad dao = new DaoLocalidad();
            return dao.GetLocalidades(provincia);
        }
    }
}

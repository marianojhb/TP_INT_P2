using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioProvincia
    {
        public List<Provincia> GetProvincias()
        {
            DaoProvincia dao = new DaoProvincia();
            return dao.GetProvincias();
        }
    }
}

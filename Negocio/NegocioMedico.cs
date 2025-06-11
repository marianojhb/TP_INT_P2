using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioMedico
    {
        public Medico getDatos(Usuario u)
        {
            DaoMedico daoMedico = new DaoMedico();
            
            return daoMedico.GetMedico(u);
        }
    }
}

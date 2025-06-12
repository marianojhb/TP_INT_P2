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
        DaoMedico daoMedico = new DaoMedico();

        public Medico getDatos(Usuario u)
        {
            return daoMedico.GetMedico(u);
        }

        public bool AgregarMedicoCheckDNI(Medico m)
        {
            return daoMedico.AgregarMedicoCheckDNI(m);
        }

        public int ProximoLegajo()
        {
            return daoMedico.ProximoLegajo();
        }
        public bool ExisteDNI(string dni)
        {
            return daoMedico.ExisteDNI(dni);
        }

        public int AgregarMedico(Medico m)
        {
            return daoMedico.AgregarMedico(m);
        }
    }
}

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
        public List<Medico> GetMedicosPorEspecialidad(string codEspecialidad)
        {
            DaoMedico dao = new DaoMedico();
            return dao.GetMedicosPorEspecialidad(codEspecialidad);
        }
        public int ActualizarMedico(Medico m)
        {
            return daoMedico.ActualizarMedico(m);
        }
    }
}

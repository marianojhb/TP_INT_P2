using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioUsuario
    {
        DaoUsuario daoUsuario = new DaoUsuario();
        public bool LoginOK(Usuario u)
        {
            return daoUsuario.ExisteUsuario(u);
        }
        public string GetRole(Persona p)
        {

            string tipo = daoUsuario.GetRole(p);

            return tipo;
        }
    }
}

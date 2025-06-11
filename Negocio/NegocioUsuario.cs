using Datos;
using Entidades;
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
        public Usuario GetData(Usuario u)
        {
            return daoUsuario.GetData(u);
        }
    }
}

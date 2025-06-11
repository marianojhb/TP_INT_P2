using Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoUsuario
    {
        AccesoDatos ac = new AccesoDatos();
        public bool ExisteUsuario(Usuario c)
        {
            string consulta = "SELECT 1 FROM USUARIOS WHERE usuario_U = @usuario AND password_U = @password";
            using (SqlCommand comando = new SqlCommand())
            {
                comando.CommandText = consulta;
                comando.Connection = ac.obtenerConexion();
                comando.Parameters.AddWithValue("@usuario", c.Username);
                comando.Parameters.AddWithValue("@password", c.Password);

                object result = comando.ExecuteScalar();

                return result != null;
            }

        }

        public string GetRole(Persona p)
        {
            string consulta = "SELECT tipo_U FROM USUARIOS WHERE usuario_U = @usuario";
            using (SqlCommand comando = new SqlCommand())
            {
                comando.CommandText = consulta;
                comando.Connection = ac.obtenerConexion();
                comando.Parameters.AddWithValue("@usuario", p.Username);

                object result = comando.ExecuteScalar();

                return result?.ToString();
            }
        }
    }
}
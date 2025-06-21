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
        public bool ExisteUsuario(Usuario u)
        {
            string consulta = "SELECT 1 FROM USUARIOS WHERE username_U = @username AND password_U = @password AND estado_U = 1";
            using (SqlCommand comando = new SqlCommand())
            {
                comando.CommandText = consulta;
                comando.Connection = ac.obtenerConexion();
                comando.Parameters.AddWithValue("@username", u.Username);
                comando.Parameters.AddWithValue("@password", u.Password);

                object result = comando.ExecuteScalar();

                return result != null;
            }

        }

        public Usuario GetData(Usuario usuario)
        {
            string consulta = "SELECT * FROM USUARIOS WHERE username_U = @username";
            using (SqlCommand comando = new SqlCommand())
            {
                comando.CommandText = consulta;
                comando.Connection = ac.obtenerConexion();
                comando.Parameters.AddWithValue("@username", usuario.Username);
                
                SqlDataReader data = comando.ExecuteReader();
                if (data.Read())
                {
                    usuario.Username = data["username_U"].ToString();
                    usuario.Password = data["password_U"].ToString();
                    usuario.Tipo = data["tipo_U"].ToString();
                    usuario.Email = data["email_U"].ToString();
                    usuario.Estado = Convert.ToBoolean(data["estado_U"]);
                }
                comando.Connection.Close();
                return usuario;
            }
        }
    }
}

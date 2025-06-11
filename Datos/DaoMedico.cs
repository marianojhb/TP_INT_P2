using Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoMedico
    {
        AccesoDatos ac = new AccesoDatos();
        public Medico GetMedico(Usuario u)
        {
            Medico medico = new Medico();

            string consulta = "SELECT * FROM USUARIOS AS [U] " +
                                "INNER JOIN PERSONAS AS[P] ON U.email_U = P.email_P " +
                                "INNER JOIN MEDICOS AS[M] ON P.dni_P = M.dni_M " +
                                "INNER JOIN LOCALIDADES AS[L] ON L.idLocalidad_L = P.idLocalidad_P " +
                                "INNER JOIN PROVINCIAS ON L.idProvincia_L = PROVINCIAS.idProvincia_PROV " +
                                "INNER JOIN ESPECIALIDADES AS[E] ON M.CodEspecialidad_M = E.codEspecialidad_E " +
                                "WHERE U.email_U = @email ";

            SqlCommand comando = new SqlCommand();
            comando.CommandText = consulta;
            comando.Parameters.AddWithValue("@email", u.Email);

            comando.Connection = ac.obtenerConexion();
            SqlDataReader data = comando.ExecuteReader();
            if (data.Read())
            {
                medico.DNI = data["dni_P"].ToString();
                medico.Nombre = data["nombre_P"].ToString();
                medico.Apellido = data["apellido_P"].ToString();
                medico.Sexo = data["sexo_P"].ToString()[0];
                medico.Nacionalidad = data["nacionalidad_P"].ToString();
                medico.FechaNac = data["fechaNac_P"].ToString();
                medico.IdLocalidad = Convert.ToInt32(data["idLocalidad_P"]);
                medico.IdProvincia = Convert.ToInt32(data["idProvincia_P"]);
                medico.Email = data["email_P"].ToString();
                medico.Telefono = data["telefono_P"].ToString();
                medico.Provincia = data["nombre_PROV"].ToString();
                medico.Localidad = data["nombre_L"].ToString();
                medico.Imagen = data["imagen_M"].ToString();
                medico.Username = data["username_U"].ToString();
                medico.Password = data["password_U"].ToString(); // RIESGO SEGURIDAD
                medico.Especialidad = data["nombre_E"].ToString();
            }
            comando.Connection.Close();
            return medico;
        }
    }
}

using Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
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

        public int ProximoLegajo()
        {
            string consulta = "SELECT MAX(legajo_M) FROM MEDICOS";
            using (SqlCommand command = new SqlCommand(consulta, ac.obtenerConexion())) // Asegurate de tener una conexión válida
            {
                object result = command.ExecuteScalar();
                if (result == DBNull.Value || result == null)
                    return 1; // Primer legajo si no hay médicos aún
                else
                    return Convert.ToInt32(result) + 1; // Siguiente legajo
            }
        }

        public bool AgregarMedicoCheckDNI(Medico m)
        {
            string consulta = "SELECT 1 FROM PERSONAS WHERE dni_P = '" + m.DNI + "'";
            return ac.Existe(consulta);
        }

        public bool ExisteDNI(string dni)
        {
            string consulta = "SELECT 1 FROM PERSONAS WHERE dni_P = '" + dni + "'";

            return ac.Existe(consulta);
        }
        public int AgregarMedico(Medico m)
        {
            SqlCommand comando = new SqlCommand();

            // TABLA PERSONAS
            comando.Parameters.AddWithValue("@DNI", m.DNI);
            comando.Parameters.AddWithValue("@NOMBRE", m.Nombre);
            comando.Parameters.AddWithValue("@APELLIDO", m.Apellido);
            comando.Parameters.AddWithValue("@SEXO", m.Sexo);
            comando.Parameters.AddWithValue("@NACIONALIDAD", m.Nacionalidad);
            comando.Parameters.AddWithValue("@FECHANAC", m.FechaNac);
            comando.Parameters.AddWithValue("@DIRECCION", m.Direccion);
            comando.Parameters.AddWithValue("@IDPROVINCIA", m.IdProvincia);
            comando.Parameters.AddWithValue("@IDLOCALIDAD", m.IdLocalidad);
            comando.Parameters.AddWithValue("@EMAIL", m.Email);
            comando.Parameters.AddWithValue("@TELEFONO", m.Telefono);

            // TABLA MEDICOS:
            comando.Parameters.AddWithValue("@LEGAJO", m.Legajo);
            comando.Parameters.AddWithValue("@CODESPECIALIDAD", m.CodEspecialidad);
            comando.Parameters.AddWithValue("@HORARIO", m.Horario);
            comando.Parameters.AddWithValue("@IMAGEN", m.Imagen);

            // TABLA USUARIOS:
            comando.Parameters.AddWithValue("@USERNAME", m.Username);
            comando.Parameters.AddWithValue("@PASSWORD", m.Password);

            string nombreSP = "SP_AGREGARMEDICO";

            return ac.ejecutarProcedimientosAlmacenados(comando, nombreSP);
        }



    }
}

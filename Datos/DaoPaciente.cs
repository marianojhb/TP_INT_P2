using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoPaciente
    {
        AccesoDatos ac = new AccesoDatos();

        private void ArmarParametrosAgregarPaciente(ref SqlCommand comando, Paciente paciente)
        {
            SqlParameter parametros = new SqlParameter();
            parametros = comando.Parameters.Add("@DNI", SqlDbType.VarChar);
            parametros.Value = paciente.Nombre;
            parametros = comando.Parameters.Add("@NOMBRE", SqlDbType.VarChar);
            parametros.Value = paciente.Nombre;
            parametros = comando.Parameters.Add("@APELLIDO", SqlDbType.VarChar);
            parametros.Value = paciente.Apellido;
            parametros = comando.Parameters.Add("@SEXO", SqlDbType.Char);
            parametros.Value = paciente.Sexo;
            parametros = comando.Parameters.Add("@NACIONALIDAD", SqlDbType.VarChar);
            parametros.Value = paciente.Nacionalidad;
            parametros = comando.Parameters.Add("@DIRECCION", SqlDbType.VarChar);
            parametros.Value = paciente.Direccion;
            parametros = comando.Parameters.Add("@FECHANAC", SqlDbType.DateTime);
            parametros.Value = paciente.FechaNac;
            parametros = comando.Parameters.Add("@IDLOCALIDAD", SqlDbType.Int);
            parametros.Value = paciente.IdLocalidad;
            parametros = comando.Parameters.Add("@IDPROVINCIA", SqlDbType.Int);
            parametros.Value = paciente.IdProvincia;
            parametros = comando.Parameters.Add("@EMAIL", SqlDbType.VarChar);
            parametros.Value = paciente.Email;
            parametros = comando.Parameters.Add("@TELEFONO", SqlDbType.VarChar);
            parametros.Value = paciente.Telefono;
        }

        public int AgregarPaciente (Paciente paciente)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosAgregarPaciente(ref comando, paciente);
            comando.CommandType = CommandType.StoredProcedure;
            return ac.ejecutarProcedimientosAlmacenados(comando, "SP_AGREGARPACIENTE");  // retorna cuantas lineas modifico.... 2
        }






        public DataTable GetPacientes()
        {
            // Crear el comando
            SqlCommand comando = new SqlCommand();
            comando.Connection = ac.obtenerConexion();
            comando.CommandType = CommandType.StoredProcedure;
            comando.CommandText = "SP_SELECTPACIENTES";

            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(comando);

            // Crear el DataTable donde se guardarán los resultados
            DataTable tablaPacientes = new DataTable();


            sqlDataAdapter.Fill(tablaPacientes);

            return tablaPacientes;
        }

        public void EliminarPaciente(Paciente paciente) {
            string consulta = "UPDATE PACIENTES SET estado_PA = 0 WHERE dni_PA = @dni";
            SqlCommand sqlCommand = new SqlCommand(consulta, ac.obtenerConexion());
            sqlCommand.Parameters.AddWithValue("@dni", paciente.DNI);
            sqlCommand.ExecuteNonQuery();

        }

        private void ArmarParametrosPacientes(ref SqlCommand comando, Paciente paciente)
        {
            SqlParameter parametros = new SqlParameter();
            parametros = comando.Parameters.Add("@NOMBRE", SqlDbType.VarChar);
            parametros.Value = paciente.Nombre;
            parametros = comando.Parameters.Add("@APELLIDO", SqlDbType.VarChar);
            parametros.Value = paciente.Apellido;
            parametros = comando.Parameters.Add("@SEXO", SqlDbType.Char);
            parametros.Value = paciente.Sexo;
            parametros = comando.Parameters.Add("@NACIONALIDAD", SqlDbType.VarChar);
            parametros.Value = paciente.Nacionalidad;
            parametros = comando.Parameters.Add("@DIRECCION", SqlDbType.VarChar);
            parametros.Value = paciente.Direccion;
            parametros = comando.Parameters.Add("@FECHANAC", SqlDbType.DateTime);
            parametros.Value = paciente.FechaNac;
            parametros = comando.Parameters.Add("@IDLOCALIDAD", SqlDbType.Int);
            parametros.Value = paciente.IdLocalidad;
            parametros = comando.Parameters.Add("@IDPROVINCIA", SqlDbType.Int);
            parametros.Value = paciente.IdProvincia;
            parametros = comando.Parameters.Add("@EMAIL", SqlDbType.VarChar);
            parametros.Value = paciente.Email;
            parametros = comando.Parameters.Add("@TELEFONO", SqlDbType.VarChar);
            parametros.Value = paciente.Telefono;
        }
        public void ActualizarPaciente(Paciente paciente)
        {
            SqlCommand comando = new SqlCommand();
            comando.Parameters.AddWithValue("@DNI", paciente.DNI);
            ArmarParametrosPacientes(ref comando, paciente);
            comando.CommandType = CommandType.StoredProcedure;
            ac.ejecutarProcedimientosAlmacenados(comando, "SP_UPDATEPACIENTES");

        }



        public DataTable GetPaciente(string dni)
        {
            using (SqlConnection conexion = ac.obtenerConexion())
            {
                using (SqlCommand comando = new SqlCommand("SELECT P.dni_P, P.nombre_P, P.apellido_P FROM PERSONAS P INNER JOIN PACIENTES PA ON P.dni_P = PA.dni_PA WHERE P.dni_P = @DNI AND PA.estado_PA = 1", conexion))
                {
                    comando.Parameters.AddWithValue("@DNI", dni);

                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(comando);
                    DataTable tablaPacientes = new DataTable();
                    sqlDataAdapter.Fill(tablaPacientes);

                    return tablaPacientes;
                }
            }
        }

        public bool ExisteDNI(string dni)
        {
            string consulta = "SELECT 1 FROM PACIENTES WHERE dni_PA = '" + dni + "'";

            return ac.Existe(consulta);
        }

    }
}

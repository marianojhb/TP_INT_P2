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

        //public int AgregarPaciente(Paciente paciente)
        //{
        //    SqlCommand comando = new SqlCommand();
        //    string consulta = "INSERT INTO USUARIOS (dni_U, nombre_U, apellido_U, tipo_U, sexo_U, nacionalidad_U, fechaNac_U, direccion_U, idLocalidad_U, idProvincia_U, email_U, telefono_U) VALUES (@dni, @nombre, @apellido, @tipo, @sexo, @nacionalidad, @fechaNac, @direccion, @idLocalidad, @idProvincia, @email, @telefono)";
        //    comando.CommandText = consulta;
        //    comando.Connection = ac.obtenerConexion();
        //    comando.Parameters.AddWithValue("@dni", paciente.DNI);
        //    comando.Parameters.AddWithValue("@nombre", paciente.Nombre);
        //    comando.Parameters.AddWithValue("@apellido", paciente.Apellido);
        //    comando.Parameters.AddWithValue("@tipo", paciente.Tipo);
        //    comando.Parameters.AddWithValue("@sexo", paciente.Sexo);
        //    comando.Parameters.AddWithValue("@nacionalidad", paciente.Nacionalidad);
        //    comando.Parameters.AddWithValue("@fechaNac", paciente.FechaNac);
        //    comando.Parameters.AddWithValue("@direccion", paciente.Direccion);
        //    comando.Parameters.AddWithValue("@idLocalidad", paciente.IdLocalidad);
        //    comando.Parameters.AddWithValue("@idProvincia", paciente.IdProvincia);
        //    comando.Parameters.AddWithValue("@email", paciente.Email);
        //    comando.Parameters.AddWithValue("@telefono", paciente.Telefono);
        //    return comando.ExecuteNonQuery();
        //}

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
    }
}

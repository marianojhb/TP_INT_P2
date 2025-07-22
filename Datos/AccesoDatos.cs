using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Entidades;
using System.Configuration;

namespace Datos
{
    public class AccesoDatos
    {
        private string cadenaConexion;
        SqlConnection sqlConnection;

        public AccesoDatos()
        {
            #if DEBUG
                cadenaConexion = ConfigurationManager.ConnectionStrings["BDClinicaLocal"].ConnectionString;
            #else
                cadenaConexion = ConfigurationManager.ConnectionStrings["BDClinicaAzure"].ConnectionString;
            #endif
        }



        public SqlConnection obtenerConexion()
        {
            sqlConnection = new SqlConnection(cadenaConexion);
            try
            {
                sqlConnection.Open();
                return sqlConnection;
            }
            catch (Exception err)
            {
                // Lanzar la excepción para saber el error real
                throw new Exception("Error abriendo la conexión: " + err.Message, err);
            }
        }

        public SqlDataAdapter obtenerAdaptador(string consulta, SqlConnection conn)
        {
            SqlDataAdapter adapter;
            try
            {
                adapter = new SqlDataAdapter(consulta, conn);
                return adapter;
            }
            catch (Exception err)
            {
                return null;
            }
        }

        public DataTable ObtenerTabla(string consultaSql)
        {
            DataSet ds = new DataSet();
            sqlConnection = obtenerConexion();
            SqlDataAdapter adapter = obtenerAdaptador(consultaSql, sqlConnection);
            adapter.Fill(ds);
            sqlConnection.Close();
            return ds.Tables[0];
        }

        public int ejecutarProcedimientosAlmacenados(SqlCommand comando, string nombreSP)
        {
            int filasCambiadas = 0;
            sqlConnection = obtenerConexion();
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand = comando;
            sqlCommand.Connection = sqlConnection;
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = nombreSP;
            filasCambiadas = sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
            return filasCambiadas;
        }
        public Boolean Existe(String consulta)
        {
            Boolean estado = false;
            SqlConnection Conexion = obtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta, Conexion);
            SqlDataReader datos = cmd.ExecuteReader();
            if (datos.Read())
            {
                estado = true;
            }
            Conexion.Close();
            return estado;
        }

        public void cerrarConexion()
        {
            if (sqlConnection != null && sqlConnection.State == System.Data.ConnectionState.Open)
            {
                sqlConnection.Close();
            }
        }
    }
}


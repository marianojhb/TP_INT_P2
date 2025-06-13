using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoHorario
    {
        AccesoDatos ac = new AccesoDatos();

        public DataTable GetHorariosDataTable(string legajo)
        {
            using (SqlConnection conexion = ac.obtenerConexion())
            {
                using (SqlCommand comando = new SqlCommand("SELECT * FROM HORARIOS WHERE legajo_H = @LEGAJO", conexion))
                {
                    comando.Parameters.AddWithValue("@LEGAJO", legajo);

                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(comando);
                    DataTable tablaHorarios = new DataTable();
                    sqlDataAdapter.Fill(tablaHorarios);

                    return tablaHorarios;
                }
            }
        }
        public void ActualizarDisponibilidad (int legajo, int hora, int dia, bool disponible)
        {
            using (SqlConnection conexion = ac.obtenerConexion())
            {
                using (SqlCommand comando = new SqlCommand("UPDATE HORARIOS SET disponible_H = @DISPONIBLE WHERE legajo_H = @LEGAJO AND hora_H = @HORA AND dia_H = @DIA", conexion))
                {
                    SqlParameter parametros = new SqlParameter();
                    parametros = comando.Parameters.Add("@LEGAJO", SqlDbType.Int);
                    parametros.Value = legajo;
                    parametros = comando.Parameters.Add("@HORA", SqlDbType.Int);
                    parametros.Value = hora;
                    parametros = comando.Parameters.Add("@DIA", SqlDbType.Int);
                    parametros.Value = dia;
                    parametros = comando.Parameters.Add("@DISPONIBLE", SqlDbType.Bit);
                    parametros.Value = disponible;


                    comando.ExecuteNonQuery();
                }
            }


        }

    }
}

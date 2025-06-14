using Entidades;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoTurno
    {
        AccesoDatos ac = new AccesoDatos();

        public List<int> BuscarDiasAtiende(string legajo)
        {
            List<int> lista = new List<int>();

            string consulta = "SELECT DISTINCT dia_H FROM HORARIOS WHERE legajo_H = @LEGAJO AND disponible_H = 1";

            SqlCommand cmd = new SqlCommand(consulta, ac.obtenerConexion());

            cmd.Parameters.AddWithValue("@LEGAJO", legajo);

            SqlDataReader data = cmd.ExecuteReader();

            while (data.Read())
            {
                lista.Add(Convert.ToInt32(data["dia_H"]));
            }
            return lista;
        }
        public List<Horario> HorariosDisponibles(string legajo)
        {
            List<Horario> lista = new List<Horario>();

            string consulta = "SELECT legajo_H, codigo_H, dia_H, hora_H, disponible_H FROM HORARIOS WHERE legajo_H = @LEGAJO AND disponible_H = 1";

            SqlCommand cmd = new SqlCommand(consulta, ac.obtenerConexion());

            cmd.Parameters.AddWithValue("@LEGAJO", legajo);

            SqlDataReader data = cmd.ExecuteReader();

            while (data.Read())
            {
                Horario horario = new Horario()
                { 
                    Legajo = Convert.ToInt32(data["legajo_H"]),
                    Codigo = Convert.ToInt32(data["codigo_H"]),
                    Dia = Convert.ToInt32(data["dia_H"]),
                    Hora = Convert.ToInt32(data["hora_H"]),
                    Disponible = Convert.ToBoolean(data["disponible_H"])
                };
                lista.Add(horario);
            }

            return lista;
        }
        public List<Turno> GetTurnosReservados(string legajo)
        {
            List<Turno> lista = new List<Turno>();

            string consulta = "SELECT fecha_T, legajo_T, asistencia_T, dni_T, observacion_T, cancelado_T FROM TURNOS WHERE legajo_T = @LEGAJO AND cancelado_T = 0";

            SqlCommand cmd = new SqlCommand(consulta, ac.obtenerConexion());

            cmd.Parameters.AddWithValue("@LEGAJO", legajo);

            SqlDataReader data = cmd.ExecuteReader();

            while (data.Read())
            {
                Turno turno = new Turno()
                {
                    Fecha = Convert.ToDateTime(data["fecha_T"]),
                    Legajo = legajo,
                    Asistencia = Convert.ToBoolean(data["asistencia_T"]),
                    DNI = data["dni_T"].ToString(),
                    Observacion = data["observacion_T"].ToString(),
                    Cancelado = Convert.ToBoolean(data["cancelado_T"])
                }; 
                lista.Add(turno);
            }

            return lista;

        }
        public int AgregarTurno(Turno turno)
        {
            using (SqlConnection conexion = ac.obtenerConexion())
            {
                string consulta = "INSERT INTO Turnos (fecha_T, legajo_T, dni_T) VALUES (@FECHA, @LEGAJO, @DNI)";
                using (SqlCommand comando = new SqlCommand(consulta, conexion))
                {
                    SqlParameter parametros = new SqlParameter();
                    parametros = comando.Parameters.Add("@FECHA", SqlDbType.DateTime);
                    parametros.Value = turno.Fecha;
                    parametros = comando.Parameters.Add("@LEGAJO", SqlDbType.Int);
                    parametros.Value = Convert.ToInt32(turno.Legajo);
                    parametros = comando.Parameters.Add("@DNI", SqlDbType.VarChar);
                    parametros.Value = turno.DNI;
                    return comando.ExecuteNonQuery();
                }
            }
        }
    }
}

using Entidades;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Reflection;
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







        public DataTable GetListadoTurnosReservados(string legajo)
        {
            using (SqlConnection conexion = ac.obtenerConexion())
            {
                string consultaAll = "SELECT T.*, PA.*, P.*, M.*, (PM.nombre_P + ' ' + PM.apellido_P) AS fullNameMedico, L.*, PROV.*  FROM TURNOS T  INNER JOIN PACIENTES PA ON T.dni_T = PA.dni_PA  INNER JOIN PERSONAS P ON T.dni_T = P.dni_P  INNER JOIN MEDICOS M ON T.legajo_T = M.legajo_M INNER JOIN PERSONAS PM ON M.dni_M = PM.dni_P  INNER JOIN LOCALIDADES L ON P.idLocalidad_P = L.idLocalidad_l INNER JOIN PROVINCIAS PROV ON P.idProvincia_P = PROV.idProvincia_PROV WHERE PA.estado_PA = 1 ORDER BY T.fecha_T ASC";
                string consultaLegajo = "SELECT T.*, PA.*, P.*, M.*, (PM.nombre_P + ' ' + PM.apellido_P) AS fullNameMedico, L.*, PROV.* FROM TURNOS T INNER JOIN PACIENTES PA ON T.dni_T = PA.dni_PA INNER JOIN PERSONAS P ON T.dni_T = P.dni_P  INNER JOIN MEDICOS M ON T.legajo_T = M.legajo_M INNER JOIN PERSONAS PM ON M.dni_M = PM.dni_P INNER JOIN LOCALIDADES L ON P.idLocalidad_P = L.idLocalidad_l INNER JOIN PROVINCIAS PROV ON P.idProvincia_P = PROV.idProvincia_PROV WHERE M.legajo_M = @legajo_T AND PA.estado_PA = 1 ORDER BY T.fecha_T ASC";

                using (SqlCommand comando = new SqlCommand())
                {
                    comando.Connection = conexion;

                    // Listado de Turnos de médico
                    if (!string.IsNullOrEmpty(legajo))
                    {
                        comando.CommandText = consultaLegajo;
                        comando.Parameters.AddWithValue("@legajo_T", legajo);
                    }
                    // Listado de todos los turnos
                    else
                    {
                        comando.CommandText = consultaAll;
                    }

                    SqlDataAdapter adapter = new SqlDataAdapter(comando);
                    DataTable tabla = new DataTable();
                    adapter.Fill(tabla);
                    return tabla;
                }
            }
        }

        public void EliminarTurno(Turno turno)
        {
            string consulta = "UPDATE TURNOS SET cancelado_T = 0 WHERE fecha_T = @fecha_T AND legajo_T = @legajo_T";

            using (SqlConnection conexion = ac.obtenerConexion())
            {
                using (SqlCommand comando = new SqlCommand(consulta, conexion))
                {
                    comando.Parameters.AddWithValue("@fecha_T", turno.Fecha);
                    comando.Parameters.AddWithValue("@legajo_T", turno.Legajo);
                    comando.ExecuteNonQuery();
                }
            }
        }
        public void ActualizarTurno(Turno turno)
        {
            string consulta = "UPDATE TURNOS SET asistencia_T = @asistencia_T, observacion_T = @observacion_T, cancelado_T = @cancelado_T WHERE fecha_T = @fecha_T AND legajo_T = @legajo_T";

            using (SqlConnection conexion = ac.obtenerConexion())
            {
                using (SqlCommand comando = new SqlCommand(consulta, conexion))
                {
                    SqlParameter parametros = new SqlParameter();
                    parametros = comando.Parameters.Add("@fecha_T", SqlDbType.DateTime);
                    parametros.Value = turno.Fecha;
                    parametros = comando.Parameters.Add("@legajo_T", SqlDbType.Int);
                    parametros.Value = Convert.ToInt32(turno.Legajo);
                    parametros = comando.Parameters.Add("@asistencia_T", SqlDbType.Bit);
                    parametros.Value = turno.Asistencia;
                    parametros = comando.Parameters.Add("@observacion_T", SqlDbType.VarChar);
                    parametros.Value = turno.Observacion;
                    parametros = comando.Parameters.Add("@cancelado_T", SqlDbType.Bit);
                    parametros.Value = turno.Cancelado;
                    comando.ExecuteNonQuery();
                }
            }
        }


        /// //////////////////////////////////////////////////////////////////////////////////////

        public DataTable Buscar(DateTime? turnosDesde, DateTime? turnosHasta, int? _legajo, string palabraClave)
        {
            using (SqlConnection conexion = ac.obtenerConexion())
            {
                string consulta =
                "SELECT T.*, PA.*, P.*, M.*, (PM.nombre_P + ' ' + PM.apellido_P) AS fullNameMedico, L.*, PROV.* " +
                "FROM TURNOS T " +
                "INNER JOIN PACIENTES PA ON T.dni_T = PA.dni_PA " +
                "INNER JOIN PERSONAS P ON T.dni_T = P.dni_P " +
                "INNER JOIN MEDICOS M ON T.legajo_T = M.legajo_M " +
                "INNER JOIN PERSONAS PM ON M.dni_M = PM.dni_P " +
                "INNER JOIN LOCALIDADES L ON P.idLocalidad_P = L.idLocalidad_l " +
                "INNER JOIN PROVINCIAS PROV ON P.idProvincia_P = PROV.idProvincia_PROV " +
                "WHERE " +
                "(@palabraClave IS NULL OR (" +
                    "P.nombre_P LIKE @palabraClave " +
                    "OR P.apellido_P LIKE @palabraClave " +
                    "OR P.dni_P LIKE @palabraClave " +
                    "OR P.email_P LIKE @palabraClave)) " +
                "AND(" +
                    "@legajo IS NULL " +
                    "OR M.legajo_M = @legajo) " +
                "AND(" +
                    "@turnosDesde IS NULL " +
                    "OR(T.fecha_T >= @turnosDesde)) " +
                "AND(@turnosHasta IS NULL " +
                    "OR(T.fecha_T <= @turnosHasta)) " +
                "AND PA.estado_PA = 1 " +
                "ORDER BY T.fecha_T ASC";

                using (SqlCommand comando = new SqlCommand())
                {
                    comando.Connection = conexion;

                    // Listado de Turnos con palabra clave
                    int? legajo = _legajo;
                    comando.Parameters.AddWithValue("@palabraClave", string.IsNullOrEmpty(palabraClave) ? (object)DBNull.Value : "%" + palabraClave + "%");
                    comando.Parameters.AddWithValue("@legajo", legajo.HasValue ? legajo.Value : (object)DBNull.Value);
                    comando.Parameters.AddWithValue("@turnosDesde", turnosDesde == null ? (object)DBNull.Value : turnosDesde);
                    comando.Parameters.AddWithValue("@turnosHasta", turnosHasta == null ? (object)DBNull.Value : turnosHasta.Value.AddDays(1));

                    comando.CommandText = consulta;
                    SqlDataAdapter adaptador = new SqlDataAdapter(comando);
                    DataTable dt = new DataTable();
                    adaptador.Fill(dt);
                    return dt;
                }
            }
            
        }

    }
}

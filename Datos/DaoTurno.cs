using Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoTurno
    {
        AccesoDatos ac = new AccesoDatos();
        public List<Turno> BuscarFechasDisponibles (string legajo)
        {
            List<Turno> lista = new List<Turno>();

            string consulta = "SELECT ";

            SqlCommand cmd = new SqlCommand(consulta, ac.obtenerConexion());

            cmd.Parameters.AddWithValue("@LEGAJO", legajo);
            cmd.Parameters.AddWithValue("@ANIO", legajo);
            cmd.Parameters.AddWithValue("@MES", legajo);
            cmd.Parameters.AddWithValue("@DIA", legajo);
            cmd.Parameters.AddWithValue("@HORA", legajo);

            SqlDataReader data = cmd.ExecuteReader();

            while (data.Read())
            {
                Turno turno = new Turno();
                turno.Anio = "2025";
                turno.Mes = "5";
                turno.Dia = "2";
                turno.Legajo = "1";
                string fechaString = $"{turno.Anio.ToString()}-{turno.Mes.ToString()}-{turno.Dia.ToString()} 00:00:00";
                turno.Fecha = Convert.ToDateTime(fechaString);
                lista.Add(turno);
                }

            data.Close();
            ac.cerrarConexion();
            return lista;
        }
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
    }
}

using Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoEspecialidad
    {
        AccesoDatos ac = new AccesoDatos();

        public List<Especialidad> GetEspecialidades()
        {
            List<Especialidad> lista = new List<Especialidad>();
            string consulta = "SELECT codEspecialidad_E, nombre_E FROM ESPECIALIDADES";

            SqlCommand cmd = new SqlCommand(consulta, ac.obtenerConexion());
            SqlDataReader data = cmd.ExecuteReader();

            while (data.Read())
            {
                Especialidad e = new Especialidad();
                e.CodEspecialidad = Convert.ToInt32(data["codEspecialidad_E"]);
                e.Nombre = data["nombre_E"].ToString();
                lista.Add(e);
            }

            data.Close();
            ac.cerrarConexion();
            return lista;
        }
    }
}

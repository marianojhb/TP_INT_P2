using Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoLocalidad
    {
        AccesoDatos ac = new AccesoDatos();

        public List<Localidad> GetLocalidades(string provincia)
        {
            List<Localidad> lista = new List<Localidad>();
            string consulta = "SELECT idLocalidad_L, nombre_L FROM LOCALIDADES WHERE idProvincia_L = @provincia ORDER BY nombre_L ASC";

            SqlCommand cmd = new SqlCommand(consulta, ac.obtenerConexion());

            cmd.Parameters.AddWithValue("@provincia", provincia);

            SqlDataReader data = cmd.ExecuteReader();

            while (data.Read())
            {
                Localidad p = new Localidad();
                p.IdLocalidad = Convert.ToInt32(data["idLocalidad_L"]);
                p.Nombre = data["nombre_L"].ToString();
                lista.Add(p);
            }

            data.Close();
            ac.cerrarConexion();
            return lista;
        }
    }
}

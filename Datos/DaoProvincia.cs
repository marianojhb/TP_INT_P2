using Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoProvincia
    {
        AccesoDatos ac = new AccesoDatos();

        public List<Provincia> GetProvincias()
        {
            List<Provincia> lista = new List<Provincia>();
            string consulta = "SELECT idProvincia_PROV, nombre_PROV FROM Provincias ORDER BY nombre_PROV ASC";

            SqlCommand cmd = new SqlCommand(consulta, ac.obtenerConexion());
            SqlDataReader data = cmd.ExecuteReader();

            while (data.Read())
            {
                Provincia p = new Provincia();
                p.IdProvincia = Convert.ToInt32(data["idProvincia_PROV"]);
                p.Nombre = data["nombre_PROV"].ToString();
                lista.Add(p);
            }

            data.Close();
            ac.cerrarConexion();
            return lista;
        }

    }
}

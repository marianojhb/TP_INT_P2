using Entidades;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoInforme
    {
        AccesoDatos ac = new AccesoDatos();
        public Informe ObtenerInforme(DateTime inicio,  DateTime fin)
        {
            using (SqlConnection conn = ac.obtenerConexion())
            {
                if (conn == null)
                    throw new Exception("No se pudo establecer la conexión con la base de datos.");
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;

                    

                    Informe informe = new Informe(inicio, fin);

                    cmd.CommandText = "SELECT COUNT(M.dni_M) FROM MEDICOS M";
                    informe.M10TotalMedicos = (int)cmd.ExecuteScalar();



                    cmd.CommandText = "SELECT COUNT(M.dni_M) FROM MEDICOS M WHERE M.estado_M = 1";
                    informe.M20TotalMedicosActivos = (int)cmd.ExecuteScalar();

                    
                    informe.M30TotalMedicosInactivos = informe.M10TotalMedicos - informe.M20TotalMedicosActivos;

                    cmd.CommandText =
                        @"SELECT
	                            COUNT(
	                            DISTINCT
	                            T.legajo_T)
                            FROM 
	                            TURNOS T 
                            WHERE 
	                            T.cancelado_T = 0";
                    informe.M41TotalMedicosConTurnos = (int)cmd.ExecuteScalar();
                    
                    if (informe.M30TotalMedicosInactivos != 0)
                    {
                        informe.M40PorcentajeMedicosConTurnosSobreMedicosActivos =
                            (double)informe.M41TotalMedicosConTurnos / informe.M20TotalMedicosActivos;
                    }
                    else
                    {
                        informe.M40PorcentajeMedicosConTurnosSobreMedicosActivos = 0; // or double.NaN, or throw
                    }

                    cmd.CommandText =
                        @"SELECT 
                            E.nombre_E AS [Especialidad], 
                            COUNT(M.dni_M) AS [Cantidad] 
                        FROM 
                            MEDICOS [M] 
                        INNER JOIN          
                        ESPECIALIDADES [E] 
                        ON 
                            E.codEspecialidad_E = M.codEspecialidad_M 
                        WHERE  
	                        M.estado_M = 1
                        GROUP BY 
                            E.nombre_E;";
                    SqlDataReader data = cmd.ExecuteReader();
                    informe.M50TotalMedicosPorEspecialidad = new DataTable();
                    informe.M50TotalMedicosPorEspecialidad.Columns.Add("Especialidad", typeof(string));
                    informe.M50TotalMedicosPorEspecialidad.Columns.Add("Cantidad", typeof(int));
                    while (data.Read())
                    {
                        DataRow fila = informe.M50TotalMedicosPorEspecialidad.NewRow();
                        fila["Especialidad"] = data["Especialidad"];
                        fila["Cantidad"] = data["Cantidad"];
                        informe.M50TotalMedicosPorEspecialidad.Rows.Add(fila);
                    }
                    data.Close();
                    // H10MedicoConMayorAtencionSemanal
                    cmd.CommandText =
                        @"SELECT TOP(1) 
                            Legajo, 
                            Cantidad,
                            PERSONAS.*, 
                            MEDICOS.*
                        FROM(
                            SELECT
                                HORARIOS.legajo_H as Legajo,
                                Count(HORARIOS.disponible_h) as Cantidad
                            FROM 
		                        HORARIOS
                            WHERE 
		                        HORARIOS.disponible_h = 1
                            GROUP BY
		                        HORARIOS.legajo_H
                        ) AS C
                        INNER JOIN
	                        MEDICOS on MEDICOS.legajo_m = C.Legajo
                        INNER JOIN
	                        PERSONAS on PERSONAS.dni_P = MEDICOS.dni_M
                        WHERE
	                        MEDICOS.estado_M = 1
                        ORDER BY 
	                        Cantidad DESC";
                    Medico medico = new Medico();
                    data = cmd.ExecuteReader();
                    while (data.Read())
                    {
                        medico.HorasSemanales = Convert.ToInt32(data["Cantidad"]);
                        medico.Legajo = Convert.ToInt32(data["legajo_M"]);
                        medico.DNI = data["dni_P"].ToString();
                        medico.Nombre = data["nombre_P"].ToString();
                        medico.Apellido = data["apellido_P"].ToString();
                        medico.Sexo = data["sexo_P"].ToString()[0];
                        medico.Nacionalidad = data["nacionalidad_P"].ToString();
                        medico.FechaNac = Convert.ToDateTime(data["fechaNac_P"].ToString());
                        //medico.IdLocalidad = Convert.ToInt32(data["idLocalidad_P"]);
                        //medico.IdProvincia = Convert.ToInt32(data["idProvincia_P"]);
                        medico.Direccion = data["direccion_P"].ToString();
                        medico.Horario = data["horario_M"].ToString();
                        medico.Email = data["email_P"].ToString();
                        medico.Telefono = data["telefono_P"].ToString();
                        //medico.Provincia = data["nombre_PROV"].ToString();
                        //medico.Localidad = data["nombre_L"].ToString();
                        medico.Imagen = data["imagen_M"].ToString();
                        medico.CodEspecialidad = Convert.ToInt32(data["codEspecialidad_M"]);
                        //medico.Especialidad = data["nombre_E"].ToString();
                    }
                    data.Close();
                    informe.H10MedicoConMayorAtencionSemanal = medico;


                    cmd.CommandText = "SELECT COUNT(hora_H) FROM HORARIOS WHERE disponible_H = 1";
                    informe.H20TurnosSemanalesHabilitadosTotales = (int)cmd.ExecuteScalar();

                    cmd.CommandText = "SELECT COUNT(dni_PA) FROM PACIENTES";
                    informe.P10TotalPacientes = (int)cmd.ExecuteScalar();

                    cmd.CommandText = "SELECT COUNT(dni_PA) FROM PACIENTES WHERE estado_PA = 1";
                    informe.P20TotalPacientesActivos = (int)cmd.ExecuteScalar();


                    informe.P30TotalPacientesInactivos = informe.P10TotalPacientes - informe.P20TotalPacientesActivos;

                    cmd.CommandText =
                            @"SELECT COUNT(*) 
                                FROM (
                                    SELECT DATEDIFF(YEAR, P.fechaNac_P, GETDATE()) AS EDAD
                                    FROM PACIENTES 
                                    INNER JOIN PERSONAS P ON P.dni_P = PACIENTES.dni_PA
                                ) subconsulta
                            WHERE EDAD >= 65";
                    object result = cmd.ExecuteScalar();
                    informe.P40PacientesAdultosMayores = (result != null) ? Convert.ToInt32(result) : 0;

                    cmd.CommandText =
                    @"SELECT count(dni_P) as Cantidad
                        FROM (
                            SELECT datediff(year, P.fechaNac_P, getdate()) AS EDAD, P.dni_P FROM PACIENTES 
                            INNER JOIN PERSONAS P ON P.dni_P = PACIENTES.dni_PA
                            ) subconsulta
                        WHERE EDAD >= 18 AND EDAD < 65";
                    result = cmd.ExecuteScalar();
                    informe.P50PacientesAdultos = (result != null) ? Convert.ToInt32(result) : 0;

                    cmd.CommandText =
                        @"SELECT count(dni_P) as Cantidad
                        FROM (
                            SELECT datediff(year, P.fechaNac_P, getdate()) AS EDAD, P.dni_P FROM PACIENTES 
                            INNER JOIN PERSONAS P ON P.dni_P = PACIENTES.dni_PA
                            ) subconsulta
                        WHERE EDAD >= 13 AND EDAD < 18";
                    result = cmd.ExecuteScalar();
                    informe.P60PacientesJuveniles = (result != null) ? Convert.ToInt32(result) : 0;

                    cmd.CommandText =
                        @"SELECT count(dni_P) as Cantidad
                        FROM (
                            SELECT datediff(year, P.fechaNac_P, getdate()) AS EDAD, P.dni_P FROM PACIENTES 
                            INNER JOIN PERSONAS P ON P.dni_P = PACIENTES.dni_PA
                            ) subconsulta
                        WHERE EDAD >= 6 AND EDAD < 1";
                    result = cmd.ExecuteScalar();
                    informe.P70PacientesInfantiles = (result != null) ? Convert.ToInt32(result) : 0;

                    cmd.CommandText =
                        @"SELECT count(dni_P) as Cantidad
                        FROM (
                            SELECT datediff(year, P.fechaNac_P, getdate()) AS EDAD, P.dni_P FROM PACIENTES 
                            INNER JOIN PERSONAS P ON P.dni_P = PACIENTES.dni_PA
                            ) subconsulta
                        WHERE EDAD >= 3 AND EDAD < 6";
                    result = cmd.ExecuteScalar();
                    informe.P80PacientesPreescolares = (result != null) ? Convert.ToInt32(result) : 0;

                    cmd.CommandText =
                    @"SELECT count(dni_P) as Cantidad
                        FROM (
                            SELECT datediff(year, P.fechaNac_P, getdate()) AS EDAD, P.dni_P FROM PACIENTES 
                            INNER JOIN PERSONAS P ON P.dni_P = PACIENTES.dni_PA
                            ) subconsulta
                        WHERE EDAD >= 0 AND EDAD < 3";
                    result = cmd.ExecuteScalar();
                    informe.P90PacientesLactantes = (result != null) ? Convert.ToInt32(result) : 0;

                    cmd.CommandText = "SELECT COUNT(fecha_T) FROM TURNOS WHERE CANCELADO_T = 0";
                    informe.T10TotalTurnos = (int)cmd.ExecuteScalar();

                    cmd.CommandText = "SELECT COUNT(fecha_T) FROM TURNOS WHERE CANCELADO_T = 0 AND fecha_T >= getdate()";
                    informe.T20TotalTurnosFuturos = (int)cmd.ExecuteScalar();

                    cmd.CommandText = "SELECT COUNT(fecha_T) FROM TURNOS WHERE CANCELADO_T = 0 AND fecha_T BETWEEN getdate() AND dateadd(day,7,getdate())";
                    informe.T30TotalTurnosProximaSemana = (int)cmd.ExecuteScalar();

                    cmd.CommandText = "SELECT COUNT(fecha_T) FROM TURNOS WHERE CANCELADO_T = 0 AND fecha_T < getdate()";
                    informe.T40TotalTurnosPasados = (int)cmd.ExecuteScalar();

                    cmd.CommandText = "SELECT COUNT(fecha_T) FROM TURNOS WHERE CANCELADO_T = 0 AND asistencia_T = 0 AND fecha_T < getdate()";
                    informe.T50TotalTurnosAusentes = (int)cmd.ExecuteScalar();

                    informe.T60PorcentajeTurnosAusentesSobreTurnosPasados = (double)informe.T50TotalTurnosAusentes / informe.T40TotalTurnosPasados;

                    cmd.CommandText =
                        @"SELECT  Legajo, nombre_P, apellido_P, Cantidad
                            FROM
                             (SELECT 
                              legajo_t AS [Legajo], COUNT(fecha_T) AS [Cantidad] 
                             FROM 
                              TURNOS 
                             WHERE 
                              cancelado_T = 0 
                              AND asistencia_T = 0
                              AND fecha_T < getdate()
                            GROUP BY 
                             legajo_T 
                            ) AS SUBCONSULTA
                            INNER JOIN MEDICOS M ON M.legajo_M = SUBCONSULTA.Legajo
                            INNER JOIN ESPECIALIDADES E ON E.codEspecialidad_E = M.codEspecialidad_M
                            INNER JOIN PERSONAS P ON P.dni_P = M.dni_M";
                    data = cmd.ExecuteReader();
                    informe.T70TotalTurnosAusentesPorMedico = new DataTable();
                    informe.T70TotalTurnosAusentesPorMedico.Columns.Add("Legajo", typeof(int));
                    informe.T70TotalTurnosAusentesPorMedico.Columns.Add("Nombre", typeof(string));
                    informe.T70TotalTurnosAusentesPorMedico.Columns.Add("Apellido", typeof(string));
                    informe.T70TotalTurnosAusentesPorMedico.Columns.Add("Cantidad", typeof(int));
                    while (data.Read())
                    {
                        {
                            DataRow fila = informe.T70TotalTurnosAusentesPorMedico.NewRow();
                            fila["Legajo"] = data["Legajo"];
                            fila["Nombre"] = data["nombre_P"];
                            fila["Apellido"] = data["apellido_P"];
                            fila["Cantidad"] = data["Cantidad"];
                            informe.T70TotalTurnosAusentesPorMedico.Rows.Add(fila);
                        }
                    }
                    data.Close();
                    return informe;
                }


            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Medico : Persona
    {
        public int Legajo { get; set; }
        public int CodEspecialidad { get; set; }
        public string Horario { get; set; }
        public bool Estado { get; set; }
        public string Imagen { get; set; }
        
        // FUERA DE TABLA MEDICOS:
        public string Username { get; set; }
        public string Password { get; set; }
        public string Especialidad { get; set; }
        public string EmailNuevo { get; set; }
        public object Usuario { get; set; }
        public int HorasSemanales { get; set;}

        // Métodos:

        public override string ToString()
        {
            return
                $"DNI: {DNI}<br/>" +
                $"Nombre: {Nombre} {Apellido}<br/>" +
                $"Nacionalidad: {Nacionalidad}<br/>" +
                $"Provincia ID: {IdProvincia}<br/>" +
                $"Localidad ID: {IdLocalidad}<br/>" +
                $"Email: {Email}<br/>" +
                $"Legajo: {Legajo}<br/>" +
                $"CodEspecialidad: {CodEspecialidad}<br/>" +
                $"Horario: {Horario}<br/>" +
                $"Estado: {Estado}<br/>" +
                $"Imagen: {Imagen}<br/>" +
                $"Username: {Username}<br/>" +
                $"Password: {Password}<br/>" +
                $"EmailNuevo: {EmailNuevo}<br/>" +
                $"Usuario: {Usuario}<br/>";
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;

namespace Entidades
{
    public class Turno
    {
        public DateTime Fecha { get; set; }
        public string Legajo { get; set; }
        public bool Asistencia { get; set; }
        public string DNI { get; set; }
        public string Observacion { get; set; }
        public bool Cancelado { get; set; }

        public Turno() { }
        public Turno (DateTime fecha, string legajo, string dni)
        {
            Fecha = fecha;
            Legajo = legajo;
            DNI = dni;
        }
        public override string ToString()
        {
            return
                $"Fecha: {Fecha}<br/>" +
                $"Legajo: {Legajo}<br/>" +
                $"Asistencia: {Asistencia}<br/>" +
                $"DNI: {DNI}<br/>" +
                $"Observación: {Observacion}<br/>" +
                $"Cancelado: {Cancelado}<br/>";
        }
    }
}

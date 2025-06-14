using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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


    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Medico : Persona
    {
        public string Legajo { get; set; }
        public int CodEspecialidad { get; set; }
        public string Horario { get; set; }
        public bool Estado { get; set; }
        public string Imagen { get; set; }
        
        // FUERA DE TABLA MEDICOS:
        public string Username { get; set; }
        public string Password { get; set; }
        public string Especialidad { get; set; }

    }
}

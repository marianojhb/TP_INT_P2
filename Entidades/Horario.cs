using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Horario
    {
        public int Legajo { get; set;}
        public int Codigo { get; set;}
        public int Dia { get; set;}
        public int Hora { get; set;}
        public bool Disponible { get; set;}
    }
}

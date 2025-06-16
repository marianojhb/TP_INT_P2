using System;
using System.Collections.Generic;
using System.Diagnostics.SymbolStore;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Paciente : Persona
    {
        public string DNI { get; set; }
        public bool Estado { get; set; }
        public Paciente (string dni)
        {
            this.DNI = dni;
        }
        
        public Paciente() { }
        public Paciente(string dni, string nombre, string apellido, char sexo, string nacionalidad, DateTime fechaNac, string direccion, int idLocalidad, int idProvincia, string telefono, string email)
        {
            this.DNI = dni;
            this.Nombre = nombre;
            this.Apellido = apellido;
            this.Sexo = sexo;
            this.Nacionalidad = nacionalidad;
            this.FechaNac = fechaNac;
            this.Direccion = direccion;
            this.IdLocalidad = idLocalidad;
            this.IdProvincia = idProvincia;
            this.Telefono = telefono;
            this.Email = email;
        }
        public Paciente(string dni, string nombre, string apellido, char sexo, string nacionalidad, DateTime fechaNac, string direccion, int idLocalidad, int idProvincia, string telefono, string email, bool estado)
        {
            this.DNI = dni;
            this.Nombre = nombre;
            this.Apellido = apellido;
            this.Sexo = sexo;
            this.Nacionalidad = nacionalidad;
            this.FechaNac = FechaNac;
            this.Direccion = direccion;
            this.IdLocalidad = idLocalidad;
            this.IdProvincia = idProvincia;
            this.Telefono = telefono;
            this.Email = email;
            this.Estado = estado;
        }
    }
}

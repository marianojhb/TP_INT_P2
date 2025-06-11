using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuario
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string Tipo  { get; set; }
        public Usuario() {}
        public Usuario(string username, string password)
        {
            Username = username;
            Password = password;
        }
        public Usuario(string username, string password, string email, string tipo)
        {
            Username = username;
            Password = password;
            Email = email;
            Tipo = tipo;
        }
    }
}

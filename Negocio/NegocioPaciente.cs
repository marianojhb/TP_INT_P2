﻿using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioPaciente
    {
        DaoPaciente daoPaciente = new DaoPaciente();

        public int AgregarPaciente(Paciente paciente)
        {
            return daoPaciente.AgregarPaciente(paciente);
        }

        public DataTable GetPacientes()
        {
            return daoPaciente.GetPacientes();
        }

        public void EliminarPaciente(Paciente paciente)
        {
            daoPaciente.EliminarPaciente(paciente);
        }
        public void ActualizarPaciente(Paciente paciente)
        {
            daoPaciente.ActualizarPaciente(paciente);
        }
        public DataTable GetPaciente(string dni)
        {
            return daoPaciente.GetPaciente(dni);
        }
        public bool ExisteDNI(string dni)
        {
            return daoPaciente.ExisteDNI(dni);
        }
        public DataTable BuscarPorPalabraClave(string palabraClave)
        {
            return daoPaciente.BuscarPorPalabraClave(palabraClave);
        }
    }
}
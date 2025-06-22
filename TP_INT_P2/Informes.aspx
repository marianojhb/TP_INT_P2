<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Informes.aspx.cs" Inherits="TP_INT_P2.Informes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .progress {
      height: 30px;
    }
    .progress-bar {
      transition: width 1.5s ease-in-out;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Informes</h2>

    <div class="row">
        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Pacientes Totales</h4>
            <p class="fs-5">524 pacientes</p>
        </div>
        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Pacientes con Turnos</h4>
            <p class="fs-5">43 pacientes con turno</p>
        </div>
    </div>

    <div class="row">
        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Medicos Totales</h4>
                <p class="fs-5">30 médicos totales</p>
        </div>
        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Medicos con Turnos</h4>
            <p class="fs-5">30 médicos con turnos</p>
        </div>
    </div>

    <div class="row">
        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Turnos Activos</h4>
            <p class="fs-5">45 turnos activos próxima semana</p>
        </div>
        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Turnos Activos</h4>
            <p class="fs-5">120 turnos activo</p>            
        </div>
        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Turnos Vencidos</h4>
            <p class="fs-5">fs-7</p>
        </div>
        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Asistencia</h4>
            <div class="progress mt-3">
                <div class="progress-bar bg-info progress-bar-animated" role="progressbar" style="width: 0%;">0%</div>
            </div>
        </div>
    </div>
    
<script>
    window.addEventListener("load", function () {
        const bar = document.querySelector(".progress-bar");
        setTimeout(() => {
        const porcentaje = 90; // poné el valor que quieras acá
        bar.style.width = porcentaje + "%";
        bar.innerText = porcentaje + "%";
        }, 300); // pequeño retraso para mejor efecto
    });
</script>
</asp:Content>

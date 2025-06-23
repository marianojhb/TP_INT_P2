<%@ Page Title="Inicio Médicos | TUP" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InicioMedico.aspx.cs" Inherits="TP_INT_P2.InicioMedico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .imagenMedico {
        border-radius: 50% !important;
        width: 150px !important;
        height: 150px !important;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container py-5">
    <!-- Encabezado con imagen -->
    <div class="row align-items-center mb-5">
        <div class="col-md-6 text-center text-md-start">
            <h1 class="display-5 fw-bold text-primary">¡Bienvenido, <asp:Label ID="lblName" runat="server"></asp:Label></h1>
            <p class="lead">Gestioná tus pacientes, horarios y tareas de manera ágil desde tu panel personal.</p>
        </div>
        <div class="col-md-6 text-center">
            <asp:Image ID="imgMedico" runat="server" AlternateText="Imagen de médico" CssClass="img-fluid imagenMedico" style="max-height: 250px;"/>
        </div>
    </div>

    <!-- Panel de acciones -->
    <div class="row text-center g-4">
        <div class="col-md-6">
            <div class="card shadow border-0 h-100">
                <div class="card-body">
                    <i class="fa-solid fa-user-plus fa-3x text-primary mb-3"></i>
                    <h5 class="card-title">Agregar Paciente</h5>
                    <p class="card-text">Registrá nuevos pacientes con sus datos clínicos y personales.</p>
                    <asp:Button ID="btnAgregarPaciente" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="btnAgregarPaciente_Click" />
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card shadow border-0 h-100">
                <div class="card-body">
                    <i class="fa-solid fa-calendar-check fa-3x text-success mb-3"></i>
                    <h5 class="card-title">Mis Horarios</h5>
                    <p class="card-text">Consultá y modificá tus horarios disponibles para atención.</p>
                    <asp:Button ID="btnMisHorarios" runat="server" Text="Ver Horarios" CssClass="btn btn-success" OnClick="btnMisHorarios_Click" />
                </div>
            </div>
        </div>
    </div>
</div>

</asp:Content>

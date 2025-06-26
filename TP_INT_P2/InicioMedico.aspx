<%@ Page Title="Inicio Médicos | TUP" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InicioMedico.aspx.cs" Inherits="TP_INT_P2.InicioMedico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .imagen-container {
            position: relative;
            width: 150px;
            height: 150px;
        }

        .imagenMedico {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            display: block;
            transition: opacity 0.3s ease;
        }

        .cartelEditar {
            position: absolute;
            top: 0;
            left: 0;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background-color: rgba(0, 0, 0, 0.5);
            text-align: center;
            text-decoration: none;
            opacity: 0;
            transition: opacity 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white !important;
            font-weight: bold;
            font-size: 16px;
        }

        .imagen-container:hover .cartelEditar {
            opacity: 1;
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
            <div class="imagen-container mx-auto" style="position: relative; width: 150px; height: 150px;">
                <asp:Image ID="imgMedico" runat="server" AlternateText="Imagen de médico" CssClass="img-fluid imagenMedico"/>
                <div class="cartelEditar">
                    <div class="cartelEditarContenido">
                        <asp:HyperLink ID="hlMiPerfil" runat="server" NavigateUrl="~/MiPerfil.aspx" CssClass="cartelEditar">
                            <span class="cartelEditarContenido">Editar</span>
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
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
        <div class="col-md-6">
            <div class="card shadow border-0 h-100">
                <div class="card-body">
                    <i class="fa-solid fa-calendar-days fa-3x text-warning mb-3"></i>
                    <h5 class="card-title">Ver Turnos</h5>
                    <p class="card-text">Visualizá los turnos asignados y gestioná tu agenda de atención.</p>
                    <asp:Button ID="btnVerTurnos" runat="server" Text="Ver Turnos" CssClass="btn btn-warning" OnClick="btnVerTurnos_Click" />
                </div>
            </div>
        </div>
    </div>
</div>

</asp:Content>

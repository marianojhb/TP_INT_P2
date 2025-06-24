<%@ Page Title="Inicio Administrador" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InicioAdministrador.aspx.cs" Inherits="TP_INT_P2.InicioAdministrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-card i {
            font-size: 2rem;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-5">
        <h2 class="text-center mb-5"><i class="fa-solid fa-user-shield"></i> Panel de Administración</h2>

        <div class="row justify-content-center g-4">

            <div class="col-md-4">
                <div class="card admin-card shadow text-center p-4">
                    <i class="fa-solid fa-user-doctor text-primary mb-3"></i>
                    <h5 class="card-title">Agregar Médico</h5>
                    <asp:Button ID="btnAgregarMedico" runat="server" Text="Ingresar" OnClick="btnAgregarMedico_Click" CssClass="btn btn-outline-primary mt-2" />
                </div>
            </div>

            <div class="col-md-4">
                <div class="card admin-card shadow text-center p-4">
                    <i class="fa-solid fa-calendar-plus text-success mb-3"></i>
                    <h5 class="card-title">Agregar Turno</h5>
                    <asp:Button ID="btnAgregarTurno" runat="server" Text="Ingresar" OnClick="btnAgregarTurnos_Click" CssClass="btn btn-outline-success mt-2" />
                </div>
            </div>

            <div class="col-md-4">
                <div class="card admin-card shadow text-center p-4">
                    <i class="fa-solid fa-user-injured text-danger mb-3"></i>
                    <h5 class="card-title">Agregar Paciente</h5>
                    <asp:Button ID="btnAgregarPaciente" runat="server" Text="Ingresar" OnClick="btnAgregarPaciente_Click" CssClass="btn btn-outline-danger mt-2" />
                </div>
            </div>

        </div>
    </div>
</asp:Content>

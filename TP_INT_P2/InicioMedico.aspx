<%@ Page Title="Inicio Médicos | TUP" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InicioMedico.aspx.cs" Inherits="TP_INT_P2.InicioMedico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Inicio</h2>
    <div style ="min-width: 576px; margin: 50px auto">
        <div class="mx-auto p-3 text-center">
            <div class="mt-4">

    <asp:Button ID="btnAgregarPaciente" runat="server" Text="Agregar Paciente" OnClick="btnAgregarPaciente_Click" CssClass="btn btn-primary"/>
                      </div>
            <div class="mx-auto p-3 text-center">
    <asp:Button ID="btnMisHorarios" runat="server" Text="Mis Horarios" OnClick="btnMisHorarios_Click" CssClass="btn btn-primary"/>
        </div>
            </div>
</asp:Content>

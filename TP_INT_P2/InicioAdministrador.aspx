<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InicioAdministrador.aspx.cs" Inherits="TP_INT_P2.InicioAdministrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Inicio</h2>
    <div style ="min-width: 576px; margin: 50px auto">
        <div class="mx-auto p-3 text-center">
            <div class="mt-4">
                <asp:Button ID="btnAgregarMedico" runat="server" Text="Agregar Médico" OnClick="btnAgregarMedico_Click" CssClass="btn btn-primary" />
            </div>
            <div class="mt-4">
                <asp:Button ID="btnAgregarTurno" runat="server" Text="Agregar Turnos" OnClick="btnAgregarTurnos_Click" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
</asp:Content>

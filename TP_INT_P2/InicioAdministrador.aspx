<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InicioAdministrador.aspx.cs" Inherits="TP_INT_P2.InicioAdministrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Pagina de usuario administrador</h2>
    <asp:Button ID="btnAgregarMedico" runat="server" Text="Agregar Médico" OnClick="btnAgregarMedico_Click" />
    <asp:Button ID="btnAgregarTurno" runat="server" Text="Agregar Turnos" OnClick="btnAgregarTurnos_Click" />
</asp:Content>

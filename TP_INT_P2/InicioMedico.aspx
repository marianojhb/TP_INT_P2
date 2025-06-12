<%@ Page Title="Inicio Médicos | TUP" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InicioMedico.aspx.cs" Inherits="TP_INT_P2.InicioMedico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Home Médicos</h2>
    <asp:Button ID="btnAgregarPaciente" runat="server" Text="Agregar Paciente" OnClick="btnAgregarPaciente_Click" />
</asp:Content>

<%@ Page Title="Inicio Médicos | TUP" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InicioMedico.aspx.cs" Inherits="TP_INT_P2.InicioMedico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style ="min-width: 576px; margin: 50px auto; max-width: 1100px">
    <h2>Home Médicos</h2>
    <asp:Button ID="btnAgregarPaciente" runat="server" Text="Agregar Paciente" OnClick="btnAgregarPaciente_Click" CssClass="btn btn-primary"/>
        </div>
</asp:Content>

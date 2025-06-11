<%@ Page Title="Login | Clínica TUP" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TP_INT_P2.Login" %>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
        <h2 style="text-align:center;">Bienvenido a la Clínica TUP - Sistema de Gestión</h2>

        <div class="container d-flex justify-content-center align-items-center" style="height: 70vh;">
            <div class="card shadow p-4" style="width: 100%; max-width: 400px;">
                <h3 class="text-center mb-4">Iniciar Sesión</h3>

                <div class="mb-3">
                    <label for="txtUsuario" class="form-label">Usuario</label>
                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label for="txtPassword" class="form-label">Contraseña</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
                </div>

                <asp:Button ID="btnLogin" runat="server" Text="Ingresar" CssClass="btn btn-primary w-100" OnClick="btnLogin_Click" />

                <asp:Label ID="lblError" runat="server" CssClass="text-danger mt-3 d-block" Visible="false" />
            </div>
        </div>
</asp:Content>

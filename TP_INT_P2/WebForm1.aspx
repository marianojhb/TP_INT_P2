<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TP_INT_P2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">



<!-- Navbar Bootstrap -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top">
  <div class="container-fluid">

    <a class="navbar-brand" href="#">
      <img src="/imagenes/site/logo-utn-siglas.png" alt="Alternate Text" width="100px" style="filter: invert(1);" />
      Clínica TUP
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContenido">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarContenido">
      
      <!-- Menú central -->
      <ul class="navbar-nav mb-2 mb-lg-0">
        <li class="nav-item mx-3">
          <a class='<%: "nav-link fs-4 " + (Request.Url.AbsolutePath.Contains("Inicio") ? "active" : "") %>' href="Inicio.aspx">Inicio</a>
        </li>
        <li class='<%: "nav-item mx-3 " + (Request.Url.AbsolutePath.Contains("ListadoMedicos") ? "active" : "") %>'>
          <a class='<%: "nav-link fs-4 " + (Request.Url.AbsolutePath.Contains("ListadoMedicos") ? "active" : "") %>' href="ListadoMedicos.aspx">Médicos</a>
        </li>
        <li class='<%: "nav-item mx-3 " + (Request.Url.AbsolutePath.Contains("ListadoPacientes") ? "active" : "") %>'>
          <a class='<%: "nav-link fs-4 " + (Request.Url.AbsolutePath.Contains("ListadoPacientes") ? "active" : "") %>' href="ListadoPacientes.aspx">Pacientes</a>
        </li>
        <li class='<%: "nav-item mx-3 " + (Request.Url.AbsolutePath.Contains("ListadoTurnos") ? "active" : "") %>'>
          <a class='<%: "nav-link fs-4 " + (Request.Url.AbsolutePath.Contains("ListadoTurnos") ? "active" : "") %>' href="ListadoTurnos.aspx">Turnos</a>
        </li>
        <li class='<%: "nav-item mx-3 " + (Request.Url.AbsolutePath.Contains("Informes") ? "active" : "") %>'>
          <a class='<%: "nav-link fs-4 " + (Request.Url.AbsolutePath.Contains("Informes") ? "active" : "") %>' href="Informes.aspx">Informes</a>
        </li>
      </ul>

      <!-- Menú de usuario alineado a la derecha -->
      <ul class="navbar-nav ms-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle fs-5" href="#" data-bs-toggle="dropdown" role="button" aria-expanded="false">
            <asp:Label ID="lblFullName" runat="server" Text="Invitado" />
          </a>
          <ul class="dropdown-menu dropdown-menu-end bg-primary text-white">
            <li>
              <asp:LinkButton ID="cambiarTema" runat="server" CssClass="dropdown-item text-white" OnClick="cambiarTema_Click">
                <i class="fa-solid fa-circle-half-stroke"></i> Cambiar Tema
              </asp:LinkButton>
            </li>
            <li><a class="dropdown-item text-white" href="#">Another action</a></li>
            <li><a class="dropdown-item text-white" href="#">Something else here</a></li>
            <li><hr class="dropdown-divider bg-white"></li>
            <li>
              <asp:Label ID="lblUsuario" runat="server" Text="Usuario: Invitado" CssClass="dropdown-item text-white" />
            </li>
            <li>
              <asp:LinkButton ID="cerrarSesion" runat="server" Visible="False" CssClass="dropdown-item text-white" OnClick="cerrarSesion_Click">Cerrar Sesión</asp:LinkButton>
            </li>
          </ul>
        </li>
      </ul>

    </div>
  </div>
</nav>











</asp:Content>

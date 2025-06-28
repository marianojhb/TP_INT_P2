<%@ Page Title="Login | Clínica TUP" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TP_INT_P2.Login" %>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <style>
        .imagenPerfil {
            border-radius: 50% !important;
            width: 150px !important;
            height: 150px !important;
            display: block;
            object-fit: cover; /* opcional: recorta la imagen en el círculo */
        }

        .img-hover img,
        .img-hover .imagenPerfil {
            position: absolute;
            top: 0;
            left: 0;
        }

        .img-hover {
          position: relative;
          width: 150px;
          height: 150px;
          margin: 0 auto;
        }

        .img-hover img {
          position: absolute;
          top: 0;
          left: 0;
          transition: opacity 0.3s;
          width: 150px !important;
          height: 150px !important;
        }

        .img-hover .hover {
          opacity: 0;
        }

        .img-hover:hover .hover {
          opacity: 1;
        }

        .animate__animated.animate__flipInX,
        .animate__animated.animate__fadeInRight 
        {
          --animate-duration: 1.5s;
          animation-delay: 0.5s !important;
        }

         .animate__delay-5s 
         {
        --animation-delay: 5s !important;
         }
        .animate__delay-10s 
        {
        --animation-delay: 10s !important;
        }
        
        .animate__infinite-slow {
              /* duracíon de 1s */
              --animate-duration: 1s;  
              /* aquí sí definís la propiedad real */
              animation-iteration-count: infinite !important;
        }

        @keyframes shakePause {
            /* 0–9.09% equivale a 1 s de los 11 s totales */
            60%   { transform: translateX(0); }
            61%   { transform: translateX(-10px); }
            62%   { transform: translateX(10px); }
            63%   { transform: translateX(-10px); }
            64%   { transform: translateX(10px); }
            65%{ transform: translateX(0); }
            /* 9.09–100% → 10 s de pausa (mantiene transform: none) */
            100% { transform: translateX(0); }
        }

        .btn-ingreso {
            animation: shakePause 7s infinite ease;
            /* 1 s “activo” + 10 s “pausado” por iteración */
        }

    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
        <h1 style="text-align:center;" class="animate__animated animate__flipInX">
                            
            Bienvenido a la Clínica TUP - Sistema de Gestión

        </h1>

        <div class="container d-flex justify-content-center align-items-center" style="height: 70vh;">
            <div class="card shadow p-4" style="width: 100%; max-width: 400px;">
                <div class="mb-3 text-center">
                   
                    <div class="img-hover">
                        <asp:Image ID="imgPerfilUrl" runat="server" class="imagenPerfil"/>
                        <img class="hover imagenPerfil" src="imagenes/perfiles/snl-will-ferrell.gif" />
                    </div>

                    </div>
                <h3 class="text-center mb-4">Iniciar Sesión</h3>

                <div class="mb-3">
                    <label for="txtUsername" class="form-label animate__animated animate__fadeInRight">Usuario</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label for="txtPassword" class="form-label animate__animated animate__animated animate__fadeInRight">Contraseña</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
                </div>

                <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary w-100
                    btn-ingreso
                    " OnClick="btnLogin_Click" 
                     Text="Ingresar" />

                <asp:Label ID="lblError" runat="server" CssClass="text-danger mt-3 d-block" Visible="false" />
            </div>
        </div>
</asp:Content>

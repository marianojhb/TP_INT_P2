<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarTurno.aspx.cs" Inherits="TP_INT_P2.AgregarTurno" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .dropdown-min {
            min-width: 50px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .anchopanel {
            min-width: 576px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Asignar un nuevo turno</h2>
    <div class="container d-flex justify-content-center align-items-center" >
        <asp:Panel ID="Panel1" runat="server" CssClass="mx-auto p-4 shadow rounded anchopanel">


            <div class="container mt-4">
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="ddlEspecialidades" class="form-label me-2 mb-0">Especialidad:</label>
                    </div>
                    <div class="col-md-6">
                        <asp:DropDownList ID="ddlEspecialidades" runat="server"
                            CssClass="form-select dropdown-min" AutoPostBack="True"
                            OnSelectedIndexChanged="ddlEspecialidades_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="ddlMedicos" class="form-label me-2 mb-0">Profesional:</label>
                    </div>
                    <div class="col-md-6">
                        <asp:DropDownList ID="ddlMedicos" runat="server" CssClass="form-select dropdown-min">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="ddlDias" class="form-label me-2 mb-0">Día:</label>
                    </div>
                    <div class="col-md-6">
                        <asp:DropDownList ID="ddlDias" runat="server" CssClass="form-select dropdown-min">

                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="ddlHorarios" class="form-label me-2 mb-0">Horario:</label>
                    </div>
                    <div class="col-md-6">
                        <asp:DropDownList ID="ddlHorarios" runat="server" CssClass="form-select dropdown-min">
                            <asp:ListItem Value="10">10:00</asp:ListItem>
                            <asp:ListItem Value="11">11:00</asp:ListItem>
                            <asp:ListItem Value="12">12:00</asp:ListItem>
                            <asp:ListItem Value="13">13:00</asp:ListItem>
                            <asp:ListItem Value="14">14:00</asp:ListItem>
                            <asp:ListItem Value="15">15:00</asp:ListItem>
                            <asp:ListItem Value="16">16:00</asp:ListItem>
                            <asp:ListItem Value="17">17:00</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>


            <!-- Separador visual para el buscador u otro contenido -->
            <div class="mt-5">
                <!-- Aquí va el buscador o lo que necesites abajo -->
                <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" Placeholder="Buscar paciente..."></asp:TextBox>
                <p style="text-align: right;">
                    <asp:Button ID="btnBuscarPaciente" runat="server" Text="Buscar" CssClass="btn btn-primary" />
                </p>
            </div>

            <div>
                <div style="border: 2px solid grey; width: 100%; height: 400px">

                    <asp:GridView ID="gvPaciente" runat="server"></asp:GridView>
                </div>
                <p style="text-align: right;">
                    <asp:Button ID="btnAsignarTurno" runat="server" Text="Asignar Turno" CssClass="btn btn-primary" />
                </p>
            </div>

        </asp:Panel>

    </div>

</asp:Content>

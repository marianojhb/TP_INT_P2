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

    <h2 class="w-75 mx-auto">Asignar un nuevo turno</h2>
    <div class="container d-flex justify-content-center align-items-center" >
        <asp:Panel ID="Panel1" runat="server" CssClass="mx-auto p-4 shadow rounded anchopanel">


            <div class="container mt-4">
                <div class="row mb-3">
                    <div class="col-md-4">
                        <label for="ddlEspecialidades" class="form-label me-2 mb-0">Especialidad:</label>
                    </div>
                    <div class="col-md-8">
                        <asp:DropDownList ID="ddlEspecialidades" runat="server"
                            CssClass="form-select dropdown-min" AutoPostBack="True"
                            OnSelectedIndexChanged="ddlEspecialidades_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row mb-4">
                    <div class="col-md-4">
                        <label for="ddlMedicos" class="form-label me-2 mb-0">Profesional:</label>
                    </div>
                    <div class="col-md-8">
                        <asp:DropDownList ID="ddlMedicos" runat="server" CssClass="form-select dropdown-min"  OnSelectedIndexChanged="ddlMedicos_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-4">
                        <label for="ddlFechas" class="form-label me-2 mb-0">Fecha:</label>
                    </div>
                    <div class="col-md-8">
                        <asp:DropDownList ID="ddlFechas" runat="server" CssClass="form-select dropdown-min" AutoPostBack="True" OnSelectedIndexChanged="ddlFechas_SelectedIndexChanged">

                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-4">
                        <label for="ddlHoras" class="form-label me-2 mb-0">Hora:</label>
                    </div>
                    <div class="col-md-8">
                        <asp:DropDownList ID="ddlHoras" runat="server" CssClass="form-select dropdown-min" OnSelectedIndexChanged="ddlHoras_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>


            <!-- Separador visual para el buscador u otro contenido -->
            <div class="mt-5">
                <!-- Aquí va el buscador o lo que necesites abajo -->
                <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" Placeholder="Buscar paciente por DNI ..."></asp:TextBox>
                <p style="text-align: right;">
                    <asp:Button ID="btnBuscarPaciente" runat="server" Text="Buscar" CssClass="btn btn-primary mt-2" OnClick="btnBuscarPaciente_Click" />
                </p>
            </div>

            <div>
                <div style="border: width: 100%">

                    <asp:GridView ID="gvPaciente" runat="server" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateSelectButton="True" PageSize="5" CssClass="w-100 table table-hover table-bordered" OnPageIndexChanging="gvPaciente_PageIndexChanging" OnSelectedIndexChanging="gvPaciente_SelectedIndexChanging" OnRowDataBound="gvPaciente_RowDataBound" OnSelectedIndexChanged="gvPaciente_SelectedIndexChanged">
                        
                        <Columns>
                            <asp:TemplateField HeaderText="DNI">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_DNI" runat="server" Text='<%# Bind("dni_P") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nombre">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_Nombre" runat="server" Text='<%# Bind("nombre_P") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Apellido">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_Apellido" runat="server" Text='<%# Bind("apellido_P") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:Label ID="Label1" runat="server" Text="Sin datos."></asp:Label>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
                <p style="text-align: right;">
                    <asp:Button ID="btnAsignarTurno" runat="server" Text="Asignar Turno" CssClass="btn btn-primary mt-2" OnClick="btnAsignarTurno_Click" />
                </p>
            </div>

        </asp:Panel>




    </div>
    <!-- Toast de Exito -->
    <asp:Panel ID="pnlExito" runat="server" Visible="false">
        <div class="toast-container position-fixed bottom-0 end-0 p-3" style="z-index: 1080;">
            <div class="toast align-items-center text-bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="d-flex">
                    <div class="toast-body">
                        <strong>¡Éxito!</strong> El registro se guardó correctamente.
                    </div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Cerrar"></button>
                </div>
            </div>
        </div>
    </asp:Panel>

    <!-- Toast de Error -->
    <asp:Panel ID="pnlError" runat="server" Visible="false">
        <div class="toast-container position-fixed bottom-0 end-0 p-3" style="z-index: 1080;">
            <div class="toast align-items-center text-bg-danger border-0" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="d-flex">
                    <div class="toast-body">
                        <strong>¡Error!</strong> Ocurrió un problema al guardar el registro.
                    </div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Cerrar"></button>
                </div>
            </div>
        </div>
    </asp:Panel>

<%-- Script para ocultar el mensaje de exito de la carga despues de 3 segundos --%>
<script type="text/javascript">
    function ocultarPanel() {
        document.getElementById('<%= pnlExito.ClientID %>').style.display = 'none';
    }
</script>

    <asp:Label ID="lblFecha" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:Label ID="lblHora" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:Label ID="lblLegajo" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:Label ID="lblDNI" runat="server" Text="Label" Visible="false"></asp:Label>

</asp:Content>

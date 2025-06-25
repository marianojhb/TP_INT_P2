<%@ Page Title="Agregar Turno | Clínica TUP" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarTurno.aspx.cs" Inherits="TP_INT_P2.AgregarTurno" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .dropdown-min {
            min-width: 50px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .anchopanel {
            max-width: 700px;
            width: 100%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container py-5">
        <h2 class="text-center mb-4">Asignar un nuevo turno</h2>

        <asp:Panel ID="Panel1" runat="server" CssClass="mx-auto p-4 shadow rounded anchopanel">

            <div class="mb-4">
                <label for="ddlEspecialidades" class="form-label">Especialidad:</label>
                <asp:DropDownList ID="ddlEspecialidades" runat="server" CssClass="form-select dropdown-min" AutoPostBack="True" OnSelectedIndexChanged="ddlEspecialidades_SelectedIndexChanged"></asp:DropDownList>
            </div>

            <div class="mb-4">
                <label for="ddlMedicos" class="form-label">Profesional:</label>
                <asp:DropDownList ID="ddlMedicos" runat="server" CssClass="form-select dropdown-min" AutoPostBack="True" OnSelectedIndexChanged="ddlMedicos_SelectedIndexChanged"></asp:DropDownList>
            </div>

            <div class="mb-4">
                <label for="ddlFechas" class="form-label">Fecha:</label>
                <asp:DropDownList ID="ddlFechas" runat="server" CssClass="form-select dropdown-min" AutoPostBack="True" OnSelectedIndexChanged="ddlFechas_SelectedIndexChanged"></asp:DropDownList>
            </div>

            <div class="mb-4">
                <label for="ddlHoras" class="form-label">Hora:</label>
                <asp:DropDownList ID="ddlHoras" runat="server" CssClass="form-select dropdown-min" OnSelectedIndexChanged="ddlHoras_SelectedIndexChanged"></asp:DropDownList>
            </div>

            <hr />

            <div class="mb-3">
                <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" Placeholder="Buscar paciente por DNI ..."></asp:TextBox>
                <div class="d-flex justify-content-end mt-2">
                    <asp:Button ID="btnBuscarPaciente" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscarPaciente_Click" />
                </div>
            </div>

            <asp:GridView ID="gvPaciente" runat="server" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateSelectButton="True" PageSize="5" CssClass="table table-hover table-bordered" OnPageIndexChanging="gvPaciente_PageIndexChanging" OnSelectedIndexChanging="gvPaciente_SelectedIndexChanging" OnRowDataBound="gvPaciente_RowDataBound" OnSelectedIndexChanged="gvPaciente_SelectedIndexChanged">
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

            <div class="d-flex justify-content-end mt-3">
                <asp:Button ID="btnAsignarTurno" runat="server" Text="Asignar Turno" CssClass="btn btn-success" OnClick="btnAsignarTurno_Click" />
            </div>

        </asp:Panel>

    </div>

    <!-- Toast de Éxito -->
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

    <asp:Label ID="lblFecha" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:Label ID="lblHora" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:Label ID="lblLegajo" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:Label ID="lblDNI" runat="server" Text="Label" Visible="false"></asp:Label>

</asp:Content>

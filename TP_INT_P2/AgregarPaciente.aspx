<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarPaciente.aspx.cs" Inherits="TP_INT_P2.AgregarPaciente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .form-check-input {
        border: none !important;
        box-shadow: none;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container py-5">
    <!-- Título -->
    <div class="text-center mb-4">
        <i class="fa-solid fa-user-plus fa-3x text-primary mb-2"></i>
        <h2 class="fw-bold">Agregar Paciente</h2>
        <p class="text-muted">Completá el formulario con los datos del paciente.</p>
    </div>

    <!-- Formulario -->
    <div class="card shadow mx-auto" style="max-width: 800px;">
        <div class="card-body p-4">

            <!-- DNI -->
            <div class="row mb-3 align-items-center">
                <label for="txtDni" class="col-sm-3 col-form-label">DNI</label>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtDni" runat="server" CssClass="form-control" placeholder="DNI" />
                </div>
                <div class="col-sm-2">
                    <asp:Button ID="btnChequearDNI" runat="server" Text="Validar" CssClass="btn btn-outline-secondary btn-sm" OnClick="btnChequearDNI_Click" CausesValidation="False" />
                </div>
                <div class="col-sm-4">
                    <asp:Label ID="lblChequearDNI" runat="server" ForeColor="Red" />
                    <asp:Label ID="lblChequearDNIValido" runat="server" ForeColor="Green" />
                    <small class="text-muted d-block"><asp:Label ID="lblChequearDNIHint" runat="server" /></small>
                </div>
            </div>

            <!-- Nombre y Apellido -->
            <div class="row mb-3">
                <label class="col-sm-3 col-form-label">Nombre</label>
                <div class="col-sm-9">
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Nombre" />
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-3 col-form-label">Apellido</label>
                <div class="col-sm-9">
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeholder="Apellido" />
                </div>
            </div>

            <!-- Sexo -->
            <div class="row mb-3">
                <label class="col-sm-3 col-form-label">Sexo</label>
                <div class="col-sm-9">
                    <div class="form-check form-check-inline">
                        <asp:RadioButton ID="rbMasculino" runat="server" GroupName="Sexo" CssClass="form-check-input" value="M" />
                        <label class="form-check-label" for="<%= rbMasculino.ClientID %>">Masculino</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <asp:RadioButton ID="rbFemenino" runat="server" GroupName="Sexo" CssClass="form-check-input" value="F" />
                        <label class="form-check-label" for="<%= rbFemenino.ClientID %>">Femenino</label>
                    </div>
                </div>
            </div>

            <!-- Nacionalidad -->
            <div class="row mb-3">
                <label class="col-sm-3 col-form-label">Nacionalidad</label>
                <div class="col-sm-9">
                    <asp:TextBox ID="txtNacionalidad" runat="server" CssClass="form-control" placeholder="Nacionalidad" />
                </div>
            </div>

            <!-- Provincia y Localidad -->
            <div class="row mb-3">
                <label class="col-sm-3 col-form-label">Provincia</label>
                <div class="col-sm-9">
                    <asp:DropDownList ID="ddlProvincias" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincias_SelectedIndexChanged" />
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-3 col-form-label">Localidad</label>
                <div class="col-sm-9">
                    <asp:DropDownList ID="ddlLocalidades" runat="server" CssClass="form-select" AutoPostBack="True" />
                </div>
            </div>

            <!-- Fecha de Nacimiento -->
            <div class="row mb-3">
                <label class="col-sm-3 col-form-label">Fecha de Nacimiento</label>
                <div class="col-sm-9">
                    <asp:TextBox ID="txtFechaNac" runat="server" CssClass="form-control datepicker" placeholder="YYYY-MM-DD" />
                </div>
            </div>

            <!-- Dirección, Email y Teléfono -->
            <div class="row mb-3">
                <label class="col-sm-3 col-form-label">Dirección</label>
                <div class="col-sm-9">
                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" placeholder="Ej: Calle 123, depto" />
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-3 col-form-label">Email</label>
                <div class="col-sm-9">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="ejemplo@mail.com" />
                </div>
            </div>
            <div class="row mb-4">
                <label class="col-sm-3 col-form-label">Teléfono</label>
                <div class="col-sm-9">
                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" placeholder="Ej: 1134567890" />
                </div>
            </div>

            <!-- Botones -->
            <div class="text-center">
                <asp:Button ID="btnReset" runat="server" CssClass="btn btn-outline-secondary mx-2" Text="Limpiar" OnClick="btnReset_Click" />
                <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary mx-2" Text="Guardar" OnClick="btnGuardar_Click" />
            </div>
        </div>
    </div>

    <!-- Toasts -->
    <asp:Panel ID="pnlExito" runat="server" Visible="false">
        <div class="toast-container position-fixed bottom-0 end-0 p-3">
            <div class="toast text-bg-success" role="alert">
                <div class="d-flex">
                    <div class="toast-body">
                        <strong>¡Éxito!</strong> El registro se guardó correctamente.
                    </div>
                    <button type="button" class="btn-close btn-close-white m-auto me-2" data-bs-dismiss="toast"></button>
                </div>
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="pnlError" runat="server" Visible="false">
        <div class="toast-container position-fixed bottom-0 end-0 p-3">
            <div class="toast text-bg-danger" role="alert">
                <div class="d-flex">
                    <div class="toast-body">
                        <strong>¡Error!</strong> Hubo un problema al guardar el registro.
                    </div>
                    <button type="button" class="btn-close btn-close-white m-auto me-2" data-bs-dismiss="toast"></button>
                </div>
            </div>
        </div>
    </asp:Panel>
</div>
    <%--endform --%>

<%-- Script que genera un mini calendario para elegir la fecha --%>
<script type="text/javascript">
    $(document).ready(function () {
        $('.datepicker').datepicker({
            format: 'yyyy-mm-dd',
            autoclose: true,
            todayHighlight: true
        });
    });
</script>

<%-- Script para ocultar el mensaje de exito de la carga despues de 3 segundos --%>
<script type="text/javascript">
    function ocultarPanel() {
        document.getElementById('<%= pnlExito.ClientID %>').style.display = 'none';
    }
</script>

</asp:Content>

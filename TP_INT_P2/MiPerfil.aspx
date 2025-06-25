<%@ Page Title="Mi perfil | Clínica TUP" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="TP_INT_P2.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card {
            border-radius: 1rem;
        }
        .form-label {
            font-weight: 500;
        }
        .toast-container {
            z-index: 2000;
        }
        .form-check-input
        {
            border: 0px !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-5">
        <div class="card shadow border-0 mx-auto" style="max-width: 900px;">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h3 class="mb-0">👤 Mi Perfil</h3>
                <button id="btnAlternador" type="button" onclick="alternarPanel()" class="btn btn-light btn-sm fw-semibold">Editar</button>
                
            </div>

            <div class="card-body">
                <fieldset id="fsMiPerfil" disabled="true">
                    <div class="row g-3">
                        <!-- Nombre y Apellido -->
                        <div class="col-md-6">
                            <label for="txtNombre" class="form-label">Nombre</label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Nombre" />
                            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" CssClass="text-danger" ErrorMessage="Obligatorio" Display="Dynamic" ValidationGroup="vgMiPerfil" />
                        </div>
                        <div class="col-md-6">
                            <label for="txtApellido" class="form-label">Apellido</label>
                            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeholder="Apellido" />
                            <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" CssClass="text-danger" ErrorMessage="Obligatorio" Display="Dynamic" ValidationGroup="vgMiPerfil" />
                        </div>

                        <!-- DNI -->
                        <div class="col-md-6">
                            <label for="txtDni" class="form-label">DNI</label>
                            <asp:TextBox ID="txtDni" runat="server" CssClass="form-control" Enabled="false" />
                        </div>

                        <!-- Legajo -->
                        <div class="col-md-6">
                            <label for="txtLegajo" class="form-label">Legajo</label>
                            <asp:TextBox ID="txtLegajo" runat="server" CssClass="form-control" Enabled="false" />
                        </div>

                        <!-- Email -->
                        <div class="col-md-6">
                            <label for="txtEmail" class="form-label">Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" CssClass="text-danger" ErrorMessage="Email obligatorio" Display="Dynamic" ValidationGroup="vgMiPerfil" />
                        </div>

                        <!-- Teléfono -->
                        <div class="col-md-6">
                            <label for="txtTelefono" class="form-label">Teléfono</label>
                            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" CssClass="text-danger" ErrorMessage="Teléfono obligatorio" Display="Dynamic" ValidationGroup="vgMiPerfil" />
                        </div>

                        <!-- Nacionalidad -->
                        <div class="col-md-6">
                            <label for="txtNacionalidad" class="form-label">Nacionalidad</label>
                            <asp:TextBox ID="txtNacionalidad" runat="server" CssClass="form-control" />
                        </div>

                        <!-- Fecha de nacimiento -->
                        <div class="col-md-6">
                            <label for="txtFechaNac" class="form-label">Fecha de nacimiento</label>
                            <asp:TextBox ID="txtFechaNac" runat="server" CssClass="form-control datepicker" />
                            <asp:RequiredFieldValidator ID="rfvFechaNac" runat="server" ControlToValidate="txtFechaNac" CssClass="text-danger" ErrorMessage="Fecha requerida" Display="Dynamic" ValidationGroup="vgMiPerfil" />
                        </div>

                        <!-- Dirección -->
                        <div class="col-12">
                            <label for="txtDireccion" class="form-label">Dirección</label>
                            <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" />
                        </div>

                        <!-- Sexo -->
                        <div class="col-12">
                            <label class="form-label">Sexo</label><br />
                            <div class="form-check form-check-inline">
                                <asp:RadioButton ID="rbMasculino" CssClass="form-check-input" GroupName="Sexo" runat="server" />
                                <label class="form-check-label" for="<%= rbMasculino.ClientID %>">Masculino</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <asp:RadioButton ID="rbFemenino" CssClass="form-check-input" GroupName="Sexo" runat="server" />
                                <label class="form-check-label" for="<%= rbFemenino.ClientID %>">Femenino</label>
                            </div>
                        </div>

                        <!-- Provincia / Localidad -->
                        <div class="col-md-6">
                            <label for="ddlProvincias" class="form-label">Provincia</label>
                            <asp:DropDownList ID="ddlProvincias" runat="server" CssClass="form-select" />
                        </div>
                        <div class="col-md-6">
                            <label for="ddlLocalidades" class="form-label">Localidad</label>
                            <asp:DropDownList ID="ddlLocalidades" runat="server" CssClass="form-select" />
                        </div>

                        <!-- Especialidad -->
                        <div class="col-md-6">
                            <label for="ddlEspecialidades" class="form-label">Especialidad</label>
                            <asp:DropDownList ID="ddlEspecialidades" runat="server" CssClass="form-select" />
                        </div>

                        <!-- Horario -->
                        <div class="col-md-6">
                            <label for="txtHorario" class="form-label">Horario</label>
                            <asp:TextBox ID="txtHorario" runat="server" CssClass="form-control" />
                        </div>

                        <!-- Usuario / Contraseña -->
                        <div class="col-md-6">
                            <label for="txtUsername" class="form-label">Usuario</label>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
                        </div>
                        <div class="col-md-6">
                            <label for="txtPassword" class="form-label">Contraseña</label>
                            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="form-control" />
                        </div>

                        <!-- Imagen -->
                        <div class="col-12">
                            <label for="fuImagenURL" class="form-label">Imagen</label>
                            <asp:FileUpload ID="fuImagenURL" runat="server" CssClass="form-control" />
                        </div>
                    </div>

                    <!-- Botones -->
                    <div class="text-center mt-4">
                        <asp:Button ID="btnReset" runat="server" CssClass="btn btn-secondary me-2 px-4" Text="Limpiar" OnClick="btnReset_Click" />
                        <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-success px-4" Text="Guardar" ValidationGroup="vgMiPerfil" OnClick="btnGuardar_Click"/>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>

    <!-- Toast éxito -->
    <asp:Panel ID="pnlExito" runat="server" Visible="false">
        <div class="toast-container position-fixed bottom-0 end-0 p-3">
            <div class="toast align-items-center text-bg-success border-0 show">
                <div class="d-flex">
                    <div class="toast-body">✔️ El perfil fue actualizado correctamente.</div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
                </div>
            </div>
        </div>
    </asp:Panel>

    <!-- Toast error -->
    <asp:Panel ID="pnlError" runat="server" Visible="false">
        <div class="toast-container position-fixed bottom-0 end-0 p-3">
            <div class="toast align-items-center text-bg-danger border-0 show">
                <div class="d-flex">
                    <div class="toast-body">❌ Ocurrió un error al guardar el perfil.</div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
                </div>
            </div>
        </div>
    </asp:Panel>

    <!-- Datepicker -->
    <script>
        $(document).ready(function () {
            $('.datepicker')
                .datepicker({
                    format: 'yyyy-mm-dd',
                    autoclose: true,
                    todayHighlight: true
                })
                .on('keydown paste', function (e) {
                    e.preventDefault();
                });

            // Establecer la fecha si ya hay una en el input
            var fecha = $('#<%= txtFechaNac.ClientID %>').val();
            if (fecha) {
                $('#<%= txtFechaNac.ClientID %>').datepicker('setDate', fecha);
            }
        });
    </script>
    <script>
        function alternarPanel() {
            var fs = document.getElementById("fsMiPerfil");
            var btn = document.getElementById("btnAlternador");
            fs.disabled = !fs.disabled;
            btn.textContent = fs.disabled ? "Editar" : "Cancelar edición";

        }
    </script>
</asp:Content>

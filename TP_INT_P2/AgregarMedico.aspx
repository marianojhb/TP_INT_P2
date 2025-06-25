<%@ Page Title="Agregar Médico | Clínica TUP" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarMedico.aspx.cs" Inherits="TP_INT_P2.AgregarMedico" %>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <style>
.form-check-input {
    border: none !important;
    box-shadow: none;
}
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
<h2 class="text-center my-4"><i class="fa-solid fa-user-doctor"></i> Agregar Médico</h2>

<div class="container shadow-lg rounded-4 p-5" style="max-width: 800px;">
  <div class="row g-4">

    <!-- Legajo (solo lectura) -->
    <div class="col-md-6">
      <label for="txtLegajo" class="form-label text-secondary">Legajo</label>
      <asp:TextBox ID="txtLegajo" runat="server" CssClass="form-control" Enabled="False" />
    </div>

    <!-- DNI + Validación -->
    <div class="col-md-6">
      <label for="txtDni" class="form-label text-secondary">DNI</label>
      <div class="input-group">
        <asp:TextBox ID="txtDni" runat="server" CssClass="form-control" placeholder="DNI" />
        <asp:Button ID="btnChequearDNI" runat="server" Text="Validar" OnClick="btnChequearDNI_Click" 
            CssClass="btn btn-outline-secondary" 
            CausesValidation="False" 
            />
      </div>
      <small class="text-danger">
        <asp:Label ID="lblChequearDNI" runat="server" Text="" />
      </small>
      <small class="text-success">
        <asp:Label ID="lblChequearDNIValido" runat="server" Text="" />
      </small>
      <small class="d-block text-muted">
        <asp:Label ID="lblChequearDNIHint" runat="server" Text="Valide antes de enviar el formulario" />
      </small>
    </div>
    <asp:RequiredFieldValidator ID="rvfDNI" runat="server"
        ControlToValidate="txtDni"
        ErrorMessage="El DNI es obligatorio"
        CssClass="text-danger"
        Display="Dynamic" ValidationGroup="vgAgregarMedico" />
      <asp:RegularExpressionValidator 
          ID="revDNI" runat="server" 
          ErrorMessage="Ingrese un DNI válido" 
          ControlToValidate="txtDni" 
          CssClass="text-danger" 
          Display="Dynamic" 
          ValidationExpression="^[0-9]{8}$" ValidationGroup="vgAgregarMedico" />

    <!-- Nombre -->
    <div class="col-md-6">
      <label for="txtNombre" class="form-label text-secondary">Nombre</label>
      <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Nombre" />
    </div>
    <asp:RequiredFieldValidator ID="rfvNombre" runat="server"
        ControlToValidate="txtNombre"
        ErrorMessage="El nombre es obligatorio"
        CssClass="text-danger"
        Display="Dynamic" ValidationGroup="vgAgregarMedico" />
      <asp:RegularExpressionValidator 
          ID="revNombre" runat="server" 
          ErrorMessage="Ingrese un nombre válido" 
          ControlToValidate="txtNombre" 
          CssClass="text-danger" 
          Display="Dynamic" 
          ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\s.]+$" ValidationGroup="vgAgregarMedico" />

     <!--  Apellido -->
    <div class="col-md-6">
      <label for="txtApellido" class="form-label text-secondary">Apellido</label>
      <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeholder="Apellido" />
    </div>
    <asp:RequiredFieldValidator ID="rfvApellido" runat="server"
        ControlToValidate="txtApellido"
        ErrorMessage="El apellido es obligatorio"
        CssClass="text-danger"
        Display="Dynamic" ValidationGroup="vgAgregarMedico" />
      <asp:RegularExpressionValidator 
          ID="revApellido" runat="server" 
          ErrorMessage="Ingrese un apellido válido" 
          ControlToValidate="txtApellido" 
          CssClass="text-danger" 
          Display="Dynamic" 
          ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\s.]+$" ValidationGroup="vgAgregarMedico" />

    <!-- Sexo -->
    <div class="col-md-6">
      <label class="form-label text-secondary">Sexo</label><br />
      <div class="form-check form-check-inline">
        <asp:RadioButton ID="rbMasculino" CssClass="form-check-input" GroupName="Sexo" value="M" runat="server" />
        <label class="form-check-label" for="<%= rbMasculino.ClientID %>">Masculino</label>
      </div>
      <div class="form-check form-check-inline">
        <asp:RadioButton ID="rbFemenino" CssClass="form-check-input" GroupName="Sexo" value="F" runat="server" />
        <label class="form-check-label" for="<%= rbFemenino.ClientID %>">Femenino</label>
      </div>
    </div>
    <asp:CustomValidator ID="cvSexo"
        runat="server"
        
        ErrorMessage="El sexo es obligatorio"
        CssClass="text-danger"
        Display="Dynamic" 
        OnServerValidate="cvSexo_ServerValidate"
        ClientValidationFunction="ValidarSexo"
        ValidateEmptyText="true" ValidationGroup="vgAgregarMedico" />

    <!-- Nacionalidad -->
    <div class="col-md-6">
      <label for="txtNacionalidad" class="form-label text-secondary">Nacionalidad</label>
      <asp:TextBox ID="txtNacionalidad" runat="server" CssClass="form-control" placeholder="Nacionalidad" />
    </div>
    <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server"
        ControlToValidate="txtNacionalidad"
        ErrorMessage="La nacionalidad es obligatoria"
        CssClass="text-danger"
        Display="Dynamic" ValidationGroup="vgAgregarMedico" />

    <!-- Provincia y Localidad -->
    <div class="col-md-6">
      <label for="ddlProvincias" class="form-label text-secondary">Provincia</label>
      <asp:DropDownList ID="ddlProvincias" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincias_SelectedIndexChanged" />
    </div>
    <asp:RequiredFieldValidator ID="rfvProvincias" runat="server"
        ControlToValidate="ddlProvincias"
        InitialValue="0"
        ErrorMessage="Debe seleccionar una provincia"
        CssClass="text-danger"
        Display="Dynamic" ValidationGroup="vgAgregarMedico" />

    <div class="col-md-6">
      <label for="ddlLocalidades" class="form-label text-secondary">Localidad</label>
      <asp:DropDownList ID="ddlLocalidades" runat="server" CssClass="form-select" AutoPostBack="true" />
    </div>
    <asp:RequiredFieldValidator ID="rfvLocalidades" runat="server"
        ControlToValidate="ddlLocalidades"
        InitialValue="0"
        ErrorMessage="Debe seleccionar una localidad"
        CssClass="text-danger"
        Display="Dynamic" ValidationGroup="vgAgregarMedico" />

    <!-- Fecha de nacimiento -->
    <div class="col-md-6">
      <label for="txtFechaNac" class="form-label text-secondary">Fecha de Nacimiento</label>
      <asp:TextBox TextMode="SingleLine" ID="txtFechaNac" runat="server" CssClass="form-control datepicker" />
    </div>
    <asp:RequiredFieldValidator ID="rfvFechaNac" runat="server"
        ControlToValidate="txtFechaNac"
        ErrorMessage="La fecha de nacimiento es obligatoria"
        CssClass="text-danger"
        Display="Dynamic" 
        EnableClientScript="true" ValidationGroup="vgAgregarMedico" />

    <!-- Dirección -->
    <div class="col-md-6">
      <label for="txtDireccion" class="form-label text-secondary">Dirección</label>
      <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" placeholder="Calle número y departamento" />
    </div>
    <asp:RequiredFieldValidator ID="rfvDireccion" runat="server"
        ControlToValidate="txtDireccion"
        ErrorMessage="La dirección es obligatoria"
        CssClass="text-danger"
        Display="Dynamic" ValidationGroup="vgAgregarMedico" />

    <!-- Email / Teléfono -->
    <div class="col-md-6">
      <label for="txtEmail" class="form-label text-secondary">Email</label>
      <asp:TextBox TextMode="Email" ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" />
    </div>
    <asp:RegularExpressionValidator 
        ID="revEmail" 
        runat="server"
        ControlToValidate="txtEmail"
        ErrorMessage="Ingrese un email válido"
        CssClass="text-danger"
        Display="Dynamic"
        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" ValidationGroup="vgAgregarMedico" />
    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
        ControlToValidate="txtEmail"
        ErrorMessage="El email es obligatorio"
        CssClass="text-danger"
        Display="Dynamic" ValidationGroup="vgAgregarMedico" />

    <div class="col-md-6">
      <label for="txtTelefono" class="form-label text-secondary">Teléfono</label>
      <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" placeholder="Teléfono" />
    </div>
    <asp:RequiredFieldValidator ID="rfvTelefono" runat="server"
        ControlToValidate="txtTelefono"
        ErrorMessage="El teléfono es obligatorio"
        CssClass="text-danger"
        Display="Dynamic" ValidationGroup="vgAgregarMedico" />

    <!-- Horario -->
    <div class="col-md-6">
      <label for="txtHorario" class="form-label text-secondary">Horario</label>
      <asp:TextBox ID="txtHorario" runat="server" CssClass="form-control" placeholder="Horario" />
    </div>
    <asp:RequiredFieldValidator ID="rfvHorario" runat="server"
        ControlToValidate="txtHorario"
        ErrorMessage="El horario es obligatorio"
        CssClass="text-danger"
        Display="Dynamic" ValidationGroup="vgAgregarMedico" />

    <!-- Especialidad -->
    <div class="col-md-6">
      <label for="ddlEspecialidades" class="form-label text-secondary">Especialidad</label>
      <asp:DropDownList ID="ddlEspecialidades" runat="server" CssClass="form-select" />
    </div>
    <asp:RequiredFieldValidator ID="rfvEspecialidades" runat="server"
        ControlToValidate="ddlEspecialidades"
        InitialValue="0"
        ErrorMessage="Debe seleccionar una especialidad"
        CssClass="text-danger"
        Display="Dynamic" ValidationGroup="vgAgregarMedico" />

    <!-- Usuario / Contraseña -->
    <div class="col-md-6">
      <label for="txtUsername" class="form-label text-secondary">Nombre de usuario</label>
      <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Username" />
        <small id="passwordHelpBlock" class="form-text text-muted">
        Debe tener entre 8 y 20 caracteres, contener letra y números, sin espacios, caracteres especiales o emoji.</small>
    </div>
      <asp:RegularExpressionValidator 
          ID="revUsername" runat="server" 
          ControlToValidate="txtUsername" 
          CssClass="text-danger" 
          Display="Dynamic" 
          ValidationExpression="^[a-zA-Z0-9]{8,20}$" 
          ErrorMessage="Debe tener entre 8 y 20 caracteres, letras y números." ValidationGroup="vgAgregarMedico">
      </asp:RegularExpressionValidator>

    <div class="col-md-6">
      <label for="txtPassword" class="form-label text-secondary">Contraseña</label>
      <asp:TextBox TextMode="Password" ID="txtPassword" runat="server" CssClass="form-control" placeholder="Contraseña" autocomplete="new-password" />
      <small class="form-text text-muted">
        Debe tener entre 5 y 20 caracteres, contener letra y números, sin espacios, caracteres especiales o emoji.</small>
    </div>
    <asp:RegularExpressionValidator 
          ID="revPassword" runat="server" 
          ControlToValidate="txtPassword" 
          CssClass="text-danger" 
          Display="Dynamic" 
          ValidationExpression="^[a-zA-Z0-9]{5,20}$" 
          ErrorMessage="Debe tener entre 5 y 20 caracteres, letras y números." ValidationGroup="vgAgregarMedico">
      </asp:RegularExpressionValidator>

    <!-- Reingreso -->
    <div class="col-md-6">
      <label for="txtPasswordReingreso" class="form-label text-secondary">Reingrese Contraseña</label>
      <asp:TextBox TextMode="Password" ID="txtPasswordReingreso" runat="server" CssClass="form-control" placeholder="Confirmar contraseña" autocomplete="new-password" />
      <small class="text-danger d-block">
        <asp:CompareValidator 
            ID="cvContrasenas" runat="server" 
            ErrorMessage="Las contraseñas no coinciden" 
            ControlToCompare="txtPassword" 
            ControlToValidate="txtPasswordReingreso" 
            Display="Dynamic" 
            ForeColor="Red" 
            ValidationGroup="vgAgregarMedico" />
      </small>
    </div>

    <!-- Imagen -->
    <div class="col-md-6">
      <label for="fuImagenURL" class="form-label text-secondary">Imagen</label>
      <asp:FileUpload ID="fuImagenURL" runat="server" CssClass="form-control" />
    </div>

    <!-- Botones -->
    <div class="col-12 text-center mt-4">
      <asp:Button ID="btnReset" runat="server" CssClass="btn btn-outline-secondary mx-2 px-4" Text="Limpiar" OnClick="btnReset_Click" />
      <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary mx-2 px-4" Text="Guardar" OnClick="btnGuardar_Click" CausesValidation="True" ValidationGroup="vgAgregarMedico" />
    </div>
  </div>
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


<%-- Script que genera un mini calendario para elegir la fecha --%>
<script type="text/javascript">
    $(document).ready(function () {
        $('.datepicker')
            .datepicker({
                format: 'yyyy-mm-dd',
                autoclose: true,
                todayHighlight: true
            })
            .on('keydown paste', function (e) {
                e.preventDefault(); // Bloquea escribir con teclado o pegar
            });
    });
</script>

<%-- Script para ocultar el mensaje de exito de la carga despues de 3 segundos --%>
<script type="text/javascript">
    function ocultarPanel() {
        document.getElementById('<%= pnlExito.ClientID %>').style.display = 'none';
    }
</script>

<%-- Funcion que ayuda a validar el item Sexo antes de enviar al servidor --%>
<script type="text/javascript">
    function validarSexo(sender, args) {
        var masculino = document.getElementById('<%= rbMasculino.ClientID %>');
    var femenino = document.getElementById('<%= rbFemenino.ClientID %>');
        args.IsValid = masculino.checked || femenino.checked;
    }
</script>

</asp:Content>

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
                <h2>Agregar Paciente</h2>

<div class="container shadow p-4" style="max-width: 700px;"> 
    <div class="form-group row">

        <div class="form-group row mb-3">
                <label for="txtDni" class="col-sm-4 col-form-label">DNI</label>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtDni" runat="server" CssClass="form-control" placeholder="DNI" />
                </div>
                <div class="col-sm-2">
                    <asp:Button ID="btnChequearDNI" runat="server" Text="Validar" OnClick="btnChequearDNI_Click" CssClass="btn btn-secondary" CausesValidation="False" />
                </div>
                <div class="col-sm-3">
                    <asp:Label ID="lblChequearDNI" runat="server" Text="" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lblChequearDNIValido" runat="server" Text="" ForeColor="Green"></asp:Label>
                    <small>
                    <asp:Label ID="lblChequearDNIHint" runat="server" Text="Valide antes de enviar el formulario"></asp:Label></small>
                </div>
        </div>

        <div class="form-group row mb-3">
            <label for="txtNombre" class="col-sm-4 col-form-label">Nombre</label>
            <div class="col-sm-8">
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Nombre" />
            </div>
        </div>

        <div class="form-group row mb-3">
            <label for="txtApellido" class="col-sm-4 col-form-label">Apellido</label>
            <div class="col-sm-8">
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeholder="Apellido" />
            </div>
        </div>

        <div class="form-group row mb-3">
          <fieldset class="form-group">
            <div class="row">
              <label class="col-form-label col-sm-4 pt-0">Sexo</label>
              <div class="col-sm-8">
                <div class="form-check form-check-inline">
                    <asp:RadioButton ID="rbMasculino" CssClass="form-check-input" GroupName="Sexo" value="M" runat="server" />
                  <label class="form-check-label" for="<%= rbMasculino.ClientID %>">
                    Masculino
                  </label>
                </div>
                <div class="form-check form-check-inline">
                    <asp:RadioButton ID="rbFemenino" CssClass="form-check-input" GroupName="Sexo" value="F" runat="server" />
                    <label class="form-check-label" for="<%= rbFemenino.ClientID %>">
                    Femenino
                  </label>
                </div>
              </div>
            </div>
          </fieldset>
        </div>

        <div class="form-group row mb-3">
            <label for="txtNacionalidad" class="col-sm-4 col-form-label">Nacionalidad</label>
            <div class="col-sm-8">
                <asp:TextBox ID="txtNacionalidad" runat="server" CssClass="form-control" placeholder="Nacionalidad" />
            </div>
        </div>

        <div class="form-group row mb-3">
            <label for="ddlProvincias" class="col-sm-4 col-form-label">Provincia</label>
    
            <div class="col-sm-8">
                <asp:DropDownList ID="ddlProvincias" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincias_SelectedIndexChanged" >
            </asp:DropDownList>
              </div>   
        </div>

        <div class="form-group row mb-3">
            <label for="ddlLocalidades" class="col-sm-4 col-form-label">Localidad</label>
                <div class="col-sm-8">
                <asp:DropDownList ID="ddlLocalidades" runat="server" CssClass="form-select" AutoPostBack="true" >
                    </asp:DropDownList>
                </div>
        </div>
   
        <div class="form-group row mb-3">
                    <label for="txtFechaNac"  class="col-sm-4 col-form-label">Fecha de Nacimiento</label>
                <div class="col-sm-8">
                    <asp:TextBox ID="txtFechaNac" runat="server" CssClass="form-control datepicker" placeholder="Fecha de Nacimiento" style="padding: 7px 12px;"/>
            
                </div>
        </div>
   
        <div class="form-group row mb-3">
            <label for="txtDireccion" class="col-sm-4 col-form-label">Dirección</label>
            <div class="col-sm-8">
                <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" placeholder="Calle número y departamento" />
            </div>
       </div>

        <div class="form-group row mb-3">
            <label for="txtEmail" class="col-sm-4 col-form-label">Email</label>
            <div class="col-sm-8">
                <asp:TextBox TextMode="Email" ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" />

            </div>
        </div>

        <div class="form-group row mb-3">
            <label for="txtTelefono" class="col-sm-4 col-form-label">Telefono</label>
            <div class="col-sm-8">
                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" placeholder="Telefono" />
            </div>
        </div>

        <%--botones limpiar y guardar--%>
        <div class="form-group row">
      <div class="col-sm-12 text-center mt-3">
        <asp:Button ID="btnReset" runat="server" CssClass="btn btn-secondary mx-2" Text="Limpiar" OnClick="btnReset_Click" />
        <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary mx-2" Text="Guardar" OnClick="btnGuardar_Click" />
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



</div> <%--endform --%>

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

﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoTurnos.aspx.cs" Inherits="TP_INT_P2.ListadoTurnos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .gridview-container .aspNetPager {
        text-align: center;
    }

    .gridview-container .gridview-pager {
        text-align: center;
    }

    .gridview-container table {
        margin-left: auto;
        margin-right: auto;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server" >
     <h2 class="text-center my-4"><i class="fa-solid fa-calendar-days"></i> Listado de Turnos</h2>
<div class="container px-3">
  <div class="row align-items-end g-2 mb-3">

    <!-- Desde -->
    <div class="col-sm-1">
      <label for="txtTurnosDesde" class="form-label">Desde:</label>
      
        <asp:TextBox ID="txtTurnosDesde" runat="server" Text="Inicio" CssClass="form-control datepicker"></asp:TextBox>
        
    </div>

    <!-- Hasta -->
    <div class="col-sm-1">
      <label for="txtTurnosHasta" class="form-label">Hasta:</label>
        <asp:TextBox ID="txtTurnosHasta" runat="server" Text="Fin" CssClass="form-control datepicker"></asp:TextBox>
    </div>

    <!-- Especialista -->
    <div runat="server" id="div_Especialista" class="col-sm-2">
      <label for="txtBuscarPorProfesional" class="form-label">Profesional:</label>
        <asp:DropDownList ID="ddlMedicos" runat="server" CssClass="form-control">


        </asp:DropDownList>
    </div>

    <!-- Buscar -->
    <div class="col-sm-3">
      <asp:Label ID="lblBuscar" runat="server" Text="Buscar:" AssociatedControlID="txtBuscarPorPalabraClave" CssClass="form-label"></asp:Label>
      <asp:TextBox ID="txtBuscarPorPalabraClave" runat="server" CssClass="form-control" Placeholder="Palabra clave..." />
    </div>

    <div class="col-sm-auto">
      <label class="form-label d-block invisible">.</label>
      <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary form-control" OnClick="btnBuscar_Click" />
    </div>


    <div class="col-sm-auto">
      <label class="form-label d-block invisible">.</label>
      <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-secondary form-control" OnClick="btnReset_Click" />
    </div>
  </div>


   
    <div class="row mb-1">
      <div class="col-12">
        <label class="form-label">Búsqueda rápida:</label>
      </div>
    </div>

    <!-- Botones Pasados y Futuros -->
    <div class="row mb-3">
      <div class="d-flex gap-2">
        <asp:LinkButton ID="lbTodos" runat="server" CssClass="btn btn-outline-primary" OnClick="lbTodos_Click">
          Todos 
          <asp:Label ID="lblBadgeTodos" runat="server" Text="12" CssClass="badge bg-secondary"></asp:Label>
        </asp:LinkButton>

        <asp:LinkButton ID="lbPasados" runat="server" CssClass="btn btn-outline-primary" OnClick="lbPasados_Click">
          Pasados 
          <asp:Label ID="lblBadgePasados" runat="server" Text="12" CssClass="badge bg-secondary"></asp:Label>
        </asp:LinkButton>

        <asp:LinkButton ID="lbFuturos" runat="server" CssClass="btn btn-outline-primary" OnClick="lbFuturos_Click">
          Futuros 
          <asp:Label ID="lblBadgeFuturos" runat="server" Text="12" CssClass="badge bg-secondary"></asp:Label>
        </asp:LinkButton>

        <asp:LinkButton ID="lbProxSemana" runat="server" CssClass="btn btn-outline-primary" OnClick="lbProxSemana_Click">
          Próxima Semana 
          <asp:Label ID="lblBadgeProxSemana" runat="server" Text="12" CssClass="badge bg-secondary"></asp:Label>
        </asp:LinkButton>
      </div>
    </div>

</div>


<asp:Panel ID="Panel1" runat="server" CssClass="mx-auto w-100 p-3">
<div class="gridview-container">
    <asp:GridView ID="gvTurnos" runat="server"
            AutoGenerateColumns="False" 

            
            CellPadding="10" 
            CellSpacing="5"
            GridLines="None" 
            OnRowDeleting="gvTurnos_RowDeleting" 
            OnRowCancelingEdit="gvTurnos_RowCancelingEdit"
            OnRowEditing="gvTurnos_RowEditing" 
            OnRowUpdating="gvTurnos_RowUpdating" 
            AllowPaging="True" 
            OnPageIndexChanging="gvTurnos_PageIndexChanging"
            Width="100%"
            CssClass="table table-hover table-bordered align-middle w-100"
            HeaderStyle-CssClass="text-center table-primary"
            DataKeyNames="fecha_T,legajo_T"
        >
            <EmptyDataTemplate>
                <div class="container mt-3">
                    <div class="alert alert-warning text-center" role="alert">
                        No se encontraron datos para mostrar.
                    </div>
                </div>
            </EmptyDataTemplate>
            <Columns>
                <asp:CommandField 
                    ShowDeleteButton="True" 
                    DeleteText="Eliminar" 
                    ShowEditButton="True" 
                    EditText="Editar" 
                    UpdateText="Guardar" 
                    CancelText="Cancelar" />     

                <asp:TemplateField HeaderText="Fecha">
                    <EditItemTemplate>
                        <asp:Label ID="lbl_eit_Fecha" runat="server" Text='<%# Eval("fecha_T", "{0:dd/MM/yyyy HH:mm}") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_Fecha" runat="server"  Text='<%# Eval("fecha_T", "{0:dd/MM/yyyy HH:mm}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Profesional">
                    <EditItemTemplate>
                        <asp:Label ID="lbl_eit_FullNameMedico" runat="server" Text='<%# Eval("fullNameMedico") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_FullNameMedico" runat="server" Text='<%# Eval("fullNameMedico") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="DNI">
                    <EditItemTemplate>
                        <asp:Label ID="lbl_eit_DNI" runat="server" Text='<%# Eval("dni_T") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_DNI" runat="server" Text='<%# Eval("dni_P") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Nombre">
                    <EditItemTemplate>
                        <asp:Label ID="tb_eit_Nombre" runat="server" Text='<%# Eval("nombre_P") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_Nombre" runat="server" Text='<%# Eval("nombre_P") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Apellido">
                    <EditItemTemplate>
                        <asp:Label ID="tb_eit_Apellido" runat="server" Text='<%# Eval("apellido_P") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_Apellido" runat="server" Text='<%# Eval("apellido_P") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Email">
                    <EditItemTemplate>
                        <asp:Label ID="tb_eit_Email" runat="server" Text='<%# Eval("email_P") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_Email" runat="server" Text='<%# Eval("email_P") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Teléfono">
                    <EditItemTemplate>
                        <asp:Label ID="tb_eit_Telefono" runat="server" Text='<%# Eval("telefono_P") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_Telefono" runat="server" Text='<%# Eval("telefono_P") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Asistencia">
                    <EditItemTemplate>
                        <asp:CheckBox ID="chb_eit_Asistencia" runat="server" Checked='<%# Bind("asistencia_T") %>'></asp:CheckBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chb_it_Asistencia" runat="server"  Enabled="false" Checked='<%# Convert.ToBoolean(Eval("asistencia_T")) %>'></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Observación">
                    <EditItemTemplate>
                        <asp:TextBox ID="tb_eit_Observacion" runat="server" Text='<%# Bind("observacion_T") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_Observacion" runat="server" Text='<%# Eval("observacion_T") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>



                <asp:TemplateField HeaderText="Cancelado">
                    <EditItemTemplate>
                        <asp:CheckBox ID="chb_eit_Cancelado" runat="server" Checked='<%# Bind("cancelado_T") %>'></asp:CheckBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="lbl_it_Cancelado" runat="server"  Enabled="false" Checked='<%# Convert.ToBoolean(Eval("cancelado_T")) %>'></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            </asp:GridView>
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
    </asp:Content>





<%@ Page Title="Listado de Pacientes | TUP" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoPacientes.aspx.cs" Inherits="TP_INT_P2.ListadoPacientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table a {
            text-decoration: none;
        }
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <h2 class="text-center my-4"><i class="fa-solid fa-user-injured"></i> Listado de Pacientes</h2>
<div class="form-group d-flex align-items-center gap-1 w-50 mx-auto">
    <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control me-1" Placeholder="Buscar por palabra clave ..."></asp:TextBox>
    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary me-1" OnClick="btnBuscar_Click" />
    <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn btn-secondary" OnClick="btnLimpiar_Click" />
</div>
        <%--<asp:Panel ID="Panel1" runat="server" CssClass="col-md-8 mx-auto card p-3">--%>
        <asp:Panel ID="Panel1" runat="server" CssClass="mx-auto p-3">
        <div class="gridview-container">
        <asp:GridView ID="gvPacientes" runat="server" 
            AutoGenerateColumns="False" 

            
            CellPadding="10" 
            CellSpacing="5"
            GridLines="None" 
            OnRowDeleting="gvPacientes_RowDeleting" 
            OnDataBound="gvPacientes_DataBound"
            OnRowDataBound="gvPacientes_RowDataBound" 
            OnRowCancelingEdit="gvPacientes_RowCancelingEdit"
            OnRowEditing="gvPacientes_RowEditing" 
            OnRowUpdating="gvPacientes_RowUpdating" 
            AllowPaging="True" 
            OnPageIndexChanging="gvPacientes_PageIndexChanging"
            Width="100%"
            CssClass="table table-hover table-bordered align-middle w-100"
            HeaderStyle-CssClass="text-center table-primary" OnRowUpdated="gvPacientes_RowUpdated"
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
                ShowEditButton="True"
                ShowDeleteButton="True"
                EditText="✏️ Editar"
                DeleteText="🗑️ Eliminar"
                UpdateText="Guardar"
                CancelText="Cancelar" ItemStyle-Width="200px" />                          
                    
                <asp:TemplateField HeaderText="DNI">
                    <EditItemTemplate>
                        <asp:Label ID="lbl_eit_DNI" runat="server" Text='<%# Eval("dni_P") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_DNI" runat="server" Text='<%# Eval("dni_P") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Nombre">
                    <EditItemTemplate>
                        <asp:TextBox ID="tb_eit_Nombre" runat="server" Text='<%# Bind("nombre_P") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_Nombre" runat="server" Text='<%# Eval("nombre_P") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Apellido">
                    <EditItemTemplate>
                        <asp:TextBox ID="tb_eit_Apellido" runat="server" Text='<%# Bind("apellido_P") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_Apellido" runat="server" Text='<%# Eval("apellido_P") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Sexo">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlSexo" runat="server"  Text='<%# Bind("sexo_P") %>'>
                            <asp:ListItem Value="M">M</asp:ListItem>
                            <asp:ListItem Value="F">F</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_Sexo" runat="server" Text='<%# Eval("sexo_P") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Nacionalidad">
                    <EditItemTemplate>
                        <asp:TextBox ID="tb_eit_Nacionalidad" runat="server" Text='<%# Bind("nacionalidad_P") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_Nacionalidad" runat="server" Text='<%# Eval("nacionalidad_P") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Fecha de nacimiento">
                    <EditItemTemplate>
                       <asp:TextBox ID="tb_eit_FechaNac" runat="server" CssClass="form-control datepicker" Text='<%# Bind("fechaNac_P") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                       <asp:Label ID="lbl_it_FechaNac" runat="server" Text='<%# Eval("fechaNac_P", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Dirección">
                    <EditItemTemplate>
                        <asp:TextBox ID="tb_eit_Direccion" runat="server" Text='<%# Bind("direccion_P") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_Direccion" runat="server" Text='<%# Eval("direccion_P") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Provincia">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlProvincias" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincias_SelectedIndexChanged">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_Provincia" runat="server" Text='<%# Eval("nombre_PROV") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Localidad">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlLocalidades" runat="server">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_Localidad" runat="server"  Text='<%# Eval("nombre_L") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="tb_eit_Email" runat="server" Text='<%# Bind("email_P") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_Email" runat="server" Text='<%# Eval("email_P") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Teléfono">
                    <EditItemTemplate>
                        <asp:TextBox ID="tb_eit_Telefono" runat="server" Text='<%# Bind("telefono_P") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_Telefono" runat="server" Text='<%# Eval("telefono_P") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField Visible="false">
                    <ItemTemplate>
                        <asp:HiddenField ID="hf_idProvincia" Value='<%# Eval("idProvincia_P") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField Visible="false">
                    <ItemTemplate>
                        <asp:HiddenField ID="hf_idLocalidad" Value='<%# Eval("idLocalidad_P") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
              
            </Columns>
            </asp:GridView>
         </div>
        <%--<asp:Label ID="lblMensaje" runat="server" Text="" CssClass="mx-auto"></asp:Label>--%>
            </asp:Panel>


    <!-- Datepicker para GridView -->
    <script>
        Sys.Application.add_load(function () {
            $('.datepicker').each(function () {
                var $input = $(this);

                $input.datepicker({
                    format: 'yyyy-mm-dd',
                    autoclose: true,
                    todayHighlight: true
                }).on('keydown paste', function (e) {
                    e.preventDefault();
                });

                // Establecer la fecha si ya hay una en el input
                if ($input.val()) {
                    $input.datepicker('setDate', $input.val());
                }
            });
        });
    </script>

    </asp:Content>

<%@ Page Title="Listado de Médicos | TUP" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoMedicos.aspx.cs" Inherits="TP_INT_P2.ListadoMedicos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        th {
            text-align:center !important;
        }
        .imagenMedico {
              border-radius: 50% !important;
              width: 150px !important;
            }
        .profilepicDiv
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="contenidoListadoMedicos" ContentPlaceHolderID="MainContent" runat="server">
    <h2>LISTADO MÉDICOS</h2>
<asp:Panel ID="panelContenidoListadoMedicos" runat="server" CssClass="mx-auto w-50 border p-3">
    <asp:Button ID="btnAgregarMedico" runat="server" Text="Agregar Médico" OnClick="btnAgregarMedico_Click" Visible="False" />
    
    <asp:ScriptManager ID="ScriptManager1" runat="server" />


        <asp:ListView ID="lvMedicos" runat="server" DataSourceID="SqlDataSource1" OnPagePropertiesChanging="lvMedicos_PagePropertiesChanging"     OnItemEditing="lvMedicos_ItemEditing"
            OnItemUpdating="lvMedicos_ItemUpdating"
            OnItemCanceling="lvMedicos_ItemCanceling"
                >

        <%--        <SelectedItemTemplate>
            <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">imagen_M:
                <asp:Label ID="imagen_MLabel" runat="server" Text='<%# Eval("imagen_M") %>' />
                <br />
                legajo_M:
                <asp:Label ID="legajo_MLabel" runat="server" Text='<%# Eval("legajo_M") %>' />
                <br />
                dni_P:
                <asp:Label ID="dni_PLabel" runat="server" Text='<%# Eval("dni_P") %>' />
                <br />
                nombre_P:
                <asp:Label ID="nombre_PLabel" runat="server" Text='<%# Eval("nombre_P") %>' />
                <br />
                apellido_P:
                <asp:Label ID="apellido_PLabel" runat="server" Text='<%# Eval("apellido_P") %>' />
                <br />
                sexo_P:
                <asp:Label ID="sexo_PLabel" runat="server" Text='<%# Eval("sexo_P") %>' />
                <br />
                nacionalidad_P:
                <asp:Label ID="nacionalidad_PLabel" runat="server" Text='<%# Eval("nacionalidad_P") %>' />
                <br />
                fechaNac_P:
                <asp:Label ID="fechaNac_PLabel" runat="server" Text='<%# Eval("fechaNac_P") %>' />
                <br />
                direccion_P:
                <asp:Label ID="direccion_PLabel" runat="server" Text='<%# Eval("direccion_P") %>' />
                <br />
                nombre_L:
                <asp:Label ID="nombre_LLabel" runat="server" Text='<%# Eval("nombre_L") %>' />
                <br />
                nombre_PROV:
                <asp:Label ID="nombre_PROVLabel" runat="server" Text='<%# Eval("nombre_PROV") %>' />
                <br />
                email_P:
                <asp:Label ID="email_PLabel" runat="server" Text='<%# Eval("email_P") %>' />
                <br />
                telefono_P:
                <asp:Label ID="telefono_PLabel" runat="server" Text='<%# Eval("telefono_P") %>' />
                <br />
                nombre_E:
                <asp:Label ID="nombre_ELabel" runat="server" Text='<%# Eval("nombre_E") %>' />
                <br />
                username_U:
                <asp:Label ID="username_ULabel" runat="server" Text='<%# Eval("username_U") %>' />
                <br />
                password_U:
                <asp:Label ID="password_ULabel" runat="server" Text='<%# Eval("password_U") %>' />
                <br />
                tipo_U:
                <asp:Label ID="tipo_ULabel" runat="server" Text='<%# Eval("tipo_U") %>' />
                <br />
                <asp:CheckBox ID="estado_MCheckBox" runat="server" Checked='<%# Eval("estado_M") %>' Enabled="false" Text="estado_M" />
                <br />
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Eliminar" />
                <br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                <br />
            </td>
        </SelectedItemTemplate>--%>
        <ItemTemplate>
            <div class="col-md-4 mb-4">
                <div class="card-deck">

                <div class="card">
                    <div class="profilepicDiv">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("imagen_M") %>' OnClick="ImageButton1_Click" CssClass="card-img-top imagenMedico shadow" AlternateText="Imagen de perfil" />
                    </div>
                        <div class="card-body">
                        <h5 class="card-title">
                            <asp:Label ID="nombre_PLabel" runat="server" Text='<%# Eval("nombre_P") %>' />
                            <asp:Label ID="apellido_PLabel" runat="server" Text='<%# Eval("apellido_P") %>' />
                        </h5>
                        <p class="card-text">
                            Legajo:
                            <asp:Label ID="legajo_MLabel" runat="server" Text='<%# Eval("legajo_M") %>' />
                            <br />
                            DNI:
                            <asp:Label ID="dni_PLabel" runat="server" Text='<%# Eval("dni_P") %>' />
   
                            Sexo:
                            <asp:Label ID="sexo_PLabel" runat="server" Text='<%# Eval("sexo_P") %>' />
                            <br />
                            Nacionalidad:
                            <asp:Label ID="nacionalidad_PLabel" runat="server" Text='<%# Eval("nacionalidad_P") %>' />
                            <br />
                            Fecha de Nacimiento
                            <asp:Label ID="fechaNac_PLabel" runat="server" Text='<%# Eval("fechaNac_P", "{0:dd/MM/yyyy}") %>' />
                            <br />
                            Dirección:
                            <asp:Label ID="direccion_PLabel" runat="server" Text='<%# Eval("direccion_P") %>' />
                            <br />
                            Localidad:
                            <asp:Label ID="nombre_LLabel" runat="server" Text='<%# Eval("nombre_L") %>' />
                            <br />
                            Provincia:
                            <asp:Label ID="nombre_PROVLabel" runat="server" Text='<%# Eval("nombre_PROV") %>' />
                            <br />
                            Email:
                            <asp:Label ID="email_PLabel" runat="server" Text='<%# Eval("email_P") %>' />
                            <br />
                            Teléfono:
                            <asp:Label ID="telefono_PLabel" runat="server" Text='<%# Eval("telefono_P") %>' />
                            <br />
                            Especialidad:
                            <asp:Label ID="nombre_ELabel" runat="server" Text='<%# Eval("nombre_E") %>' />
                            <br />
                            Usuario:
                            <asp:Label ID="username_ULabel" runat="server" Text='<%# Eval("username_U") %>' />
                            <br />
                            Contraseña:
                            <asp:Label ID="password_ULabel" runat="server" Text='<%# Eval("password_U") %>' />
                            <br />
                            Tipo:
                            <asp:Label ID="tipo_ULabel" runat="server" Text='<%# Eval("tipo_U") %>' />
                            <br />
                            <asp:CheckBox ID="estado_MCheckBox" runat="server" Checked='<%# Eval("estado_M") %>' Enabled="False" Text="estado_M" />
                        </p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Eliminar" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                    </div>
                </div>

            </div>
            </div>
        </ItemTemplate>
        <EditItemTemplate>
            <div class="col-md-4 mb-4">
                <div class="card-deck">

                <div class="card">
                    <asp:TextBox ID="imagen_PLabel" runat="server" Text='<%# Bind("imagen_M") %>' />
                    <div class="card-body">
                        <h5 class="card-title">
                            <asp:Label ID="nombre_PLabel" runat="server" Text='<%# Bind("nombre_P") %>' />
                            <asp:Label ID="apellido_PLabel" runat="server" Text='<%# Bind("apellido_P") %>' />
                        </h5>
                        <p class="card-text">
                            Legajo:
                            <asp:Label ID="legajo_MLabel" runat="server" Text='<%# Eval("legajo_M") %>' />
                            <br />
                            DNI:
                            <asp:Label ID="dni_PLabel" runat="server" Text='<%# Eval("dni_P") %>' />
   
                            Sexo:
                            <asp:Label ID="sexo_PLabel" runat="server" Text='<%# Bind("sexo_P") %>' />
                            <br />
                            Nacionalidad:
                            <asp:Label ID="nacionalidad_PLabel" runat="server" Text='<%# Bind("nacionalidad_P") %>' />
                            <br />
                            Fecha de Nacimiento
                            <asp:Label ID="fechaNac_PLabel" runat="server" Text='<%# Bind("fechaNac_P", "{0:dd/MM/yyyy}") %>' />
                            <br />
                            Dirección:
                            <asp:Label ID="direccion_PLabel" runat="server" Text='<%# Bind("direccion_P") %>' />
                            <br />
                            Localidad:
                            <asp:Label ID="nombre_LLabel" runat="server" Text='<%# Bind("nombre_L") %>' />
                            <br />
                            Provincia:
                            <asp:Label ID="nombre_PROVLabel" runat="server" Text='<%# Bind("nombre_PROV") %>' />
                            <br />
                            Email:
                            <asp:Label ID="email_PLabel" runat="server" Text='<%# Bind("email_P") %>' />
                            <br />
                            Teléfono:
                            <asp:Label ID="telefono_PLabel" runat="server" Text='<%# Bind("telefono_P") %>' />
                            <br />
                            Especialidad:
                            <asp:Label ID="nombre_ELabel" runat="server" Text='<%# Bind("nombre_E") %>' />
                            <br />
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("estado_M") %>' True="False" Text="estado_M" />
                        </p>
                    </div>
                    <div class="card-footer">
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                    </div>
                </div>

            </div>
            </div>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <div class="container mt-3">
                <div class="alert alert-warning text-center" role="alert">
                    No se encontraron datos para mostrar.
                </div>
            </div>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
            <div id="emptyItemPlaceholderContainer" class="container">
                </div>
        </EmptyItemTemplate>


            <LayoutTemplate>
               <div id="itemPlaceholderContainer" class="container">
                    <div class="row">
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </div>
                    <div class="d-flex justify-content-center mt-3">
                    </div>
                </div>                            
                <div>
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                        <Fields>
                           <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                        </Fields>
                    </asp:DataPager>

                </div>

            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">imagen_M:
                    <asp:Label ID="imagen_MLabel" runat="server" Text='<%# Eval("imagen_M") %>' />
                    <br />
                    legajo_M:
                    <asp:Label ID="legajo_MLabel" runat="server" Text='<%# Eval("legajo_M") %>' />
                    <br />
                    dni_P:
                    <asp:Label ID="dni_PLabel" runat="server" Text='<%# Eval("dni_P") %>' />
                    <br />
                    nombre_P:
                    <asp:Label ID="nombre_PLabel" runat="server" Text='<%# Eval("nombre_P") %>' />
                    <br />
                    apellido_P:
                    <asp:Label ID="apellido_PLabel" runat="server" Text='<%# Eval("apellido_P") %>' />
                    <br />
                    sexo_P:
                    <asp:Label ID="sexo_PLabel" runat="server" Text='<%# Eval("sexo_P") %>' />
                    <br />
                    nacionalidad_P:
                    <asp:Label ID="nacionalidad_PLabel" runat="server" Text='<%# Eval("nacionalidad_P") %>' />
                    <br />
                    fechaNac_P:
                    <asp:Label ID="fechaNac_PLabel" runat="server" Text='<%# Eval("fechaNac_P") %>' />
                    <br />
                    direccion_P:
                    <asp:Label ID="direccion_PLabel" runat="server" Text='<%# Eval("direccion_P") %>' />
                    <br />
                    nombre_L:
                    <asp:Label ID="nombre_LLabel" runat="server" Text='<%# Eval("nombre_L") %>' />
                    <br />
                    nombre_PROV:
                    <asp:Label ID="nombre_PROVLabel" runat="server" Text='<%# Eval("nombre_PROV") %>' />
                    <br />
                    email_P:
                    <asp:Label ID="email_PLabel" runat="server" Text='<%# Eval("email_P") %>' />
                    <br />
                    telefono_P:
                    <asp:Label ID="telefono_PLabel" runat="server" Text='<%# Eval("telefono_P") %>' />
                    <br />
                    nombre_E:
                    <asp:Label ID="nombre_ELabel" runat="server" Text='<%# Eval("nombre_E") %>' />
                    <br />
                    username_U:
                    <asp:Label ID="username_ULabel" runat="server" Text='<%# Eval("username_U") %>' />
                    <br />
                    password_U:
                    <asp:Label ID="password_ULabel" runat="server" Text='<%# Eval("password_U") %>' />
                    <br />
                    tipo_U:
                    <asp:Label ID="tipo_ULabel" runat="server" Text='<%# Eval("tipo_U") %>' />
                    <br />
                    <asp:CheckBox ID="estado_MCheckBox" runat="server" Checked='<%# Eval("estado_M") %>' Enabled="false" Text="estado_M" />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Eliminar" />
                    <br />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                    <br />
                </td>
            </SelectedItemTemplate>
    </asp:ListView>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDClinicaConnectionString %>" DeleteCommand="SP_INACTIVARMEDICO" DeleteCommandType="StoredProcedure" SelectCommand="SP_SELECCIONARMEDICO" SelectCommandType="StoredProcedure" UpdateCommand="SP_UPDATEMEDICO" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="DNI" Type="String" />
            <asp:Parameter Name="ESTADO" Type="Boolean" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="DNI" Type="String" />
            <asp:Parameter Name="NOMBRE" Type="String" />
            <asp:Parameter Name="APELLIDO" Type="String" />
            <asp:Parameter Name="SEXO" Type="String" />
            <asp:Parameter Name="NACIONALIDAD" Type="String" />
            <asp:Parameter DbType="Date" Name="FECHANAC" />
            <asp:Parameter Name="DIRECCION" Type="String" />
            <asp:Parameter Name="IDPROVINCIA" Type="Int32" />
            <asp:Parameter Name="IDLOCALIDAD" Type="Int32" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="TELEFONO" Type="String" />
            <asp:Parameter Name="LEGAJO" Type="Int32" />
            <asp:Parameter Name="CODESPECIALIDAD" Type="Int32" />
            <asp:Parameter Name="HORARIO" Type="String" />
            <asp:Parameter Name="IMAGEN" Type="String" />
            <asp:Parameter Name="ESTADO" Type="Boolean" />
            <asp:Parameter Name="USERNAME" Type="String" />
            <asp:Parameter Name="PASSWORD" Type="String" />
            <asp:Parameter Name="TIPO" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Panel>

    <script>
        $(document).ready(function () {
            $('.datepicker').datepicker({
                format: 'yyyy-mm-dd',
                autoclose: true,
                todayHighlight: true
            });
        });
    </script>
    </asp:Content>

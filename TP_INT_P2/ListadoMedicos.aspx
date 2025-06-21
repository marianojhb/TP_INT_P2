<%@ Page Title="Listado de Médicos | TUP" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoMedicos.aspx.cs" Inherits="TP_INT_P2.ListadoMedicos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        th {
            text-align:center !important;
        }
        .imagenMedico {
              border-radius: 50% !important;
              width: 150px !important;
              height: 150px !important;
            }
        .profilepicDiv
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="contenidoListadoMedicos" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Listado de Médicos</h2>
    <p style="text-align: center"><asp:Label ID="paginaBloqueada" runat="server" Text=""></asp:Label></p>
<asp:Panel ID="panelContenidoListadoMedicos" runat="server" CssClass="mx-auto w-75 border p-3">
    <asp:Button ID="btnAgregarMedico" runat="server" Text="Agregar Médico" OnClick="btnAgregarMedico_Click" Visible="False" />
    
    <asp:ScriptManager ID="ScriptManager1" runat="server" />


        <asp:ListView ID="lvMedicos" runat="server" 
            DataSourceID="SqlDataSource1" 
            OnPagePropertiesChanging="lvMedicos_PagePropertiesChanging"     
            OnItemEditing="lvMedicos_ItemEditing"
            OnItemUpdating="lvMedicos_ItemUpdating"
            OnItemCanceling="lvMedicos_ItemCanceling" 
            OnItemDeleting="lvMedicos_ItemDeleting"
            OnItemDeleted="lvMedicos_ItemDeleted"
            DataKeyNames="dni_P" 
            OnItemUpdated="lvMedicos_ItemUpdated"
            >
            <%--DataKeyNames="dni_P"--%>
        <ItemTemplate>
            <div class="col-md-4 mb-4">
                <div class="card-deck">

                <div class="card">
                    <div class="profilepicDiv">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("imagen_M") %>' OnClick="ImageButton1_Click" CssClass="card-img-top imagenMedico shadow mt-3" AlternateText="Imagen de perfil" />
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
                            <br />
                            Sexo:
                            <asp:Label ID="sexo_PLabel" runat="server" Text='<%# Eval("sexo_P") %>' />
                            <br />
                            Nacionalidad:
                            <asp:Label ID="nacionalidad_PLabel" runat="server" Text='<%# Eval("nacionalidad_P") %>' />
                            <br />
                            Fecha de Nacimiento:
                            <asp:Label ID="fechaNac_PLabel" runat="server" Text='<%# Eval("fechaNac_P", "{0:dd/MM/yyyy}") %>' />
                            <br />
                            Dirección:
                            <asp:Label ID="direccion_PLabel" runat="server" Text='<%# Eval("direccion_P") %>' />
                            <br />
                            Localidad:
                            <asp:Label ID="nombre_LLabel" runat="server" Text='<%# Eval("nombre_L") %>' />
                             <asp:HiddenField ID="hfIdLocalidad" runat="server" Value='<%# Eval("idLocalidad_P") %>' />
                            <br />
                            Provincia:
                            <asp:Label ID="nombre_PROVLabel" runat="server" Text='<%# Eval("nombre_PROV") %>' />
                             <asp:HiddenField ID="hfIdProvincia" runat="server" Value='<%# Eval("idProvincia_P") %>' />
                            <br />
                            Email:
                            <asp:Label ID="email_PLabel" runat="server" Text='<%# Eval("email_P") %>' />
                            <br />
                            Teléfono:
                            <asp:Label ID="telefono_PLabel" runat="server" Text='<%# Eval("telefono_P") %>' />
                            <br />
                            Especialidad:
                            <asp:Label ID="nombre_ELabel" runat="server" Text='<%# Eval("nombre_E") %>' />
                            <asp:HiddenField ID="hfCodEspecialidad" runat="server" Value='<%# Eval("codEspecialidad_M") %>' />
                        </p>
                    </div>
                    <div class="card-footer text-center">
                        <asp:Button ID="DeleteButton" runat="server" 
                            Text="Eliminar" CommandName="Delete"
                            OnClientClick="return confirm('¿Está seguro que desea eliminar?');"
                            CssClass="btn btn-danger me-2" />
                        <asp:Button ID="EditButton" runat="server" 
                            Text="Editar" CommandName="Edit" 
                            CssClass="btn btn-primary" />
                    </div>

                </div>

            </div>
            </div>
        </ItemTemplate>
        <EditItemTemplate>
            <div class="col-md-4 mb-4">
                <div class="card-deck">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">
                            <div class="profilepicDiv">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("imagen_M") %>' OnClick="ImageButton1_Click" CssClass="card-img-top imagenMedico shadow" AlternateText="Imagen de perfil" />
                            </div>
                    </div>
                    <div class="card-body">
                        <p class="card-text">

                            <div class="mb-3">
                                <label for="fuImagenURL" class="form-label">
                                    Imagen:
                                </label>
                                <asp:FileUpload ID="fuImagenURL" runat="server" CssClass="form-control" />
                            </div>
                            

                            <div class="mb-3">
                                <label for="nombre_PTextBox" class="form-label">
                            Nombre:
                                </label>
                            <asp:TextBox ID="nombre_PTextBox" runat="server" Text='<%# Bind("nombre_P") %>'  CssClass="form-control"/>
                            </div>

                            <div class="mb-3">
                                <label for="nombre_PTextBox" class="form-label">
                                    Apellido:
                               </label>
                                <asp:TextBox ID="apellido_PTextBox" runat="server" Text='<%# Bind("apellido_P") %>'  CssClass="form-control"/>
                            </div>

                            <div class="mb-3">
                                <label for="legajo_MLabel" class="form-label">
                                Legajo:
                               </label>
                            <asp:Label ID="legajo_MLabel" runat="server" Text='<%# Eval("legajo_M") %>'  CssClass="form-control"/>
                            </div>

                            <div class="mb-3">
                                <label for="legajo_MLabel" class="form-label">
                                    DNI:
                                </label>
                                <asp:Label ID="dni_PLabel" runat="server" Text='<%# Eval("dni_P") %>'  CssClass="form-control"/>
                            </div>

                            <div class="mb-3">
                                <label for="sexo_PTextBox" class="form-label">
                            Sexo:
                                    
                                </label>
                            <asp:TextBox ID="sexo_PTextBox" runat="server" Text='<%# Bind("sexo_P") %>' CssClass="form-control" />
                            </div>

                            <div class="mb-3">
                                <label for="nacionalidad_PTextBox" class="form-label">
                            Nacionalidad:
                                    
                                </label>
                            <asp:TextBox ID="nacionalidad_PTextBox" runat="server" Text='<%# Bind("nacionalidad_P") %>'  CssClass="form-control"/>
                            </div>


                            <div class="mb-3">
                                <label for="fechaNac_PTextBox" class="form-label">
                            Fecha de Nacimiento:
                                    
                                </label>
                            <asp:TextBox ID="fechaNac_PTextBox" runat="server" Text='<%# Bind("fechaNac_P", "{0:dd/MM/yyyy}") %>'  CssClass="form-control"/>
                            </div>



                            <div class="mb-3">
                                <label for="direccion_PTextBox" class="form-label">
                                    
                            Dirección:
                                </label>
                            <asp:TextBox ID="direccion_PTextBox" runat="server" Text='<%# Bind("direccion_P") %>'  CssClass="form-control"/>
                            </div>


                            <div class="mb-3">
                                <label for="idLocalidad_PTextBox" class="form-label">
                            Localidad:
                                    
                                </label>
                            <asp:TextBox ID="idLocalidad_PTextBox" runat="server" Text='<%# Bind("idLocalidad_P") %>'  CssClass="form-control"/>
                            </div>

                            <div class="mb-3">
                                <label for="idProvincia_PTextBox" class="form-label">
                            Provincia:
                                    
                                </label>
                            <asp:TextBox ID="idProvincia_PTextBox" runat="server" Text='<%# Bind("idProvincia_P") %>' CssClass="form-control"/>
                            </div>

                            <div class="mb-3">
                                <label for="email_PTextBox" class="form-label">
                            Email:
                                    
                                </label>
                            <asp:Label ID="email_PTextBox" runat="server" Text='<%# Eval("email_P") %>'  CssClass="form-control"/>
                            </div>


                            <div class="mb-3">
                                <label for="telefono_PTextBox" class="form-label">
                            Teléfono:
                                    
                                </label>
                            <asp:TextBox ID="telefono_PTextBox" runat="server" Text='<%# Bind("telefono_P") %>'  CssClass="form-control"/>
                            </div>



                            <div class="mb-3">
                                <label for="codEspecialidad_MTextBox" class="form-label">
                            Especialidad:
                                    
                                </label>
                            <asp:TextBox ID="codEspecialidad_MTextBox" runat="server" Text='<%# Bind("codEspecialidad_M") %>'  CssClass="form-control"/>
                            </div>


                        </p>
                    </div>
                    <div class="card-footer text-center">
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Cancelar" CssClass="btn btn-secondary" />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                            Text="Actualizar" CssClass="btn btn-primary me-2" />
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
                <div class="d-flex justify-content-center mt-3">
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="3">
                        <Fields>
                           <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" LastPageText="Última" FirstPageText="Primera" NextPageText="Siguiente" PreviousPageText="Anterior" />
                        </Fields>
                    </asp:DataPager>

                </div>

            </LayoutTemplate>

    </asp:ListView>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BDClinicaConnectionString %>" 
        DeleteCommand="SP_INACTIVARMEDICO" 
        DeleteCommandType="StoredProcedure" 
        SelectCommand="SP_SELECCIONARMEDICO" 
        SelectCommandType="StoredProcedure" 
        UpdateCommand="SP_UPDATEMEDICO" 
        UpdateCommandType="StoredProcedure"
        >
        <DeleteParameters>
            <asp:Parameter Name="dni_P" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="dni_P" Type="String" />
            <asp:Parameter Name="nombre_P" Type="String" />
            <asp:Parameter Name="apellido_P" Type="String" />
            <asp:Parameter Name="sexo_P" Type="Char" />
            <asp:Parameter Name="nacionalidad_P" Type="String" />
            <asp:Parameter Name="fechaNac_P" DbType="Date" />
            <asp:Parameter Name="direccion_P" Type="String" />
            <asp:Parameter Name="idProvincia_P" Type="Int32" />
            <asp:Parameter Name="idLocalidad_P" Type="Int32" />
            <%--<asp:Parameter Name="email_P" Type="String" />--%>
            <asp:Parameter Name="telefono_P" Type="String" />
            <asp:Parameter Name="codEspecialidad_M" Type="Int32" />
            <asp:Parameter Name="horario_M" Type="String" />
            <asp:Parameter Name="imagen_M" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Panel>

    <!-- Toast de Exito -->
    <asp:Panel ID="pnlExito" runat="server" Visible="false">
        <div class="toast-container position-fixed bottom-0 end-0 p-3" style="z-index: 1080;">
            <div class="toast align-items-center text-bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="d-flex">
                    <div class="toast-body">
                        <strong>¡Éxito!</strong> El registro se eliminó correctamente.
                    </div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Cerrar"></button>
                </div>
            </div>
        </div>
    </asp:Panel>
    <!-- Toast de Exito actualizacion-->
    <asp:Panel ID="pnlExitoUpdate" runat="server" Visible="false">
        <div class="toast-container position-fixed bottom-0 end-0 p-3" style="z-index: 1080;">
            <div class="toast align-items-center text-bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="d-flex">
                    <div class="toast-body">
                        <strong>¡Éxito!</strong> El registro se actualizó correctamente.
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
                        <strong>¡Error!</strong> Ocurrió un problema.
                    </div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Cerrar"></button>
                </div>
            </div>
        </div>
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

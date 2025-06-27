<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MisHorarios.aspx.cs" Inherits="TP_INT_P2.MisHorarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .checkDeshabilitado {
            accent-color: var(--bs-success) !important;
            cursor: not-allowed;
            pointer-events: none;
        }
        .checkHabilitado {
            accent-color: var(--bs-success);
            cursor:auto;
            pointer-events: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <!-- Título -->
    <div class="text-center mb-4">
        <i class="fa-solid fa-calendar-days fa-3x text-primary mb-2"></i>
        <h2 class="fw-bold">Mis Horarios</h2>
        <p class="text-muted">Gestioná tus horarios.</p>
    </div>



    <div class="container d-flex justify-content-center align-items-center" >
    <asp:Panel ID="Panel1" runat="server" CssClass="mx-auto p-4 shadow rounded anchopanel">
    <asp:GridView ID="gvHorarios" runat="server" AutoGenerateColumns="False"  DataKeyNames="hora_H"
    OnRowEditing="gvHorarios_RowEditing" OnRowUpdating="gvHorarios_RowUpdating" OnRowCancelingEdit="gvHorarios_RowCancelingEdit" CellPadding="20" GridLines="None">
    <Columns>
         <asp:CommandField ShowEditButton="True" EditText="Editar" UpdateText="Actualizar" CancelText="Cancelar">
                <ItemStyle Width="180px" />
                <HeaderStyle Width="180px" />
             </asp:CommandField>
        <asp:BoundField DataField="hora_H" HeaderText="Hora" ReadOnly="True" DataFormatString="{0} hs"/>

        <asp:TemplateField HeaderText="Lunes">
            <ItemTemplate>
                <asp:CheckBox ID="chkLunes" runat="server" Checked='<%# Convert.ToBoolean(Eval("lunes_disponible")) %>' CssClass="checkDeshabilitado" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:CheckBox ID="chkLunes" runat="server" Checked='<%# Convert.ToBoolean(Eval("lunes_disponible")) %>' CssClass="checkHabilitado" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Martes">
            <ItemTemplate>
                <asp:CheckBox ID="chkMartes" runat="server" Checked='<%# Convert.ToBoolean(Eval("martes_disponible")) %>'  CssClass="checkDeshabilitado"/>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:CheckBox ID="chkMartes" runat="server" Checked='<%# Convert.ToBoolean(Eval("martes_disponible")) %>' CssClass="checkHabilitado" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Miercoles">
            <ItemTemplate>
                <asp:CheckBox ID="chkMiercoles" runat="server" Checked='<%# Convert.ToBoolean(Eval("miercoles_disponible")) %>'  CssClass="checkDeshabilitado" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:CheckBox ID="chkMiercoles" runat="server" Checked='<%# Convert.ToBoolean(Eval("miercoles_disponible")) %>' CssClass="checkHabilitado" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Jueves">
            <ItemTemplate>
                <asp:CheckBox ID="chkJueves" runat="server" Checked='<%# Convert.ToBoolean(Eval("jueves_disponible")) %>' CssClass="checkDeshabilitado" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:CheckBox ID="chkJueves" runat="server" Checked='<%# Convert.ToBoolean(Eval("jueves_disponible")) %>' CssClass="checkHabilitado" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Viernes">
            <ItemTemplate>
                <asp:CheckBox ID="chkViernes" runat="server" Checked='<%# Convert.ToBoolean(Eval("viernes_disponible")) %>' CssClass="checkDeshabilitado" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:CheckBox ID="chkViernes" runat="server" Checked='<%# Convert.ToBoolean(Eval("viernes_disponible")) %>' CssClass="checkHabilitado" />
            </EditItemTemplate>
        </asp:TemplateField>
        
    </Columns>
</asp:GridView>
        </asp:Panel>
 </div>
    <script>
        let checkboxes = document.querySelectorAll[".checkDeshabilitado"];
        for (check in checkboxes) {

        }
    </script>
</asp:Content>

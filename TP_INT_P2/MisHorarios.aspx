<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MisHorarios.aspx.cs" Inherits="TP_INT_P2.MisHorarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Mis Horarios</h2>

    <div class="container d-flex justify-content-center align-items-center" >
    <asp:Panel ID="Panel1" runat="server" CssClass="mx-auto p-4 shadow rounded anchopanel">
    <asp:GridView ID="gvHorarios" runat="server" AutoGenerateColumns="False"  DataKeyNames="hora_H"
    OnRowEditing="gvHorarios_RowEditing" OnRowUpdating="gvHorarios_RowUpdating" OnRowCancelingEdit="gvHorarios_RowCancelingEdit" CellPadding="20" GridLines="None">
    <Columns>
         <asp:CommandField ShowEditButton="True"  >
                <ItemStyle Width="150px" />
                <HeaderStyle Width="150px" />
             </asp:CommandField>
        <asp:BoundField DataField="hora_H" HeaderText="Hora" ReadOnly="True" DataFormatString="{0} hs"/>

        <asp:TemplateField HeaderText="Lunes">
            <ItemTemplate>
                <asp:CheckBox ID="chkLunes" runat="server" Checked='<%# Convert.ToBoolean(Eval("lunes_disponible")) %>' Enabled="false" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:CheckBox ID="chkLunes" runat="server" Checked='<%# Convert.ToBoolean(Eval("lunes_disponible")) %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Martes">
            <ItemTemplate>
                <asp:CheckBox ID="chkMartes" runat="server" Checked='<%# Convert.ToBoolean(Eval("martes_disponible")) %>' Enabled="false" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:CheckBox ID="chkMartes" runat="server" Checked='<%# Convert.ToBoolean(Eval("martes_disponible")) %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Miercoles">
            <ItemTemplate>
                <asp:CheckBox ID="chkMiercoles" runat="server" Checked='<%# Convert.ToBoolean(Eval("miercoles_disponible")) %>' Enabled="false" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:CheckBox ID="chkMiercoles" runat="server" Checked='<%# Convert.ToBoolean(Eval("miercoles_disponible")) %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Jueves">
            <ItemTemplate>
                <asp:CheckBox ID="chkJueves" runat="server" Checked='<%# Convert.ToBoolean(Eval("jueves_disponible")) %>' Enabled="false" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:CheckBox ID="chkJueves" runat="server" Checked='<%# Convert.ToBoolean(Eval("jueves_disponible")) %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Viernes">
            <ItemTemplate>
                <asp:CheckBox ID="chkViernes" runat="server" Checked='<%# Convert.ToBoolean(Eval("viernes_disponible")) %>' Enabled="false" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:CheckBox ID="chkViernes" runat="server" Checked='<%# Convert.ToBoolean(Eval("viernes_disponible")) %>' />
            </EditItemTemplate>
        </asp:TemplateField>
        
    </Columns>
</asp:GridView>
        </asp:Panel>
 </div>
</asp:Content>

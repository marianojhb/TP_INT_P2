<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TP_INT_P2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ListView ID="ListView1" runat="server" 
        OnPagePropertiesChanged="ListView1_PagePropertiesChanged" 
        OnSelectedIndexChanged="ListView1_SelectedIndexChanged"></asp:ListView>
</asp:Content>

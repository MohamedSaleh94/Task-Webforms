<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MoSalehTask.Admin.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <br />
        <a class="btn btn-primary" href="/Admin/CreateTask">CreateTask
        </a>
        <a class="btn btn-default" href="/Admin/Search">Search
        </a>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" CssClass="table tab-content table-responsive table-striped">
        </asp:GridView>
    </div>




</asp:Content>

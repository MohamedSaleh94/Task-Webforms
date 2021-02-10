<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="MoSalehTask.Admin.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="form-horizontal">
        <h4>Search Criteria 
        </h4>
        <hr />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="AssignedTo" CssClass="col-md-2 control-label">AssignedTo</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList runat="server" CssClass="form-control " DataTextField="UserName" DataValueField="Id" ID="AssignedTo"></asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Status" CssClass="col-md-2 control-label">Status</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList runat="server" CssClass="form-control " DataTextField="UserName" DataValueField="Id" ID="Status"></asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" Text="Search" CssClass="btn btn-default" OnClick="Search_Click" />
            </div>
        </div>
    </div>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" CssClass="table tab-content table-responsive table-striped">
        <Columns>
            <asp:HyperLinkField DataTextField="Id" 
                                HeaderText="Details"
                                DataNavigateUrlFormatString="http://localhost:57541/Admin/Edit.aspx?task={0}"
                                Target="_blank" NavigateUrl="~/About.aspx"
                                DataNavigateUrlFields="Id"/>
        </Columns>
    </asp:GridView>
</asp:Content>

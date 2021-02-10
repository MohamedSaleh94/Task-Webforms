<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="MoSalehTask.UserTask.Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="form-horizontal">
        <h4>Task Details</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="TaskTitle" CssClass="col-md-2 control-label">Title</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="TaskTitle" Enabled="False" CssClass="form-control" />
            </div>
        </div>
       
         <div class="form-group">
            <asp:Label runat="server"  CssClass="col-md-2 control-label">Attachment File</asp:Label>
            <div class="col-md-10">
                <asp:HyperLink ID="HyperLink1" Target="_blank" runat="server">Attachment</asp:HyperLink>
            </div>
        </div>
          <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="AssignedTo" CssClass="col-md-2 control-label">AssignedTo</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="AssignedTo" Enabled="False" CssClass="form-control" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="AssignedDate" CssClass="col-md-2 control-label">AssignedDate</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="AssignedDate" Enabled="False" CssClass="form-control" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Description" CssClass="col-md-2 control-label">Description</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Description" Enabled="False" CssClass="form-control" TextMode="MultiLine" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Status" CssClass="col-md-2 control-label">Status</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList runat="server" CssClass="form-control "  DataTextField="UserName" DataValueField="Id"  ID="Status"></asp:DropDownList>
            </div>
        </div>
     
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" ID="EditStatus"  Visible="False" Text="Edit Status For Task" CssClass="btn btn-default" OnClick="UpdateTask_Click"   />
            </div>
        </div>
    </div>
</asp:Content>

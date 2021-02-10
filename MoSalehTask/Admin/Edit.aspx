<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="MoSalehTask.Admin.Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="form-horizontal">
        <h4>Edit a Task</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="TaskTitle" CssClass="col-md-2 control-label">Title</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="TaskTitle" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="TaskTitle"
                                            CssClass="text-danger" ErrorMessage="The title field is required." />
            </div>
        </div>
          <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="AssignedTo" CssClass="col-md-2 control-label">AssignedTo</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList runat="server" CssClass="form-control "  DataTextField="UserName" DataValueField="Id"   ID="AssignedTo"></asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Description" CssClass="col-md-2 control-label">Description</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Description" CssClass="form-control" TextMode="MultiLine" />
            </div>
        </div>
    

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server"  Text="Edit Task" CssClass="btn btn-default" OnClick="EditTask_Click" />
            </div>
        </div>
    </div>
     <script>
         //$(".datepicker").datepicker();
    </script>
</asp:Content>

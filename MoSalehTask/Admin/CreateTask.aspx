<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateTask.aspx.cs" Inherits="MoSalehTask.Admin.CreateTask" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new Task</h4>
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
            <asp:Label runat="server" AssociatedControlID="Attachment" CssClass="col-md-2 control-label">Attachment File</asp:Label>
            <div class="col-md-10">
                <asp:FileUpload runat="server" ID="Attachment" CssClass="form-control " />
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
                <asp:Button runat="server"  Text="Create Task" CssClass="btn btn-default" OnClick="CreateTask_Click" />
            </div>
        </div>
    </div>
     <script>
         //$(".datepicker").datepicker();
    </script>
</asp:Content>

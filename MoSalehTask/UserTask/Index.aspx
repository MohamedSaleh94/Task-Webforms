<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MoSalehTask.UserTask.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">   <br/>
        <h2 class="text-danger">
            Tasks Assigned 3 Days Earlier And Still New
        </h2>
        <asp:GridView ID="GridView2" runat="server" CssClass="tab-content table-responsive table-striped">
        </asp:GridView>
    <br/>
    <br/>
        <h2>
            List of my Assigned Tasks
        </h2>
        <asp:GridView ID="GridView1" runat="server" CssClass="table tab-content table-responsive table-striped">
            <Columns>
                <asp:HyperLinkField DataTextField="Id" 
                    HeaderText="Details"
                    DataNavigateUrlFormatString="http://localhost:57541/UserTask/TaskDetails.aspx?task={0}"
                    Target="_blank" NavigateUrl="~/About.aspx"
                                    DataNavigateUrlFields="Id"/>
            </Columns>
        </asp:GridView>
    </div>
   
</asp:Content>

<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="JPS_web.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="container">
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>

        <div class="col-md-6">
            <div class="form">
                <h4>Create a new account</h4>
                <hr />
                <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="PremisesNumber" CssClass="control-label">Premises No. (7 digits)</asp:Label>
                    <asp:TextBox runat="server" ID="PremisesNumber" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="PremisesNumber"
                        CssClass="text-danger" ErrorMessage="The Premises No. field is required." />
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Email" CssClass="control-label">Email</asp:Label>
                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                        CssClass="text-danger" ErrorMessage="The email field is required." />
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Password" CssClass="control-label">Password</asp:Label>
                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                        CssClass="text-danger" ErrorMessage="The password field is required." />
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="control-label">Confirm password</asp:Label>
                    <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                    <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                </div>
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-success" />
            </div>
        </div>
        <div class="col-md-6">
            <br />
            <br />
            <img class="sidebar-image" src="Images/JPS-Man.png" />
        </div>
    </div>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Depsit.aspx.cs" Inherits="NCB_web.Teller.Depsit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <br />
        <br />
        <div class="col-md-12">
            <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
            <div class="col-md-6 login-form-2">
                <h3>Deposit Form</h3>
                <div class="form-group">
                    <asp:DropDownList class="form-control" ID="ddlDeposit" runat="server" DataTextField="AccountNumber" DataValueField="AccountNumber" />
                    <asp:RequiredFieldValidator ID="ddlDepositRequiredField" runat="server" ErrorMessage="Customer account is required" ControlToValidate="ddlDeposit"/>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtamount" runat="server" Placeholder="Amount" class="form-control" TextMode="SingleLine"/>
                    <asp:RequiredFieldValidator ID="txtamountRequiredField" runat="server" ErrorMessage="Amount is required." ControlToValidate="txtamount"/>
                </div>
                <div class="form-group">
                    <asp:Button ID="btndeposit" class="btnSubmit " runat="server" Text="Deposit" BackColor="Yellow" CausesValidation="true" OnClick="btndeposit_Click" />
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="lblResult" ForeColor="Yellow" />
                </div>
            </div>
            <div class="col-md-6">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Teller/deposit.png" />
            </div>
        </div>
    </div>

</asp:Content>

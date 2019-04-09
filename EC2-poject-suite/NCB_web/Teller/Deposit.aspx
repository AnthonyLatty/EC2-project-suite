<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Deposit.aspx.cs" Inherits="NCB_web.Teller.Deposit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <div class="container">
        <div class="col-md-12">
            <asp:Label runat="server" ID="lblResult" Visible="false" CssClass="alert alert-success col-md-12" />
            <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
            <br />
            <br />
            <div class="col-md-6" style="border: 1px solid rgba(0,0,0,.125);">
                <h3>Deposit Form</h3>
                <div class="form-group">
                    <asp:DropDownList class="form-control" ID="ddlDeposit" runat="server" BackColor="White" DataTextField="AccountNumber" DataValueField="AccountNumber" />
                    <asp:RequiredFieldValidator ID="ddlDepositRequiredField" runat="server" ErrorMessage="Please select Customer account" ControlToValidate="ddlDeposit" />
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtamount" runat="server" Placeholder="Amount" class="form-control" TextMode="SingleLine" />
                    <asp:RequiredFieldValidator ID="txtamountRequiredField" runat="server" ErrorMessage="Amount is required" ControlToValidate="txtamount" />
                </div>
                <div class="form-group">
                    <asp:Button ID="btndeposit" class="btnSubmit " runat="server" Text="Deposit to this account" CssClass="btn btn-success" CausesValidation="true" OnClick="btndeposit_Click" />
                </div>
            </div>
            <div class="col-md-6">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/deposit.png" />
            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Withdraw.aspx.cs" Inherits="NCB_web.Teller.Withdraw" %>

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
                <h3>Withdraw Form</h3>
                <div class="form-group">
                    <asp:DropDownList class="form-control" ID="ddlWithdraw" runat="server" DataTextField="AccountNumber" DataValueField="AccountNumber" />
                    <asp:RequiredFieldValidator ID="ddlWithdrawRequiredField" runat="server" ErrorMessage="Please select account to withdraw" ControlToValidate="ddlWithdraw" />
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtamount" runat="server" Placeholder="Amount" class="form-control" TextMode="SingleLine" />
                    <asp:RequiredFieldValidator ID="txtamountRequiredField" runat="server" ErrorMessage="Amount is required" ControlToValidate="txtamount" />
                </div>
                <div class="form-group">
                    <asp:Button ID="btndeposit" class="btnSubmit " runat="server" Text="Withdraw from this account" CssClass="btn btn-success" OnClick="btndeposit_Click" />
                </div>
            </div>
            <div class="col-md-6">
                <asp:Image ID="Image1" runat="server" Height="350" ImageUrl="~/Images/Withdraw.png" />
            </div>
        </div>
    </div>
</asp:Content>

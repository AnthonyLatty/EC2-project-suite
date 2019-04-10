<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCustomerBill.aspx.cs" MasterPageFile="~/Site.Master" Inherits="JPS_web.Account.Admin.AddCustomerBill" %>

<%@ Register Src="~/DatepickerUserControl.ascx" TagPrefix="uc1" TagName="DatePicker" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent" ID="BodyContent">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <section id="loginForm">
                    <div class="form-horizontal">
                        <br />
                        <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="CusEmail" CssClass="control-label" Text="Customer ID (email)" />
                            <asp:DropDownList ID="CusEmail" runat="server" CssClass="form-control" DataSourceID="CustomerSqlDataSource" DataTextField="Id" DataValueField="PremisesNumber" />
                            <asp:SqlDataSource runat="server" ID="CustomerSqlDataSource" ConnectionString='<%$ ConnectionStrings:JPSContext %>' SelectCommand="SELECT [Id], [PremisesNumber] FROM [Customers]" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="CusEmail" CssClass="text-danger" ErrorMessage="Customer Email is Required." />
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="billStatus" CssClass="control-label" Text="Bill Status" />
                            <asp:DropDownList ID="billStatus" runat="server" CssClass="form-control" DataSourceID="BillStatusSqlDataSource" DataTextField="StatusName" DataValueField="StatusID" />
                            <asp:SqlDataSource runat="server" ID="BillStatusSqlDataSource" ConnectionString='<%$ ConnectionStrings:JPSContext %>' SelectCommand="SELECT [StatusName], [StatusID] FROM [BillStatus]" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="billStatus" CssClass="text-danger" ErrorMessage="Customer Email is Required." />
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="tbAddress" CssClass="control-label" Text="Address" />
                            <asp:TextBox runat="server" ID="tbAddress" CssClass="form-control" TextMode="SingleLine" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbAddress" CssClass="text-danger" ErrorMessage="Address is required" />
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="tbamount" CssClass="control-label" Text="Bill Amount" />
                            <asp:TextBox runat="server" ID="tbamount" CssClass="form-control" TextMode="SingleLine" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbamount" CssClass="text-danger" ErrorMessage="Amount is required" />
                        </div>
                        <div class="form-group">
                            <uc1:DatePicker runat="server" ID="DatePicker" />
                        </div>

                        <asp:Button runat="server" ID="Submit" Text="Insert" OnClick="Submit_Click" CssClass="btn btn-success" />
                        <asp:Button runat="server" Text="Cancel" CausesValidation="false" CssClass="btn btn-danger" OnClick="CancelButton_Click" />
                    </div>
                </section>
            </div>
        </div>
    </div>
</asp:Content>

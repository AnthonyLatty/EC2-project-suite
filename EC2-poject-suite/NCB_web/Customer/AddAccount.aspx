﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddAccount.aspx.cs" Inherits="NCB_web.Customer.AddAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <div class="row">
            <div class="col-md-8">
                <section id="loginForm">
                    <div class="form-horizontal">
                        <h4>Open an account with us, we are looking forward to serving you.</h4>
                        <hr />
                        <br />
                        <asp:ValidationSummary runat="server" CssClass="text-danger" />
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="DDacc" CssClass="col-md-2 control-label" Text="Account Type" />
                            <div class="col-md-10">
                                <asp:DropDownList ID="DDacc" runat="server" DataSourceID="SqlDataSource1" DataTextField="AccountName" DataValueField="AccountTID"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT * FROM [AccountTypes]"></asp:SqlDataSource>
                                <asp:EntityDataSource runat="server" ID="EntityDataSource1"></asp:EntityDataSource>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="DDacc"
                                    CssClass="text-danger" ErrorMessage="Please Select an Account type" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button runat="server" ID="btnAdd" OnClick="btnAdd_Click" Text="Open this Account" CssClass="btn btn-success" />
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>

</asp:Content>

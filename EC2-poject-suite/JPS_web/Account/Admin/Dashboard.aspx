﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Dashboard.aspx.cs" Inherits="JPS_web.Account.Admin.Dashboard" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <h3>Manage Customer's Bill</h3>
                <asp:ValidationSummary ShowModelStateErrors="true" runat="server" ForeColor="Red" />
                <asp:GridView
                    ID="GridViewCustomerBill"
                    DataKeyNames="BillId" 
                    AllowPaging="true" 
                    PageSize="5"
                    ItemType="JPS_web.Models.CustomerBill"
                    runat="server"
                    AutoGenerateColumns="false"
                    ShowFooter="true"
                    SelectMethod="CustomerBill_GetData"
                    UpdateMethod="CustomerBill_UpdateItem"
                    DeleteMethod="CustomerBill_DeleteItem"
                    AutoGenerateEditButton="true"
                    AutoGenerateDeleteButton="true">
                    <Columns>
                        <asp:DynamicField DataField="BillId" />
                        <asp:DynamicField DataField="BillGenerationDate" />
                        <asp:DynamicField DataField="BillDueDate" />
                        <asp:DynamicField DataField="PremisesNumber" />
                        <asp:DynamicField DataField="CustomerId" />
                        <asp:DynamicField DataField="Address" />
                        <asp:DynamicField DataField="Amount" />
                    </Columns>
                </asp:GridView>
                <br />
                <asp:HyperLink NavigateUrl="AddCustomerBill.aspx" Text="Add New Customer Bill" CssClass="btn btn-primary" runat="server" />
            </div>
        </div>
    </div>

</asp:Content>

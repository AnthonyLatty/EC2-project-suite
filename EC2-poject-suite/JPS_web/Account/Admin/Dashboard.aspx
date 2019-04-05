﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Dashboard.aspx.cs" Inherits="JPS_web.Account.Admin.Dashboard" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3>Manage Customer's Bill</h3>
                <asp:ValidationSummary ShowModelStateErrors="true" runat="server" CssClass="alert alert-danger" />
                <asp:Label runat="server" Text="Filter Bill Status:" />
                <asp:DropDownList runat="server" AutoPostBack="true" ID="DisplayBillStatus">
                    <asp:ListItem Text="All" Value="" />
                    <asp:ListItem Text="Pending" />
                    <asp:ListItem Text="Paid" />
                </asp:DropDownList>
                <br />
                <br />
                <asp:GridView
                    CssClass="table table-hover table-bordered"
                    UseAccessibleHeader="true"
                    GridLines="None"
                    ID="GridViewCustomerBill"
                    DataKeyNames="BillId"
                    AllowPaging="true"
                    PageSize="5"
                    ItemType="JPS_web.Models.Bill"
                    runat="server"
                    AutoGenerateColumns="false"
                    ShowFooter="false"
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
                        <asp:DynamicField DataField="Status" />
                        <asp:DynamicField DataField="Address" />
                        <asp:DynamicField DataField="Amount" />
                    </Columns>
                </asp:GridView>
                <br />
                <asp:HyperLink NavigateUrl="AddCustomerBill.aspx" Text="Add New Customer Bill" CssClass="btn btn-primary" runat="server" />
            </div>
            <div class="col-md-12">
                <h3>Current Customer's</h3>
                <asp:GridView 
                    ID="CurrentCustomerGridView" 
                    DataKeyNames="Id" 
                    ItemType="JPS_web.Models.Customer" 
                    SelectMethod="CurrentCustomerGridView_GetData" 
                    AutoGenerateColumns="false"
                    PageSize="5"
                    AllowPaging="true"
                    ShowFooter="false"
                    runat="server" 
                    CssClass="table table-hover table-bordered"
                    UseAccessibleHeader="true"
                    GridLines="None">
                    <Columns>
                        <asp:DynamicField DataField="Id" />
                        <asp:DynamicField DataField="Email" />
                        <asp:DynamicField DataField="PremisesNumber" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>

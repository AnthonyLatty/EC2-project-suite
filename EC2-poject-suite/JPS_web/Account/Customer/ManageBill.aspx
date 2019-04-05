<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageBill.aspx.cs" MasterPageFile="~/Site.Master" Inherits="JPS_web.Account.Customer.ManageBill" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3>Pending Bills</h3>
                <asp:GridView 
                    runat="server"
                    ID="PendingBillsGridView" 
                    ItemType="JPS_web.Models.Bill" 
                    DataKeyNames="BillId"
                    SelectMethod="PendingBillsGridView_GetData"
                    CssClass="table table-hover table-bordered"
                    UseAccessibleHeader="true" 
                    AutoGenerateColumns="false" 
                    ShowFooter="false"
                    GridLines="None" 
                    AllowPaging="true"
                    PageSize="5">
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
            </div>
        </div>
    </div>

</asp:Content>

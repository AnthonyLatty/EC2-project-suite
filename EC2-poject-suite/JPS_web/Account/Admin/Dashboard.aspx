<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Dashboard.aspx.cs" Inherits="JPS_web.Account.Admin.Dashboard" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3>Manage Customer's Bill</h3>
                
            </div>
            <div class="col-md-12">
                <h3>Current Customer's</h3>
                <%--<asp:GridView 
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
                </asp:GridView>--%>
            </div>
        </div>
    </div>

</asp:Content>

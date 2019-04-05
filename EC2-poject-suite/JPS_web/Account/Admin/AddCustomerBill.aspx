<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCustomerBill.aspx.cs" MasterPageFile="~/Site.Master" Inherits="JPS_web.Account.Admin.AddBill" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent" ID="BodyContent">

    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <br />
                <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="alert alert-danger" />
                <asp:FormView
                    runat="server"
                    ID="addBillForm"
                    ItemType="JPS_web.Models.Bill"
                    DefaultMode="Insert"
                    InsertMethod="AddBillForm_InsertItem"
                    RenderOuterTable="true"
                    OnItemInserted="AddBillForm_ItemInserted">
                    <InsertItemTemplate>
                        <div class="col-md-8">
                            <div class="form">
                                <div class="form-group">
                                    <h6>Generation Date</h6>
                                    <asp:DynamicControl runat="server" DataField="BillGenerationDate" Mode="Insert" />
                                </div>
                                <div class="form-group">
                                    <h6>Due Date</h6>
                                    <asp:DynamicControl runat="server" DataField="BillDueDate" Mode="Insert" />
                                </div>
                                <div class="form-group">
                                    <h6>Customer ID</h6>
                                    <asp:DynamicControl runat="server" DataField="CustomerId" Mode="Insert" />
                                    <%--<asp:DropDownList ID="ddlCustomerID" runat="server" DataSourceID="CustomerIDSqlDataSource" DataTextField="Id" DataValueField="Id" />
                                    <asp:SqlDataSource runat="server" ID="CustomerIDSqlDataSource" ConnectionString='<%$ ConnectionStrings:JPSContext %>' SelectCommand="SELECT [Id] FROM [Customers]">--%>
                                </div>
                                <div class="form-group">
                                    <h6>Premises No.</h6>
                                    <asp:DynamicControl runat="server" DataField="PremisesNumber" Mode="Insert" />
                                </div>
                                <div class="form-group">
                                    <h6>Bill Status</h6>
                                    <asp:DynamicControl runat="server" DataField="Status" Mode="Insert" />
                                </div>
                                <div class="form-group">
                                    <h6>Address</h6>
                                    <asp:DynamicControl runat="server" DataField="Address" Mode="Insert" />
                                </div>
                                <div class="form-group">
                                    <h6>Amount</h6>
                                    <asp:DynamicControl runat="server" DataField="Amount" Mode="Insert" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <asp:Button runat="server" Text="Insert" CommandName="Insert" CssClass="btn btn-success" />
                            <asp:Button runat="server" Text="Cancel" CausesValidation="false" CssClass="btn btn-danger" OnClick="CancelButton_Click" />
                        </div>
                    </InsertItemTemplate>
                </asp:FormView>
            </div>
        </div>
    </div>

</asp:Content>

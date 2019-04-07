<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageBill.aspx.cs" MasterPageFile="~/Site.Master" Inherits="JPS_web.Account.Customer.ManageBill" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:SqlDataSource ID="PendingBillsSqlDataSource" runat="server" DataSourceMode="DataSet" />
    <div class="container">
        <div class="row">
            <h3 style="text-align: center;">Pending Bills</h3>
            <hr style="width: 400px;" />
            <asp:Repeater ID="PendingBillsRepeater" DataSourceID="PendingBillsSqlDataSource" runat="server" OnItemCommand="PendingBillsRepeater_ItemCommand">
                <ItemTemplate>
                    <div class="col-md-4">
                        <div class="card" style="border: 1px solid rgba(0,0,0,.125);">
                            <img src="../../Images/PendingBills.jpg" style="width: 300px; margin-left: 13%;" class="card-img-top" />
                            <hr />
                            <div class="card-body" style="margin: 10px;">
                                <p class="card-title">
                                    <label>Bill ID: </label>
                                    <asp:Label ID="lblBillID" Font-Bold="true" runat="server" Text='<%# Eval("BillId") %>' />
                                </p>
                                <p class="card-title">
                                    <label>Customer Email: </label>
                                    <asp:Label ID="lblCustomerId" runat="server" Font-Bold="true" Text='<%# Eval("Id") %>' />
                                </p>
                                <p class="card-text">
                                    <label>Generation Date: </label>
                                    <asp:Label ID="lblBillGenerationDate" runat="server" Font-Bold="true" Text='<%# Eval("BillGenerationDate") %>' />
                                </p>
                                <p class="card-text">
                                    <label>Due Date: </label>
                                    <asp:Label ID="lblBillDueDate" runat="server" Font-Bold="true" Text='<%# Eval("BillDueDate") %>' />
                                </p>
                                <p class="card-text">
                                    <label>Premises No: </label>
                                    <asp:Label ID="lblPremisesNumber" runat="server" Font-Bold="true" Text='<%# Eval("PremisesNumber") %>' />
                                </p>
                                <p class="card-text">
                                    <label>Bill Status: </label>
                                    <asp:Label ID="lblBillStatus" runat="server" Font-Bold="true" Text='<%# Eval("BillStatus").ToString() %>' />
                                </p>
                                <p class="card-text">
                                    <label>Address: </label>
                                    <asp:Label ID="lblAddress" runat="server" Font-Bold="true" Text='<%# Eval("Address") %>' />
                                </p>
                                <p class="card-text">
                                    <label>Amount: </label>
                                    <asp:Label ID="lblAmount" runat="server" Font-Bold="true" Font-Size="Medium" ForeColor="Green" Text='<%# String.Format("{0:C} JMD", Eval("Amount")) %>' />
                                </p>
                                <p style="text-align: center;">
                                    <asp:Button ID="btnPayBill" runat="server" Text="Pay bill" CssClass="btn btn-success" Width="330" CommandName="Redirect" />
                                </p>
                            </div>
                        </div>
                        <br />
                        <br />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>


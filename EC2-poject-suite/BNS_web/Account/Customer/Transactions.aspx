<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Transactions.aspx.cs" Inherits="BNS_web.Account.Customers.Transactions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <br />
        <div class="row">
            <h3 style="text-align: center;">Transactions</h3>
            <hr style="width: 400px;" />
            <asp:Repeater ID="RepterDetails" OnItemCommand="RepterDetails_ItemCommand" runat="server">
                <ItemTemplate>
                    <div class="col-md-4">
                        <div class="card" style="border: 1px solid rgba(0,0,0,.125);">
                            <div class="card-body" style="margin: 10px;">
                                <p class="card-text">
                                    <label>Account Balance: </label>
                                    <asp:Label ID="lblBalance" ForeColor="Green" Font-Bold="true" runat="server" Text='<%#Eval("balance","{0:c}") %>' /></h2>
                                </p>
                                <p class="card-text">
                                    <label>Acount Type: </label>
                                    <asp:Label ID="lblAcountType" runat="server" Text='<%#Eval("actype") %>' />
                                </p>
                                <p class="card-text">
                                    <label>Account No: </label>
                                    <asp:Label ID="lblAccountNumber" runat="server" Text='<%#Eval("acc") %>' />
                                </p>
                                <p style="text-align: center">
                                    <asp:Button ID="btnTransactions" class="btn btn-primary" runat="server" CommandName="cmd_trans" CommandArgument='<%#Eval("acc") %>' Text="View Transactions" />
                                </p>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-md-12">
                <h3>Transaction Details</h3>
                <table class="table table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>Account Number</th>
                            <th>Amount</th>
                            <th>Details</th>
                            <th>Date</th>
                            <th>Type</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <tr <%# FormatColorRow(DataBinder.Eval(Container.DataItem,"Type").ToString()) %>  >
                                    <td>
                                        <asp:Label ID="lblAccnum" runat="server" ForeColor="White" Text='<%#Eval("accnum") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblAcctype" runat="server" ForeColor="White" Text='<%#Eval("amount") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" ForeColor="White" Text='<%#Eval("details") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblDate" runat="server" ForeColor="White" Text='<%#Eval("date") %>' Font-Bold="true" />
                                    </td>
                                    <td style="color: white;">
                                         <%# DataBinder.Eval(Container.DataItem,"Type").ToString() %>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

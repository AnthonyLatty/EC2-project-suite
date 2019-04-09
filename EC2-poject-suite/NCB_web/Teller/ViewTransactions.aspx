﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewTransactions.aspx.cs" Inherits="NCB_web.Teller.ViewTransactions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Function to search table --%>
    <script>
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>


    <div class="container">
        <div class="col-md-12">
            <h3>View all Transactions</h3>
            <input id="SearchInput" type="text" placeholder="Search..">
            <br>
            <br>
            <table class="table table-hover table-bordered">
                <thead>
                    <tr>
                        <th>Full Name</th>
                        <th>Account Number</th>
                        <th>Amount</th>
                        <th>Details</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody id="TableDetails">
                    <asp:Repeater ID="RepterDetails" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label ID="lblfname" runat="server" Text='<%#Eval("fullname") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="lblAccnum" runat="server" Text='<%#Eval("accnum") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="lblAcctype" runat="server" Text='<%#Eval("amount") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="lblbalance" runat="server" Text='<%#Eval("details") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("date") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>

</asp:Content>

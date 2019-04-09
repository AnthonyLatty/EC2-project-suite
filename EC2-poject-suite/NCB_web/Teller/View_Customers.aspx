<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View_Customers.aspx.cs" Inherits="NCB_web.Teller.View_Customers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Function to search table --%>
    <script>
        $(document).ready(function () {
            $("#SearchInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#TableDetails tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>

    <div class="container">
        <div class="col-md-12">
            <h3>View all Customers</h3>
            <input id="SearchInput" type="text" placeholder="Search..">
            <br>
            <br>
            <table class="table table-hover table-bordered">
                <thead>
                    <tr>
                        <th>Full Name</th>
                        <th>Account Number</th>
                        <th>Account Type</th>
                        <th>Balance ($JMD)</th>
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
                                    <asp:Label ID="lblAccnum" runat="server" Text='<%#Eval("ACC") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="lblAcctype" runat="server" Text='<%#Eval("Atype") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="lblbalance" runat="server" Text='<%#Eval("balance","{0:c}") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>

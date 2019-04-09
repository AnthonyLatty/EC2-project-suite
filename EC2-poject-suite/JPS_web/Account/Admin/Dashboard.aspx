﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Dashboard.aspx.cs" Inherits="JPS_web.Account.Admin.Dashboard" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });

    </script>
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>



    <div class="container body-content">
        <h1>Manage Customer's Bill</h1>
        <style>
            .hiddencol {
                display: none;
            }
        </style>

        <div class="row">
            <div class="col-sm-12 table-responsive">
                <asp:TextBox ID="myInput1" runat="server" placeholder="Search.."></asp:TextBox>
                <br>
                <br>
                <asp:GridView ID="GridView1" runat="server" AutoPostBack="True" CssClass="table table-bordered table-striped table-condensed"
                    AutoGenerateColumns="False" DataKeyNames="BillId" DataSourceID="SqlDataSource1" AutoGenerateDeleteButton="true" AutoGenerateEditButton="true" CellPadding="4" ForeColor="#333333" GridLines="None">

                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="BillId" HeaderText="Bill Id" ReadOnly="true" InsertVisible="False" SortExpression="BillId"></asp:BoundField>
                        <asp:BoundField DataField="Id" HeaderText="User Name" ReadOnly="true" SortExpression="Uname"></asp:BoundField>

                        <asp:BoundField DataField="BillGenerationDate" HeaderText="Creation Date" ReadOnly="true" DataFormatString="{0:MM/dd/yyyy}" SortExpression="BillGenerationDate"></asp:BoundField>
                        <asp:BoundField DataField="BillDueDate" HeaderText="Due Date" ReadOnly="true" DataFormatString="{0:MM/dd/yyyy}" SortExpression="BillDueDate"></asp:BoundField>
                        <asp:BoundField DataField="PremisesNumber" HeaderText="Premises Number" SortExpression="PremisesNumber"></asp:BoundField>
                        <asp:BoundField DataField="StatusName" ReadOnly="true" HeaderText="Bill Status" SortExpression="BillStatus"></asp:BoundField>
                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address"></asp:BoundField>
                        <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="{0:c}" SortExpression="Amount"></asp:BoundField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF"></EditRowStyle>

                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

                    <RowStyle BackColor="#EFF3FB"></RowStyle>

                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                </asp:GridView>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:JPSContext %>' SelectCommand="SELECT Bills.BillId, Customers.UserName,Bills.Id, Bills.BillGenerationDate, Bills.BillDueDate, Bills.PremisesNumber, BillStatus.StatusName, Bills.Address, Bills.Amount FROM Bills INNER JOIN Customers ON Bills.Id = Customers.Id INNER JOIN BillStatus ON Bills.BillStatus = BillStatus.StatusID"
                    DeleteCommand="Delete from Bills WHERE BillId= @BillId;"
                    UpdateCommand="UPDATE [Bills] SET [Address] = @Address, [Amount] = @Amount, [PremisesNumber]= @PremisesNumber WHERE [Bills].[BillId] = @BillId">
                    <DeleteParameters>
                        <asp:Parameter Name="BillId"></asp:Parameter>
                    </DeleteParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <asp:HyperLink NavigateUrl="AddCustomerBill.aspx" Text="Add New Customer Bill" CssClass="btn btn-primary" runat="server" />

        <div class="row">
            <h2>Current Customers</h2>
            <p>Type something in the input field to search the table for first names, last names or emails:</p>
            <input id="myInput" type="text" placeholder="Search..">
            <br>
            <br>
            <table>
                <thead>
                    <tr>
                        <th>User Name</th>
                        <th>Full Name</th>
                        <th>Premises Number</th>
                    </tr>
                </thead>
                <tbody id="myTable">
                    <asp:Repeater ID="RepeaterDetails" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label ID="lbluname" runat="server" Text='<%#Eval("UserName") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="lblfname" runat="server" Text='<%#Eval("FirstName") %>' />
                                    <asp:Label ID="lblname" runat="server" Text='<%#Eval("LastName") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="lblpremnum" runat="server" Text='<%#Eval("PremisesNumber") %>' />
                                </td>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>

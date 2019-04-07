<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewTransactions.aspx.cs" Inherits="NCB_web.Teller.ViewTransactions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
   

<!------ Include the above in your HEAD tag ---------->


<h2>View all Transactions</h2>
<p>Type something in the input field to search the table for ():</p>  
<input id="myInput" type="text" placeholder="Search..">
<br><br>

<table>
  <thead>
    <tr>
      <th>Full Name</th>
      <th>Account Number</th>
      <th>Amount</th>
      <th>Details</th>
      <th>Date</th>
    </tr>
  </thead>
  <tbody id="myTable">
    
    <asp:Repeater ID="RepterDetails" runat="server">  
   <ItemTemplate>
       <tr>
      <td><asp:Label ID="lblfname" runat="server" Text='<%#Eval("fullname") %>' Font-Bold="true"/></td>
      <td><asp:Label ID="lblAccnum" runat="server" Text='<%#Eval("accnum") %>' Font-Bold="true"/></td>
      <td><asp:Label ID="lblAcctype" runat="server" Text='<%#Eval("amount") %>' Font-Bold="true"/></td>
      <td><asp:Label ID="lblbalance" runat="server" Text='<%#Eval("details") %>' Font-Bold="true"/></td>
      <td><asp:Label ID="Label1" runat="server" Text='<%#Eval("date") %>' Font-Bold="true"/></td>
    </tr>
     </ItemTemplate>  
    </asp:Repeater>  
  </tbody>
</table>
  
<p>Note that we start the search in tbody, to prevent filtering the table headers.</p>
</asp:Content>

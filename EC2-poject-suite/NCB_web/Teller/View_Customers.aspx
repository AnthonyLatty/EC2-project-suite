<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View_Customers.aspx.cs" Inherits="NCB_web.Teller.View_Customers" %>
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


<h2>View all Customers</h2>
<p>Type something in the input field to search the table for first names, last names or emails:</p>  
<input id="myInput" type="text" placeholder="Search..">
<br><br>

<table>
  <thead>
    <tr>
      <th>Full Name</th>
      <th>Account Number</th>
      <th>Account Type</th>
      <th>Balance ($JMD)</th>
    </tr>
  </thead>
  <tbody id="myTable">
    
    <asp:Repeater ID="RepterDetails" runat="server">  
   <ItemTemplate>
       <tr>
      <td><asp:Label ID="lblfname" runat="server" Text='<%#Eval("fullname") %>' Font-Bold="true"/></td>
      <td><asp:Label ID="lblAccnum" runat="server" Text='<%#Eval("ACC") %>' Font-Bold="true"/></td>
      <td><asp:Label ID="lblAcctype" runat="server" Text='<%#Eval("Atype") %>' Font-Bold="true"/></td>
      <td><asp:Label ID="lblbalance" runat="server" Text='<%#Eval("balance","{0:c}") %>' Font-Bold="true"/></td>
    </tr>
     </ItemTemplate>  
    </asp:Repeater>  
  </tbody>
</table>
  
<p>Note that we start the search in tbody, to prevent filtering the table headers.</p>
</asp:Content>

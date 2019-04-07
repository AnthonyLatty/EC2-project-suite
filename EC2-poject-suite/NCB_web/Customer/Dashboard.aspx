<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="NCB_web.Customer.Dashboard" %>
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
    <style>
        @import url(http://fonts.googleapis.com/css?family=Lato:400,700);
body
{
    font-family: 'Lato', 'sans-serif';
    }
.profile 
{
    min-height: 355px;
    display: inline-block;
    }
figcaption.ratings
{
    margin-top:20px;
    }
figcaption.ratings a
{
    color:#f1c40f;
    font-size:11px;
    }
figcaption.ratings a:hover
{
    color:#f39c12;
    text-decoration:none;
    }
.divider 
{
    border-top:1px solid rgba(0,0,0,0.1);
    }
.emphasis 
{
    border-top: 4px solid transparent;
    }
.emphasis:hover 
{
    border-top: 4px solid #1abc9c;
    }
.emphasis h2
{
    margin-bottom:0;
    }
span.tags 
{
    background: #1abc9c;
    border-radius: 2px;
    color: #f5f5f5;
    font-weight: bold;
    padding: 2px 4px;
    }
.dropdown-menu 
{
    background-color: #34495e;    
    box-shadow: none;
    -webkit-box-shadow: none;
    width: 250px;
    margin-left: -125px;
    left: 50%;
    }
.dropdown-menu .divider 
{
    background:none;    
    }
.dropdown-menu>li>a
{
    color:#f5f5f5;
    }
.dropup .dropdown-menu 
{
    margin-bottom:10px;
    }
.dropup .dropdown-menu:before 
{
    content: "";
    border-top: 10px solid #34495e;
    border-right: 10px solid transparent;
    border-left: 10px solid transparent;
    position: absolute;
    bottom: -10px;
    left: 50%;
    margin-left: -10px;
    z-index: 10;
    }
    </style>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
    <br />
      <br />
    <div class="container">
	<div class="row">
		<div class="col-md-offset-2 col-md-8 col-lg-offset-3 col-lg-6">
    	 <div class="well profile" style="background-color: blue;">
            <div class="col-sm-12">
                <div class="col-xs-12 col-sm-8">
                    <h2><asp:Label ID="lblname" ForeColor="White" runat="server" Text="Label"></asp:Label> </h2>
                    <br />
                    <p><strong ><asp:Label ID="Label3" ForeColor="White" runat="server" Text="Address"></asp:Label> </strong> <asp:Label ID="lbladr" ForeColor="White" runat="server" Text="Label"></asp:Label> </p>
                    
                </div>             
                <div class="col-xs-12 col-sm-4 text-center">
                    <figure>
                        <img src="http://www.localcrimenews.com/wp-content/uploads/2013/07/default-user-icon-profile.png" alt="" class="img-circle img-responsive">
                        
                    </figure>
                </div>
            </div>            
            <div class="col-xs-12 divider text-center">
                <asp:Repeater ID="RepterDetails" onitemcommand="RepterDetails_ItemCommand" runat="server">  
                 <ItemTemplate>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong> <asp:Label ID="lblfname" ForeColor="White" runat="server" Text='<%#Eval("balance","{0:c}") %>' Font-Bold="true"/></strong></h2>                    
                    <p><small><asp:Label ID="Label1" ForeColor="White" runat="server" Text='<%#Eval("actype") %>' Font-Bold="true"/> <asp:Label ID="Label2" runat="server" Text='<%#Eval("acc") %>' Font-Bold="true" ForeColor="White"/></small></p>
                   <asp:Button ID="Button1" class="btn btn-success btn-block" runat="server" BackColor="Yellow" ForeColor="Black"  CommandName="cmd_trans" CommandArgument='<%#Eval("acc") %>'   Text="View Transactions" />
              </div>

                    </ItemTemplate>  
              </asp:Repeater>  
                    </div>
              </div>
    	 </div>                 
		</div>
	</div>
     <div align="center">
    <p>
     <asp:Button ID="Button2" runat="server"  class="btn btn-primary" data-toggle="collapse" align="center"  href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1" Text="Open Transactions Tray" />
     

</p>
         </div>
             
<div class="row">
  <div class="col">
    <div class="collapse multi-collapse" id="multiCollapseExample1">
      <div class="card card-body">
        <table>
  <thead>
    <tr>
    
      <th>Account Number</th>
      <th>Amount</th>
      <th>Details</th>
      <th>Date</th>
    </tr>
  </thead>
  <tbody id="myTable">
    
    <asp:Repeater ID="Repeater1" runat="server">  
   <ItemTemplate>
       <tr>
    
      <td><asp:Label ID="lblAccnum" runat="server" Text='<%#Eval("accnum") %>' /></td>
      <td><asp:Label ID="lblAcctype" runat="server" Text='<%#Eval("amount") %>' /></td>
      <td><asp:Label ID="lblbalance" runat="server" Text='<%#Eval("details") %>' /></td>
      <td><asp:Label ID="Label1" runat="server" Text='<%#Eval("date") %>' Font-Bold="true"/></td>
    </tr>
     </ItemTemplate>  
    </asp:Repeater>  
  </tbody>
</table>
      </div>
    </div>
  </div>
  </div>

<p>Note that we start the search in tbody, to prevent filtering the table headers.</p>
    <script>  $('.collapse').collapse()</script>
</asp:Content>

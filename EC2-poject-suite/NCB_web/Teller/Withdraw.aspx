<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Withdraw.aspx.cs" Inherits="NCB_web.Teller.Withdraw" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <style>
       .login-container{
    margin-top: 5%;
    margin-bottom: 5%;
}
.login-form-1{
    padding: 5%;
    box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
}
.login-form-1 h3{
    text-align: center;
    color: #333;
}
.login-form-2{
    padding: 5%;
    background: #0062cc;
    box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
}
.login-form-2 h3{
    text-align: center;
    color: #fff;
}
.login-container form{
    padding: 10%;
}
.btnSubmit
{
    width: 50%;
    border-radius: 1rem;
    padding: 1.5%;
    border: none;
    cursor: pointer;
}
.login-form-1 .btnSubmit{
    font-weight: 600;
    color: #fff;
    background-color: #0062cc;
}
.login-form-2 .btnSubmit{
    font-weight: 600;
    color: #0062cc;
    background-color: #fff;
}
.login-form-2 .ForgetPwd{
    color: #fff;
    font-weight: 600;
    text-decoration: none;
}
.login-form-1 .ForgetPwd{
    color: #0062cc;
    font-weight: 600;
    text-decoration: none;
}
/* Dropdown Button */
.dropbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #ddd;}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {display: block;}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {background-color: #3e8e41;}

   </style>
    <br />
     <br />
     <br />
    <br />
    <br />
    <div class="container">
    <div class="form-group">

    <div class="col-sm-2">
     
    </div>
    <div class="col-sm-5">
     
          
               <div class="col-md-6 login-form-2" style="width:600px">
                    <h3>Withdraw Form</h3>
                    
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="ddWithdraw" runat="server"  DataTextField="AccountNumber" DataValueField="AccountNumber">
                      
                   </asp:DropDownList>
                  
               </div>
                        <div class="form-group">
                         <asp:TextBox ID="tbamount" runat="server" Placeholder="Amount" class="form-control"  TextMode="SingleLine"></asp:TextBox>   
                        </div>
                        <div class="form-group">
                           <asp:Button ID="btndeposit" class="btnSubmit " runat="server" Text="Withdraw" BackColor="Yellow" onclick="btndeposit_Click"/> 
                        </div>
                        <div class="form-group">

                           
                        </div>
                    
                </div>
            </div>
      
    <div class="col-sm-3">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Teller/Withdraw.png" />
       
    </div>
 </div>
         </div>

</asp:Content>

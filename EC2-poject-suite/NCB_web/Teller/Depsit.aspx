<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Depsit.aspx.cs" Inherits="NCB_web.Teller.Depsit" %>
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
                    <h3>Deposit Form</h3>
                    
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="ddDeposit" runat="server"  DataTextField="AccountNumber" DataValueField="AccountNumber">
                      
                   </asp:DropDownList>
                  
               </div>
                        <div class="form-group">
                         <asp:TextBox ID="tbamount" runat="server" Placeholder="Amount" class="form-control"  TextMode="SingleLine"></asp:TextBox>   
                        </div>
                        <div class="form-group">
                           <asp:Button ID="btndeposit" class="btnSubmit " runat="server" Text="Deposit" BackColor="Yellow" onclick="btndeposit_Click"/> 
                        </div>
                        <div class="form-group">

                           
                        </div>
                    
                </div>
            </div>
      
    <div class="col-sm-3">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Teller/deposit.png" />
       
    </div>
 </div>
         </div>


</asp:Content>

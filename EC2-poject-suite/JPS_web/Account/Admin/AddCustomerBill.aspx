<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCustomerBill.aspx.cs" MasterPageFile="~/Site.Master" Inherits="JPS_web.Account.Admin.AddCustomerBill" %>
<%@ Register Src="~/DatepickerUserControl.ascx" TagPrefix="uc1" TagName="DatePicker" %>  
<asp:Content runat="server" ContentPlaceHolderID="MainContent" ID="BodyContent">

    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <br />
                <h4>Create Customer Bill</h4>
                <hr />
                <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="CusEmail" CssClass="control-label">Customer ID (email)</asp:Label>
                    <asp:DropDownList ID="CusEmail" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="Id" DataValueField="PremisesNumber"></asp:DropDownList>
                   
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:JPSContext %>' SelectCommand="SELECT [Id], [PremisesNumber] FROM [Customers]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="CusEmail"
                        
                        CssClass="text-danger" ErrorMessage="Customer Email is Required." />
                </div>
                 <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="billStatus" CssClass="control-label">Bill Status</asp:Label>
                    <asp:DropDownList ID="billStatus" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="StatusName" DataValueField="StatusID"></asp:DropDownList>
                   
                     <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:JPSContext %>' SelectCommand="SELECT [StatusName], [StatusID] FROM [BillStatus]"></asp:SqlDataSource>
                     <asp:RequiredFieldValidator runat="server" ControlToValidate="billStatus"
                        
                        CssClass="text-danger" ErrorMessage="Customer Email is Required." />
                </div>
                <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="tbAddress" CssClass="col-md-2 control-label">Address</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbAddress" CssClass="form-control" TextMode="MultiLine" Width="280px" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbAddress"
                    CssClass="text-danger" ErrorMessage="Address is required" />
            </div>
                       <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="tbamount" CssClass="col-md-2 control-label">Bill Amount</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbamount" CssClass="form-control" TextMode="SingleLine" Width="280px" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbamount"
                    CssClass="text-danger" ErrorMessage="Amount is required" />
            </div>
              <uc1:DatePicker runat="server" id="DatePicker" /> 
                
                      
                            
                             <asp:Button runat="server" id="Submit" Text="Insert" OnClick="Submit_Click" CssClass="btn btn-success" />
                            <asp:Button runat="server" Text="Cancel" CausesValidation="false" CssClass="btn btn-danger" OnClick="CancelButton_Click" />
                        
                   </div> 
            </div>
        </div>
        </div>
        </div>
  

</asp:Content>
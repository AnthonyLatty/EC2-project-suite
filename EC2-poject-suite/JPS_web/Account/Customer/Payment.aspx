<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" MasterPageFile="~/Site.Master" Inherits="JPS_web.Account.Customer.Payment" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <%--<asp:Label runat="server" ID="lblTest" />--%>

    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <br />
                <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="alert alert-danger" />
                <asp:FormView
                    runat="server"
                    ID="PaymentForm"
                    ItemType="JPS_web.Models.Transaction"
                    DefaultMode="Insert" 
                    InsertMethod="PaymentForm_InsertItem" 
                    OnItemInserted="PaymentForm_ItemInserted"
                    RenderOuterTable="true">
                    <InsertItemTemplate>
                        <form>
                            <div class="form-group">
                                <asp:DynamicEntity runat="server" Mode="Insert" />
                            </div>
                            <asp:Button runat="server" Text="Pay now" CommandName="Insert" CssClass="btn btn-success" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CausesValidation="false" CssClass="btn btn-danger" OnClick="btnCancel_Click" />
                        </form>
                    </InsertItemTemplate>
                </asp:FormView>
            </div>
            <div class="col-md-4">
                <img src="../../Images/PaymentBill.png" style="width: 300px;"/>
            </div>
        </div>
    </div>

</asp:Content>

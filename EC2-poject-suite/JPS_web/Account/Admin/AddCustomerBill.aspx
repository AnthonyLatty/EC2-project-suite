<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCustomerBill.aspx.cs" MasterPageFile="~/Site.Master" Inherits="JPS_web.Account.Admin.AddBill" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent" ID="BodyContent">

    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <br />
                <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="alert alert-danger"/>
                <asp:FormView
                    runat="server"
                    ID="addBillForm"
                    ItemType="JPS_web.Models.Bill"
                    DefaultMode="Insert"
                    InsertMethod="AddBillForm_InsertItem"
                    RenderOuterTable="true"
                    OnItemInserted="AddBillForm_ItemInserted">
                    <InsertItemTemplate>
                        <form>
                            <div class="form-group">
                                <asp:DynamicEntity runat="server" Mode="Insert" />
                            </div>
                             <asp:Button runat="server" Text="Insert" CommandName="Insert" CssClass="btn btn-success" />
                            <asp:Button runat="server" Text="Cancel" CausesValidation="false" CssClass="btn btn-danger" OnClick="CancelButton_Click" />
                        </form>
                    </InsertItemTemplate>
                </asp:FormView>
            </div>
        </div>
    </div>

</asp:Content>

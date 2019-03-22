<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCustomerBill.aspx.cs" MasterPageFile="~/Site.Master" Inherits="JPS_web.Account.Admin.AddBill" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent" ID="BodyContent">

    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <asp:ValidationSummary runat="server" ShowModelStateErrors="true" ForeColor="Red" />
                <asp:FormView
                    runat="server"
                    ID="addBillForm"
                    ItemType="JPS_web.Models.CustomerBill"
                    DefaultMode="Insert"
                    InsertMethod="addBillForm_InsertItem"
                    RenderOuterTable="true"
                    OnItemInserted="addBillForm_ItemInserted">
                    <InsertItemTemplate>
                        <fieldset>
                            <ol>
                                <asp:DynamicEntity runat="server" Mode="Insert" />
                            </ol>
                            <asp:Button runat="server" Text="Insert" CommandName="Insert" CssClass="btn btn-success" />
                            <asp:Button runat="server" Text="Cancel" CausesValidation="false" CssClass="btn btn-danger" OnClick="cancelButton_Click" />
                        </fieldset>
                    </InsertItemTemplate>
                </asp:FormView>
            </div>
        </div>
    </div>

</asp:Content>

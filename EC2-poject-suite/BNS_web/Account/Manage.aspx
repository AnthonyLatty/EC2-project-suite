<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="BNS_web.Account.Manage" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div>
            <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
                <p class="text-success"><%: SuccessMessage %></p>
            </asp:PlaceHolder>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="form-horizontal">
                    <h4>Change your account settings</h4>
                    <hr />
                    <dl class="dl-horizontal">
                        <dt>Password:</dt>
                        <dd>
                            <asp:HyperLink NavigateUrl="/Account/ManagePassword" CssClass="btn btn-warning" Text="Change Password" Visible="false" ID="ChangePassword" runat="server" />
                            <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Create]" Visible="false" ID="CreatePassword" runat="server" />
                        </dd>
                    </dl>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

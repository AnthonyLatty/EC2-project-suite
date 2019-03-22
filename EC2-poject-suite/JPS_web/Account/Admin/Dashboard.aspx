<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Dashboard.aspx.cs" Inherits="JPS_web.Account.Admin.Dashboard" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="col-md-8">
        <div class="row">
            <h3>CRUD a Customer's Bill</h3>
            <asp:GridView ID="GridViewCustomerBill" runat="server" DataKeyNames="BillID" AutoGenerateColumns="false" ShowFooter="true" DataSourceID="JPSCustomerBillEntities">
                <Columns>
                    <%-- BillID --%>
                    <asp:TemplateField>
                        <HeaderTemplate>Bill ID</HeaderTemplate>
                        <ItemTemplate><%#Eval("BillID") %></ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtBillID" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorBillID" runat="server" ErrorMessage="Bill ID required" ControlToValidate="txtBillID" ForeColor="Red" Display="Static" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <%-- Bill Created Date --%>
                    <asp:TemplateField>
                        <HeaderTemplate>Bill Creation Date</HeaderTemplate>
                        <ItemTemplate><%#Eval("BillCreated") %></ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtBillCreated" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorBillCreated" runat="server" ErrorMessage="Bill creation required" ControlToValidate="txtBillCreated" ForeColor="Red" Display="Static" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <%-- Bill Due Date --%>
                    <asp:TemplateField>
                        <HeaderTemplate>Bill Due Date</HeaderTemplate>
                        <ItemTemplate><%#Eval("BillDue") %></ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtBillDue" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorBillDue" runat="server" ErrorMessage="Bill due required" ControlToValidate="txtBillDue" ForeColor="Red" Display="Static" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <%-- Premises Number --%>
                    <asp:TemplateField>
                        <HeaderTemplate>Premises Number</HeaderTemplate>
                        <ItemTemplate><%#Eval("PremisesNumber") %></ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtPremisesNumber" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPremisesNumber" runat="server" ErrorMessage="Premises number required" ControlToValidate="txtPremisesNumber" ForeColor="Red" Display="Static" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <%-- Customer ID --%>
                    <asp:TemplateField>
                        <HeaderTemplate>Customer ID</HeaderTemplate>
                        <ItemTemplate><%#Eval("CustomerId") %></ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtCustomerID" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCustomerID" runat="server" ErrorMessage="Customer ID required" ControlToValidate="txtCustomerID" ForeColor="Red" Display="Static" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <%-- Bill Address --%>
                    <asp:TemplateField>
                        <HeaderTemplate>Bill Address</HeaderTemplate>
                        <ItemTemplate><%#Eval("BillAddress") %></ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtBillAddress" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorBillAddress" runat="server" ErrorMessage="Bill Address required" ControlToValidate="txtBillAddress" ForeColor="Red" Display="Static" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <%-- Amount --%>
                    <asp:TemplateField>
                        <HeaderTemplate>Amount</HeaderTemplate>
                        <ItemTemplate><%#Eval("Amount") %></ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAmount" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorAmount" runat="server" ErrorMessage="Amount required" ControlToValidate="txtAmount" ForeColor="Red" Display="Static" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>

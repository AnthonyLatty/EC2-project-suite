<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageBill.aspx.cs" MasterPageFile="~/Site.Master" Inherits="JPS_web.Account.Customer.ManageBill" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <script>
        function openModal() {
            $('#PaymentModal').modal('show');
        }


        function CardNumValidation(sender, args) {
            var str = document.getElementById("<%=tbcardnum.ClientID %>").value;

            var res = str.slice(0, 4);
            var result1 = res.localeCompare("9505");
            var result2 = res.localeCompare("4001");

            if ((result1 != 0) && (result2 != 0)) {
                sender.innerHTML = "Please Enter a Valid Card Number";

                args.IsValid = false;
            }

            else {
                args.IsValid = true;
            }

        }
    </script>


    <div class="container">
        <div class="row">
            <h3 style="text-align: center;">Pending Bills</h3>
            <hr style="width: 400px;" />
            <asp:SqlDataSource ID="PendingBillsSqlDataSource" runat="server" DataSourceMode="DataSet" />
            <asp:Repeater ID="PendingBillsRepeater" DataSourceID="PendingBillsSqlDataSource" runat="server" OnItemCommand="PendingBillsRepeater_ItemCommand">
                <ItemTemplate>
                    <div class="col-md-4">
                        <div class="card" style="border: 1px solid rgba(0,0,0,.125);">
                            <img src="../../Images/PendingBills.jpg" style="width: 300px; margin-left: 13%;" class="card-img-top" />
                            <hr />
                            <div class="card-body" style="margin: 10px;">
                                <p class="card-title">
                                    <label>Bill ID: </label>
                                    <asp:Label ID="lblBillID" Font-Bold="true" runat="server" Text='<%# Eval("BillId") %>' />
                                </p>
                                <p class="card-title">
                                    <label>Customer Email: </label>
                                    <asp:Label ID="lblCustomerId" runat="server" Font-Bold="true" Text='<%# Eval("Id") %>' />
                                </p>
                                <p class="card-text">
                                    <label>Generation Date: </label>
                                    <asp:Label ID="lblBillGenerationDate" runat="server" Font-Bold="true" Text='<%# Eval("BillGenerationDate") %>' />
                                </p>
                                <p class="card-text">
                                    <label>Due Date: </label>
                                    <asp:Label ID="lblBillDueDate" runat="server" Font-Bold="true" Text='<%# Eval("BillDueDate") %>' />
                                </p>
                                <p class="card-text">
                                    <label>Premises No: </label>
                                    <asp:Label ID="lblPremisesNumber" runat="server" Font-Bold="true" Text='<%# Eval("PremisesNumber") %>' />
                                </p>
                                <p class="card-text">
                                    <label>Bill Status: </label>
                                    <asp:Label ID="lblBillStatus" runat="server" Font-Bold="true" Text='<%# Eval("BillStatus").ToString() %>' />
                                </p>
                                <p class="card-text">
                                    <label>Address: </label>
                                    <asp:Label ID="lblAddress" runat="server" Font-Bold="true" Text='<%# Eval("Address") %>' />
                                </p>
                                <p class="card-text">
                                    <label>Amount: </label>
                                    <asp:Label ID="lblAmount" runat="server" Font-Bold="true" Font-Size="Medium" ForeColor="Green" Text='<%# String.Format("{0:C} JMD", Eval("Amount")) %>' />
                                </p>
                                <p style="text-align: center;">
                                    <asp:Button ID="btnPayBill" runat="server" Text="Pay bill" CssClass="btn btn-success" Width="330" CommandName="Paybill" />
                                </p>
                            </div>
                        </div>
                        <br />
                        <br />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="row">
            <h3 style="text-align: center;">Bill Payments History</h3>
            <hr style="width: 400px;" />
            <asp:SqlDataSource ID="BillPaymentHistorySqlDataSource" runat="server" DataSourceMode="DataSet" />
            <asp:Repeater ID="BillPaymentHistoryRepeater" DataSourceID="BillPaymentHistorySqlDataSource" runat="server">
                <ItemTemplate>
                    <div class="col-md-4">
                        <div class="card" style="border: 1px solid rgba(0,0,0,.125);">
                            <img src="../../Images/BillPaymentHistory.png" style="width: 300px; margin-left: 10%;" class="card-img-top" />
                            <hr />
                            <div class="card-body" style="margin: 10px;">
                                <p style="text-align: center; font-size: 30px;">
                                    <asp:Label ID="lblPaidBill" runat="server" Text="Paid!" Font-Bold="true" ForeColor="Green"/>
                                </p>
                                <p class="card-title">
                                    <label>Bill ID: </label>
                                    <asp:Label ID="lblBillID" Font-Bold="true" runat="server" Text='<%# Eval("BillId") %>' />
                                </p>
                                <p class="card-title">
                                    <label>Customer Email: </label>
                                    <asp:Label ID="lblCustomerId" runat="server" Font-Bold="true" Text='<%# Eval("Id") %>' />
                                </p>
                                <p class="card-text">
                                    <label>Generation Date: </label>
                                    <asp:Label ID="lblBillGenerationDate" runat="server" Font-Bold="true" Text='<%# Eval("BillGenerationDate") %>' />
                                </p>
                                <p class="card-text">
                                    <label>Due Date: </label>
                                    <asp:Label ID="lblBillDueDate" runat="server" Font-Bold="true" Text='<%# Eval("BillDueDate") %>' />
                                </p>
                                <p class="card-text">
                                    <label>Premises No: </label>
                                    <asp:Label ID="lblPremisesNumber" runat="server" Font-Bold="true" Text='<%# Eval("PremisesNumber") %>' />
                                </p>
                                <p class="card-text">
                                    <label>Bill Status: </label>
                                    <asp:Label ID="lblBillStatus" runat="server" Font-Bold="true" Text='<%# Eval("BillStatus").ToString() %>' />
                                </p>
                                <p class="card-text">
                                    <label>Address: </label>
                                    <asp:Label ID="lblAddress" runat="server" Font-Bold="true" Text='<%# Eval("Address") %>' />
                                </p>
                                <p class="card-text">
                                    <label>Amount: </label>
                                    <asp:Label ID="lblAmount" runat="server" Font-Bold="true" Font-Size="Medium" ForeColor="Green" Text='<%# String.Format("{0:C} JMD", Eval("Amount")) %>' />
                                </p>
                            </div>
                        </div>
                        <br />
                        <br />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <%-- Modal --%>
    <div class="modal fade" id="PaymentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" style="text-align: center;">Payment Details</h5>
                </div>
                <div class="modal-body">
                    <p>
                        Bill ID:&nbsp;
                        <asp:Label ID="lblBillId" runat="server" />
                    </p>
                    <p>
                        Bill Amount:&nbsp;
                        <asp:Label ID="lblBillAmount" runat="server" ForeColor="Green" />
                    </p>
                    <br />
                    <div class="form-group">
                        <div class="form-group">
                            <p>
                                <asp:Label ID="lblCardNumber" runat="server" Font-Bold="true" Text="Card No. (Credit or Debit Card)" />
                            </p>
                            <asp:TextBox ID="tbcardnum" class="form-control" runat="server" ValidationGroup="Verify" placeholder="Enter Valid Card Number" />
                            <asp:RequiredFieldValidator ValidationGroup="Verify" ID="RequiredFieldValidator2"
                                ControlToValidate="tbcardnum"
                                Display="Static"
                                ErrorMessage="Please Enter Card Number"
                                ForeColor="Red"
                                runat="server" />
                            <asp:RegularExpressionValidator CssClass="form-control" ValidationGroup="Verify" ID="RegularExpressionValidator1" runat="server"
                                ErrorMessage="Card numbers are 12 digit long" ForeColor="Red" ControlToValidate="tbcardnum"
                                ValidationExpression="^[0-9]{12}$" />
                            <asp:CustomValidator runat="server" ValidationGroup="Verify" Display="Dynamic" ID="customValidator1" ForeColor="Red" ClientValidationFunction="CardNumValidation" ErrorMessage="" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button class="btn btn-success" ID="btnPaybill" ValidationGroup="Verify" OnClick="btnPaybill_Click" CausesValidation="true" runat="server" Text="Process payment" />
                    <asp:Button ID="btnCancelPayment" runat="server" Text="Cancel" CausesValidation="false" CssClass="btn btn-warning" OnClick="btnCancelPayment_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageBill.aspx.cs" MasterPageFile="~/Site.Master" Inherits="JPS_web.Account.Customer.ManageBill" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <script>
        function openModal() {
            $('#exampleModal').modal('show');
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


    <asp:SqlDataSource ID="PendingBillsSqlDataSource" runat="server" DataSourceMode="DataSet" />
    <div class="container">
        <div class="row">
            <h3 style="text-align: center;">Pending Bills</h3>
            <hr style="width: 400px;" />
            <asp:Repeater ID="PendingBillsRepeater" DataSourceID="PendingBillsSqlDataSource" runat="server" OnItemCommand="Repeater1_ItemCommand">
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
    </div>
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Payment Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h1>Bill ID:&nbsp;<asp:Label ID="lblBillId" runat="server"></asp:Label>
                    </h1>
                    <h1>Bill Amount:&nbsp;<asp:Label ID="lblBillAmount" runat="server"></asp:Label>
                    </h1>
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-8 col-md-6 col-md-offset-0">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <h3 class="text-center">Payment Details</h3>
                                            <img class="img-responsive cc-img" src="http://www.prepbootstrap.com/Content/images/shared/misc/creditcardicons.png">
                                        </div>
                                    </div>
                                    <div class="panel-body">

                                        <div class="row">
                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <label>CARD NUMBER</label>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="fa fa-credit-card"></span></span>
                                                        <asp:TextBox ID="tbcardnum" class="form-control" runat="server" ValidationGroup="Verify" placeholder="Valid Card Number"></asp:TextBox>

                                                        <div class="form-group">
                                                            <asp:RequiredFieldValidator ValidationGroup="Verify" ID="RequiredFieldValidator2"
                                                                ControlToValidate="tbcardnum"
                                                                Display="Static"
                                                                ErrorMessage="Please Enter Card Number"
                                                                ForeColor="Red"
                                                                runat="server" />
                                                        </div>
                                                        <div class="form-group">
                                                            <asp:RegularExpressionValidator ValidationGroup="Verify" ID="RegularExpressionValidator1" runat="server"
                                                                ErrorMessage="Card numbers are 12 digit long" ForeColor="Red" ControlToValidate="tbcardnum"
                                                                ValidationExpression="^[0-9]{12}$"></asp:RegularExpressionValidator>
                                                        </div>
                                                        <asp:CustomValidator runat="server" ValidationGroup="Verify" Display="Dynamic" ID="customValidator1" ForeColor="Red" ClientValidationFunction="CardNumValidation" ErrorMessage="">  
                                                        </asp:CustomValidator>


                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-7 col-md-7">
                                                    <div class="form-group">
                                                        <label><span class="hidden-xs">EXPIRATION</span><span class="visible-xs-inline">EXP</span> DATE</label>
                                                        <input type="tel" class="form-control" placeholder="MM / YY" />
                                                    </div>
                                                </div>
                                                <div class="col-xs-5 col-md-5 pull-right">
                                                    <div class="form-group">
                                                        <label>CV CODE</label>
                                                        <input type="tel" class="form-control" placeholder="CVC" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <div class="form-group">
                                                        <label>CARD OWNER</label>
                                                        <input type="text" class="form-control" placeholder="Card Owner Names" />
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="panel-footer">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <asp:Button class="btn btn-warning btn-lg btn-block" ID="btnPaybill" ValidationGroup="Verify" OnClick="btnPaybill_Click" CausesValidation="true" runat="server" Text="Process payment" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DatepickerUserControl.ascx.cs" Inherits="JPS_web.DatepickerUserControl" %>


<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>


<div class="form-group">
    <div class="col-xs-5 date">
        <div class="input-group input-append date" id="datePicker">
            <asp:Label runat="server" AssociatedControlID="datetimepicker1" CssClass="control-label">Due Date</asp:Label>
            <asp:TextBox ID="datetimepicker1" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="datetimepicker1"
                CssClass="text-danger" ErrorMessage=" Due Date is required" />
            <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#datePicker')
            .datepicker({
                format: 'mm/dd/yyyy'
            })
            .on('changeDate', function (e) {
                // Revalidate the date field
                $('#eventForm').formValidation('revalidateField', 'date');
            });

        $('#eventForm').formValidation({
            framework: 'bootstrap',
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                name: {
                    validators: {
                        notEmpty: {
                            message: 'The name is required'
                        }
                    }
                },
                date: {
                    validators: {
                        notEmpty: {
                            message: 'The date is required'
                        },
                        date: {
                            format: 'MM/DD/YYYY',
                            message: 'The date is not a valid'
                        }
                    }
                }
            }
        });
    });
</script>




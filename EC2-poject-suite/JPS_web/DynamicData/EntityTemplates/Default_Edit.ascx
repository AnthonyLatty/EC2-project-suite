<%@ Control Language="C#" CodeBehind="Default_Edit.ascx.cs" Inherits="JPS_web.Default_EditEntityTemplate" %>

<%@ Reference Control="~/DynamicData/EntityTemplates/Default.ascx" %>
<asp:EntityTemplate runat="server" ID="EntityTemplate1">
    <ItemTemplate>
       <li data-role="fieldcontain" style="list-style-type: none;">
            <asp:Label ID="Label1" runat="server" OnInit="Label_Init" OnPreRender="Label_PreRender" />
            <asp:DynamicControl runat="server" ID="DynamicControl" Mode="Edit" OnInit="DynamicControl_Init" />
        </li>
        
           <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
    </ItemTemplate>
</asp:EntityTemplate>


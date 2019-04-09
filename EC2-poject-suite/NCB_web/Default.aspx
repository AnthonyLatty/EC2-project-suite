<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NCB_web._Default" %>

<asp:Content ID="Banner" ContentPlaceHolderID="Banner" runat="server">
    <img class="home-banner" src="Images/ncb-header.jpg" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h3 class="banner-font">Secure Savings</h3>
                <p class="banner-font">At NCB we offer secure savings accounts that are protected against hackers and other attacks. Come save with us!</p>
                
            </div>
            <div class="col-md-4">
                <h3 class="banner-font">Hassle Free</h3>
                <p class="banner-font">Our online banking system is always available to our valuable customers. Process your accounts in minutes with on the go transactions.</p>
            </div>
            <div class="col-md-4">
                <h3 class="banner-font">Reliability</h3>
                <p class="banner-font">We value YOU our customer and put your needs at the core front of our business.</p>
            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="JPS_web._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <img class="home-banner" src="Images/Powering_tomorrow_header.jpg" />
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h2 class="icon-title">Pay Bills</h2>
                <i class="fa-5x fa fa-usd" aria-hidden="true"></i>
                <p class="banner-font">Pay bills online, always available anywhere at anytime.</p>
            </div>
            <div class="col-md-4">
                <h2 class="icon-title">Energy Solutions</h2>
                <i class="fa-5x fa fa-plug" aria-hidden="true"></i>
                <p class="banner-font">Looking for ways to use electricity more efficiently and reduce costs? We have the answers.</p>
            </div>
            <div class="col-md-4">
                <h2 class="icon-title">Report an Outage</h2>
                <i class="fa-5x fa fa-leaf" aria-hidden="true"></i>
                <p class="banner-font">Let us know if you are without power, and we will make every effort to restore your service as quickly as possible.</p>
            </div>
        </div>
    </div>

</asp:Content>

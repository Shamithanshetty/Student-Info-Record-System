<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/signin.master" AutoEventWireup="true" CodeFile="signin.aspx.cs" Inherits="WebPages_signin" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div class="container" style="border:5px solid black; width:800px;height:400px;">

    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4" style="color:black;">
            <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
            <asp:Label ID="email" runat="server" Text="E-mail"></asp:Label>
            <asp:TextBox ID="emailtxtbx" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="invalid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="emailtxtbx">
         </asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="enter email" ControlToValidate="emailtxtbx"></asp:RequiredFieldValidator>
        <%--<cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender" runat="server" Enabled="True" FilterType="Numbers, UppercaseLetters, LowercaseLetters" FilterMode="ValidChars" ValidChars="/,." TargetControlID="txtLogin">
                                </cc1:FilteredTextBoxExtender>
  <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>--%>
        </div>
       
    </div>
    <br />

    <div class="row">
                <div class="col-md-4"></div>
        <div class="col-md-3" style="color:black;">    
            <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
            <asp:Label ID="password" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="pastxtbx" runat="server"></asp:TextBox>  
           
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="enter password" ControlToValidate="pastxtbx">

            </asp:RequiredFieldValidator>
        </div>
       
    </div>
    <br />




    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
     <ContentTemplate>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4" style="color:black;">
                        <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                            enter the captcha:
            <asp:Label ID="lb1StopSpam" runat="server" Text=" "></asp:Label>
            <asp:TextBox ID="txtStopSpam" runat="server"></asp:TextBox>
            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" OnClick="LinkButton1_Click">
                <i style="font-size:21px;" class="fa fa-refresh"></i>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required field" ControlToValidate="txtStopSpam"></asp:RequiredFieldValidator>
            </asp:LinkButton>

        </div>
    </div>
         </ContentTemplate>
    </asp:UpdatePanel>
    <br />
   <%-- <div class="row" style="text-align:center;color:black";>
    <asp:Label ID="lable" runat="server" Text=""></asp:Label>
         </div>
    <br />
    <br />--%>
    <div class="row" style="text-align:center;">
      <div class="col-md-11">
     <asp:Button ID="signinbtn" cssClass="btn-primary" runat="server" OnClick="signInbtn_Click" Text="Signin" />
     <asp:Button ID="resetbtn" cssClass="btn-primary" OnClick="resetbtn_Click"  CausesValidation="false" runat ="server" Text="Reset" />
            </div>
    </div>

    <br/>

    <%-- <div class="row" style="text-align:center;">
    <asp:Label ID="lable" runat="server" Text=""></asp:Label>
         </div>--%>
    
    <asp:LinkButton ID="forgotbtn" runat="server">forgot password?</asp:LinkButton>
</div>
    <br />  
</asp:Content>


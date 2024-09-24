<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/student.master" AutoEventWireup="true" CodeFile="student.aspx.cs" Inherits="WebPages_student" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <script type="text/javascript">
            function ShowImagePreview(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#<%=PreviewImage.ClientID%>').prop('src', e.target.result)
                        .width(105)
                        .height(105);
                };
                reader.readAsDataURL(input.files[0]);
                }
            }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">


      <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-2" style="color:black;">
            <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
            <asp:Label ID="regno"  runat="server" Text="Registration no :"></asp:Label>
            </div>
           <div class="col-md-6" style="color:black;">
            <asp:TextBox ID="regtxtbx" runat="server"></asp:TextBox> 
           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="enter registration no" ControlToValidate="regtxtbx">
           </asp:RequiredFieldValidator>
           </div>
          </div>

        <br />
         <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-2" style="color:black;">
            <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
            <asp:Label ID="name" runat="server" Text="Student name :"></asp:Label>
            </div>
              <div class="col-md-6" style="color:black;">
            <asp:TextBox ID="nametxtbx" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="enter student name" ControlToValidate="nametxtbx">

           </asp:RequiredFieldValidator>
 </div>
           </div>
       
<br />

    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-2" style="color:black;">
            <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
            <asp:Label ID="email" runat="server" Text="E-mail :"></asp:Label>
            </div>
         <div class="col-md-6" style="color:black;">
            <asp:TextBox ID="emailtxtbx" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" enter E-mail" ControlToValidate="emailtxtbx">
                   </asp:RequiredFieldValidator>
            <%-- <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender" runat="server" Enabled="True" FilterType="Numbers, UppercaseLetters, LowercaseLetters" FilterMode="ValidChars" ValidChars="/,." TargetControlID="txtLogin">
                                </cc1:FilteredTextBoxExtender>
             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="invalid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="emailtxtbx">
         </asp:RegularExpressionValidator>
        </div>
       </div>
        
        <br/>

         <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-2" style="color:black;">
            <asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
            <asp:Label ID="batch" runat="server" Text="Batch :"></asp:Label>
            </div>
              <div class="col-md-6" style="color:black;">
            <asp:TextBox ID="batchtxtbx" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="enter batch" ControlToValidate="batchtxtbx">

           </asp:RequiredFieldValidator>
           </div>
          </div>
        <br />

        
         <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-2" style="color:black;">
            <asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
           <asp:Label ID="dept" runat="server" Text="Department :"></asp:Label>
            </div>
              <div class="col-md-6" style="color:black;">
            <asp:TextBox ID="depttxtbx" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="enter department" ControlToValidate="depttxtbx">
           </asp:RequiredFieldValidator>
           </div>
          </div>

        <br />


         <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-2" style="color:black;">
            <asp:Label ID="Label12" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
           <asp:Label ID="phone" runat="server" Text="Phone no:"></asp:Label>
            </div>
               <div class="col-md-6" style="color:black;">
            <asp:TextBox ID="phtxtbx" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="enter phone no" ControlToValidate="phtxtbx">
           </asp:RequiredFieldValidator>
                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender" runat="server" Enabled="True" FilterType="Numbers" TargetControlID="phtxtbx">
                                </cc1:FilteredTextBoxExtender>
                   <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

           </div>
          </div>
        <br />

         <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-2" style="color:black;">
            <asp:Label ID="Label7" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
           <asp:Label ID="mname" runat="server" Text="mother/Gaurdian name:"></asp:Label>
            </div>
               <div class="col-md-6" style="color:black;">
            <asp:TextBox ID="mtxtbx" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="enter mother name" ControlToValidate="mtxtbx">
           </asp:RequiredFieldValidator>
           </div>
          </div>
        <br />

         <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-2" style="color:black;">
            <asp:Label ID="Label10" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
           <asp:Label ID="fname" runat="server" Text="father/Gaurdian name :"></asp:Label>
            </div>
               <div class="col-md-6" style="color:black;">
            <asp:TextBox ID="ftxtbx" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="enter father name" ControlToValidate="ftxtbx">
           </asp:RequiredFieldValidator>
           </div>
          </div>
        <br />

          <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-2" style="color:black;">
            <asp:Label ID="Label6" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
           <asp:Label ID="address" runat="server" Text="Address :"></asp:Label>
            </div>
               <div class="col-md-6" style="color:black;">
            <asp:TextBox ID="addtxtbx" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="enter address" ControlToValidate="addtxtbx">
           </asp:RequiredFieldValidator>
           </div>
          </div>
        <br />



             <div class="row">
                  <div class="col-md-4"></div>
                        <div class="col-md-5 aligntext ">
                            <asp:Label ID="Label9" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                            <asp:Label ID="lblPhoto" runat="server" Text="Upload Image:"  style="color:black;"></asp:Label>
                            <br />
                            <asp:Label ID="lblPho" runat="server" Text="(Once you select photo, Please Wait for upload)" Font-Size="9.5pt" Font-Bold="true" CssClass="LabelStyle" ForeColor="blue"></asp:Label>
                            <br />
                            <asp:Label ID="lblP" runat="server" Text="(only .jpg, .png, .jpeg formats allowed)" Font-Size="9.5pt" Font-Bold="true" CssClass="LabelStyle" ForeColor="blue"></asp:Label>
                        </div>
                          <div class="col-md-6"></div>
                        <div class="col-md-4">
                            <asp:FileUpload ID="filephoto" onchange="ShowImagePreview(this);" runat="server"></asp:FileUpload>
                            <a id="A2" runat="server" visible="false" target="_blank"></a>
                            <br />
                            <asp:Image ID="PreviewImage" runat="server" Width="140px" ImageUrl="../ASPX_Images/no%20photo.png"  />
                            <asp:Label ID="lblPath" runat="server" CssClass="LabelStyles" Visible="true"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="filephoto"
                                Enabled="true" CssClass="LabelStyleRequired" ErrorMessage="Upload Photo"
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </div>
                    </div>


    <br />
            <div class="row" style="color:black; text-align:center">
        <div class="col-md-4"></div>
        <div class="col-md-2">
                    <asp:Button ID="submitbtn"  onClick="submitbtn_Click" CssClass="btn-primary" runat="server" Text="submit" />
           </div>
                  <div class="col-md-1">
            <asp:Button ID="resetbtn" onClick="resetbtn_Click" CssClass="btn-info" CausesValidation="false" runat ="server" Text="reset" />
            
    </div>
    </div>

        
    <br />
</div>
</asp:Content>


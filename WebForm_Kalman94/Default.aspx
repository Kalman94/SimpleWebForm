<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebForm_Kalman94.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" />
    <script src="scripts/jquery-3.3.1.js"></script>
    <script src="scripts/jquery-ui-1.12.1.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
                $("#TextBox3").mouseover(function () {
                    $("#calend").slideDown(500)
                                });
                  $("#Button1").click(function () {
                $("#calend").slideDown(500)  });
                      
        });



    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div id="main">
        <asp:UpdatePanel ID="boxes" runat="server">
            <ContentTemplate>
                <div id="boxdiv">
        Enter Name:<asp:TextBox ID="TextBox1" runat="server" CssClass="boxes"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Must Enter Name"></asp:RequiredFieldValidator>
        <br />
        Enter Email:<asp:TextBox ID="TextBox2" runat="server" CssClass="boxes"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Must Enter Email"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Must be correct formatted" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />
        Enter Date:<asp:TextBox ID="TextBox3" runat="server" CssClass="boxes"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Must Enter Date"></asp:RequiredFieldValidator>
        <br />
         <br />
        </div>
       </ContentTemplate>
</asp:UpdatePanel>


        <div id="calend" style="display:none">
            <asp:UpdatePanel ID="calendholder" runat="server">
                <ContentTemplate>
                    <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
        <br />
                </ContentTemplate>
                 </asp:UpdatePanel>

        </div>

  
        <asp:Button ID="Button1" runat="server" Text="Save" Height="25px" OnClick="Button1_Click" Width="94px" />
        <br />


        <asp:UpdatePanel ID="gridholder" runat="server">
            <ContentTemplate>

<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" CausesValidation="False" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="dateadded" HeaderText="dateadded" SortExpression="dateadded" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ASP_DBConnectionString %>" DeleteCommand="DELETE FROM [dataentry] WHERE [Id] = @Id" InsertCommand="INSERT INTO [dataentry] ([name], [Id], [dateadded], [email]) VALUES (@name, @Id, @dateadded, @email)" SelectCommand="SELECT [name], [Id], [dateadded], [email] FROM [dataentry]" UpdateCommand="UPDATE [dataentry] SET [name] = @name, [dateadded] = @dateadded, [email] = @email WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
                <asp:Parameter DbType="Date" Name="dateadded" />
                <asp:Parameter Name="email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter DbType="Date" Name="dateadded" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
            </ContentTemplate>



        </asp:UpdatePanel>

        
        
    
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmRemate.aspx.cs" Inherits="webAuctionWebStore.Formularios.frmRemate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border: 2px solid #000000;
            background-color: #808080;
        }
        .auto-style22 {
            background-color: #FFFFFF;
            text-align: center;
            font-family: broadway;
            font-size: xx-large;
        }
        .auto-style11 {
            height: 30px;
            text-align: right;
            font-family: Dubai;
            font-size: medium;
            width: 50%;
            background-color: #FFFFFF;
        }
        .auto-style24 {
            height: 30px;
            text-align: center;
            font-family: Dubai;
            font-size: medium;
            background-color: #FFFFFF;
        }
        .auto-style12 {
            height: 35px;
        }
        .auto-style2 {
            text-align: center;
            height: 30px;
        }
        .auto-style3 {
            font-family: "Arial Black";
            background-color: #FFFFFF;
        }
        .auto-style26 {
            height: 34px;
            text-align: center;
            font-family: Dubai;
            font-size: medium;
            background-color: #FFFFFF;
        }
        .auto-style16 {
            font-family: "Arial Black";
            font-size: medium;
        }
        .auto-style27 {
            height: 30px;
            text-align: left;
            font-family: Dubai;
            font-size: medium;
            width: 50%;
            background-color: #FFFFFF;
        }
        .auto-style28 {
            height: 29px;
            text-align: right;
            font-family: Dubai;
            font-size: medium;
            width: 50%;
            background-color: #FFFFFF;
        }
        .auto-style29 {
            height: 29px;
            text-align: left;
            font-family: Dubai;
            font-size: medium;
            width: 50%;
            background-color: #FFFFFF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style22" colspan="2">CATÁLOGO REMATES</td>
                </tr>
                <tr>
                    <td class="auto-style12" colspan="2"></td>
                </tr>
                <tr>
                    <td class="auto-style11">NOMBRE DEL ARTÍCULO:</td>
                    <td class="auto-style27">
                        <asp:DropDownList ID="ddlNombreProducto" runat="server" CssClass="auto-style16">
                        </asp:DropDownList>
                    </td>
                    </tr>
                <tr>
                    <td class="auto-style24" colspan="2">
                        <asp:Image ID="Image1" runat="server" />
                        <asp:Image ID="Image2" runat="server" />
                        <asp:Image ID="Image3" runat="server" />
                    </td>
                    </tr>
                <tr>
                    <td class="auto-style11">DESCRIPCIÓN:</td>
                    <td class="auto-style27">
                        <asp:TextBox ID="txtDescrip" runat="server" CssClass="auto-style16" Width="50%"></asp:TextBox>
                    </td>
                    </tr>
                <tr>
                    <td class="auto-style11">OFERTA ACTUAL:</td>
                    <td class="auto-style27">
                        <asp:TextBox ID="txtOferAct" runat="server" CssClass="auto-style16" Width="25%"></asp:TextBox>
                    </td>
                    </tr>
                <tr>
                    <td class="auto-style11">NUEVA OFERTA:</td>
                    <td class="auto-style27">
                        <asp:TextBox ID="txtNueOfer" runat="server" CssClass="auto-style16" Width="25%"></asp:TextBox>
                    </td>
                    </tr>
                <tr>
                    <td class="auto-style26" colspan="2"><strong>
                        <asp:Button ID="btnOfertar" runat="server" CssClass="auto-style24" Text="OFERTAR" />
                        </strong></td>
                    </tr>
                <tr>
                    <td class="auto-style11">NOMBRE VENDEDOR:</td>
                    <td class="auto-style27">
                        <asp:TextBox ID="txtNomVend" runat="server" CssClass="auto-style16" Width="50%"></asp:TextBox>
                    </td>
                    </tr>
                <tr>
                    <td class="auto-style28">ID VENDEDOR:</td>
                    <td class="auto-style29">
                        <asp:TextBox ID="txtIdVend" runat="server" CssClass="auto-style16" Width="25%"></asp:TextBox>
                    </td>
                    </tr>
                <tr>
                    <td class="auto-style11">CANTIDAD DE SUBASTAS COMPLETADAS:</td>
                    <td class="auto-style27">
                        <asp:TextBox ID="txtCantSub" runat="server" CssClass="auto-style16" Width="25%"></asp:TextBox>
                    </td>
                    </tr>
                <tr>
                    <td class="auto-style11">REPUTACIÓN DEL VENDEDOR:</td>
                    <td class="auto-style27">
                        <asp:TextBox ID="txtRep" runat="server" CssClass="auto-style16" Width="10%"></asp:TextBox>
                    </td>
                    </tr>
                <tr>
                    <td class="auto-style12" colspan="2"></td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="2">
                        <asp:Label ID="lblMsj" runat="server" CssClass="auto-style3" Width="100%"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

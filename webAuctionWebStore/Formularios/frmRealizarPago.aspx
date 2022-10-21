<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmRealizarPago.aspx.cs" Inherits="webAuctionWebStore.Formularios.frmRealizarPago" %>

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
        .auto-style11 {
            height: 30px;
            text-align: right;
            font-family: Dubai;
            font-size: medium;
            width: 50%;
            background-color: #FFFFFF;
        }
        .auto-style23 {
            height: 29px;
            text-align: center;
            font-family: Dubai;
            font-size: medium;
            background-color: #FFFFFF;
        }
        .auto-style24 {
            background-color: #FFFFFF;
            text-align: center;
            font-family: Dubai;
            font-size: medium;
            font-weight: bold;
        }
        .auto-style16 {
            font-family: "Arial Black";
            font-size: medium;
        }
        .auto-style25 {
            height: 30px;
            text-align: left;
            font-family: Dubai;
            font-size: medium;
            width: 50%;
            background-color: #FFFFFF;
        }
        .auto-style26 {
            height: 34px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style22" colspan="2">REALIZAR PAGO</td>
                </tr>
                <tr>
                    <td class="auto-style12" colspan="2"></td>
                </tr>
                <tr>
                    <td class="auto-style11">NOMBRE DEL ARTÍCULO:</td>
                    <td class="auto-style25">
                        <asp:DropDownList ID="ddlNombreProducto" runat="server" CssClass="auto-style16">
                        </asp:DropDownList>
                    </td>
                    </tr>
                <tr>
                    <td class="auto-style11">DESCRIPCIÓN DEL ARTÍCULO:</td>
                    <td class="auto-style25">
                        <asp:TextBox ID="txtDescrip" runat="server" CssClass="auto-style16" Width="50%"></asp:TextBox>
                    </td>
                    </tr>
                <tr>
                    <td class="auto-style11">VALOR DEL ARTÍCULO:</td>
                    <td class="auto-style25">
                        <asp:TextBox ID="txtValor" runat="server" CssClass="auto-style16" Width="25%"></asp:TextBox>
                    </td>
                    </tr>
                <tr>
                    <td class="auto-style12" colspan="2"></td>
                </tr>
                <tr>
                    <td class="auto-style11">NÚMERO DE TARJETA:</td>
                    <td class="auto-style25">
                        <asp:TextBox ID="txtNumTarj" runat="server" CssClass="auto-style16" Width="50%"></asp:TextBox>
                    </td>
                    </tr>
                <tr>
                    <td class="auto-style11">CÓDIGO DE SEGURIDAD:</td>
                    <td class="auto-style25">
                        <asp:TextBox ID="txtCCV" runat="server" CssClass="auto-style16" Width="15%"></asp:TextBox>
                    </td>
                    </tr>
                <tr>
                    <td class="auto-style12" colspan="2"></td>
                </tr>
                <tr>
                    <td class="auto-style11">DIRECCIÓN DE ENVÍO:</td>
                    <td class="auto-style25">
                        <asp:TextBox ID="txtDirecc" runat="server" CssClass="auto-style16" Width="50%"></asp:TextBox>
                    </td>
                    </tr>
                <tr>
                    <td class="auto-style11">COMPLEMENTO DIRECCIÓN:</td>
                    <td class="auto-style25">
                        <asp:TextBox ID="txtCompDirecc" runat="server" CssClass="auto-style16" Width="50%"></asp:TextBox>
                    </td>
                    </tr>
                <tr>
                    <td class="auto-style11">CIUDAD:</td>
                    <td class="auto-style25">
                        <asp:DropDownList ID="ddlCiudad" runat="server" CssClass="auto-style16">
                        </asp:DropDownList>
                    </td>
                    </tr>
                <tr>
                    <td class="auto-style11">DEPARTAMENTO:</td>
                    <td class="auto-style25">
                        <asp:DropDownList ID="ddlDepart" runat="server" CssClass="auto-style16">
                        </asp:DropDownList>
                    </td>
                    </tr>
                <tr>
                    <td class="auto-style23" colspan="2"><strong>
                        <asp:Button ID="btnPagar" runat="server" CssClass="auto-style24" Text="REALIZAR PAGO" />
                        </strong></td>
                    </tr>
                <tr>
                    <td class="auto-style26" colspan="2"></td>
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

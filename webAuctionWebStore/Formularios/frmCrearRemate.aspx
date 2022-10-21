<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmCrearRemate.aspx.cs" Inherits="webAuctionWebStore.Formularios.frmCrearRemate" %>

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
        .auto-style2 {
            text-align: center;
            height: 30px;
        }
        .auto-style3 {
            font-family: "Arial Black";
            background-color: #FFFFFF;
        }
        .auto-style4 {
            font-family: broadway;
            font-size: xx-large;
        }
        .auto-style6 {
            text-align: center;
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
        .auto-style12 {
            height: 35px;
        }
        .auto-style16 {
            font-family: "Arial Black";
            font-size: medium;
        }
        .auto-style17 {
            height: 30px;
            text-align: left;
            background-color: #FFFFFF;
        }
        .auto-style18 {
            height: 30px;
            text-align: right;
            font-family: Dubai;
            background-color: #FFFFFF;
        }
        .auto-style19 {
            height: 30px;
            background-color: #FFFFFF;
        }
        .auto-style20 {
            height: 34px;
        }
        .auto-style21 {
            height: 34px;
            text-align: center;
            background-color: #FFFFFF;
        }
        .auto-style22 {
            font-family: Dubai;
            font-weight: bold;
            font-size: medium;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style6" colspan="2">
                        <asp:Label ID="Label1" runat="server" CssClass="auto-style4" Text="MAESTRO CREAR REMATE"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12" colspan="2"></td>
                </tr>
                <tr>
                    <td class="auto-style11">NOMBRE DEL ARTÍCULO:</td>
                    <td class="auto-style17">
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="auto-style16" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">DESCRIPCIÓN:</td>
                    <td class="auto-style19">
                        <asp:TextBox ID="txtDescripcion" runat="server" CssClass="auto-style16" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">CATEGORÍA:</td>
                    <td class="auto-style19">
                        <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="auto-style16">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">FECHA INICIAL DEL REMATE:</td>
                    <td class="auto-style19">
                        <asp:TextBox ID="txtFechInic" runat="server" CssClass="auto-style16" Width="25%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">FECHA FINAL DEL REMATE:</td>
                    <td class="auto-style19">
                        <asp:TextBox ID="txtFechFin" runat="server" CssClass="auto-style16" Width="25%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">PRECIO DEL ARTÍCULO:</td>
                    <td class="auto-style19">
                        <asp:TextBox ID="txtPrecio" runat="server" CssClass="auto-style16" Width="25%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">ARCHIVOS MULTIMEDIA (FOTO Y/O VÍDEO):</td>
                    <td class="auto-style19">
                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="auto-style16" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21" colspan="2"><strong>
                        <asp:Button ID="btnCrear" runat="server" CssClass="auto-style22" Text="CREAR REMATE" />
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style20" colspan="2"></td>
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

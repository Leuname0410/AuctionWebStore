<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmRegistrarUsuario.aspx.cs" Inherits="webAuctionWebStore.Formularios.frmRegistrarUsuario" %>

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
            background-color: #FFFFFF;
        }
        .auto-style5 {
            background-color: #FFFFFF;
            text-align: center;
            height: 26px;
        }
        .auto-style18 {
            height: 30px;
            text-align: right;
            font-family: Dubai;
            background-color: #FFFFFF;
            font-size: medium;
        }
        .auto-style19 {
            background-color: #FFFFFF;
            height: 23px;
        }
        .auto-style20 {
            background-color: #FFFFFF;
            height: 30px;
        }
        .auto-style16 {
            font-family: "Arial Black";
            font-size: medium;
        }
        .auto-style21 {
            background-color: #FFFFFF;
            font-family: "Arial Black";
            font-size: medium;
        }
        .auto-style12 {
            height: 35px;
        }
        .auto-style22 {
            background-color: #FFFFFF;
            text-align: center;
            font-family: broadway;
            font-size: xx-large;
        }
        .auto-style23 {
            height: 30px;
            text-align: right;
            font-family: Dubai;
            font-size: medium;
            width: 50%;
            background-color: #FFFFFF;
        }
        .auto-style24 {
            height: 35px;
            text-align: center;
            background-color: #FFFFFF;
        }
        .auto-style25 {
            background-color: #FFFFFF;
            text-align: center;
            font-family: Dubai;
            font-size: medium;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style22" colspan="2">MAESTRO REGISTRAR USUARIO</td>
                </tr>
                <tr>
                    <td class="auto-style12" colspan="2"></td>
                </tr>
                <tr>
                    <td class="auto-style23">DOCUMENTO:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtDoc" runat="server" CssClass="auto-style16" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">NOMBRE:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="auto-style16" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">APELLIDOS:</td>
                    <td class="auto-style20">
                        <asp:TextBox ID="txtApellido" runat="server" CssClass="auto-style16" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">NÚMERO DE TELÉFONO:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtTel" runat="server" CssClass="auto-style16" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">CIUDAD:</td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlCiudad" runat="server" CssClass="auto-style16">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">DEPARTAMENTO:</td>
                    <td class="auto-style20">
                        <asp:DropDownList ID="ddlDepart" runat="server" CssClass="auto-style16">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">DIRECCIÓN:</td>
                    <td class="auto-style20">
                        <asp:TextBox ID="txtDireccion" runat="server" CssClass="auto-style16" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style23">COMPLEMENTO DIRECCIÓN:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtComplDirec" runat="server" CssClass="auto-style16" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">EMAIL:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="auto-style16" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">CONTRASEÑA:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtContra" runat="server" CssClass="auto-style16" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">CONFIRMAR CONTRASEÑA:</td>
                    <td class="auto-style19">
                        <asp:TextBox ID="txtConfrContra" runat="server" CssClass="auto-style16" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style24" colspan="2"><strong>
                        <asp:Button ID="btnRegistrar" runat="server" CssClass="auto-style25" Text="REGISTRAR USUARIO" />
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style12" colspan="2"></td>
                </tr>
                <tr>
                    <td class="auto-style5" colspan="2">
                        <asp:Label ID="lblMsj" runat="server" CssClass="auto-style21" Width="100%"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

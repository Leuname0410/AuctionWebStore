<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/frmPrincipal.Master" AutoEventWireup="true" CodeBehind="frmUsuarioRegistrar.aspx.cs" Inherits="webAuctionWebStore.Formularios.Formulario_web11" %>

<asp:Content ID="Content4" ContentPlaceHolderID="Cuerpo" runat="server">

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
            width: 333px;
        }
        .auto-style16 {
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
        .auto-style26 {
            width: 672px;
            border: 2px solid #000000;
            background-color: #808080;
        }
        .auto-style30 {
            height: 30px;
            text-align: right;
            font-family: Dubai;
            font-size: medium;
            width: 333px;
            background-color: #FFFFFF;
        }
        .auto-style31 {
            height: 31px;
            width: 333px;
            background-color: #FFFFFF;
        }
        .auto-style32 {
            background-color: #FFFFFF;
            height: 30px;
            width: 333px;
        }
        .auto-style33 {
            height: 26px;
            width: 280px;
            text-align: center;
            background-color: #FFFFFF;
        }
        .auto-style34 {
            height: 26px;
            text-align: center;
            background-color: #FFFFFF;
        }
        .auto-style35 {
            color: #000000;
            font-size: large;
        }
        .auto-style36 {
            height: 30px;
            text-align: right;
            font-family: Dubai;
            font-size: large;
            width: 333px;
            background-color: #FFFFFF;
        }
        .auto-style37 {
            font-size: medium;
        }
        .auto-style38 {
            font-family: "Arial Black";
            }
        </style>
    <table class="auto-style26">
                <tr>
                    <td class="auto-style22" colspan="2">MAESTRO REGISTRAR USUARIO</td>
                </tr>
                <tr>
                    <td class="auto-style12" colspan="2"></td>
                </tr>
                <tr>
                    <td class="auto-style30">DOCUMENTO:</td>
                    <td class="auto-style31">
                        <asp:TextBox ID="txtDoc" runat="server" CssClass="auto-style16" Width="50%"></asp:TextBox>
                    &nbsp;
                        <asp:ImageButton ID="ibtnBuscar" runat="server" Visible="False" Width="23px" ImageUrl="~/Imagenes/Buscar.jpg" OnClick="ibtnBuscar_Click" />
                        <asp:Label ID="lblCodUsuario" runat="server" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style30">TIPO DOCUMENTO:&nbsp; </td>
                    <td class="auto-style31">
                        <asp:DropDownList ID="ddlTipoDoc" runat="server" CssClass="auto-style38" Width="173px" Font-Bold="True">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">NOMBRE:</td>
                    <td class="auto-style31">
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="auto-style16" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">APELLIDOS:</td>
                    <td class="auto-style32">
                        <asp:TextBox ID="txtApellido" runat="server" CssClass="auto-style16" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">NÚMERO DE TELÉFONO:</td>
                    <td class="auto-style31">
                        <asp:TextBox ID="txtTel" runat="server" CssClass="auto-style16" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">DEPARTAMENTO:</td>
                    <td class="auto-style31">
                        <asp:DropDownList ID="ddlDepart" runat="server" Height="16px" OnSelectedIndexChanged="ddlDepart_SelectedIndexChanged1" Width="172px" Font-Bold="True" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">CIUDAD:</td>
                    <td class="auto-style32">
                        <asp:DropDownList ID="ddlCiudad" runat="server" Height="19px" Width="175px" Font-Bold="True" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">ROL:</td>
                    <td class="auto-style32">
                        <asp:DropDownList ID="ddlRol" runat="server" Height="19px" Width="135px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">DIRECCIÓN:</td>
                    <td class="auto-style32">
                        <asp:TextBox ID="txtDireccion" runat="server" CssClass="auto-style16" Width="50%" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style30">COMPLEMENTO DIRECCIÓN:</td>
                    <td class="auto-style31">
                        <asp:TextBox ID="txtComplDirec" runat="server" CssClass="auto-style16" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style36"><span class="auto-style37">ESTADO</span>:</td>
                    <td class="auto-style31">
                        <asp:DropDownList ID="ddlEstado" runat="server" Height="23px" Width="134px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">EMAIL:</td>
                    <td class="auto-style31">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="auto-style16" Width="50%" TextMode="Email"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">CONTRASEÑA:</td>
                    <td class="auto-style31">
                        <asp:TextBox ID="txtContra" runat="server" CssClass="auto-style16" Width="50%" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">CONFIRMAR CONTRASEÑA:</td>
                    <td class="auto-style19">
                        <asp:TextBox ID="txtConfrContra" runat="server" CssClass="auto-style16" Width="50%" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style24" colspan="2">
                        <strong>
                        <asp:Button ID="btnGuardar" runat="server" CssClass="auto-style25" Text="Guardar"  Height="27px" Visible="False" OnClick="btnGuardar_Click" />
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style24" colspan="2"><strong>
                        <asp:Button ID="btnRegistrar" runat="server" CssClass="auto-style25" Text="Registrar" OnClick="btnRegistrar_Click" Height="27px" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnModificar" runat="server" CssClass="auto-style25" Text="Modificar" Height="27px" OnClick="btnModificar_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnEliminar" runat="server" CssClass="auto-style25" Text="Eliminar"  Height="27px" OnClick="btnEliminar_Click" />
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style34" colspan="2">
                        <asp:Label ID="lblMsj" runat="server" CssClass="auto-style35" Font-Bold="True" Width="100%"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style33" colspan="2">
                        &nbsp;</td>
                </tr>
            </table>
</asp:Content>

using System;

namespace webAuctionWebStore.Formularios
{
    public partial class frmLogin : System.Web.UI.Page
    {
        #region Variables Globales
        private static string strApp;

        string email, password;
        string nameUser, lastnameUser;
        #endregion

        #region  Metodos personales
        private void Mensaje(string Texto)
        { this.lblLogin.Text = Texto.Trim(); }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                strApp = System.Reflection.Assembly.GetExecutingAssembly().GetName().Name;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                email = (string.IsNullOrEmpty(this.txtEmail.Text)) 
                    ? string.Empty: Convert.ToString(this.txtEmail.Text);
                password = (string.IsNullOrEmpty((string)this.txtPassword.Text))
                    ? string.Empty: Convert.ToString((string)this.txtPassword.Text);

                if (string.IsNullOrEmpty(email))
                {
                    Mensaje("Email no válido");
                    return;
                }
                if (string.IsNullOrEmpty(password))
                {
                    Mensaje("Contraseña no válida");
                    return;
                }

                Clases.clsLogin objLogin = new Clases.clsLogin(strApp);

                if(!objLogin.login(email,password))
                {
                    Mensaje(objLogin.Error);
                    objLogin = null;
                    return;
                }

                nameUser = objLogin.nameUser;
                lastnameUser = objLogin.lastnameUser;

                Session["nameUser"] = nameUser;
                Session["lastnameUser"] = lastnameUser;
                Response.Redirect("frmInicio.aspx");
            }
            catch (Exception ex)
            {
                Mensaje(ex.Message);
            }
        }
    }
}
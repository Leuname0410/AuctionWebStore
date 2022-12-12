using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using libConexionBD; // cls general a cls conexcion bd ...
using System.Data;

namespace webAuctionWebStore.Clases
{
    internal class clsLogin
    {

        #region Atributos

        private string strApp;
        private string strSQL;

        private string Email { get; set; }
        private string Contrasenia { get; set; }
        public string nameUser { get; set; }
        public string lastnameUser { get; set; }
        public string Error { get; private set; }

        private SqlDataReader myReader;

        #endregion

        #region Constructor

        public clsLogin(string Aplication)
        {
            strApp = Aplication;
            Email = string.Empty;
            Contrasenia = string.Empty;

            strSQL = string.Empty;
            Error = string.Empty;
        }
        #endregion

        #region Metodos privados
        private bool validarDatos()
        {
            if (string.IsNullOrEmpty(Email))
            {
                Error = "Falta el correo del usuario";
                return false;
            }
            if (string.IsNullOrEmpty(Contrasenia))
            {
                Error = "Falta la contraseña del usuario";
                return false;
            }
           
            return true;

        }
        #endregion

        #region Métodos públicos

        public bool login(string emailEmpleado, string passwordEmpleado)
        {
            try
            {
                validarDatos();

                strSQL = "exec USP_LoginEmpleado '" + emailEmpleado + "' , " + passwordEmpleado + ";";
                clsConexionBD objCnx = new clsConexionBD(strApp);
                objCnx.SQL = strSQL;
                if (!objCnx.Consultar(false))
                {
                    Error = objCnx.Error;
                    objCnx.cerrarCnx();
                    objCnx = null;
                    return false;
                }

                myReader = objCnx.dataReaderLleno;

                if (!myReader.HasRows)
                {
                    Error = "Correo o contraseña incorrectas";
                    objCnx.cerrarCnx();
                    objCnx = null;
                    return false;
                }

                myReader.Read();
                nameUser = myReader.GetString(0);
                lastnameUser = myReader.GetString(1);
                myReader.Close();

                return true;

            }
            catch (Exception ex)
            {

                Error = ex.Message;
                return false;
            }
        }
}
        #endregion
    }

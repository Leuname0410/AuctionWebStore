using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using libConexionBD;
using System.Data.SqlClient;

namespace webAuctionWebStore.Clases
{
    public class clsUsuario
    {

        #region "Atributos / Propiedades "

        private string strApp;
        private string strSQL;
        public int IdUsuario { get; set; }
        public string Usuario { get; set; }
        public string Documento { get; set; }
        public string TipoDoc { get; set; }
        public int Rol { get; set; }
        public int Ciudad { get; set; }
        public int Departamento{ get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Dir { get; set; }
        public string DirComple { get; set; }
        public string Email { get; set; }
        public string Tel { get; set; }
        public string Contrasenia { get; set; }
        public string ConfirmContasenia { get; set; }
        public int Estado { get; set; }
        public string Respuesta { get; private set; }
        public string Error { get; private set; }

        private clsConexionBD objCnx;//Este es el que hace la parte transacional
        private SqlDataReader readerLocal;// Para recuperar la información al momento de consultar
        #endregion
        #region "Constructor"
        public clsUsuario(string NombreApp)
        {
            //IdProgramador = 0;
            TipoDoc = string.Empty;
            Documento = string.Empty;
            Nombre = string.Empty;
            Apellido = string.Empty;
            Ciudad = 0;
            Rol = 0;
            Dir = string.Empty;
            DirComple = string.Empty;
            Email = string.Empty;
            Usuario = string.Empty;
            Contrasenia = string.Empty;
            ConfirmContasenia = string.Empty;
            Tel = string.Empty;
            Estado = 0;
            Respuesta = string.Empty;
            strApp = NombreApp;
            strSQL = string.Empty;
            Error = string.Empty;
        }

        public clsUsuario(string nombreApp, int intProgramador, int intTipoDocumento, string strNombre, float fltSalario,
        string strDireccion1, int intCiudad1, string strDireccion2, int intCiudad2, string strTelefono1, int intTelef1, string strTelefono2, int intTelef2, bool blActivo)
        {
            strApp = nombreApp;
            //IdUsu = intProgramador;
            TipoDoc = string.Empty;
            Documento = string.Empty;
            Nombre = string.Empty;
            Apellido = string.Empty;
            Ciudad = 0;
            Rol = 0;
            Dir = string.Empty;
            DirComple = string.Empty;
            Email = string.Empty;
            Usuario = string.Empty;
            Contrasenia = string.Empty;
            ConfirmContasenia = string.Empty;
            Tel = string.Empty;
            Estado = 0;
            Respuesta = string.Empty;
            strSQL = string.Empty;
            Error = string.Empty;
        }
        #endregion
        #region "Metodos Privados"
        private bool Grabar(string SQL)
        {
            //
            try
            {
                objCnx = new clsConexionBD(strApp);
                objCnx.SQL = SQL;
                if (!objCnx.consultarValorUnico(false))
                //Ejecuta la cadea sql, retorna un único valor que se lo asigna a valor único, cuando mandamos una sentencia completa
                //y aseguramos que retorna un único valor
                {
                    Error = objCnx.Error;
                    objCnx = null;
                    return false;
                }
                Respuesta = objCnx.vrUnico.ToString().Trim();//lo convierta en cadena y se lo entrega a la variable
                objCnx = null;
                return true;
            }
            catch (Exception ex)
            {
                Error = ex.Message;
                return false;
            }
        }
        #endregion
        #region "Métodos Públicos"
        
        public bool grabarUsurio()
        {
            //Construye la sentencia sql para hacer la transación en la BD
            try
            {
                strSQL = "EXEC USP_ClienteNatural_Grabar '" +
                Email + "', '" +
                Contrasenia + "', '" +
                Nombre + "', '" +
                Apellido + "', '" +
                Documento + "', " +
                Rol + ", " +
                Estado + ", " +
                TipoDoc + ", '" +
                Tel + "', " +
                Ciudad + ", '" +
                Dir + "'; ";
                return Grabar(strSQL);


            }
            catch (Exception ex)
            {
                Error = ex.Message;
                return false;
            }
        }

        public bool modificar()
        {
            try
            {
                strSQL = "EXEC USP_ClienteNatural_Modificar '" +
                Email + "', '" +
                Contrasenia + "', '" +
                Nombre + "', '" +
                Apellido + "', " +
                Rol + ", " +
                Estado + ", '" +
                Tel + "', " +
                Ciudad + ", '" +
                Dir + "', "+
                IdUsuario + "; "  ;
                return Grabar(strSQL);
            }
            catch (Exception ex)
            {
                Error = ex.Message;
                return false;
            }
        }
        /*public bool grabarDirecProgramador()
        {
            //Construye la sentencia sql para hacer la transación en la BD
            try
            {
                strSQL = "EXEC USP_Direccion_Programador_Grabar " +
                //IdProgramador + ", " +
                Ciudad2 + ", '" +
                Dir2 + "'; ";
                return Grabar(strSQL);

            }
            catch (Exception ex)
            {
                Error = ex.Message;
                return false;
            }
        }

        public bool grabarTelProgramador()
        {
            //Construye la sentencia sql para hacer la transación en la BD
            try
            {
                strSQL = "EXEC USP_Telefono_Programador_Grabar " +
               // IdProgramador + ", " +
                TipoTel2 + ", '" +
                Tel2 + "'; ";
                return Grabar(strSQL);

            }
            catch (Exception ex)
            {
                Error = ex.Message;
                return false;
            }
        }

        public bool modificarProgramador()
        {
            try
            {
                int Act = (Estado) ? 1 : 0;
                strSQL = "EXEC USP_Programador_Modificar " +
                //IdProgramador + ", " +
                TipoDoc + ", '" +
                Nombre + "', " +
                Salario + ", '" +
                Dir1 + "' ," +
                Ciudad1 + ", '" +
                Tel1 + "' ," +
                TipoTel1 + ", " +
                Act + "; ";
                return Grabar(strSQL);
            }
            catch (Exception ex)
            {
                Error = ex.Message;
                return false;
            }
        }

        public bool buscarProgramador(int intCodigo)
        {
            try
            {
                if (intCodigo < 0)
                {
                    Error = "Codigo no válido";
                    return false;
                }
                strSQL = "EXEC USP_PROGRAMADOR_BUSCARXCODIGO " + intCodigo + "; "; //todo lo de tipo cadena va en comilla simple
                objCnx = new clsConexionBD(strApp);
                objCnx.SQL = strSQL;
                if (!objCnx.Consultar(false))//estamos diciendo que la sentencia SQL es de tipo texto
                {
                    Error = objCnx.Error;
                    return false;
                }
                readerLocal = objCnx.dataReaderLleno;
                if (!readerLocal.HasRows)//Si el datareader no tiene registros entra
                {
                    Error = "No se encontró ningún registro: " + intCodigo;
                    readerLocal.Close();//Cierra el datareader
                    objCnx = null;
                    return false;
                }

                //recuperar información del datareader se comporta parecido a un vector
                readerLocal.Read();
                //IdProgramador = readerLocal.GetInt32(0);
                TipoDoc = readerLocal.GetInt32(1);
                Nombre = readerLocal.GetString(2);
                Salario = Convert.ToSingle(readerLocal.GetDouble(3));
                Dir1 = readerLocal.GetString(4);
                Ciudad1 = readerLocal.GetInt32(5);
                Tel1 = readerLocal.GetString(6);
                TipoTel1 = readerLocal.GetInt32(7);
                Estado = readerLocal.GetBoolean(8);
                readerLocal.Close();

                objCnx = null;
                return true;
            }
            catch (Exception ex)
            {
                Error = ex.Message;
                return false;

            }
        }*/

        public bool llenarGrid(GridView gridALlenar, int codCiudad)
        {

            try
            {
                if (gridALlenar == null)
                {
                    Error = "Grid es nulo";
                    return false;
                }
                strSQL = "Exec usp_ProgramadorXciudad_llenarGrid " + ";";
                clsGenerales objLlenar = new clsGenerales(strApp);
                if (!objLlenar.llenarGrid(gridALlenar, strSQL))
                {
                    Error = objLlenar.Error;
                    objLlenar = null;
                    return false;
                }
                objLlenar = null;
                return true;
            }
            catch (Exception ex)
            {
                Error = ex.Message;
                return false;
            }
        }

        public bool deleteUser(string strUserDocument) {

            try
            { 
                strSQL = "select intIdUsu from tblUSUario_AWS where strDocUsu = '" + strUserDocument + "';";
                objCnx = new clsConexionBD(strApp);
                objCnx.SQL = strSQL;
                if (!objCnx.Consultar(false))//estamos diciendo que la sentencia SQL es de tipo texto
                {
                    Error = objCnx.Error;
                    return false;
                }
                readerLocal = objCnx.dataReaderLleno;
                if (!readerLocal.HasRows)//Si el datareader no tiene registros entra
                {
                    Error = "No se encontró ningún registro: " + strUserDocument;
                    readerLocal.Close();//Cierra el datareader
                    objCnx = null;
                    return false;
                }

                readerLocal.Read();
                IdUsuario = readerLocal.GetInt32(0);
                readerLocal.Close();
                objCnx = null;



                strSQL = "delete from tblDIrecUSuario_AWS where intIdUsu_USU = '" + IdUsuario + "';";
                objCnx = new clsConexionBD(strApp);
                objCnx.SQL = strSQL;
                if (!objCnx.Consultar(false))//estamos diciendo que la sentencia SQL es de tipo texto
                {
                    Error = objCnx.Error;
                    return false;
                }
         
                strSQL = "exec USP_ClienteNatural_Eliminar '" + strUserDocument + "';";
                objCnx = new clsConexionBD(strApp);
                objCnx.SQL = strSQL;
                if (!objCnx.Consultar(false))//estamos diciendo que la sentencia SQL es de tipo texto
                {
                    Error = objCnx.Error;
                    return false;
                }

                
                return true;
            }
            catch (Exception ex)
            {
                Error = ex.Message;
                return false;

            }

        }
        public bool buscarUsuario(string strDoc)
        {
            try
            {
                if (string.IsNullOrEmpty(strDoc))
                {
                    Error = "Documento no válido";
                    return false;
                }
                strSQL = "EXEC USP_Usuario_BuscarXDocumento '" + strDoc + "'; "; //todo lo de tipo cadena va en comilla simple
                objCnx = new clsConexionBD(strApp);
                objCnx.SQL = strSQL;
                if (!objCnx.Consultar(false))//estamos diciendo que la sentencia SQL es de tipo texto
                {
                    Error = objCnx.Error;
                    return false;
                }
                readerLocal = objCnx.dataReaderLleno;
                if (!readerLocal.HasRows)//Si el datareader no tiene registros entra
                {
                    Error = "No se encontró ningún registro: " + strDoc;
                    readerLocal.Close();//Cierra el datareader
                    objCnx = null;
                    return false;
                }

                //recuperar información del datareader se comporta parecido a un vector
                readerLocal.Read();
                IdUsuario = readerLocal.GetInt32(0);//recupero como cadena 
                TipoDoc = readerLocal.GetString(1);
                Documento = readerLocal.GetString(2);
                Nombre= readerLocal.GetString(3);
                Apellido = readerLocal.GetString(4);
                Tel= readerLocal.GetString(5);
                Departamento= readerLocal.GetInt32(6);
                Ciudad = readerLocal.GetInt32(7);
                Rol= readerLocal.GetInt32(8);
                Dir = readerLocal.GetString(9);
                Estado = readerLocal.GetInt32(10);
                Email = readerLocal.GetString(11);
                Contrasenia= readerLocal.GetString(12);
                readerLocal.Close();
                objCnx = null;
                return true;
            }
            catch (Exception ex)
            {
                Error = ex.Message;
                return false;

            }
        }
        #endregion
    }
}
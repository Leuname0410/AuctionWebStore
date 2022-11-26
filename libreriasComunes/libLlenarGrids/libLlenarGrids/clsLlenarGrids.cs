using System;

//Referenciar y Usar

using System.Windows.Forms;
using System.Web.UI.WebControls;
using libConexionBD;
namespace libLlenarGrids
{
    public class clsLlenarGrids
    {
    #region "Atributos/Propiedades"
        private string strApp;
        public string SQL   { private get; set; }
        public string Error { get; private set; }
    #endregion

    #region "Constructor"
        public clsLlenarGrids( string nombreApp )
        {
            strApp = nombreApp;
            SQL    = string.Empty;
            Error  = string.Empty;
        }
    #endregion

    #region "Métodos Privados"
        private bool Validar( )
        {
            if ( string.IsNullOrEmpty( SQL ) )
            {
                Error = "Debe definir la instrucción SQL";
                return false;
            }
            return true;
        }
    #endregion

    #region "Métodos Públicos"
        public bool llenarGridWindows( DataGridView Generico )
        {
            if ( ! Validar( ) )
                return false;
            try
            {
                clsConexionBD objConexionBd = new clsConexionBD( strApp );
                objConexionBd.SQL = SQL;
                if ( ! objConexionBd.llenarDataSet( false ) )
                {
                    Error = objConexionBd.Error;
                    objConexionBd.cerrarCnx( );
                    objConexionBd = null;
                    return false;
                }
                Generico.DataSource = objConexionBd.dataSetLleno.Tables[ 0 ];
                Generico.Refresh( );
                objConexionBd.cerrarCnx( );
                objConexionBd = null;
                return true;
            }
            catch ( Exception ex )
            {
                Error = ex.Message;
                return false;
            }
        }
        public bool llenarGridWeb    ( GridView Generico )
        {
            if ( ! Validar( ) )
                return false;
            try
            {
                clsConexionBD objConexionBd = new clsConexionBD(strApp);
                objConexionBd.SQL = SQL;
                if ( ! objConexionBd.llenarDataSet( false ) )
                {
                    Error = objConexionBd.Error;
                    objConexionBd.cerrarCnx( );
                    objConexionBd = null;
                    return false;
                }
                Generico.DataSource = objConexionBd.dataSetLleno.Tables[ 0 ];
                Generico.DataBind( );
                objConexionBd.cerrarCnx( );
                objConexionBd = null;
                return true;
            }
            catch ( Exception ex )
            {
                Error = ex.Message;
                return false;
            }
        }
    #endregion
    }
}

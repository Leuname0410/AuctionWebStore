using System;

//Referenciar y Usar
using libConexionBD;
using System.Windows.Forms;
using System.Web.UI.WebControls;

namespace libLlenarCombos
{
    public class clsLlenarCombos
    {
    #region "Atributos/Propiedades"
        private string strApp;
        public string SQL        { private get; set; }
        public string campoID    { private get; set; }
        public string campoTexto { private get; set; }
        public string Error      { get; private set; }
    #endregion

    #region "Constructor"
        public clsLlenarCombos ( string nombreApp )
        {
            strApp     = nombreApp;
            SQL        = string.Empty;
            campoID    = string.Empty;
            campoTexto = string.Empty;
            Error      = string.Empty;
        }
    #endregion

    #region "Métodos Privados"
        private bool Validar ( )
        {
            if ( string.IsNullOrEmpty ( SQL ) )
            {
                Error = "Debe definir una instrucción SQL";
                return false;
            }
            if ( string.IsNullOrEmpty ( campoID ) )
            {
                Error = "Debe definir el nombre del Campo con la PK(Id)";
                return false;
            }
            if ( string.IsNullOrEmpty ( campoTexto ) )
            {
                Error = "Debe definir el nombre del Campo con valores Texto";
                return false;
            }
            return true;
        }
    #endregion

    #region "Métodos Públicos"
        public bool llenarComboWindows ( ComboBox Generico )
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
                Generico.DataSource    = objConexionBd.dataSetLleno.Tables[ 0 ];
                Generico.ValueMember   = campoID;
                Generico.DisplayMember = campoTexto;
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
        public bool llenarComboWeb     ( DropDownList Generico )
        {
            if ( ! Validar( ) )
                return false;
            clsConexionBD objConexionBd = new clsConexionBD ( strApp );
            try
            {
                objConexionBd.SQL = SQL;
                if ( ! objConexionBd.llenarDataSet ( false ) )
                {
                    Error = objConexionBd.Error;
                    objConexionBd.cerrarCnx( );
                    objConexionBd = null;
                    return false;
                }
                Generico.DataSource = objConexionBd.dataSetLleno.Tables[ 0 ];
                Generico.DataValueField = campoID;
                Generico.DataTextField  = campoTexto;
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

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace webAuctionWebStore.Clases
{
    public class clsEstado
    {
        #region "Atributos / Propiedades"
        private string strApp;
        private string strSQL;
        public string Error { get; private set; }
        #endregion
        #region "Constructor"
        public clsEstado(string nombreApp)
        {
            strApp = nombreApp;
            strSQL = string.Empty;
            Error = string.Empty;
        }
        #endregion

        #region "Métodos Públicos"

        public bool llenarCombo(DropDownList Combo)
        {
            try
            {
                if (Combo == null)
                {
                    Error = "Combo  no válido";
                    return false;
                }

                clsGenerales objLlenar = new clsGenerales(strApp);
                strSQL = "EXEC USP_Estado_BuscarGeneral " + ";";

                if (!objLlenar.llenarCombo(Combo, strSQL, "Codigo", "Nombre"))
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
        #endregion
    }
}
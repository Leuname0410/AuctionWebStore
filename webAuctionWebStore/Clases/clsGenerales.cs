using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace webAuctionWebStore.Clases
{
    public class clsGenerales
    {
        #region "Atributos/Propiedades"
        private string strApp;
        public string Error { get; private set; }
        #endregion

        #region "Constructores"
        public clsGenerales(string NombreApp)
        {
            strApp = NombreApp;
            Error = string.Empty;
        }
        #endregion

        #region "Métodos Públicos"
        public bool llenarGrid(GridView Grid, string SQL)
        {
            try
            {
                if (string.IsNullOrEmpty(strApp))
                {
                    Error = "Falta el nombre de la aplicación";
                    return false;
                }
                if (Grid == null)
                {
                    Error = "Sin Grid a llenar";
                    return false;
                }
                clsLlenarGrids objXX = new clsLlenarGrids(strApp);// Sele envía el nombre de la aplicación(Proyecto)
                objXX.SQL = SQL; // Se le enváa la sentencia SQL
                if (!objXX.llenarGridWeb(Grid)) // Le decimos que llene el grid que llegó como refrenecia del formulario
                {
                    Error = objXX.Error;
                    objXX = null;
                    return false;
                }

                //Diseño del grid a travez de las propiedades
                objXX = null;
                Grid.GridLines = GridLines.Both;
                Grid.CellPadding = 2;
                Grid.ForeColor = System.Drawing.Color.Black;
                Grid.BackColor = System.Drawing.Color.Beige;
                Grid.AlternatingRowStyle.BackColor = System.Drawing.Color.Gainsboro; //Color alternante entre filas de el grid
                Grid.HeaderStyle.BackColor = System.Drawing.Color.Aqua; //Color del fondo del encabezado
                return true;
            }
            catch (Exception ex)
            {
                Error = ex.Message;
                return false;
            }
        }

        //Llena los objetos en el entorno web
        public bool llenarCombo(DropDownList Combo, string SQL, string CampoPK, string CampoTexto)
        {
            try
            {
                if (string.IsNullOrEmpty(strApp))
                {
                    Error = "Falta el nombre de la aplicación";
                    return false;
                }
                if (Combo == null)
                {
                    Error = "Sin Combo a llenar";
                    return false;
                }

                if (string.IsNullOrEmpty(CampoPK))
                {
                    Error = "Falta el dato de la aplicación";
                    return false;
                }

                if (string.IsNullOrEmpty(CampoTexto))
                {
                    Error = "Falta el dato de la aplicación";
                    return false;
                }

                clsLlenarCombos objXX = new clsLlenarCombos(strApp);//Creamos el objeto de la clase llenar cpmbo
                objXX.SQL = SQL;
                objXX.campoID = CampoPK;
                objXX.campoTexto = CampoTexto;
                if (!objXX.llenarComboWeb(Combo)) //Enviamos el combo que llegó como argumento
                {
                    Error = objXX.Error;
                    objXX = null;
                    return false;
                }

                objXX = null;
                return true;
            }
            catch (Exception ex)
            {
                Error = ex.Message;
                return false;
            }
        }
        public bool llenarRadioBL(RadioButtonList radioBL, string SQL, string CampoPK, string CampoTexto)
        {
            try
            {
                if (string.IsNullOrEmpty(strApp))
                {
                    Error = "Falta el nombre de la aplicación";
                    return false;
                }

                if (radioBL == null)
                {
                    Error = "Sin Radios a llenar";
                    return false;
                }

                if (string.IsNullOrEmpty(CampoPK))
                {
                    Error = "Falta el dato de la aplicación";
                    return false;
                }

                if (string.IsNullOrEmpty(CampoTexto))
                {
                    Error = "Falta el dato de la aplicación";
                    return false;
                }

                clsLlenarRBList objXX = new clsLlenarRBList(strApp);
                objXX.SQL = SQL;
                objXX.campoID = CampoPK;
                objXX.campoTexto = CampoTexto;
                if (!objXX.llenarRadioBLWeb(radioBL))
                {
                    Error = objXX.Error;
                    objXX = null;
                    return false;
                }
                objXX = null;
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
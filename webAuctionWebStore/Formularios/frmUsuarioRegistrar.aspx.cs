using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace webAuctionWebStore.Formularios
{
    public partial class Formulario_web11 : System.Web.UI.Page
    {

        #region "Variables globales"

        static string strApp; // Para capturar el nombre de la aplicación
        static int intControl;//Captura el código del usuario agregado
        static int intOpcion;//0:Nada, 1:insertar(Agregar), 2:Update(Modificar) dependiendo del objeto mnuOpciones/no se modifica la clave primaria
        //static int strDocumento;//Captuar el código del estudiante como es la clave primaria viaja mas a la base de datos para que conserve el valor
        string strDocumento, strTipoDoc, strNombre,strApelido, strNroTel, strDirec, strCompleDireccion, strEmail, strContasenia,strConfiContra;
        int intCiudad,intDepto,intRol,intEstado,intCodUsu;


        //bool blnActivo;

        #endregion

        #region "Métodos propios"
        private void Mensaje(string texto)
        {
            this.lblMsj.Text = texto;
        }

        private void llenarDepartamento()
        {

            Clases.clsDepartamento objBuscar = new Clases.clsDepartamento(strApp); //Aprtir de la carpeta Clases(Empaquetado)
            if (!objBuscar.llenarCombo(this.ddlDepart))
            {
                Mensaje(objBuscar.Error);
                return;
            }
            intDepto = Convert.ToInt16(this.ddlDepart.SelectedValue);//El select value el el código asociado al texto visible

            llenarComboCiudad(intDepto);
        }

        private void llenarComboCiudad(int idDepto)
        {

            Clases.clsCiudad objBuscar = new Clases.clsCiudad(strApp); //Aprtir de la carpeta Clases(Empaquetado)
            if (!objBuscar.llenarComboXDepto(ddlCiudad, idDepto))
            {
                Mensaje(objBuscar.Error);
                return;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                strDocumento = this.txtDoc.Text.Trim();// Captura del formulario el documento de la persona
                if (string.IsNullOrEmpty(strDocumento))
                {
                    Mensaje("Documento No Válido");
                    this.txtDoc.ReadOnly = false;//Queda habilitado para volver a ingresar el código
                    this.txtDoc.Focus();
                    return;
                }           
                delete(strDocumento);

                lblMsj.Text = "Registro borrado correctamente";
            }
            catch (Exception ex)
            {
                Mensaje("Error -> " + ex.Message);
            }
        }

        private void llenarTipoRol()
        {

            Clases.clsRol objBuscar = new Clases.clsRol(strApp); //Aprtir de la carpeta Clases(Empaquetado)
            if (!objBuscar.llenarCombo(this.ddlRol))
            {
                Mensaje(objBuscar.Error);
                return;
            }
        }

        private void llenarEstado()
        {

            Clases.clsEstado objBuscar = new Clases.clsEstado(strApp); //Aprtir de la carpeta Clases(Empaquetado)
            if (!objBuscar.llenarCombo(this.ddlEstado))
            {
                Mensaje(objBuscar.Error);
                return;
            }
        }

        private void llenarTipoDoc()
        {

            Clases.clsTipoDoc objBuscar = new Clases.clsTipoDoc(strApp); //Aprtir de la carpeta Clases(Empaquetado)
            if (!objBuscar.llenarCombo(this.ddlTipoDoc))
            {
                Mensaje(objBuscar.Error);
                return;
            }
        }

        private void Limpiar()
        {
            this.txtDoc.Text = string.Empty;
            this.ddlTipoDoc.SelectedIndex = 0;
            this.txtNombre.Text = string.Empty;
            this.txtApellido.Text = string.Empty;
            this.txtTel.Text = string.Empty;
            this.ddlDepart.SelectedIndex = 0;
            //this.ddlCiudad.Items.Clear();
            this.ddlRol.SelectedIndex = 0;
            this.txtDireccion.Text = string.Empty;
            this.txtComplDirec.Text = string.Empty;
            this.ddlEstado.SelectedIndex = 0;
            this.txtEmail.Text = string.Empty;
            this.txtContra.Text = string.Empty;
            this.txtConfrContra.Text = string.Empty;

            //Llenar Combo ciudad acorde a departamento
            int depto = Convert.ToInt16(this.ddlDepart.SelectedValue);
            llenarComboCiudad(depto);
            
        }

        private bool Grabar()
        {
            //Captura la información ya sea para insertar o para modificar
            try
            {

                strDocumento = this.txtDoc.Text.Trim();
                strTipoDoc = this.ddlTipoDoc.SelectedValue;
                strNombre = this.txtNombre.Text.Trim();
                strApelido = this.txtApellido.Text.Trim();
                strNroTel = this.txtTel.Text.Trim();
                intCiudad = Convert.ToInt16(this.ddlCiudad.SelectedValue);
                intRol = Convert.ToInt16(this.ddlRol.SelectedValue);
                strDirec = this.txtDireccion.Text.Trim() +" "+ this.txtComplDirec.Text.Trim();
                intEstado = Convert.ToInt16(this.ddlEstado.SelectedValue);
                strEmail = this.txtEmail.Text.Trim();
                strContasenia = this.txtContra.Text;
                strConfiContra = this.txtConfrContra.Text;

                if (string.IsNullOrEmpty(strNombre))
                {
                    Mensaje("Nombre no válido");
                    this.txtNombre.Focus();
                    return false;
                }
                if (string.IsNullOrEmpty(strEmail))
                {
                    Mensaje("Correo no válido");
                    this.txtEmail.Focus();
                    return false;
                }
                if (string.IsNullOrEmpty(strContasenia) )
                {
                    Mensaje("Contraseña no válida");
                    this.txtContra.Focus();
                    return false;
                }
                if (string.IsNullOrEmpty(strConfiContra))
                {
                    Mensaje("Contraseña no válida");
                    this.txtConfrContra.Focus();
                    return false;
                }
                if (strConfiContra != strContasenia)
                {
                    Mensaje("Contraseña no coincide");
                    this.txtConfrContra.Focus();
                    return false;
                }
                if (intRol<= 0)
                {
                    Mensaje("Seleccione un Rol");
                    this.ddlRol.Focus();
                    return false;
                }
                if (string.IsNullOrEmpty(strTipoDoc))
                {
                    Mensaje("Seleccione un tipo de documento");
                    this.ddlTipoDoc.Focus();
                    return false;
                }
                if (intRol <= 0)
                {
                    Mensaje("Seleccione un Rol");
                    this.ddlRol.Focus();
                    return false;
                }

                if (intCiudad < 0)
                {
                    Mensaje("Seleccione un estado");
                    this.ddlEstado.Focus();
                    return false;
                }
                Clases.clsUsuario objX = new Clases.clsUsuario(strApp);

                objX.Documento =strDocumento;
                objX.TipoDoc = strTipoDoc;
                objX.Nombre = strNombre;
                objX.Apellido = strApelido;
                objX.Ciudad = intCiudad;
                objX.Rol = intRol;
                objX.Dir = strDirec;
                objX.Tel = strNroTel;
                objX.Estado = intEstado;
                objX.Email = strEmail;
                objX.Contrasenia = strContasenia;

                ////if (intOpcion == 1)
                ////{
                    if (!objX.grabarUsurio())
                    {
                        Mensaje(objX.Error);
                        objX = null;
                        this.txtDoc.Focus();
                        return false;
                    }
                //}
                //else if (intOpcion == 2)
                //{
                //    if (!objX.modificarControl())
                //    {
                //        Mensaje(objX.Error);
                //        objX = null;
                //        this.txtDia.Focus();
                //        return false;
                //    }
                //}
                //else
                //{
                //    Mensaje("Error No clasificado -> Consultar con admón. del Sistema");
                //    objX = null;
                //    this.txtNombre.Focus();
                //    return false;
                //}
                intControl = Convert.ToInt32(objX.Respuesta);
                if (Convert.ToString(intControl) == "-1")
                {
                    Mensaje("Ya existe un registro con el mismo id");
                    objX = null;
                    this.txtDoc.Focus();
                    return false;
                }
                if (Convert.ToString(intControl) == "0")
                {
                    Mensaje("Error al realizar el procedimiento");
                    objX = null;
                    this.txtDoc.Focus();
                    return false;
                }
                objX = null;
                this.txtDoc.Text = Convert.ToString(intControl);
                this.txtDoc.ReadOnly = true;
                this.txtDoc.Focus();
                Mensaje("Registro Grabado con éxito");
                Limpiar();
                //Buscar(intControl);//tambien se encarga de actualizar el grid
                return true;
            }
            
            catch
            {
                Mensaje("Error en el grabar");
                return false;
            }
        }

        private bool Modificar()
        {
            //Captura la información ya sea para insertar o para modificar
            try
            {
                //strDocumento = this.txtDoc.Text.Trim();
                //strTipoDoc = this.ddlTipoDoc.SelectedValue;
                strNombre = this.txtNombre.Text.Trim();
                strApelido = this.txtApellido.Text.Trim();
                strNroTel = this.txtTel.Text.Trim();
                intCiudad = Convert.ToInt16(this.ddlCiudad.SelectedValue);
                intRol = Convert.ToInt16(this.ddlRol.SelectedIndex);
                strDirec = this.txtDireccion.Text.Trim() + " " + this.txtComplDirec.Text.Trim();
                intEstado = Convert.ToInt16(this.ddlEstado.SelectedIndex.ToString());
                strEmail = this.txtEmail.Text.Trim();
                strContasenia = this.txtContra.Text;
                strConfiContra = this.txtConfrContra.Text;
                intCodUsu = Convert.ToInt16(this.lblCodUsuario.Text);


                if (string.IsNullOrEmpty(strNombre))
                {
                    Mensaje("Nombre no válido");
                    this.txtNombre.Focus();
                    return false;
                }
                if (string.IsNullOrEmpty(strEmail))
                {
                    Mensaje("Correo no válido");
                    this.txtEmail.Focus();
                    return false;
                }
                if (string.IsNullOrEmpty(strContasenia))
                {
                    Mensaje("Contraseña no válida");
                    this.txtContra.Focus();
                    return false;
                }
                if (string.IsNullOrEmpty(strConfiContra))
                {
                    Mensaje("Contraseña no válida");
                    this.txtConfrContra.Focus();
                    return false;
                }
                if (strConfiContra != strContasenia)
                {
                    Mensaje("Contraseña no coincide");
                    this.txtConfrContra.Focus();
                    return false;
                }
                if (intRol <= 0)
                {
                    Mensaje("Seleccione un Rol");
                    this.ddlRol.Focus();
                    return false;
                }
                if (string.IsNullOrEmpty(strDirec))
                {
                    Mensaje("Dirección no válida");
                    this.ddlTipoDoc.Focus();
                    return false;
                }
                if (string.IsNullOrEmpty(strNroTel))
                {
                    Mensaje("Teléfono no válido");
                    this.ddlTipoDoc.Focus();
                    return false;
                }
                if (intEstado <= 0)
                {
                    Mensaje("Seleccione un estado");
                    this.ddlRol.Focus();
                    return false;
                }
                if (intDepto < 0)
                {
                    Mensaje("Seleccione un departamento");
                    this.ddlDepart.Focus();
                    return false;
                }
                if (intCiudad < 0)
                {
                    Mensaje("Seleccione una ciudad");
                    this.ddlCiudad.Focus();
                    return false;
                }

                Clases.clsUsuario objX = new Clases.clsUsuario(strApp);

                //objX.Documento = strDocumento;
                //objX.TipoDoc = strTipoDoc;
                objX.Nombre = strNombre;
                objX.Apellido = strApelido;
                objX.Ciudad = intCiudad;
                objX.Rol = intRol;
                objX.Dir = strDirec;
                objX.Tel = strNroTel;
                objX.Estado = intEstado;
                objX.Email = strEmail;
                objX.Contrasenia = strContasenia;
                objX.IdUsuario = intCodUsu;

                if (!objX.modificar())
                {
                   Mensaje(objX.Error);
                   objX = null;
                   this.txtNombre.Focus();
                   return false;
                }

                intControl = Convert.ToInt32(objX.Respuesta);
                if (Convert.ToString(intControl) == "-1")
                {
                    Mensaje("Ya existe un registro con el mismo documento");
                    objX = null;
                    this.txtNombre.Focus();
                    return false;
                }
                if (Convert.ToString(intControl) == "0")
                {
                    Mensaje("Error al realizar el procedimiento");
                    objX = null;
                    this.txtNombre.Focus();
                    return false;
                }
                objX = null;
                /*this.txtControl.Text = Convert.ToString(intControl);
                this.txtControl.ReadOnly = true;*/
                this.txtNombre.Focus();
                Mensaje("Registro Grabado con éxito");
                //Buscar(intControl);//tambien se encarga de actualizar el grid
                return true;
            }
            catch
            {
                Mensaje("Error en el grabar");
                return false;
            }
        }

        private void delete(string userDocument)
        {
            
            Clases.clsUsuario objBuscar = new Clases.clsUsuario(strApp);
            if (!objBuscar.deleteUser(userDocument))
            {
                Limpiar();
                Mensaje(objBuscar.Error);
                objBuscar = null;
                return;
            }
            Limpiar();

            return;
        }

        private void Buscar(string Documento)
        {
            Limpiar();
            Clases.clsUsuario objBuscar = new Clases.clsUsuario(strApp);
            if (!objBuscar.buscarUsuario(Documento))
            {
                Limpiar();
                Mensaje(objBuscar.Error);
                objBuscar = null;
                return;
            }
            this.lblCodUsuario.Text= Convert.ToString(objBuscar.IdUsuario);
            this.txtDoc.Text = Convert.ToString(objBuscar.Documento);
            this.ddlTipoDoc.SelectedValue = Convert.ToString(objBuscar.TipoDoc);
            this.txtNombre.Text = Convert.ToString(objBuscar.Nombre);
            this.txtApellido.Text = Convert.ToString(objBuscar.Apellido);
            this.txtTel.Text = Convert.ToString(objBuscar.Tel);
            this.ddlDepart.SelectedValue = Convert.ToString(objBuscar.Departamento);
            llenarComboCiudad(objBuscar.Departamento);
            int ciud= Convert.ToInt32(objBuscar.Ciudad);
            this.ddlCiudad.SelectedValue = ciud.ToString();
            this.ddlRol.SelectedValue = Convert.ToString(objBuscar.Rol);
            this.txtDireccion.Text = Convert.ToString(objBuscar.Dir);
            this.txtApellido.Text = Convert.ToString(objBuscar.Apellido);
            this.ddlEstado.SelectedValue = Convert.ToString(objBuscar.Estado);
            this.txtEmail.Text = Convert.ToString(objBuscar.Email);
            this.txtContra.Text = Convert.ToString(objBuscar.Contrasenia);
            this.txtConfrContra.Text = Convert.ToString(objBuscar.Contrasenia);
            return;
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) //Pregunta si es la primera vez que se carga el formulario
            {
                //Para capturar el nombre del proyecto por código
                strApp = System.Reflection.Assembly.GetExecutingAssembly().GetName().Name;
                //intOpcion = 0;
                llenarTipoDoc();
                llenarDepartamento();
                llenarTipoRol();
                llenarEstado();
                //llenarGrid();


            }
        }

        protected void ddlDepart_SelectedIndexChanged1(object sender, EventArgs e)
        {
            intDepto = Convert.ToInt16(this.ddlDepart.SelectedValue);

            llenarComboCiudad(intDepto);
        }

        /*   private void llenarGrid()
           {
               Clases.clsUsuario objBuscar = new Clases.clsUsuario(strApp);
               if (!objBuscar.llenarGrid(this.grvDatosUsuario, 23432)) //Le envio la clave primaria de la tabla programa
               {
                   Mensaje(objBuscar.Error);
                   return;
               }
           }*/

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Grabar();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            this.ibtnBuscar.Visible = true;
            this.txtDoc.ReadOnly = false;
            this.btnEliminar.Visible = false;
            this.btnModificar.Visible = false;
            this.btnRegistrar.Visible = false;
        }

        protected void ibtnBuscar_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                strDocumento = this.txtDoc.Text.Trim();// Captura del formulario el documento de la persona
                if (string.IsNullOrEmpty(strDocumento))
                {
                    Mensaje("Documento No Válido");
                    this.txtDoc.ReadOnly = false;//Queda habilitado para volver a ingresar el código
                    this.txtDoc.Focus();
                    return;
                }
                this.txtDoc.ReadOnly = true;//Desabilita el text box
                this.ibtnBuscar.Visible = false;
                this.btnGuardar.Visible = true;
                Buscar(strDocumento);
            }
            catch (Exception ex)
            {
                Mensaje("Error -> " + ex.Message);
            }
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            this.ibtnBuscar.Visible = false;
            this.btnEliminar.Visible = true;
            this.btnModificar.Visible = true;
            this.btnRegistrar.Visible = true;
            Modificar();
            Limpiar();
        }

    }
}
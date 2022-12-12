using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webAuctionWebStore.Formularios
{
    public partial class Formulario_web1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userName;

            if (!IsPostBack)
            {
                userName = Session["nameUser"].ToString() + " " +  Session["lastnameUser"].ToString();
                this.lblUserName.Text = userName;
            }
        }
    }
}
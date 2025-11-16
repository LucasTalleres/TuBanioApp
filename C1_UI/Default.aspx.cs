using C2_BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace C1_UI
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarResultados();
            }
        }

        private void CargarResultados()
        {
            LogicaNegocios conexion = new LogicaNegocios();
            var listaBanios = conexion.LeerBaño();
            gvResultados.DataSource = listaBanios;
            gvResultados.DataBind();
            gvResultados.Visible = listaBanios.Count > 0;
        }
    }
}
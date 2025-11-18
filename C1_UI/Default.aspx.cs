using C2_BLL;
using C4_MODEL;
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

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                string busca = txtUbicacion.Text.Trim();
                if (!string.IsNullOrEmpty(busca))
                {
                    LogicaNegocios ln = new LogicaNegocios();
                    List<Baño> resultados = ln.BuscarBaño(busca);
                    if (resultados != null && resultados.Count > 0)
                    {
                        gvResultados.DataSource = resultados;
                        gvResultados.DataBind();
                        gvResultados.Visible = true;
                        lblMensaje.Visible = false;
                    }
                    else
                    {
                        gvResultados.Visible = false;
                        lblMensaje.Text = "No se encontraron baños con ese nombre.";
                        lblMensaje.CssClass = "text-warning";
                        lblMensaje.Visible = true;
                    }
                }
                else
                {
                   
                    CargarResultados();
                    lblMensaje.Visible = false;
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al buscar: " + ex.Message;
                lblMensaje.CssClass = "text-danger";
                lblMensaje.Visible = true;
            }
        }
    }
}
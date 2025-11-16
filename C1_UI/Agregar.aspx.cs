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
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarResultados();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                // Validaciones básicas
                if (string.IsNullOrWhiteSpace(txtCalle.Text) || string.IsNullOrWhiteSpace(txtNumeracion.Text) ||
                    string.IsNullOrWhiteSpace(txtNombre.Text))
                {
                    lblMensaje.Text = "Por favor, complete todos los campos obligatorios.";
                    lblMensaje.CssClass = "text-danger";
                    lblMensaje.Visible = true;
                    return;
                }

                // Parsear con validación
                int numeracion;
                if (!int.TryParse(txtNumeracion.Text, out numeracion))
                {
                    lblMensaje.Text = "La numeración debe ser un número entero.";
                    lblMensaje.CssClass = "text-danger";
                    lblMensaje.Visible = true;
                    return;
                }

                Baño nuevoBanio = new Baño
                {
                    Calle = txtCalle.Text,
                    Numeracion = numeracion,
                    Nombre = txtNombre.Text,
                    Descripcion = txtDescripcion.Text,
                    Gratuito = chkGratuito.Checked,
                    Discapacitado = chkDiscapacitado.Checked,
                    CambiadorBebe = chkCambiadorBebe.Checked,
                    Mixto = chkMixto.Checked,
                    Ducha = chkDucha.Checked
                };

                // Manejar subida de imagen
                if (fuImagen.HasFile)
                {
                    string fileName = Server.MapPath("~/Images/") + fuImagen.FileName;
                    fuImagen.SaveAs(fileName);
                    nuevoBanio.Imagen = "~/Images/" + fuImagen.FileName;
                }
                else
                {
                    nuevoBanio.Imagen = ""; // O un valor por defecto
                }

                LogicaNegocios conexion = new LogicaNegocios();
                conexion.AgregarBaño(nuevoBanio);

                lblMensaje.Text = "Baño agregado exitosamente.";
                lblMensaje.CssClass = "text-success";
                lblMensaje.Visible = true;

                CargarResultados();
                VaciarCampos();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al agregar: " + ex.Message;
                lblMensaje.CssClass = "text-danger";
                lblMensaje.Visible = true;
            }
        }
        

        protected void btnVaciar_Click(object sender, EventArgs e)
        {
            VaciarCampos();
        }

        private void VaciarCampos()
        {
            txtCalle.Text = "";
            txtNumeracion.Text = "";
            txtNombre.Text = "";
            txtDescripcion.Text = "";
            fuImagen.Attributes.Clear(); // Limpia el FileUpload
            chkGratuito.Checked = false;
            chkDiscapacitado.Checked = false;
            chkCambiadorBebe.Checked = false;
            chkMixto.Checked = false;
            chkDucha.Checked = false;
            lblMensaje.Visible = false;
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
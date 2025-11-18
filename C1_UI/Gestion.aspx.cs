using C2_BLL;
using C4_MODEL;
using System;
using System.Collections.Generic;
using System.IO;  
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace C1_UI
{
    public partial class Gestion : Page
    {

        private int bañoSeleccionadoId
        {
            get
            {
                if (ViewState["bañoSeleccionadoId"] != null)
                {
                    return (int)ViewState["bañoSeleccionadoId"];
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                ViewState["bañoSeleccionadoId"] = value;
            }
        }

        private string imagenActual
        {
            get
            {
                if (ViewState["imagenActual"] != null)
                {
                    return (string)ViewState["imagenActual"];
                }
                else
                {
                    return "";
                }
            }
            set
            {
                ViewState["imagenActual"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarBaniosEnDropDown();
            }
        }

       
        protected void ddlBanios_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlBanios.SelectedValue != "0" && !string.IsNullOrEmpty(ddlBanios.SelectedValue))
            {
                bañoSeleccionadoId = int.Parse(ddlBanios.SelectedValue);
                CargarDatosBaño(bañoSeleccionadoId);
            }
            else
            {
                
                VaciarCampos();
                bañoSeleccionadoId = 0;
                imagenActual = "";  
                btnAgregar.Visible = true;
                btnActualizar.Visible = false;
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            if (ddlBanios.SelectedValue != "0" && !string.IsNullOrEmpty(ddlBanios.SelectedValue))
            {
                bañoSeleccionadoId = int.Parse(ddlBanios.SelectedValue);
                CargarDatosBaño(bañoSeleccionadoId); 

              
                btnAgregar.Visible = false;
                btnActualizar.Visible = true;
                lblMensaje.Text = $"Modo edición activado para: {txtNombre.Text}";
                lblMensaje.CssClass = "text-info";
                lblMensaje.Visible = true;
            }
            else
            {
                lblMensaje.Text = "Selecciona un baño válido para editar.";
                lblMensaje.CssClass = "text-warning";
                lblMensaje.Visible = true;
            }
        }

       
        private void CargarDatosBaño(int id)
        {
            LogicaNegocios conexion = new LogicaNegocios();
            var banios = conexion.LeerBaño();
            if (banios == null || banios.Count == 0)
            {
                lblMensaje.Text = "No hay baños en la base de datos.";
                lblMensaje.CssClass = "text-warning";
                lblMensaje.Visible = true;
                return;
            }
            var banio = banios.FirstOrDefault(b => b.Id == id);
            if (banio != null)
            {
                txtCalle.Text = banio.Calle;
                txtNumeracion.Text = banio.Numeracion.ToString();
                txtNombre.Text = banio.Nombre;
                txtDescripcion.Text = banio.Descripcion;
                chkGratuito.Checked = banio.Gratuito;
                chkDiscapacitado.Checked = banio.Discapacitado;
                chkCambiadorBebe.Checked = banio.CambiadorBebe;
                chkMixto.Checked = banio.Mixto;
                chkDucha.Checked = banio.Ducha;
                imagenActual = banio.Imagen; 
            }
            else
            {
                lblMensaje.Text = "Baño no encontrado.";
                lblMensaje.CssClass = "text-danger";
                lblMensaje.Visible = true;
            }
        }

        private void CargarBaniosEnDropDown()
        {
            LogicaNegocios conexion = new LogicaNegocios();
            var banios = conexion.LeerBaño();
            if (banios != null && banios.Count > 0)
            {
                ddlBanios.DataSource = banios;
                ddlBanios.DataTextField = "Nombre";
                ddlBanios.DataValueField = "Id";
                ddlBanios.DataBind();
                ddlBanios.Items.Insert(0, new ListItem("Seleccionar Baño", "0"));
            }
            else
            {
                ddlBanios.Items.Clear();
                ddlBanios.Items.Add(new ListItem("No hay baños disponibles", "0"));
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                if (bañoSeleccionadoId == 0)
                {
                    lblMensaje.Text = "No hay baño seleccionado para actualizar.";
                    lblMensaje.CssClass = "text-danger";
                    lblMensaje.Visible = true;
                    return;
                }

          
                if (string.IsNullOrWhiteSpace(txtCalle.Text) || string.IsNullOrWhiteSpace(txtNumeracion.Text) ||
                    string.IsNullOrWhiteSpace(txtNombre.Text))
                {
                    lblMensaje.Text = "Por favor, complete todos los campos obligatorios.";
                    lblMensaje.CssClass = "text-danger";
                    lblMensaje.Visible = true;
                    return;
                }

                int numeracion;
                if (!int.TryParse(txtNumeracion.Text, out numeracion))
                {
                    lblMensaje.Text = "La numeración debe ser un número entero.";
                    lblMensaje.CssClass = "text-danger";
                    lblMensaje.Visible = true;
                    return;
                }

                Baño banioModificado = new Baño
                {
                    Id = bañoSeleccionadoId,
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

              
                if (fuImagen.HasFile)
                {
                    string imagesPath = Server.MapPath("~/Images/");
                    if (!Directory.Exists(imagesPath))
                    {
                        Directory.CreateDirectory(imagesPath);  
                    }
                    string fileName = Path.Combine(imagesPath, fuImagen.FileName);
                    fuImagen.SaveAs(fileName);
                    banioModificado.Imagen = "~/Images/" + fuImagen.FileName;
                }
                else
                {
                    banioModificado.Imagen = imagenActual;  
                }

                LogicaNegocios conexion = new LogicaNegocios();
                conexion.ModificarBaño(banioModificado);

                lblMensaje.Text = "Baño actualizado exitosamente.";
                lblMensaje.CssClass = "text-success";
                lblMensaje.Visible = true;

            
                bañoSeleccionadoId = 0;
                imagenActual = ""; 
                btnAgregar.Visible = true;
                btnActualizar.Visible = false;
                VaciarCampos();
                CargarBaniosEnDropDown();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al actualizar: " + ex.Message;
                lblMensaje.CssClass = "text-danger";
                lblMensaje.Visible = true;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (ddlBanios.SelectedValue != "0")
            {
                try
                {
                    int idEliminar = int.Parse(ddlBanios.SelectedValue);
                    Baño banioEliminar = new Baño { Id = idEliminar };
                    LogicaNegocios conexion = new LogicaNegocios();
                    conexion.EliminarBaño(banioEliminar);

                    lblMensaje.Text = "Baño eliminado exitosamente.";
                    lblMensaje.CssClass = "text-success";
                    lblMensaje.Visible = true;

                    CargarBaniosEnDropDown();
                    VaciarCampos();
                }
                catch (Exception ex)
                {
                    lblMensaje.Text = "Error al eliminar: " + ex.Message;
                    lblMensaje.CssClass = "text-danger";
                    lblMensaje.Visible = true;
                }
            }
            else
            {
                lblMensaje.Text = "Selecciona un baño para eliminar.";
                lblMensaje.CssClass = "text-warning";
                lblMensaje.Visible = true;
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                
                if (string.IsNullOrWhiteSpace(txtCalle.Text) || string.IsNullOrWhiteSpace(txtNumeracion.Text) ||
                    string.IsNullOrWhiteSpace(txtNombre.Text))
                {
                    lblMensaje.Text = "Por favor, complete todos los campos obligatorios.";
                    lblMensaje.CssClass = "text-danger";
                    lblMensaje.Visible = true;
                    return;
                }

              
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

               
                if (fuImagen.HasFile)
                {
                    string imagesPath = Server.MapPath("~/Images/");
                    if (!Directory.Exists(imagesPath))
                    {
                        Directory.CreateDirectory(imagesPath);  
                    }
                    string fileName = Path.Combine(imagesPath, fuImagen.FileName);
                    fuImagen.SaveAs(fileName);
                    nuevoBanio.Imagen = "~/Images/" + fuImagen.FileName;
                }
                else
                {
                    nuevoBanio.Imagen = "";
                }

                LogicaNegocios conexion = new LogicaNegocios();
                conexion.AgregarBaño(nuevoBanio);

                lblMensaje.Text = "Baño agregado exitosamente.";
                lblMensaje.CssClass = "text-success";
                lblMensaje.Visible = true;

                VaciarCampos();
                CargarBaniosEnDropDown();
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
            bañoSeleccionadoId = 0;
            imagenActual = "";  
            btnAgregar.Visible = true;
            btnActualizar.Visible = false;
        }

        private void VaciarCampos()
        {
            txtCalle.Text = "";
            txtNumeracion.Text = "";
            txtNombre.Text = "";
            txtDescripcion.Text = "";
            fuImagen.Attributes.Clear();
            chkGratuito.Checked = false;
            chkDiscapacitado.Checked = false;
            chkCambiadorBebe.Checked = false;
            chkMixto.Checked = false;
            chkDucha.Checked = false;
            lblMensaje.Visible = false;
        }
    }
}

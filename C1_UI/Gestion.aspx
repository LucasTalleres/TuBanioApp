<%@ Page Title="Gestion de Baño Público" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Gestion.aspx.cs" Inherits="C1_UI.Gestion" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        
        <div class="row justify-content-center mb-4">
            <div class="col-lg-8">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h2 class="h5 mb-0">Seleccionar Baño para Editar o Eliminar</h2>
                    </div>
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-md-8">
                                <label for="ddlBanios" class="form-label">Seleccionar Baño</label>
                                <asp:DropDownList ID="ddlBanios" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlBanios_SelectedIndexChanged">
                                    <asp:ListItem Text="Seleccionar Baño" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-4 d-flex align-items-end">
                                <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-primary me-2" OnClick="btnEditar_Click" />
                                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClientClick="$('#confirmEliminarModal').modal('show'); return false;" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

       
        <div class="row justify-content-center mb-4">
            <div class="col-lg-8">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h2 class="h5 mb-0">Agregar/Editar Baño Público</h2>
                    </div>
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="txtCalle" class="form-label">Calle (Ubicación)</label>
                                <asp:TextBox ID="txtCalle" runat="server" CssClass="form-control" Placeholder="Ej: Calle Principal"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvCalle" runat="server" ControlToValidate="txtCalle" ErrorMessage="La calle es obligatoria." CssClass="text-danger" Display="Dynamic" />
                            </div>
                            <div class="col-md-3">
                                <label for="txtNumeracion" class="form-label">Numeración</label>
                                <asp:TextBox ID="txtNumeracion" runat="server" CssClass="form-control" TextMode="Number" Placeholder="Ej: 123"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvNumeracion" runat="server" ControlToValidate="txtNumeracion" ErrorMessage="La numeración es obligatoria." CssClass="text-danger" Display="Dynamic" />
                            </div>
                            <div class="col-md-3">
                                <label for="txtNombre" class="form-label">Nombre</label>
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Placeholder="Ej: Baño Central"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="El nombre es obligatorio." CssClass="text-danger" Display="Dynamic" />
                            </div>
                        </div>
                        <div class="row g-3 mt-2">
                            <div class="col-md-6">
                                <label for="txtDescripcion" class="form-label">Descripción</label>
                                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" Placeholder="Descripción breve"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="La descripción es obligatoria." CssClass="text-danger" Display="Dynamic" />
                            </div>
                            <div class="col-md-5">
                                <label for="fuImagen" class="form-label">Imagen</label>
                                <asp:FileUpload ID="fuImagen" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="row g-3 mt-2">
                            <div class="col-12">
                                <div class="form-check">
                                    <asp:CheckBox ID="chkGratuito" runat="server" />
                                    <label class="form-check-label" for="chkGratuito">Gratuito(En caso de no necesitar compra minima)</label>
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chkDiscapacitado" runat="server"  />
                                    <label class="form-check-label" for="chkDiscapacitado">Para Discapacitado</label>
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chkCambiadorBebe" runat="server" />
                                    <label class="form-check-label" for="chkCambiadorBebe">Con Cambiador de Bebé</label>
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chkMixto" runat="server"  />
                                    <label class="form-check-label" for="chkMixto">Mixto</label>
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chkDucha" runat="server"/>
                                    <label class="form-check-label" for="chkDucha">Con Ducha</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="d-flex gap-2 mt-3">
                            <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary flex-fill" OnClientClick="$('#confirmAgregarModal').modal('show'); return false;" />
                            <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" CssClass="btn btn-success flex-fill" OnClick="btnActualizar_Click" OnClientClick="$('#confirmActualizarModal').modal('show'); return false;" Visible="false" />
                            <asp:Button ID="btnVaciar" runat="server" Text="Vaciar Campos" CssClass="btn btn-secondary flex-fill" OnClick="btnVaciar_Click" CausesValidation="false" />
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-lg-8">
                <asp:Label ID="lblMensaje" runat="server" CssClass="text-success" Visible="false"></asp:Label>
            </div>
        </div>

        <div class="modal fade" id="confirmAgregarModal" tabindex="-1" aria-labelledby="confirmAgregarLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmAgregarLabel">Confirmar Agregar Baño</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        ¿Estás seguro de agregar este baño?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <asp:Button ID="btnConfirmAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="btnAgregar_Click" />
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="confirmActualizarModal" tabindex="-1" aria-labelledby="confirmActualizarLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmActualizarLabel">Confirmar Actualizar Baño</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        ¿Estás seguro de actualizar este baño?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <asp:Button ID="btnConfirmActualizar" runat="server" Text="Actualizar" CssClass="btn btn-success" OnClick="btnActualizar_Click" />
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="confirmEliminarModal" tabindex="-1" aria-labelledby="confirmEliminarLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmEliminarLabel">Confirmar Eliminar Baño</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        ¿Estás seguro de eliminar este baño? Esta acción no se puede deshacer.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <asp:Button ID="btnConfirmEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnEliminar_Click" />
                    </div>
                </div>
            </div>
        </div>
        
    </main>
</asp:Content>
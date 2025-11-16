<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agregar.aspx.cs" Inherits="C1_UI.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div class="row justify-content-center mb-4">
            <div class="col-lg-8">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h2 class="h5 mb-0">Agregar Baño Público</h2>
                    </div>
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="txtCalle" class="form-label">Calle (Ubicación)</label>
                                <asp:TextBox ID="txtCalle" runat="server" CssClass="form-control" Placeholder="Ej: Calle Principal" required></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label for="txtNumeracion" class="form-label">Numeración</label>
                                <asp:TextBox ID="txtNumeracion" runat="server" CssClass="form-control" TextMode="Number" Placeholder="Ej: 123" required></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label for="txtNombre" class="form-label">Nombre</label>
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Placeholder="Ej: Baño Central" required></asp:TextBox>
                            </div>
                        </div>
                        <div class="row g-3 mt-2">
                            <div class="col-md-6">
                                <label for="txtDescripcion" class="form-label">Descripción</label>
                                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" Placeholder="Descripción breve" required></asp:TextBox>
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
                            <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary flex-fill" OnClick="btnAgregar_Click" />
                            <asp:Button ID="btnVaciar" runat="server" Text="Vaciar Campos" CssClass="btn btn-secondary flex-fill" OnClick="btnVaciar_Click" />
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!-- Sección para mostrar resultados -->
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow-sm">
                    <div class="card-header bg-success text-white">
                        <h2 class="h5 mb-0">Resultados de Baños Agregados</h2>
                    </div>
                    <div class="card-body">
                        <asp:Label ID="lblMensaje" runat="server" CssClass="text-success" Visible="false"></asp:Label>
                        <asp:GridView ID="gvResultados" runat="server" CssClass="table table-striped w-100 grid-sin-corte" AutoGenerateColumns="false" Visible="false">
                            <Columns>
                                <asp:BoundField DataField="Calle" HeaderText="Calle" ItemStyle-Width="20%" />
                                <asp:BoundField DataField="Numeracion" HeaderText="Numeración" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" ItemStyle-Width="20%" />
                                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" ItemStyle-Width="50%" />
                                <asp:TemplateField HeaderText="Gratuito" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkGratuito" runat="server" Enabled="false" Checked='<%# Convert.ToBoolean(Eval("Gratuito")) %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Discapacitado" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkDiscapacitado" runat="server" Enabled="false" Checked='<%# Convert.ToBoolean(Eval("Discapacitado")) %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Cambiador Bebé" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkCambiadorBebe" runat="server" Enabled="false" Checked='<%# Convert.ToBoolean(Eval("CambiadorBebe")) %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Mixto" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkMixto" runat="server" Enabled="false" Checked='<%# Convert.ToBoolean(Eval("Mixto")) %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Ducha" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkDucha" runat="server" Enabled="false" Checked='<%# Convert.ToBoolean(Eval("Ducha")) %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
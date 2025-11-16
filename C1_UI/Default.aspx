<%@ Page Title="Buscar Baños Públicos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="C1_UI._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="container">
        <!-- Sección de introducción (hero) -->
        <section class="row mb-5" aria-labelledby="searchTitle">
            <div class="col-12 text-center">
                <h1 id="searchTitle" class="display-4">Encuentra Baños Públicos Cercanos</h1>
                <p class="lead">Ingresa tu ubicación y filtra por tus necesidades. ¡Rápido, fácil y accesible!</p>
            </div>
        </section>

        <!-- Formulario de búsqueda avanzada -->
        <div class="row justify-content-center mb-4">
            <div class="col-lg-8">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h2 class="h5 mb-0">Búsqueda Avanzada</h2>
                    </div>
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="txtUbicacion" class="form-label">Ubicación</label>
                                <asp:TextBox ID="txtUbicacion" runat="server" CssClass="form-control" Placeholder="Ej: Centro de la ciudad"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label for="ddlTipo" class="form-label">Tipo de Baño</label>
                                <asp:DropDownList ID="ddlTipo" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="Todos" Value="todos"></asp:ListItem>
                                    <asp:ListItem Text="Público" Value="publico"></asp:ListItem>
                                    <asp:ListItem Text="Compra Minima" Value="compraMin"></asp:ListItem>
                                    <asp:ListItem Text="Para Discapacitado" Value="discapacitado"></asp:ListItem>
                                    <asp:ListItem Text="Con Cambiador" Value="cambiador"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-3">
                                <label for="ddlDistancia" class="form-label">Distancia Máx.</label>
                                <asp:DropDownList ID="ddlDistancia" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="1 km" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="5 km" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="10 km" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="Sin límite" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row g-3 mt-2">
                            <div class="col-12">
                                <div class="form-check">
                                    <asp:CheckBox ID="chkAccesible" runat="server" />
                                    <label class="form-check-label" for="chkAccesible">Solo baños accesibles para discapacitados</label>
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chkAbierto" runat="server" />
                                    <label class="form-check-label" for="chkAbierto">Solo baños abiertos ahora</label>
                                </div>
                            </div>
                        </div>
                        <div class="d-grid mt-3">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Área de resultados -->
        <div class="row">
            <div class="col-12">
                <h2 class="h4 mb-3">Resultados de Búsqueda</h2>
                <div class="card shadow-sm">
                    <div class="card-body">
                        <asp:Label ID="Label1" runat="server" CssClass="text-success" Visible="false"></asp:Label>
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
                <!-- Mensaje de error o info -->
                <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
            </div>
        </div>

        <!-- Sección adicional: Consejos o mapa rápido -->
        <div class="row mt-5">
            <div class="col-md-6">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h3 class="card-title">Consejos para Usar la App</h3>
                        <ul class="list-unstyled">
                            <li><i class="bi bi-check-circle me-2 text-success"></i>Activa la ubicación en tu navegador para búsquedas precisas.</li>
                            <li><i class="bi bi-check-circle me-2 text-success"></i>Filtra por accesibilidad si necesitas opciones especiales.</li>
                            <li><i class="bi bi-check-circle me-2 text-success"></i>Deja reseñas para ayudar a otros usuarios.</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card shadow-sm">
                    <div class="card-body text-center">
                        <h3 class="card-title">Vista Rápida en Mapa</h3>
                        <p class="card-text">Explora baños cercanos visualmente.</p>
                        <a href="~/Mapa.aspx" class="btn btn-secondary" runat="server">Ir al Mapa</a>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
<%@ Page Title="Buscar Baños Públicos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="C1_UI._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="container">
        
        <section class="row mb-5" aria-labelledby="searchTitle">
            <div class="col-12 text-center">
                <h1 id="searchTitle" class="display-4">Encuentra Baños Públicos Cercanos</h1>
                <p class="lead">Ingresa tu ubicación y encuentra los baños mas cercanos a vos.</p>
            </div>
        </section>

        
        <div class="row justify-content-center mb-4">
            <div class="col-lg-8">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h2 class="h5 mb-0">Buscar</h2>
                    </div>
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-12">
                                <label for="txtUbicacion" class="form-label">Buscar por Nombre</label>
                                <div class="input-group">
                                    <asp:TextBox ID="txtUbicacion" runat="server" CssClass="form-control" Placeholder="Ej: Baño Central"></asp:TextBox>
                                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscar_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        <div class="row">
            <div class="col-12">
                <h2 class="h4 mb-3">Lista de Baños</h2>
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
                
                <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
            </div>
        </div>

        
       
    </main>
</asp:Content>
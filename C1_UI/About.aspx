<%@ Page Title="Acerca de" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="C1_UI.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title" class="container">
        <div class="row">
            <div class="col-12">
                <h2 id="title" class="display-4 text-center mb-4"><%: Title %></h2>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8">
                <div class="card shadow-sm mb-4">
                    <div class="card-body">
                        <h3 class="card-title">¿Qué es Buscador de Baños Públicos?</h3>
                        <p class="card-text">
                            Esta aplicación web está diseñada para ayudarte a encontrar baños públicos accesibles y limpios en tu ciudad o área cercana. 
                            Ya sea que estés de viaje, en una emergencia o simplemente explorando, nuestro buscador te permite localizar opciones rápidas y confiables.
                        </p>
                        <p class="card-text">
                            Utilizamos datos actualizados para mostrar ubicaciones, tipos de baños (e.g., con accesibilidad para discapacitados, cambiadores para bebés), 
                            horarios de apertura y reseñas de usuarios. ¡Nunca más te preocupes por dónde ir!
                        </p>
                    </div>
                </div>
                <div class="card shadow-sm mb-4">
                    <div class="card-body">
                        <h3 class="card-title">Características Principales</h3>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><i class="bi bi-search me-2"></i>Búsqueda por ubicación, filtros avanzados (accesibilidad, tipo, distancia).</li>
                            <li class="list-group-item"><i class="bi bi-map me-2"></i>Mapa interactivo para visualizar baños cercanos.</li>
                            <li class="list-group-item"><i class="bi bi-star me-2"></i>Reseñas y calificaciones de la comunidad.</li>
                            <li class="list-group-item"><i class="bi bi-phone me-2"></i>Información de contacto y horarios en tiempo real.</li>
                            <li class="list-group-item"><i class="bi bi-shield-check me-2"></i>Enfoque en privacidad y datos seguros.</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card shadow-sm mb-4">
                    <div class="card-body text-center">
                        <h4 class="card-title">¿Quieres Contribuir?</h4>
                        <p class="card-text">Ayúdanos a mejorar agregando reseñas o reportando nuevos baños públicos.</p>
                        <a href="~/Contact.aspx" class="btn btn-primary" runat="server">Contáctanos</a>
                    </div>
                </div>
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h4 class="card-title">Estadísticas Rápidas</h4>
                        <ul class="list-unstyled">
                            <li><strong>Baños Registrados:</strong> Más de 500 en la ciudad.</li>
                            <li><strong>Usuarios Activos:</strong> 10,000+ mensuales.</li>
                            <li><strong>Actualizaciones:</strong> Datos frescos cada semana.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-12 text-center">
                <p class="text-muted">Desarrollado con ASP.NET y Bootstrap para una experiencia fluida y accesible.</p>
            </div>
        </div>
    </main>
</asp:Content>
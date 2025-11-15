<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Mapa.aspx.cs" Inherits="C1_UI.Mapa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .full-screen-container {
            width: 100vw; /* Ancho completo de la pantalla */
            height: 100vh; /* Alto completo de la pantalla */
            position: fixed; /* Fija la imagen en pantalla completa sin afectar el layout */
            top: 0;
            left: 0;
            z-index: -1; /* Detrás de todo */
            overflow: hidden;
        }
        .full-screen-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .content-overlay {
            position: relative;
            z-index: 1;
            padding: 20px;
            min-height: 100vh; /* Empuja el footer hacia abajo */
        }
        .center-button-container {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 1;
        }
    </style>
    <div class="full-screen-container">
        <asp:Image ID="imgMapa" ImageUrl="~/Images/Mapa-TuBanio.png" AlternateText="Imagen del Mapa" CssClass="full-screen-image" runat="server" />
    </div>
    <div class="content-overlay">
        <!-- Aquí puedes agregar más contenido encima de la imagen si es necesario -->
        <div class="center-button-container">
            <button type="button" class="btn btn-primary btn-lg" title="Centrar mapa">
                <i class="bi bi-geo-alt"></i> <!-- Icono de geolocalización para centrar -->
            </button>
        </div>
    </div>

</asp:Content>
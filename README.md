# TuBaño - Proyecto Integrador

"TuBaño" es un Trabajo Práctico Integrador para la materia **Programación 2** de la Tecnicatura en Desarrollo de Software.

Es una solución tecnológica diseñada para abordar la necesidad de localizar baños accesibles al público. El objetivo del proyecto es brindar una aplicación comunitaria para encontrar estos lugares de forma confiable.

### Equipo de Desarrollo

  * **Product Owner:** Mateo Areosa
  * **Desarrollador Front-End:** Lucas Gonzalez
  * **Desarrollador Back-End:** Facundo Zabala

-----

## Características Principales

El objetivo general es crear una aplicación que facilite la localización de baños disponibles. Las funcionalidades planeadas a largo plazo incluyen un sistema de reseñas, filtros avanzados y un modelo de suscripción.

### Alcance del MVP (Producto Mínimo Viable)

La versión actual del proyecto se centra en entregar un MVP con las funcionalidades básicas de gestión de baños.

Las funciones del MVP son:

1.  **Buscar Baños:** Permite al usuario buscar en la base de datos los baños ya registrados.
2.  **Agregar Baños:** Un formulario para que los usuarios (o administradores) puedan agregar nuevos baños al sistema.
3.  **Editar Baños:** Permite modificar la información de un baño existente (ej. corregir dirección o detalles).
4.  **Eliminar Baños:** Permite quitar un baño de la base de datos.

-----

## Instrucciones de Instalación

Este proyecto está construido con **ASP.NET (C\#)** para el backend y **SQL Server** para la base de datos.

1.  **Clonar el repositorio:**

    ```bash
    git clone https://github.com/LucasTalleres/TuBanioApp.git
    ```

2.  **Navegar al directorio del proyecto:**

    ```bash
    cd TuBanioApp
    ```

3.  **Configurar la Base de Datos:**

      * Abre el proyecto en Visual Studio o tu editor de C\#.
      * Localiza el archivo `appsettings.json`.
      * Modifica la cadena de conexión (`ConnectionString`) para que apunte a tu instancia local de SQL Server y configura tus credenciales.

    *Ejemplo de `appsettings.json`:*

    ```json
    "ConnectionStrings": {
      "DefaultConnection": "Server=TU_SERVIDOR;Database=TuBanoDB;User Id=TU_USUARIO;Password=TU_PASSWORD;"
    }
    ```

4.  **Aplicar Migraciones (Entity Framework):**
    Si el proyecto usa Entity Framework Core, aplica las migraciones para crear la estructura de la base de datos.

    ```bash
    # Ejecuta esto en la Consola del Administrador de Paquetes (Visual Studio)
    Update-Database

    # O usa la terminal de .NET CLI
    dotnet ef database update
    ```

5.  **Ejecutar la aplicación:**

      * **Desde Visual Studio:** Presiona el botón "Play" (IIS Express o Kestrel).
      * **Desde .NET CLI:**
        ```bash
        dotnet build
        dotnet run
        ```

-----

##  Instrucciones de Uso

Una vez que la aplicación esté en funcionamiento, el flujo de uso del MVP es el siguiente:

  * **Buscar:** El usuario puede acceder a la función de búsqueda para encontrar un baño por nombre.
  * **Ver Detalles:** Al seleccionar un baño de la lista de búsqueda, se muestra su información básica.
  * **Agregar:** El usuario (o admin) puede navegar a la sección "Agregar Baño" y completar el formulario para crear un nuevo registro.
  * **Editar / Eliminar:** Sobre un baño existente, el usuario (o admin) tendrá las opciones para modificar su información o eliminarlo del sistema.

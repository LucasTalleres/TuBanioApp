using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using C3_DAL;
using C4_MODEL;

namespace C2_BLL
{
    public class LogicaNegocios
    {
        Conexion conexion = new Conexion();
        public readonly StringBuilder mensaje = new StringBuilder();

        public List<Baño> LeerBaño()
        {
            if (conexion.Leer() != null)
            {
                return conexion.Leer();
            }
            else
            {
                return null;
            }

        }
        public void AgregarBaño(Baño nuevo)
        {
            if (nuevo != null)
            {
                conexion.Agregar(nuevo);
            }
            else
            {
                mensaje.Append("Error al agregar el baño: objeto nulo");
            }
        }
        public void ModificarBaño(Baño modificado)
        {
            if (modificado != null)
            {
                conexion.Modificar(modificado);
            }
            else
            {
                mensaje.Append("Error al modificar el baño");
            }

        }
        public List<Baño> BuscarBaño(string busca)
        {
            if (conexion.Buscar(busca) != null)
            {
                return conexion.Buscar(busca);
            }
            else
            {
                return null;
            }
        }
        public void EliminarBaño(Baño banio)
        {
            if (banio.Id != 0)
            {
                conexion.Eliminar(banio.Id);
            }
            else
            {
                mensaje.Append("Error al eliminar");
            }
        }
    }
}
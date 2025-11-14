using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace C4_MODEL
{
    public class Baño
    {
        private int id;
        private string calle;
        private int numeracion;
        private string nombre;
        private string descripcion;
        private decimal calificacion;
        private string imagen;
        private bool gratuito;
        private bool discapacitado;
        private bool cambiadorBebe;
        private bool mixto;
        private bool ducha;
        public int Id { get => id; set => id = value; }
        public string Calle { get => calle; set => calle = value; }
        public int Numeracion { get => numeracion; set => numeracion = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Descripcion { get => descripcion; set => descripcion = value; }
        public decimal Calificacion { get => calificacion; set => calificacion = value; }
        public string Imagen { get => imagen; set => imagen = value; }
        public bool Gratuito { get => gratuito; set => gratuito = value; }
        public bool Discapacitado { get => discapacitado; set => discapacitado = value; }
        public bool CambiadorBebe { get => cambiadorBebe; set => cambiadorBebe = value; }
        public bool Mixto { get => mixto; set => mixto = value; }
        public bool Ducha { get => ducha; set => ducha = value; }

        public Baño()
        {

        }

        public Baño(int id, string calle, int numeracion, string nombre, string descripcion, decimal calificacion,
            string imagen, bool gratuito, bool discapacitado, bool cambiadorBebe, bool mixto, bool ducha)
        {
            Id = id;
            Calle = calle;
            Numeracion = numeracion;
            Nombre = nombre;
            Descripcion = descripcion;
            Calificacion = calificacion;
            Imagen = imagen;
            Gratuito = gratuito;
            Discapacitado = discapacitado;
            CambiadorBebe = cambiadorBebe;
            Mixto = mixto;
            Ducha = ducha;
        }

    }
}

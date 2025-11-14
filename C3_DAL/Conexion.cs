using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Sql;
using System.Threading.Tasks;
using C4_MODEL;
using System.Data.SqlClient;

namespace C3_DAL
{
    public class Conexion
    {
        SqlConnection conexion = new SqlConnection();
        SqlCommand comando = new SqlCommand();

        public List<Baño> Leer()
        {
            List<Baño> listaBaños = new List<Baño>();
            conexion.ConnectionString = "data source=DESKTOP-C1E04P7; initial catalog=AppTuBanio; integrated security=sspi";
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = "select * from Banio";
            comando.Connection = conexion;
            conexion.Open();

            SqlDataReader lector;
            lector = comando.ExecuteReader();

            while (lector.Read())
            {
                Baño aux = new Baño();
                aux.Id = lector.GetInt32(0);
                aux.Calle = lector.GetString(1);
                aux.Numeracion = lector.GetInt32(2);
                aux.Nombre = lector.GetString(3);
                aux.Descripcion = lector.GetString(4);
                aux.Calificacion = lector.GetDecimal(5);
                aux.Imagen = lector.GetString(6);
                aux.Gratuito = lector.GetBoolean(7);
                aux.Discapacitado = lector.GetBoolean(8);
                aux.CambiadorBebe = lector.GetBoolean(9);
                aux.Mixto = lector.GetBoolean(10);
                aux.Ducha = lector.GetBoolean(11);

                listaBaños.Add(aux);

            }
            conexion.Close();
            return listaBaños;

        }
        public void Agregar(Baño nuevo)
        {

            conexion.ConnectionString = "data source=DESKTOP-C1E04P7; initial catalog=AppTuBanio; integrated security=sspi";
            comando.CommandType = System.Data.CommandType.Text;

            comando.CommandText = "insert into Banio values (@calle,@numeracion,@nombre,@descripcion,@calificacion,@imagen,@gratuito,@discapacitado,@cambiadorBebe,@mixto,@ducha)";

            comando.Parameters.AddWithValue("@calle", nuevo.Calle);
            comando.Parameters.AddWithValue("@numeracion", nuevo.Numeracion);
            comando.Parameters.AddWithValue("@nombre", nuevo.Nombre);
            comando.Parameters.AddWithValue("@descripcion", nuevo.Descripcion);
            comando.Parameters.AddWithValue("@calificacion", nuevo.Calificacion);
            comando.Parameters.AddWithValue("@imagen", nuevo.Imagen);
            comando.Parameters.AddWithValue("@gratuito", nuevo.Gratuito);
            comando.Parameters.AddWithValue("@discapacitado", nuevo.Discapacitado);
            comando.Parameters.AddWithValue("@cambiadorBebe", nuevo.CambiadorBebe);
            comando.Parameters.AddWithValue("@mixto", nuevo.Mixto);
            comando.Parameters.AddWithValue("@ducha", nuevo.Ducha);

            comando.Connection = conexion;

            conexion.Open();
            comando.ExecuteNonQuery();

            comando.Parameters.Clear();
            conexion.Close();

        }
        public List<Baño> Buscar(string busca)
        {
            List<Baño> listaBaños = new List<Baño>();

            conexion.ConnectionString = "data source=DESKTOP-C1E04P7; initial catalog=AppTuBanio; integrated security=sspi";
            comando.CommandType = System.Data.CommandType.Text;

            comando.CommandText = "select * from Banio Where Calle like'" + busca + "'";
            comando.Connection = conexion;
            conexion.Open();

            SqlDataReader lector = comando.ExecuteReader();
            while (lector.Read())
            {
                Baño aux = new Baño();
                aux.Id = lector.GetInt32(0);
                aux.Calle = lector.GetString(1);
                aux.Numeracion = lector.GetInt32(2);
                aux.Nombre = lector.GetString(3);
                aux.Descripcion = lector.GetString(4);
                aux.Calificacion = lector.GetDecimal(5);
                aux.Imagen = lector.GetString(6);
                aux.Gratuito = lector.GetBoolean(7);
                aux.Discapacitado = lector.GetBoolean(8);
                aux.CambiadorBebe = lector.GetBoolean(9);
                aux.Mixto = lector.GetBoolean(10);
                aux.Ducha = lector.GetBoolean(11);

                listaBaños.Add(aux);
            }
            conexion.Close();
            return listaBaños;
        }

        public void Modificar(Baño modificado)
        {
            conexion.ConnectionString = "data source=DESKTOP-C1E04P7; initial catalog=AppTuBanio; integrated security=sspi";
            comando.CommandType = System.Data.CommandType.Text;

            comando.CommandText = "update Banio set Calle=@calle, Numeracion=@numeracion, Nombre=@nombre, Descripcion=@descripcion, Calificacion=@calificacion, Imagen=@imagen, Gratuito=@gratuito, Discapacitado=@discapacitado, CambiadorBebe=@cambiadorBebe, Mixto=@mixto, Ducha=@ducha Where Id=" + modificado.Id;
            comando.Parameters.AddWithValue("@calle", modificado.Calle);
            comando.Parameters.AddWithValue("@numeracion", modificado.Numeracion);
            comando.Parameters.AddWithValue("@nombre", modificado.Nombre);
            comando.Parameters.AddWithValue("@descripcion", modificado.Descripcion);
            comando.Parameters.AddWithValue("@calificacion", modificado.Calificacion);
            comando.Parameters.AddWithValue("@imagen", modificado.Imagen);
            comando.Parameters.AddWithValue("@gratuito", modificado.Gratuito);
            comando.Parameters.AddWithValue("@discapacitado", modificado.Discapacitado);
            comando.Parameters.AddWithValue("@cambiadorBebe", modificado.CambiadorBebe);
            comando.Parameters.AddWithValue("@mixto", modificado.Mixto);
            comando.Parameters.AddWithValue("@ducha", modificado.Ducha);

            comando.Connection = conexion;

            conexion.Open();
            comando.ExecuteNonQuery();

            comando.Parameters.Clear();
            conexion.Close();

        }
        public void Eliminar(int id)
        {
            SqlConnection conexion = new SqlConnection("data source=DESKTOP-C1E04P7; initial catalog=AppTuBanio; integrated security=sspi");
            conexion.Open();
            SqlCommand comando = new SqlCommand("DELETE FROM dbo.Banio WHERE Id = @id", conexion);
            comando.Parameters.AddWithValue("@id", id);
            comando.ExecuteNonQuery();
        }
    }
}
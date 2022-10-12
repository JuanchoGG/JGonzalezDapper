using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDDapper
{
    public class Usuario
    {
        public int IdUsuario { get; set; }
        public string Nombre { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
        public string FechaNacimiento { get; set; }
        public string Sexo { get; set; }
        public string Email { get; set; }
        public int IdRol { get; set; }
        public string Password { get; set; }
        public string UserName { get; set; }

        public static Resultado Add(Usuario usuario)
        {
            Resultado resultado = new Resultado();

            try
            {
                using (SqlConnection context = new SqlConnection(Conexion.GetConnection()))
                {
                    var query = context.Execute($"UsuarioAdd '{usuario.Nombre}','{usuario.ApellidoPaterno}','{usuario.ApellidoMaterno}','{usuario.FechaNacimiento}','{usuario.Sexo}','{usuario.Email}',{usuario.IdRol},'{usuario.Password}','{usuario.UserName}'");

                    if (query > 0)
                    {
                        resultado.Mensaje = "Correcto";
                    }
                }
            }
            catch (Exception ex)
            {
                resultado.Mensaje = "Error: " + ex;
            }

            return resultado;

        }

        public static Resultado Delete(int IdUsuario)
        {
            Resultado resultado = new Resultado();

            try
            {
                using (SqlConnection context = new SqlConnection(Conexion.GetConnection()))
                {
                    var query = context.Execute($"UsuarioDeleteById {IdUsuario}");

                    if (query > 0)
                    {
                        resultado.Mensaje = "Correcto";
                    }
                }
            }
            catch (Exception ex)
            {
                resultado.Mensaje = "Error: " + ex;
            }

            return resultado;
        }

        public static Resultado Update(string consulta)
        {
            Resultado resultado = new Resultado();

            try
            {
                using (SqlConnection context = new SqlConnection(Conexion.GetConnection()))
                {
                    var query = context.Execute(consulta);

                    if (query > 0)
                    {
                        resultado.Mensaje = "Correcto";
                    }
                }
            }
            catch (Exception ex)
            {
                resultado.Mensaje = "Error: " + ex;
            }

            return resultado;
        }

        public static Resultado GetAll()
        {
            Resultado resultado = new Resultado();

            try
            {
                using (SqlConnection context = new SqlConnection(Conexion.GetConnection()))
                {
                    var query = context.Query<Usuario>($"UsuarioGetAll");

                    resultado.Objetos = new List<object>();

                    if (query != null)
                    {
                        foreach (var objeto in query)
                        {
                            resultado.Objetos.Add(objeto);
                        }
                        resultado.Mensaje = "Correcto";
                    }
                }
            }
            catch (Exception ex)
            {
                resultado.Mensaje = "Error: " + ex;
            }

            return resultado;
        }

        public static Resultado GetById(int IdUsuario)
        {
            Resultado resultado = new Resultado();

            try
            {
                using (SqlConnection context = new SqlConnection(Conexion.GetConnection()))
                {
                    var query = context.Query<Usuario>($"UsuarioGetById {IdUsuario}");

                    resultado.Objetos = new List<object>();

                    if (query != null)
                    {
                        foreach (var objeto in query)
                        {
                            resultado.Objetos.Add(objeto);
                        }
                        resultado.Mensaje = "Correcto";
                    }
                }
            }
            catch (Exception ex)
            {
                resultado.Mensaje = "Error: " + ex;
            }

            return resultado;
        }
    } 
}
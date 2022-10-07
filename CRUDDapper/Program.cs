using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDDapper
{
    public class Program
    {
        static void Main(string[] args)
        {
            Menu();
        }

        public static void Menu()
        {
            Console.WriteLine("Del siguiente menú, selecciona la opcion deseada:\n1) Agregar\n2) Eliminar\n3) Actualizar\n4) Mostrar");
            int opcion = int.Parse(Console.ReadLine());
            switch (opcion)
            {
                case 1:
                    Add();
                    break;
                case 2:
                    Delete();
                    break;
                case 3:
                    Update();
                    break;
                case 4:
                    GetAll();
                    break;
            }
        }

        public static void Add()
        {
            do
            {
                Usuario usuario = new Usuario();

                Console.WriteLine("Ingrese el nombre del usuario:");
                usuario.Nombre = Console.ReadLine();

                Console.WriteLine("Ingrese el apellido paterno del usuario:");
                usuario.ApellidoPaterno = Console.ReadLine();

                Console.WriteLine("Ingrese el apellido materno del usuario:");
                usuario.ApellidoMaterno = Console.ReadLine();

                Console.WriteLine("Ingrese la fecha de nacimiento del usuario:");
                usuario.FechaNacimiento = Console.ReadLine();

                Console.WriteLine("Ingrese el sexo del usuario:");
                usuario.Sexo = Console.ReadLine();

                Console.WriteLine("Ingrese el e-mail del usuario:");
                usuario.Email = Console.ReadLine();

                Console.WriteLine("Ingrese el número de rol del usuario:");
                usuario.IdRol = int.Parse(Console.ReadLine());

                Console.WriteLine("Ingrese la password del usuario:");
                usuario.Password = Console.ReadLine();

                Console.WriteLine("Ingrese el nombre de usuario del usuario:");
                usuario.UserName = Console.ReadLine();


                Resultado resultado = Usuario.Add(usuario);

                if (resultado.Mensaje == "Correcto")
                {
                    Console.WriteLine("======== Usuario insertado con éxito");
                }
                else
                {
                    Console.WriteLine("XXXXXXXX Error al insertar usuario");
                }

                Console.WriteLine("¿Deseas agregar otro usuario?\n1) Si\n2) No");
            } while (int.Parse(Console.ReadLine()) == 1);
            Menu();
        }
        public static void Delete()
        {
            do
            {
                Console.WriteLine("Ingrese el ID del usuario:");
                int IdUsuario = int.Parse(Console.ReadLine());

                Resultado resultado = Usuario.Delete(IdUsuario);

                if (resultado.Mensaje == "Correcto")
                {
                    Console.WriteLine("======== Usuario eliminado con éxito");
                }
                else
                {
                    Console.WriteLine("XXXXXXXX Error al eliminar usuario");
                }

                Console.WriteLine("¿Deseas eliminar otro usuario?\n1) Si\n2) No");
            } while (int.Parse(Console.ReadLine()) == 1);
            Menu();
        }

        public static void Update()
        {
            do
            {
                Console.WriteLine("Introduzca el ID del usuario:");
                int idUsuario = int.Parse(Console.ReadLine());

                Console.WriteLine("Del siguiente menú seleccione el campo a modificar:\n1) Nombre\n2) Apellido paterno\n3) Apellido materno\n4) Fecha de nacimiento\n5) Sexo\n6) Email\n7) Num. de rol\n8) Contrasenia\n9) Nombre de usuario");
                int opcion = int.Parse(Console.ReadLine());

                string consulta = "";

                switch (opcion)
                {
                    case 1:
                        Console.WriteLine("Ingrese el NUEVO Nombre:");
                        consulta = $"UPDATE Usuario SET Nombre = '{Console.ReadLine()}' WHERE IdUsuario={idUsuario}";
                        break;
                    case 2:
                        Console.WriteLine("Ingrese el NUEVO Apellido paterno:");
                        consulta = $"UPDATE Usuario SET ApellidoPaterno = '{Console.ReadLine()}' WHERE IdUsuario={idUsuario}";
                        break;
                    case 3:
                        Console.WriteLine("Ingrese el NUEVO  Apellido materno:");
                        consulta = $"UPDATE Usuario SET ApellidoMaterno = '{Console.ReadLine()}' WHERE IdUsuario={idUsuario}";
                        break;
                    case 4:
                        Console.WriteLine("Ingrese la NUEVA Fecha de nacimiento:");
                        consulta = $"UPDATE Usuario SET FechaNacimiento = '{Console.ReadLine()}' WHERE IdUsuario={idUsuario}";
                        break;
                    case 5:
                        Console.WriteLine("Ingrese el NUEVO Sexo:");
                        consulta = $"UPDATE Usuario SET Sexo = '{Console.ReadLine()}' WHERE IdUsuario={idUsuario}";
                        break;
                    case 6:
                        Console.WriteLine("Ingrese el NUEVO Email:");
                        consulta = $"UPDATE Usuario SET Email = '{Console.ReadLine()}' WHERE IdUsuario={idUsuario}";
                        break;
                    case 7:
                        Console.WriteLine("Ingrese el NUEVO Num. de rol:");
                        consulta = $"UPDATE Usuario SET IdRol = {int.Parse(Console.ReadLine())} WHERE IdUsuario={idUsuario}";
                        break;
                    case 8:
                        Console.WriteLine("Ingrese la NUEVA Contrasenia:");
                        consulta = $"UPDATE Usuario SET Password = '{Console.ReadLine()}' WHERE IdUsuario={idUsuario}";
                        break;
                    case 9:
                        Console.WriteLine("Ingrese el NUEVO Nombre de usuario:");
                        consulta = $"UPDATE Usuario SET UserName = '{Console.ReadLine()}' WHERE IdUsuario={idUsuario}";
                        break;
                }

                Resultado resultado = Usuario.Update(consulta);

                if (resultado.Mensaje == "Correcto")
                {
                    Console.WriteLine("======== Usuario actualizado con éxito");
                }
                else
                {
                    Console.WriteLine("XXXXXXXX Error al actualizar usuario");
                }

                Console.WriteLine("¿Deseas actualizar otro usuario?\n1) Si\n2) No");
            } while (int.Parse(Console.ReadLine()) == 1);
            Menu();
        }

        public static void GetAll()
        {
            Resultado resultado = Usuario.GetAll();

            if (resultado.Mensaje == "Correcto")
            {
                Console.WriteLine("[IdUsuario]\t[Nombre]\t[ApellidoPaterno]\t[ApellidoMaterno]\t[FechaNacimiento]\t[Sexo]\t[Email]\t[IdRol]\t[Password]\t[UserName]");
                foreach (Usuario usuario in resultado.Objetos)
                {
                    Console.WriteLine($"{usuario.IdUsuario}\t{usuario.Nombre}\t{usuario.ApellidoPaterno}\t{usuario.ApellidoMaterno}\t{usuario.FechaNacimiento}\t{usuario.Sexo}\t{usuario.Email}\t{usuario.IdRol}\t{usuario.Password}\t{usuario.UserName}");
                }
            }

            Console.WriteLine("¿Deseas regresar al menú?\n1) Si\n2) No");
            if (int.Parse(Console.ReadLine()) == 1)
            {
                Menu();
            }
        }
    }
}
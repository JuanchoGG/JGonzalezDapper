using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDDapper
{
    public class Resultado
    {
        public string Mensaje { get; set; }

        public List<object> Objetos { get; set; }
        public Usuario Usuario { get; set; }

    }
}
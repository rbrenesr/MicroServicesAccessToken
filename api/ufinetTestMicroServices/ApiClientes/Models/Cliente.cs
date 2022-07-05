using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiClientes.Models
{
    public class Cliente
    {
        public int ID { get; set; }
        public string DocIdenticacion { get; set; }
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public string Mail { get; set; }
    }
}
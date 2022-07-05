using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiFactura.Models
{
    public class Factura
    {       
        public int cliID { get; set; }
        public string Tipo { get; set; }
        public string Consecutivo { get; set; }
        public DateTime Fecha { get; set; }
        public decimal SubTotal { get; set; }
        public decimal Impuesto { get; set; }
        public decimal Descuento { get; set; }
        public decimal Total { get; set; }
        public List<Detalle>  Detalle{ get; set; }

    }

    public class Detalle
    {
        public int docID { get; set; }
        public int itemID { get; set; }
        public decimal Cantidad { get; set; }
        public decimal PrecioUnitario { get; set; }
        public decimal SubTotal { get; set; }
        public decimal Impuesto { get; set; }
        public decimal Descuento { get; set; }
        public decimal Total { get; set; }
    }
}
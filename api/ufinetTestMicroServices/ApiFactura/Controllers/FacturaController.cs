using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ApiFactura.Models;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections.Generic;

namespace ApiFactura.Controllers
{
    public class FacturaController : ApiController
    {
        [Authorize(Roles = "admin")]
        [HttpPost]
        [Route("api/ms/doc/InsertFactura")]
        public void InsertFactura(Factura _factura)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "INSERT INTO [dbo].[tbl_doc_enc] " +
                                   "([cli_intID] " +
                                   ",[doc_chrTipo] " +
                                   ",[doc_chrConsecutivo] " +
                                   ",[doc_fecFecha] " +
                                   ",[doc_monSubTotal] " +
                                   ",[doc_monImpuesto] " +
                                   ",[doc_monDescuento] " +
                                   ",[doc_monTotal]) " +
                             "VALUES " +
                                   "( "+_factura.cliID+" " +
                                    ", '"+_factura.Tipo+"' " +
                                    ", '"+_factura.Consecutivo+"' " +
                                    ", '"+_factura.Fecha+"' " +
                                    ", "+_factura.SubTotal+" " +
                                    ", " + _factura.Impuesto + "" +
                                    ", " + _factura.Descuento + "" +
                                    ", " + _factura.Total + ") " +
                                    " SELECT SCOPE_IDENTITY() "; 

            //cmd.ExecuteNonQuery();
            int id = Convert.ToInt32(cmd.ExecuteScalar());
            int iddet = 0;

            foreach (var i in _factura.Detalle)
            {
                cmd.CommandText = "INSERT INTO [dbo].[tbl_docdet] " +
                                       "([doc_intID] " +
                                       ",[item_intID] " +
                                       ",[docdet_monCantidad] " +
                                       ",[docdet_monPrecioUnitario] " +
                                       ",[docdet_monSubTotal] " +
                                       ",[docdet_monImpuesto] " +
                                       ",[docdet_monDescuento] " +
                                       ",[docdet_monTotal]) " +
                                 "VALUES " +
                                       "( "+ id + " " +
                                       ", "+i.itemID+" " +
                                       ", "+i.Cantidad+" " +
                                       ", "+i.PrecioUnitario + " " +
                                       ", "+i.SubTotal + " " +
                                       "," + i.Impuesto + " " +
                                       "," + i.Descuento + " " +
                                       "," + i.Total + " )";

                iddet = Convert.ToInt32(cmd.ExecuteScalar());
            }


            cn.Close();

        }
    }
}
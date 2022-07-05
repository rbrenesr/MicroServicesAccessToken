using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Http;
using System.Collections.Generic;
using ApiClientes.Models;

namespace ApiClientes.Controllers
{
    public class ClienteController : ApiController
    {
        [AllowAnonymous]
        [HttpGet]
        [Route("api/ms/testConecction")]
        public IHttpActionResult Get()
        {
            return Ok("servicio de facturacion unifet_test");
        }

        [Authorize(Roles = "admin")]
        [HttpGet]
        [Route("api/ms/GetClientes")]
        public IEnumerable<Cliente> GetClientes()
        {
            List<Cliente> clientes = new List<Cliente>();
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString);
            string query = "SELECT [cli_intID],[cli_chrDocIdenticacion],[cli_chrNombre],[cli_chrApellidos],[cli_chrMail]  FROM [dbo].[tbl_cliente]";
            cn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, cn);
            DataSet ds = new DataSet();
            da.Fill(ds);

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                clientes.Add(new Cliente
                {
                    ID = (int)dr["cli_intID"],
                    DocIdenticacion = (string)dr["cli_chrDocIdenticacion"],
                    Nombre = (string)dr["cli_chrNombre"],
                    Apellidos = (string)dr["cli_chrApellidos"],
                    Mail = (string)dr["cli_chrMail"]

                });
            }

            cn.Close();

            return clientes;

        }


        [Authorize(Roles = "admin")]
        [HttpGet]
        [Route("api/ms/GetCliente")]
        public Cliente GetCliente(string id)
        {
            Cliente clientes = new Cliente();
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString);
            string query = "SELECT [cli_intID],[cli_chrDocIdenticacion],[cli_chrNombre],[cli_chrApellidos],[cli_chrMail]  FROM [dbo].[tbl_cliente]" +
                " where cli_intID = '" + id + "'";
            cn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, cn);
            DataSet ds = new DataSet();
            da.Fill(ds);

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                clientes.ID = (int)dr["cli_intID"];
                clientes.DocIdenticacion = (string)dr["cli_chrDocIdenticacion"];
                clientes.Nombre = (string)dr["cli_chrNombre"];
                clientes.Apellidos = (string)dr["cli_chrApellidos"];
                clientes.Mail = (string)dr["cli_chrMail"];
            }

            cn.Close();

            return clientes;

        }


        [Authorize(Roles = "admin")]
        [HttpPost]
        [Route("api/ms/InsertCliente")]
        public void InsertCliente(Cliente _cliente)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString);
            SqlCommand cmd = new SqlCommand();

            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "INSERT INTO [dbo].[tbl_cliente] (" +
                                "[cli_chrDocIdenticacion] " +
                                ",[cli_chrNombre] " +
                                ",[cli_chrApellidos] " +
                                ",[cli_chrMail]) " +
                             "VALUES " +
                                "('" + _cliente.DocIdenticacion.ToString() + "' " +
                                ",'" + _cliente.Nombre.ToString() + "' " +
                                ",'" + _cliente.Apellidos.ToString() + "' " +
                                ",'" + _cliente.Mail.ToString() + "' )";

            cmd.ExecuteNonQuery();
            cn.Close();

        }
    }
}
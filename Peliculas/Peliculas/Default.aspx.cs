using Business;
using System;
using System.Web.UI;

namespace CatalogoPeliculas
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Metodo llamado desde el script: Scripts/Catalogo/Peliculas.js encargado de buscar por palabra clave
        [System.Web.Services.WebMethod()]
        public static string BuscarPalabra(string Palabra)
        {
            BLPeliculas ObjApi = new BLPeliculas();
            return ObjApi.Buscar(Palabra);         
        }

        // Metodo llamado desde el script: Scripts/Catalogo/Peliculas.js encargado de buscar por el Id especifico para ver detalles
        [System.Web.Services.WebMethod()]
        public static string Detalle(string Identificador)
        {
            BLPeliculas ObjApi = new BLPeliculas();
            return ObjApi.BuscarXId(Identificador);
        }
    }
}
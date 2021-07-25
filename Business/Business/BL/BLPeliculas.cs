using System.Configuration;

namespace Business
{
    public class BLPeliculas : ConexionApi
    {
        private string _url, _key;

        // metodo para buscar por palabra clave
        public string Buscar(string _buscar)
        {            
            _url = ConfigurationManager.AppSettings["UrlApi"];
            _key = ConfigurationManager.AppSettings["ApiKey"];
          
            return ConsumirApiGET($"{_url}/?s={_buscar}&apikey={_key}");
        }

        // metodo para hacer la busqueda por un id especifico cuando el usuario da clic en detalles
        public string BuscarXId(string _identificador)
        { 
            _url = ConfigurationManager.AppSettings["UrlApi"];
            _key = ConfigurationManager.AppSettings["ApiKey"];         

            return ConsumirApiGET($"{_url}/?i={_identificador}&apikey={_key}");
        }

    }
}

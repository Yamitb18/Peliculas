using RestSharp;

namespace Business
{
    public class ConexionApi
    {
        // Metodo que se encarga de consumir el Api por medio de la libreria RestSharp
        public string ConsumirApiGET(string Url)
        {
            var client = new RestClient(Url);
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            IRestResponse response = client.Execute(request);

            string result = response.Content;

            return result;
        }

    }
}

using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace MersenneTwister
{
    public class NetworkLayer
    {
        public static async Task<GameResult> GetResult(string gameName, int id, long number)
        {
            using HttpClient httpClient = new HttpClient();
            var requestUrl = $"http://95.217.177.249/casino/play{gameName}?id={id}&bet=1&number={number}";
            var json_result = await httpClient.GetStringAsync(requestUrl);
            GameResult result = JsonConvert.DeserializeObject<GameResult>(json_result);

            return result;
        }

        public static async void CreateAccount(int id)
        {
            using HttpClient httpClient = new HttpClient();
            var requestUrl = $"http://95.217.177.249/casino/createacc?id={id}";
            var json_result = await httpClient.GetStringAsync(requestUrl);
        }


    }


}
using System;
using System.Net.Http;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace MersenneTwister
{
    public class NetworkLayer
    {
        public static async Task<GameResult> GetResult(string gameName, int id, long number)
        {
            using HttpClient httpClient = new HttpClient();
            var requestUrl = StaticData.returnGetUrl(gameName, id, number);
            var json = await httpClient.GetStringAsync(requestUrl);
            GameResult result = JsonConvert.DeserializeObject<GameResult>(json);

            return result;
        }

        public static async void CreateAccount(int id)
        {
            using HttpClient httpClient = new HttpClient();
            var requestUrl = StaticData.returnCreateUrl(id);
            var json = await httpClient.GetStringAsync(requestUrl);
        }

    }

}
using Newtonsoft.Json;

public struct GameResult
{
    [JsonProperty("message")]
    public string message;

    [JsonProperty("account")]
    public Account account;

    [JsonProperty("realNumber")]
    public long realNumber;
}

public struct Account
{
    [JsonProperty("id")]
    public string id;

    [JsonProperty("money")]
    public int money;

    [JsonProperty("deletionTime")]
    public string deletionTime;
}

public class StaticData
{
    public static string getURL = "http://95.217.177.249/casino/play{gameName}?id={id}&bet=1&number={number}";
    public static string createURL = "http://95.217.177.249/casino/createacc?id={id}";

    public static string returnGetUrl(string gameName, int id, long number)
    {
        var id1 = id.ToString();

        string value = "http://95.217.177.249/casino/play" + gameName + "?id=" + id1 + "&bet=1&number=" + number.ToString();

        return value;
    }

    public static string returnCreateUrl(int id)
    {
        string value = "http://95.217.177.249/casino/createacc?id=" + id.ToString();
        return value;
    }

}
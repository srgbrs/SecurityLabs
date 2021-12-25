using System;
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
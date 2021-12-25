using System;
using System.Collections.Generic;

namespace MersenneTwister
{
    public class MersenneTwisterAlg
    {
        public static void run()
        {
            Random rand = new Random();
            var id = rand.Next(1_000, 10_000);

            NetworkLayer.CreateAccount(id);
            var mt = DateTimeOffset.UtcNow.ToUnixTimeSeconds();
            long newSeed = 0;

            List<long> resultList = new List<long>();

            for (int i = -50; i < 50; i++)
            {
                newSeed = mt + i;
                RandomMersenne m = new RandomMersenne((uint)newSeed);
                for (int j = 0; j < 626; j++)
                {
                    resultList.Add(m.Random());
                }
            }

            var number = NetworkLayer.GetResult("Mt", id, 1).Result.realNumber;

            int index = resultList.IndexOf(number);

            Console.WriteLine(index);

            Console.WriteLine($"Next Number: {resultList[index + 1]}");

            var _ = NetworkLayer.GetResult("Mt", id, resultList[index + 1]).Result.message;
            Console.WriteLine(_);

        }


    }
}
using System;

namespace MersenneTwister
{
	public class RandomMersenne
	{
		const int MERS_N = 624;
		const int MERS_M = 397;
		const int MERS_U = 11;
		const int MERS_S = 7;
		const int MERS_T = 15;
		const int MERS_L = 18;
		const uint MERS_A = 0x9908B0DF;
		const uint MERS_B = 0x9D2C5680;
		const uint MERS_C = 0xEFC60000;

		public uint[] mt = new uint[MERS_N + 1];
		uint mti = MERS_N + 1;

		public RandomMersenne() { }
		public RandomMersenne(uint seed)
		{
			RandomInit(seed);
		}
		public void RandomInit(uint seed)
		{
			mt[0] = seed;
			for (mti = 1; mti < MERS_N; mti++)
				mt[mti] = (1812433253U * (mt[mti - 1] ^ (mt[mti - 1] >> 30)) + mti);
		}
		public uint Random()
		{
			uint y;

			if (mti >= MERS_N)
			{
				const uint LOWER_MASK = 2147483647;
				const uint UPPER_MASK = 0x80000000;
				uint[] mag01 = { 0, MERS_A };

				int kk;
				for (kk = 0; kk < MERS_N - MERS_M; kk++)
				{
					y = (mt[kk] & UPPER_MASK) | (mt[kk + 1] & LOWER_MASK);
					mt[kk] = mt[kk + MERS_M] ^ (y >> 1) ^ mag01[y & 1];
				}
				for (; kk < MERS_N - 1; kk++)
				{
					y = (mt[kk] & UPPER_MASK) | (mt[kk + 1] & LOWER_MASK);
					mt[kk] = mt[kk + (MERS_M - MERS_N)] ^ (y >> 1) ^ mag01[y & 1];
				}
				y = (mt[MERS_N - 1] & UPPER_MASK) | (mt[0] & LOWER_MASK);
				mt[MERS_N - 1] = mt[MERS_M - 1] ^ (y >> 1) ^ mag01[y & 1];
				mti = 0;
			}

			y = mt[mti++];

			y ^= y >> MERS_U;
			y ^= (y << MERS_S) & MERS_B;
			y ^= (y << MERS_T) & MERS_C;
			y ^= y >> MERS_L;
			return y;
		}
	}

}
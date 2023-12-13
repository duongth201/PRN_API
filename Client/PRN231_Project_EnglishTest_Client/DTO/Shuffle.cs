namespace PRN231_Project_EnglishTest_Client.DTO
{
    public static class Shuffle
    {
        private static Random rng = new Random();

        public static void ShuffleA<T>(this IList<T> list)
        {
            int n = list.Count;
            while (n > 1)
            {
                n--;
                int k = rng.Next(n + 1);
                T value = list[k];
                list[k] = list[n];
                list[n] = value;
            }
        }
    }
}

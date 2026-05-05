public class StringListTest {
    public static List<String> generateStringList(Integer count) {
        List<String> results = new List<String>();
        for (Integer i = 0; i < count; i++) {
            results.add('Test ' + i);
        }
        return results;
    }
}
public class ContactTriggerHandler {
    public static void assignTitles(List<Contact> contacts) {
        Map<String, String> deptToTitle = new Map<String, String>{
            'Finance' => 'Financial Analyst',
            'Technology' => 'Software Engineer',
            'Education' => 'Teacher'
        };
        
        for(Contact c : contacts) {
            if(c.Department != null && deptToTitle.containsKey(c.Department)) {
                c.Title = deptToTitle.get(c.Department);
            }
        }
    }
}
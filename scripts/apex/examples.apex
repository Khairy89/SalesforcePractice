private void run() {
    printToDebug();
    variableAndDataTypes();
}

private void debug(string tag, object valueObj) {
    system.debug('---' + tag + ': ' + valueObj);
}

private void printToDebug() {
    system.debug('Hello world!');
} 

private void variableAndDataTypes() {
    string name = 'John Doe';
    integer age = 30;
    boolean isActive = true;
    decimal salary = 75000.50;
    
    debug('Name', name);
    debug('Age', age);
    debug('Is Active', isActive);
    debug('Salary', salary);
}

private class apexClass{
    public static void apexMethod() {
        system.debug('Apex method called');
    }
}

run();

public with sharing class StringArrayTest {

    //Integer entero = 5;
    //
    public static String generateStringArray(){
        List<String> listaPrueba = new List<String> {'Prueba 1', 'Prueba 2', 'Prueba 3', 'Prueba 4', 'Prueba 5', 'Prueba 6'};
        for(String i : listaPrueba){
            System.debug(i);
        }
        return '';
    }
    
    public static void resutlado(){
        generateStringArray();
    }

    // Inicializacion del Constructor
    public StringArrayTest() {}
}
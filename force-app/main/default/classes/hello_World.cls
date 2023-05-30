public class hello_World {
    public static void testList(){
        //List<String> ListNull; // Variable de lista no iniciada
        // String[] anotherList; // Variable de lista no iniciada
        //
        List<String> listInicializada = new List<String>();
       	String[] anotherListInicializada = new List<String>();
        
        System.debug('Valor de listInicializada ' + listInicializada);
        System.debug('Valor de anotherListInicializada ' + anotherListInicializada);

        String mensaje = 'Hola mundo';
        System.debug(mensaje);

        String mensaje_3 = 'Este es un nuevo mensaje';
        System.debug(mensaje_3); 

    }
}
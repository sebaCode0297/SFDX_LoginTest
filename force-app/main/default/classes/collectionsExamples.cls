public with sharing class collectionsExamples {
    public static void main(String[] args){
        testEjemploListas();
    }
    public static void testEjemploListas(){
        List<String> listNull; //Lista vacia o nulo
        String[] anotherListNull;
        system.debug('Valor de listNull : ' + listNull);
        system.debug('Valor de anotherListNull : ' + anotherListNull);
        
        // Lista vacia para almacenar valores de tipo string
    	//List<String> listInicializada = new List<String>();
    	
    	// Lista a la cual le pasamos como parametros algunos valores de tipo String.
        List<String> listInicializada = new List<String>{'Teresa', 'Eulises', 'Maria'};
        String[] anotherListInicializada = new List<String>();
        system.debug('Valor de listNull : ' + listInicializada);
        system.debug('Valor de anotherListNull : ' + anotherListInicializada);
        
        // Agregando un nuevo elemento a una lista existente usando el metodo 'nameList.add('Valor nuevo');
        listInicializada.add('Camila bonita');
		System.debug(listInicializada);
        
        // Accedemos a la posicion de un elemento dentro de una lista
        System.debug(listInicializada[3]);
		// Accedemos a la posicion de un elemento dentro de una lista usando el metodo .get(posicion del elemento)
        System.debug(listInicializada.get(2));
        
        // Obtenemos el tamaño de la lista usando la funcion '.size()' esto nos dara la cantidad de elementos en la lista.
        System.debug('Tamaño de la lista : ' + listInicializada.size());
        
        // Para cambiar un valor que esta dentro de una lista, usamos el metodo '.set(posicion, valorNuevo)'
        listInicializada.set(1, 'Sergito');
        System.debug(listInicializada.get(1));
        
        // Para limpiar una lista por completo se debe usar el metodo '.clear()' luego del nombre de la lista que se quiere limpiar.
        listInicializada.clear();
        System.debug(listInicializada);
        
        // Para orderna los elementos de una lista de forma Ascendente, usamos el metodo '.sort()' luego del nombre de la lista, esto
        // ordenara todos los elementos segun su letra inicial.
        listInicializada.sort();
        System.debug(listInicializada);
        
        // Creacion de una lista con valores ingresados a mano
        List<String> listOfNames = new List<String>{'Seba', 'Benjita', 'Sergio'};
        // Uso de validacion de si una lista esta vacia o no usando la funcion nameList.isEmpty();
        listOfNames.addAll(new List<String>{'Seba', 'Benjita', 'Sergio'});
        listOfNames.clear();
        System.debug('La lista esta vacia?' + listOfNames.isEmpty());
        System.debug('El valor actual de listOfNames usando addAll es: ' + listOfNames);
        
        /* Utilizamos la funcion nameList.contains(valor); para consulta si la lista o algun conjunto de datos contiene un valor en
        especifico */ 
        System.debug('Contiene un valor llamado Booker la lista?' + listOfNames.contains('Booker')); //False
        System.debug(listOfNames);
        
        /* Usando la funcion nameList.indexOf(valorPosicion); nos indicara la posicion del elemento buscando dentro de la lista*/
        System.debug('La posicion del valor es: ' + listOfNames.indexOf('Booker')); // Devolvera siempre -1 dado que el valor no existe
		System.debug('La posicion del valor es: ' + listOfNames.indexOf('Seba')); //Devolvera el valor numerico equivalente a la posicion del elemento

    }

    public static void testEjemplosSets(){
        Set<String> setNull;
        System.debug('Valor del setNull es: ' + setNull);
        
        Set<String> setInicializado = new Set<String>();
        System.debug('Valor del setInicializado es: ' + setInicializado);
        
        Set<String> setOfCountries = new Set<String>{'Chile', 'España', 'Argentina'};
        System.debug(setOfCountries);
    }
    
    public static void testEjemplosMapas(){
        Map<String, Integer> mapNull; // Mapa nulo
        Map<String, String> newMap = new Map<String, String>(); // Declaracion de mapa vacio
        Map<String, String> mapName = new Map<String, String>{'Seba'=>'Albornoz'};
            
        // nameMap.put(valor, valor); | nameMap.put('Seba', 25);
        mapName.put('Benjita', 'Camilo');
        System.debug(mapName);
        
        // Usamos la funcion .size() para saber cuantos elementos o que tamaño tiene el mapa
        system.debug('El tamaño de este map es de : ' + mapName.size());
        
        Map<String, String> mapaCloned = mapName.clone();
        system.debug('Mapa clonado : ' + mapaCloned);
        mapaCloned.clear(); // Se utiliza la funcion nameMap.clear(); para limpiar
        
        // .keySet(), esta funcion recupera todas las llaves del mapa.
        System.debug('Las llaves de mapaCloned son : ' + mapaCloned.keySet());
        
        // .value(), con esta funcion recuperamos todos los valores existentes en un Mapa
        System.debug('Los valores de mapaCloned son : ' + mapaCloned.values());
        
        // .get(), con esta funcion nos retornara el valor del elemento dada la llave correspondiente
        System.debug('El valor en el mapaCloned ' + mapaCloned.get('Camilo'));
        
        // .toString(), esta funcion es usada para retornar el valor en string del mapa
        String mapaTexto = mapaCloned.toString();
        System.debug('El valor en String del mapa mapaCloned es : ' + mapaTexto);
    }

    public static void testColeccionesSOQL(){
        // Lista de registro de cuentas
        List<Account> listaDeCuentas = new List<Account>();
        listaDeCuentas = [SELECT id, Name, Type FROM Account WHERE Type != '' ORDER BY Name ASC LIMIT 5];
        System.debug('Resultado de la consulta :' + listaDeCuentas);
        
        // usando la funcion .get(N_posicion), accedemos al valor en la posicion idicada como parametro
        System.debug('Resultado de la consulta :' + listaDeCuentas.get(0));
        
        // Para acceder a algun valor en especifico del resultado en la posicion que buscamos le concatenamos luego del .get(N_posicion).valor
        System.debug('Resultado de la consulta :' + listaDeCuentas.get(0).Name);
        
        
        // Funcion para agregar un valor a la lista de cuentas 
        Account objCuenta = new Account(); // Instanciamos el obj Cuenta y le asignamos un alias
        objCuenta.Name = 'Cuenta nueva test'; // Le agregamos un valor nuevo al nombre en el campo Name del obj Cuenta
        objCuenta.Type = 'Prospect';
        
        listaDeCuentas.add(objCuenta);
        System.debug(objCuenta);
        System.debug(listaDeCuentas.contains(objCuenta));
        List<Account> newObjAccount = new List<Account>();
        System.debug(newObjAccount);
        
        // Para poder acceder al ultimo elemento de una lista podemos combinar funciones como .get() y .size() agregando -1
        System.debug('Ultimo elemento : ' + listaDeCuentas.get(listaDeCuentas.size()-1));
        // listaDeCuentas.get() -> lo utilizamos para obtener un valor en especifico
        // listaDeCuentas.size()-1 -> lo utilizamos para obtener la cantidad de elementos existentes y le restamos 1 (-1).
        // Si lo combinamos, le estamos solicitando que obtenga elementos en la posicion que le especificamos como parametro -> listaDeCuentas.get(listaDeCuentas.size()-1);
        
         // Ahora usaremos la funcion .indexOf(valor);
         Integer posicionCuenta = listaDeCuentas.indexOf(objCuenta);
         System.debug('Usando el indexOf para obtener la posicion de una cuenta desde el obj : ' + listaDeCuentas.get(listaDeCuentas.indexOf(objCuenta)));             
    }
    
    public static void collectionAllAccount(){
        
        // Creacion de un obj de tipo cuenta y le seteamos valores a los campos seleccionados
        Account AllAccount = new Account();
        
        AllAccount.Name = 'Naelito';
        AllAccount.AccountNumber = '12345';
        AllAccount.AccountSource = 'No Identificado';
        AllAccount.AnnualRevenue = 2100;
        AllAccount.NumberOfEmployees = 12;
        System.debug(AllAccount);
        
        
        // Esta es otra manera de instancia un objeto y asignar valores a los campos del obj Opp
        Opportunity ObjOpp = new Opportunity(
        	Name = 'Sebastian Albornoz Camilo',
            Description = 'Oportunidad test',
            LeadSource = 'No identificado',
            isPrivate = true
        );
        System.debug(ObjOpp);
        
        Empleado__c  ObjEmployes = new Empleado__c(
        	Name = 'Naelito blanco',
            Email__c = 'ing.seba@gmail.com',
            Departamento__c = 'Medicina',
            Salario__c = 2500
        );
        System.debug('Datos registrado : ' + ObjEmployes);
        
        
        
        Map<String, List<sObject>> mapaDeOpp = new Map<String, List<sObject>>();
        
    }

    public static String getConsultingSAP(String name, String Cargo){

        Account cto = New Account();

        String nameConsulting = name;
        String cargoConsulting = Cargo;

        return '';
    }
    
    
    
    
    
}
public with sharing class examplesDML {

    // Metodo public usando funciones DML para insertar un nuevo ID en el objecto cuenta
    public static Id insertObjectExample(String nameAccount){
        Account objAccount = new Account();
        objAccount.Name = nameAccount;
        insert objAccount;
        //Id idAccount = objAccount.Id;
        return objAccount.Id;
    }

    public static Id insertCustomObjExample(String nomb){
        Empleado__c objEmpleado = new Empleado__c();
        objEmpleado.Name = nomb;
        insert objEmpleado;
        return objEmpleado.Id;
    }

    /*metodo y operacion DML para actualizar registros en un obj*/ 
    public static Account updateObjExample(String idAccount, String newName){
        Account objAccount_1 = new Account();
        objAccount_1.Id = idAccount;
        objAccount_1.Name = newName;
        update objAccount_1;
        return objAccount_1;
    }

    /*metodo y operacion DML para eliminar(DELETE) registros en un obj*/ 
    public static void deleteObjExampli(String idAccount){
        Account objAccount = [SELECT Id FROM Account WHERE Id =: idAccount];
        /*
            Esta es otra forma de eliminar un registro de un objeto en sf - Delete [SELECT Id FROM Account WHERE Id =: idAccount]; 
        */
        Delete objAccount;
    }

    public static void upsetObjExample(String idAccount, String newName){
        Account objACcountUpset = new Account();
        if (idAccount != '') {
            objACcountUpset.Id = idAccount;
        } else {
            System.debug('Esto no funciona');
        }
        objACcountUpset.Name = newName;
        upsert objACcountUpset;
    }

    public static void undeleteObjExample(String NameAccountRestore){
        NameAccountRestore = '%'+NameAccountRestore+'%';
        Account[] cuentasForRestore = [SELECT Id, Name FROM Account WHERE Name like :NameAccountRestore ALL ROWS ];
        undelete cuentasForRestore;
    }

    public static void testMethodDML(){
        //INSERT
       /* Id idAccount = examplesDML.insertObjectExample('Cuenta creada por insertObjectExample');
        System.debug('insert - Id de la cuenta insertada por el metodo insertObjectExample es : ' + idAccount);
        
        Opportunity objOpp = new Opportunity(
            Name = 'Benjamin Albornoz Camilo',
            Description = 'Opp test',
            AccountId = idAccount,
            StageName = 'Prospecting',
            CloseDate = System.today()+1
        );
        insert objOpp;

        Opportunity objOppInsertada= [SELECT Id, Name, AccountId FROM Opportunity WHERE Id =: objOpp.Id];
        System.debug('insert - Opp insertada con la cuenta relacionada : ' + objOppInsertada);
        System.debug('insert - Id de la cuenta relacionada a la Opp : ' + objOppInsertada.AccountId);
        */
/**
        // UPDATE
        String nombreAnterior = [SELECT Id, Name FROM Account WHERE Id =: idAccount].Name;
        System.debug('update - Nombre de la cuenta relacionada : ' + nombreAnterior);
        Account cuentaActualizada = examplesDML.updateObjExample(idAccount, 'Nombre actulizado');
        String nombreNuevo = [SELECT Id, Name FROM Account WHERE Id =:idAccount].Name;
        System.debug('update - Nombre de la cuenta relacionada : ' + nombreNuevo);

        //DELETE
        Id idCuentaParaBorrar = examplesDML.insertObjectExample('Cuenta creada para ser borrada');
        System.debug('UPDATE - ID de la cuenta a borrar es ' + nombreAnterior);
        System.debug('UPDATE - Ultima cuenta insertada en la BD ' + [SELECT Id, Name, createdDate FROM Account ORDER BY CreatedDate DESC LIMIT 1]);
        examplesDML.deleteObjExampli(idAccount);
        System.debug('UPDATE - Nombre de la cuenta ' + nombreAnterior);
 */
        //UPSERT
        /*Id idAccount = examplesDML.insertObjectExample('Cuenta creada por insertObjectExample');
        System.debug('UPsert - Ultima cuenta insertada en la BD ' + [SELECT Id, Name, createdDate FROM Account ORDER BY CreatedDate DESC LIMIT 1]);
        examplesDML.upsetObjExample('', 'Cuenta nueva');
        System.debug('UPSERT - Ultimas 2 cuentas insertadas en la BD ' + [SELECT Id, Name, createdDate FROM Account ORDER BY CreatedDate DESC LIMIT 2]);
        String nombreAnterior = [SELECT Id, Name FROM Account WHERE Id =: idAccount].Name;
        System.debug('UPDATE -  nombre de la cuenta ' + nombreAnterior);
        examplesDML.upsetObjExample(idAccount, 'Cuenta actualizada por upsert');
        String nombreNuevo = [SELECT Id, Name FROM Account WHERE Id =:idAccount].Name;
        System.debug('UPDATE - nombre de la cuenta despues del metodo updateObjExample ' + nombreNuevo);
        */

        // UNDELETE
        List<Account> lstAccountInsert = new List<Account>();
        Account cuentaGenerica = new Account();
        cuentaGenerica.Name = 'Cuenta booker 1';
        lstAccountInsert.add(cuentaGenerica);
        lstAccountInsert.add(new Account(Name = 'Cuenta booker 2'));  /* Esta es otra forma de instanciar al obj cuenta y la creacion o insercion de una cuenta nueva.
                                                                        - lstAccountInsert.add(new Account(Name = 'Cuenta booker 2'));*/

        insert lstAccountInsert;
        List<Account> lstAccountInsertadas = [SELECT Id, Name FROM Account WHERE name Like '%Cuenta booker%'];
        System.debug(lstAccountInsertadas);
        
    }
}
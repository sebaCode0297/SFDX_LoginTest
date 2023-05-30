public class EmailManager {
        // Metodo Publico
        public static void sendMail(String address, String subject, String body) {
            // Creacion de un objeto de mensaje de correo electrónico
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {address};
            mail.setToAddresses(toAddresses);
            mail.setSubject(subject);
            mail.setPlainTextBody(body);
            // Pase este mensaje de correo electrónico al método integrado sendEmail
            // de la clase Mensajería
            Messaging.SendEmailResult[] results = Messaging.sendEmail(
            new Messaging.SingleEmailMessage[] { mail });
            
            // Llame a un método auxiliar para inspeccionar los resultados devueltos
            inspectResults(results);
        }
        
        // Método auxiliar
        private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
            Boolean sendResult = true;
            
            // El metodo 'sendEmail' devuelve una matriz de objetos de resultado.
            // Iterar a través de la lista para inspeccionar los resultados.
            // En esta clase, los métodos envían solo un correo electrónico, por lo que deberíamos tener un solo resultado.
            
            for (Messaging.SendEmailResult res : results) {
                if (res.isSuccess()) {
                    System.debug('Envio de Email exitoso!');
                }
                else {
                    sendResult = false;
                    System.debug('The following errors occurred: ' + res.getErrors());                 
                }
            }
            
            return sendResult;
        }
    }
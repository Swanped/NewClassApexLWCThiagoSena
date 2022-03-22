trigger ContactTrigger on Contact (after insert) {

    //informar ao contato novo enviar um email para esse contato.
    if (Trigger.isInsert && Trigger.isAfter) {

        for (Contact cTemp : Trigger.new) {

            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            string[] toAddress = new string[]{'tas.thiago@gmail.com'};
            email.saveAsActivity = false;
            email.setTargetObjectId(UserInfo.getUserId());
            email.setToAddresses(toAddress);
            email.setSubject('Novo contato');
            email.setPlainTextBody('Foi criado o contato com o seguinte nome: ' +cTemp.FirstName + ' ' +cTemp.LastName+ ' - Id: ' +cTemp.Id);

            Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});

            /*Contact novoContact = new Contact();
            novoContact.Name = 'Thiago';
            novoContact.Phone = 13-3271-9988,
            novoContact.whoId = cTemp*/
            
        }
        
    } 


   /* List<String> toAddressList = new List<String>();
    toAddressList.add('tas.thiago@gmail.com');*/

}
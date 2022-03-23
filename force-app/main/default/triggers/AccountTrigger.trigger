
//toda vez que criar uma nova conta com o campo Propriedade = 'Private', voce deve criar uma tarefa para o propritario da conta, dizendo para verificar os dados cadastrais da mesma.

trigger AccountTrigger on Account (after insert) {

    if (Trigger.isinsert && trigger.isafter) {
        
        List<Task> listTarefa = new List<Task>();
        for(Account aTemp : Trigger.New){
            if (aTemp.Ownership == 'Private') {
               
            Task novaTarefa  = new Task();
            novaTarefa.WhatId = aTemp.Id;
           // novaTarefa.WhoId = aTemp.Id;
            novaTarefa.Subject  = 'Verificar dados cadastrais';
            novaTarefa.OwnerId = aTemp.OwnerId; 
            novaTarefa.Status = 'In Progress';
            novaTarefa.Priority = 'High';
            listTarefa.add(novaTarefa); 
    
            } if (aTemp.Ownership == 'Public') {
                Task novaTarefa  = new Task();
                novaTarefa.WhatId = aTemp.Id;
                //novaTarefa.WhoId = aTemp.Id;
                novaTarefa.Subject  = 'Verficar dados publicos inseridos';
                novaTarefa.OwnerId = aTemp.OwnerId; 
                novaTarefa.Status = 'In Progress';
                novaTarefa.Priority = 'Low';
                listTarefa.add(novaTarefa); 
            } 
            
        }
    
        if(listTarefa.size() > 0){
            insert listTarefa;
        }
    
    
    }
}



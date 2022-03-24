@RestResource(urlMapping = '/AulaDeApex/Leads/*')

global with sharing class LeadApi {

    @HttpGet
    global static void getLead(){

        RestResponse resultRest = RestContext.response;

        String asParamStr = RestContext.request.requestURI.substring(RestContext.request.requestURI.lastIndexOf('/')+1);
        String sobreNome = String.IsNotBlank(asParamStr) ? RestContext.request.params.get('sobreNome') : '';

        List<Lead> leadsList = new List<Lead>();
        if (String.IsNotBlank(sobreNome)) {
            leadsList =[SELECT Id, Name, LastName FROM Lead WHERE LastName = :sobreNome];
        }else {
            leadsList =[SELECT Id, Name, LastName FROM Lead];
        }

        //List<Lead> leadsList = new List<Lead>([SELECT Id, Name, LastName FROM Lead]);

        resultRest.responseBody = Blob.valueOf(JSON.serializePretty(leadsList));
        resultRest.StatusCode = 200;

    }

    @HttpPost
    global static void insertLeads(List<LeadApiWrapper> leadList){

        List<Lead> LeadInsertList = new List<Lead>();
        
        //Aqui vou ler a lista(json) de entrada(leadList), e criar os leads e adiciona lista leadsInserList para posteriormente fazer o insert
        for (LeadApiWrapper cTemp : leadList) {

            /*Forma 1 de instanciar
            Lead leadObj = new Lead();
            leadObj.LastName = 'Teste 1';
            leadObj.Company = 'Terra';*/

            //Forma 2
            Lead leadObj = new Lead(LastName = cTemp.sobrenome,Company = cTemp.nome_empresa,Status = cTemp.status_do_lead,Email = cTemp.email);
            
            LeadInsertList.add(leadObj);
            
        }
      /*  if (leadInsertList.size()>0) {
            insert leadInsertList;
        }*/

        //Aqui virá o retorno JSON
        RestResponse resultRest = RestContext.response;
        List<String> idsLeadList = new List<String>();

        if (leadInsertList.size()>0) {
            //Forma de incluir que grave e retorne os ids do leads
            DataBase.UpsertResult[] results = DataBase.upsert(leadInsertList);
            for (Integer index = 0; index < results.size(); index++) {
                if (results[index].isSuccess()) {
                    Id idDFor = results[index].Id;
                    idsLeadList.add(idDFor);
                }else {
                    idsLeadList.add('ERRO');
                }
            }
            
        }
    }

     
}
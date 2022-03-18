public with sharing class ClasseDemonstraEstrutura {

    public static boolean nomeDoMetodo(){

        // TIPO VARIAVEL | NOME VARIAVEL | VALOR VARIAVEL
        Boolean bTrue = true;
        Boolean bFalse = false;
        Boolean bExemplo; // retornará True
        String exemploString = 'Teste String';
        Integer exemploInteiro = 3;
        Decimal exemploDecimal = 1.02;
        Double exemploDouble = 1.2564878989;

        //coleções
        List<String> exemploLista = new List<String>();
        exemploLista.add('Primeiro');//[0] - Primeiro
        exemploLista.add('Segundo'); //[1] - Segundo
        exemploLista.add('Terceiro'); //[2] - Terceiro
        exemploLista.add('Quarto'); //[3] - Quarto

        System.debug('Lista= ' + exemploLista);
        System.debug('Exemplo teste = ' + exemploLista.get(1));
        System.debug('Lista tamanho = ' + exemploLista.size());

        List<Integer> exemploIntegerList = new List<Integer>();
        exemploIntegerList.add(6);
        exemploIntegerList.add(null);
        exemploIntegerList.add(5);
        System.debug('Lista Integer= ' + exemploIntegerList.get(0) + ' ' + exemploIntegerList.size());
        System.debug('Lista completa= ' + exemploIntegerList);
        
        //coleção SET
        Set<String> exemploSet = new Set<String>();
        exemploSet.add('Primeiro');
        exemploSet.add('Segundo');
        exemploSet.add('Terceiro');
        exemploSet.add('Quarto');
        exemploSet.add('Quarto');
        
        System.debug('Lista SET= ' + exemploSet);
        System.debug('Lista SET tamanho= ' + exemploSet.size());
        
        List<Opportunity> opportunityList = new List<Opportunity>([SELECT Id, Name FROM Opportunity]);
        System.debug('Selecione oportunidades = ' + opportunityList);
        System.debug('Selecione nome oportunidade = ' + opportunityList.get(1).Name);
        
        return bFalse;
    }
        
        //METODO SEM RETORNO
    public static void metodoSemRetorno(){

    }

        //Estrutura SOQL
        //SELECT
        //CAMPOS
        //FROM
        //NOME DO OBJETO
        //WHERE
        //CONDIÇÕES DE BUSCA
    private static List<Account> getAccounts(){
        List<Account> accountList = new List<Account>([SELECT Id, Name FROM Account WHERE Id != '']);
        return accountList;

    }

    public static void getAccountPrivate(){
        System.debug(ClasseDemonstraEstrutura.getAccounts());
    }

    //Desafio - Montar um método que busque e retorne uma lista com todos as oportunidades com a fase igual 'Closed Won'

    public static List<Opportunity> oportunidadeListaClosedWon(){
        List<Opportunity> getOpportunity = new List<Opportunity>([SELECT Name FROM Opportunity WHERE StageName ='Closed Won']);
        
        System.debug('Tamanho lista= ' + getOpportunity.size());

        return getOpportunity;

    } 
    public static List<Opportunity> oportunidadeListaClosedWon2(){
        List<Opportunity> getOpportunity = new List<Opportunity>();
        
        System.debug('Tamanho lista= ' + getOpportunity.size()); 

        return [SELECT Name FROM Opportunity WHERE StageName ='Closed Won'];
        

    } 

    //EXEMPLO PARÂMETROS

    public static Integer exemploParametros(Integer intPar, Integer diV){

        Integer testDiv = intPar / diV;

        System.debug('Valor divisão = ' + testDiv);

        return testDiv;

    }

    public static void exemploParametros2(Integer intPar, Integer diV){

        Integer intTest = intPar + 10;
        Integer testDiv = intTest / diV;

        System.debug('Valor do inteiro = ' + intTest );
        
        System.debug('Valor divisão = ' + testDiv);  

    }

    public static String digaOla(String sName){

        String inserirName = sName;

        System.debug('Olá ' + inserirName);

        return inserirName;

    }

    public static void digaOla2(String sName){
        System.debug('Qual seu nome?');
        System.debug('Olá, meu nome é ' + sName);  

    }

    //EXECUÇÃO DML - insert, update, upsert, delete
    public static Account dmlAccount(String name, String site){
        Account novaConta = new Account();
        novaConta.Name = name;
        novaConta.site = site;
        insert novaConta;
        return novaConta;
    }
    
    public static Account dmlAccountUpdate(String name, String site, String idAccount){
    
        List<Account> accountList = new List<Account>([SELECT Id, Name FROM Account WHERE Id = :idAccount]);
        Account novaConta = accountList.get(0);
        novaConta.Name = name;
        novaConta.site = site;
        update novaConta;
        return novaConta;
    }
        
    public static void dmlAccountDelete(String idAccount){
        List<Account> accountList = [SELECT Id, Name FROM Account WHERE Id = :idAccount];
        delete accountList;
    
    }   

    //Desafio criar Lead
    public static Id leadCreate(String sobreNome, String empresa){

        Lead novoLead = new Lead();
        novoLead.LastName = sobreNome;
        novoLead.Company = empresa;
        insert novoLead;

        System.debug(novoLead.Id);
        return novoLead.Id;
    }
    
    public static boolean estruturaCondicao(Integer idade){
        boolean maiorDeIdade;
        if(idade < 18){
            System.debug('Menor de Idade');
            maiorDeIdade = false;
        } else {
            System.debug('Maior de Idade');
            maiorDeIdade = true;
        }
        return maiorDeIdade;
    }

    public static void estruturaCondicao2(Integer idade){
        if (idade <= 0 || idade == null) {
            System.debug('Idade inválida');
        } else {
                if (idade < 12) {
                System.debug('Criança');
                } else if (idade >= 13 && idade < 21) {
                    System.debug('Adolescente');
                } else if (idade >= 21 && idade < 65) {
                    System.debug('Adulto');
                } else{
                    System.debug('Idoso');
                }
        }
    }

    public static Integer somaDeParametros(Integer valor1, Integer valor2){
        Integer resultado = valor1 + valor2;
            
        if(resultado > 5){
            
            resultado = resultado + 2;                                       
        }    
        system.debug('O resultado dos valores é '+' '+ resultado);     
        return resultado;
    }

    public static Integer somaDeParametros2(Integer p1, Integer p2){
        return p1 > 5 ? p1 + p2 + 2 : p1 + p2;
    }

    public static Account dmlAccountUpdate2(String name, String site, String idAccount){
        List<Account> accountList = new List<Account>([SELECT Id, Name FROM Account WHERE Id = :idAccount]);
        Account novaConta = new Account();
        if (accountList.size() > 0) {
            System.debug('Conta Velha: ' + accountList.get(0).Name);
            novaConta = accountList.get(0);
            novaConta.Name = name;
            novaConta.site = site;
            update novaConta;         
            System.debug('Conta Atualizada: ' + accountList.get(0).Name);
        }
        return novaConta;
    }

    public static Decimal getOpportunity(){
            Decimal ValorTotal = 0;
        //Forma diferente de SOQL
        //for (Opportunity valores : [SELECT Amount FROM Opportunity WHERE StageName NOT IN ('Closed Won' ,'Closed Lost') ])
        for (Opportunity valores : [SELECT Amount FROM Opportunity WHERE StageName !='Closed Won' AND StageName !='Closed Lost' ]) {

            ValorTotal = ValorTotal + valores.Amount;
            
        }
        System.debug('Oportunidades selecionadas: ' + ValorTotal);
        return ValorTotal;
    }

    /*public static Account createAccount(String nome){
        
        Account novaConta = new Account();
        for (Integer a = 1; a < 10; a++) {
            novaConta.Name = nome + a;
            insert novaConta;
        }
        return novaConta;
    }*/

    public static void createAccount2(){
        List<Account> listaCreateAccount = new List<Account>();
        
        for (Integer i = 0; i < = 10; i++) {
            System.debug('teste' + i);
            Account novaConta = new Account();
            novaConta.Name = 'Conta' + i;
            listaCreateAccount.add(novaConta);
        }
        insert listaCreateAccount;
    }

    public static void createAccount(Integer numero){
        List<Account> listaCreateAccount = new List<Account>();

        for (Integer i = 1; i < = numero; i++) {
            Account novaConta = new Account();
            novaConta.Name = 'Conta Desafio' + i;
            listaCreateAccount.add(novaConta);
        }
        if(listaCreateAccount.size() > 0){
        insert listaCreateAccount;
        }
    }
    

    //MAPS
    public static void demonstraMap(){
        List<Opportunity> opportunityList =  new List<Opportunity>([SELECT Id, Name FROM Opportunity]);
        system.debug('opportunityList '+opportunityList);
        /*
            opportunityList (
                Opportunity:{Id=0068c00000pMREmAAO, Name=Edge Emergency Generator}
                , Opportunity:{Id=0068c00000pMREtAAO, Name=Edge Installation}
                , Opportunity:{Id=0068c00000pMREuAAO, Name=Edge SLA}
                , Opportunity:{Id=0068c00000pMRF8AAO, Name=Edge Emergency Generator}
            )
        */

        for(Opportunity vTemp : opportunityList){
            if(vTemp.Id == '0068c00000pMREeAAO'){

            }
        }

        //Mapas
        Map<Id, Opportunity> opportunityMap = new Map<Id, Opportunity>([SELECT Id, Name FROM Opportunity]);
        system.debug('opportunityMap '+opportunityMap);
        /*
            opportunityMap {
                0068c00000pMREeAAO=Opportunity:{Id=0068c00000pMREeAAO, Name=Dickenson Mobile Generators}
                , 0068c00000pMREfAAO=Opportunity:{Id=0068c00000pMREfAAO, Name=United Oil Office Portable Generators}
                , 0068c00000pMREgAAO=Opportunity:{Id=0068c00000pMREgAAO, Name=Express Logistics Standby Generator}
                , 0068c00000pMREhAAO=Opportunity:{Id=0068c00000pMREhAAO, Name=GenePoint Standby Generator}
                , 0068c00000pMREiAAO=Opportunity:{Id=0068c00000pMREiAAO, Name=Grand Hotels Kitchen Generator}
            }    
        */
        if(opportunityMap.containsKey('0068c00000pMREeZZZ')){
            system.debug('Contem o id');
        }else{
            system.debug('Não contem o id');
        }
    }

    //DESAFIO - Receber um número inteiro no parâmetro, e vão criar as contas conforme este número com o nome 'Conta DESAFIO 1', 'Conta DESAFIO 2'; Caso a conta com o nome exista, não deve ser criado, pois não queremos mais de uma conta com o mesmo nome
    public static void insertAccountsDesafioNomeSemMap(Integer quantidadeContas){
        List<Account> accountList = new List<Account>();

        for(Integer itemp = 1; itemp <= quantidadeContas; itemp++){
            String nameAcoount = 'Conta DESAFIO '+itemp;
            List<Account> accountListCons = new List<Account>([SELECT Id, Name FROM Account WHERE Name = : nameAcoount]);
            if(accountListCons.size() == 0){
                Account accountObj = new Account();
                accountObj.Name = nameAcoount;
                accountList.add(accountObj);
            }
        }
        if(accountList.size() > 0){
            insert accountList;
        }
    }    

    public static void insertAccountsDesafioNomeComMap(Integer quantidadeContas){
        List<Account> accountList = new List<Account>();

        //aqui eu crio e alimento o meu map
        Map<String, Account> accountMap = new Map<String, Account>();
        for(Account vTemp : [SELECT Id, Name FROM Account]){
            accountMap.put(vTemp.Name, vTemp);
        }

        for(Integer itemp = 1; itemp <= quantidadeContas; itemp++){
            String nameAcoount = 'Conta DESAFIO '+itemp;
            //se não tiver no map croa, o "!" é usado para negação
            if(!accountMap.containsKey(nameAcoount)){
                Account accountObj = new Account();
                accountObj.Name = nameAcoount;
                accountList.add(accountObj);
            }
        }
        if(accountList.size() > 0){
            insert accountList;
        }
    }

    public static void demonstraMap2(){
        Map<String, Account> contasComCpf = new Map<String, Account>();
            
        for (Account vTemp : [SELECT Id, Name, CPF_CPNJ__c FROM Account WHERE CPF_CPNJ__c != '']) {
                System.debug('Contas ' + vTemp);
                contasComCpf.put(vTemp.CPF_CPNJ__c,vTemp);
            }
        
            System.debug('Contas com CPF ' + contasComCpf);
    }
}
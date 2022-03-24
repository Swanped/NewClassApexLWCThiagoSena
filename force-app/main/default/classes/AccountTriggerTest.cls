
@isTest
public class AccountTriggerTest {

    //teste 1 - criar conta com tarefa
    @isTest
    static void AccountTriggerTest() {

        Account accountObj = new Account();
        accountObj.Name = 'Teste 1';
        accountObj.OwnerShip = 'Private';
        insert accountObj;

        List<Task> listTask = new List<Task>([SELECT Id FROM Task WHERE WhatId = :accountObj.Id AND Subject = 'Verificar dados cadastrais']);

        System.assertEquals(listTask.size(),1);
    }

    //teste 2 - criar conta sem tarefas
    @isTest
    static void AccountTriggerTest2(){
        Account accountObj = new Account();
        accountObj.Name = 'Teste 1';
        accountObj.Ownership = 'Private';
        insert accountObj;

        List<Task> listTask = new List<Task>();

        System.assertEquals(listTask.size(),0);
    }
}

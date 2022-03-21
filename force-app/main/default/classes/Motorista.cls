public with sharing class Motorista {
    public static void carrodoMotorista() {
        
        Carro novoCarro = new Carro();
        novoCarro.modelo = 'Fusca';
        novoCarro.cor = 'Preto';
        novoCarro.ligado = true;
        novoCarro.velocidade = 10;
        novoCarro.estadoPorta = false;
        novoCarro.gasolina = true;
        system.debug('O modelo do carro é '+ novoCarro.modelo);
        system.debug('O novo carro é '+ novoCarro);
        Boolean aceleranovoCarro = novoCarro.acelerar(novoCarro.velocidade);
        system.debug('Acelerou o carro? '+aceleranovoCarro);

        Carro novoCarro2 = new Carro();
        novoCarro2.modelo = 'Opala';
        novoCarro2.cor = 'Rosa';
        novoCarro2.ligado = false;
        novoCarro2.velocidade = 10;
        novocarro2.estadoPorta = false;
        novoCarro2.gasolina = false;
        system.debug('O modelo do carro 2 é '+novoCarro2.modelo);
        system.debug('O novo carro '+novoCarro2);
        Boolean aceleranovoCarro2 = novoCarro2.acelerar(novoCarro2.velocidade);
        system.debug('O carro acelerou? '+aceleranovoCarro2);
        
        /*Carro carroFusca = new Carro();
        Boolean fuscaLigado = carroFusca.ligarCarro(true);
        if(fuscaLigado){
            carroFusca.ligarSeta(true);
        }
        system.debug('fuscaLigado '+fuscaLigado);
        Carro carroOpala = new Carro();
        Boolean opalaLigado = carroOpala.ligarCarro(false);
        if(opalaLigado){
            carroOpala.ligarSeta(true);
        }        
        system.debug('opalaLigado '+opalaLigado);*/
    }

    //DESAFIO - Verificar se o carro tem ou não gasolina para poder acelerar



}
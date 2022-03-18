public with sharing class Motorista {
    public static void carroDoMotorista() {

        Carro novoCarro = new Carro();
        novoCarro.modelo = 'Fusca';
        System.debug('O modelo do carro é ' + novoCarro);
        Carro novoCarro2 = new Carro();
        //novoCarro2.ligarSeta = false;

    }

    /*public Integer acelerarCarro (Integer acelerarCarro){
        
        Boolean ligado = ligarCarro ? true : false;

        if (ligado == true) {
            System.debug('Velocidade é ' + acelerarCarro)
        }else {
            System.debug('Carro parado');
        }
    }*/

}

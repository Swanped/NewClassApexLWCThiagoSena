public with sharing class Carro {
    
    public Boolean ligarCarro(Boolean ligarCarro){

        Boolean carroLigado = ligarCarro ? true : false;

        if (ligarCarro == true) {
            System.debug('Carro ligado');
        } else {
            System.debug('Carro desligado');
        }
        return carroLigado;
    }

    public Boolean ligarFarois(Boolean ligarFarois){

        Boolean ligarFarol = ligarFarois ? true : false;

        if (ligarFarois == true) {
            System.debug('Farol ligado');
        } else {
            System.debug('Farol desligado');
        }
        return ligarFarol;
    }
    public Boolean ligarSetas(Boolean ligarSetas){

        Boolean ligarSeta = ligarSetas ? true : false;

        if (ligarSetas== true) {
            System.debug('Seta ligada');
        } else {
            System.debug('Seta desligada');
        }
        return ligarSeta;
    }

    public Integer acelerarCarro (Integer acelerarCarro){

        

    }


}

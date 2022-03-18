public with sharing class Carro {

    //Atributos
    public String modelo {get; set;}
    public String cor {get; set;}
    public Boolean ligado {get; set;}
    public Integer velocidade {get; set;}
    public Boolean estadoPorta {get; set;}
    public Boolean gasolina {get; set;}

    public Boolean acelerar(Integer velocidade){
        this.velocidade = velocidade;
        if (gasolina == true ) {
            return velocidade > 0 && velocidade != null  ? true : false;     
        } else {
            return velocidade = 0;
        }
    }

    
    /*public Boolean ligarCarro(Boolean ligarCarro){

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
    }*/

    

}

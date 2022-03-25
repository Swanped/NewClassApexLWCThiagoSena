import { LightningElement, track } from 'lwc';
import getOpportunities from '@salesforce/apex/OpportunitySummary.getOpportunities';
import { NavigationMixin}  from 'lighttning/navigation';
const columns = [
                    {
                        
                     label: 'Id da oportunidade',
                     fieldName : 'Id',
                     type: 'text',
                     sortable: false       
                    },
                    
                    {
                        
                        label: 'Nome da Oportunidade',
                        fieldName : 'Name',
                        type: 'text',
                        sortable: true       
                    },

                ];

export default class OpportunitySummary extends NavigationMixin (LightningElement) {

    @track columns = columns;
    @track data = [];
    @track rowOffSet = 0;

    connectedCallback(){
        this.findOpportunities();
    }

    findOpportunities(){
        getOpportunities({}).then( (response)=>{
            console.log('response', response);
            this.data = response;
        }); 
    }

    executeNewSales(){
        console.log('Clicou Botão');
    }

}
import { LightningElement, track } from 'lwc';
import getOpportunities from '@salesforce/apex/OpportunitySummary.getOpportunities'
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

export default class OpportunitySummary extends LightningElement {

    @track columns = columns;
    @track data = [];
    connectedCallback(){
        this.findOpportunities();
    }

    findOpportunities(){
        getOpportunities({}).then( (response)=>{
            console.log('response', response);
            this.data = response;
        }); 
    }

}
import { LightningElement } from 'lwc';
import sayHello from '@salesforce/apex/HelloWorld.sayHello';


export default class HelloWorld extends LightningElement {
    message;

    connectedCallback() {
        sayHello()
            .then(result => {
                this.message = result;
            })
            .catch(error => {
                this.message = 'Error:' + error.body.message;
            });
    }
}

import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import * as serviceWorker from './serviceWorker';
import {observable} from 'mobx';
import {observer }  from 'mobx-react';

const myCount = observable({
    count: 0 ,
    sumCount: ()=> myCount.count += 1 ,
    minusCount: ()=> myCount.count -= 1 ,
});

const Counter = observer (props =>(
    
    <section style={{  textAlign:'center'}}>
    <div> {props.myCount.count} </div>
    <div> 
    <button onClick= {props.myCount.sumCount}> Suma </button>
    <button onClick={props.myCount.minusCount}> Resta </button>
    </div>
    </section>
    
    )
    )
    
    ReactDOM.render(
        <Counter myCount={myCount}/>,
        
        document.getElementById('root'));
        
        serviceWorker.unregister();
        

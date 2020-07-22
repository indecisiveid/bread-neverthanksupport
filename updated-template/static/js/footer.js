'use strict';

const e = React.createElement;

class Footer extends React.Component{
    render(){
        return (
            <div>Hello</div>
        );
    }
}
    

const domContainer = document.querySelector('#footer_container');
ReactDOM.render(e(Footer), domContainer);
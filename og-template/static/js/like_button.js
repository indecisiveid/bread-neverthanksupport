'use strict';

const e = React.createElement;

class LikeButton extends React.Component {
  constructor(props) {
    super(props);
    this.state = { liked: false,
      thing: 'Hi' };
  }

  componentDidMount(){
    this.getHelloWorld();
  }

  getHelloWorld() {
    fetch('/api').then(res => res.json()).then(data => {
      this.setState({thing: data.statement});
    })
    .catch(e =>{
      console.log(e + ' Not able to retreive getHelloWorld() from Flask');
    });
  }

  render() {
    if (this.state.liked) {
      return 'You liked this.';
    }

    return e(
      'div',
      { onClick: () => this.setState({ liked: true }) },
      this.state.thing
    );
  }
}

const domContainer = document.querySelector('#like_button_container');
ReactDOM.render(e(LikeButton), domContainer);
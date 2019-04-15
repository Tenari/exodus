var Today = createReactClass({
  render(){
    return <div>
      <h1>{this.props.reading && this.props.reading.date}</h1>
      <h3>You need to</h3>
      {_.map(this.props.dos, function(item, index){
        return <p key={index}>{item}</p>;
      })}
      <h3>And please do NOT</h3>
      {_.map(this.props.donts, function(item, index){
        return <p key={index}>{item}</p>;
      })}
      <h3>Daily reading</h3>
      <p>{this.props.reading && this.props.reading.text}</p>
    </div>
  }
})

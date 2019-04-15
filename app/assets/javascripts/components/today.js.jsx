var Today = createReactClass({
  render(){
    var day = this.props;
    return <div className="day-summary">
      <h2>{day.date}</h2>
      <h4>Reading</h4>
      <p>{day.reading}</p>
      <h4>Ascetic practices</h4>
      <ul>
        {_.map(day.practices, function(practice){
          return <li>{practice}</li>;
        })}
      </ul>
    </div>;
  }
})

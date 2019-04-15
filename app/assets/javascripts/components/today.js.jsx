var Today = createReactClass({
  render(){
    var day = this.props;
    var ps = [];
    _.each((day.reading || "").split("\n"), function(p){
      ps.push(<p>{p}</p>);
    })
    return <div className="day-summary">
      <h2>{day.date}</h2>
      <h4>Reading</h4>
      {ps}
      <h4>Ascetic practices</h4>
      <ul>
        {_.map(day.practices, function(practice){
          return <li>{practice}</li>;
        })}
      </ul>
    </div>;
  }
})

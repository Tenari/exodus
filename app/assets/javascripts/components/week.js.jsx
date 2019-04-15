var Week = createReactClass({
  render() {
    return <div className="week">
      <h1>Week of {this.props.week}</h1>
      {_.map(this.props.days, function(day){
        return <div className="day-summary">
          <h4>{day.date}</h4>
          <div>Reading:</div>
          <p>{day.reading}</p>
          <div>Asceticism:</div>
          <ul>
            {_.map(day.practices, function(practice){
              return <li>{practice}</li>;
            })}
          </ul>
          <div>Fraternity:</div>
          <div>Prayer:</div>
        </div>
      })}
    </div>
  }
})

var Week = createReactClass({
  render() {
    return <div className="week">
      <h1>Week of {this.props.week}</h1>
      {_.map(this.props.days, function(day){
        return <Today {...day}/>;
      })}
    </div>
  }
})

var Today = createReactClass({
  getInitialState() {
    return {day: this.props};
  },
  componentDidMount(){
    if (!this.props.date) {
      var that = this;
      $.get('/details/'+moment().format('YYYY-MM-DD'), function(results){
        console.log('fuck', results);
        that.setState({day: results});
      });
    }
  },
  render(){
    var day = this.state.day;
    var ps = [];
    _.each((day.reading || "").split("\n"), function(p, index){
      ps.push(<p key={index}>{p}</p>);
    })
    if (!day.date) return <h2>Loading...</h2>;

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

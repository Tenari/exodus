var Edit = createReactClass({
  getInitialState(){
    return {
      busy: false,
      today: this.props.today,
      details: JSON.parse(JSON.stringify(this.props.details)),
    }
  },
  updateDate(mod){
    var newDate;
    if (_.isNumber(mod)){
      newDate = moment(this.state.today).add(mod, 'days').format("YYYY-MM-DD");
    } else {
      newDate = $(mod.currentTarget).val();
    }
    var that = this;
    this.setState({busy: true, today: newDate}, function(){
      $.get('/details/'+newDate, function(details){
        console.log(details);
        that.setState({busy: false, details: details});
      })
    });
  },
  updatePlan(id){
    var details = this.state.details;
    if (details.practice_ids.includes(id)) {
      details.practice_ids = _.reject(details.practice_ids, function(i){return i == id;})
    } else {
      details.practice_ids.push(id);
    }
    this.setState({details: details});
  },
  updateReading(e){
    var details = this.state.details;
    details.reading = $(e.currentTarget).val();
    this.setState({details: details});
  },
  tellServer(){
    $.post('/reading/'+this.state.today, {text: this.state.details.reading}, function(response){
      console.log(response);
    })
    $.post('/update_ascetic_plans', {date: this.state.today, ids: this.state.details.practice_ids}, function(response){
      console.log(response);
    })
  },
  render() {
    var that = this;
    const details = this.state.details; // the details about what is going on on the current day
    var updatePlan = this.updatePlan;
    var updateDate = this.updateDate;
    var updateReading = this.updateReading;
    var body = <div>
      <h3>Ascetic practices:</h3>
      {_.map(this.props.ascetic_practices, function(practice){
        return <div key={practice.id}><input type="checkbox" checked={details.practice_ids.includes(practice.id)} onChange={()=> updatePlan(practice.id)}/> {practice.description}</div>
      })}
      <h3>Reading</h3>
      <textarea value={details.reading} onChange={updateReading}/>
      <button onClick={this.tellServer}>Save</button>
    </div>;
    if (this.state.busy) {
      body = <h1>Loading...</h1>;
    }
    return <div className="editor">
      <div><a href="javascript:;" onClick={()=>updateDate(-1)}>Prev</a> <input type="text" placeholder="yyyy-mm-dd" value={this.state.today} onChange={updateDate}/> <a href="javascript:;" onClick={()=>updateDate(1)}>Next</a></div>
      {body}
    </div>
  }
})

// expects props like <Tabs tabs={{a: {label: "A", component: "AComponent", props: {whatever AComponent needs}}}} />
var Tabs = createReactClass({
  getInitialState(){
    return {
      tab: _.keys(this.props.tabs)[0],
    }
  },
  render(){
    var that = this;
    var state = this.state;
    var tab = this.props.tabs[state.tab];
    const Content = eval(tab.component);
    return <div className="tabs">
      <div className="tab-list">
        {_.map(this.props.tabs, function(tab, key){
          return <div key={key} className={state.tab == key ? 'selected' : ''} onClick={()=> that.setState({tab: key})}>{tab.label}</div>
        })}
      </div>
      <div className="tab-content">
        <Content {...tab.props}/>
      </div>
    </div>;
  }
})

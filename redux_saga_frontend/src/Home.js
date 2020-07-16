import React from "react";
import { bindActionCreators } from "redux";
import { connect } from "react-redux";

import { requestApiData } from "./actions";

class Home extends React.Component {
  componentDidMount() {
    this.props.requestApiData();
  }

  person = (x, i) =>
    <div key={x.value}>
      <h1>
        {x.data}
      </h1>
    </div>;

  render() {
    const { results = [] } = this.props.data;
    return results.length
      ? <h1>
          {results.map(this.person)}
        </h1>
      : <h1>loading...</h1>;
  }
}

const mapStateToProps = state => ({ data: state.data });

const mapDispatchToProps = dispatch =>
  bindActionCreators({ requestApiData }, dispatch);

export default connect(mapStateToProps, mapDispatchToProps)(Home);

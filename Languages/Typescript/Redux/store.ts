import { createStore, Reducer } from "redux";

type State = {
  text: string;
};

type ActionTypes = "EDIT" | "DELETE" | "UPPERCASE" | "LOWERCASE";

type Action = {
  type: ActionTypes;
  payload?: string;
};

const textReducer: Reducer<State, Action> = (
  state: State = { text: "" },
  action: Action
): State => {
  switch (action.type) {
    case "EDIT": {
      if(action.payload?? action.payload){
         state.text = action.payload;
      }

      return state;
    }
    case "DELETE": {
      state.text = "";
      return state;
    }
    case "UPPERCASE": {
      state.text = state.text.toUpperCase();
      return state;
    }
    case "LOWERCASE": {
      state.text = state.text.toLowerCase();
      return state;
    }
    default: {
      return state;
    }
  }
};

const store = createStore(textReducer);

export default store;

import store from "./store";

export const selectText = () => store.getState().text;

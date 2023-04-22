import store from "./store";

export const editAction = (payload: string) =>
  store.dispatch({ type: "EDIT", payload });

export const deleteAction = () => {
  store.dispatch({ type: "EDIT"});
  console.log("deleted");
}

export const upperCaseAction = () =>
  store.dispatch({ type: "UPPERCASE" });

export const lowerCaseAction = () =>
  store.dispatch({ type: "LOWERCASE" });

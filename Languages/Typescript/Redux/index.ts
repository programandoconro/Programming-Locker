/// <reference lib="dom" /> 
import {
  editAction,
  upperCaseAction,
  lowerCaseAction,
  deleteAction,
} from "./actions";
import { selectText } from "./selectors";



editAction("Hello Redux");
console.log(selectText());
upperCaseAction();
console.log(selectText());
lowerCaseAction();
console.log(selectText());
deleteAction();//console.log(selectText());


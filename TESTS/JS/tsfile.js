var __spreadArray = (this && this.__spreadArray) || function (to, from, pack) {
    if (pack || arguments.length === 2) for (var i = 0, l = from.length, ar; i < l; i++) {
        if (ar || !(i in from)) {
            if (!ar) ar = Array.prototype.slice.call(from, 0, i);
            ar[i] = from[i];
        }
    }
    return to.concat(ar || Array.prototype.slice.call(from));
};
var myFunctionA = function () {
    var result = { optionA: "hola", optionB: "chao" };
    debugger;
    return result; // noerror
};
var myFunctionB = function () {
    var result = { optionA: "hola", optionC: "chao" };
    debugger;
    return result; // noerror
};
var myFunctionC = function () {
    console.log("My function D");
    return __spreadArray([], new Array(3), true).map(function (_, index) { return ({
        optionA: String(index),
        optionC: "hola"
    }); }); // no error
};
console.log(myFunctionA());
debugger;
console.log(myFunctionB());
debugger;
console.log(myFunctionC());
debugger;

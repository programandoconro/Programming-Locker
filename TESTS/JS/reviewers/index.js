// ==UserScript==
// // @name         New Userscript
// // @namespace    http://tampermonkey.net/
// // @version      2025-01-28
// // @description  try to take over the world!
// // @author       You
// // @match        https://git.rakuten-it.com/projects/DUI/repos/dynamic-ui/pull-requests?create&sourceBranch=refs%2Fheads%2Ftest-csp-payvault-checkout
// // @icon         https://www.google.com/s2/favicons?sz=64&domain=rakuten-it.com
// // @grant        none
// // ==/UserScript==

(function () {
  "use strict";

  const brook =
    '<div class="css-1xpo9qs-multiValue user-multi-select__multi-value"><div class="css-13qj0ki user-multi-select__multi-value__label"><div class="user-avatar-with-name"><div class="user-avatar"><div style="display: inline-block; position: relative; outline: 0px;"><span class="css-1clesr2"><span class="css-ob4lje" role="img" aria-label="Zhang, Yikun | Brook | ECMPD" style="background-image: url(&quot;/users/yikun.zhang/avatar.png?s=32&amp;v=1628577973639&quot;); border-radius: 50%;"></span></span></div></div><span class="user-name">Zhang, Yikun | Brook | ECMPD</span></div></div><div class="css-11yfpsh user-multi-select__multi-value__remove"><svg height="14" width="14" viewBox="0 0 20 20" aria-hidden="true" focusable="false" class="css-8mmkcg"><path d="M14.348 14.849c-0.469 0.469-1.229 0.469-1.697 0l-2.651-3.030-2.651 3.029c-0.469 0.469-1.229 0.469-1.697 0-0.469-0.469-0.469-1.229 0-1.697l2.758-3.15-2.759-3.152c-0.469-0.469-0.469-1.228 0-1.697s1.228-0.469 1.697 0l2.652 3.031 2.651-3.031c0.469-0.469 1.228-0.469 1.697 0s0.469 1.229 0 1.697l-2.758 3.152 2.758 3.15c0.469 0.469 0.469 1.229 0 1.698z"></path></svg></div></div>';
  const addReviewerInputEle = document.querySelector(
    "div.user-multi-select__value-container",
  );

  addReviewerInputEle.insertAdjacentHTML("beforeend", brook);
})();

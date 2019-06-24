(function(e){var t={};function __webpack_require__(n){if(t[n])return t[n].exports;var r=t[n]={i:n,l:!1,exports:{}};return e[n].call(r.exports,r,r.exports,__webpack_require__),r.l=!0,r.exports}__webpack_require__.m=e,__webpack_require__.c=t,__webpack_require__.d=function(e,t,n){__webpack_require__.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:n})},__webpack_require__.r=function(e){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},__webpack_require__.t=function(e,t){if(1&t&&(e=__webpack_require__(e)),8&t)return e;if(4&t&&"object"==typeof e&&e&&e.__esModule)return e;var n=Object.create(null);if(__webpack_require__.r(n),Object.defineProperty(n,"default",{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var r in e)__webpack_require__.d(n,r,function(t){return e[t]}.bind(null,r));return n},__webpack_require__.n=function(e){var t=e&&e.__esModule?function getDefault(){return e.default}:function getModuleExports(){return e};return __webpack_require__.d(t,"a",t),t},__webpack_require__.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},__webpack_require__.p="/",__webpack_require__(__webpack_require__.s=83)})({"/LmndHtB":function(e,t,n){"use strict";var r=setTimeout;function noop(){}function Promise(e){if(!(this instanceof Promise))throw new TypeError("Promises must be constructed via new");if("function"!=typeof e)throw new TypeError("not a function");this._state=0,this._handled=!1,this._value=void 0,this._deferreds=[],doResolve(e,this)}function handle(e,t){for(;3===e._state;)e=e._value;0!==e._state?(e._handled=!0,Promise._immediateFn(function(){var n=1===e._state?t.onFulfilled:t.onRejected;if(null!==n){var r;try{r=n(e._value)}catch(e){return void reject(t.promise,e)}resolve(t.promise,r)}else(1===e._state?resolve:reject)(t.promise,e._value)})):e._deferreds.push(t)}function resolve(e,t){try{if(t===e)throw new TypeError("A promise cannot be resolved with itself.");if(t&&("object"==typeof t||"function"==typeof t)){var n=t.then;if(t instanceof Promise)return e._state=3,e._value=t,void finale(e);if("function"==typeof n)return void doResolve(function bind(e,t){return function(){e.apply(t,arguments)}}(n,t),e)}e._state=1,e._value=t,finale(e)}catch(t){reject(e,t)}}function reject(e,t){e._state=2,e._value=t,finale(e)}function finale(e){2===e._state&&0===e._deferreds.length&&Promise._immediateFn(function(){e._handled||Promise._unhandledRejectionFn(e._value)});for(var t=0,n=e._deferreds.length;t<n;t++)handle(e,e._deferreds[t]);e._deferreds=null}function doResolve(e,t){var n=!1;try{e(function(e){n||(n=!0,resolve(t,e))},function(e){n||(n=!0,reject(t,e))})}catch(e){if(n)return;n=!0,reject(t,e)}}Promise.prototype.catch=function(e){return this.then(null,e)},Promise.prototype.then=function(e,t){var n=new this.constructor(noop);return handle(this,new function Handler(e,t,n){this.onFulfilled="function"==typeof e?e:null,this.onRejected="function"==typeof t?t:null,this.promise=n}(e,t,n)),n},Promise.prototype.finally=function(e){var t=this.constructor;return this.then(function(n){return t.resolve(e()).then(function(){return n})},function(n){return t.resolve(e()).then(function(){return t.reject(n)})})},Promise.all=function(e){return new Promise(function(t,n){if(!e||void 0===e.length)throw new TypeError("Promise.all accepts an array");var r=Array.prototype.slice.call(e);if(0===r.length)return t([]);var o=r.length;function res(e,i){try{if(i&&("object"==typeof i||"function"==typeof i)){var u=i.then;if("function"==typeof u)return void u.call(i,function(t){res(e,t)},n)}r[e]=i,0==--o&&t(r)}catch(e){n(e)}}for(var i=0;i<r.length;i++)res(i,r[i])})},Promise.resolve=function(e){return e&&"object"==typeof e&&e.constructor===Promise?e:new Promise(function(t){t(e)})},Promise.reject=function(e){return new Promise(function(t,n){n(e)})},Promise.race=function(e){return new Promise(function(t,n){for(var r=0,o=e.length;r<o;r++)e[r].then(t,n)})},Promise._immediateFn="function"==typeof setImmediate&&function(e){setImmediate(e)}||function(e){r(e,0)},Promise._unhandledRejectionFn=function _unhandledRejectionFn(e){"undefined"!=typeof console&&console&&console.warn("Possible Unhandled Promise Rejection:",e)},t.a=Promise},83:function(e,t,n){n("YWMBbUTH"),n("N+buissj"),e.exports=n("b6dEXCro")},"N+buissj":function(e,t,n){var r,o,i;r={},o=0,i=function(e){var t=document.getElementsByTagName("script")[0];t.parentNode.insertBefore(e,t)},e.exports=function(e,t,n){var u;t&&"function"!=typeof t&&(n=t.context||n,u=t.setup,t=t.callback);var c,a,l=document.createElement("script"),f=!1,s=function(){f||(f=!0,a(),t&&t.call(n,c))},_=function(){c=new Error(e||"EMPTY"),s()};if(!l.readyState||"async"in l)a=function(){l.onload=l.onerror=null},l.onerror=_,l.onload=s,l.async=!0,l.charset="utf-8",u&&u.call(n,l),l.src=e,i(l);else{var d=o++,p={loaded:!0,complete:!0},y=!1;a=function(){l.onreadystatechange=l.onerror=null,r[d]=void 0},l.onreadystatechange=function(){var e=l.readyState;if(!c){if(!y&&p[e]&&(y=!0,i(l)),"loaded"===e&&"loading"===l.readyState)return _();"complete"===l.readyState&&s()}},l.onerror=_,r[d]=l,u&&u.call(n,l),l.src=e}}},YWMBbUTH:function(e,t,n){"use strict";n.r(t),function(e){var t=n("/LmndHtB"),r=function(){if("undefined"!=typeof self)return self;if("undefined"!=typeof window)return window;if(void 0!==e)return e;throw new Error("unable to locate global object")}();r.Promise||(r.Promise=t.a)}.call(this,n("h6acz+VJ"))},b6dEXCro:function(e,t,n){"use strict";n.r(t),n.d(t,"default",function(){return loadPolyfill});n("YWMBbUTH");var r=n("N+buissj"),o=n.n(r);function loadPolyfill(){return new Promise(function(e){o()("https://cdn.polyfill.io/v3/polyfill.min.js?features=default,Intl,Intl.~locale.ru,Array.prototype.includes,WeakSet,Symbol,Symbol.iterator,Symbol.species,Array.prototype.find,Array.prototype.@@iterator,Set,Array.prototype.entries,Object.entries,String.prototype.includes,IntersectionObserver,Function.prototype.name&unknown=polyfill&flags=gated",function(t){return e(t||null)})})}window.polyfillPromise||(Array.prototype.some.call(document.head.getElementsByTagName("script"),function(e){return e.src&&-1!==e.src.indexOf("polyfill.io")})?window.polyfillPromise=new Promise(function(e){return e()}):window.polyfillPromise=loadPolyfill())},"h6acz+VJ":function(e,t){var n;n=function(){return this}();try{n=n||Function("return this")()||(0,eval)("this")}catch(e){"object"==typeof window&&(n=window)}e.exports=n}});
//# sourceMappingURL=polyfill.js.map?v=8998b2ef
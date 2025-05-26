function Fm(e,t){for(var n=0;n<t.length;n++){const r=t[n];if(typeof r!="string"&&!Array.isArray(r)){for(const o in r)if(o!=="default"&&!(o in e)){const i=Object.getOwnPropertyDescriptor(r,o);i&&Object.defineProperty(e,o,i.get?i:{enumerable:!0,get:()=>r[o]})}}}return Object.freeze(Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}))}(function(){const t=document.createElement("link").relList;if(t&&t.supports&&t.supports("modulepreload"))return;for(const o of document.querySelectorAll('link[rel="modulepreload"]'))r(o);new MutationObserver(o=>{for(const i of o)if(i.type==="childList")for(const l of i.addedNodes)l.tagName==="LINK"&&l.rel==="modulepreload"&&r(l)}).observe(document,{childList:!0,subtree:!0});function n(o){const i={};return o.integrity&&(i.integrity=o.integrity),o.referrerPolicy&&(i.referrerPolicy=o.referrerPolicy),o.crossOrigin==="use-credentials"?i.credentials="include":o.crossOrigin==="anonymous"?i.credentials="omit":i.credentials="same-origin",i}function r(o){if(o.ep)return;o.ep=!0;const i=n(o);fetch(o.href,i)}})();function Ps(e){return e&&e.__esModule&&Object.prototype.hasOwnProperty.call(e,"default")?e.default:e}var ka={},$f={exports:{}},mt={},jf={exports:{}},le={};/**
 * @license React
 * react.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */var Uo=Symbol.for("react.element"),Bm=Symbol.for("react.portal"),Vm=Symbol.for("react.fragment"),Hm=Symbol.for("react.strict_mode"),Wm=Symbol.for("react.profiler"),Qm=Symbol.for("react.provider"),Gm=Symbol.for("react.context"),Ym=Symbol.for("react.forward_ref"),Xm=Symbol.for("react.suspense"),Km=Symbol.for("react.memo"),Zm=Symbol.for("react.lazy"),Gu=Symbol.iterator;function Jm(e){return e===null||typeof e!="object"?null:(e=Gu&&e[Gu]||e["@@iterator"],typeof e=="function"?e:null)}var Df={isMounted:function(){return!1},enqueueForceUpdate:function(){},enqueueReplaceState:function(){},enqueueSetState:function(){}},Uf=Object.assign,Ff={};function Dr(e,t,n){this.props=e,this.context=t,this.refs=Ff,this.updater=n||Df}Dr.prototype.isReactComponent={};Dr.prototype.setState=function(e,t){if(typeof e!="object"&&typeof e!="function"&&e!=null)throw Error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.");this.updater.enqueueSetState(this,e,t,"setState")};Dr.prototype.forceUpdate=function(e){this.updater.enqueueForceUpdate(this,e,"forceUpdate")};function Bf(){}Bf.prototype=Dr.prototype;function Ls(e,t,n){this.props=e,this.context=t,this.refs=Ff,this.updater=n||Df}var _s=Ls.prototype=new Bf;_s.constructor=Ls;Uf(_s,Dr.prototype);_s.isPureReactComponent=!0;var Yu=Array.isArray,Vf=Object.prototype.hasOwnProperty,Os={current:null},Hf={key:!0,ref:!0,__self:!0,__source:!0};function Wf(e,t,n){var r,o={},i=null,l=null;if(t!=null)for(r in t.ref!==void 0&&(l=t.ref),t.key!==void 0&&(i=""+t.key),t)Vf.call(t,r)&&!Hf.hasOwnProperty(r)&&(o[r]=t[r]);var a=arguments.length-2;if(a===1)o.children=n;else if(1<a){for(var s=Array(a),u=0;u<a;u++)s[u]=arguments[u+2];o.children=s}if(e&&e.defaultProps)for(r in a=e.defaultProps,a)o[r]===void 0&&(o[r]=a[r]);return{$$typeof:Uo,type:e,key:i,ref:l,props:o,_owner:Os.current}}function qm(e,t){return{$$typeof:Uo,type:e.type,key:t,ref:e.ref,props:e.props,_owner:e._owner}}function Is(e){return typeof e=="object"&&e!==null&&e.$$typeof===Uo}function eh(e){var t={"=":"=0",":":"=2"};return"$"+e.replace(/[=:]/g,function(n){return t[n]})}var Xu=/\/+/g;function Ql(e,t){return typeof e=="object"&&e!==null&&e.key!=null?eh(""+e.key):t.toString(36)}function xi(e,t,n,r,o){var i=typeof e;(i==="undefined"||i==="boolean")&&(e=null);var l=!1;if(e===null)l=!0;else switch(i){case"string":case"number":l=!0;break;case"object":switch(e.$$typeof){case Uo:case Bm:l=!0}}if(l)return l=e,o=o(l),e=r===""?"."+Ql(l,0):r,Yu(o)?(n="",e!=null&&(n=e.replace(Xu,"$&/")+"/"),xi(o,t,n,"",function(u){return u})):o!=null&&(Is(o)&&(o=qm(o,n+(!o.key||l&&l.key===o.key?"":(""+o.key).replace(Xu,"$&/")+"/")+e)),t.push(o)),1;if(l=0,r=r===""?".":r+":",Yu(e))for(var a=0;a<e.length;a++){i=e[a];var s=r+Ql(i,a);l+=xi(i,t,n,s,o)}else if(s=Jm(e),typeof s=="function")for(e=s.call(e),a=0;!(i=e.next()).done;)i=i.value,s=r+Ql(i,a++),l+=xi(i,t,n,s,o);else if(i==="object")throw t=String(e),Error("Objects are not valid as a React child (found: "+(t==="[object Object]"?"object with keys {"+Object.keys(e).join(", ")+"}":t)+"). If you meant to render a collection of children, use an array instead.");return l}function Jo(e,t,n){if(e==null)return e;var r=[],o=0;return xi(e,r,"","",function(i){return t.call(n,i,o++)}),r}function th(e){if(e._status===-1){var t=e._result;t=t(),t.then(function(n){(e._status===0||e._status===-1)&&(e._status=1,e._result=n)},function(n){(e._status===0||e._status===-1)&&(e._status=2,e._result=n)}),e._status===-1&&(e._status=0,e._result=t)}if(e._status===1)return e._result.default;throw e._result}var qe={current:null},Si={transition:null},nh={ReactCurrentDispatcher:qe,ReactCurrentBatchConfig:Si,ReactCurrentOwner:Os};le.Children={map:Jo,forEach:function(e,t,n){Jo(e,function(){t.apply(this,arguments)},n)},count:function(e){var t=0;return Jo(e,function(){t++}),t},toArray:function(e){return Jo(e,function(t){return t})||[]},only:function(e){if(!Is(e))throw Error("React.Children.only expected to receive a single React element child.");return e}};le.Component=Dr;le.Fragment=Vm;le.Profiler=Wm;le.PureComponent=Ls;le.StrictMode=Hm;le.Suspense=Xm;le.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED=nh;le.cloneElement=function(e,t,n){if(e==null)throw Error("React.cloneElement(...): The argument must be a React element, but you passed "+e+".");var r=Uf({},e.props),o=e.key,i=e.ref,l=e._owner;if(t!=null){if(t.ref!==void 0&&(i=t.ref,l=Os.current),t.key!==void 0&&(o=""+t.key),e.type&&e.type.defaultProps)var a=e.type.defaultProps;for(s in t)Vf.call(t,s)&&!Hf.hasOwnProperty(s)&&(r[s]=t[s]===void 0&&a!==void 0?a[s]:t[s])}var s=arguments.length-2;if(s===1)r.children=n;else if(1<s){a=Array(s);for(var u=0;u<s;u++)a[u]=arguments[u+2];r.children=a}return{$$typeof:Uo,type:e.type,key:o,ref:i,props:r,_owner:l}};le.createContext=function(e){return e={$$typeof:Gm,_currentValue:e,_currentValue2:e,_threadCount:0,Provider:null,Consumer:null,_defaultValue:null,_globalName:null},e.Provider={$$typeof:Qm,_context:e},e.Consumer=e};le.createElement=Wf;le.createFactory=function(e){var t=Wf.bind(null,e);return t.type=e,t};le.createRef=function(){return{current:null}};le.forwardRef=function(e){return{$$typeof:Ym,render:e}};le.isValidElement=Is;le.lazy=function(e){return{$$typeof:Zm,_payload:{_status:-1,_result:e},_init:th}};le.memo=function(e,t){return{$$typeof:Km,type:e,compare:t===void 0?null:t}};le.startTransition=function(e){var t=Si.transition;Si.transition={};try{e()}finally{Si.transition=t}};le.unstable_act=function(){throw Error("act(...) is not supported in production builds of React.")};le.useCallback=function(e,t){return qe.current.useCallback(e,t)};le.useContext=function(e){return qe.current.useContext(e)};le.useDebugValue=function(){};le.useDeferredValue=function(e){return qe.current.useDeferredValue(e)};le.useEffect=function(e,t){return qe.current.useEffect(e,t)};le.useId=function(){return qe.current.useId()};le.useImperativeHandle=function(e,t,n){return qe.current.useImperativeHandle(e,t,n)};le.useInsertionEffect=function(e,t){return qe.current.useInsertionEffect(e,t)};le.useLayoutEffect=function(e,t){return qe.current.useLayoutEffect(e,t)};le.useMemo=function(e,t){return qe.current.useMemo(e,t)};le.useReducer=function(e,t,n){return qe.current.useReducer(e,t,n)};le.useRef=function(e){return qe.current.useRef(e)};le.useState=function(e){return qe.current.useState(e)};le.useSyncExternalStore=function(e,t,n){return qe.current.useSyncExternalStore(e,t,n)};le.useTransition=function(){return qe.current.useTransition()};le.version="18.2.0";jf.exports=le;var x=jf.exports;const st=Ps(x),rh=Fm({__proto__:null,default:st},[x]);var Qf={exports:{}},Gf={};/**
 * @license React
 * scheduler.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */(function(e){function t(P,B){var j=P.length;P.push(B);e:for(;0<j;){var se=j-1>>>1,O=P[se];if(0<o(O,B))P[se]=B,P[j]=O,j=se;else break e}}function n(P){return P.length===0?null:P[0]}function r(P){if(P.length===0)return null;var B=P[0],j=P.pop();if(j!==B){P[0]=j;e:for(var se=0,O=P.length,T=O>>>1;se<T;){var $=2*(se+1)-1,X=P[$],k=$+1,W=P[k];if(0>o(X,j))k<O&&0>o(W,X)?(P[se]=W,P[k]=j,se=k):(P[se]=X,P[$]=j,se=$);else if(k<O&&0>o(W,j))P[se]=W,P[k]=j,se=k;else break e}}return B}function o(P,B){var j=P.sortIndex-B.sortIndex;return j!==0?j:P.id-B.id}if(typeof performance=="object"&&typeof performance.now=="function"){var i=performance;e.unstable_now=function(){return i.now()}}else{var l=Date,a=l.now();e.unstable_now=function(){return l.now()-a}}var s=[],u=[],d=1,p=null,h=3,v=!1,g=!1,w=!1,C=typeof setTimeout=="function"?setTimeout:null,f=typeof clearTimeout=="function"?clearTimeout:null,c=typeof setImmediate<"u"?setImmediate:null;typeof navigator<"u"&&navigator.scheduling!==void 0&&navigator.scheduling.isInputPending!==void 0&&navigator.scheduling.isInputPending.bind(navigator.scheduling);function m(P){for(var B=n(u);B!==null;){if(B.callback===null)r(u);else if(B.startTime<=P)r(u),B.sortIndex=B.expirationTime,t(s,B);else break;B=n(u)}}function S(P){if(w=!1,m(P),!g)if(n(s)!==null)g=!0,V(A);else{var B=n(u);B!==null&&G(S,B.startTime-P)}}function A(P,B){g=!1,w&&(w=!1,f(b),b=-1),v=!0;var j=h;try{for(m(B),p=n(s);p!==null&&(!(p.expirationTime>B)||P&&!ae());){var se=p.callback;if(typeof se=="function"){p.callback=null,h=p.priorityLevel;var O=se(p.expirationTime<=B);B=e.unstable_now(),typeof O=="function"?p.callback=O:p===n(s)&&r(s),m(B)}else r(s);p=n(s)}if(p!==null)var T=!0;else{var $=n(u);$!==null&&G(S,$.startTime-B),T=!1}return T}finally{p=null,h=j,v=!1}}var E=!1,N=null,b=-1,z=5,F=-1;function ae(){return!(e.unstable_now()-F<z)}function ee(){if(N!==null){var P=e.unstable_now();F=P;var B=!0;try{B=N(!0,P)}finally{B?I():(E=!1,N=null)}}else E=!1}var I;if(typeof c=="function")I=function(){c(ee)};else if(typeof MessageChannel<"u"){var H=new MessageChannel,M=H.port2;H.port1.onmessage=ee,I=function(){M.postMessage(null)}}else I=function(){C(ee,0)};function V(P){N=P,E||(E=!0,I())}function G(P,B){b=C(function(){P(e.unstable_now())},B)}e.unstable_IdlePriority=5,e.unstable_ImmediatePriority=1,e.unstable_LowPriority=4,e.unstable_NormalPriority=3,e.unstable_Profiling=null,e.unstable_UserBlockingPriority=2,e.unstable_cancelCallback=function(P){P.callback=null},e.unstable_continueExecution=function(){g||v||(g=!0,V(A))},e.unstable_forceFrameRate=function(P){0>P||125<P?console.error("forceFrameRate takes a positive int between 0 and 125, forcing frame rates higher than 125 fps is not supported"):z=0<P?Math.floor(1e3/P):5},e.unstable_getCurrentPriorityLevel=function(){return h},e.unstable_getFirstCallbackNode=function(){return n(s)},e.unstable_next=function(P){switch(h){case 1:case 2:case 3:var B=3;break;default:B=h}var j=h;h=B;try{return P()}finally{h=j}},e.unstable_pauseExecution=function(){},e.unstable_requestPaint=function(){},e.unstable_runWithPriority=function(P,B){switch(P){case 1:case 2:case 3:case 4:case 5:break;default:P=3}var j=h;h=P;try{return B()}finally{h=j}},e.unstable_scheduleCallback=function(P,B,j){var se=e.unstable_now();switch(typeof j=="object"&&j!==null?(j=j.delay,j=typeof j=="number"&&0<j?se+j:se):j=se,P){case 1:var O=-1;break;case 2:O=250;break;case 5:O=1073741823;break;case 4:O=1e4;break;default:O=5e3}return O=j+O,P={id:d++,callback:B,priorityLevel:P,startTime:j,expirationTime:O,sortIndex:-1},j>se?(P.sortIndex=j,t(u,P),n(s)===null&&P===n(u)&&(w?(f(b),b=-1):w=!0,G(S,j-se))):(P.sortIndex=O,t(s,P),g||v||(g=!0,V(A))),P},e.unstable_shouldYield=ae,e.unstable_wrapCallback=function(P){var B=h;return function(){var j=h;h=B;try{return P.apply(this,arguments)}finally{h=j}}}})(Gf);Qf.exports=Gf;var oh=Qf.exports;/**
 * @license React
 * react-dom.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */var Yf=x,pt=oh;function L(e){for(var t="https://reactjs.org/docs/error-decoder.html?invariant="+e,n=1;n<arguments.length;n++)t+="&args[]="+encodeURIComponent(arguments[n]);return"Minified React error #"+e+"; visit "+t+" for the full message or use the non-minified dev environment for full errors and additional helpful warnings."}var Xf=new Set,xo={};function Jn(e,t){Lr(e,t),Lr(e+"Capture",t)}function Lr(e,t){for(xo[e]=t,e=0;e<t.length;e++)Xf.add(t[e])}var nn=!(typeof window>"u"||typeof window.document>"u"||typeof window.document.createElement>"u"),Ca=Object.prototype.hasOwnProperty,ih=/^[:A-Z_a-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02FF\u0370-\u037D\u037F-\u1FFF\u200C-\u200D\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD][:A-Z_a-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02FF\u0370-\u037D\u037F-\u1FFF\u200C-\u200D\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD\-.0-9\u00B7\u0300-\u036F\u203F-\u2040]*$/,Ku={},Zu={};function lh(e){return Ca.call(Zu,e)?!0:Ca.call(Ku,e)?!1:ih.test(e)?Zu[e]=!0:(Ku[e]=!0,!1)}function ah(e,t,n,r){if(n!==null&&n.type===0)return!1;switch(typeof t){case"function":case"symbol":return!0;case"boolean":return r?!1:n!==null?!n.acceptsBooleans:(e=e.toLowerCase().slice(0,5),e!=="data-"&&e!=="aria-");default:return!1}}function sh(e,t,n,r){if(t===null||typeof t>"u"||ah(e,t,n,r))return!0;if(r)return!1;if(n!==null)switch(n.type){case 3:return!t;case 4:return t===!1;case 5:return isNaN(t);case 6:return isNaN(t)||1>t}return!1}function et(e,t,n,r,o,i,l){this.acceptsBooleans=t===2||t===3||t===4,this.attributeName=r,this.attributeNamespace=o,this.mustUseProperty=n,this.propertyName=e,this.type=t,this.sanitizeURL=i,this.removeEmptyString=l}var Be={};"children dangerouslySetInnerHTML defaultValue defaultChecked innerHTML suppressContentEditableWarning suppressHydrationWarning style".split(" ").forEach(function(e){Be[e]=new et(e,0,!1,e,null,!1,!1)});[["acceptCharset","accept-charset"],["className","class"],["htmlFor","for"],["httpEquiv","http-equiv"]].forEach(function(e){var t=e[0];Be[t]=new et(t,1,!1,e[1],null,!1,!1)});["contentEditable","draggable","spellCheck","value"].forEach(function(e){Be[e]=new et(e,2,!1,e.toLowerCase(),null,!1,!1)});["autoReverse","externalResourcesRequired","focusable","preserveAlpha"].forEach(function(e){Be[e]=new et(e,2,!1,e,null,!1,!1)});"allowFullScreen async autoFocus autoPlay controls default defer disabled disablePictureInPicture disableRemotePlayback formNoValidate hidden loop noModule noValidate open playsInline readOnly required reversed scoped seamless itemScope".split(" ").forEach(function(e){Be[e]=new et(e,3,!1,e.toLowerCase(),null,!1,!1)});["checked","multiple","muted","selected"].forEach(function(e){Be[e]=new et(e,3,!0,e,null,!1,!1)});["capture","download"].forEach(function(e){Be[e]=new et(e,4,!1,e,null,!1,!1)});["cols","rows","size","span"].forEach(function(e){Be[e]=new et(e,6,!1,e,null,!1,!1)});["rowSpan","start"].forEach(function(e){Be[e]=new et(e,5,!1,e.toLowerCase(),null,!1,!1)});var Ts=/[\-:]([a-z])/g;function zs(e){return e[1].toUpperCase()}"accent-height alignment-baseline arabic-form baseline-shift cap-height clip-path clip-rule color-interpolation color-interpolation-filters color-profile color-rendering dominant-baseline enable-background fill-opacity fill-rule flood-color flood-opacity font-family font-size font-size-adjust font-stretch font-style font-variant font-weight glyph-name glyph-orientation-horizontal glyph-orientation-vertical horiz-adv-x horiz-origin-x image-rendering letter-spacing lighting-color marker-end marker-mid marker-start overline-position overline-thickness paint-order panose-1 pointer-events rendering-intent shape-rendering stop-color stop-opacity strikethrough-position strikethrough-thickness stroke-dasharray stroke-dashoffset stroke-linecap stroke-linejoin stroke-miterlimit stroke-opacity stroke-width text-anchor text-decoration text-rendering underline-position underline-thickness unicode-bidi unicode-range units-per-em v-alphabetic v-hanging v-ideographic v-mathematical vector-effect vert-adv-y vert-origin-x vert-origin-y word-spacing writing-mode xmlns:xlink x-height".split(" ").forEach(function(e){var t=e.replace(Ts,zs);Be[t]=new et(t,1,!1,e,null,!1,!1)});"xlink:actuate xlink:arcrole xlink:role xlink:show xlink:title xlink:type".split(" ").forEach(function(e){var t=e.replace(Ts,zs);Be[t]=new et(t,1,!1,e,"http://www.w3.org/1999/xlink",!1,!1)});["xml:base","xml:lang","xml:space"].forEach(function(e){var t=e.replace(Ts,zs);Be[t]=new et(t,1,!1,e,"http://www.w3.org/XML/1998/namespace",!1,!1)});["tabIndex","crossOrigin"].forEach(function(e){Be[e]=new et(e,1,!1,e.toLowerCase(),null,!1,!1)});Be.xlinkHref=new et("xlinkHref",1,!1,"xlink:href","http://www.w3.org/1999/xlink",!0,!1);["src","href","action","formAction"].forEach(function(e){Be[e]=new et(e,1,!1,e.toLowerCase(),null,!0,!0)});function Ms(e,t,n,r){var o=Be.hasOwnProperty(t)?Be[t]:null;(o!==null?o.type!==0:r||!(2<t.length)||t[0]!=="o"&&t[0]!=="O"||t[1]!=="n"&&t[1]!=="N")&&(sh(t,n,o,r)&&(n=null),r||o===null?lh(t)&&(n===null?e.removeAttribute(t):e.setAttribute(t,""+n)):o.mustUseProperty?e[o.propertyName]=n===null?o.type===3?!1:"":n:(t=o.attributeName,r=o.attributeNamespace,n===null?e.removeAttribute(t):(o=o.type,n=o===3||o===4&&n===!0?"":""+n,r?e.setAttributeNS(r,t,n):e.setAttribute(t,n))))}var un=Yf.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED,qo=Symbol.for("react.element"),ur=Symbol.for("react.portal"),cr=Symbol.for("react.fragment"),$s=Symbol.for("react.strict_mode"),Ea=Symbol.for("react.profiler"),Kf=Symbol.for("react.provider"),Zf=Symbol.for("react.context"),js=Symbol.for("react.forward_ref"),Aa=Symbol.for("react.suspense"),Na=Symbol.for("react.suspense_list"),Ds=Symbol.for("react.memo"),dn=Symbol.for("react.lazy"),Jf=Symbol.for("react.offscreen"),Ju=Symbol.iterator;function Kr(e){return e===null||typeof e!="object"?null:(e=Ju&&e[Ju]||e["@@iterator"],typeof e=="function"?e:null)}var Ne=Object.assign,Gl;function oo(e){if(Gl===void 0)try{throw Error()}catch(n){var t=n.stack.trim().match(/\n( *(at )?)/);Gl=t&&t[1]||""}return`
`+Gl+e}var Yl=!1;function Xl(e,t){if(!e||Yl)return"";Yl=!0;var n=Error.prepareStackTrace;Error.prepareStackTrace=void 0;try{if(t)if(t=function(){throw Error()},Object.defineProperty(t.prototype,"props",{set:function(){throw Error()}}),typeof Reflect=="object"&&Reflect.construct){try{Reflect.construct(t,[])}catch(u){var r=u}Reflect.construct(e,[],t)}else{try{t.call()}catch(u){r=u}e.call(t.prototype)}else{try{throw Error()}catch(u){r=u}e()}}catch(u){if(u&&r&&typeof u.stack=="string"){for(var o=u.stack.split(`
`),i=r.stack.split(`
`),l=o.length-1,a=i.length-1;1<=l&&0<=a&&o[l]!==i[a];)a--;for(;1<=l&&0<=a;l--,a--)if(o[l]!==i[a]){if(l!==1||a!==1)do if(l--,a--,0>a||o[l]!==i[a]){var s=`
`+o[l].replace(" at new "," at ");return e.displayName&&s.includes("<anonymous>")&&(s=s.replace("<anonymous>",e.displayName)),s}while(1<=l&&0<=a);break}}}finally{Yl=!1,Error.prepareStackTrace=n}return(e=e?e.displayName||e.name:"")?oo(e):""}function uh(e){switch(e.tag){case 5:return oo(e.type);case 16:return oo("Lazy");case 13:return oo("Suspense");case 19:return oo("SuspenseList");case 0:case 2:case 15:return e=Xl(e.type,!1),e;case 11:return e=Xl(e.type.render,!1),e;case 1:return e=Xl(e.type,!0),e;default:return""}}function ba(e){if(e==null)return null;if(typeof e=="function")return e.displayName||e.name||null;if(typeof e=="string")return e;switch(e){case cr:return"Fragment";case ur:return"Portal";case Ea:return"Profiler";case $s:return"StrictMode";case Aa:return"Suspense";case Na:return"SuspenseList"}if(typeof e=="object")switch(e.$$typeof){case Zf:return(e.displayName||"Context")+".Consumer";case Kf:return(e._context.displayName||"Context")+".Provider";case js:var t=e.render;return e=e.displayName,e||(e=t.displayName||t.name||"",e=e!==""?"ForwardRef("+e+")":"ForwardRef"),e;case Ds:return t=e.displayName||null,t!==null?t:ba(e.type)||"Memo";case dn:t=e._payload,e=e._init;try{return ba(e(t))}catch{}}return null}function ch(e){var t=e.type;switch(e.tag){case 24:return"Cache";case 9:return(t.displayName||"Context")+".Consumer";case 10:return(t._context.displayName||"Context")+".Provider";case 18:return"DehydratedFragment";case 11:return e=t.render,e=e.displayName||e.name||"",t.displayName||(e!==""?"ForwardRef("+e+")":"ForwardRef");case 7:return"Fragment";case 5:return t;case 4:return"Portal";case 3:return"Root";case 6:return"Text";case 16:return ba(t);case 8:return t===$s?"StrictMode":"Mode";case 22:return"Offscreen";case 12:return"Profiler";case 21:return"Scope";case 13:return"Suspense";case 19:return"SuspenseList";case 25:return"TracingMarker";case 1:case 0:case 17:case 2:case 14:case 15:if(typeof t=="function")return t.displayName||t.name||null;if(typeof t=="string")return t}return null}function Pn(e){switch(typeof e){case"boolean":case"number":case"string":case"undefined":return e;case"object":return e;default:return""}}function qf(e){var t=e.type;return(e=e.nodeName)&&e.toLowerCase()==="input"&&(t==="checkbox"||t==="radio")}function fh(e){var t=qf(e)?"checked":"value",n=Object.getOwnPropertyDescriptor(e.constructor.prototype,t),r=""+e[t];if(!e.hasOwnProperty(t)&&typeof n<"u"&&typeof n.get=="function"&&typeof n.set=="function"){var o=n.get,i=n.set;return Object.defineProperty(e,t,{configurable:!0,get:function(){return o.call(this)},set:function(l){r=""+l,i.call(this,l)}}),Object.defineProperty(e,t,{enumerable:n.enumerable}),{getValue:function(){return r},setValue:function(l){r=""+l},stopTracking:function(){e._valueTracker=null,delete e[t]}}}}function ei(e){e._valueTracker||(e._valueTracker=fh(e))}function ed(e){if(!e)return!1;var t=e._valueTracker;if(!t)return!0;var n=t.getValue(),r="";return e&&(r=qf(e)?e.checked?"true":"false":e.value),e=r,e!==n?(t.setValue(e),!0):!1}function Ii(e){if(e=e||(typeof document<"u"?document:void 0),typeof e>"u")return null;try{return e.activeElement||e.body}catch{return e.body}}function Ra(e,t){var n=t.checked;return Ne({},t,{defaultChecked:void 0,defaultValue:void 0,value:void 0,checked:n??e._wrapperState.initialChecked})}function qu(e,t){var n=t.defaultValue==null?"":t.defaultValue,r=t.checked!=null?t.checked:t.defaultChecked;n=Pn(t.value!=null?t.value:n),e._wrapperState={initialChecked:r,initialValue:n,controlled:t.type==="checkbox"||t.type==="radio"?t.checked!=null:t.value!=null}}function td(e,t){t=t.checked,t!=null&&Ms(e,"checked",t,!1)}function Pa(e,t){td(e,t);var n=Pn(t.value),r=t.type;if(n!=null)r==="number"?(n===0&&e.value===""||e.value!=n)&&(e.value=""+n):e.value!==""+n&&(e.value=""+n);else if(r==="submit"||r==="reset"){e.removeAttribute("value");return}t.hasOwnProperty("value")?La(e,t.type,n):t.hasOwnProperty("defaultValue")&&La(e,t.type,Pn(t.defaultValue)),t.checked==null&&t.defaultChecked!=null&&(e.defaultChecked=!!t.defaultChecked)}function ec(e,t,n){if(t.hasOwnProperty("value")||t.hasOwnProperty("defaultValue")){var r=t.type;if(!(r!=="submit"&&r!=="reset"||t.value!==void 0&&t.value!==null))return;t=""+e._wrapperState.initialValue,n||t===e.value||(e.value=t),e.defaultValue=t}n=e.name,n!==""&&(e.name=""),e.defaultChecked=!!e._wrapperState.initialChecked,n!==""&&(e.name=n)}function La(e,t,n){(t!=="number"||Ii(e.ownerDocument)!==e)&&(n==null?e.defaultValue=""+e._wrapperState.initialValue:e.defaultValue!==""+n&&(e.defaultValue=""+n))}var io=Array.isArray;function kr(e,t,n,r){if(e=e.options,t){t={};for(var o=0;o<n.length;o++)t["$"+n[o]]=!0;for(n=0;n<e.length;n++)o=t.hasOwnProperty("$"+e[n].value),e[n].selected!==o&&(e[n].selected=o),o&&r&&(e[n].defaultSelected=!0)}else{for(n=""+Pn(n),t=null,o=0;o<e.length;o++){if(e[o].value===n){e[o].selected=!0,r&&(e[o].defaultSelected=!0);return}t!==null||e[o].disabled||(t=e[o])}t!==null&&(t.selected=!0)}}function _a(e,t){if(t.dangerouslySetInnerHTML!=null)throw Error(L(91));return Ne({},t,{value:void 0,defaultValue:void 0,children:""+e._wrapperState.initialValue})}function tc(e,t){var n=t.value;if(n==null){if(n=t.children,t=t.defaultValue,n!=null){if(t!=null)throw Error(L(92));if(io(n)){if(1<n.length)throw Error(L(93));n=n[0]}t=n}t==null&&(t=""),n=t}e._wrapperState={initialValue:Pn(n)}}function nd(e,t){var n=Pn(t.value),r=Pn(t.defaultValue);n!=null&&(n=""+n,n!==e.value&&(e.value=n),t.defaultValue==null&&e.defaultValue!==n&&(e.defaultValue=n)),r!=null&&(e.defaultValue=""+r)}function nc(e){var t=e.textContent;t===e._wrapperState.initialValue&&t!==""&&t!==null&&(e.value=t)}function rd(e){switch(e){case"svg":return"http://www.w3.org/2000/svg";case"math":return"http://www.w3.org/1998/Math/MathML";default:return"http://www.w3.org/1999/xhtml"}}function Oa(e,t){return e==null||e==="http://www.w3.org/1999/xhtml"?rd(t):e==="http://www.w3.org/2000/svg"&&t==="foreignObject"?"http://www.w3.org/1999/xhtml":e}var ti,od=function(e){return typeof MSApp<"u"&&MSApp.execUnsafeLocalFunction?function(t,n,r,o){MSApp.execUnsafeLocalFunction(function(){return e(t,n,r,o)})}:e}(function(e,t){if(e.namespaceURI!=="http://www.w3.org/2000/svg"||"innerHTML"in e)e.innerHTML=t;else{for(ti=ti||document.createElement("div"),ti.innerHTML="<svg>"+t.valueOf().toString()+"</svg>",t=ti.firstChild;e.firstChild;)e.removeChild(e.firstChild);for(;t.firstChild;)e.appendChild(t.firstChild)}});function So(e,t){if(t){var n=e.firstChild;if(n&&n===e.lastChild&&n.nodeType===3){n.nodeValue=t;return}}e.textContent=t}var uo={animationIterationCount:!0,aspectRatio:!0,borderImageOutset:!0,borderImageSlice:!0,borderImageWidth:!0,boxFlex:!0,boxFlexGroup:!0,boxOrdinalGroup:!0,columnCount:!0,columns:!0,flex:!0,flexGrow:!0,flexPositive:!0,flexShrink:!0,flexNegative:!0,flexOrder:!0,gridArea:!0,gridRow:!0,gridRowEnd:!0,gridRowSpan:!0,gridRowStart:!0,gridColumn:!0,gridColumnEnd:!0,gridColumnSpan:!0,gridColumnStart:!0,fontWeight:!0,lineClamp:!0,lineHeight:!0,opacity:!0,order:!0,orphans:!0,tabSize:!0,widows:!0,zIndex:!0,zoom:!0,fillOpacity:!0,floodOpacity:!0,stopOpacity:!0,strokeDasharray:!0,strokeDashoffset:!0,strokeMiterlimit:!0,strokeOpacity:!0,strokeWidth:!0},dh=["Webkit","ms","Moz","O"];Object.keys(uo).forEach(function(e){dh.forEach(function(t){t=t+e.charAt(0).toUpperCase()+e.substring(1),uo[t]=uo[e]})});function id(e,t,n){return t==null||typeof t=="boolean"||t===""?"":n||typeof t!="number"||t===0||uo.hasOwnProperty(e)&&uo[e]?(""+t).trim():t+"px"}function ld(e,t){e=e.style;for(var n in t)if(t.hasOwnProperty(n)){var r=n.indexOf("--")===0,o=id(n,t[n],r);n==="float"&&(n="cssFloat"),r?e.setProperty(n,o):e[n]=o}}var ph=Ne({menuitem:!0},{area:!0,base:!0,br:!0,col:!0,embed:!0,hr:!0,img:!0,input:!0,keygen:!0,link:!0,meta:!0,param:!0,source:!0,track:!0,wbr:!0});function Ia(e,t){if(t){if(ph[e]&&(t.children!=null||t.dangerouslySetInnerHTML!=null))throw Error(L(137,e));if(t.dangerouslySetInnerHTML!=null){if(t.children!=null)throw Error(L(60));if(typeof t.dangerouslySetInnerHTML!="object"||!("__html"in t.dangerouslySetInnerHTML))throw Error(L(61))}if(t.style!=null&&typeof t.style!="object")throw Error(L(62))}}function Ta(e,t){if(e.indexOf("-")===-1)return typeof t.is=="string";switch(e){case"annotation-xml":case"color-profile":case"font-face":case"font-face-src":case"font-face-uri":case"font-face-format":case"font-face-name":case"missing-glyph":return!1;default:return!0}}var za=null;function Us(e){return e=e.target||e.srcElement||window,e.correspondingUseElement&&(e=e.correspondingUseElement),e.nodeType===3?e.parentNode:e}var Ma=null,Cr=null,Er=null;function rc(e){if(e=Vo(e)){if(typeof Ma!="function")throw Error(L(280));var t=e.stateNode;t&&(t=gl(t),Ma(e.stateNode,e.type,t))}}function ad(e){Cr?Er?Er.push(e):Er=[e]:Cr=e}function sd(){if(Cr){var e=Cr,t=Er;if(Er=Cr=null,rc(e),t)for(e=0;e<t.length;e++)rc(t[e])}}function ud(e,t){return e(t)}function cd(){}var Kl=!1;function fd(e,t,n){if(Kl)return e(t,n);Kl=!0;try{return ud(e,t,n)}finally{Kl=!1,(Cr!==null||Er!==null)&&(cd(),sd())}}function ko(e,t){var n=e.stateNode;if(n===null)return null;var r=gl(n);if(r===null)return null;n=r[t];e:switch(t){case"onClick":case"onClickCapture":case"onDoubleClick":case"onDoubleClickCapture":case"onMouseDown":case"onMouseDownCapture":case"onMouseMove":case"onMouseMoveCapture":case"onMouseUp":case"onMouseUpCapture":case"onMouseEnter":(r=!r.disabled)||(e=e.type,r=!(e==="button"||e==="input"||e==="select"||e==="textarea")),e=!r;break e;default:e=!1}if(e)return null;if(n&&typeof n!="function")throw Error(L(231,t,typeof n));return n}var $a=!1;if(nn)try{var Zr={};Object.defineProperty(Zr,"passive",{get:function(){$a=!0}}),window.addEventListener("test",Zr,Zr),window.removeEventListener("test",Zr,Zr)}catch{$a=!1}function mh(e,t,n,r,o,i,l,a,s){var u=Array.prototype.slice.call(arguments,3);try{t.apply(n,u)}catch(d){this.onError(d)}}var co=!1,Ti=null,zi=!1,ja=null,hh={onError:function(e){co=!0,Ti=e}};function gh(e,t,n,r,o,i,l,a,s){co=!1,Ti=null,mh.apply(hh,arguments)}function vh(e,t,n,r,o,i,l,a,s){if(gh.apply(this,arguments),co){if(co){var u=Ti;co=!1,Ti=null}else throw Error(L(198));zi||(zi=!0,ja=u)}}function qn(e){var t=e,n=e;if(e.alternate)for(;t.return;)t=t.return;else{e=t;do t=e,t.flags&4098&&(n=t.return),e=t.return;while(e)}return t.tag===3?n:null}function dd(e){if(e.tag===13){var t=e.memoizedState;if(t===null&&(e=e.alternate,e!==null&&(t=e.memoizedState)),t!==null)return t.dehydrated}return null}function oc(e){if(qn(e)!==e)throw Error(L(188))}function yh(e){var t=e.alternate;if(!t){if(t=qn(e),t===null)throw Error(L(188));return t!==e?null:e}for(var n=e,r=t;;){var o=n.return;if(o===null)break;var i=o.alternate;if(i===null){if(r=o.return,r!==null){n=r;continue}break}if(o.child===i.child){for(i=o.child;i;){if(i===n)return oc(o),e;if(i===r)return oc(o),t;i=i.sibling}throw Error(L(188))}if(n.return!==r.return)n=o,r=i;else{for(var l=!1,a=o.child;a;){if(a===n){l=!0,n=o,r=i;break}if(a===r){l=!0,r=o,n=i;break}a=a.sibling}if(!l){for(a=i.child;a;){if(a===n){l=!0,n=i,r=o;break}if(a===r){l=!0,r=i,n=o;break}a=a.sibling}if(!l)throw Error(L(189))}}if(n.alternate!==r)throw Error(L(190))}if(n.tag!==3)throw Error(L(188));return n.stateNode.current===n?e:t}function pd(e){return e=yh(e),e!==null?md(e):null}function md(e){if(e.tag===5||e.tag===6)return e;for(e=e.child;e!==null;){var t=md(e);if(t!==null)return t;e=e.sibling}return null}var hd=pt.unstable_scheduleCallback,ic=pt.unstable_cancelCallback,wh=pt.unstable_shouldYield,xh=pt.unstable_requestPaint,Pe=pt.unstable_now,Sh=pt.unstable_getCurrentPriorityLevel,Fs=pt.unstable_ImmediatePriority,gd=pt.unstable_UserBlockingPriority,Mi=pt.unstable_NormalPriority,kh=pt.unstable_LowPriority,vd=pt.unstable_IdlePriority,dl=null,Wt=null;function Ch(e){if(Wt&&typeof Wt.onCommitFiberRoot=="function")try{Wt.onCommitFiberRoot(dl,e,void 0,(e.current.flags&128)===128)}catch{}}var zt=Math.clz32?Math.clz32:Nh,Eh=Math.log,Ah=Math.LN2;function Nh(e){return e>>>=0,e===0?32:31-(Eh(e)/Ah|0)|0}var ni=64,ri=4194304;function lo(e){switch(e&-e){case 1:return 1;case 2:return 2;case 4:return 4;case 8:return 8;case 16:return 16;case 32:return 32;case 64:case 128:case 256:case 512:case 1024:case 2048:case 4096:case 8192:case 16384:case 32768:case 65536:case 131072:case 262144:case 524288:case 1048576:case 2097152:return e&4194240;case 4194304:case 8388608:case 16777216:case 33554432:case 67108864:return e&130023424;case 134217728:return 134217728;case 268435456:return 268435456;case 536870912:return 536870912;case 1073741824:return 1073741824;default:return e}}function $i(e,t){var n=e.pendingLanes;if(n===0)return 0;var r=0,o=e.suspendedLanes,i=e.pingedLanes,l=n&268435455;if(l!==0){var a=l&~o;a!==0?r=lo(a):(i&=l,i!==0&&(r=lo(i)))}else l=n&~o,l!==0?r=lo(l):i!==0&&(r=lo(i));if(r===0)return 0;if(t!==0&&t!==r&&!(t&o)&&(o=r&-r,i=t&-t,o>=i||o===16&&(i&4194240)!==0))return t;if(r&4&&(r|=n&16),t=e.entangledLanes,t!==0)for(e=e.entanglements,t&=r;0<t;)n=31-zt(t),o=1<<n,r|=e[n],t&=~o;return r}function bh(e,t){switch(e){case 1:case 2:case 4:return t+250;case 8:case 16:case 32:case 64:case 128:case 256:case 512:case 1024:case 2048:case 4096:case 8192:case 16384:case 32768:case 65536:case 131072:case 262144:case 524288:case 1048576:case 2097152:return t+5e3;case 4194304:case 8388608:case 16777216:case 33554432:case 67108864:return-1;case 134217728:case 268435456:case 536870912:case 1073741824:return-1;default:return-1}}function Rh(e,t){for(var n=e.suspendedLanes,r=e.pingedLanes,o=e.expirationTimes,i=e.pendingLanes;0<i;){var l=31-zt(i),a=1<<l,s=o[l];s===-1?(!(a&n)||a&r)&&(o[l]=bh(a,t)):s<=t&&(e.expiredLanes|=a),i&=~a}}function Da(e){return e=e.pendingLanes&-1073741825,e!==0?e:e&1073741824?1073741824:0}function yd(){var e=ni;return ni<<=1,!(ni&4194240)&&(ni=64),e}function Zl(e){for(var t=[],n=0;31>n;n++)t.push(e);return t}function Fo(e,t,n){e.pendingLanes|=t,t!==536870912&&(e.suspendedLanes=0,e.pingedLanes=0),e=e.eventTimes,t=31-zt(t),e[t]=n}function Ph(e,t){var n=e.pendingLanes&~t;e.pendingLanes=t,e.suspendedLanes=0,e.pingedLanes=0,e.expiredLanes&=t,e.mutableReadLanes&=t,e.entangledLanes&=t,t=e.entanglements;var r=e.eventTimes;for(e=e.expirationTimes;0<n;){var o=31-zt(n),i=1<<o;t[o]=0,r[o]=-1,e[o]=-1,n&=~i}}function Bs(e,t){var n=e.entangledLanes|=t;for(e=e.entanglements;n;){var r=31-zt(n),o=1<<r;o&t|e[r]&t&&(e[r]|=t),n&=~o}}var pe=0;function wd(e){return e&=-e,1<e?4<e?e&268435455?16:536870912:4:1}var xd,Vs,Sd,kd,Cd,Ua=!1,oi=[],wn=null,xn=null,Sn=null,Co=new Map,Eo=new Map,mn=[],Lh="mousedown mouseup touchcancel touchend touchstart auxclick dblclick pointercancel pointerdown pointerup dragend dragstart drop compositionend compositionstart keydown keypress keyup input textInput copy cut paste click change contextmenu reset submit".split(" ");function lc(e,t){switch(e){case"focusin":case"focusout":wn=null;break;case"dragenter":case"dragleave":xn=null;break;case"mouseover":case"mouseout":Sn=null;break;case"pointerover":case"pointerout":Co.delete(t.pointerId);break;case"gotpointercapture":case"lostpointercapture":Eo.delete(t.pointerId)}}function Jr(e,t,n,r,o,i){return e===null||e.nativeEvent!==i?(e={blockedOn:t,domEventName:n,eventSystemFlags:r,nativeEvent:i,targetContainers:[o]},t!==null&&(t=Vo(t),t!==null&&Vs(t)),e):(e.eventSystemFlags|=r,t=e.targetContainers,o!==null&&t.indexOf(o)===-1&&t.push(o),e)}function _h(e,t,n,r,o){switch(t){case"focusin":return wn=Jr(wn,e,t,n,r,o),!0;case"dragenter":return xn=Jr(xn,e,t,n,r,o),!0;case"mouseover":return Sn=Jr(Sn,e,t,n,r,o),!0;case"pointerover":var i=o.pointerId;return Co.set(i,Jr(Co.get(i)||null,e,t,n,r,o)),!0;case"gotpointercapture":return i=o.pointerId,Eo.set(i,Jr(Eo.get(i)||null,e,t,n,r,o)),!0}return!1}function Ed(e){var t=Dn(e.target);if(t!==null){var n=qn(t);if(n!==null){if(t=n.tag,t===13){if(t=dd(n),t!==null){e.blockedOn=t,Cd(e.priority,function(){Sd(n)});return}}else if(t===3&&n.stateNode.current.memoizedState.isDehydrated){e.blockedOn=n.tag===3?n.stateNode.containerInfo:null;return}}}e.blockedOn=null}function ki(e){if(e.blockedOn!==null)return!1;for(var t=e.targetContainers;0<t.length;){var n=Fa(e.domEventName,e.eventSystemFlags,t[0],e.nativeEvent);if(n===null){n=e.nativeEvent;var r=new n.constructor(n.type,n);za=r,n.target.dispatchEvent(r),za=null}else return t=Vo(n),t!==null&&Vs(t),e.blockedOn=n,!1;t.shift()}return!0}function ac(e,t,n){ki(e)&&n.delete(t)}function Oh(){Ua=!1,wn!==null&&ki(wn)&&(wn=null),xn!==null&&ki(xn)&&(xn=null),Sn!==null&&ki(Sn)&&(Sn=null),Co.forEach(ac),Eo.forEach(ac)}function qr(e,t){e.blockedOn===t&&(e.blockedOn=null,Ua||(Ua=!0,pt.unstable_scheduleCallback(pt.unstable_NormalPriority,Oh)))}function Ao(e){function t(o){return qr(o,e)}if(0<oi.length){qr(oi[0],e);for(var n=1;n<oi.length;n++){var r=oi[n];r.blockedOn===e&&(r.blockedOn=null)}}for(wn!==null&&qr(wn,e),xn!==null&&qr(xn,e),Sn!==null&&qr(Sn,e),Co.forEach(t),Eo.forEach(t),n=0;n<mn.length;n++)r=mn[n],r.blockedOn===e&&(r.blockedOn=null);for(;0<mn.length&&(n=mn[0],n.blockedOn===null);)Ed(n),n.blockedOn===null&&mn.shift()}var Ar=un.ReactCurrentBatchConfig,ji=!0;function Ih(e,t,n,r){var o=pe,i=Ar.transition;Ar.transition=null;try{pe=1,Hs(e,t,n,r)}finally{pe=o,Ar.transition=i}}function Th(e,t,n,r){var o=pe,i=Ar.transition;Ar.transition=null;try{pe=4,Hs(e,t,n,r)}finally{pe=o,Ar.transition=i}}function Hs(e,t,n,r){if(ji){var o=Fa(e,t,n,r);if(o===null)aa(e,t,r,Di,n),lc(e,r);else if(_h(o,e,t,n,r))r.stopPropagation();else if(lc(e,r),t&4&&-1<Lh.indexOf(e)){for(;o!==null;){var i=Vo(o);if(i!==null&&xd(i),i=Fa(e,t,n,r),i===null&&aa(e,t,r,Di,n),i===o)break;o=i}o!==null&&r.stopPropagation()}else aa(e,t,r,null,n)}}var Di=null;function Fa(e,t,n,r){if(Di=null,e=Us(r),e=Dn(e),e!==null)if(t=qn(e),t===null)e=null;else if(n=t.tag,n===13){if(e=dd(t),e!==null)return e;e=null}else if(n===3){if(t.stateNode.current.memoizedState.isDehydrated)return t.tag===3?t.stateNode.containerInfo:null;e=null}else t!==e&&(e=null);return Di=e,null}function Ad(e){switch(e){case"cancel":case"click":case"close":case"contextmenu":case"copy":case"cut":case"auxclick":case"dblclick":case"dragend":case"dragstart":case"drop":case"focusin":case"focusout":case"input":case"invalid":case"keydown":case"keypress":case"keyup":case"mousedown":case"mouseup":case"paste":case"pause":case"play":case"pointercancel":case"pointerdown":case"pointerup":case"ratechange":case"reset":case"resize":case"seeked":case"submit":case"touchcancel":case"touchend":case"touchstart":case"volumechange":case"change":case"selectionchange":case"textInput":case"compositionstart":case"compositionend":case"compositionupdate":case"beforeblur":case"afterblur":case"beforeinput":case"blur":case"fullscreenchange":case"focus":case"hashchange":case"popstate":case"select":case"selectstart":return 1;case"drag":case"dragenter":case"dragexit":case"dragleave":case"dragover":case"mousemove":case"mouseout":case"mouseover":case"pointermove":case"pointerout":case"pointerover":case"scroll":case"toggle":case"touchmove":case"wheel":case"mouseenter":case"mouseleave":case"pointerenter":case"pointerleave":return 4;case"message":switch(Sh()){case Fs:return 1;case gd:return 4;case Mi:case kh:return 16;case vd:return 536870912;default:return 16}default:return 16}}var gn=null,Ws=null,Ci=null;function Nd(){if(Ci)return Ci;var e,t=Ws,n=t.length,r,o="value"in gn?gn.value:gn.textContent,i=o.length;for(e=0;e<n&&t[e]===o[e];e++);var l=n-e;for(r=1;r<=l&&t[n-r]===o[i-r];r++);return Ci=o.slice(e,1<r?1-r:void 0)}function Ei(e){var t=e.keyCode;return"charCode"in e?(e=e.charCode,e===0&&t===13&&(e=13)):e=t,e===10&&(e=13),32<=e||e===13?e:0}function ii(){return!0}function sc(){return!1}function ht(e){function t(n,r,o,i,l){this._reactName=n,this._targetInst=o,this.type=r,this.nativeEvent=i,this.target=l,this.currentTarget=null;for(var a in e)e.hasOwnProperty(a)&&(n=e[a],this[a]=n?n(i):i[a]);return this.isDefaultPrevented=(i.defaultPrevented!=null?i.defaultPrevented:i.returnValue===!1)?ii:sc,this.isPropagationStopped=sc,this}return Ne(t.prototype,{preventDefault:function(){this.defaultPrevented=!0;var n=this.nativeEvent;n&&(n.preventDefault?n.preventDefault():typeof n.returnValue!="unknown"&&(n.returnValue=!1),this.isDefaultPrevented=ii)},stopPropagation:function(){var n=this.nativeEvent;n&&(n.stopPropagation?n.stopPropagation():typeof n.cancelBubble!="unknown"&&(n.cancelBubble=!0),this.isPropagationStopped=ii)},persist:function(){},isPersistent:ii}),t}var Ur={eventPhase:0,bubbles:0,cancelable:0,timeStamp:function(e){return e.timeStamp||Date.now()},defaultPrevented:0,isTrusted:0},Qs=ht(Ur),Bo=Ne({},Ur,{view:0,detail:0}),zh=ht(Bo),Jl,ql,eo,pl=Ne({},Bo,{screenX:0,screenY:0,clientX:0,clientY:0,pageX:0,pageY:0,ctrlKey:0,shiftKey:0,altKey:0,metaKey:0,getModifierState:Gs,button:0,buttons:0,relatedTarget:function(e){return e.relatedTarget===void 0?e.fromElement===e.srcElement?e.toElement:e.fromElement:e.relatedTarget},movementX:function(e){return"movementX"in e?e.movementX:(e!==eo&&(eo&&e.type==="mousemove"?(Jl=e.screenX-eo.screenX,ql=e.screenY-eo.screenY):ql=Jl=0,eo=e),Jl)},movementY:function(e){return"movementY"in e?e.movementY:ql}}),uc=ht(pl),Mh=Ne({},pl,{dataTransfer:0}),$h=ht(Mh),jh=Ne({},Bo,{relatedTarget:0}),ea=ht(jh),Dh=Ne({},Ur,{animationName:0,elapsedTime:0,pseudoElement:0}),Uh=ht(Dh),Fh=Ne({},Ur,{clipboardData:function(e){return"clipboardData"in e?e.clipboardData:window.clipboardData}}),Bh=ht(Fh),Vh=Ne({},Ur,{data:0}),cc=ht(Vh),Hh={Esc:"Escape",Spacebar:" ",Left:"ArrowLeft",Up:"ArrowUp",Right:"ArrowRight",Down:"ArrowDown",Del:"Delete",Win:"OS",Menu:"ContextMenu",Apps:"ContextMenu",Scroll:"ScrollLock",MozPrintableKey:"Unidentified"},Wh={8:"Backspace",9:"Tab",12:"Clear",13:"Enter",16:"Shift",17:"Control",18:"Alt",19:"Pause",20:"CapsLock",27:"Escape",32:" ",33:"PageUp",34:"PageDown",35:"End",36:"Home",37:"ArrowLeft",38:"ArrowUp",39:"ArrowRight",40:"ArrowDown",45:"Insert",46:"Delete",112:"F1",113:"F2",114:"F3",115:"F4",116:"F5",117:"F6",118:"F7",119:"F8",120:"F9",121:"F10",122:"F11",123:"F12",144:"NumLock",145:"ScrollLock",224:"Meta"},Qh={Alt:"altKey",Control:"ctrlKey",Meta:"metaKey",Shift:"shiftKey"};function Gh(e){var t=this.nativeEvent;return t.getModifierState?t.getModifierState(e):(e=Qh[e])?!!t[e]:!1}function Gs(){return Gh}var Yh=Ne({},Bo,{key:function(e){if(e.key){var t=Hh[e.key]||e.key;if(t!=="Unidentified")return t}return e.type==="keypress"?(e=Ei(e),e===13?"Enter":String.fromCharCode(e)):e.type==="keydown"||e.type==="keyup"?Wh[e.keyCode]||"Unidentified":""},code:0,location:0,ctrlKey:0,shiftKey:0,altKey:0,metaKey:0,repeat:0,locale:0,getModifierState:Gs,charCode:function(e){return e.type==="keypress"?Ei(e):0},keyCode:function(e){return e.type==="keydown"||e.type==="keyup"?e.keyCode:0},which:function(e){return e.type==="keypress"?Ei(e):e.type==="keydown"||e.type==="keyup"?e.keyCode:0}}),Xh=ht(Yh),Kh=Ne({},pl,{pointerId:0,width:0,height:0,pressure:0,tangentialPressure:0,tiltX:0,tiltY:0,twist:0,pointerType:0,isPrimary:0}),fc=ht(Kh),Zh=Ne({},Bo,{touches:0,targetTouches:0,changedTouches:0,altKey:0,metaKey:0,ctrlKey:0,shiftKey:0,getModifierState:Gs}),Jh=ht(Zh),qh=Ne({},Ur,{propertyName:0,elapsedTime:0,pseudoElement:0}),e1=ht(qh),t1=Ne({},pl,{deltaX:function(e){return"deltaX"in e?e.deltaX:"wheelDeltaX"in e?-e.wheelDeltaX:0},deltaY:function(e){return"deltaY"in e?e.deltaY:"wheelDeltaY"in e?-e.wheelDeltaY:"wheelDelta"in e?-e.wheelDelta:0},deltaZ:0,deltaMode:0}),n1=ht(t1),r1=[9,13,27,32],Ys=nn&&"CompositionEvent"in window,fo=null;nn&&"documentMode"in document&&(fo=document.documentMode);var o1=nn&&"TextEvent"in window&&!fo,bd=nn&&(!Ys||fo&&8<fo&&11>=fo),dc=String.fromCharCode(32),pc=!1;function Rd(e,t){switch(e){case"keyup":return r1.indexOf(t.keyCode)!==-1;case"keydown":return t.keyCode!==229;case"keypress":case"mousedown":case"focusout":return!0;default:return!1}}function Pd(e){return e=e.detail,typeof e=="object"&&"data"in e?e.data:null}var fr=!1;function i1(e,t){switch(e){case"compositionend":return Pd(t);case"keypress":return t.which!==32?null:(pc=!0,dc);case"textInput":return e=t.data,e===dc&&pc?null:e;default:return null}}function l1(e,t){if(fr)return e==="compositionend"||!Ys&&Rd(e,t)?(e=Nd(),Ci=Ws=gn=null,fr=!1,e):null;switch(e){case"paste":return null;case"keypress":if(!(t.ctrlKey||t.altKey||t.metaKey)||t.ctrlKey&&t.altKey){if(t.char&&1<t.char.length)return t.char;if(t.which)return String.fromCharCode(t.which)}return null;case"compositionend":return bd&&t.locale!=="ko"?null:t.data;default:return null}}var a1={color:!0,date:!0,datetime:!0,"datetime-local":!0,email:!0,month:!0,number:!0,password:!0,range:!0,search:!0,tel:!0,text:!0,time:!0,url:!0,week:!0};function mc(e){var t=e&&e.nodeName&&e.nodeName.toLowerCase();return t==="input"?!!a1[e.type]:t==="textarea"}function Ld(e,t,n,r){ad(r),t=Ui(t,"onChange"),0<t.length&&(n=new Qs("onChange","change",null,n,r),e.push({event:n,listeners:t}))}var po=null,No=null;function s1(e){Fd(e,0)}function ml(e){var t=mr(e);if(ed(t))return e}function u1(e,t){if(e==="change")return t}var _d=!1;if(nn){var ta;if(nn){var na="oninput"in document;if(!na){var hc=document.createElement("div");hc.setAttribute("oninput","return;"),na=typeof hc.oninput=="function"}ta=na}else ta=!1;_d=ta&&(!document.documentMode||9<document.documentMode)}function gc(){po&&(po.detachEvent("onpropertychange",Od),No=po=null)}function Od(e){if(e.propertyName==="value"&&ml(No)){var t=[];Ld(t,No,e,Us(e)),fd(s1,t)}}function c1(e,t,n){e==="focusin"?(gc(),po=t,No=n,po.attachEvent("onpropertychange",Od)):e==="focusout"&&gc()}function f1(e){if(e==="selectionchange"||e==="keyup"||e==="keydown")return ml(No)}function d1(e,t){if(e==="click")return ml(t)}function p1(e,t){if(e==="input"||e==="change")return ml(t)}function m1(e,t){return e===t&&(e!==0||1/e===1/t)||e!==e&&t!==t}var $t=typeof Object.is=="function"?Object.is:m1;function bo(e,t){if($t(e,t))return!0;if(typeof e!="object"||e===null||typeof t!="object"||t===null)return!1;var n=Object.keys(e),r=Object.keys(t);if(n.length!==r.length)return!1;for(r=0;r<n.length;r++){var o=n[r];if(!Ca.call(t,o)||!$t(e[o],t[o]))return!1}return!0}function vc(e){for(;e&&e.firstChild;)e=e.firstChild;return e}function yc(e,t){var n=vc(e);e=0;for(var r;n;){if(n.nodeType===3){if(r=e+n.textContent.length,e<=t&&r>=t)return{node:n,offset:t-e};e=r}e:{for(;n;){if(n.nextSibling){n=n.nextSibling;break e}n=n.parentNode}n=void 0}n=vc(n)}}function Id(e,t){return e&&t?e===t?!0:e&&e.nodeType===3?!1:t&&t.nodeType===3?Id(e,t.parentNode):"contains"in e?e.contains(t):e.compareDocumentPosition?!!(e.compareDocumentPosition(t)&16):!1:!1}function Td(){for(var e=window,t=Ii();t instanceof e.HTMLIFrameElement;){try{var n=typeof t.contentWindow.location.href=="string"}catch{n=!1}if(n)e=t.contentWindow;else break;t=Ii(e.document)}return t}function Xs(e){var t=e&&e.nodeName&&e.nodeName.toLowerCase();return t&&(t==="input"&&(e.type==="text"||e.type==="search"||e.type==="tel"||e.type==="url"||e.type==="password")||t==="textarea"||e.contentEditable==="true")}function h1(e){var t=Td(),n=e.focusedElem,r=e.selectionRange;if(t!==n&&n&&n.ownerDocument&&Id(n.ownerDocument.documentElement,n)){if(r!==null&&Xs(n)){if(t=r.start,e=r.end,e===void 0&&(e=t),"selectionStart"in n)n.selectionStart=t,n.selectionEnd=Math.min(e,n.value.length);else if(e=(t=n.ownerDocument||document)&&t.defaultView||window,e.getSelection){e=e.getSelection();var o=n.textContent.length,i=Math.min(r.start,o);r=r.end===void 0?i:Math.min(r.end,o),!e.extend&&i>r&&(o=r,r=i,i=o),o=yc(n,i);var l=yc(n,r);o&&l&&(e.rangeCount!==1||e.anchorNode!==o.node||e.anchorOffset!==o.offset||e.focusNode!==l.node||e.focusOffset!==l.offset)&&(t=t.createRange(),t.setStart(o.node,o.offset),e.removeAllRanges(),i>r?(e.addRange(t),e.extend(l.node,l.offset)):(t.setEnd(l.node,l.offset),e.addRange(t)))}}for(t=[],e=n;e=e.parentNode;)e.nodeType===1&&t.push({element:e,left:e.scrollLeft,top:e.scrollTop});for(typeof n.focus=="function"&&n.focus(),n=0;n<t.length;n++)e=t[n],e.element.scrollLeft=e.left,e.element.scrollTop=e.top}}var g1=nn&&"documentMode"in document&&11>=document.documentMode,dr=null,Ba=null,mo=null,Va=!1;function wc(e,t,n){var r=n.window===n?n.document:n.nodeType===9?n:n.ownerDocument;Va||dr==null||dr!==Ii(r)||(r=dr,"selectionStart"in r&&Xs(r)?r={start:r.selectionStart,end:r.selectionEnd}:(r=(r.ownerDocument&&r.ownerDocument.defaultView||window).getSelection(),r={anchorNode:r.anchorNode,anchorOffset:r.anchorOffset,focusNode:r.focusNode,focusOffset:r.focusOffset}),mo&&bo(mo,r)||(mo=r,r=Ui(Ba,"onSelect"),0<r.length&&(t=new Qs("onSelect","select",null,t,n),e.push({event:t,listeners:r}),t.target=dr)))}function li(e,t){var n={};return n[e.toLowerCase()]=t.toLowerCase(),n["Webkit"+e]="webkit"+t,n["Moz"+e]="moz"+t,n}var pr={animationend:li("Animation","AnimationEnd"),animationiteration:li("Animation","AnimationIteration"),animationstart:li("Animation","AnimationStart"),transitionend:li("Transition","TransitionEnd")},ra={},zd={};nn&&(zd=document.createElement("div").style,"AnimationEvent"in window||(delete pr.animationend.animation,delete pr.animationiteration.animation,delete pr.animationstart.animation),"TransitionEvent"in window||delete pr.transitionend.transition);function hl(e){if(ra[e])return ra[e];if(!pr[e])return e;var t=pr[e],n;for(n in t)if(t.hasOwnProperty(n)&&n in zd)return ra[e]=t[n];return e}var Md=hl("animationend"),$d=hl("animationiteration"),jd=hl("animationstart"),Dd=hl("transitionend"),Ud=new Map,xc="abort auxClick cancel canPlay canPlayThrough click close contextMenu copy cut drag dragEnd dragEnter dragExit dragLeave dragOver dragStart drop durationChange emptied encrypted ended error gotPointerCapture input invalid keyDown keyPress keyUp load loadedData loadedMetadata loadStart lostPointerCapture mouseDown mouseMove mouseOut mouseOver mouseUp paste pause play playing pointerCancel pointerDown pointerMove pointerOut pointerOver pointerUp progress rateChange reset resize seeked seeking stalled submit suspend timeUpdate touchCancel touchEnd touchStart volumeChange scroll toggle touchMove waiting wheel".split(" ");function In(e,t){Ud.set(e,t),Jn(t,[e])}for(var oa=0;oa<xc.length;oa++){var ia=xc[oa],v1=ia.toLowerCase(),y1=ia[0].toUpperCase()+ia.slice(1);In(v1,"on"+y1)}In(Md,"onAnimationEnd");In($d,"onAnimationIteration");In(jd,"onAnimationStart");In("dblclick","onDoubleClick");In("focusin","onFocus");In("focusout","onBlur");In(Dd,"onTransitionEnd");Lr("onMouseEnter",["mouseout","mouseover"]);Lr("onMouseLeave",["mouseout","mouseover"]);Lr("onPointerEnter",["pointerout","pointerover"]);Lr("onPointerLeave",["pointerout","pointerover"]);Jn("onChange","change click focusin focusout input keydown keyup selectionchange".split(" "));Jn("onSelect","focusout contextmenu dragend focusin keydown keyup mousedown mouseup selectionchange".split(" "));Jn("onBeforeInput",["compositionend","keypress","textInput","paste"]);Jn("onCompositionEnd","compositionend focusout keydown keypress keyup mousedown".split(" "));Jn("onCompositionStart","compositionstart focusout keydown keypress keyup mousedown".split(" "));Jn("onCompositionUpdate","compositionupdate focusout keydown keypress keyup mousedown".split(" "));var ao="abort canplay canplaythrough durationchange emptied encrypted ended error loadeddata loadedmetadata loadstart pause play playing progress ratechange resize seeked seeking stalled suspend timeupdate volumechange waiting".split(" "),w1=new Set("cancel close invalid load scroll toggle".split(" ").concat(ao));function Sc(e,t,n){var r=e.type||"unknown-event";e.currentTarget=n,vh(r,t,void 0,e),e.currentTarget=null}function Fd(e,t){t=(t&4)!==0;for(var n=0;n<e.length;n++){var r=e[n],o=r.event;r=r.listeners;e:{var i=void 0;if(t)for(var l=r.length-1;0<=l;l--){var a=r[l],s=a.instance,u=a.currentTarget;if(a=a.listener,s!==i&&o.isPropagationStopped())break e;Sc(o,a,u),i=s}else for(l=0;l<r.length;l++){if(a=r[l],s=a.instance,u=a.currentTarget,a=a.listener,s!==i&&o.isPropagationStopped())break e;Sc(o,a,u),i=s}}}if(zi)throw e=ja,zi=!1,ja=null,e}function ye(e,t){var n=t[Ya];n===void 0&&(n=t[Ya]=new Set);var r=e+"__bubble";n.has(r)||(Bd(t,e,2,!1),n.add(r))}function la(e,t,n){var r=0;t&&(r|=4),Bd(n,e,r,t)}var ai="_reactListening"+Math.random().toString(36).slice(2);function Ro(e){if(!e[ai]){e[ai]=!0,Xf.forEach(function(n){n!=="selectionchange"&&(w1.has(n)||la(n,!1,e),la(n,!0,e))});var t=e.nodeType===9?e:e.ownerDocument;t===null||t[ai]||(t[ai]=!0,la("selectionchange",!1,t))}}function Bd(e,t,n,r){switch(Ad(t)){case 1:var o=Ih;break;case 4:o=Th;break;default:o=Hs}n=o.bind(null,t,n,e),o=void 0,!$a||t!=="touchstart"&&t!=="touchmove"&&t!=="wheel"||(o=!0),r?o!==void 0?e.addEventListener(t,n,{capture:!0,passive:o}):e.addEventListener(t,n,!0):o!==void 0?e.addEventListener(t,n,{passive:o}):e.addEventListener(t,n,!1)}function aa(e,t,n,r,o){var i=r;if(!(t&1)&&!(t&2)&&r!==null)e:for(;;){if(r===null)return;var l=r.tag;if(l===3||l===4){var a=r.stateNode.containerInfo;if(a===o||a.nodeType===8&&a.parentNode===o)break;if(l===4)for(l=r.return;l!==null;){var s=l.tag;if((s===3||s===4)&&(s=l.stateNode.containerInfo,s===o||s.nodeType===8&&s.parentNode===o))return;l=l.return}for(;a!==null;){if(l=Dn(a),l===null)return;if(s=l.tag,s===5||s===6){r=i=l;continue e}a=a.parentNode}}r=r.return}fd(function(){var u=i,d=Us(n),p=[];e:{var h=Ud.get(e);if(h!==void 0){var v=Qs,g=e;switch(e){case"keypress":if(Ei(n)===0)break e;case"keydown":case"keyup":v=Xh;break;case"focusin":g="focus",v=ea;break;case"focusout":g="blur",v=ea;break;case"beforeblur":case"afterblur":v=ea;break;case"click":if(n.button===2)break e;case"auxclick":case"dblclick":case"mousedown":case"mousemove":case"mouseup":case"mouseout":case"mouseover":case"contextmenu":v=uc;break;case"drag":case"dragend":case"dragenter":case"dragexit":case"dragleave":case"dragover":case"dragstart":case"drop":v=$h;break;case"touchcancel":case"touchend":case"touchmove":case"touchstart":v=Jh;break;case Md:case $d:case jd:v=Uh;break;case Dd:v=e1;break;case"scroll":v=zh;break;case"wheel":v=n1;break;case"copy":case"cut":case"paste":v=Bh;break;case"gotpointercapture":case"lostpointercapture":case"pointercancel":case"pointerdown":case"pointermove":case"pointerout":case"pointerover":case"pointerup":v=fc}var w=(t&4)!==0,C=!w&&e==="scroll",f=w?h!==null?h+"Capture":null:h;w=[];for(var c=u,m;c!==null;){m=c;var S=m.stateNode;if(m.tag===5&&S!==null&&(m=S,f!==null&&(S=ko(c,f),S!=null&&w.push(Po(c,S,m)))),C)break;c=c.return}0<w.length&&(h=new v(h,g,null,n,d),p.push({event:h,listeners:w}))}}if(!(t&7)){e:{if(h=e==="mouseover"||e==="pointerover",v=e==="mouseout"||e==="pointerout",h&&n!==za&&(g=n.relatedTarget||n.fromElement)&&(Dn(g)||g[rn]))break e;if((v||h)&&(h=d.window===d?d:(h=d.ownerDocument)?h.defaultView||h.parentWindow:window,v?(g=n.relatedTarget||n.toElement,v=u,g=g?Dn(g):null,g!==null&&(C=qn(g),g!==C||g.tag!==5&&g.tag!==6)&&(g=null)):(v=null,g=u),v!==g)){if(w=uc,S="onMouseLeave",f="onMouseEnter",c="mouse",(e==="pointerout"||e==="pointerover")&&(w=fc,S="onPointerLeave",f="onPointerEnter",c="pointer"),C=v==null?h:mr(v),m=g==null?h:mr(g),h=new w(S,c+"leave",v,n,d),h.target=C,h.relatedTarget=m,S=null,Dn(d)===u&&(w=new w(f,c+"enter",g,n,d),w.target=m,w.relatedTarget=C,S=w),C=S,v&&g)t:{for(w=v,f=g,c=0,m=w;m;m=ar(m))c++;for(m=0,S=f;S;S=ar(S))m++;for(;0<c-m;)w=ar(w),c--;for(;0<m-c;)f=ar(f),m--;for(;c--;){if(w===f||f!==null&&w===f.alternate)break t;w=ar(w),f=ar(f)}w=null}else w=null;v!==null&&kc(p,h,v,w,!1),g!==null&&C!==null&&kc(p,C,g,w,!0)}}e:{if(h=u?mr(u):window,v=h.nodeName&&h.nodeName.toLowerCase(),v==="select"||v==="input"&&h.type==="file")var A=u1;else if(mc(h))if(_d)A=p1;else{A=f1;var E=c1}else(v=h.nodeName)&&v.toLowerCase()==="input"&&(h.type==="checkbox"||h.type==="radio")&&(A=d1);if(A&&(A=A(e,u))){Ld(p,A,n,d);break e}E&&E(e,h,u),e==="focusout"&&(E=h._wrapperState)&&E.controlled&&h.type==="number"&&La(h,"number",h.value)}switch(E=u?mr(u):window,e){case"focusin":(mc(E)||E.contentEditable==="true")&&(dr=E,Ba=u,mo=null);break;case"focusout":mo=Ba=dr=null;break;case"mousedown":Va=!0;break;case"contextmenu":case"mouseup":case"dragend":Va=!1,wc(p,n,d);break;case"selectionchange":if(g1)break;case"keydown":case"keyup":wc(p,n,d)}var N;if(Ys)e:{switch(e){case"compositionstart":var b="onCompositionStart";break e;case"compositionend":b="onCompositionEnd";break e;case"compositionupdate":b="onCompositionUpdate";break e}b=void 0}else fr?Rd(e,n)&&(b="onCompositionEnd"):e==="keydown"&&n.keyCode===229&&(b="onCompositionStart");b&&(bd&&n.locale!=="ko"&&(fr||b!=="onCompositionStart"?b==="onCompositionEnd"&&fr&&(N=Nd()):(gn=d,Ws="value"in gn?gn.value:gn.textContent,fr=!0)),E=Ui(u,b),0<E.length&&(b=new cc(b,e,null,n,d),p.push({event:b,listeners:E}),N?b.data=N:(N=Pd(n),N!==null&&(b.data=N)))),(N=o1?i1(e,n):l1(e,n))&&(u=Ui(u,"onBeforeInput"),0<u.length&&(d=new cc("onBeforeInput","beforeinput",null,n,d),p.push({event:d,listeners:u}),d.data=N))}Fd(p,t)})}function Po(e,t,n){return{instance:e,listener:t,currentTarget:n}}function Ui(e,t){for(var n=t+"Capture",r=[];e!==null;){var o=e,i=o.stateNode;o.tag===5&&i!==null&&(o=i,i=ko(e,n),i!=null&&r.unshift(Po(e,i,o)),i=ko(e,t),i!=null&&r.push(Po(e,i,o))),e=e.return}return r}function ar(e){if(e===null)return null;do e=e.return;while(e&&e.tag!==5);return e||null}function kc(e,t,n,r,o){for(var i=t._reactName,l=[];n!==null&&n!==r;){var a=n,s=a.alternate,u=a.stateNode;if(s!==null&&s===r)break;a.tag===5&&u!==null&&(a=u,o?(s=ko(n,i),s!=null&&l.unshift(Po(n,s,a))):o||(s=ko(n,i),s!=null&&l.push(Po(n,s,a)))),n=n.return}l.length!==0&&e.push({event:t,listeners:l})}var x1=/\r\n?/g,S1=/\u0000|\uFFFD/g;function Cc(e){return(typeof e=="string"?e:""+e).replace(x1,`
`).replace(S1,"")}function si(e,t,n){if(t=Cc(t),Cc(e)!==t&&n)throw Error(L(425))}function Fi(){}var Ha=null,Wa=null;function Qa(e,t){return e==="textarea"||e==="noscript"||typeof t.children=="string"||typeof t.children=="number"||typeof t.dangerouslySetInnerHTML=="object"&&t.dangerouslySetInnerHTML!==null&&t.dangerouslySetInnerHTML.__html!=null}var Ga=typeof setTimeout=="function"?setTimeout:void 0,k1=typeof clearTimeout=="function"?clearTimeout:void 0,Ec=typeof Promise=="function"?Promise:void 0,C1=typeof queueMicrotask=="function"?queueMicrotask:typeof Ec<"u"?function(e){return Ec.resolve(null).then(e).catch(E1)}:Ga;function E1(e){setTimeout(function(){throw e})}function sa(e,t){var n=t,r=0;do{var o=n.nextSibling;if(e.removeChild(n),o&&o.nodeType===8)if(n=o.data,n==="/$"){if(r===0){e.removeChild(o),Ao(t);return}r--}else n!=="$"&&n!=="$?"&&n!=="$!"||r++;n=o}while(n);Ao(t)}function kn(e){for(;e!=null;e=e.nextSibling){var t=e.nodeType;if(t===1||t===3)break;if(t===8){if(t=e.data,t==="$"||t==="$!"||t==="$?")break;if(t==="/$")return null}}return e}function Ac(e){e=e.previousSibling;for(var t=0;e;){if(e.nodeType===8){var n=e.data;if(n==="$"||n==="$!"||n==="$?"){if(t===0)return e;t--}else n==="/$"&&t++}e=e.previousSibling}return null}var Fr=Math.random().toString(36).slice(2),Vt="__reactFiber$"+Fr,Lo="__reactProps$"+Fr,rn="__reactContainer$"+Fr,Ya="__reactEvents$"+Fr,A1="__reactListeners$"+Fr,N1="__reactHandles$"+Fr;function Dn(e){var t=e[Vt];if(t)return t;for(var n=e.parentNode;n;){if(t=n[rn]||n[Vt]){if(n=t.alternate,t.child!==null||n!==null&&n.child!==null)for(e=Ac(e);e!==null;){if(n=e[Vt])return n;e=Ac(e)}return t}e=n,n=e.parentNode}return null}function Vo(e){return e=e[Vt]||e[rn],!e||e.tag!==5&&e.tag!==6&&e.tag!==13&&e.tag!==3?null:e}function mr(e){if(e.tag===5||e.tag===6)return e.stateNode;throw Error(L(33))}function gl(e){return e[Lo]||null}var Xa=[],hr=-1;function Tn(e){return{current:e}}function we(e){0>hr||(e.current=Xa[hr],Xa[hr]=null,hr--)}function ve(e,t){hr++,Xa[hr]=e.current,e.current=t}var Ln={},Ye=Tn(Ln),rt=Tn(!1),Hn=Ln;function _r(e,t){var n=e.type.contextTypes;if(!n)return Ln;var r=e.stateNode;if(r&&r.__reactInternalMemoizedUnmaskedChildContext===t)return r.__reactInternalMemoizedMaskedChildContext;var o={},i;for(i in n)o[i]=t[i];return r&&(e=e.stateNode,e.__reactInternalMemoizedUnmaskedChildContext=t,e.__reactInternalMemoizedMaskedChildContext=o),o}function ot(e){return e=e.childContextTypes,e!=null}function Bi(){we(rt),we(Ye)}function Nc(e,t,n){if(Ye.current!==Ln)throw Error(L(168));ve(Ye,t),ve(rt,n)}function Vd(e,t,n){var r=e.stateNode;if(t=t.childContextTypes,typeof r.getChildContext!="function")return n;r=r.getChildContext();for(var o in r)if(!(o in t))throw Error(L(108,ch(e)||"Unknown",o));return Ne({},n,r)}function Vi(e){return e=(e=e.stateNode)&&e.__reactInternalMemoizedMergedChildContext||Ln,Hn=Ye.current,ve(Ye,e),ve(rt,rt.current),!0}function bc(e,t,n){var r=e.stateNode;if(!r)throw Error(L(169));n?(e=Vd(e,t,Hn),r.__reactInternalMemoizedMergedChildContext=e,we(rt),we(Ye),ve(Ye,e)):we(rt),ve(rt,n)}var Jt=null,vl=!1,ua=!1;function Hd(e){Jt===null?Jt=[e]:Jt.push(e)}function b1(e){vl=!0,Hd(e)}function zn(){if(!ua&&Jt!==null){ua=!0;var e=0,t=pe;try{var n=Jt;for(pe=1;e<n.length;e++){var r=n[e];do r=r(!0);while(r!==null)}Jt=null,vl=!1}catch(o){throw Jt!==null&&(Jt=Jt.slice(e+1)),hd(Fs,zn),o}finally{pe=t,ua=!1}}return null}var gr=[],vr=0,Hi=null,Wi=0,wt=[],xt=0,Wn=null,qt=1,en="";function $n(e,t){gr[vr++]=Wi,gr[vr++]=Hi,Hi=e,Wi=t}function Wd(e,t,n){wt[xt++]=qt,wt[xt++]=en,wt[xt++]=Wn,Wn=e;var r=qt;e=en;var o=32-zt(r)-1;r&=~(1<<o),n+=1;var i=32-zt(t)+o;if(30<i){var l=o-o%5;i=(r&(1<<l)-1).toString(32),r>>=l,o-=l,qt=1<<32-zt(t)+o|n<<o|r,en=i+e}else qt=1<<i|n<<o|r,en=e}function Ks(e){e.return!==null&&($n(e,1),Wd(e,1,0))}function Zs(e){for(;e===Hi;)Hi=gr[--vr],gr[vr]=null,Wi=gr[--vr],gr[vr]=null;for(;e===Wn;)Wn=wt[--xt],wt[xt]=null,en=wt[--xt],wt[xt]=null,qt=wt[--xt],wt[xt]=null}var ft=null,ut=null,ke=!1,It=null;function Qd(e,t){var n=St(5,null,null,0);n.elementType="DELETED",n.stateNode=t,n.return=e,t=e.deletions,t===null?(e.deletions=[n],e.flags|=16):t.push(n)}function Rc(e,t){switch(e.tag){case 5:var n=e.type;return t=t.nodeType!==1||n.toLowerCase()!==t.nodeName.toLowerCase()?null:t,t!==null?(e.stateNode=t,ft=e,ut=kn(t.firstChild),!0):!1;case 6:return t=e.pendingProps===""||t.nodeType!==3?null:t,t!==null?(e.stateNode=t,ft=e,ut=null,!0):!1;case 13:return t=t.nodeType!==8?null:t,t!==null?(n=Wn!==null?{id:qt,overflow:en}:null,e.memoizedState={dehydrated:t,treeContext:n,retryLane:1073741824},n=St(18,null,null,0),n.stateNode=t,n.return=e,e.child=n,ft=e,ut=null,!0):!1;default:return!1}}function Ka(e){return(e.mode&1)!==0&&(e.flags&128)===0}function Za(e){if(ke){var t=ut;if(t){var n=t;if(!Rc(e,t)){if(Ka(e))throw Error(L(418));t=kn(n.nextSibling);var r=ft;t&&Rc(e,t)?Qd(r,n):(e.flags=e.flags&-4097|2,ke=!1,ft=e)}}else{if(Ka(e))throw Error(L(418));e.flags=e.flags&-4097|2,ke=!1,ft=e}}}function Pc(e){for(e=e.return;e!==null&&e.tag!==5&&e.tag!==3&&e.tag!==13;)e=e.return;ft=e}function ui(e){if(e!==ft)return!1;if(!ke)return Pc(e),ke=!0,!1;var t;if((t=e.tag!==3)&&!(t=e.tag!==5)&&(t=e.type,t=t!=="head"&&t!=="body"&&!Qa(e.type,e.memoizedProps)),t&&(t=ut)){if(Ka(e))throw Gd(),Error(L(418));for(;t;)Qd(e,t),t=kn(t.nextSibling)}if(Pc(e),e.tag===13){if(e=e.memoizedState,e=e!==null?e.dehydrated:null,!e)throw Error(L(317));e:{for(e=e.nextSibling,t=0;e;){if(e.nodeType===8){var n=e.data;if(n==="/$"){if(t===0){ut=kn(e.nextSibling);break e}t--}else n!=="$"&&n!=="$!"&&n!=="$?"||t++}e=e.nextSibling}ut=null}}else ut=ft?kn(e.stateNode.nextSibling):null;return!0}function Gd(){for(var e=ut;e;)e=kn(e.nextSibling)}function Or(){ut=ft=null,ke=!1}function Js(e){It===null?It=[e]:It.push(e)}var R1=un.ReactCurrentBatchConfig;function _t(e,t){if(e&&e.defaultProps){t=Ne({},t),e=e.defaultProps;for(var n in e)t[n]===void 0&&(t[n]=e[n]);return t}return t}var Qi=Tn(null),Gi=null,yr=null,qs=null;function eu(){qs=yr=Gi=null}function tu(e){var t=Qi.current;we(Qi),e._currentValue=t}function Ja(e,t,n){for(;e!==null;){var r=e.alternate;if((e.childLanes&t)!==t?(e.childLanes|=t,r!==null&&(r.childLanes|=t)):r!==null&&(r.childLanes&t)!==t&&(r.childLanes|=t),e===n)break;e=e.return}}function Nr(e,t){Gi=e,qs=yr=null,e=e.dependencies,e!==null&&e.firstContext!==null&&(e.lanes&t&&(nt=!0),e.firstContext=null)}function Ct(e){var t=e._currentValue;if(qs!==e)if(e={context:e,memoizedValue:t,next:null},yr===null){if(Gi===null)throw Error(L(308));yr=e,Gi.dependencies={lanes:0,firstContext:e}}else yr=yr.next=e;return t}var Un=null;function nu(e){Un===null?Un=[e]:Un.push(e)}function Yd(e,t,n,r){var o=t.interleaved;return o===null?(n.next=n,nu(t)):(n.next=o.next,o.next=n),t.interleaved=n,on(e,r)}function on(e,t){e.lanes|=t;var n=e.alternate;for(n!==null&&(n.lanes|=t),n=e,e=e.return;e!==null;)e.childLanes|=t,n=e.alternate,n!==null&&(n.childLanes|=t),n=e,e=e.return;return n.tag===3?n.stateNode:null}var pn=!1;function ru(e){e.updateQueue={baseState:e.memoizedState,firstBaseUpdate:null,lastBaseUpdate:null,shared:{pending:null,interleaved:null,lanes:0},effects:null}}function Xd(e,t){e=e.updateQueue,t.updateQueue===e&&(t.updateQueue={baseState:e.baseState,firstBaseUpdate:e.firstBaseUpdate,lastBaseUpdate:e.lastBaseUpdate,shared:e.shared,effects:e.effects})}function tn(e,t){return{eventTime:e,lane:t,tag:0,payload:null,callback:null,next:null}}function Cn(e,t,n){var r=e.updateQueue;if(r===null)return null;if(r=r.shared,ce&2){var o=r.pending;return o===null?t.next=t:(t.next=o.next,o.next=t),r.pending=t,on(e,n)}return o=r.interleaved,o===null?(t.next=t,nu(r)):(t.next=o.next,o.next=t),r.interleaved=t,on(e,n)}function Ai(e,t,n){if(t=t.updateQueue,t!==null&&(t=t.shared,(n&4194240)!==0)){var r=t.lanes;r&=e.pendingLanes,n|=r,t.lanes=n,Bs(e,n)}}function Lc(e,t){var n=e.updateQueue,r=e.alternate;if(r!==null&&(r=r.updateQueue,n===r)){var o=null,i=null;if(n=n.firstBaseUpdate,n!==null){do{var l={eventTime:n.eventTime,lane:n.lane,tag:n.tag,payload:n.payload,callback:n.callback,next:null};i===null?o=i=l:i=i.next=l,n=n.next}while(n!==null);i===null?o=i=t:i=i.next=t}else o=i=t;n={baseState:r.baseState,firstBaseUpdate:o,lastBaseUpdate:i,shared:r.shared,effects:r.effects},e.updateQueue=n;return}e=n.lastBaseUpdate,e===null?n.firstBaseUpdate=t:e.next=t,n.lastBaseUpdate=t}function Yi(e,t,n,r){var o=e.updateQueue;pn=!1;var i=o.firstBaseUpdate,l=o.lastBaseUpdate,a=o.shared.pending;if(a!==null){o.shared.pending=null;var s=a,u=s.next;s.next=null,l===null?i=u:l.next=u,l=s;var d=e.alternate;d!==null&&(d=d.updateQueue,a=d.lastBaseUpdate,a!==l&&(a===null?d.firstBaseUpdate=u:a.next=u,d.lastBaseUpdate=s))}if(i!==null){var p=o.baseState;l=0,d=u=s=null,a=i;do{var h=a.lane,v=a.eventTime;if((r&h)===h){d!==null&&(d=d.next={eventTime:v,lane:0,tag:a.tag,payload:a.payload,callback:a.callback,next:null});e:{var g=e,w=a;switch(h=t,v=n,w.tag){case 1:if(g=w.payload,typeof g=="function"){p=g.call(v,p,h);break e}p=g;break e;case 3:g.flags=g.flags&-65537|128;case 0:if(g=w.payload,h=typeof g=="function"?g.call(v,p,h):g,h==null)break e;p=Ne({},p,h);break e;case 2:pn=!0}}a.callback!==null&&a.lane!==0&&(e.flags|=64,h=o.effects,h===null?o.effects=[a]:h.push(a))}else v={eventTime:v,lane:h,tag:a.tag,payload:a.payload,callback:a.callback,next:null},d===null?(u=d=v,s=p):d=d.next=v,l|=h;if(a=a.next,a===null){if(a=o.shared.pending,a===null)break;h=a,a=h.next,h.next=null,o.lastBaseUpdate=h,o.shared.pending=null}}while(1);if(d===null&&(s=p),o.baseState=s,o.firstBaseUpdate=u,o.lastBaseUpdate=d,t=o.shared.interleaved,t!==null){o=t;do l|=o.lane,o=o.next;while(o!==t)}else i===null&&(o.shared.lanes=0);Gn|=l,e.lanes=l,e.memoizedState=p}}function _c(e,t,n){if(e=t.effects,t.effects=null,e!==null)for(t=0;t<e.length;t++){var r=e[t],o=r.callback;if(o!==null){if(r.callback=null,r=n,typeof o!="function")throw Error(L(191,o));o.call(r)}}}var Kd=new Yf.Component().refs;function qa(e,t,n,r){t=e.memoizedState,n=n(r,t),n=n==null?t:Ne({},t,n),e.memoizedState=n,e.lanes===0&&(e.updateQueue.baseState=n)}var yl={isMounted:function(e){return(e=e._reactInternals)?qn(e)===e:!1},enqueueSetState:function(e,t,n){e=e._reactInternals;var r=Je(),o=An(e),i=tn(r,o);i.payload=t,n!=null&&(i.callback=n),t=Cn(e,i,o),t!==null&&(Mt(t,e,o,r),Ai(t,e,o))},enqueueReplaceState:function(e,t,n){e=e._reactInternals;var r=Je(),o=An(e),i=tn(r,o);i.tag=1,i.payload=t,n!=null&&(i.callback=n),t=Cn(e,i,o),t!==null&&(Mt(t,e,o,r),Ai(t,e,o))},enqueueForceUpdate:function(e,t){e=e._reactInternals;var n=Je(),r=An(e),o=tn(n,r);o.tag=2,t!=null&&(o.callback=t),t=Cn(e,o,r),t!==null&&(Mt(t,e,r,n),Ai(t,e,r))}};function Oc(e,t,n,r,o,i,l){return e=e.stateNode,typeof e.shouldComponentUpdate=="function"?e.shouldComponentUpdate(r,i,l):t.prototype&&t.prototype.isPureReactComponent?!bo(n,r)||!bo(o,i):!0}function Zd(e,t,n){var r=!1,o=Ln,i=t.contextType;return typeof i=="object"&&i!==null?i=Ct(i):(o=ot(t)?Hn:Ye.current,r=t.contextTypes,i=(r=r!=null)?_r(e,o):Ln),t=new t(n,i),e.memoizedState=t.state!==null&&t.state!==void 0?t.state:null,t.updater=yl,e.stateNode=t,t._reactInternals=e,r&&(e=e.stateNode,e.__reactInternalMemoizedUnmaskedChildContext=o,e.__reactInternalMemoizedMaskedChildContext=i),t}function Ic(e,t,n,r){e=t.state,typeof t.componentWillReceiveProps=="function"&&t.componentWillReceiveProps(n,r),typeof t.UNSAFE_componentWillReceiveProps=="function"&&t.UNSAFE_componentWillReceiveProps(n,r),t.state!==e&&yl.enqueueReplaceState(t,t.state,null)}function es(e,t,n,r){var o=e.stateNode;o.props=n,o.state=e.memoizedState,o.refs=Kd,ru(e);var i=t.contextType;typeof i=="object"&&i!==null?o.context=Ct(i):(i=ot(t)?Hn:Ye.current,o.context=_r(e,i)),o.state=e.memoizedState,i=t.getDerivedStateFromProps,typeof i=="function"&&(qa(e,t,i,n),o.state=e.memoizedState),typeof t.getDerivedStateFromProps=="function"||typeof o.getSnapshotBeforeUpdate=="function"||typeof o.UNSAFE_componentWillMount!="function"&&typeof o.componentWillMount!="function"||(t=o.state,typeof o.componentWillMount=="function"&&o.componentWillMount(),typeof o.UNSAFE_componentWillMount=="function"&&o.UNSAFE_componentWillMount(),t!==o.state&&yl.enqueueReplaceState(o,o.state,null),Yi(e,n,o,r),o.state=e.memoizedState),typeof o.componentDidMount=="function"&&(e.flags|=4194308)}function to(e,t,n){if(e=n.ref,e!==null&&typeof e!="function"&&typeof e!="object"){if(n._owner){if(n=n._owner,n){if(n.tag!==1)throw Error(L(309));var r=n.stateNode}if(!r)throw Error(L(147,e));var o=r,i=""+e;return t!==null&&t.ref!==null&&typeof t.ref=="function"&&t.ref._stringRef===i?t.ref:(t=function(l){var a=o.refs;a===Kd&&(a=o.refs={}),l===null?delete a[i]:a[i]=l},t._stringRef=i,t)}if(typeof e!="string")throw Error(L(284));if(!n._owner)throw Error(L(290,e))}return e}function ci(e,t){throw e=Object.prototype.toString.call(t),Error(L(31,e==="[object Object]"?"object with keys {"+Object.keys(t).join(", ")+"}":e))}function Tc(e){var t=e._init;return t(e._payload)}function Jd(e){function t(f,c){if(e){var m=f.deletions;m===null?(f.deletions=[c],f.flags|=16):m.push(c)}}function n(f,c){if(!e)return null;for(;c!==null;)t(f,c),c=c.sibling;return null}function r(f,c){for(f=new Map;c!==null;)c.key!==null?f.set(c.key,c):f.set(c.index,c),c=c.sibling;return f}function o(f,c){return f=Nn(f,c),f.index=0,f.sibling=null,f}function i(f,c,m){return f.index=m,e?(m=f.alternate,m!==null?(m=m.index,m<c?(f.flags|=2,c):m):(f.flags|=2,c)):(f.flags|=1048576,c)}function l(f){return e&&f.alternate===null&&(f.flags|=2),f}function a(f,c,m,S){return c===null||c.tag!==6?(c=ga(m,f.mode,S),c.return=f,c):(c=o(c,m),c.return=f,c)}function s(f,c,m,S){var A=m.type;return A===cr?d(f,c,m.props.children,S,m.key):c!==null&&(c.elementType===A||typeof A=="object"&&A!==null&&A.$$typeof===dn&&Tc(A)===c.type)?(S=o(c,m.props),S.ref=to(f,c,m),S.return=f,S):(S=_i(m.type,m.key,m.props,null,f.mode,S),S.ref=to(f,c,m),S.return=f,S)}function u(f,c,m,S){return c===null||c.tag!==4||c.stateNode.containerInfo!==m.containerInfo||c.stateNode.implementation!==m.implementation?(c=va(m,f.mode,S),c.return=f,c):(c=o(c,m.children||[]),c.return=f,c)}function d(f,c,m,S,A){return c===null||c.tag!==7?(c=Vn(m,f.mode,S,A),c.return=f,c):(c=o(c,m),c.return=f,c)}function p(f,c,m){if(typeof c=="string"&&c!==""||typeof c=="number")return c=ga(""+c,f.mode,m),c.return=f,c;if(typeof c=="object"&&c!==null){switch(c.$$typeof){case qo:return m=_i(c.type,c.key,c.props,null,f.mode,m),m.ref=to(f,null,c),m.return=f,m;case ur:return c=va(c,f.mode,m),c.return=f,c;case dn:var S=c._init;return p(f,S(c._payload),m)}if(io(c)||Kr(c))return c=Vn(c,f.mode,m,null),c.return=f,c;ci(f,c)}return null}function h(f,c,m,S){var A=c!==null?c.key:null;if(typeof m=="string"&&m!==""||typeof m=="number")return A!==null?null:a(f,c,""+m,S);if(typeof m=="object"&&m!==null){switch(m.$$typeof){case qo:return m.key===A?s(f,c,m,S):null;case ur:return m.key===A?u(f,c,m,S):null;case dn:return A=m._init,h(f,c,A(m._payload),S)}if(io(m)||Kr(m))return A!==null?null:d(f,c,m,S,null);ci(f,m)}return null}function v(f,c,m,S,A){if(typeof S=="string"&&S!==""||typeof S=="number")return f=f.get(m)||null,a(c,f,""+S,A);if(typeof S=="object"&&S!==null){switch(S.$$typeof){case qo:return f=f.get(S.key===null?m:S.key)||null,s(c,f,S,A);case ur:return f=f.get(S.key===null?m:S.key)||null,u(c,f,S,A);case dn:var E=S._init;return v(f,c,m,E(S._payload),A)}if(io(S)||Kr(S))return f=f.get(m)||null,d(c,f,S,A,null);ci(c,S)}return null}function g(f,c,m,S){for(var A=null,E=null,N=c,b=c=0,z=null;N!==null&&b<m.length;b++){N.index>b?(z=N,N=null):z=N.sibling;var F=h(f,N,m[b],S);if(F===null){N===null&&(N=z);break}e&&N&&F.alternate===null&&t(f,N),c=i(F,c,b),E===null?A=F:E.sibling=F,E=F,N=z}if(b===m.length)return n(f,N),ke&&$n(f,b),A;if(N===null){for(;b<m.length;b++)N=p(f,m[b],S),N!==null&&(c=i(N,c,b),E===null?A=N:E.sibling=N,E=N);return ke&&$n(f,b),A}for(N=r(f,N);b<m.length;b++)z=v(N,f,b,m[b],S),z!==null&&(e&&z.alternate!==null&&N.delete(z.key===null?b:z.key),c=i(z,c,b),E===null?A=z:E.sibling=z,E=z);return e&&N.forEach(function(ae){return t(f,ae)}),ke&&$n(f,b),A}function w(f,c,m,S){var A=Kr(m);if(typeof A!="function")throw Error(L(150));if(m=A.call(m),m==null)throw Error(L(151));for(var E=A=null,N=c,b=c=0,z=null,F=m.next();N!==null&&!F.done;b++,F=m.next()){N.index>b?(z=N,N=null):z=N.sibling;var ae=h(f,N,F.value,S);if(ae===null){N===null&&(N=z);break}e&&N&&ae.alternate===null&&t(f,N),c=i(ae,c,b),E===null?A=ae:E.sibling=ae,E=ae,N=z}if(F.done)return n(f,N),ke&&$n(f,b),A;if(N===null){for(;!F.done;b++,F=m.next())F=p(f,F.value,S),F!==null&&(c=i(F,c,b),E===null?A=F:E.sibling=F,E=F);return ke&&$n(f,b),A}for(N=r(f,N);!F.done;b++,F=m.next())F=v(N,f,b,F.value,S),F!==null&&(e&&F.alternate!==null&&N.delete(F.key===null?b:F.key),c=i(F,c,b),E===null?A=F:E.sibling=F,E=F);return e&&N.forEach(function(ee){return t(f,ee)}),ke&&$n(f,b),A}function C(f,c,m,S){if(typeof m=="object"&&m!==null&&m.type===cr&&m.key===null&&(m=m.props.children),typeof m=="object"&&m!==null){switch(m.$$typeof){case qo:e:{for(var A=m.key,E=c;E!==null;){if(E.key===A){if(A=m.type,A===cr){if(E.tag===7){n(f,E.sibling),c=o(E,m.props.children),c.return=f,f=c;break e}}else if(E.elementType===A||typeof A=="object"&&A!==null&&A.$$typeof===dn&&Tc(A)===E.type){n(f,E.sibling),c=o(E,m.props),c.ref=to(f,E,m),c.return=f,f=c;break e}n(f,E);break}else t(f,E);E=E.sibling}m.type===cr?(c=Vn(m.props.children,f.mode,S,m.key),c.return=f,f=c):(S=_i(m.type,m.key,m.props,null,f.mode,S),S.ref=to(f,c,m),S.return=f,f=S)}return l(f);case ur:e:{for(E=m.key;c!==null;){if(c.key===E)if(c.tag===4&&c.stateNode.containerInfo===m.containerInfo&&c.stateNode.implementation===m.implementation){n(f,c.sibling),c=o(c,m.children||[]),c.return=f,f=c;break e}else{n(f,c);break}else t(f,c);c=c.sibling}c=va(m,f.mode,S),c.return=f,f=c}return l(f);case dn:return E=m._init,C(f,c,E(m._payload),S)}if(io(m))return g(f,c,m,S);if(Kr(m))return w(f,c,m,S);ci(f,m)}return typeof m=="string"&&m!==""||typeof m=="number"?(m=""+m,c!==null&&c.tag===6?(n(f,c.sibling),c=o(c,m),c.return=f,f=c):(n(f,c),c=ga(m,f.mode,S),c.return=f,f=c),l(f)):n(f,c)}return C}var Ir=Jd(!0),qd=Jd(!1),Ho={},Qt=Tn(Ho),_o=Tn(Ho),Oo=Tn(Ho);function Fn(e){if(e===Ho)throw Error(L(174));return e}function ou(e,t){switch(ve(Oo,t),ve(_o,e),ve(Qt,Ho),e=t.nodeType,e){case 9:case 11:t=(t=t.documentElement)?t.namespaceURI:Oa(null,"");break;default:e=e===8?t.parentNode:t,t=e.namespaceURI||null,e=e.tagName,t=Oa(t,e)}we(Qt),ve(Qt,t)}function Tr(){we(Qt),we(_o),we(Oo)}function ep(e){Fn(Oo.current);var t=Fn(Qt.current),n=Oa(t,e.type);t!==n&&(ve(_o,e),ve(Qt,n))}function iu(e){_o.current===e&&(we(Qt),we(_o))}var Ee=Tn(0);function Xi(e){for(var t=e;t!==null;){if(t.tag===13){var n=t.memoizedState;if(n!==null&&(n=n.dehydrated,n===null||n.data==="$?"||n.data==="$!"))return t}else if(t.tag===19&&t.memoizedProps.revealOrder!==void 0){if(t.flags&128)return t}else if(t.child!==null){t.child.return=t,t=t.child;continue}if(t===e)break;for(;t.sibling===null;){if(t.return===null||t.return===e)return null;t=t.return}t.sibling.return=t.return,t=t.sibling}return null}var ca=[];function lu(){for(var e=0;e<ca.length;e++)ca[e]._workInProgressVersionPrimary=null;ca.length=0}var Ni=un.ReactCurrentDispatcher,fa=un.ReactCurrentBatchConfig,Qn=0,Ae=null,Ie=null,$e=null,Ki=!1,ho=!1,Io=0,P1=0;function We(){throw Error(L(321))}function au(e,t){if(t===null)return!1;for(var n=0;n<t.length&&n<e.length;n++)if(!$t(e[n],t[n]))return!1;return!0}function su(e,t,n,r,o,i){if(Qn=i,Ae=t,t.memoizedState=null,t.updateQueue=null,t.lanes=0,Ni.current=e===null||e.memoizedState===null?I1:T1,e=n(r,o),ho){i=0;do{if(ho=!1,Io=0,25<=i)throw Error(L(301));i+=1,$e=Ie=null,t.updateQueue=null,Ni.current=z1,e=n(r,o)}while(ho)}if(Ni.current=Zi,t=Ie!==null&&Ie.next!==null,Qn=0,$e=Ie=Ae=null,Ki=!1,t)throw Error(L(300));return e}function uu(){var e=Io!==0;return Io=0,e}function Bt(){var e={memoizedState:null,baseState:null,baseQueue:null,queue:null,next:null};return $e===null?Ae.memoizedState=$e=e:$e=$e.next=e,$e}function Et(){if(Ie===null){var e=Ae.alternate;e=e!==null?e.memoizedState:null}else e=Ie.next;var t=$e===null?Ae.memoizedState:$e.next;if(t!==null)$e=t,Ie=e;else{if(e===null)throw Error(L(310));Ie=e,e={memoizedState:Ie.memoizedState,baseState:Ie.baseState,baseQueue:Ie.baseQueue,queue:Ie.queue,next:null},$e===null?Ae.memoizedState=$e=e:$e=$e.next=e}return $e}function To(e,t){return typeof t=="function"?t(e):t}function da(e){var t=Et(),n=t.queue;if(n===null)throw Error(L(311));n.lastRenderedReducer=e;var r=Ie,o=r.baseQueue,i=n.pending;if(i!==null){if(o!==null){var l=o.next;o.next=i.next,i.next=l}r.baseQueue=o=i,n.pending=null}if(o!==null){i=o.next,r=r.baseState;var a=l=null,s=null,u=i;do{var d=u.lane;if((Qn&d)===d)s!==null&&(s=s.next={lane:0,action:u.action,hasEagerState:u.hasEagerState,eagerState:u.eagerState,next:null}),r=u.hasEagerState?u.eagerState:e(r,u.action);else{var p={lane:d,action:u.action,hasEagerState:u.hasEagerState,eagerState:u.eagerState,next:null};s===null?(a=s=p,l=r):s=s.next=p,Ae.lanes|=d,Gn|=d}u=u.next}while(u!==null&&u!==i);s===null?l=r:s.next=a,$t(r,t.memoizedState)||(nt=!0),t.memoizedState=r,t.baseState=l,t.baseQueue=s,n.lastRenderedState=r}if(e=n.interleaved,e!==null){o=e;do i=o.lane,Ae.lanes|=i,Gn|=i,o=o.next;while(o!==e)}else o===null&&(n.lanes=0);return[t.memoizedState,n.dispatch]}function pa(e){var t=Et(),n=t.queue;if(n===null)throw Error(L(311));n.lastRenderedReducer=e;var r=n.dispatch,o=n.pending,i=t.memoizedState;if(o!==null){n.pending=null;var l=o=o.next;do i=e(i,l.action),l=l.next;while(l!==o);$t(i,t.memoizedState)||(nt=!0),t.memoizedState=i,t.baseQueue===null&&(t.baseState=i),n.lastRenderedState=i}return[i,r]}function tp(){}function np(e,t){var n=Ae,r=Et(),o=t(),i=!$t(r.memoizedState,o);if(i&&(r.memoizedState=o,nt=!0),r=r.queue,cu(ip.bind(null,n,r,e),[e]),r.getSnapshot!==t||i||$e!==null&&$e.memoizedState.tag&1){if(n.flags|=2048,zo(9,op.bind(null,n,r,o,t),void 0,null),je===null)throw Error(L(349));Qn&30||rp(n,t,o)}return o}function rp(e,t,n){e.flags|=16384,e={getSnapshot:t,value:n},t=Ae.updateQueue,t===null?(t={lastEffect:null,stores:null},Ae.updateQueue=t,t.stores=[e]):(n=t.stores,n===null?t.stores=[e]:n.push(e))}function op(e,t,n,r){t.value=n,t.getSnapshot=r,lp(t)&&ap(e)}function ip(e,t,n){return n(function(){lp(t)&&ap(e)})}function lp(e){var t=e.getSnapshot;e=e.value;try{var n=t();return!$t(e,n)}catch{return!0}}function ap(e){var t=on(e,1);t!==null&&Mt(t,e,1,-1)}function zc(e){var t=Bt();return typeof e=="function"&&(e=e()),t.memoizedState=t.baseState=e,e={pending:null,interleaved:null,lanes:0,dispatch:null,lastRenderedReducer:To,lastRenderedState:e},t.queue=e,e=e.dispatch=O1.bind(null,Ae,e),[t.memoizedState,e]}function zo(e,t,n,r){return e={tag:e,create:t,destroy:n,deps:r,next:null},t=Ae.updateQueue,t===null?(t={lastEffect:null,stores:null},Ae.updateQueue=t,t.lastEffect=e.next=e):(n=t.lastEffect,n===null?t.lastEffect=e.next=e:(r=n.next,n.next=e,e.next=r,t.lastEffect=e)),e}function sp(){return Et().memoizedState}function bi(e,t,n,r){var o=Bt();Ae.flags|=e,o.memoizedState=zo(1|t,n,void 0,r===void 0?null:r)}function wl(e,t,n,r){var o=Et();r=r===void 0?null:r;var i=void 0;if(Ie!==null){var l=Ie.memoizedState;if(i=l.destroy,r!==null&&au(r,l.deps)){o.memoizedState=zo(t,n,i,r);return}}Ae.flags|=e,o.memoizedState=zo(1|t,n,i,r)}function Mc(e,t){return bi(8390656,8,e,t)}function cu(e,t){return wl(2048,8,e,t)}function up(e,t){return wl(4,2,e,t)}function cp(e,t){return wl(4,4,e,t)}function fp(e,t){if(typeof t=="function")return e=e(),t(e),function(){t(null)};if(t!=null)return e=e(),t.current=e,function(){t.current=null}}function dp(e,t,n){return n=n!=null?n.concat([e]):null,wl(4,4,fp.bind(null,t,e),n)}function fu(){}function pp(e,t){var n=Et();t=t===void 0?null:t;var r=n.memoizedState;return r!==null&&t!==null&&au(t,r[1])?r[0]:(n.memoizedState=[e,t],e)}function mp(e,t){var n=Et();t=t===void 0?null:t;var r=n.memoizedState;return r!==null&&t!==null&&au(t,r[1])?r[0]:(e=e(),n.memoizedState=[e,t],e)}function hp(e,t,n){return Qn&21?($t(n,t)||(n=yd(),Ae.lanes|=n,Gn|=n,e.baseState=!0),t):(e.baseState&&(e.baseState=!1,nt=!0),e.memoizedState=n)}function L1(e,t){var n=pe;pe=n!==0&&4>n?n:4,e(!0);var r=fa.transition;fa.transition={};try{e(!1),t()}finally{pe=n,fa.transition=r}}function gp(){return Et().memoizedState}function _1(e,t,n){var r=An(e);if(n={lane:r,action:n,hasEagerState:!1,eagerState:null,next:null},vp(e))yp(t,n);else if(n=Yd(e,t,n,r),n!==null){var o=Je();Mt(n,e,r,o),wp(n,t,r)}}function O1(e,t,n){var r=An(e),o={lane:r,action:n,hasEagerState:!1,eagerState:null,next:null};if(vp(e))yp(t,o);else{var i=e.alternate;if(e.lanes===0&&(i===null||i.lanes===0)&&(i=t.lastRenderedReducer,i!==null))try{var l=t.lastRenderedState,a=i(l,n);if(o.hasEagerState=!0,o.eagerState=a,$t(a,l)){var s=t.interleaved;s===null?(o.next=o,nu(t)):(o.next=s.next,s.next=o),t.interleaved=o;return}}catch{}finally{}n=Yd(e,t,o,r),n!==null&&(o=Je(),Mt(n,e,r,o),wp(n,t,r))}}function vp(e){var t=e.alternate;return e===Ae||t!==null&&t===Ae}function yp(e,t){ho=Ki=!0;var n=e.pending;n===null?t.next=t:(t.next=n.next,n.next=t),e.pending=t}function wp(e,t,n){if(n&4194240){var r=t.lanes;r&=e.pendingLanes,n|=r,t.lanes=n,Bs(e,n)}}var Zi={readContext:Ct,useCallback:We,useContext:We,useEffect:We,useImperativeHandle:We,useInsertionEffect:We,useLayoutEffect:We,useMemo:We,useReducer:We,useRef:We,useState:We,useDebugValue:We,useDeferredValue:We,useTransition:We,useMutableSource:We,useSyncExternalStore:We,useId:We,unstable_isNewReconciler:!1},I1={readContext:Ct,useCallback:function(e,t){return Bt().memoizedState=[e,t===void 0?null:t],e},useContext:Ct,useEffect:Mc,useImperativeHandle:function(e,t,n){return n=n!=null?n.concat([e]):null,bi(4194308,4,fp.bind(null,t,e),n)},useLayoutEffect:function(e,t){return bi(4194308,4,e,t)},useInsertionEffect:function(e,t){return bi(4,2,e,t)},useMemo:function(e,t){var n=Bt();return t=t===void 0?null:t,e=e(),n.memoizedState=[e,t],e},useReducer:function(e,t,n){var r=Bt();return t=n!==void 0?n(t):t,r.memoizedState=r.baseState=t,e={pending:null,interleaved:null,lanes:0,dispatch:null,lastRenderedReducer:e,lastRenderedState:t},r.queue=e,e=e.dispatch=_1.bind(null,Ae,e),[r.memoizedState,e]},useRef:function(e){var t=Bt();return e={current:e},t.memoizedState=e},useState:zc,useDebugValue:fu,useDeferredValue:function(e){return Bt().memoizedState=e},useTransition:function(){var e=zc(!1),t=e[0];return e=L1.bind(null,e[1]),Bt().memoizedState=e,[t,e]},useMutableSource:function(){},useSyncExternalStore:function(e,t,n){var r=Ae,o=Bt();if(ke){if(n===void 0)throw Error(L(407));n=n()}else{if(n=t(),je===null)throw Error(L(349));Qn&30||rp(r,t,n)}o.memoizedState=n;var i={value:n,getSnapshot:t};return o.queue=i,Mc(ip.bind(null,r,i,e),[e]),r.flags|=2048,zo(9,op.bind(null,r,i,n,t),void 0,null),n},useId:function(){var e=Bt(),t=je.identifierPrefix;if(ke){var n=en,r=qt;n=(r&~(1<<32-zt(r)-1)).toString(32)+n,t=":"+t+"R"+n,n=Io++,0<n&&(t+="H"+n.toString(32)),t+=":"}else n=P1++,t=":"+t+"r"+n.toString(32)+":";return e.memoizedState=t},unstable_isNewReconciler:!1},T1={readContext:Ct,useCallback:pp,useContext:Ct,useEffect:cu,useImperativeHandle:dp,useInsertionEffect:up,useLayoutEffect:cp,useMemo:mp,useReducer:da,useRef:sp,useState:function(){return da(To)},useDebugValue:fu,useDeferredValue:function(e){var t=Et();return hp(t,Ie.memoizedState,e)},useTransition:function(){var e=da(To)[0],t=Et().memoizedState;return[e,t]},useMutableSource:tp,useSyncExternalStore:np,useId:gp,unstable_isNewReconciler:!1},z1={readContext:Ct,useCallback:pp,useContext:Ct,useEffect:cu,useImperativeHandle:dp,useInsertionEffect:up,useLayoutEffect:cp,useMemo:mp,useReducer:pa,useRef:sp,useState:function(){return pa(To)},useDebugValue:fu,useDeferredValue:function(e){var t=Et();return Ie===null?t.memoizedState=e:hp(t,Ie.memoizedState,e)},useTransition:function(){var e=pa(To)[0],t=Et().memoizedState;return[e,t]},useMutableSource:tp,useSyncExternalStore:np,useId:gp,unstable_isNewReconciler:!1};function zr(e,t){try{var n="",r=t;do n+=uh(r),r=r.return;while(r);var o=n}catch(i){o=`
Error generating stack: `+i.message+`
`+i.stack}return{value:e,source:t,stack:o,digest:null}}function ma(e,t,n){return{value:e,source:null,stack:n??null,digest:t??null}}function ts(e,t){try{console.error(t.value)}catch(n){setTimeout(function(){throw n})}}var M1=typeof WeakMap=="function"?WeakMap:Map;function xp(e,t,n){n=tn(-1,n),n.tag=3,n.payload={element:null};var r=t.value;return n.callback=function(){qi||(qi=!0,fs=r),ts(e,t)},n}function Sp(e,t,n){n=tn(-1,n),n.tag=3;var r=e.type.getDerivedStateFromError;if(typeof r=="function"){var o=t.value;n.payload=function(){return r(o)},n.callback=function(){ts(e,t)}}var i=e.stateNode;return i!==null&&typeof i.componentDidCatch=="function"&&(n.callback=function(){ts(e,t),typeof r!="function"&&(En===null?En=new Set([this]):En.add(this));var l=t.stack;this.componentDidCatch(t.value,{componentStack:l!==null?l:""})}),n}function $c(e,t,n){var r=e.pingCache;if(r===null){r=e.pingCache=new M1;var o=new Set;r.set(t,o)}else o=r.get(t),o===void 0&&(o=new Set,r.set(t,o));o.has(n)||(o.add(n),e=K1.bind(null,e,t,n),t.then(e,e))}function jc(e){do{var t;if((t=e.tag===13)&&(t=e.memoizedState,t=t!==null?t.dehydrated!==null:!0),t)return e;e=e.return}while(e!==null);return null}function Dc(e,t,n,r,o){return e.mode&1?(e.flags|=65536,e.lanes=o,e):(e===t?e.flags|=65536:(e.flags|=128,n.flags|=131072,n.flags&=-52805,n.tag===1&&(n.alternate===null?n.tag=17:(t=tn(-1,1),t.tag=2,Cn(n,t,1))),n.lanes|=1),e)}var $1=un.ReactCurrentOwner,nt=!1;function Ze(e,t,n,r){t.child=e===null?qd(t,null,n,r):Ir(t,e.child,n,r)}function Uc(e,t,n,r,o){n=n.render;var i=t.ref;return Nr(t,o),r=su(e,t,n,r,i,o),n=uu(),e!==null&&!nt?(t.updateQueue=e.updateQueue,t.flags&=-2053,e.lanes&=~o,ln(e,t,o)):(ke&&n&&Ks(t),t.flags|=1,Ze(e,t,r,o),t.child)}function Fc(e,t,n,r,o){if(e===null){var i=n.type;return typeof i=="function"&&!wu(i)&&i.defaultProps===void 0&&n.compare===null&&n.defaultProps===void 0?(t.tag=15,t.type=i,kp(e,t,i,r,o)):(e=_i(n.type,null,r,t,t.mode,o),e.ref=t.ref,e.return=t,t.child=e)}if(i=e.child,!(e.lanes&o)){var l=i.memoizedProps;if(n=n.compare,n=n!==null?n:bo,n(l,r)&&e.ref===t.ref)return ln(e,t,o)}return t.flags|=1,e=Nn(i,r),e.ref=t.ref,e.return=t,t.child=e}function kp(e,t,n,r,o){if(e!==null){var i=e.memoizedProps;if(bo(i,r)&&e.ref===t.ref)if(nt=!1,t.pendingProps=r=i,(e.lanes&o)!==0)e.flags&131072&&(nt=!0);else return t.lanes=e.lanes,ln(e,t,o)}return ns(e,t,n,r,o)}function Cp(e,t,n){var r=t.pendingProps,o=r.children,i=e!==null?e.memoizedState:null;if(r.mode==="hidden")if(!(t.mode&1))t.memoizedState={baseLanes:0,cachePool:null,transitions:null},ve(xr,at),at|=n;else{if(!(n&1073741824))return e=i!==null?i.baseLanes|n:n,t.lanes=t.childLanes=1073741824,t.memoizedState={baseLanes:e,cachePool:null,transitions:null},t.updateQueue=null,ve(xr,at),at|=e,null;t.memoizedState={baseLanes:0,cachePool:null,transitions:null},r=i!==null?i.baseLanes:n,ve(xr,at),at|=r}else i!==null?(r=i.baseLanes|n,t.memoizedState=null):r=n,ve(xr,at),at|=r;return Ze(e,t,o,n),t.child}function Ep(e,t){var n=t.ref;(e===null&&n!==null||e!==null&&e.ref!==n)&&(t.flags|=512,t.flags|=2097152)}function ns(e,t,n,r,o){var i=ot(n)?Hn:Ye.current;return i=_r(t,i),Nr(t,o),n=su(e,t,n,r,i,o),r=uu(),e!==null&&!nt?(t.updateQueue=e.updateQueue,t.flags&=-2053,e.lanes&=~o,ln(e,t,o)):(ke&&r&&Ks(t),t.flags|=1,Ze(e,t,n,o),t.child)}function Bc(e,t,n,r,o){if(ot(n)){var i=!0;Vi(t)}else i=!1;if(Nr(t,o),t.stateNode===null)Ri(e,t),Zd(t,n,r),es(t,n,r,o),r=!0;else if(e===null){var l=t.stateNode,a=t.memoizedProps;l.props=a;var s=l.context,u=n.contextType;typeof u=="object"&&u!==null?u=Ct(u):(u=ot(n)?Hn:Ye.current,u=_r(t,u));var d=n.getDerivedStateFromProps,p=typeof d=="function"||typeof l.getSnapshotBeforeUpdate=="function";p||typeof l.UNSAFE_componentWillReceiveProps!="function"&&typeof l.componentWillReceiveProps!="function"||(a!==r||s!==u)&&Ic(t,l,r,u),pn=!1;var h=t.memoizedState;l.state=h,Yi(t,r,l,o),s=t.memoizedState,a!==r||h!==s||rt.current||pn?(typeof d=="function"&&(qa(t,n,d,r),s=t.memoizedState),(a=pn||Oc(t,n,a,r,h,s,u))?(p||typeof l.UNSAFE_componentWillMount!="function"&&typeof l.componentWillMount!="function"||(typeof l.componentWillMount=="function"&&l.componentWillMount(),typeof l.UNSAFE_componentWillMount=="function"&&l.UNSAFE_componentWillMount()),typeof l.componentDidMount=="function"&&(t.flags|=4194308)):(typeof l.componentDidMount=="function"&&(t.flags|=4194308),t.memoizedProps=r,t.memoizedState=s),l.props=r,l.state=s,l.context=u,r=a):(typeof l.componentDidMount=="function"&&(t.flags|=4194308),r=!1)}else{l=t.stateNode,Xd(e,t),a=t.memoizedProps,u=t.type===t.elementType?a:_t(t.type,a),l.props=u,p=t.pendingProps,h=l.context,s=n.contextType,typeof s=="object"&&s!==null?s=Ct(s):(s=ot(n)?Hn:Ye.current,s=_r(t,s));var v=n.getDerivedStateFromProps;(d=typeof v=="function"||typeof l.getSnapshotBeforeUpdate=="function")||typeof l.UNSAFE_componentWillReceiveProps!="function"&&typeof l.componentWillReceiveProps!="function"||(a!==p||h!==s)&&Ic(t,l,r,s),pn=!1,h=t.memoizedState,l.state=h,Yi(t,r,l,o);var g=t.memoizedState;a!==p||h!==g||rt.current||pn?(typeof v=="function"&&(qa(t,n,v,r),g=t.memoizedState),(u=pn||Oc(t,n,u,r,h,g,s)||!1)?(d||typeof l.UNSAFE_componentWillUpdate!="function"&&typeof l.componentWillUpdate!="function"||(typeof l.componentWillUpdate=="function"&&l.componentWillUpdate(r,g,s),typeof l.UNSAFE_componentWillUpdate=="function"&&l.UNSAFE_componentWillUpdate(r,g,s)),typeof l.componentDidUpdate=="function"&&(t.flags|=4),typeof l.getSnapshotBeforeUpdate=="function"&&(t.flags|=1024)):(typeof l.componentDidUpdate!="function"||a===e.memoizedProps&&h===e.memoizedState||(t.flags|=4),typeof l.getSnapshotBeforeUpdate!="function"||a===e.memoizedProps&&h===e.memoizedState||(t.flags|=1024),t.memoizedProps=r,t.memoizedState=g),l.props=r,l.state=g,l.context=s,r=u):(typeof l.componentDidUpdate!="function"||a===e.memoizedProps&&h===e.memoizedState||(t.flags|=4),typeof l.getSnapshotBeforeUpdate!="function"||a===e.memoizedProps&&h===e.memoizedState||(t.flags|=1024),r=!1)}return rs(e,t,n,r,i,o)}function rs(e,t,n,r,o,i){Ep(e,t);var l=(t.flags&128)!==0;if(!r&&!l)return o&&bc(t,n,!1),ln(e,t,i);r=t.stateNode,$1.current=t;var a=l&&typeof n.getDerivedStateFromError!="function"?null:r.render();return t.flags|=1,e!==null&&l?(t.child=Ir(t,e.child,null,i),t.child=Ir(t,null,a,i)):Ze(e,t,a,i),t.memoizedState=r.state,o&&bc(t,n,!0),t.child}function Ap(e){var t=e.stateNode;t.pendingContext?Nc(e,t.pendingContext,t.pendingContext!==t.context):t.context&&Nc(e,t.context,!1),ou(e,t.containerInfo)}function Vc(e,t,n,r,o){return Or(),Js(o),t.flags|=256,Ze(e,t,n,r),t.child}var os={dehydrated:null,treeContext:null,retryLane:0};function is(e){return{baseLanes:e,cachePool:null,transitions:null}}function Np(e,t,n){var r=t.pendingProps,o=Ee.current,i=!1,l=(t.flags&128)!==0,a;if((a=l)||(a=e!==null&&e.memoizedState===null?!1:(o&2)!==0),a?(i=!0,t.flags&=-129):(e===null||e.memoizedState!==null)&&(o|=1),ve(Ee,o&1),e===null)return Za(t),e=t.memoizedState,e!==null&&(e=e.dehydrated,e!==null)?(t.mode&1?e.data==="$!"?t.lanes=8:t.lanes=1073741824:t.lanes=1,null):(l=r.children,e=r.fallback,i?(r=t.mode,i=t.child,l={mode:"hidden",children:l},!(r&1)&&i!==null?(i.childLanes=0,i.pendingProps=l):i=kl(l,r,0,null),e=Vn(e,r,n,null),i.return=t,e.return=t,i.sibling=e,t.child=i,t.child.memoizedState=is(n),t.memoizedState=os,e):du(t,l));if(o=e.memoizedState,o!==null&&(a=o.dehydrated,a!==null))return j1(e,t,l,r,a,o,n);if(i){i=r.fallback,l=t.mode,o=e.child,a=o.sibling;var s={mode:"hidden",children:r.children};return!(l&1)&&t.child!==o?(r=t.child,r.childLanes=0,r.pendingProps=s,t.deletions=null):(r=Nn(o,s),r.subtreeFlags=o.subtreeFlags&14680064),a!==null?i=Nn(a,i):(i=Vn(i,l,n,null),i.flags|=2),i.return=t,r.return=t,r.sibling=i,t.child=r,r=i,i=t.child,l=e.child.memoizedState,l=l===null?is(n):{baseLanes:l.baseLanes|n,cachePool:null,transitions:l.transitions},i.memoizedState=l,i.childLanes=e.childLanes&~n,t.memoizedState=os,r}return i=e.child,e=i.sibling,r=Nn(i,{mode:"visible",children:r.children}),!(t.mode&1)&&(r.lanes=n),r.return=t,r.sibling=null,e!==null&&(n=t.deletions,n===null?(t.deletions=[e],t.flags|=16):n.push(e)),t.child=r,t.memoizedState=null,r}function du(e,t){return t=kl({mode:"visible",children:t},e.mode,0,null),t.return=e,e.child=t}function fi(e,t,n,r){return r!==null&&Js(r),Ir(t,e.child,null,n),e=du(t,t.pendingProps.children),e.flags|=2,t.memoizedState=null,e}function j1(e,t,n,r,o,i,l){if(n)return t.flags&256?(t.flags&=-257,r=ma(Error(L(422))),fi(e,t,l,r)):t.memoizedState!==null?(t.child=e.child,t.flags|=128,null):(i=r.fallback,o=t.mode,r=kl({mode:"visible",children:r.children},o,0,null),i=Vn(i,o,l,null),i.flags|=2,r.return=t,i.return=t,r.sibling=i,t.child=r,t.mode&1&&Ir(t,e.child,null,l),t.child.memoizedState=is(l),t.memoizedState=os,i);if(!(t.mode&1))return fi(e,t,l,null);if(o.data==="$!"){if(r=o.nextSibling&&o.nextSibling.dataset,r)var a=r.dgst;return r=a,i=Error(L(419)),r=ma(i,r,void 0),fi(e,t,l,r)}if(a=(l&e.childLanes)!==0,nt||a){if(r=je,r!==null){switch(l&-l){case 4:o=2;break;case 16:o=8;break;case 64:case 128:case 256:case 512:case 1024:case 2048:case 4096:case 8192:case 16384:case 32768:case 65536:case 131072:case 262144:case 524288:case 1048576:case 2097152:case 4194304:case 8388608:case 16777216:case 33554432:case 67108864:o=32;break;case 536870912:o=268435456;break;default:o=0}o=o&(r.suspendedLanes|l)?0:o,o!==0&&o!==i.retryLane&&(i.retryLane=o,on(e,o),Mt(r,e,o,-1))}return yu(),r=ma(Error(L(421))),fi(e,t,l,r)}return o.data==="$?"?(t.flags|=128,t.child=e.child,t=Z1.bind(null,e),o._reactRetry=t,null):(e=i.treeContext,ut=kn(o.nextSibling),ft=t,ke=!0,It=null,e!==null&&(wt[xt++]=qt,wt[xt++]=en,wt[xt++]=Wn,qt=e.id,en=e.overflow,Wn=t),t=du(t,r.children),t.flags|=4096,t)}function Hc(e,t,n){e.lanes|=t;var r=e.alternate;r!==null&&(r.lanes|=t),Ja(e.return,t,n)}function ha(e,t,n,r,o){var i=e.memoizedState;i===null?e.memoizedState={isBackwards:t,rendering:null,renderingStartTime:0,last:r,tail:n,tailMode:o}:(i.isBackwards=t,i.rendering=null,i.renderingStartTime=0,i.last=r,i.tail=n,i.tailMode=o)}function bp(e,t,n){var r=t.pendingProps,o=r.revealOrder,i=r.tail;if(Ze(e,t,r.children,n),r=Ee.current,r&2)r=r&1|2,t.flags|=128;else{if(e!==null&&e.flags&128)e:for(e=t.child;e!==null;){if(e.tag===13)e.memoizedState!==null&&Hc(e,n,t);else if(e.tag===19)Hc(e,n,t);else if(e.child!==null){e.child.return=e,e=e.child;continue}if(e===t)break e;for(;e.sibling===null;){if(e.return===null||e.return===t)break e;e=e.return}e.sibling.return=e.return,e=e.sibling}r&=1}if(ve(Ee,r),!(t.mode&1))t.memoizedState=null;else switch(o){case"forwards":for(n=t.child,o=null;n!==null;)e=n.alternate,e!==null&&Xi(e)===null&&(o=n),n=n.sibling;n=o,n===null?(o=t.child,t.child=null):(o=n.sibling,n.sibling=null),ha(t,!1,o,n,i);break;case"backwards":for(n=null,o=t.child,t.child=null;o!==null;){if(e=o.alternate,e!==null&&Xi(e)===null){t.child=o;break}e=o.sibling,o.sibling=n,n=o,o=e}ha(t,!0,n,null,i);break;case"together":ha(t,!1,null,null,void 0);break;default:t.memoizedState=null}return t.child}function Ri(e,t){!(t.mode&1)&&e!==null&&(e.alternate=null,t.alternate=null,t.flags|=2)}function ln(e,t,n){if(e!==null&&(t.dependencies=e.dependencies),Gn|=t.lanes,!(n&t.childLanes))return null;if(e!==null&&t.child!==e.child)throw Error(L(153));if(t.child!==null){for(e=t.child,n=Nn(e,e.pendingProps),t.child=n,n.return=t;e.sibling!==null;)e=e.sibling,n=n.sibling=Nn(e,e.pendingProps),n.return=t;n.sibling=null}return t.child}function D1(e,t,n){switch(t.tag){case 3:Ap(t),Or();break;case 5:ep(t);break;case 1:ot(t.type)&&Vi(t);break;case 4:ou(t,t.stateNode.containerInfo);break;case 10:var r=t.type._context,o=t.memoizedProps.value;ve(Qi,r._currentValue),r._currentValue=o;break;case 13:if(r=t.memoizedState,r!==null)return r.dehydrated!==null?(ve(Ee,Ee.current&1),t.flags|=128,null):n&t.child.childLanes?Np(e,t,n):(ve(Ee,Ee.current&1),e=ln(e,t,n),e!==null?e.sibling:null);ve(Ee,Ee.current&1);break;case 19:if(r=(n&t.childLanes)!==0,e.flags&128){if(r)return bp(e,t,n);t.flags|=128}if(o=t.memoizedState,o!==null&&(o.rendering=null,o.tail=null,o.lastEffect=null),ve(Ee,Ee.current),r)break;return null;case 22:case 23:return t.lanes=0,Cp(e,t,n)}return ln(e,t,n)}var Rp,ls,Pp,Lp;Rp=function(e,t){for(var n=t.child;n!==null;){if(n.tag===5||n.tag===6)e.appendChild(n.stateNode);else if(n.tag!==4&&n.child!==null){n.child.return=n,n=n.child;continue}if(n===t)break;for(;n.sibling===null;){if(n.return===null||n.return===t)return;n=n.return}n.sibling.return=n.return,n=n.sibling}};ls=function(){};Pp=function(e,t,n,r){var o=e.memoizedProps;if(o!==r){e=t.stateNode,Fn(Qt.current);var i=null;switch(n){case"input":o=Ra(e,o),r=Ra(e,r),i=[];break;case"select":o=Ne({},o,{value:void 0}),r=Ne({},r,{value:void 0}),i=[];break;case"textarea":o=_a(e,o),r=_a(e,r),i=[];break;default:typeof o.onClick!="function"&&typeof r.onClick=="function"&&(e.onclick=Fi)}Ia(n,r);var l;n=null;for(u in o)if(!r.hasOwnProperty(u)&&o.hasOwnProperty(u)&&o[u]!=null)if(u==="style"){var a=o[u];for(l in a)a.hasOwnProperty(l)&&(n||(n={}),n[l]="")}else u!=="dangerouslySetInnerHTML"&&u!=="children"&&u!=="suppressContentEditableWarning"&&u!=="suppressHydrationWarning"&&u!=="autoFocus"&&(xo.hasOwnProperty(u)?i||(i=[]):(i=i||[]).push(u,null));for(u in r){var s=r[u];if(a=o!=null?o[u]:void 0,r.hasOwnProperty(u)&&s!==a&&(s!=null||a!=null))if(u==="style")if(a){for(l in a)!a.hasOwnProperty(l)||s&&s.hasOwnProperty(l)||(n||(n={}),n[l]="");for(l in s)s.hasOwnProperty(l)&&a[l]!==s[l]&&(n||(n={}),n[l]=s[l])}else n||(i||(i=[]),i.push(u,n)),n=s;else u==="dangerouslySetInnerHTML"?(s=s?s.__html:void 0,a=a?a.__html:void 0,s!=null&&a!==s&&(i=i||[]).push(u,s)):u==="children"?typeof s!="string"&&typeof s!="number"||(i=i||[]).push(u,""+s):u!=="suppressContentEditableWarning"&&u!=="suppressHydrationWarning"&&(xo.hasOwnProperty(u)?(s!=null&&u==="onScroll"&&ye("scroll",e),i||a===s||(i=[])):(i=i||[]).push(u,s))}n&&(i=i||[]).push("style",n);var u=i;(t.updateQueue=u)&&(t.flags|=4)}};Lp=function(e,t,n,r){n!==r&&(t.flags|=4)};function no(e,t){if(!ke)switch(e.tailMode){case"hidden":t=e.tail;for(var n=null;t!==null;)t.alternate!==null&&(n=t),t=t.sibling;n===null?e.tail=null:n.sibling=null;break;case"collapsed":n=e.tail;for(var r=null;n!==null;)n.alternate!==null&&(r=n),n=n.sibling;r===null?t||e.tail===null?e.tail=null:e.tail.sibling=null:r.sibling=null}}function Qe(e){var t=e.alternate!==null&&e.alternate.child===e.child,n=0,r=0;if(t)for(var o=e.child;o!==null;)n|=o.lanes|o.childLanes,r|=o.subtreeFlags&14680064,r|=o.flags&14680064,o.return=e,o=o.sibling;else for(o=e.child;o!==null;)n|=o.lanes|o.childLanes,r|=o.subtreeFlags,r|=o.flags,o.return=e,o=o.sibling;return e.subtreeFlags|=r,e.childLanes=n,t}function U1(e,t,n){var r=t.pendingProps;switch(Zs(t),t.tag){case 2:case 16:case 15:case 0:case 11:case 7:case 8:case 12:case 9:case 14:return Qe(t),null;case 1:return ot(t.type)&&Bi(),Qe(t),null;case 3:return r=t.stateNode,Tr(),we(rt),we(Ye),lu(),r.pendingContext&&(r.context=r.pendingContext,r.pendingContext=null),(e===null||e.child===null)&&(ui(t)?t.flags|=4:e===null||e.memoizedState.isDehydrated&&!(t.flags&256)||(t.flags|=1024,It!==null&&(ms(It),It=null))),ls(e,t),Qe(t),null;case 5:iu(t);var o=Fn(Oo.current);if(n=t.type,e!==null&&t.stateNode!=null)Pp(e,t,n,r,o),e.ref!==t.ref&&(t.flags|=512,t.flags|=2097152);else{if(!r){if(t.stateNode===null)throw Error(L(166));return Qe(t),null}if(e=Fn(Qt.current),ui(t)){r=t.stateNode,n=t.type;var i=t.memoizedProps;switch(r[Vt]=t,r[Lo]=i,e=(t.mode&1)!==0,n){case"dialog":ye("cancel",r),ye("close",r);break;case"iframe":case"object":case"embed":ye("load",r);break;case"video":case"audio":for(o=0;o<ao.length;o++)ye(ao[o],r);break;case"source":ye("error",r);break;case"img":case"image":case"link":ye("error",r),ye("load",r);break;case"details":ye("toggle",r);break;case"input":qu(r,i),ye("invalid",r);break;case"select":r._wrapperState={wasMultiple:!!i.multiple},ye("invalid",r);break;case"textarea":tc(r,i),ye("invalid",r)}Ia(n,i),o=null;for(var l in i)if(i.hasOwnProperty(l)){var a=i[l];l==="children"?typeof a=="string"?r.textContent!==a&&(i.suppressHydrationWarning!==!0&&si(r.textContent,a,e),o=["children",a]):typeof a=="number"&&r.textContent!==""+a&&(i.suppressHydrationWarning!==!0&&si(r.textContent,a,e),o=["children",""+a]):xo.hasOwnProperty(l)&&a!=null&&l==="onScroll"&&ye("scroll",r)}switch(n){case"input":ei(r),ec(r,i,!0);break;case"textarea":ei(r),nc(r);break;case"select":case"option":break;default:typeof i.onClick=="function"&&(r.onclick=Fi)}r=o,t.updateQueue=r,r!==null&&(t.flags|=4)}else{l=o.nodeType===9?o:o.ownerDocument,e==="http://www.w3.org/1999/xhtml"&&(e=rd(n)),e==="http://www.w3.org/1999/xhtml"?n==="script"?(e=l.createElement("div"),e.innerHTML="<script><\/script>",e=e.removeChild(e.firstChild)):typeof r.is=="string"?e=l.createElement(n,{is:r.is}):(e=l.createElement(n),n==="select"&&(l=e,r.multiple?l.multiple=!0:r.size&&(l.size=r.size))):e=l.createElementNS(e,n),e[Vt]=t,e[Lo]=r,Rp(e,t,!1,!1),t.stateNode=e;e:{switch(l=Ta(n,r),n){case"dialog":ye("cancel",e),ye("close",e),o=r;break;case"iframe":case"object":case"embed":ye("load",e),o=r;break;case"video":case"audio":for(o=0;o<ao.length;o++)ye(ao[o],e);o=r;break;case"source":ye("error",e),o=r;break;case"img":case"image":case"link":ye("error",e),ye("load",e),o=r;break;case"details":ye("toggle",e),o=r;break;case"input":qu(e,r),o=Ra(e,r),ye("invalid",e);break;case"option":o=r;break;case"select":e._wrapperState={wasMultiple:!!r.multiple},o=Ne({},r,{value:void 0}),ye("invalid",e);break;case"textarea":tc(e,r),o=_a(e,r),ye("invalid",e);break;default:o=r}Ia(n,o),a=o;for(i in a)if(a.hasOwnProperty(i)){var s=a[i];i==="style"?ld(e,s):i==="dangerouslySetInnerHTML"?(s=s?s.__html:void 0,s!=null&&od(e,s)):i==="children"?typeof s=="string"?(n!=="textarea"||s!=="")&&So(e,s):typeof s=="number"&&So(e,""+s):i!=="suppressContentEditableWarning"&&i!=="suppressHydrationWarning"&&i!=="autoFocus"&&(xo.hasOwnProperty(i)?s!=null&&i==="onScroll"&&ye("scroll",e):s!=null&&Ms(e,i,s,l))}switch(n){case"input":ei(e),ec(e,r,!1);break;case"textarea":ei(e),nc(e);break;case"option":r.value!=null&&e.setAttribute("value",""+Pn(r.value));break;case"select":e.multiple=!!r.multiple,i=r.value,i!=null?kr(e,!!r.multiple,i,!1):r.defaultValue!=null&&kr(e,!!r.multiple,r.defaultValue,!0);break;default:typeof o.onClick=="function"&&(e.onclick=Fi)}switch(n){case"button":case"input":case"select":case"textarea":r=!!r.autoFocus;break e;case"img":r=!0;break e;default:r=!1}}r&&(t.flags|=4)}t.ref!==null&&(t.flags|=512,t.flags|=2097152)}return Qe(t),null;case 6:if(e&&t.stateNode!=null)Lp(e,t,e.memoizedProps,r);else{if(typeof r!="string"&&t.stateNode===null)throw Error(L(166));if(n=Fn(Oo.current),Fn(Qt.current),ui(t)){if(r=t.stateNode,n=t.memoizedProps,r[Vt]=t,(i=r.nodeValue!==n)&&(e=ft,e!==null))switch(e.tag){case 3:si(r.nodeValue,n,(e.mode&1)!==0);break;case 5:e.memoizedProps.suppressHydrationWarning!==!0&&si(r.nodeValue,n,(e.mode&1)!==0)}i&&(t.flags|=4)}else r=(n.nodeType===9?n:n.ownerDocument).createTextNode(r),r[Vt]=t,t.stateNode=r}return Qe(t),null;case 13:if(we(Ee),r=t.memoizedState,e===null||e.memoizedState!==null&&e.memoizedState.dehydrated!==null){if(ke&&ut!==null&&t.mode&1&&!(t.flags&128))Gd(),Or(),t.flags|=98560,i=!1;else if(i=ui(t),r!==null&&r.dehydrated!==null){if(e===null){if(!i)throw Error(L(318));if(i=t.memoizedState,i=i!==null?i.dehydrated:null,!i)throw Error(L(317));i[Vt]=t}else Or(),!(t.flags&128)&&(t.memoizedState=null),t.flags|=4;Qe(t),i=!1}else It!==null&&(ms(It),It=null),i=!0;if(!i)return t.flags&65536?t:null}return t.flags&128?(t.lanes=n,t):(r=r!==null,r!==(e!==null&&e.memoizedState!==null)&&r&&(t.child.flags|=8192,t.mode&1&&(e===null||Ee.current&1?Te===0&&(Te=3):yu())),t.updateQueue!==null&&(t.flags|=4),Qe(t),null);case 4:return Tr(),ls(e,t),e===null&&Ro(t.stateNode.containerInfo),Qe(t),null;case 10:return tu(t.type._context),Qe(t),null;case 17:return ot(t.type)&&Bi(),Qe(t),null;case 19:if(we(Ee),i=t.memoizedState,i===null)return Qe(t),null;if(r=(t.flags&128)!==0,l=i.rendering,l===null)if(r)no(i,!1);else{if(Te!==0||e!==null&&e.flags&128)for(e=t.child;e!==null;){if(l=Xi(e),l!==null){for(t.flags|=128,no(i,!1),r=l.updateQueue,r!==null&&(t.updateQueue=r,t.flags|=4),t.subtreeFlags=0,r=n,n=t.child;n!==null;)i=n,e=r,i.flags&=14680066,l=i.alternate,l===null?(i.childLanes=0,i.lanes=e,i.child=null,i.subtreeFlags=0,i.memoizedProps=null,i.memoizedState=null,i.updateQueue=null,i.dependencies=null,i.stateNode=null):(i.childLanes=l.childLanes,i.lanes=l.lanes,i.child=l.child,i.subtreeFlags=0,i.deletions=null,i.memoizedProps=l.memoizedProps,i.memoizedState=l.memoizedState,i.updateQueue=l.updateQueue,i.type=l.type,e=l.dependencies,i.dependencies=e===null?null:{lanes:e.lanes,firstContext:e.firstContext}),n=n.sibling;return ve(Ee,Ee.current&1|2),t.child}e=e.sibling}i.tail!==null&&Pe()>Mr&&(t.flags|=128,r=!0,no(i,!1),t.lanes=4194304)}else{if(!r)if(e=Xi(l),e!==null){if(t.flags|=128,r=!0,n=e.updateQueue,n!==null&&(t.updateQueue=n,t.flags|=4),no(i,!0),i.tail===null&&i.tailMode==="hidden"&&!l.alternate&&!ke)return Qe(t),null}else 2*Pe()-i.renderingStartTime>Mr&&n!==1073741824&&(t.flags|=128,r=!0,no(i,!1),t.lanes=4194304);i.isBackwards?(l.sibling=t.child,t.child=l):(n=i.last,n!==null?n.sibling=l:t.child=l,i.last=l)}return i.tail!==null?(t=i.tail,i.rendering=t,i.tail=t.sibling,i.renderingStartTime=Pe(),t.sibling=null,n=Ee.current,ve(Ee,r?n&1|2:n&1),t):(Qe(t),null);case 22:case 23:return vu(),r=t.memoizedState!==null,e!==null&&e.memoizedState!==null!==r&&(t.flags|=8192),r&&t.mode&1?at&1073741824&&(Qe(t),t.subtreeFlags&6&&(t.flags|=8192)):Qe(t),null;case 24:return null;case 25:return null}throw Error(L(156,t.tag))}function F1(e,t){switch(Zs(t),t.tag){case 1:return ot(t.type)&&Bi(),e=t.flags,e&65536?(t.flags=e&-65537|128,t):null;case 3:return Tr(),we(rt),we(Ye),lu(),e=t.flags,e&65536&&!(e&128)?(t.flags=e&-65537|128,t):null;case 5:return iu(t),null;case 13:if(we(Ee),e=t.memoizedState,e!==null&&e.dehydrated!==null){if(t.alternate===null)throw Error(L(340));Or()}return e=t.flags,e&65536?(t.flags=e&-65537|128,t):null;case 19:return we(Ee),null;case 4:return Tr(),null;case 10:return tu(t.type._context),null;case 22:case 23:return vu(),null;case 24:return null;default:return null}}var di=!1,Ge=!1,B1=typeof WeakSet=="function"?WeakSet:Set,U=null;function wr(e,t){var n=e.ref;if(n!==null)if(typeof n=="function")try{n(null)}catch(r){be(e,t,r)}else n.current=null}function as(e,t,n){try{n()}catch(r){be(e,t,r)}}var Wc=!1;function V1(e,t){if(Ha=ji,e=Td(),Xs(e)){if("selectionStart"in e)var n={start:e.selectionStart,end:e.selectionEnd};else e:{n=(n=e.ownerDocument)&&n.defaultView||window;var r=n.getSelection&&n.getSelection();if(r&&r.rangeCount!==0){n=r.anchorNode;var o=r.anchorOffset,i=r.focusNode;r=r.focusOffset;try{n.nodeType,i.nodeType}catch{n=null;break e}var l=0,a=-1,s=-1,u=0,d=0,p=e,h=null;t:for(;;){for(var v;p!==n||o!==0&&p.nodeType!==3||(a=l+o),p!==i||r!==0&&p.nodeType!==3||(s=l+r),p.nodeType===3&&(l+=p.nodeValue.length),(v=p.firstChild)!==null;)h=p,p=v;for(;;){if(p===e)break t;if(h===n&&++u===o&&(a=l),h===i&&++d===r&&(s=l),(v=p.nextSibling)!==null)break;p=h,h=p.parentNode}p=v}n=a===-1||s===-1?null:{start:a,end:s}}else n=null}n=n||{start:0,end:0}}else n=null;for(Wa={focusedElem:e,selectionRange:n},ji=!1,U=t;U!==null;)if(t=U,e=t.child,(t.subtreeFlags&1028)!==0&&e!==null)e.return=t,U=e;else for(;U!==null;){t=U;try{var g=t.alternate;if(t.flags&1024)switch(t.tag){case 0:case 11:case 15:break;case 1:if(g!==null){var w=g.memoizedProps,C=g.memoizedState,f=t.stateNode,c=f.getSnapshotBeforeUpdate(t.elementType===t.type?w:_t(t.type,w),C);f.__reactInternalSnapshotBeforeUpdate=c}break;case 3:var m=t.stateNode.containerInfo;m.nodeType===1?m.textContent="":m.nodeType===9&&m.documentElement&&m.removeChild(m.documentElement);break;case 5:case 6:case 4:case 17:break;default:throw Error(L(163))}}catch(S){be(t,t.return,S)}if(e=t.sibling,e!==null){e.return=t.return,U=e;break}U=t.return}return g=Wc,Wc=!1,g}function go(e,t,n){var r=t.updateQueue;if(r=r!==null?r.lastEffect:null,r!==null){var o=r=r.next;do{if((o.tag&e)===e){var i=o.destroy;o.destroy=void 0,i!==void 0&&as(t,n,i)}o=o.next}while(o!==r)}}function xl(e,t){if(t=t.updateQueue,t=t!==null?t.lastEffect:null,t!==null){var n=t=t.next;do{if((n.tag&e)===e){var r=n.create;n.destroy=r()}n=n.next}while(n!==t)}}function ss(e){var t=e.ref;if(t!==null){var n=e.stateNode;switch(e.tag){case 5:e=n;break;default:e=n}typeof t=="function"?t(e):t.current=e}}function _p(e){var t=e.alternate;t!==null&&(e.alternate=null,_p(t)),e.child=null,e.deletions=null,e.sibling=null,e.tag===5&&(t=e.stateNode,t!==null&&(delete t[Vt],delete t[Lo],delete t[Ya],delete t[A1],delete t[N1])),e.stateNode=null,e.return=null,e.dependencies=null,e.memoizedProps=null,e.memoizedState=null,e.pendingProps=null,e.stateNode=null,e.updateQueue=null}function Op(e){return e.tag===5||e.tag===3||e.tag===4}function Qc(e){e:for(;;){for(;e.sibling===null;){if(e.return===null||Op(e.return))return null;e=e.return}for(e.sibling.return=e.return,e=e.sibling;e.tag!==5&&e.tag!==6&&e.tag!==18;){if(e.flags&2||e.child===null||e.tag===4)continue e;e.child.return=e,e=e.child}if(!(e.flags&2))return e.stateNode}}function us(e,t,n){var r=e.tag;if(r===5||r===6)e=e.stateNode,t?n.nodeType===8?n.parentNode.insertBefore(e,t):n.insertBefore(e,t):(n.nodeType===8?(t=n.parentNode,t.insertBefore(e,n)):(t=n,t.appendChild(e)),n=n._reactRootContainer,n!=null||t.onclick!==null||(t.onclick=Fi));else if(r!==4&&(e=e.child,e!==null))for(us(e,t,n),e=e.sibling;e!==null;)us(e,t,n),e=e.sibling}function cs(e,t,n){var r=e.tag;if(r===5||r===6)e=e.stateNode,t?n.insertBefore(e,t):n.appendChild(e);else if(r!==4&&(e=e.child,e!==null))for(cs(e,t,n),e=e.sibling;e!==null;)cs(e,t,n),e=e.sibling}var Ue=null,Ot=!1;function fn(e,t,n){for(n=n.child;n!==null;)Ip(e,t,n),n=n.sibling}function Ip(e,t,n){if(Wt&&typeof Wt.onCommitFiberUnmount=="function")try{Wt.onCommitFiberUnmount(dl,n)}catch{}switch(n.tag){case 5:Ge||wr(n,t);case 6:var r=Ue,o=Ot;Ue=null,fn(e,t,n),Ue=r,Ot=o,Ue!==null&&(Ot?(e=Ue,n=n.stateNode,e.nodeType===8?e.parentNode.removeChild(n):e.removeChild(n)):Ue.removeChild(n.stateNode));break;case 18:Ue!==null&&(Ot?(e=Ue,n=n.stateNode,e.nodeType===8?sa(e.parentNode,n):e.nodeType===1&&sa(e,n),Ao(e)):sa(Ue,n.stateNode));break;case 4:r=Ue,o=Ot,Ue=n.stateNode.containerInfo,Ot=!0,fn(e,t,n),Ue=r,Ot=o;break;case 0:case 11:case 14:case 15:if(!Ge&&(r=n.updateQueue,r!==null&&(r=r.lastEffect,r!==null))){o=r=r.next;do{var i=o,l=i.destroy;i=i.tag,l!==void 0&&(i&2||i&4)&&as(n,t,l),o=o.next}while(o!==r)}fn(e,t,n);break;case 1:if(!Ge&&(wr(n,t),r=n.stateNode,typeof r.componentWillUnmount=="function"))try{r.props=n.memoizedProps,r.state=n.memoizedState,r.componentWillUnmount()}catch(a){be(n,t,a)}fn(e,t,n);break;case 21:fn(e,t,n);break;case 22:n.mode&1?(Ge=(r=Ge)||n.memoizedState!==null,fn(e,t,n),Ge=r):fn(e,t,n);break;default:fn(e,t,n)}}function Gc(e){var t=e.updateQueue;if(t!==null){e.updateQueue=null;var n=e.stateNode;n===null&&(n=e.stateNode=new B1),t.forEach(function(r){var o=J1.bind(null,e,r);n.has(r)||(n.add(r),r.then(o,o))})}}function Lt(e,t){var n=t.deletions;if(n!==null)for(var r=0;r<n.length;r++){var o=n[r];try{var i=e,l=t,a=l;e:for(;a!==null;){switch(a.tag){case 5:Ue=a.stateNode,Ot=!1;break e;case 3:Ue=a.stateNode.containerInfo,Ot=!0;break e;case 4:Ue=a.stateNode.containerInfo,Ot=!0;break e}a=a.return}if(Ue===null)throw Error(L(160));Ip(i,l,o),Ue=null,Ot=!1;var s=o.alternate;s!==null&&(s.return=null),o.return=null}catch(u){be(o,t,u)}}if(t.subtreeFlags&12854)for(t=t.child;t!==null;)Tp(t,e),t=t.sibling}function Tp(e,t){var n=e.alternate,r=e.flags;switch(e.tag){case 0:case 11:case 14:case 15:if(Lt(t,e),Ft(e),r&4){try{go(3,e,e.return),xl(3,e)}catch(w){be(e,e.return,w)}try{go(5,e,e.return)}catch(w){be(e,e.return,w)}}break;case 1:Lt(t,e),Ft(e),r&512&&n!==null&&wr(n,n.return);break;case 5:if(Lt(t,e),Ft(e),r&512&&n!==null&&wr(n,n.return),e.flags&32){var o=e.stateNode;try{So(o,"")}catch(w){be(e,e.return,w)}}if(r&4&&(o=e.stateNode,o!=null)){var i=e.memoizedProps,l=n!==null?n.memoizedProps:i,a=e.type,s=e.updateQueue;if(e.updateQueue=null,s!==null)try{a==="input"&&i.type==="radio"&&i.name!=null&&td(o,i),Ta(a,l);var u=Ta(a,i);for(l=0;l<s.length;l+=2){var d=s[l],p=s[l+1];d==="style"?ld(o,p):d==="dangerouslySetInnerHTML"?od(o,p):d==="children"?So(o,p):Ms(o,d,p,u)}switch(a){case"input":Pa(o,i);break;case"textarea":nd(o,i);break;case"select":var h=o._wrapperState.wasMultiple;o._wrapperState.wasMultiple=!!i.multiple;var v=i.value;v!=null?kr(o,!!i.multiple,v,!1):h!==!!i.multiple&&(i.defaultValue!=null?kr(o,!!i.multiple,i.defaultValue,!0):kr(o,!!i.multiple,i.multiple?[]:"",!1))}o[Lo]=i}catch(w){be(e,e.return,w)}}break;case 6:if(Lt(t,e),Ft(e),r&4){if(e.stateNode===null)throw Error(L(162));o=e.stateNode,i=e.memoizedProps;try{o.nodeValue=i}catch(w){be(e,e.return,w)}}break;case 3:if(Lt(t,e),Ft(e),r&4&&n!==null&&n.memoizedState.isDehydrated)try{Ao(t.containerInfo)}catch(w){be(e,e.return,w)}break;case 4:Lt(t,e),Ft(e);break;case 13:Lt(t,e),Ft(e),o=e.child,o.flags&8192&&(i=o.memoizedState!==null,o.stateNode.isHidden=i,!i||o.alternate!==null&&o.alternate.memoizedState!==null||(hu=Pe())),r&4&&Gc(e);break;case 22:if(d=n!==null&&n.memoizedState!==null,e.mode&1?(Ge=(u=Ge)||d,Lt(t,e),Ge=u):Lt(t,e),Ft(e),r&8192){if(u=e.memoizedState!==null,(e.stateNode.isHidden=u)&&!d&&e.mode&1)for(U=e,d=e.child;d!==null;){for(p=U=d;U!==null;){switch(h=U,v=h.child,h.tag){case 0:case 11:case 14:case 15:go(4,h,h.return);break;case 1:wr(h,h.return);var g=h.stateNode;if(typeof g.componentWillUnmount=="function"){r=h,n=h.return;try{t=r,g.props=t.memoizedProps,g.state=t.memoizedState,g.componentWillUnmount()}catch(w){be(r,n,w)}}break;case 5:wr(h,h.return);break;case 22:if(h.memoizedState!==null){Xc(p);continue}}v!==null?(v.return=h,U=v):Xc(p)}d=d.sibling}e:for(d=null,p=e;;){if(p.tag===5){if(d===null){d=p;try{o=p.stateNode,u?(i=o.style,typeof i.setProperty=="function"?i.setProperty("display","none","important"):i.display="none"):(a=p.stateNode,s=p.memoizedProps.style,l=s!=null&&s.hasOwnProperty("display")?s.display:null,a.style.display=id("display",l))}catch(w){be(e,e.return,w)}}}else if(p.tag===6){if(d===null)try{p.stateNode.nodeValue=u?"":p.memoizedProps}catch(w){be(e,e.return,w)}}else if((p.tag!==22&&p.tag!==23||p.memoizedState===null||p===e)&&p.child!==null){p.child.return=p,p=p.child;continue}if(p===e)break e;for(;p.sibling===null;){if(p.return===null||p.return===e)break e;d===p&&(d=null),p=p.return}d===p&&(d=null),p.sibling.return=p.return,p=p.sibling}}break;case 19:Lt(t,e),Ft(e),r&4&&Gc(e);break;case 21:break;default:Lt(t,e),Ft(e)}}function Ft(e){var t=e.flags;if(t&2){try{e:{for(var n=e.return;n!==null;){if(Op(n)){var r=n;break e}n=n.return}throw Error(L(160))}switch(r.tag){case 5:var o=r.stateNode;r.flags&32&&(So(o,""),r.flags&=-33);var i=Qc(e);cs(e,i,o);break;case 3:case 4:var l=r.stateNode.containerInfo,a=Qc(e);us(e,a,l);break;default:throw Error(L(161))}}catch(s){be(e,e.return,s)}e.flags&=-3}t&4096&&(e.flags&=-4097)}function H1(e,t,n){U=e,zp(e)}function zp(e,t,n){for(var r=(e.mode&1)!==0;U!==null;){var o=U,i=o.child;if(o.tag===22&&r){var l=o.memoizedState!==null||di;if(!l){var a=o.alternate,s=a!==null&&a.memoizedState!==null||Ge;a=di;var u=Ge;if(di=l,(Ge=s)&&!u)for(U=o;U!==null;)l=U,s=l.child,l.tag===22&&l.memoizedState!==null?Kc(o):s!==null?(s.return=l,U=s):Kc(o);for(;i!==null;)U=i,zp(i),i=i.sibling;U=o,di=a,Ge=u}Yc(e)}else o.subtreeFlags&8772&&i!==null?(i.return=o,U=i):Yc(e)}}function Yc(e){for(;U!==null;){var t=U;if(t.flags&8772){var n=t.alternate;try{if(t.flags&8772)switch(t.tag){case 0:case 11:case 15:Ge||xl(5,t);break;case 1:var r=t.stateNode;if(t.flags&4&&!Ge)if(n===null)r.componentDidMount();else{var o=t.elementType===t.type?n.memoizedProps:_t(t.type,n.memoizedProps);r.componentDidUpdate(o,n.memoizedState,r.__reactInternalSnapshotBeforeUpdate)}var i=t.updateQueue;i!==null&&_c(t,i,r);break;case 3:var l=t.updateQueue;if(l!==null){if(n=null,t.child!==null)switch(t.child.tag){case 5:n=t.child.stateNode;break;case 1:n=t.child.stateNode}_c(t,l,n)}break;case 5:var a=t.stateNode;if(n===null&&t.flags&4){n=a;var s=t.memoizedProps;switch(t.type){case"button":case"input":case"select":case"textarea":s.autoFocus&&n.focus();break;case"img":s.src&&(n.src=s.src)}}break;case 6:break;case 4:break;case 12:break;case 13:if(t.memoizedState===null){var u=t.alternate;if(u!==null){var d=u.memoizedState;if(d!==null){var p=d.dehydrated;p!==null&&Ao(p)}}}break;case 19:case 17:case 21:case 22:case 23:case 25:break;default:throw Error(L(163))}Ge||t.flags&512&&ss(t)}catch(h){be(t,t.return,h)}}if(t===e){U=null;break}if(n=t.sibling,n!==null){n.return=t.return,U=n;break}U=t.return}}function Xc(e){for(;U!==null;){var t=U;if(t===e){U=null;break}var n=t.sibling;if(n!==null){n.return=t.return,U=n;break}U=t.return}}function Kc(e){for(;U!==null;){var t=U;try{switch(t.tag){case 0:case 11:case 15:var n=t.return;try{xl(4,t)}catch(s){be(t,n,s)}break;case 1:var r=t.stateNode;if(typeof r.componentDidMount=="function"){var o=t.return;try{r.componentDidMount()}catch(s){be(t,o,s)}}var i=t.return;try{ss(t)}catch(s){be(t,i,s)}break;case 5:var l=t.return;try{ss(t)}catch(s){be(t,l,s)}}}catch(s){be(t,t.return,s)}if(t===e){U=null;break}var a=t.sibling;if(a!==null){a.return=t.return,U=a;break}U=t.return}}var W1=Math.ceil,Ji=un.ReactCurrentDispatcher,pu=un.ReactCurrentOwner,kt=un.ReactCurrentBatchConfig,ce=0,je=null,_e=null,Fe=0,at=0,xr=Tn(0),Te=0,Mo=null,Gn=0,Sl=0,mu=0,vo=null,tt=null,hu=0,Mr=1/0,Zt=null,qi=!1,fs=null,En=null,pi=!1,vn=null,el=0,yo=0,ds=null,Pi=-1,Li=0;function Je(){return ce&6?Pe():Pi!==-1?Pi:Pi=Pe()}function An(e){return e.mode&1?ce&2&&Fe!==0?Fe&-Fe:R1.transition!==null?(Li===0&&(Li=yd()),Li):(e=pe,e!==0||(e=window.event,e=e===void 0?16:Ad(e.type)),e):1}function Mt(e,t,n,r){if(50<yo)throw yo=0,ds=null,Error(L(185));Fo(e,n,r),(!(ce&2)||e!==je)&&(e===je&&(!(ce&2)&&(Sl|=n),Te===4&&hn(e,Fe)),it(e,r),n===1&&ce===0&&!(t.mode&1)&&(Mr=Pe()+500,vl&&zn()))}function it(e,t){var n=e.callbackNode;Rh(e,t);var r=$i(e,e===je?Fe:0);if(r===0)n!==null&&ic(n),e.callbackNode=null,e.callbackPriority=0;else if(t=r&-r,e.callbackPriority!==t){if(n!=null&&ic(n),t===1)e.tag===0?b1(Zc.bind(null,e)):Hd(Zc.bind(null,e)),C1(function(){!(ce&6)&&zn()}),n=null;else{switch(wd(r)){case 1:n=Fs;break;case 4:n=gd;break;case 16:n=Mi;break;case 536870912:n=vd;break;default:n=Mi}n=Vp(n,Mp.bind(null,e))}e.callbackPriority=t,e.callbackNode=n}}function Mp(e,t){if(Pi=-1,Li=0,ce&6)throw Error(L(327));var n=e.callbackNode;if(br()&&e.callbackNode!==n)return null;var r=$i(e,e===je?Fe:0);if(r===0)return null;if(r&30||r&e.expiredLanes||t)t=tl(e,r);else{t=r;var o=ce;ce|=2;var i=jp();(je!==e||Fe!==t)&&(Zt=null,Mr=Pe()+500,Bn(e,t));do try{Y1();break}catch(a){$p(e,a)}while(1);eu(),Ji.current=i,ce=o,_e!==null?t=0:(je=null,Fe=0,t=Te)}if(t!==0){if(t===2&&(o=Da(e),o!==0&&(r=o,t=ps(e,o))),t===1)throw n=Mo,Bn(e,0),hn(e,r),it(e,Pe()),n;if(t===6)hn(e,r);else{if(o=e.current.alternate,!(r&30)&&!Q1(o)&&(t=tl(e,r),t===2&&(i=Da(e),i!==0&&(r=i,t=ps(e,i))),t===1))throw n=Mo,Bn(e,0),hn(e,r),it(e,Pe()),n;switch(e.finishedWork=o,e.finishedLanes=r,t){case 0:case 1:throw Error(L(345));case 2:jn(e,tt,Zt);break;case 3:if(hn(e,r),(r&130023424)===r&&(t=hu+500-Pe(),10<t)){if($i(e,0)!==0)break;if(o=e.suspendedLanes,(o&r)!==r){Je(),e.pingedLanes|=e.suspendedLanes&o;break}e.timeoutHandle=Ga(jn.bind(null,e,tt,Zt),t);break}jn(e,tt,Zt);break;case 4:if(hn(e,r),(r&4194240)===r)break;for(t=e.eventTimes,o=-1;0<r;){var l=31-zt(r);i=1<<l,l=t[l],l>o&&(o=l),r&=~i}if(r=o,r=Pe()-r,r=(120>r?120:480>r?480:1080>r?1080:1920>r?1920:3e3>r?3e3:4320>r?4320:1960*W1(r/1960))-r,10<r){e.timeoutHandle=Ga(jn.bind(null,e,tt,Zt),r);break}jn(e,tt,Zt);break;case 5:jn(e,tt,Zt);break;default:throw Error(L(329))}}}return it(e,Pe()),e.callbackNode===n?Mp.bind(null,e):null}function ps(e,t){var n=vo;return e.current.memoizedState.isDehydrated&&(Bn(e,t).flags|=256),e=tl(e,t),e!==2&&(t=tt,tt=n,t!==null&&ms(t)),e}function ms(e){tt===null?tt=e:tt.push.apply(tt,e)}function Q1(e){for(var t=e;;){if(t.flags&16384){var n=t.updateQueue;if(n!==null&&(n=n.stores,n!==null))for(var r=0;r<n.length;r++){var o=n[r],i=o.getSnapshot;o=o.value;try{if(!$t(i(),o))return!1}catch{return!1}}}if(n=t.child,t.subtreeFlags&16384&&n!==null)n.return=t,t=n;else{if(t===e)break;for(;t.sibling===null;){if(t.return===null||t.return===e)return!0;t=t.return}t.sibling.return=t.return,t=t.sibling}}return!0}function hn(e,t){for(t&=~mu,t&=~Sl,e.suspendedLanes|=t,e.pingedLanes&=~t,e=e.expirationTimes;0<t;){var n=31-zt(t),r=1<<n;e[n]=-1,t&=~r}}function Zc(e){if(ce&6)throw Error(L(327));br();var t=$i(e,0);if(!(t&1))return it(e,Pe()),null;var n=tl(e,t);if(e.tag!==0&&n===2){var r=Da(e);r!==0&&(t=r,n=ps(e,r))}if(n===1)throw n=Mo,Bn(e,0),hn(e,t),it(e,Pe()),n;if(n===6)throw Error(L(345));return e.finishedWork=e.current.alternate,e.finishedLanes=t,jn(e,tt,Zt),it(e,Pe()),null}function gu(e,t){var n=ce;ce|=1;try{return e(t)}finally{ce=n,ce===0&&(Mr=Pe()+500,vl&&zn())}}function Yn(e){vn!==null&&vn.tag===0&&!(ce&6)&&br();var t=ce;ce|=1;var n=kt.transition,r=pe;try{if(kt.transition=null,pe=1,e)return e()}finally{pe=r,kt.transition=n,ce=t,!(ce&6)&&zn()}}function vu(){at=xr.current,we(xr)}function Bn(e,t){e.finishedWork=null,e.finishedLanes=0;var n=e.timeoutHandle;if(n!==-1&&(e.timeoutHandle=-1,k1(n)),_e!==null)for(n=_e.return;n!==null;){var r=n;switch(Zs(r),r.tag){case 1:r=r.type.childContextTypes,r!=null&&Bi();break;case 3:Tr(),we(rt),we(Ye),lu();break;case 5:iu(r);break;case 4:Tr();break;case 13:we(Ee);break;case 19:we(Ee);break;case 10:tu(r.type._context);break;case 22:case 23:vu()}n=n.return}if(je=e,_e=e=Nn(e.current,null),Fe=at=t,Te=0,Mo=null,mu=Sl=Gn=0,tt=vo=null,Un!==null){for(t=0;t<Un.length;t++)if(n=Un[t],r=n.interleaved,r!==null){n.interleaved=null;var o=r.next,i=n.pending;if(i!==null){var l=i.next;i.next=o,r.next=l}n.pending=r}Un=null}return e}function $p(e,t){do{var n=_e;try{if(eu(),Ni.current=Zi,Ki){for(var r=Ae.memoizedState;r!==null;){var o=r.queue;o!==null&&(o.pending=null),r=r.next}Ki=!1}if(Qn=0,$e=Ie=Ae=null,ho=!1,Io=0,pu.current=null,n===null||n.return===null){Te=1,Mo=t,_e=null;break}e:{var i=e,l=n.return,a=n,s=t;if(t=Fe,a.flags|=32768,s!==null&&typeof s=="object"&&typeof s.then=="function"){var u=s,d=a,p=d.tag;if(!(d.mode&1)&&(p===0||p===11||p===15)){var h=d.alternate;h?(d.updateQueue=h.updateQueue,d.memoizedState=h.memoizedState,d.lanes=h.lanes):(d.updateQueue=null,d.memoizedState=null)}var v=jc(l);if(v!==null){v.flags&=-257,Dc(v,l,a,i,t),v.mode&1&&$c(i,u,t),t=v,s=u;var g=t.updateQueue;if(g===null){var w=new Set;w.add(s),t.updateQueue=w}else g.add(s);break e}else{if(!(t&1)){$c(i,u,t),yu();break e}s=Error(L(426))}}else if(ke&&a.mode&1){var C=jc(l);if(C!==null){!(C.flags&65536)&&(C.flags|=256),Dc(C,l,a,i,t),Js(zr(s,a));break e}}i=s=zr(s,a),Te!==4&&(Te=2),vo===null?vo=[i]:vo.push(i),i=l;do{switch(i.tag){case 3:i.flags|=65536,t&=-t,i.lanes|=t;var f=xp(i,s,t);Lc(i,f);break e;case 1:a=s;var c=i.type,m=i.stateNode;if(!(i.flags&128)&&(typeof c.getDerivedStateFromError=="function"||m!==null&&typeof m.componentDidCatch=="function"&&(En===null||!En.has(m)))){i.flags|=65536,t&=-t,i.lanes|=t;var S=Sp(i,a,t);Lc(i,S);break e}}i=i.return}while(i!==null)}Up(n)}catch(A){t=A,_e===n&&n!==null&&(_e=n=n.return);continue}break}while(1)}function jp(){var e=Ji.current;return Ji.current=Zi,e===null?Zi:e}function yu(){(Te===0||Te===3||Te===2)&&(Te=4),je===null||!(Gn&268435455)&&!(Sl&268435455)||hn(je,Fe)}function tl(e,t){var n=ce;ce|=2;var r=jp();(je!==e||Fe!==t)&&(Zt=null,Bn(e,t));do try{G1();break}catch(o){$p(e,o)}while(1);if(eu(),ce=n,Ji.current=r,_e!==null)throw Error(L(261));return je=null,Fe=0,Te}function G1(){for(;_e!==null;)Dp(_e)}function Y1(){for(;_e!==null&&!wh();)Dp(_e)}function Dp(e){var t=Bp(e.alternate,e,at);e.memoizedProps=e.pendingProps,t===null?Up(e):_e=t,pu.current=null}function Up(e){var t=e;do{var n=t.alternate;if(e=t.return,t.flags&32768){if(n=F1(n,t),n!==null){n.flags&=32767,_e=n;return}if(e!==null)e.flags|=32768,e.subtreeFlags=0,e.deletions=null;else{Te=6,_e=null;return}}else if(n=U1(n,t,at),n!==null){_e=n;return}if(t=t.sibling,t!==null){_e=t;return}_e=t=e}while(t!==null);Te===0&&(Te=5)}function jn(e,t,n){var r=pe,o=kt.transition;try{kt.transition=null,pe=1,X1(e,t,n,r)}finally{kt.transition=o,pe=r}return null}function X1(e,t,n,r){do br();while(vn!==null);if(ce&6)throw Error(L(327));n=e.finishedWork;var o=e.finishedLanes;if(n===null)return null;if(e.finishedWork=null,e.finishedLanes=0,n===e.current)throw Error(L(177));e.callbackNode=null,e.callbackPriority=0;var i=n.lanes|n.childLanes;if(Ph(e,i),e===je&&(_e=je=null,Fe=0),!(n.subtreeFlags&2064)&&!(n.flags&2064)||pi||(pi=!0,Vp(Mi,function(){return br(),null})),i=(n.flags&15990)!==0,n.subtreeFlags&15990||i){i=kt.transition,kt.transition=null;var l=pe;pe=1;var a=ce;ce|=4,pu.current=null,V1(e,n),Tp(n,e),h1(Wa),ji=!!Ha,Wa=Ha=null,e.current=n,H1(n),xh(),ce=a,pe=l,kt.transition=i}else e.current=n;if(pi&&(pi=!1,vn=e,el=o),i=e.pendingLanes,i===0&&(En=null),Ch(n.stateNode),it(e,Pe()),t!==null)for(r=e.onRecoverableError,n=0;n<t.length;n++)o=t[n],r(o.value,{componentStack:o.stack,digest:o.digest});if(qi)throw qi=!1,e=fs,fs=null,e;return el&1&&e.tag!==0&&br(),i=e.pendingLanes,i&1?e===ds?yo++:(yo=0,ds=e):yo=0,zn(),null}function br(){if(vn!==null){var e=wd(el),t=kt.transition,n=pe;try{if(kt.transition=null,pe=16>e?16:e,vn===null)var r=!1;else{if(e=vn,vn=null,el=0,ce&6)throw Error(L(331));var o=ce;for(ce|=4,U=e.current;U!==null;){var i=U,l=i.child;if(U.flags&16){var a=i.deletions;if(a!==null){for(var s=0;s<a.length;s++){var u=a[s];for(U=u;U!==null;){var d=U;switch(d.tag){case 0:case 11:case 15:go(8,d,i)}var p=d.child;if(p!==null)p.return=d,U=p;else for(;U!==null;){d=U;var h=d.sibling,v=d.return;if(_p(d),d===u){U=null;break}if(h!==null){h.return=v,U=h;break}U=v}}}var g=i.alternate;if(g!==null){var w=g.child;if(w!==null){g.child=null;do{var C=w.sibling;w.sibling=null,w=C}while(w!==null)}}U=i}}if(i.subtreeFlags&2064&&l!==null)l.return=i,U=l;else e:for(;U!==null;){if(i=U,i.flags&2048)switch(i.tag){case 0:case 11:case 15:go(9,i,i.return)}var f=i.sibling;if(f!==null){f.return=i.return,U=f;break e}U=i.return}}var c=e.current;for(U=c;U!==null;){l=U;var m=l.child;if(l.subtreeFlags&2064&&m!==null)m.return=l,U=m;else e:for(l=c;U!==null;){if(a=U,a.flags&2048)try{switch(a.tag){case 0:case 11:case 15:xl(9,a)}}catch(A){be(a,a.return,A)}if(a===l){U=null;break e}var S=a.sibling;if(S!==null){S.return=a.return,U=S;break e}U=a.return}}if(ce=o,zn(),Wt&&typeof Wt.onPostCommitFiberRoot=="function")try{Wt.onPostCommitFiberRoot(dl,e)}catch{}r=!0}return r}finally{pe=n,kt.transition=t}}return!1}function Jc(e,t,n){t=zr(n,t),t=xp(e,t,1),e=Cn(e,t,1),t=Je(),e!==null&&(Fo(e,1,t),it(e,t))}function be(e,t,n){if(e.tag===3)Jc(e,e,n);else for(;t!==null;){if(t.tag===3){Jc(t,e,n);break}else if(t.tag===1){var r=t.stateNode;if(typeof t.type.getDerivedStateFromError=="function"||typeof r.componentDidCatch=="function"&&(En===null||!En.has(r))){e=zr(n,e),e=Sp(t,e,1),t=Cn(t,e,1),e=Je(),t!==null&&(Fo(t,1,e),it(t,e));break}}t=t.return}}function K1(e,t,n){var r=e.pingCache;r!==null&&r.delete(t),t=Je(),e.pingedLanes|=e.suspendedLanes&n,je===e&&(Fe&n)===n&&(Te===4||Te===3&&(Fe&130023424)===Fe&&500>Pe()-hu?Bn(e,0):mu|=n),it(e,t)}function Fp(e,t){t===0&&(e.mode&1?(t=ri,ri<<=1,!(ri&130023424)&&(ri=4194304)):t=1);var n=Je();e=on(e,t),e!==null&&(Fo(e,t,n),it(e,n))}function Z1(e){var t=e.memoizedState,n=0;t!==null&&(n=t.retryLane),Fp(e,n)}function J1(e,t){var n=0;switch(e.tag){case 13:var r=e.stateNode,o=e.memoizedState;o!==null&&(n=o.retryLane);break;case 19:r=e.stateNode;break;default:throw Error(L(314))}r!==null&&r.delete(t),Fp(e,n)}var Bp;Bp=function(e,t,n){if(e!==null)if(e.memoizedProps!==t.pendingProps||rt.current)nt=!0;else{if(!(e.lanes&n)&&!(t.flags&128))return nt=!1,D1(e,t,n);nt=!!(e.flags&131072)}else nt=!1,ke&&t.flags&1048576&&Wd(t,Wi,t.index);switch(t.lanes=0,t.tag){case 2:var r=t.type;Ri(e,t),e=t.pendingProps;var o=_r(t,Ye.current);Nr(t,n),o=su(null,t,r,e,o,n);var i=uu();return t.flags|=1,typeof o=="object"&&o!==null&&typeof o.render=="function"&&o.$$typeof===void 0?(t.tag=1,t.memoizedState=null,t.updateQueue=null,ot(r)?(i=!0,Vi(t)):i=!1,t.memoizedState=o.state!==null&&o.state!==void 0?o.state:null,ru(t),o.updater=yl,t.stateNode=o,o._reactInternals=t,es(t,r,e,n),t=rs(null,t,r,!0,i,n)):(t.tag=0,ke&&i&&Ks(t),Ze(null,t,o,n),t=t.child),t;case 16:r=t.elementType;e:{switch(Ri(e,t),e=t.pendingProps,o=r._init,r=o(r._payload),t.type=r,o=t.tag=e0(r),e=_t(r,e),o){case 0:t=ns(null,t,r,e,n);break e;case 1:t=Bc(null,t,r,e,n);break e;case 11:t=Uc(null,t,r,e,n);break e;case 14:t=Fc(null,t,r,_t(r.type,e),n);break e}throw Error(L(306,r,""))}return t;case 0:return r=t.type,o=t.pendingProps,o=t.elementType===r?o:_t(r,o),ns(e,t,r,o,n);case 1:return r=t.type,o=t.pendingProps,o=t.elementType===r?o:_t(r,o),Bc(e,t,r,o,n);case 3:e:{if(Ap(t),e===null)throw Error(L(387));r=t.pendingProps,i=t.memoizedState,o=i.element,Xd(e,t),Yi(t,r,null,n);var l=t.memoizedState;if(r=l.element,i.isDehydrated)if(i={element:r,isDehydrated:!1,cache:l.cache,pendingSuspenseBoundaries:l.pendingSuspenseBoundaries,transitions:l.transitions},t.updateQueue.baseState=i,t.memoizedState=i,t.flags&256){o=zr(Error(L(423)),t),t=Vc(e,t,r,n,o);break e}else if(r!==o){o=zr(Error(L(424)),t),t=Vc(e,t,r,n,o);break e}else for(ut=kn(t.stateNode.containerInfo.firstChild),ft=t,ke=!0,It=null,n=qd(t,null,r,n),t.child=n;n;)n.flags=n.flags&-3|4096,n=n.sibling;else{if(Or(),r===o){t=ln(e,t,n);break e}Ze(e,t,r,n)}t=t.child}return t;case 5:return ep(t),e===null&&Za(t),r=t.type,o=t.pendingProps,i=e!==null?e.memoizedProps:null,l=o.children,Qa(r,o)?l=null:i!==null&&Qa(r,i)&&(t.flags|=32),Ep(e,t),Ze(e,t,l,n),t.child;case 6:return e===null&&Za(t),null;case 13:return Np(e,t,n);case 4:return ou(t,t.stateNode.containerInfo),r=t.pendingProps,e===null?t.child=Ir(t,null,r,n):Ze(e,t,r,n),t.child;case 11:return r=t.type,o=t.pendingProps,o=t.elementType===r?o:_t(r,o),Uc(e,t,r,o,n);case 7:return Ze(e,t,t.pendingProps,n),t.child;case 8:return Ze(e,t,t.pendingProps.children,n),t.child;case 12:return Ze(e,t,t.pendingProps.children,n),t.child;case 10:e:{if(r=t.type._context,o=t.pendingProps,i=t.memoizedProps,l=o.value,ve(Qi,r._currentValue),r._currentValue=l,i!==null)if($t(i.value,l)){if(i.children===o.children&&!rt.current){t=ln(e,t,n);break e}}else for(i=t.child,i!==null&&(i.return=t);i!==null;){var a=i.dependencies;if(a!==null){l=i.child;for(var s=a.firstContext;s!==null;){if(s.context===r){if(i.tag===1){s=tn(-1,n&-n),s.tag=2;var u=i.updateQueue;if(u!==null){u=u.shared;var d=u.pending;d===null?s.next=s:(s.next=d.next,d.next=s),u.pending=s}}i.lanes|=n,s=i.alternate,s!==null&&(s.lanes|=n),Ja(i.return,n,t),a.lanes|=n;break}s=s.next}}else if(i.tag===10)l=i.type===t.type?null:i.child;else if(i.tag===18){if(l=i.return,l===null)throw Error(L(341));l.lanes|=n,a=l.alternate,a!==null&&(a.lanes|=n),Ja(l,n,t),l=i.sibling}else l=i.child;if(l!==null)l.return=i;else for(l=i;l!==null;){if(l===t){l=null;break}if(i=l.sibling,i!==null){i.return=l.return,l=i;break}l=l.return}i=l}Ze(e,t,o.children,n),t=t.child}return t;case 9:return o=t.type,r=t.pendingProps.children,Nr(t,n),o=Ct(o),r=r(o),t.flags|=1,Ze(e,t,r,n),t.child;case 14:return r=t.type,o=_t(r,t.pendingProps),o=_t(r.type,o),Fc(e,t,r,o,n);case 15:return kp(e,t,t.type,t.pendingProps,n);case 17:return r=t.type,o=t.pendingProps,o=t.elementType===r?o:_t(r,o),Ri(e,t),t.tag=1,ot(r)?(e=!0,Vi(t)):e=!1,Nr(t,n),Zd(t,r,o),es(t,r,o,n),rs(null,t,r,!0,e,n);case 19:return bp(e,t,n);case 22:return Cp(e,t,n)}throw Error(L(156,t.tag))};function Vp(e,t){return hd(e,t)}function q1(e,t,n,r){this.tag=e,this.key=n,this.sibling=this.child=this.return=this.stateNode=this.type=this.elementType=null,this.index=0,this.ref=null,this.pendingProps=t,this.dependencies=this.memoizedState=this.updateQueue=this.memoizedProps=null,this.mode=r,this.subtreeFlags=this.flags=0,this.deletions=null,this.childLanes=this.lanes=0,this.alternate=null}function St(e,t,n,r){return new q1(e,t,n,r)}function wu(e){return e=e.prototype,!(!e||!e.isReactComponent)}function e0(e){if(typeof e=="function")return wu(e)?1:0;if(e!=null){if(e=e.$$typeof,e===js)return 11;if(e===Ds)return 14}return 2}function Nn(e,t){var n=e.alternate;return n===null?(n=St(e.tag,t,e.key,e.mode),n.elementType=e.elementType,n.type=e.type,n.stateNode=e.stateNode,n.alternate=e,e.alternate=n):(n.pendingProps=t,n.type=e.type,n.flags=0,n.subtreeFlags=0,n.deletions=null),n.flags=e.flags&14680064,n.childLanes=e.childLanes,n.lanes=e.lanes,n.child=e.child,n.memoizedProps=e.memoizedProps,n.memoizedState=e.memoizedState,n.updateQueue=e.updateQueue,t=e.dependencies,n.dependencies=t===null?null:{lanes:t.lanes,firstContext:t.firstContext},n.sibling=e.sibling,n.index=e.index,n.ref=e.ref,n}function _i(e,t,n,r,o,i){var l=2;if(r=e,typeof e=="function")wu(e)&&(l=1);else if(typeof e=="string")l=5;else e:switch(e){case cr:return Vn(n.children,o,i,t);case $s:l=8,o|=8;break;case Ea:return e=St(12,n,t,o|2),e.elementType=Ea,e.lanes=i,e;case Aa:return e=St(13,n,t,o),e.elementType=Aa,e.lanes=i,e;case Na:return e=St(19,n,t,o),e.elementType=Na,e.lanes=i,e;case Jf:return kl(n,o,i,t);default:if(typeof e=="object"&&e!==null)switch(e.$$typeof){case Kf:l=10;break e;case Zf:l=9;break e;case js:l=11;break e;case Ds:l=14;break e;case dn:l=16,r=null;break e}throw Error(L(130,e==null?e:typeof e,""))}return t=St(l,n,t,o),t.elementType=e,t.type=r,t.lanes=i,t}function Vn(e,t,n,r){return e=St(7,e,r,t),e.lanes=n,e}function kl(e,t,n,r){return e=St(22,e,r,t),e.elementType=Jf,e.lanes=n,e.stateNode={isHidden:!1},e}function ga(e,t,n){return e=St(6,e,null,t),e.lanes=n,e}function va(e,t,n){return t=St(4,e.children!==null?e.children:[],e.key,t),t.lanes=n,t.stateNode={containerInfo:e.containerInfo,pendingChildren:null,implementation:e.implementation},t}function t0(e,t,n,r,o){this.tag=t,this.containerInfo=e,this.finishedWork=this.pingCache=this.current=this.pendingChildren=null,this.timeoutHandle=-1,this.callbackNode=this.pendingContext=this.context=null,this.callbackPriority=0,this.eventTimes=Zl(0),this.expirationTimes=Zl(-1),this.entangledLanes=this.finishedLanes=this.mutableReadLanes=this.expiredLanes=this.pingedLanes=this.suspendedLanes=this.pendingLanes=0,this.entanglements=Zl(0),this.identifierPrefix=r,this.onRecoverableError=o,this.mutableSourceEagerHydrationData=null}function xu(e,t,n,r,o,i,l,a,s){return e=new t0(e,t,n,a,s),t===1?(t=1,i===!0&&(t|=8)):t=0,i=St(3,null,null,t),e.current=i,i.stateNode=e,i.memoizedState={element:r,isDehydrated:n,cache:null,transitions:null,pendingSuspenseBoundaries:null},ru(i),e}function n0(e,t,n){var r=3<arguments.length&&arguments[3]!==void 0?arguments[3]:null;return{$$typeof:ur,key:r==null?null:""+r,children:e,containerInfo:t,implementation:n}}function Hp(e){if(!e)return Ln;e=e._reactInternals;e:{if(qn(e)!==e||e.tag!==1)throw Error(L(170));var t=e;do{switch(t.tag){case 3:t=t.stateNode.context;break e;case 1:if(ot(t.type)){t=t.stateNode.__reactInternalMemoizedMergedChildContext;break e}}t=t.return}while(t!==null);throw Error(L(171))}if(e.tag===1){var n=e.type;if(ot(n))return Vd(e,n,t)}return t}function Wp(e,t,n,r,o,i,l,a,s){return e=xu(n,r,!0,e,o,i,l,a,s),e.context=Hp(null),n=e.current,r=Je(),o=An(n),i=tn(r,o),i.callback=t??null,Cn(n,i,o),e.current.lanes=o,Fo(e,o,r),it(e,r),e}function Cl(e,t,n,r){var o=t.current,i=Je(),l=An(o);return n=Hp(n),t.context===null?t.context=n:t.pendingContext=n,t=tn(i,l),t.payload={element:e},r=r===void 0?null:r,r!==null&&(t.callback=r),e=Cn(o,t,l),e!==null&&(Mt(e,o,l,i),Ai(e,o,l)),l}function nl(e){if(e=e.current,!e.child)return null;switch(e.child.tag){case 5:return e.child.stateNode;default:return e.child.stateNode}}function qc(e,t){if(e=e.memoizedState,e!==null&&e.dehydrated!==null){var n=e.retryLane;e.retryLane=n!==0&&n<t?n:t}}function Su(e,t){qc(e,t),(e=e.alternate)&&qc(e,t)}function r0(){return null}var Qp=typeof reportError=="function"?reportError:function(e){console.error(e)};function ku(e){this._internalRoot=e}El.prototype.render=ku.prototype.render=function(e){var t=this._internalRoot;if(t===null)throw Error(L(409));Cl(e,t,null,null)};El.prototype.unmount=ku.prototype.unmount=function(){var e=this._internalRoot;if(e!==null){this._internalRoot=null;var t=e.containerInfo;Yn(function(){Cl(null,e,null,null)}),t[rn]=null}};function El(e){this._internalRoot=e}El.prototype.unstable_scheduleHydration=function(e){if(e){var t=kd();e={blockedOn:null,target:e,priority:t};for(var n=0;n<mn.length&&t!==0&&t<mn[n].priority;n++);mn.splice(n,0,e),n===0&&Ed(e)}};function Cu(e){return!(!e||e.nodeType!==1&&e.nodeType!==9&&e.nodeType!==11)}function Al(e){return!(!e||e.nodeType!==1&&e.nodeType!==9&&e.nodeType!==11&&(e.nodeType!==8||e.nodeValue!==" react-mount-point-unstable "))}function ef(){}function o0(e,t,n,r,o){if(o){if(typeof r=="function"){var i=r;r=function(){var u=nl(l);i.call(u)}}var l=Wp(t,r,e,0,null,!1,!1,"",ef);return e._reactRootContainer=l,e[rn]=l.current,Ro(e.nodeType===8?e.parentNode:e),Yn(),l}for(;o=e.lastChild;)e.removeChild(o);if(typeof r=="function"){var a=r;r=function(){var u=nl(s);a.call(u)}}var s=xu(e,0,!1,null,null,!1,!1,"",ef);return e._reactRootContainer=s,e[rn]=s.current,Ro(e.nodeType===8?e.parentNode:e),Yn(function(){Cl(t,s,n,r)}),s}function Nl(e,t,n,r,o){var i=n._reactRootContainer;if(i){var l=i;if(typeof o=="function"){var a=o;o=function(){var s=nl(l);a.call(s)}}Cl(t,l,e,o)}else l=o0(n,t,e,o,r);return nl(l)}xd=function(e){switch(e.tag){case 3:var t=e.stateNode;if(t.current.memoizedState.isDehydrated){var n=lo(t.pendingLanes);n!==0&&(Bs(t,n|1),it(t,Pe()),!(ce&6)&&(Mr=Pe()+500,zn()))}break;case 13:Yn(function(){var r=on(e,1);if(r!==null){var o=Je();Mt(r,e,1,o)}}),Su(e,1)}};Vs=function(e){if(e.tag===13){var t=on(e,134217728);if(t!==null){var n=Je();Mt(t,e,134217728,n)}Su(e,134217728)}};Sd=function(e){if(e.tag===13){var t=An(e),n=on(e,t);if(n!==null){var r=Je();Mt(n,e,t,r)}Su(e,t)}};kd=function(){return pe};Cd=function(e,t){var n=pe;try{return pe=e,t()}finally{pe=n}};Ma=function(e,t,n){switch(t){case"input":if(Pa(e,n),t=n.name,n.type==="radio"&&t!=null){for(n=e;n.parentNode;)n=n.parentNode;for(n=n.querySelectorAll("input[name="+JSON.stringify(""+t)+'][type="radio"]'),t=0;t<n.length;t++){var r=n[t];if(r!==e&&r.form===e.form){var o=gl(r);if(!o)throw Error(L(90));ed(r),Pa(r,o)}}}break;case"textarea":nd(e,n);break;case"select":t=n.value,t!=null&&kr(e,!!n.multiple,t,!1)}};ud=gu;cd=Yn;var i0={usingClientEntryPoint:!1,Events:[Vo,mr,gl,ad,sd,gu]},ro={findFiberByHostInstance:Dn,bundleType:0,version:"18.2.0",rendererPackageName:"react-dom"},l0={bundleType:ro.bundleType,version:ro.version,rendererPackageName:ro.rendererPackageName,rendererConfig:ro.rendererConfig,overrideHookState:null,overrideHookStateDeletePath:null,overrideHookStateRenamePath:null,overrideProps:null,overridePropsDeletePath:null,overridePropsRenamePath:null,setErrorHandler:null,setSuspenseHandler:null,scheduleUpdate:null,currentDispatcherRef:un.ReactCurrentDispatcher,findHostInstanceByFiber:function(e){return e=pd(e),e===null?null:e.stateNode},findFiberByHostInstance:ro.findFiberByHostInstance||r0,findHostInstancesForRefresh:null,scheduleRefresh:null,scheduleRoot:null,setRefreshHandler:null,getCurrentFiber:null,reconcilerVersion:"18.2.0-next-9e3b772b8-20220608"};if(typeof __REACT_DEVTOOLS_GLOBAL_HOOK__<"u"){var mi=__REACT_DEVTOOLS_GLOBAL_HOOK__;if(!mi.isDisabled&&mi.supportsFiber)try{dl=mi.inject(l0),Wt=mi}catch{}}mt.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED=i0;mt.createPortal=function(e,t){var n=2<arguments.length&&arguments[2]!==void 0?arguments[2]:null;if(!Cu(t))throw Error(L(200));return n0(e,t,null,n)};mt.createRoot=function(e,t){if(!Cu(e))throw Error(L(299));var n=!1,r="",o=Qp;return t!=null&&(t.unstable_strictMode===!0&&(n=!0),t.identifierPrefix!==void 0&&(r=t.identifierPrefix),t.onRecoverableError!==void 0&&(o=t.onRecoverableError)),t=xu(e,1,!1,null,null,n,!1,r,o),e[rn]=t.current,Ro(e.nodeType===8?e.parentNode:e),new ku(t)};mt.findDOMNode=function(e){if(e==null)return null;if(e.nodeType===1)return e;var t=e._reactInternals;if(t===void 0)throw typeof e.render=="function"?Error(L(188)):(e=Object.keys(e).join(","),Error(L(268,e)));return e=pd(t),e=e===null?null:e.stateNode,e};mt.flushSync=function(e){return Yn(e)};mt.hydrate=function(e,t,n){if(!Al(t))throw Error(L(200));return Nl(null,e,t,!0,n)};mt.hydrateRoot=function(e,t,n){if(!Cu(e))throw Error(L(405));var r=n!=null&&n.hydratedSources||null,o=!1,i="",l=Qp;if(n!=null&&(n.unstable_strictMode===!0&&(o=!0),n.identifierPrefix!==void 0&&(i=n.identifierPrefix),n.onRecoverableError!==void 0&&(l=n.onRecoverableError)),t=Wp(t,null,e,1,n??null,o,!1,i,l),e[rn]=t.current,Ro(e),r)for(e=0;e<r.length;e++)n=r[e],o=n._getVersion,o=o(n._source),t.mutableSourceEagerHydrationData==null?t.mutableSourceEagerHydrationData=[n,o]:t.mutableSourceEagerHydrationData.push(n,o);return new El(t)};mt.render=function(e,t,n){if(!Al(t))throw Error(L(200));return Nl(null,e,t,!1,n)};mt.unmountComponentAtNode=function(e){if(!Al(e))throw Error(L(40));return e._reactRootContainer?(Yn(function(){Nl(null,null,e,!1,function(){e._reactRootContainer=null,e[rn]=null})}),!0):!1};mt.unstable_batchedUpdates=gu;mt.unstable_renderSubtreeIntoContainer=function(e,t,n,r){if(!Al(n))throw Error(L(200));if(e==null||e._reactInternals===void 0)throw Error(L(38));return Nl(e,t,n,!1,r)};mt.version="18.2.0-next-9e3b772b8-20220608";function Gp(){if(!(typeof __REACT_DEVTOOLS_GLOBAL_HOOK__>"u"||typeof __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE!="function"))try{__REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE(Gp)}catch(e){console.error(e)}}Gp(),$f.exports=mt;var a0=$f.exports,tf=a0;ka.createRoot=tf.createRoot,ka.hydrateRoot=tf.hydrateRoot;const Yp=(e,t)=>{const n=x.useRef(t);x.useEffect(()=>{n.current=t;const r=o=>{const{action:i,data:l}=o.data;n.current&&i===e&&n.current(l)};return window.addEventListener("message",r),()=>{window.removeEventListener("message",r)}},[e,t])},Xp=()=>!window.invokeNative,an=async(e,t,n)=>{const r={method:"post",headers:{"Content-Type":"application/json; charset=UTF-8"},body:JSON.stringify(t)};if(Xp()&&n)return n;const o=window.GetParentResourceName?window.GetParentResourceName():"decrypt-store",i=await fetch(`https://${o}/${e}`,r);if(!i.ok)throw new Error(`Erro ao fazer chamada da API: ${i.status} - ${i.statusText}`);return await i.json()};/**
 * @remix-run/router v1.9.0
 *
 * Copyright (c) Remix Software Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE.md file in the root directory of this source tree.
 *
 * @license MIT
 */function $o(){return $o=Object.assign?Object.assign.bind():function(e){for(var t=1;t<arguments.length;t++){var n=arguments[t];for(var r in n)Object.prototype.hasOwnProperty.call(n,r)&&(e[r]=n[r])}return e},$o.apply(this,arguments)}var yn;(function(e){e.Pop="POP",e.Push="PUSH",e.Replace="REPLACE"})(yn||(yn={}));const nf="popstate";function s0(e){e===void 0&&(e={});function t(o,i){let{pathname:l="/",search:a="",hash:s=""}=er(o.location.hash.substr(1));return!l.startsWith("/")&&!l.startsWith(".")&&(l="/"+l),hs("",{pathname:l,search:a,hash:s},i.state&&i.state.usr||null,i.state&&i.state.key||"default")}function n(o,i){let l=o.document.querySelector("base"),a="";if(l&&l.getAttribute("href")){let s=o.location.href,u=s.indexOf("#");a=u===-1?s:s.slice(0,u)}return a+"#"+(typeof i=="string"?i:rl(i))}function r(o,i){bl(o.pathname.charAt(0)==="/","relative pathnames are not supported in hash history.push("+JSON.stringify(i)+")")}return c0(t,n,r,e)}function Oe(e,t){if(e===!1||e===null||typeof e>"u")throw new Error(t)}function bl(e,t){if(!e){typeof console<"u"&&console.warn(t);try{throw new Error(t)}catch{}}}function u0(){return Math.random().toString(36).substr(2,8)}function rf(e,t){return{usr:e.state,key:e.key,idx:t}}function hs(e,t,n,r){return n===void 0&&(n=null),$o({pathname:typeof e=="string"?e:e.pathname,search:"",hash:""},typeof t=="string"?er(t):t,{state:n,key:t&&t.key||r||u0()})}function rl(e){let{pathname:t="/",search:n="",hash:r=""}=e;return n&&n!=="?"&&(t+=n.charAt(0)==="?"?n:"?"+n),r&&r!=="#"&&(t+=r.charAt(0)==="#"?r:"#"+r),t}function er(e){let t={};if(e){let n=e.indexOf("#");n>=0&&(t.hash=e.substr(n),e=e.substr(0,n));let r=e.indexOf("?");r>=0&&(t.search=e.substr(r),e=e.substr(0,r)),e&&(t.pathname=e)}return t}function c0(e,t,n,r){r===void 0&&(r={});let{window:o=document.defaultView,v5Compat:i=!1}=r,l=o.history,a=yn.Pop,s=null,u=d();u==null&&(u=0,l.replaceState($o({},l.state,{idx:u}),""));function d(){return(l.state||{idx:null}).idx}function p(){a=yn.Pop;let C=d(),f=C==null?null:C-u;u=C,s&&s({action:a,location:w.location,delta:f})}function h(C,f){a=yn.Push;let c=hs(w.location,C,f);n&&n(c,C),u=d()+1;let m=rf(c,u),S=w.createHref(c);try{l.pushState(m,"",S)}catch(A){if(A instanceof DOMException&&A.name==="DataCloneError")throw A;o.location.assign(S)}i&&s&&s({action:a,location:w.location,delta:1})}function v(C,f){a=yn.Replace;let c=hs(w.location,C,f);n&&n(c,C),u=d();let m=rf(c,u),S=w.createHref(c);l.replaceState(m,"",S),i&&s&&s({action:a,location:w.location,delta:0})}function g(C){let f=o.location.origin!=="null"?o.location.origin:o.location.href,c=typeof C=="string"?C:rl(C);return Oe(f,"No window.location.(origin|href) available to create URL for href: "+c),new URL(c,f)}let w={get action(){return a},get location(){return e(o,l)},listen(C){if(s)throw new Error("A history only accepts one active listener");return o.addEventListener(nf,p),s=C,()=>{o.removeEventListener(nf,p),s=null}},createHref(C){return t(o,C)},createURL:g,encodeLocation(C){let f=g(C);return{pathname:f.pathname,search:f.search,hash:f.hash}},push:h,replace:v,go(C){return l.go(C)}};return w}var of;(function(e){e.data="data",e.deferred="deferred",e.redirect="redirect",e.error="error"})(of||(of={}));function f0(e,t,n){n===void 0&&(n="/");let r=typeof t=="string"?er(t):t,o=Eu(r.pathname||"/",n);if(o==null)return null;let i=Kp(e);d0(i);let l=null;for(let a=0;l==null&&a<i.length;++a)l=S0(i[a],E0(o));return l}function Kp(e,t,n,r){t===void 0&&(t=[]),n===void 0&&(n=[]),r===void 0&&(r="");let o=(i,l,a)=>{let s={relativePath:a===void 0?i.path||"":a,caseSensitive:i.caseSensitive===!0,childrenIndex:l,route:i};s.relativePath.startsWith("/")&&(Oe(s.relativePath.startsWith(r),'Absolute route path "'+s.relativePath+'" nested under path '+('"'+r+'" is not valid. An absolute child route path ')+"must start with the combined path of all its parent routes."),s.relativePath=s.relativePath.slice(r.length));let u=bn([r,s.relativePath]),d=n.concat(s);i.children&&i.children.length>0&&(Oe(i.index!==!0,"Index routes must not have child routes. Please remove "+('all child routes from route path "'+u+'".')),Kp(i.children,t,d,u)),!(i.path==null&&!i.index)&&t.push({path:u,score:w0(u,i.index),routesMeta:d})};return e.forEach((i,l)=>{var a;if(i.path===""||!((a=i.path)!=null&&a.includes("?")))o(i,l);else for(let s of Zp(i.path))o(i,l,s)}),t}function Zp(e){let t=e.split("/");if(t.length===0)return[];let[n,...r]=t,o=n.endsWith("?"),i=n.replace(/\?$/,"");if(r.length===0)return o?[i,""]:[i];let l=Zp(r.join("/")),a=[];return a.push(...l.map(s=>s===""?i:[i,s].join("/"))),o&&a.push(...l),a.map(s=>e.startsWith("/")&&s===""?"/":s)}function d0(e){e.sort((t,n)=>t.score!==n.score?n.score-t.score:x0(t.routesMeta.map(r=>r.childrenIndex),n.routesMeta.map(r=>r.childrenIndex)))}const p0=/^:\w+$/,m0=3,h0=2,g0=1,v0=10,y0=-2,lf=e=>e==="*";function w0(e,t){let n=e.split("/"),r=n.length;return n.some(lf)&&(r+=y0),t&&(r+=h0),n.filter(o=>!lf(o)).reduce((o,i)=>o+(p0.test(i)?m0:i===""?g0:v0),r)}function x0(e,t){return e.length===t.length&&e.slice(0,-1).every((r,o)=>r===t[o])?e[e.length-1]-t[t.length-1]:0}function S0(e,t){let{routesMeta:n}=e,r={},o="/",i=[];for(let l=0;l<n.length;++l){let a=n[l],s=l===n.length-1,u=o==="/"?t:t.slice(o.length)||"/",d=k0({path:a.relativePath,caseSensitive:a.caseSensitive,end:s},u);if(!d)return null;Object.assign(r,d.params);let p=a.route;i.push({params:r,pathname:bn([o,d.pathname]),pathnameBase:R0(bn([o,d.pathnameBase])),route:p}),d.pathnameBase!=="/"&&(o=bn([o,d.pathnameBase]))}return i}function k0(e,t){typeof e=="string"&&(e={path:e,caseSensitive:!1,end:!0});let[n,r]=C0(e.path,e.caseSensitive,e.end),o=t.match(n);if(!o)return null;let i=o[0],l=i.replace(/(.)\/+$/,"$1"),a=o.slice(1);return{params:r.reduce((u,d,p)=>{if(d==="*"){let h=a[p]||"";l=i.slice(0,i.length-h.length).replace(/(.)\/+$/,"$1")}return u[d]=A0(a[p]||"",d),u},{}),pathname:i,pathnameBase:l,pattern:e}}function C0(e,t,n){t===void 0&&(t=!1),n===void 0&&(n=!0),bl(e==="*"||!e.endsWith("*")||e.endsWith("/*"),'Route path "'+e+'" will be treated as if it were '+('"'+e.replace(/\*$/,"/*")+'" because the `*` character must ')+"always follow a `/` in the pattern. To get rid of this warning, "+('please change the route path to "'+e.replace(/\*$/,"/*")+'".'));let r=[],o="^"+e.replace(/\/*\*?$/,"").replace(/^\/*/,"/").replace(/[\\.*+^$?{}|()[\]]/g,"\\$&").replace(/\/:(\w+)/g,(l,a)=>(r.push(a),"/([^\\/]+)"));return e.endsWith("*")?(r.push("*"),o+=e==="*"||e==="/*"?"(.*)$":"(?:\\/(.+)|\\/*)$"):n?o+="\\/*$":e!==""&&e!=="/"&&(o+="(?:(?=\\/|$))"),[new RegExp(o,t?void 0:"i"),r]}function E0(e){try{return decodeURI(e)}catch(t){return bl(!1,'The URL path "'+e+'" could not be decoded because it is is a malformed URL segment. This is probably due to a bad percent '+("encoding ("+t+").")),e}}function A0(e,t){try{return decodeURIComponent(e)}catch(n){return bl(!1,'The value for the URL param "'+t+'" will not be decoded because'+(' the string "'+e+'" is a malformed URL segment. This is probably')+(" due to a bad percent encoding ("+n+").")),e}}function Eu(e,t){if(t==="/")return e;if(!e.toLowerCase().startsWith(t.toLowerCase()))return null;let n=t.endsWith("/")?t.length-1:t.length,r=e.charAt(n);return r&&r!=="/"?null:e.slice(n)||"/"}function N0(e,t){t===void 0&&(t="/");let{pathname:n,search:r="",hash:o=""}=typeof e=="string"?er(e):e;return{pathname:n?n.startsWith("/")?n:b0(n,t):t,search:P0(r),hash:L0(o)}}function b0(e,t){let n=t.replace(/\/+$/,"").split("/");return e.split("/").forEach(o=>{o===".."?n.length>1&&n.pop():o!=="."&&n.push(o)}),n.length>1?n.join("/"):"/"}function ya(e,t,n,r){return"Cannot include a '"+e+"' character in a manually specified "+("`to."+t+"` field ["+JSON.stringify(r)+"].  Please separate it out to the ")+("`to."+n+"` field. Alternatively you may provide the full path as ")+'a string in <Link to="..."> and the router will parse it for you.'}function Jp(e){return e.filter((t,n)=>n===0||t.route.path&&t.route.path.length>0)}function qp(e,t,n,r){r===void 0&&(r=!1);let o;typeof e=="string"?o=er(e):(o=$o({},e),Oe(!o.pathname||!o.pathname.includes("?"),ya("?","pathname","search",o)),Oe(!o.pathname||!o.pathname.includes("#"),ya("#","pathname","hash",o)),Oe(!o.search||!o.search.includes("#"),ya("#","search","hash",o)));let i=e===""||o.pathname==="",l=i?"/":o.pathname,a;if(r||l==null)a=n;else{let p=t.length-1;if(l.startsWith("..")){let h=l.split("/");for(;h[0]==="..";)h.shift(),p-=1;o.pathname=h.join("/")}a=p>=0?t[p]:"/"}let s=N0(o,a),u=l&&l!=="/"&&l.endsWith("/"),d=(i||l===".")&&n.endsWith("/");return!s.pathname.endsWith("/")&&(u||d)&&(s.pathname+="/"),s}const bn=e=>e.join("/").replace(/\/\/+/g,"/"),R0=e=>e.replace(/\/+$/,"").replace(/^\/*/,"/"),P0=e=>!e||e==="?"?"":e.startsWith("?")?e:"?"+e,L0=e=>!e||e==="#"?"":e.startsWith("#")?e:"#"+e;function _0(e){return e!=null&&typeof e.status=="number"&&typeof e.statusText=="string"&&typeof e.internal=="boolean"&&"data"in e}const em=["post","put","patch","delete"];new Set(em);const O0=["get",...em];new Set(O0);/**
 * React Router v6.16.0
 *
 * Copyright (c) Remix Software Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE.md file in the root directory of this source tree.
 *
 * @license MIT
 */function ol(){return ol=Object.assign?Object.assign.bind():function(e){for(var t=1;t<arguments.length;t++){var n=arguments[t];for(var r in n)Object.prototype.hasOwnProperty.call(n,r)&&(e[r]=n[r])}return e},ol.apply(this,arguments)}const Au=x.createContext(null),I0=x.createContext(null),Br=x.createContext(null),Rl=x.createContext(null),tr=x.createContext({outlet:null,matches:[],isDataRoute:!1}),tm=x.createContext(null);function T0(e,t){let{relative:n}=t===void 0?{}:t;Wo()||Oe(!1);let{basename:r,navigator:o}=x.useContext(Br),{hash:i,pathname:l,search:a}=om(e,{relative:n}),s=l;return r!=="/"&&(s=l==="/"?r:bn([r,l])),o.createHref({pathname:s,search:a,hash:i})}function Wo(){return x.useContext(Rl)!=null}function Pl(){return Wo()||Oe(!1),x.useContext(Rl).location}function nm(e){x.useContext(Br).static||x.useLayoutEffect(e)}function rm(){let{isDataRoute:e}=x.useContext(tr);return e?G0():z0()}function z0(){Wo()||Oe(!1);let e=x.useContext(Au),{basename:t,navigator:n}=x.useContext(Br),{matches:r}=x.useContext(tr),{pathname:o}=Pl(),i=JSON.stringify(Jp(r).map(s=>s.pathnameBase)),l=x.useRef(!1);return nm(()=>{l.current=!0}),x.useCallback(function(s,u){if(u===void 0&&(u={}),!l.current)return;if(typeof s=="number"){n.go(s);return}let d=qp(s,JSON.parse(i),o,u.relative==="path");e==null&&t!=="/"&&(d.pathname=d.pathname==="/"?t:bn([t,d.pathname])),(u.replace?n.replace:n.push)(d,u.state,u)},[t,n,i,o,e])}function om(e,t){let{relative:n}=t===void 0?{}:t,{matches:r}=x.useContext(tr),{pathname:o}=Pl(),i=JSON.stringify(Jp(r).map(l=>l.pathnameBase));return x.useMemo(()=>qp(e,JSON.parse(i),o,n==="path"),[e,i,o,n])}function M0(e,t){return $0(e,t)}function $0(e,t,n){Wo()||Oe(!1);let{navigator:r}=x.useContext(Br),{matches:o}=x.useContext(tr),i=o[o.length-1],l=i?i.params:{};i&&i.pathname;let a=i?i.pathnameBase:"/";i&&i.route;let s=Pl(),u;if(t){var d;let w=typeof t=="string"?er(t):t;a==="/"||(d=w.pathname)!=null&&d.startsWith(a)||Oe(!1),u=w}else u=s;let p=u.pathname||"/",h=a==="/"?p:p.slice(a.length)||"/",v=f0(e,{pathname:h}),g=B0(v&&v.map(w=>Object.assign({},w,{params:Object.assign({},l,w.params),pathname:bn([a,r.encodeLocation?r.encodeLocation(w.pathname).pathname:w.pathname]),pathnameBase:w.pathnameBase==="/"?a:bn([a,r.encodeLocation?r.encodeLocation(w.pathnameBase).pathname:w.pathnameBase])})),o,n);return t&&g?x.createElement(Rl.Provider,{value:{location:ol({pathname:"/",search:"",hash:"",state:null,key:"default"},u),navigationType:yn.Pop}},g):g}function j0(){let e=Q0(),t=_0(e)?e.status+" "+e.statusText:e instanceof Error?e.message:JSON.stringify(e),n=e instanceof Error?e.stack:null,o={padding:"0.5rem",backgroundColor:"rgba(200,200,200, 0.5)"},i=null;return x.createElement(x.Fragment,null,x.createElement("h2",null,"Unexpected Application Error!"),x.createElement("h3",{style:{fontStyle:"italic"}},t),n?x.createElement("pre",{style:o},n):null,i)}const D0=x.createElement(j0,null);class U0 extends x.Component{constructor(t){super(t),this.state={location:t.location,revalidation:t.revalidation,error:t.error}}static getDerivedStateFromError(t){return{error:t}}static getDerivedStateFromProps(t,n){return n.location!==t.location||n.revalidation!=="idle"&&t.revalidation==="idle"?{error:t.error,location:t.location,revalidation:t.revalidation}:{error:t.error||n.error,location:n.location,revalidation:t.revalidation||n.revalidation}}componentDidCatch(t,n){console.error("React Router caught the following error during render",t,n)}render(){return this.state.error?x.createElement(tr.Provider,{value:this.props.routeContext},x.createElement(tm.Provider,{value:this.state.error,children:this.props.component})):this.props.children}}function F0(e){let{routeContext:t,match:n,children:r}=e,o=x.useContext(Au);return o&&o.static&&o.staticContext&&(n.route.errorElement||n.route.ErrorBoundary)&&(o.staticContext._deepestRenderedBoundaryId=n.route.id),x.createElement(tr.Provider,{value:t},r)}function B0(e,t,n){var r;if(t===void 0&&(t=[]),n===void 0&&(n=null),e==null){var o;if((o=n)!=null&&o.errors)e=n.matches;else return null}let i=e,l=(r=n)==null?void 0:r.errors;if(l!=null){let a=i.findIndex(s=>s.route.id&&(l==null?void 0:l[s.route.id]));a>=0||Oe(!1),i=i.slice(0,Math.min(i.length,a+1))}return i.reduceRight((a,s,u)=>{let d=s.route.id?l==null?void 0:l[s.route.id]:null,p=null;n&&(p=s.route.errorElement||D0);let h=t.concat(i.slice(0,u+1)),v=()=>{let g;return d?g=p:s.route.Component?g=x.createElement(s.route.Component,null):s.route.element?g=s.route.element:g=a,x.createElement(F0,{match:s,routeContext:{outlet:a,matches:h,isDataRoute:n!=null},children:g})};return n&&(s.route.ErrorBoundary||s.route.errorElement||u===0)?x.createElement(U0,{location:n.location,revalidation:n.revalidation,component:p,error:d,children:v(),routeContext:{outlet:null,matches:h,isDataRoute:!0}}):v()},null)}var im=function(e){return e.UseBlocker="useBlocker",e.UseRevalidator="useRevalidator",e.UseNavigateStable="useNavigate",e}(im||{}),il=function(e){return e.UseBlocker="useBlocker",e.UseLoaderData="useLoaderData",e.UseActionData="useActionData",e.UseRouteError="useRouteError",e.UseNavigation="useNavigation",e.UseRouteLoaderData="useRouteLoaderData",e.UseMatches="useMatches",e.UseRevalidator="useRevalidator",e.UseNavigateStable="useNavigate",e.UseRouteId="useRouteId",e}(il||{});function V0(e){let t=x.useContext(Au);return t||Oe(!1),t}function H0(e){let t=x.useContext(I0);return t||Oe(!1),t}function W0(e){let t=x.useContext(tr);return t||Oe(!1),t}function lm(e){let t=W0(),n=t.matches[t.matches.length-1];return n.route.id||Oe(!1),n.route.id}function Q0(){var e;let t=x.useContext(tm),n=H0(il.UseRouteError),r=lm(il.UseRouteError);return t||((e=n.errors)==null?void 0:e[r])}function G0(){let{router:e}=V0(im.UseNavigateStable),t=lm(il.UseNavigateStable),n=x.useRef(!1);return nm(()=>{n.current=!0}),x.useCallback(function(o,i){i===void 0&&(i={}),n.current&&(typeof o=="number"?e.navigate(o):e.navigate(o,ol({fromRouteId:t},i)))},[e,t])}function so(e){Oe(!1)}function Y0(e){let{basename:t="/",children:n=null,location:r,navigationType:o=yn.Pop,navigator:i,static:l=!1}=e;Wo()&&Oe(!1);let a=t.replace(/^\/*/,"/"),s=x.useMemo(()=>({basename:a,navigator:i,static:l}),[a,i,l]);typeof r=="string"&&(r=er(r));let{pathname:u="/",search:d="",hash:p="",state:h=null,key:v="default"}=r,g=x.useMemo(()=>{let w=Eu(u,a);return w==null?null:{location:{pathname:w,search:d,hash:p,state:h,key:v},navigationType:o}},[a,u,d,p,h,v,o]);return g==null?null:x.createElement(Br.Provider,{value:s},x.createElement(Rl.Provider,{children:n,value:g}))}function X0(e){let{children:t,location:n}=e;return M0(gs(t),n)}new Promise(()=>{});function gs(e,t){t===void 0&&(t=[]);let n=[];return x.Children.forEach(e,(r,o)=>{if(!x.isValidElement(r))return;let i=[...t,o];if(r.type===x.Fragment){n.push.apply(n,gs(r.props.children,i));return}r.type!==so&&Oe(!1),!r.props.index||!r.props.children||Oe(!1);let l={id:r.props.id||i.join("-"),caseSensitive:r.props.caseSensitive,element:r.props.element,Component:r.props.Component,index:r.props.index,path:r.props.path,loader:r.props.loader,action:r.props.action,errorElement:r.props.errorElement,ErrorBoundary:r.props.ErrorBoundary,hasErrorBoundary:r.props.ErrorBoundary!=null||r.props.errorElement!=null,shouldRevalidate:r.props.shouldRevalidate,handle:r.props.handle,lazy:r.props.lazy};r.props.children&&(l.children=gs(r.props.children,i)),n.push(l)}),n}/**
 * React Router DOM v6.16.0
 *
 * Copyright (c) Remix Software Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE.md file in the root directory of this source tree.
 *
 * @license MIT
 */function vs(){return vs=Object.assign?Object.assign.bind():function(e){for(var t=1;t<arguments.length;t++){var n=arguments[t];for(var r in n)Object.prototype.hasOwnProperty.call(n,r)&&(e[r]=n[r])}return e},vs.apply(this,arguments)}function K0(e,t){if(e==null)return{};var n={},r=Object.keys(e),o,i;for(i=0;i<r.length;i++)o=r[i],!(t.indexOf(o)>=0)&&(n[o]=e[o]);return n}function Z0(e){return!!(e.metaKey||e.altKey||e.ctrlKey||e.shiftKey)}function J0(e,t){return e.button===0&&(!t||t==="_self")&&!Z0(e)}const q0=["onClick","relative","reloadDocument","replace","state","target","to","preventScrollReset"],eg="startTransition",af=rh[eg];function tg(e){let{basename:t,children:n,future:r,window:o}=e,i=x.useRef();i.current==null&&(i.current=s0({window:o,v5Compat:!0}));let l=i.current,[a,s]=x.useState({action:l.action,location:l.location}),{v7_startTransition:u}=r||{},d=x.useCallback(p=>{u&&af?af(()=>s(p)):s(p)},[s,u]);return x.useLayoutEffect(()=>l.listen(d),[l,d]),x.createElement(Y0,{basename:t,children:n,location:a.location,navigationType:a.action,navigator:l})}const ng=typeof window<"u"&&typeof window.document<"u"&&typeof window.document.createElement<"u",rg=/^(?:[a-z][a-z0-9+.-]*:|\/\/)/i,hi=x.forwardRef(function(t,n){let{onClick:r,relative:o,reloadDocument:i,replace:l,state:a,target:s,to:u,preventScrollReset:d}=t,p=K0(t,q0),{basename:h}=x.useContext(Br),v,g=!1;if(typeof u=="string"&&rg.test(u)&&(v=u,ng))try{let c=new URL(window.location.href),m=u.startsWith("//")?new URL(c.protocol+u):new URL(u),S=Eu(m.pathname,h);m.origin===c.origin&&S!=null?u=S+m.search+m.hash:g=!0}catch{}let w=T0(u,{relative:o}),C=og(u,{replace:l,state:a,target:s,preventScrollReset:d,relative:o});function f(c){r&&r(c),c.defaultPrevented||C(c)}return x.createElement("a",vs({},p,{href:v||w,onClick:g||i?r:f,ref:n,target:s}))});var sf;(function(e){e.UseScrollRestoration="useScrollRestoration",e.UseSubmit="useSubmit",e.UseSubmitFetcher="useSubmitFetcher",e.UseFetcher="useFetcher"})(sf||(sf={}));var uf;(function(e){e.UseFetchers="useFetchers",e.UseScrollRestoration="useScrollRestoration"})(uf||(uf={}));function og(e,t){let{target:n,replace:r,state:o,preventScrollReset:i,relative:l}=t===void 0?{}:t,a=rm(),s=Pl(),u=om(e,{relative:l});return x.useCallback(d=>{if(J0(d,n)){d.preventDefault();let p=r!==void 0?r:rl(s)===rl(u);a(e,{replace:p,state:o,preventScrollReset:i,relative:l})}},[s,a,u,r,o,n,e,i,l])}var am={exports:{}},Ll={};/**
 * @license React
 * react-jsx-runtime.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */var ig=x,lg=Symbol.for("react.element"),ag=Symbol.for("react.fragment"),sg=Object.prototype.hasOwnProperty,ug=ig.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED.ReactCurrentOwner,cg={key:!0,ref:!0,__self:!0,__source:!0};function sm(e,t,n){var r,o={},i=null,l=null;n!==void 0&&(i=""+n),t.key!==void 0&&(i=""+t.key),t.ref!==void 0&&(l=t.ref);for(r in t)sg.call(t,r)&&!cg.hasOwnProperty(r)&&(o[r]=t[r]);if(e&&e.defaultProps)for(r in t=e.defaultProps,t)o[r]===void 0&&(o[r]=t[r]);return{$$typeof:lg,type:e,key:i,ref:l,props:o,_owner:ug.current}}Ll.Fragment=ag;Ll.jsx=sm;Ll.jsxs=sm;am.exports=Ll;var Nu=am.exports;const y=Nu.jsx,R=Nu.jsxs,Tt=Nu.Fragment,um=x.createContext(null),fg=({children:e})=>{const[t,n]=x.useState(!1),r=rm();Yp("setVisible",n);const o=()=>{Xp()?n(i=>!i):(an("close"),n(!1))};return x.useEffect(()=>{const i=l=>{l.code==="Escape"&&(o(),r("/"))};return window.addEventListener("keydown",i),()=>window.removeEventListener("keydown",i)},[]),y(um.Provider,{value:{visible:t,setVisible:n},children:e})},dg=()=>{const e=x.useContext(um);if(!e)throw new Error("useVisibility must be used within a VisibilityProvider");return e};var cm={exports:{}},me={};/** @license React v16.13.1
 * react-is.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */var De=typeof Symbol=="function"&&Symbol.for,bu=De?Symbol.for("react.element"):60103,Ru=De?Symbol.for("react.portal"):60106,_l=De?Symbol.for("react.fragment"):60107,Ol=De?Symbol.for("react.strict_mode"):60108,Il=De?Symbol.for("react.profiler"):60114,Tl=De?Symbol.for("react.provider"):60109,zl=De?Symbol.for("react.context"):60110,Pu=De?Symbol.for("react.async_mode"):60111,Ml=De?Symbol.for("react.concurrent_mode"):60111,$l=De?Symbol.for("react.forward_ref"):60112,jl=De?Symbol.for("react.suspense"):60113,pg=De?Symbol.for("react.suspense_list"):60120,Dl=De?Symbol.for("react.memo"):60115,Ul=De?Symbol.for("react.lazy"):60116,mg=De?Symbol.for("react.block"):60121,hg=De?Symbol.for("react.fundamental"):60117,gg=De?Symbol.for("react.responder"):60118,vg=De?Symbol.for("react.scope"):60119;function gt(e){if(typeof e=="object"&&e!==null){var t=e.$$typeof;switch(t){case bu:switch(e=e.type,e){case Pu:case Ml:case _l:case Il:case Ol:case jl:return e;default:switch(e=e&&e.$$typeof,e){case zl:case $l:case Ul:case Dl:case Tl:return e;default:return t}}case Ru:return t}}}function fm(e){return gt(e)===Ml}me.AsyncMode=Pu;me.ConcurrentMode=Ml;me.ContextConsumer=zl;me.ContextProvider=Tl;me.Element=bu;me.ForwardRef=$l;me.Fragment=_l;me.Lazy=Ul;me.Memo=Dl;me.Portal=Ru;me.Profiler=Il;me.StrictMode=Ol;me.Suspense=jl;me.isAsyncMode=function(e){return fm(e)||gt(e)===Pu};me.isConcurrentMode=fm;me.isContextConsumer=function(e){return gt(e)===zl};me.isContextProvider=function(e){return gt(e)===Tl};me.isElement=function(e){return typeof e=="object"&&e!==null&&e.$$typeof===bu};me.isForwardRef=function(e){return gt(e)===$l};me.isFragment=function(e){return gt(e)===_l};me.isLazy=function(e){return gt(e)===Ul};me.isMemo=function(e){return gt(e)===Dl};me.isPortal=function(e){return gt(e)===Ru};me.isProfiler=function(e){return gt(e)===Il};me.isStrictMode=function(e){return gt(e)===Ol};me.isSuspense=function(e){return gt(e)===jl};me.isValidElementType=function(e){return typeof e=="string"||typeof e=="function"||e===_l||e===Ml||e===Il||e===Ol||e===jl||e===pg||typeof e=="object"&&e!==null&&(e.$$typeof===Ul||e.$$typeof===Dl||e.$$typeof===Tl||e.$$typeof===zl||e.$$typeof===$l||e.$$typeof===hg||e.$$typeof===gg||e.$$typeof===vg||e.$$typeof===mg)};me.typeOf=gt;cm.exports=me;var Lu=cm.exports;function yg(e){function t(O,T,$,X,k){for(var W=0,_=0,ne=0,J=0,oe,Y,Re=0,he=0,ie,xe=ie=oe=0,re=0,te=0,Nt=0,Ce=0,jt=$.length,bt=jt-1,Ve,Q="",de="",Yt="",Rt="",Xe;re<jt;){if(Y=$.charCodeAt(re),re===bt&&_+J+ne+W!==0&&(_!==0&&(Y=_===47?10:47),J=ne=W=0,jt++,bt++),_+J+ne+W===0){if(re===bt&&(0<te&&(Q=Q.replace(h,"")),0<Q.trim().length)){switch(Y){case 32:case 9:case 59:case 13:case 10:break;default:Q+=$.charAt(re)}Y=59}switch(Y){case 123:for(Q=Q.trim(),oe=Q.charCodeAt(0),ie=1,Ce=++re;re<jt;){switch(Y=$.charCodeAt(re)){case 123:ie++;break;case 125:ie--;break;case 47:switch(Y=$.charCodeAt(re+1)){case 42:case 47:e:{for(xe=re+1;xe<bt;++xe)switch($.charCodeAt(xe)){case 47:if(Y===42&&$.charCodeAt(xe-1)===42&&re+2!==xe){re=xe+1;break e}break;case 10:if(Y===47){re=xe+1;break e}}re=xe}}break;case 91:Y++;case 40:Y++;case 34:case 39:for(;re++<bt&&$.charCodeAt(re)!==Y;);}if(ie===0)break;re++}switch(ie=$.substring(Ce,re),oe===0&&(oe=(Q=Q.replace(p,"").trim()).charCodeAt(0)),oe){case 64:switch(0<te&&(Q=Q.replace(h,"")),Y=Q.charCodeAt(1),Y){case 100:case 109:case 115:case 45:te=T;break;default:te=V}if(ie=t(T,te,ie,Y,k+1),Ce=ie.length,0<P&&(te=n(V,Q,Nt),Xe=a(3,ie,te,T,I,ee,Ce,Y,k,X),Q=te.join(""),Xe!==void 0&&(Ce=(ie=Xe.trim()).length)===0&&(Y=0,ie="")),0<Ce)switch(Y){case 115:Q=Q.replace(E,l);case 100:case 109:case 45:ie=Q+"{"+ie+"}";break;case 107:Q=Q.replace(c,"$1 $2"),ie=Q+"{"+ie+"}",ie=M===1||M===2&&i("@"+ie,3)?"@-webkit-"+ie+"@"+ie:"@"+ie;break;default:ie=Q+ie,X===112&&(ie=(de+=ie,""))}else ie="";break;default:ie=t(T,n(T,Q,Nt),ie,X,k+1)}Yt+=ie,ie=Nt=te=xe=oe=0,Q="",Y=$.charCodeAt(++re);break;case 125:case 59:if(Q=(0<te?Q.replace(h,""):Q).trim(),1<(Ce=Q.length))switch(xe===0&&(oe=Q.charCodeAt(0),oe===45||96<oe&&123>oe)&&(Ce=(Q=Q.replace(" ",":")).length),0<P&&(Xe=a(1,Q,T,O,I,ee,de.length,X,k,X))!==void 0&&(Ce=(Q=Xe.trim()).length)===0&&(Q="\0\0"),oe=Q.charCodeAt(0),Y=Q.charCodeAt(1),oe){case 0:break;case 64:if(Y===105||Y===99){Rt+=Q+$.charAt(re);break}default:Q.charCodeAt(Ce-1)!==58&&(de+=o(Q,oe,Y,Q.charCodeAt(2)))}Nt=te=xe=oe=0,Q="",Y=$.charCodeAt(++re)}}switch(Y){case 13:case 10:_===47?_=0:1+oe===0&&X!==107&&0<Q.length&&(te=1,Q+="\0"),0<P*j&&a(0,Q,T,O,I,ee,de.length,X,k,X),ee=1,I++;break;case 59:case 125:if(_+J+ne+W===0){ee++;break}default:switch(ee++,Ve=$.charAt(re),Y){case 9:case 32:if(J+W+_===0)switch(Re){case 44:case 58:case 9:case 32:Ve="";break;default:Y!==32&&(Ve=" ")}break;case 0:Ve="\\0";break;case 12:Ve="\\f";break;case 11:Ve="\\v";break;case 38:J+_+W===0&&(te=Nt=1,Ve="\f"+Ve);break;case 108:if(J+_+W+H===0&&0<xe)switch(re-xe){case 2:Re===112&&$.charCodeAt(re-3)===58&&(H=Re);case 8:he===111&&(H=he)}break;case 58:J+_+W===0&&(xe=re);break;case 44:_+ne+J+W===0&&(te=1,Ve+="\r");break;case 34:case 39:_===0&&(J=J===Y?0:J===0?Y:J);break;case 91:J+_+ne===0&&W++;break;case 93:J+_+ne===0&&W--;break;case 41:J+_+W===0&&ne--;break;case 40:if(J+_+W===0){if(oe===0)switch(2*Re+3*he){case 533:break;default:oe=1}ne++}break;case 64:_+ne+J+W+xe+ie===0&&(ie=1);break;case 42:case 47:if(!(0<J+W+ne))switch(_){case 0:switch(2*Y+3*$.charCodeAt(re+1)){case 235:_=47;break;case 220:Ce=re,_=42}break;case 42:Y===47&&Re===42&&Ce+2!==re&&($.charCodeAt(Ce+2)===33&&(de+=$.substring(Ce,re+1)),Ve="",_=0)}}_===0&&(Q+=Ve)}he=Re,Re=Y,re++}if(Ce=de.length,0<Ce){if(te=T,0<P&&(Xe=a(2,de,te,O,I,ee,Ce,X,k,X),Xe!==void 0&&(de=Xe).length===0))return Rt+de+Yt;if(de=te.join(",")+"{"+de+"}",M*H!==0){switch(M!==2||i(de,2)||(H=0),H){case 111:de=de.replace(S,":-moz-$1")+de;break;case 112:de=de.replace(m,"::-webkit-input-$1")+de.replace(m,"::-moz-$1")+de.replace(m,":-ms-input-$1")+de}H=0}}return Rt+de+Yt}function n(O,T,$){var X=T.trim().split(C);T=X;var k=X.length,W=O.length;switch(W){case 0:case 1:var _=0;for(O=W===0?"":O[0]+" ";_<k;++_)T[_]=r(O,T[_],$).trim();break;default:var ne=_=0;for(T=[];_<k;++_)for(var J=0;J<W;++J)T[ne++]=r(O[J]+" ",X[_],$).trim()}return T}function r(O,T,$){var X=T.charCodeAt(0);switch(33>X&&(X=(T=T.trim()).charCodeAt(0)),X){case 38:return T.replace(f,"$1"+O.trim());case 58:return O.trim()+T.replace(f,"$1"+O.trim());default:if(0<1*$&&0<T.indexOf("\f"))return T.replace(f,(O.charCodeAt(0)===58?"":"$1")+O.trim())}return O+T}function o(O,T,$,X){var k=O+";",W=2*T+3*$+4*X;if(W===944){O=k.indexOf(":",9)+1;var _=k.substring(O,k.length-1).trim();return _=k.substring(0,O).trim()+_+";",M===1||M===2&&i(_,1)?"-webkit-"+_+_:_}if(M===0||M===2&&!i(k,1))return k;switch(W){case 1015:return k.charCodeAt(10)===97?"-webkit-"+k+k:k;case 951:return k.charCodeAt(3)===116?"-webkit-"+k+k:k;case 963:return k.charCodeAt(5)===110?"-webkit-"+k+k:k;case 1009:if(k.charCodeAt(4)!==100)break;case 969:case 942:return"-webkit-"+k+k;case 978:return"-webkit-"+k+"-moz-"+k+k;case 1019:case 983:return"-webkit-"+k+"-moz-"+k+"-ms-"+k+k;case 883:if(k.charCodeAt(8)===45)return"-webkit-"+k+k;if(0<k.indexOf("image-set(",11))return k.replace(ae,"$1-webkit-$2")+k;break;case 932:if(k.charCodeAt(4)===45)switch(k.charCodeAt(5)){case 103:return"-webkit-box-"+k.replace("-grow","")+"-webkit-"+k+"-ms-"+k.replace("grow","positive")+k;case 115:return"-webkit-"+k+"-ms-"+k.replace("shrink","negative")+k;case 98:return"-webkit-"+k+"-ms-"+k.replace("basis","preferred-size")+k}return"-webkit-"+k+"-ms-"+k+k;case 964:return"-webkit-"+k+"-ms-flex-"+k+k;case 1023:if(k.charCodeAt(8)!==99)break;return _=k.substring(k.indexOf(":",15)).replace("flex-","").replace("space-between","justify"),"-webkit-box-pack"+_+"-webkit-"+k+"-ms-flex-pack"+_+k;case 1005:return g.test(k)?k.replace(v,":-webkit-")+k.replace(v,":-moz-")+k:k;case 1e3:switch(_=k.substring(13).trim(),T=_.indexOf("-")+1,_.charCodeAt(0)+_.charCodeAt(T)){case 226:_=k.replace(A,"tb");break;case 232:_=k.replace(A,"tb-rl");break;case 220:_=k.replace(A,"lr");break;default:return k}return"-webkit-"+k+"-ms-"+_+k;case 1017:if(k.indexOf("sticky",9)===-1)break;case 975:switch(T=(k=O).length-10,_=(k.charCodeAt(T)===33?k.substring(0,T):k).substring(O.indexOf(":",7)+1).trim(),W=_.charCodeAt(0)+(_.charCodeAt(7)|0)){case 203:if(111>_.charCodeAt(8))break;case 115:k=k.replace(_,"-webkit-"+_)+";"+k;break;case 207:case 102:k=k.replace(_,"-webkit-"+(102<W?"inline-":"")+"box")+";"+k.replace(_,"-webkit-"+_)+";"+k.replace(_,"-ms-"+_+"box")+";"+k}return k+";";case 938:if(k.charCodeAt(5)===45)switch(k.charCodeAt(6)){case 105:return _=k.replace("-items",""),"-webkit-"+k+"-webkit-box-"+_+"-ms-flex-"+_+k;case 115:return"-webkit-"+k+"-ms-flex-item-"+k.replace(b,"")+k;default:return"-webkit-"+k+"-ms-flex-line-pack"+k.replace("align-content","").replace(b,"")+k}break;case 973:case 989:if(k.charCodeAt(3)!==45||k.charCodeAt(4)===122)break;case 931:case 953:if(F.test(O)===!0)return(_=O.substring(O.indexOf(":")+1)).charCodeAt(0)===115?o(O.replace("stretch","fill-available"),T,$,X).replace(":fill-available",":stretch"):k.replace(_,"-webkit-"+_)+k.replace(_,"-moz-"+_.replace("fill-",""))+k;break;case 962:if(k="-webkit-"+k+(k.charCodeAt(5)===102?"-ms-"+k:"")+k,$+X===211&&k.charCodeAt(13)===105&&0<k.indexOf("transform",10))return k.substring(0,k.indexOf(";",27)+1).replace(w,"$1-webkit-$2")+k}return k}function i(O,T){var $=O.indexOf(T===1?":":"{"),X=O.substring(0,T!==3?$:10);return $=O.substring($+1,O.length-1),B(T!==2?X:X.replace(z,"$1"),$,T)}function l(O,T){var $=o(T,T.charCodeAt(0),T.charCodeAt(1),T.charCodeAt(2));return $!==T+";"?$.replace(N," or ($1)").substring(4):"("+T+")"}function a(O,T,$,X,k,W,_,ne,J,oe){for(var Y=0,Re=T,he;Y<P;++Y)switch(he=G[Y].call(d,O,Re,$,X,k,W,_,ne,J,oe)){case void 0:case!1:case!0:case null:break;default:Re=he}if(Re!==T)return Re}function s(O){switch(O){case void 0:case null:P=G.length=0;break;default:if(typeof O=="function")G[P++]=O;else if(typeof O=="object")for(var T=0,$=O.length;T<$;++T)s(O[T]);else j=!!O|0}return s}function u(O){return O=O.prefix,O!==void 0&&(B=null,O?typeof O!="function"?M=1:(M=2,B=O):M=0),u}function d(O,T){var $=O;if(33>$.charCodeAt(0)&&($=$.trim()),se=$,$=[se],0<P){var X=a(-1,T,$,$,I,ee,0,0,0,0);X!==void 0&&typeof X=="string"&&(T=X)}var k=t(V,$,T,0,0);return 0<P&&(X=a(-2,k,$,$,I,ee,k.length,0,0,0),X!==void 0&&(k=X)),se="",H=0,ee=I=1,k}var p=/^\0+/g,h=/[\0\r\f]/g,v=/: */g,g=/zoo|gra/,w=/([,: ])(transform)/g,C=/,\r+?/g,f=/([\t\r\n ])*\f?&/g,c=/@(k\w+)\s*(\S*)\s*/,m=/::(place)/g,S=/:(read-only)/g,A=/[svh]\w+-[tblr]{2}/,E=/\(\s*(.*)\s*\)/g,N=/([\s\S]*?);/g,b=/-self|flex-/g,z=/[^]*?(:[rp][el]a[\w-]+)[^]*/,F=/stretch|:\s*\w+\-(?:conte|avail)/,ae=/([^-])(image-set\()/,ee=1,I=1,H=0,M=1,V=[],G=[],P=0,B=null,j=0,se="";return d.use=s,d.set=u,e!==void 0&&u(e),d}var wg={animationIterationCount:1,borderImageOutset:1,borderImageSlice:1,borderImageWidth:1,boxFlex:1,boxFlexGroup:1,boxOrdinalGroup:1,columnCount:1,columns:1,flex:1,flexGrow:1,flexPositive:1,flexShrink:1,flexNegative:1,flexOrder:1,gridRow:1,gridRowEnd:1,gridRowSpan:1,gridRowStart:1,gridColumn:1,gridColumnEnd:1,gridColumnSpan:1,gridColumnStart:1,msGridRow:1,msGridRowSpan:1,msGridColumn:1,msGridColumnSpan:1,fontWeight:1,lineHeight:1,opacity:1,order:1,orphans:1,tabSize:1,widows:1,zIndex:1,zoom:1,WebkitLineClamp:1,fillOpacity:1,floodOpacity:1,stopOpacity:1,strokeDasharray:1,strokeDashoffset:1,strokeMiterlimit:1,strokeOpacity:1,strokeWidth:1};function xg(e){var t=Object.create(null);return function(n){return t[n]===void 0&&(t[n]=e(n)),t[n]}}var Sg=/^((children|dangerouslySetInnerHTML|key|ref|autoFocus|defaultValue|defaultChecked|innerHTML|suppressContentEditableWarning|suppressHydrationWarning|valueLink|abbr|accept|acceptCharset|accessKey|action|allow|allowUserMedia|allowPaymentRequest|allowFullScreen|allowTransparency|alt|async|autoComplete|autoPlay|capture|cellPadding|cellSpacing|challenge|charSet|checked|cite|classID|className|cols|colSpan|content|contentEditable|contextMenu|controls|controlsList|coords|crossOrigin|data|dateTime|decoding|default|defer|dir|disabled|disablePictureInPicture|download|draggable|encType|enterKeyHint|form|formAction|formEncType|formMethod|formNoValidate|formTarget|frameBorder|headers|height|hidden|high|href|hrefLang|htmlFor|httpEquiv|id|inputMode|integrity|is|keyParams|keyType|kind|label|lang|list|loading|loop|low|marginHeight|marginWidth|max|maxLength|media|mediaGroup|method|min|minLength|multiple|muted|name|nonce|noValidate|open|optimum|pattern|placeholder|playsInline|poster|preload|profile|radioGroup|readOnly|referrerPolicy|rel|required|reversed|role|rows|rowSpan|sandbox|scope|scoped|scrolling|seamless|selected|shape|size|sizes|slot|span|spellCheck|src|srcDoc|srcLang|srcSet|start|step|style|summary|tabIndex|target|title|translate|type|useMap|value|width|wmode|wrap|about|datatype|inlist|prefix|property|resource|typeof|vocab|autoCapitalize|autoCorrect|autoSave|color|incremental|fallback|inert|itemProp|itemScope|itemType|itemID|itemRef|on|option|results|security|unselectable|accentHeight|accumulate|additive|alignmentBaseline|allowReorder|alphabetic|amplitude|arabicForm|ascent|attributeName|attributeType|autoReverse|azimuth|baseFrequency|baselineShift|baseProfile|bbox|begin|bias|by|calcMode|capHeight|clip|clipPathUnits|clipPath|clipRule|colorInterpolation|colorInterpolationFilters|colorProfile|colorRendering|contentScriptType|contentStyleType|cursor|cx|cy|d|decelerate|descent|diffuseConstant|direction|display|divisor|dominantBaseline|dur|dx|dy|edgeMode|elevation|enableBackground|end|exponent|externalResourcesRequired|fill|fillOpacity|fillRule|filter|filterRes|filterUnits|floodColor|floodOpacity|focusable|fontFamily|fontSize|fontSizeAdjust|fontStretch|fontStyle|fontVariant|fontWeight|format|from|fr|fx|fy|g1|g2|glyphName|glyphOrientationHorizontal|glyphOrientationVertical|glyphRef|gradientTransform|gradientUnits|hanging|horizAdvX|horizOriginX|ideographic|imageRendering|in|in2|intercept|k|k1|k2|k3|k4|kernelMatrix|kernelUnitLength|kerning|keyPoints|keySplines|keyTimes|lengthAdjust|letterSpacing|lightingColor|limitingConeAngle|local|markerEnd|markerMid|markerStart|markerHeight|markerUnits|markerWidth|mask|maskContentUnits|maskUnits|mathematical|mode|numOctaves|offset|opacity|operator|order|orient|orientation|origin|overflow|overlinePosition|overlineThickness|panose1|paintOrder|pathLength|patternContentUnits|patternTransform|patternUnits|pointerEvents|points|pointsAtX|pointsAtY|pointsAtZ|preserveAlpha|preserveAspectRatio|primitiveUnits|r|radius|refX|refY|renderingIntent|repeatCount|repeatDur|requiredExtensions|requiredFeatures|restart|result|rotate|rx|ry|scale|seed|shapeRendering|slope|spacing|specularConstant|specularExponent|speed|spreadMethod|startOffset|stdDeviation|stemh|stemv|stitchTiles|stopColor|stopOpacity|strikethroughPosition|strikethroughThickness|string|stroke|strokeDasharray|strokeDashoffset|strokeLinecap|strokeLinejoin|strokeMiterlimit|strokeOpacity|strokeWidth|surfaceScale|systemLanguage|tableValues|targetX|targetY|textAnchor|textDecoration|textRendering|textLength|to|transform|u1|u2|underlinePosition|underlineThickness|unicode|unicodeBidi|unicodeRange|unitsPerEm|vAlphabetic|vHanging|vIdeographic|vMathematical|values|vectorEffect|version|vertAdvY|vertOriginX|vertOriginY|viewBox|viewTarget|visibility|widths|wordSpacing|writingMode|x|xHeight|x1|x2|xChannelSelector|xlinkActuate|xlinkArcrole|xlinkHref|xlinkRole|xlinkShow|xlinkTitle|xlinkType|xmlBase|xmlns|xmlnsXlink|xmlLang|xmlSpace|y|y1|y2|yChannelSelector|z|zoomAndPan|for|class|autofocus)|(([Dd][Aa][Tt][Aa]|[Aa][Rr][Ii][Aa]|x)-.*))$/,cf=xg(function(e){return Sg.test(e)||e.charCodeAt(0)===111&&e.charCodeAt(1)===110&&e.charCodeAt(2)<91}),_u=Lu,kg={childContextTypes:!0,contextType:!0,contextTypes:!0,defaultProps:!0,displayName:!0,getDefaultProps:!0,getDerivedStateFromError:!0,getDerivedStateFromProps:!0,mixins:!0,propTypes:!0,type:!0},Cg={name:!0,length:!0,prototype:!0,caller:!0,callee:!0,arguments:!0,arity:!0},Eg={$$typeof:!0,render:!0,defaultProps:!0,displayName:!0,propTypes:!0},dm={$$typeof:!0,compare:!0,defaultProps:!0,displayName:!0,propTypes:!0,type:!0},Ou={};Ou[_u.ForwardRef]=Eg;Ou[_u.Memo]=dm;function ff(e){return _u.isMemo(e)?dm:Ou[e.$$typeof]||kg}var Ag=Object.defineProperty,Ng=Object.getOwnPropertyNames,df=Object.getOwnPropertySymbols,bg=Object.getOwnPropertyDescriptor,Rg=Object.getPrototypeOf,pf=Object.prototype;function pm(e,t,n){if(typeof t!="string"){if(pf){var r=Rg(t);r&&r!==pf&&pm(e,r,n)}var o=Ng(t);df&&(o=o.concat(df(t)));for(var i=ff(e),l=ff(t),a=0;a<o.length;++a){var s=o[a];if(!Cg[s]&&!(n&&n[s])&&!(l&&l[s])&&!(i&&i[s])){var u=bg(t,s);try{Ag(e,s,u)}catch{}}}}return e}var Pg=pm;const Lg=Ps(Pg);function Ht(){return(Ht=Object.assign||function(e){for(var t=1;t<arguments.length;t++){var n=arguments[t];for(var r in n)Object.prototype.hasOwnProperty.call(n,r)&&(e[r]=n[r])}return e}).apply(this,arguments)}var mf=function(e,t){for(var n=[e[0]],r=0,o=t.length;r<o;r+=1)n.push(t[r],e[r+1]);return n},ys=function(e){return e!==null&&typeof e=="object"&&(e.toString?e.toString():Object.prototype.toString.call(e))==="[object Object]"&&!Lu.typeOf(e)},ll=Object.freeze([]),Rn=Object.freeze({});function jo(e){return typeof e=="function"}function hf(e){return e.displayName||e.name||"Component"}function Iu(e){return e&&typeof e.styledComponentId=="string"}var $r=typeof process<"u"&&({}.REACT_APP_SC_ATTR||{}.SC_ATTR)||"data-styled",Tu=typeof window<"u"&&"HTMLElement"in window,_g=!!(typeof SC_DISABLE_SPEEDY=="boolean"?SC_DISABLE_SPEEDY:typeof process<"u"&&{}.REACT_APP_SC_DISABLE_SPEEDY!==void 0&&{}.REACT_APP_SC_DISABLE_SPEEDY!==""?{}.REACT_APP_SC_DISABLE_SPEEDY!=="false"&&{}.REACT_APP_SC_DISABLE_SPEEDY:typeof process<"u"&&{}.SC_DISABLE_SPEEDY!==void 0&&{}.SC_DISABLE_SPEEDY!==""&&{}.SC_DISABLE_SPEEDY!=="false"&&{}.SC_DISABLE_SPEEDY),Og={};function Qo(e){for(var t=arguments.length,n=new Array(t>1?t-1:0),r=1;r<t;r++)n[r-1]=arguments[r];throw new Error("An error occurred. See https://git.io/JUIaE#"+e+" for more information."+(n.length>0?" Args: "+n.join(", "):""))}var Ig=function(){function e(n){this.groupSizes=new Uint32Array(512),this.length=512,this.tag=n}var t=e.prototype;return t.indexOfGroup=function(n){for(var r=0,o=0;o<n;o++)r+=this.groupSizes[o];return r},t.insertRules=function(n,r){if(n>=this.groupSizes.length){for(var o=this.groupSizes,i=o.length,l=i;n>=l;)(l<<=1)<0&&Qo(16,""+n);this.groupSizes=new Uint32Array(l),this.groupSizes.set(o),this.length=l;for(var a=i;a<l;a++)this.groupSizes[a]=0}for(var s=this.indexOfGroup(n+1),u=0,d=r.length;u<d;u++)this.tag.insertRule(s,r[u])&&(this.groupSizes[n]++,s++)},t.clearGroup=function(n){if(n<this.length){var r=this.groupSizes[n],o=this.indexOfGroup(n),i=o+r;this.groupSizes[n]=0;for(var l=o;l<i;l++)this.tag.deleteRule(o)}},t.getGroup=function(n){var r="";if(n>=this.length||this.groupSizes[n]===0)return r;for(var o=this.groupSizes[n],i=this.indexOfGroup(n),l=i+o,a=i;a<l;a++)r+=this.tag.getRule(a)+`/*!sc*/
`;return r},e}(),Oi=new Map,al=new Map,wo=1,gi=function(e){if(Oi.has(e))return Oi.get(e);for(;al.has(wo);)wo++;var t=wo++;return Oi.set(e,t),al.set(t,e),t},Tg=function(e){return al.get(e)},zg=function(e,t){t>=wo&&(wo=t+1),Oi.set(e,t),al.set(t,e)},Mg="style["+$r+'][data-styled-version="5.3.6"]',$g=new RegExp("^"+$r+'\\.g(\\d+)\\[id="([\\w\\d-]+)"\\].*?"([^"]*)'),jg=function(e,t,n){for(var r,o=n.split(","),i=0,l=o.length;i<l;i++)(r=o[i])&&e.registerName(t,r)},Dg=function(e,t){for(var n=(t.textContent||"").split(`/*!sc*/
`),r=[],o=0,i=n.length;o<i;o++){var l=n[o].trim();if(l){var a=l.match($g);if(a){var s=0|parseInt(a[1],10),u=a[2];s!==0&&(zg(u,s),jg(e,u,a[3]),e.getTag().insertRules(s,r)),r.length=0}else r.push(l)}}},Ug=function(){return typeof __webpack_nonce__<"u"?__webpack_nonce__:null},mm=function(e){var t=document.head,n=e||t,r=document.createElement("style"),o=function(a){for(var s=a.childNodes,u=s.length;u>=0;u--){var d=s[u];if(d&&d.nodeType===1&&d.hasAttribute($r))return d}}(n),i=o!==void 0?o.nextSibling:null;r.setAttribute($r,"active"),r.setAttribute("data-styled-version","5.3.6");var l=Ug();return l&&r.setAttribute("nonce",l),n.insertBefore(r,i),r},Fg=function(){function e(n){var r=this.element=mm(n);r.appendChild(document.createTextNode("")),this.sheet=function(o){if(o.sheet)return o.sheet;for(var i=document.styleSheets,l=0,a=i.length;l<a;l++){var s=i[l];if(s.ownerNode===o)return s}Qo(17)}(r),this.length=0}var t=e.prototype;return t.insertRule=function(n,r){try{return this.sheet.insertRule(r,n),this.length++,!0}catch{return!1}},t.deleteRule=function(n){this.sheet.deleteRule(n),this.length--},t.getRule=function(n){var r=this.sheet.cssRules[n];return r!==void 0&&typeof r.cssText=="string"?r.cssText:""},e}(),Bg=function(){function e(n){var r=this.element=mm(n);this.nodes=r.childNodes,this.length=0}var t=e.prototype;return t.insertRule=function(n,r){if(n<=this.length&&n>=0){var o=document.createTextNode(r),i=this.nodes[n];return this.element.insertBefore(o,i||null),this.length++,!0}return!1},t.deleteRule=function(n){this.element.removeChild(this.nodes[n]),this.length--},t.getRule=function(n){return n<this.length?this.nodes[n].textContent:""},e}(),Vg=function(){function e(n){this.rules=[],this.length=0}var t=e.prototype;return t.insertRule=function(n,r){return n<=this.length&&(this.rules.splice(n,0,r),this.length++,!0)},t.deleteRule=function(n){this.rules.splice(n,1),this.length--},t.getRule=function(n){return n<this.length?this.rules[n]:""},e}(),gf=Tu,Hg={isServer:!Tu,useCSSOMInjection:!_g},sl=function(){function e(n,r,o){n===void 0&&(n=Rn),r===void 0&&(r={}),this.options=Ht({},Hg,{},n),this.gs=r,this.names=new Map(o),this.server=!!n.isServer,!this.server&&Tu&&gf&&(gf=!1,function(i){for(var l=document.querySelectorAll(Mg),a=0,s=l.length;a<s;a++){var u=l[a];u&&u.getAttribute($r)!=="active"&&(Dg(i,u),u.parentNode&&u.parentNode.removeChild(u))}}(this))}e.registerId=function(n){return gi(n)};var t=e.prototype;return t.reconstructWithOptions=function(n,r){return r===void 0&&(r=!0),new e(Ht({},this.options,{},n),this.gs,r&&this.names||void 0)},t.allocateGSInstance=function(n){return this.gs[n]=(this.gs[n]||0)+1},t.getTag=function(){return this.tag||(this.tag=(o=(r=this.options).isServer,i=r.useCSSOMInjection,l=r.target,n=o?new Vg(l):i?new Fg(l):new Bg(l),new Ig(n)));var n,r,o,i,l},t.hasNameForId=function(n,r){return this.names.has(n)&&this.names.get(n).has(r)},t.registerName=function(n,r){if(gi(n),this.names.has(n))this.names.get(n).add(r);else{var o=new Set;o.add(r),this.names.set(n,o)}},t.insertRules=function(n,r,o){this.registerName(n,r),this.getTag().insertRules(gi(n),o)},t.clearNames=function(n){this.names.has(n)&&this.names.get(n).clear()},t.clearRules=function(n){this.getTag().clearGroup(gi(n)),this.clearNames(n)},t.clearTag=function(){this.tag=void 0},t.toString=function(){return function(n){for(var r=n.getTag(),o=r.length,i="",l=0;l<o;l++){var a=Tg(l);if(a!==void 0){var s=n.names.get(a),u=r.getGroup(l);if(s&&u&&s.size){var d=$r+".g"+l+'[id="'+a+'"]',p="";s!==void 0&&s.forEach(function(h){h.length>0&&(p+=h+",")}),i+=""+u+d+'{content:"'+p+`"}/*!sc*/
`}}}return i}(this)},e}(),Wg=/(a)(d)/gi,vf=function(e){return String.fromCharCode(e+(e>25?39:97))};function ws(e){var t,n="";for(t=Math.abs(e);t>52;t=t/52|0)n=vf(t%52)+n;return(vf(t%52)+n).replace(Wg,"$1-$2")}var Sr=function(e,t){for(var n=t.length;n;)e=33*e^t.charCodeAt(--n);return e},hm=function(e){return Sr(5381,e)};function gm(e){for(var t=0;t<e.length;t+=1){var n=e[t];if(jo(n)&&!Iu(n))return!1}return!0}var Qg=hm("5.3.6"),Gg=function(){function e(t,n,r){this.rules=t,this.staticRulesId="",this.isStatic=(r===void 0||r.isStatic)&&gm(t),this.componentId=n,this.baseHash=Sr(Qg,n),this.baseStyle=r,sl.registerId(n)}return e.prototype.generateAndInjectStyles=function(t,n,r){var o=this.componentId,i=[];if(this.baseStyle&&i.push(this.baseStyle.generateAndInjectStyles(t,n,r)),this.isStatic&&!r.hash)if(this.staticRulesId&&n.hasNameForId(o,this.staticRulesId))i.push(this.staticRulesId);else{var l=Xn(this.rules,t,n,r).join(""),a=ws(Sr(this.baseHash,l)>>>0);if(!n.hasNameForId(o,a)){var s=r(l,"."+a,void 0,o);n.insertRules(o,a,s)}i.push(a),this.staticRulesId=a}else{for(var u=this.rules.length,d=Sr(this.baseHash,r.hash),p="",h=0;h<u;h++){var v=this.rules[h];if(typeof v=="string")p+=v;else if(v){var g=Xn(v,t,n,r),w=Array.isArray(g)?g.join(""):g;d=Sr(d,w+h),p+=w}}if(p){var C=ws(d>>>0);if(!n.hasNameForId(o,C)){var f=r(p,"."+C,void 0,o);n.insertRules(o,C,f)}i.push(C)}}return i.join(" ")},e}(),Yg=/^\s*\/\/.*$/gm,Xg=[":","[",".","#"];function Kg(e){var t,n,r,o,i=e===void 0?Rn:e,l=i.options,a=l===void 0?Rn:l,s=i.plugins,u=s===void 0?ll:s,d=new yg(a),p=[],h=function(w){function C(f){if(f)try{w(f+"}")}catch{}}return function(f,c,m,S,A,E,N,b,z,F){switch(f){case 1:if(z===0&&c.charCodeAt(0)===64)return w(c+";"),"";break;case 2:if(b===0)return c+"/*|*/";break;case 3:switch(b){case 102:case 112:return w(m[0]+c),"";default:return c+(F===0?"/*|*/":"")}case-2:c.split("/*|*/}").forEach(C)}}}(function(w){p.push(w)}),v=function(w,C,f){return C===0&&Xg.indexOf(f[n.length])!==-1||f.match(o)?w:"."+t};function g(w,C,f,c){c===void 0&&(c="&");var m=w.replace(Yg,""),S=C&&f?f+" "+C+" { "+m+" }":m;return t=c,n=C,r=new RegExp("\\"+n+"\\b","g"),o=new RegExp("(\\"+n+"\\b){2,}"),d(f||!C?"":C,S)}return d.use([].concat(u,[function(w,C,f){w===2&&f.length&&f[0].lastIndexOf(n)>0&&(f[0]=f[0].replace(r,v))},h,function(w){if(w===-2){var C=p;return p=[],C}}])),g.hash=u.length?u.reduce(function(w,C){return C.name||Qo(15),Sr(w,C.name)},5381).toString():"",g}var vm=st.createContext();vm.Consumer;var ym=st.createContext(),Zg=(ym.Consumer,new sl),xs=Kg();function wm(){return x.useContext(vm)||Zg}function xm(){return x.useContext(ym)||xs}var Sm=function(){function e(t,n){var r=this;this.inject=function(o,i){i===void 0&&(i=xs);var l=r.name+i.hash;o.hasNameForId(r.id,l)||o.insertRules(r.id,l,i(r.rules,l,"@keyframes"))},this.toString=function(){return Qo(12,String(r.name))},this.name=t,this.id="sc-keyframes-"+t,this.rules=n}return e.prototype.getName=function(t){return t===void 0&&(t=xs),this.name+t.hash},e}(),Jg=/([A-Z])/,qg=/([A-Z])/g,ev=/^ms-/,tv=function(e){return"-"+e.toLowerCase()};function yf(e){return Jg.test(e)?e.replace(qg,tv).replace(ev,"-ms-"):e}var wf=function(e){return e==null||e===!1||e===""};function Xn(e,t,n,r){if(Array.isArray(e)){for(var o,i=[],l=0,a=e.length;l<a;l+=1)(o=Xn(e[l],t,n,r))!==""&&(Array.isArray(o)?i.push.apply(i,o):i.push(o));return i}if(wf(e))return"";if(Iu(e))return"."+e.styledComponentId;if(jo(e)){if(typeof(u=e)!="function"||u.prototype&&u.prototype.isReactComponent||!t)return e;var s=e(t);return Xn(s,t,n,r)}var u;return e instanceof Sm?n?(e.inject(n,r),e.getName(r)):e:ys(e)?function d(p,h){var v,g,w=[];for(var C in p)p.hasOwnProperty(C)&&!wf(p[C])&&(Array.isArray(p[C])&&p[C].isCss||jo(p[C])?w.push(yf(C)+":",p[C],";"):ys(p[C])?w.push.apply(w,d(p[C],C)):w.push(yf(C)+": "+(v=C,(g=p[C])==null||typeof g=="boolean"||g===""?"":typeof g!="number"||g===0||v in wg?String(g).trim():g+"px")+";"));return h?[h+" {"].concat(w,["}"]):w}(e):e.toString()}var xf=function(e){return Array.isArray(e)&&(e.isCss=!0),e};function zu(e){for(var t=arguments.length,n=new Array(t>1?t-1:0),r=1;r<t;r++)n[r-1]=arguments[r];return jo(e)||ys(e)?xf(Xn(mf(ll,[e].concat(n)))):n.length===0&&e.length===1&&typeof e[0]=="string"?e:xf(Xn(mf(e,n)))}var km=function(e,t,n){return n===void 0&&(n=Rn),e.theme!==n.theme&&e.theme||t||n.theme},nv=/[!"#$%&'()*+,./:;<=>?@[\\\]^`{|}~-]+/g,rv=/(^-|-$)/g;function wa(e){return e.replace(nv,"-").replace(rv,"")}var Mu=function(e){return ws(hm(e)>>>0)};function vi(e){return typeof e=="string"&&!0}var Ss=function(e){return typeof e=="function"||typeof e=="object"&&e!==null&&!Array.isArray(e)},ov=function(e){return e!=="__proto__"&&e!=="constructor"&&e!=="prototype"};function iv(e,t,n){var r=e[n];Ss(t)&&Ss(r)?Cm(r,t):e[n]=t}function Cm(e){for(var t=arguments.length,n=new Array(t>1?t-1:0),r=1;r<t;r++)n[r-1]=arguments[r];for(var o=0,i=n;o<i.length;o++){var l=i[o];if(Ss(l))for(var a in l)ov(a)&&iv(e,l[a],a)}return e}var $u=st.createContext();$u.Consumer;var xa={};function Em(e,t,n){var r=Iu(e),o=!vi(e),i=t.attrs,l=i===void 0?ll:i,a=t.componentId,s=a===void 0?function(c,m){var S=typeof c!="string"?"sc":wa(c);xa[S]=(xa[S]||0)+1;var A=S+"-"+Mu("5.3.6"+S+xa[S]);return m?m+"-"+A:A}(t.displayName,t.parentComponentId):a,u=t.displayName,d=u===void 0?function(c){return vi(c)?"styled."+c:"Styled("+hf(c)+")"}(e):u,p=t.displayName&&t.componentId?wa(t.displayName)+"-"+t.componentId:t.componentId||s,h=r&&e.attrs?Array.prototype.concat(e.attrs,l).filter(Boolean):l,v=t.shouldForwardProp;r&&e.shouldForwardProp&&(v=t.shouldForwardProp?function(c,m,S){return e.shouldForwardProp(c,m,S)&&t.shouldForwardProp(c,m,S)}:e.shouldForwardProp);var g,w=new Gg(n,p,r?e.componentStyle:void 0),C=w.isStatic&&l.length===0,f=function(c,m){return function(S,A,E,N){var b=S.attrs,z=S.componentStyle,F=S.defaultProps,ae=S.foldedComponentIds,ee=S.shouldForwardProp,I=S.styledComponentId,H=S.target,M=function(X,k,W){X===void 0&&(X=Rn);var _=Ht({},k,{theme:X}),ne={};return W.forEach(function(J){var oe,Y,Re,he=J;for(oe in jo(he)&&(he=he(_)),he)_[oe]=ne[oe]=oe==="className"?(Y=ne[oe],Re=he[oe],Y&&Re?Y+" "+Re:Y||Re):he[oe]}),[_,ne]}(km(A,x.useContext($u),F)||Rn,A,b),V=M[0],G=M[1],P=function(X,k,W,_){var ne=wm(),J=xm(),oe=k?X.generateAndInjectStyles(Rn,ne,J):X.generateAndInjectStyles(W,ne,J);return oe}(z,N,V),B=E,j=G.$as||A.$as||G.as||A.as||H,se=vi(j),O=G!==A?Ht({},A,{},G):A,T={};for(var $ in O)$[0]!=="$"&&$!=="as"&&($==="forwardedAs"?T.as=O[$]:(ee?ee($,cf,j):!se||cf($))&&(T[$]=O[$]));return A.style&&G.style!==A.style&&(T.style=Ht({},A.style,{},G.style)),T.className=Array.prototype.concat(ae,I,P!==I?P:null,A.className,G.className).filter(Boolean).join(" "),T.ref=B,x.createElement(j,T)}(g,c,m,C)};return f.displayName=d,(g=st.forwardRef(f)).attrs=h,g.componentStyle=w,g.displayName=d,g.shouldForwardProp=v,g.foldedComponentIds=r?Array.prototype.concat(e.foldedComponentIds,e.styledComponentId):ll,g.styledComponentId=p,g.target=r?e.target:e,g.withComponent=function(c){var m=t.componentId,S=function(E,N){if(E==null)return{};var b,z,F={},ae=Object.keys(E);for(z=0;z<ae.length;z++)b=ae[z],N.indexOf(b)>=0||(F[b]=E[b]);return F}(t,["componentId"]),A=m&&m+"-"+(vi(c)?c:wa(hf(c)));return Em(c,Ht({},S,{attrs:h,componentId:A}),n)},Object.defineProperty(g,"defaultProps",{get:function(){return this._foldedDefaultProps},set:function(c){this._foldedDefaultProps=r?Cm({},e.defaultProps,c):c}}),g.toString=function(){return"."+g.styledComponentId},o&&Lg(g,e,{attrs:!0,componentStyle:!0,displayName:!0,foldedComponentIds:!0,shouldForwardProp:!0,styledComponentId:!0,target:!0,withComponent:!0}),g}var ks=function(e){return function t(n,r,o){if(o===void 0&&(o=Rn),!Lu.isValidElementType(r))return Qo(1,String(r));var i=function(){return n(r,o,zu.apply(void 0,arguments))};return i.withConfig=function(l){return t(n,r,Ht({},o,{},l))},i.attrs=function(l){return t(n,r,Ht({},o,{attrs:Array.prototype.concat(o.attrs,l).filter(Boolean)}))},i}(Em,e)};["a","abbr","address","area","article","aside","audio","b","base","bdi","bdo","big","blockquote","body","br","button","canvas","caption","cite","code","col","colgroup","data","datalist","dd","del","details","dfn","dialog","div","dl","dt","em","embed","fieldset","figcaption","figure","footer","form","h1","h2","h3","h4","h5","h6","head","header","hgroup","hr","html","i","iframe","img","input","ins","kbd","keygen","label","legend","li","link","main","map","mark","marquee","menu","menuitem","meta","meter","nav","noscript","object","ol","optgroup","option","output","p","param","picture","pre","progress","q","rp","rt","ruby","s","samp","script","section","select","small","source","span","strong","style","sub","summary","sup","table","tbody","td","textarea","tfoot","th","thead","time","title","tr","track","u","ul","var","video","wbr","circle","clipPath","defs","ellipse","foreignObject","g","image","line","linearGradient","marker","mask","path","pattern","polygon","polyline","radialGradient","rect","stop","svg","text","textPath","tspan"].forEach(function(e){ks[e]=ks(e)});var lv=function(){function e(n,r){this.rules=n,this.componentId=r,this.isStatic=gm(n),sl.registerId(this.componentId+1)}var t=e.prototype;return t.createStyles=function(n,r,o,i){var l=i(Xn(this.rules,r,o,i).join(""),""),a=this.componentId+n;o.insertRules(a,a,l)},t.removeStyles=function(n,r){r.clearRules(this.componentId+n)},t.renderStyles=function(n,r,o,i){n>2&&sl.registerId(this.componentId+n),this.removeStyles(n,o),this.createStyles(n,r,o,i)},e}();function av(e){for(var t=arguments.length,n=new Array(t>1?t-1:0),r=1;r<t;r++)n[r-1]=arguments[r];var o=zu.apply(void 0,[e].concat(n)),i="sc-global-"+Mu(JSON.stringify(o)),l=new lv(o,i);function a(u){var d=wm(),p=xm(),h=x.useContext($u),v=x.useRef(d.allocateGSInstance(i)).current;return d.server&&s(v,u,d,h,p),x.useLayoutEffect(function(){if(!d.server)return s(v,u,d,h,p),function(){return l.removeStyles(v,d)}},[v,u,d,h,p]),null}function s(u,d,p,h,v){if(l.isStatic)l.renderStyles(u,Og,p,v);else{var g=Ht({},d,{theme:km(d,h,a.defaultProps)});l.renderStyles(u,g,p,v)}}return st.memo(a)}function Am(e){for(var t=arguments.length,n=new Array(t>1?t-1:0),r=1;r<t;r++)n[r-1]=arguments[r];var o=zu.apply(void 0,[e].concat(n)).join(""),i=Mu(o);return new Sm(i,o)}const fe=ks,sv=fe.div`
    width: 100%;
    height: 100%;
    background: radial-gradient(
        75.48% 93.29% at 50% 50%,
        rgba(0, 0, 0, 0) 0%,
        #000 100%
    );
    position: absolute;
    left: 0;
    top: 0;
    display: flex;
    align-items: center;
    justify-content: center;

    .container {
        width: 120.6rem;
        height: 80.7rem;
        border-radius: 2rem;
        background: #111111;
        overflow: hidden;

        display: flex;
        align-items: center;
        flex-direction: column;
        justify-content: flex-start;
    }
`,uv=""+new URL("arrowBottomLeft-74cb60d7.svg",import.meta.url).href,cv=""+new URL("arrowBottomRight-9a2f203e.svg",import.meta.url).href,fv=""+new URL("arrowTopLeft-88f7e835.svg",import.meta.url).href,dv=""+new URL("arrowTopRight-55eb17ae.svg",import.meta.url).href,pv=""+new URL("box-3abcfa7d.svg",import.meta.url).href,mv=""+new URL("Home-09a48ff3.svg",import.meta.url).href,hv=""+new URL("ranking-8b358231.svg",import.meta.url).href,gv=""+new URL("Shopping-132120d1.svg",import.meta.url).href,vv=""+new URL("bgItem-82e70a8a.svg",import.meta.url).href,yv=""+new URL("cart-a79cee7c.svg",import.meta.url).href,wv=""+new URL("topItemShop-b18aa33a.svg",import.meta.url).href,xv=""+new URL("arrow-5e4ef441.svg",import.meta.url).href,Sv=""+new URL("aspas-1f13ad0f.svg",import.meta.url).href,kv=""+new URL("check-54a9ee5a.svg",import.meta.url).href,Cv="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANoAAAAKCAYAAADSI0D0AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAJ5SURBVHgB7Vk7axVBGD2LViIKokGTPpWF2tkIgmCjCBZ2igimsNUfYC+YQhAMKNiocAkoxEAIpMglhEB+QwghL/IoEkKeJJvz3Z3Nnd3sfDubpNkwBw7fPs58Ozsz587MXiDg3CGO4ylyn9wjd8lGib6XnCVnyGlylLyi6J+QE+Q4OUY2yVsIcOIiAs4VOOBfMsig3yYPDN8r+i6Gp+QWuW/0n6MoWlce88ro0/xD1C8gwIkjo7HBeySywfoQUGd8QNYEv9mnM4r+XU4/R/1fl9gY+apVRsz5EwEqWkYzJntrjtnO0TcE1A6mH28gOzt9UvTdDI+RzH6p/qui72B4gKzJGhwvSwhQEbHxxGA96bmJA+R8XguPfMq1GO4cZbkjU94+rporn6NM49JVqaurTNW6FJW3IboLSJZ0XeZcjDBFNpT8z5EsM1P9Gvkrl9+ux13ytjkXitFGyBW4+8TnXfP3TjpWzmKsAacbQ0X3Ip89WtHAKbrvenDsuObzwvkckfLMsnrm9UV18GlEV1lXvU7y/j7vkurSKKaR2WwHiWnkh7JfedYd8hqS2QymzH8cb+O0/HWy29LL9Sa5bO5XGXhlOEuT2X2itakPygzsyh+3CllLRznvC/u0eoH918kwiPY+S2aaXvbjH6XMD4YOSz9C/RdF/5rhvqVfof4jArzQmtHEWGxIpMcIqBveILtvmi8x2UMG+Xy/ibY5Nb3MfPeQ3fsNIMAbR0vHYLB6gia4yfAIWdN8V/SXGJ4h+6Wxyf5fVh7zAm2TyS/yKvWTCPBG+B+t/pBlvz2bLdIEw4peTHkZ7S+NG+Q/l5jGlA8gncjOZv0IqIRD1nMgJ696Q3sAAAAASUVORK5CYII=",Ev=""+new URL("Clock-da310452.png",import.meta.url).href,Av="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABkAAAAZCAYAAADE6YVjAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAPzSURBVHgB7VRbaBxlFP7mvjuzu9lkk2xTDTZNX6ombWmoN/BORZQi6EMFW1qUFgLFFkRRFKWQ+OBLEYK2gsS+iYrYB4tiaRCqWNIqFCKWtCaSbPbSnZ3dnd25/+OZ1YLEbGLFBx96nmZ+zn++c873fT9wM/5vwa2V8NTZSpqvm8/wvvOIwHF3BwjTluXm4oqU39irTRqV3Gcndo00/zXI6NTis4uF+rhuOhtMw0XgugAfXeEhiBxiCQmaKi8M9iaPHH/stk9vGGT3l3NvlMrmUT1vwrE9aB0KeEkERzdYEBKgD8dhEOhMVXmkk8qbp5+78+g/Btn7Te7FhZx+zCg2ICg81ESMeufAmhYcL4Aki1A0Bc2mB8tywBgHmfI4Qdl3fnTLR2uCHJhe7J77pTpfqzgq9YtUWkM1X4FlO1BSWisnZCE8+pdkGYIswXM9hNSGLIblTkUY+urgyNJfa/LLQUpz1suW5asCH7QmqOQNMOp83z192Lku4kLAw/0KRndkaAIGz/FofQwiVfIZMoV6cGB5zb+B+L5/L6hTn4ZMxkVA4HFwSwpXrhZw7lqIQ0NxnJm3cbnQxJHtCQQEIPBCaxo5mgzB06uDPP6uEobsPs8NEKPuq3oD2Q4Jjl7B+WYML22N48KVCvYMCpha8lG1GAYSQIz4iIQgC7RKsKEwDPm2ILffNaJZlBzSt0Tz1xsuNqZELHgSIlldLrvYsSmNX5t/UDlb83GrysH1WMQUNEVESJfvf+10pi3Izgf6GEdJ0a5tx4co8dBJQUmZp8shDA8Y//YanhyMw6f1JBUB1YZDhFMZwjFtn2zE4dJSwWsLcuyhAYOUozPixLZd8LTrmaKDrVkZCVrFAhnyvUc78fF0AYm4jDs0DxfyHsiXCFgAhZqRmO8Yk/uN9pxExDN2KhJ2EACeH7TGf/9iFYeG42Akgne+11Hg4jg8LOPkD0V09XWhUtSRTqtQaA2KIp3FqsRTkGSPC3+eBgTC/BBFJmNi2kCuaGLOob07Lsa+zkFP9aK6VIFLq8p0p/DbUhVoNMeX11zR8cNjZz6QtMQL4Hi45HLPJrWpUss3Ar1dPhnCJzPqCyUIagw9/b0w65RXq07OjD2xf3k9cSWQfNF8PbtO2C7F4tt6ejpQKtVgmxbMcq01GfPdltNj3WlkejtRr5mwy/pc4uLM4ZXqtX0g1++e6O/cNPCFmExui2tqi9RI25H5OFJQjJQXkAoLBQOuXpnaXJ3dderDV+o3BHI9bnn+5J5Mf/ZVnxM286LYAorkHDg2mNX8kdUbb8+e2PvJajXWBLkeD771+YaZS1fXy13ZbErirdxP5342vpuYx834r+N3cnPNsL3RD9MAAAAASUVORK5CYII=",Nv="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABkAAAAZCAYAAADE6YVjAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAPrSURBVHgB7VRNbBRlGH7mf2Zn/9huq6VUKommglWJPRBNUKMXPKCJPYgJphqCHkyQmPhvUA6Q6EVNOKDGVK9qiFwAf4JePMiBmCqKMdqSdnfpdnc7252d3+/7fGcMSS3UCuHAgTeZw3zzvs8z7/s87wdcj2stpNUSWkceLXaleMwLtAclSd4C8GLodyuqZtXs/qGJytnuF6PPfNC9YpLaV7t2OPXKgaDdGoocF2HA0go5eVQFqm1As3Mzxf4Ne9c9/NHnl00ydWTsDbc1v9+tNhD5EYxCBoqmpBWCccQhA/dDaLoM2bZgZEv7Nj59Yv//Jqkcf2JPa2b2XXfOgWwoMLNWmup3BVhMwJoKwzYRdl0Eng+JcyiGDk1Vxu/c8+Mnq5LMntxdbk/9OR22nEwsCdjFPFpVB77vwc4ZkKiCM4GQutMTYE1GGEVQBZ1rWkNWyiOje09Ul2Kqy0mCau3F2HMzTKEOLB3N2SYUXULvLSOQNDvNiZxZKJ06jSxGGHJCFxAqQfG4h4XV3ZTy1lJMeTlJyOJ7BE8GH0O18lCoVtVJ5DteQIcNwhWDEOsfh7FpHBI5INFHkRVE1I2uG8SnPLYc818k72+DIYS4N/lDVTfhNp2UwBrYQmQ6LK2TPrIzCaU0jMxdzwKaBckwwZKOFB1c4iOEIa9IMjq8zmZBl4QS5CQNgdtOz70AYIzBF3kEooBQKsCrnUFkDoHBoikFVEEdmxlIQuDYq1t7VtSkf/sY7/zxEzhnZFs/JeKCw+gdAXQb1s0PpHkJoELvgr51zTJkRiTMR+x1yEoy6ToZLcW9yF2Th+9rBE67JJKFk1XEcUS2Zcg/9B5ax5+DTCJpvZug3LoDta8PIq87sPIlOPU6etcPYKGxGGx97ZS5YidJsDg+KkliPLEp49E/wir0d60Z6KMvp6Px2+fhfkMERhvZYgH1agv5UhFcphtAj04ux7yIpDPXPGzmM+MSi6gLGgyRaNkM/FNvky48nVWyKzmytZm10aw4dBYhX+7B/Llp0qt4YDnmJTf+2323f5iz1V0yffa8EMwje9KGGzkSlmbOyQTJPVY/14CRUdE3WIa32EG7HU1se+e3p1btJO1mdu51daB8t5XRNhf6ymjPzaPb8dFudGhcAlHMydoyimUTxb4SXKeDZsOf+uXn/POXwlvxgjz0yNrBDcOFL3NZZXOG7i5ZM9NRJVaWaQmT96Sjhdp5OAvRd2e7G7e/9PHRxcsiuRCf7hzYeeNNa14hn92mqHJKRMuGgMblevx0Z5EdfHLir8/+C2NVkgtx7M37h34/fWZtT0G5QbfWeN9PVn499MPCNK7H1Y6/AY9zviWDT7SkAAAAAElFTkSuQmCC",bv=""+new URL("aberto-516a21d6.png",import.meta.url).href,Rv=""+new URL("barPoint-72db7289.png",import.meta.url).href,Pv=""+new URL("bgList-f72e559e.png",import.meta.url).href,Lv=""+new URL("bag-9d96c29d.png",import.meta.url).href,_v=""+new URL("menShop-be8976e8.png",import.meta.url).href,Ov=""+new URL("bgItemShop-9ad074a1.png",import.meta.url).href,Iv=""+new URL("bomb-435d015b.png",import.meta.url).href,Tv=""+new URL("first-6508bc30.png",import.meta.url).href,zv=""+new URL("second-a1630019.png",import.meta.url).href,Mv=""+new URL("thirst-2d5f6c81.png",import.meta.url).href,$v=""+new URL("bg-abbe9aa7.png",import.meta.url).href,jv=""+new URL("backgroundHome-a5fa84d9.png",import.meta.url).href,Dv=""+new URL("backgroundBox-4b962d24.png",import.meta.url).href,Uv=""+new URL("bannerShop-9004daed.png",import.meta.url).href,Fv=""+new URL("opened-3fb14b17.mp3",import.meta.url).href,Bv=""+new URL("win-2ab10c05.wav",import.meta.url).href,Kt={arrowBottomLeft:uv,arrowBottomRight:cv,arrowTopLeft:fv,arrowTopRight:dv,box:pv,home:mv,ranking:hv,shopping:gv,bgItem:vv,cart:yv,topitemShop:wv,arrow:xv,aspas:Sv,check:kv},ct={bar:Cv,Clock:Ev,coin:Av,vipcoin:Nv,comumOpen:bv,barPoint:Rv,bgList:Pv,bag:Lv,menShop:_v,backgroundHome:jv,backgroundBox:Dv,bgItemShop:Ov,bannerShop:Uv,bg:$v,bomb:Iv,first:Tv,second:zv,thirst:Mv},Sf={openedMusic:Fv,win:Bv},Vv=fe.div`
    display: flex;
    width: 120.6rem;
    padding: 2.5rem 3rem;
    align-items: center;
    gap: 1rem;

    border-bottom: 0.1rem solid #1f1f1f;
`,Hv=fe.div`
    p {
        color: #fff;
        font-size: 1.4rem;
        font-style: normal;
        font-weight: 400;
        line-height: 110%; /* 15.4px */
    }

    b {
        color: #2125ff;
        font-size: 2rem;
        font-style: normal;
        font-weight: 800;
        line-height: 110%; /* 22px */
    }
`,Wv=fe.div`
    width: 43.8rem;
    display: flex;
    align-items: center;
    justify-content: flex-end;
    gap: 2rem;

    a {
        text-decoration: none;
    }

    .selected .MenuItem {
        p {
            color: #2125ff;
        }

        path {
            fill: #2125ff;
        }
    }
`,yi=fe.div`
    display: flex;
    align-items: center;
    gap: 1rem;

    path {
        fill: rgba(255, 255, 255, 0.25);
        transition: all 0.2s ease-in-out;
    }

    p {
        color: rgba(255, 255, 255, 0.25);
        font-size: 1.4rem;
        font-style: normal;
        font-weight: 500;
        line-height: 110%; /* 15.4px */
        text-decoration: none;
        transition: all 0.2s ease-in-out;
    }

    &:hover {
        filter: brightness(0.8);
        cursor: pointer;

        path {
            fill: rgba(255, 255, 255);
        }

        p {
            color: #fff;
        }
    }
`;fe.div`
    color: #2125ff;
`;const Qv=fe.div`
    display: flex;
    align-items: center;

    .bar {
        width: 23.5rem;
    }
`,Gv=fe.div`
    max-width: 42.9rem;

    color: #525252;
    font-size: 1.1rem;
    font-style: normal;
    font-weight: 500;
    line-height: 124.5%; /* 13.695px */

    margin-left: 1.5rem;
`,Yv=fe.div`
    display: flex;
    padding: 1rem;
    justify-content: center;
    align-items: flex-start;
    gap: 2rem;

    border-radius: 1rem;
    background: #0c0c0c;
    margin-left: 2rem;
`,kf=fe.div`
    display: flex;
    align-items: center;

    gap: .5rem;
`,Cf=fe.div`
    display: flex;
    align-items: center;
    justify-content: center;
`,Ef=fe.div`
    color: #fff;
    font-size: 1.37rem;
    font-style: normal;
    font-weight: 700;
    line-height: normal;
`,Xv=()=>{const[e,t]=x.useState(),[n,r]=x.useState("home");return x.useEffect(()=>{an("requestCoins",{}).then(o=>{t(o)})},[n]),Yp("updateCoins",o=>{t(o)}),R(Vv,{children:[R(Hv,{children:[y("p",{children:"SISTEMA DE"}),y("b",{children:"CAIXAS"})]}),R(Qv,{children:[y(Gv,{children:"Quanto mais tempo jogar em nosso servidor, mais benefícios você receberá. podendo ganhar até mesmo premiações em dinheiro."}),R(Wv,{children:[y(hi,{to:"/",onClick:()=>r("home"),className:n==="home"?"selected":"",children:R(yi,{className:"MenuItem",children:[y("svg",{width:"20",height:"20",viewBox:"0 0 20 20",fill:"none",xmlns:"http://www.w3.org/2000/svg",children:y("path",{d:"M16.4288 11.0714V16.4286C16.4288 16.622 16.3581 16.7894 16.2167 16.9308C16.0753 17.0722 15.9079 17.1429 15.7145 17.1429H11.4288V12.8571H8.57162V17.1429H4.28591C4.09246 17.1429 3.92505 17.0722 3.78368 16.9308C3.64231 16.7894 3.57162 16.622 3.57162 16.4286V11.0714C3.57162 11.064 3.57348 11.0528 3.5772 11.0379C3.58092 11.0231 3.58278 11.0119 3.58278 11.0045L10.0002 5.71428L16.4176 11.0045C16.425 11.0193 16.4288 11.0417 16.4288 11.0714ZM18.9176 10.3013L18.2256 11.1272C18.1661 11.1942 18.088 11.2351 17.9913 11.25H17.9578C17.8611 11.25 17.7829 11.224 17.7234 11.1719L10.0002 4.73214L2.27698 11.1719C2.18769 11.2314 2.09841 11.2574 2.00912 11.25C1.9124 11.2351 1.83427 11.1942 1.77475 11.1272L1.08278 10.3013C1.02326 10.2269 0.997218 10.1395 1.00466 10.0391C1.0121 9.93861 1.05302 9.85863 1.12743 9.7991L9.15198 3.11383C9.39008 2.92038 9.67281 2.82365 10.0002 2.82365C10.3276 2.82365 10.6103 2.92038 10.8484 3.11383L13.5716 5.39062V3.21428C13.5716 3.11011 13.6051 3.02455 13.6721 2.95758C13.739 2.89062 13.8246 2.85714 13.9288 2.85714H16.0716C16.1758 2.85714 16.2614 2.89062 16.3283 2.95758C16.3953 3.02455 16.4288 3.11011 16.4288 3.21428V7.76785L18.873 9.7991C18.9474 9.85863 18.9883 9.93861 18.9957 10.0391C19.0032 10.1395 18.9771 10.2269 18.9176 10.3013Z",fill:"white"})}),y("p",{children:"Inicio"})]})}),y(hi,{to:"/box",onClick:()=>r("box"),className:n==="box"?"selected":"",children:R(yi,{className:"MenuItem",children:[y("svg",{width:"20",height:"20",viewBox:"0 0 20 20",fill:"none",xmlns:"http://www.w3.org/2000/svg",children:y("path",{d:"M17.7891 5.54687L17.707 5.59375L17.4785 5.71484L17.1641 5.87891L9.99414 9.66992L6.88867 8.02734L14.0898 4.25586L14.4062 4.0918L14.7207 3.92578L17.7891 5.54687ZM13.8828 3.48437L13.5684 3.64844L13.252 3.8125L6.05078 7.58594L2.83203 5.88086L2.51953 5.7168L2.28711 5.59375L2.20703 5.54883L10 1.43164L13.8828 3.48437ZM18.1914 6.2168V14.4492L10.3848 18.5684V10.3477L17.6055 6.53125L17.8984 6.375L18.0762 6.28125L18.1914 6.2168ZM9.60351 10.3477V18.5684L1.80859 14.4492V6.2207L1.91211 6.2793H1.91406L2.10156 6.37891L2.39453 6.5332L9.60351 10.3477Z",fill:"white"})}),y("p",{children:"Caixas"})]})}),y(hi,{to:"/shop",onClick:()=>r("shop"),className:n==="shop"?"selected":"",children:R(yi,{className:"MenuItem",children:[R("svg",{width:"20",height:"20",viewBox:"0 0 20 20",fill:"none",xmlns:"http://www.w3.org/2000/svg",children:[y("rect",{width:"20",height:"20","fill-opacity":"0.35"}),y("path",{d:"M17.4998 5H2.49984C1.99984 5 1.6665 5.33334 1.6665 5.83334V8.33334C1.6665 9.25 2.4165 10 3.33317 10C4.24984 10 4.99984 9.25 4.99984 8.33334C4.99984 9.25 5.74984 10 6.6665 10C7.58317 10 8.33317 9.25 8.33317 8.33334C8.33317 9.25 9.08317 10 9.99984 10C10.9165 10 11.6665 9.25 11.6665 8.33334C11.6665 9.25 12.4165 10 13.3332 10C14.2498 10 14.9998 9.25 14.9998 8.33334C14.9998 9.25 15.7498 10 16.6665 10C17.5832 10 18.3332 9.25 18.3332 8.33334V5.83334C18.3332 5.33334 17.9998 5 17.4998 5ZM3.58317 3.33334H16.6665C17.1665 3.33334 17.4998 3 17.4998 2.5C17.4998 2.00001 17.1665 1.66667 16.6665 1.66667H3.58317C3.08317 1.66667 2.74984 2.00001 2.74984 2.5C2.74984 3 3.1665 3.33334 3.58317 3.33334ZM14.9998 10C14.9998 10.9167 14.2498 11.6667 13.3332 11.6667C12.4165 11.6667 11.6665 10.9167 11.6665 10C11.6665 10.9167 10.9165 11.6667 9.99984 11.6667C9.08317 11.6667 8.33317 10.9167 8.33317 10C8.33317 10.9167 7.58317 11.6667 6.6665 11.6667C5.74984 11.6667 4.99984 10.9167 4.99984 10C4.99984 10.9167 4.24984 11.6667 3.33317 11.6667V17.5C3.33317 18 3.6665 18.3333 4.1665 18.3333H7.49984V15.8333C7.49984 14.4167 8.58317 13.3333 9.99984 13.3333C11.4165 13.3333 12.4998 14.4167 12.4998 15.8333V18.3333H15.8332C16.3332 18.3333 16.6665 18 16.6665 17.5V11.6667C15.7498 11.6667 14.9998 10.9167 14.9998 10Z",fill:"white"})]}),y("p",{children:"Loja"})]})}),y(hi,{to:"/rank",onClick:()=>r("ranking"),className:n==="ranking"?"selected":"",children:R(yi,{className:"MenuItem",children:[y("svg",{width:"20",height:"20",viewBox:"0 0 20 20",fill:"none",xmlns:"http://www.w3.org/2000/svg",children:y("path",{d:"M11.875 8.75H8.125C7.62772 8.75 7.15081 8.94755 6.79917 9.29918C6.44754 9.65081 6.25 10.1277 6.25 10.625V18.125C6.25 18.2908 6.31585 18.4497 6.43306 18.5669C6.55027 18.6842 6.70924 18.75 6.875 18.75H13.125C13.2908 18.75 13.4497 18.6842 13.5669 18.5669C13.6842 18.4497 13.75 18.2908 13.75 18.125V10.625C13.75 10.1277 13.5525 9.65081 13.2008 9.29918C12.8492 8.94755 12.3723 8.75 11.875 8.75ZM16.875 12.5H15V18.125C15.0013 18.3385 14.9632 18.5504 14.8875 18.75H16.875C17.3718 18.7485 17.8479 18.5505 18.1992 18.1992C18.5505 17.8479 18.7485 17.3718 18.75 16.875V14.375C18.7485 13.8782 18.5505 13.4021 18.1992 13.0508C17.8479 12.6995 17.3718 12.5015 16.875 12.5ZM5 13.125H3.125C2.62818 13.1265 2.15212 13.3245 1.80081 13.6758C1.4495 14.0271 1.25148 14.5032 1.25 15V16.875C1.25148 17.3718 1.4495 17.8479 1.80081 18.1992C2.15212 18.5505 2.62818 18.7485 3.125 18.75H5.1125C5.03681 18.5504 4.99867 18.3385 5 18.125V13.125ZM8.25 5.045L7.99312 6.62063C7.97949 6.70713 7.99033 6.79571 8.02441 6.87637C8.05849 6.95703 8.11445 7.02655 8.18597 7.07707C8.2575 7.12759 8.34172 7.1571 8.42914 7.16225C8.51655 7.16741 8.60366 7.14801 8.68062 7.10625L10 6.37813L11.3175 7.10625C11.3945 7.14801 11.4816 7.16741 11.569 7.16225C11.6564 7.1571 11.7406 7.12759 11.8122 7.07707C11.8837 7.02655 11.9396 6.95703 11.9737 6.87637C12.0078 6.79571 12.0186 6.70713 12.005 6.62063L11.75 5.045L12.835 3.93313C12.8952 3.87143 12.9371 3.79434 12.9563 3.71033C12.9755 3.62632 12.9712 3.53864 12.9438 3.45693C12.9164 3.37523 12.867 3.30265 12.8011 3.24718C12.7352 3.19171 12.6552 3.15549 12.57 3.1425L11.09 2.91688L10.4244 1.50001C10.3819 1.42486 10.3202 1.36234 10.2457 1.31885C10.1711 1.27535 10.0863 1.25243 10 1.25243C9.91368 1.25243 9.8289 1.27535 9.75434 1.31885C9.67978 1.36234 9.61811 1.42486 9.57563 1.50001L8.90938 2.91688L7.42938 3.1425C7.34418 3.15549 7.26422 3.19171 7.19827 3.24718C7.13233 3.30265 7.08295 3.37523 7.05556 3.45693C7.02817 3.53864 7.02384 3.62632 7.04304 3.71033C7.06223 3.79434 7.10422 3.87143 7.16438 3.93313L8.25 5.045Z",fill:"white"})}),y("p",{children:"Ranking"})]})})]}),R(Yv,{children:[R(kf,{children:[y(Cf,{children:y("img",{src:ct.coin,alt:""})}),y(Ef,{children:(e==null?void 0:e.coin)||0})]}),R(kf,{children:[y(Cf,{children:y("img",{src:ct.vipcoin,alt:""})}),y(Ef,{children:(e==null?void 0:e.vipcoin)||0})]})]})]})]})},Kv=fe.div`
    width: 120.6rem;
    height: 100%;
    background: url(${ct.backgroundHome});
    background-size: 100% 100%;
    padding-top: 2.5rem;
`,Zv=fe.div`
    display: flex;
    width: 120.6rem;
    padding: 2.5rem 3rem 1.5rem 3rem;
    justify-content: center;
    align-items: flex-start;
    gap: 1rem;
    margin: auto;
`,Jv=fe.div`
    display: flex;

    width: 67.3rem !important;
    height: 8.5rem;
    padding: 1rem 1.5rem;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
    gap: 2rem;
    flex: 1 0 0;

    border-radius: 1rem;
    border: 0.1rem solid #2125ff;

    p {
        color: #fff;
        font-size: 1.8rem;
        font-style: normal;
        font-weight: 800;
        line-height: 50%;
    }

    span {
        display: flex;
        padding: 1rem 1.5rem;
        align-items: center;
        gap: 1rem;
        align-self: stretch;
        border-radius: 0.5rem;
        background: rgba(0, 0, 0, 0.25);

        color: #fff;
        font-size: 1.4rem;
        font-style: normal;
        font-weight: 400;
        line-height: 100%; /* 1.54rem */

        b {
            font-weight: 900;
        }
    }
`,qv=Am`
    0% {
        box-shadow: 0 0 20px #2125ff80;
        background: transparent;
    }
    25%{
        box-shadow: 0 0 20px #2125ff;
        background: #2125ff;
    }
    50%{
        box-shadow: 0 0 20px #2125ff80;
        background: transparent;
    }

    75%{
        box-shadow: 0 0 20px #2125ff;
        background: #2125ff;
    }
    100%{
        box-shadow: 0 0 20px #2125ff80;
        background: transparent;
    }  
`,ey=fe.div`
    display: flex;
    width: 46.3rem;
    height: 8.5rem;
    padding: 1rem 1.5rem;
    flex-direction: column;
    justify-content: flex-end;
    align-items: flex-start;
    gap: 1rem;
    flex-shrink: 0;
    border-radius: 1rem;
    position: relative;
    border: 0.1rem solid #fdd731;
    background: radial-gradient(
            188.11% 137.73% at 91.14% 0%,
            #fdd731 0%,
            rgba(31, 31, 31, 0) 100%
        ),
        radial-gradient(
            67.21% 129.21% at 97.11% 0%,
            rgba(17, 17, 17, 0) 0%,
            #111 100%
        ),
        linear-gradient(
            294deg,
            rgba(31, 31, 31, 0) 12.11%,
            #fdd731 20.03%,
            #fdd731 24.92%,
            rgba(31, 31, 31, 0) 30.28%,
            #fdd731 40.76%,
            rgba(31, 31, 31, 0) 46.82%,
            #fdd731 52.41%,
            rgba(31, 31, 31, 0) 58.7%
        );

    .flex {
        width: 100%;

        display: flex;
        justify-content: space-between;
        align-items: flex-start;

        button {
            background: transparent;
            border-radius: 0.7rem;
            border: 0.1rem solid #2125ff;

            display: flex;
            width: 17.2rem;
            height: 3rem;
            justify-content: center;
            align-items: center;
            gap: 1rem;

            color: #fff;
            font-size: 1.4rem;
            font-style: normal;
            font-weight: 500;
            line-height: 94%; /* 18.8px */
            font-weight: 900;

            background: #2125ff;

            &:hover {
                filter: brightness(0.8);
                cursor: pointer;
            }
        }
    }

    .modalVip {
        width: 100%;
        height: 100%;

        position: absolute;
        left: 0;
        top: 0;
        background: rgba(0, 0, 0, 0.98);

        padding: 1.46vw;
        
        border-radius: 0.52vw;

        display: flex;
        justify-content: space-between;
        align-items: center;

        p {
            width: 10.52vw;
            color: #fff;
            font-size: 0.73vw;
            font-style: normal;
            font-weight: 500;
            line-height: 110%;
        }

        button {
            display: flex;
            width: 7.4vw;
            padding: 0.52vw 1.14vw;
            justify-content: center;
            align-items: center;
            gap: 0.52vw;

            outline: none;
            background: transparent;
            border-radius: 0.52vw;
            border: 0.05vw solid #2125ff;

            color: #fff;
            font-size: 1.04vw;
            font-style: normal;
            font-weight: 500;
            line-height: 94%; /* 0.98vw */

            position: static;
            animation: ${qv} 2s ease-in-out infinite;
            &:hover {
                background: #2125ff;
                cursor: pointer;
            }
        }
    }

    p {
        color: #fff;
        font-size: 1.8rem;
        font-style: normal;
        font-weight: 800;
        line-height: 100%;
    }

    span {
        display: flex;
        padding: 1rem 1.5rem;
        align-items: center;
        gap: 1rem;
        align-self: stretch;
        border-radius: 0.5rem;
        background: rgba(0, 0, 0, 0.25);

        color: #fff;
        font-size: 1.4rem;
        font-style: normal;
        font-weight: 400;
        line-height: 50%; /* 1.54rem */

        b {
            font-weight: 900;
        }
    }
`,ty=fe.div`
    margin-top: 5.4rem;

    .top {
        display: flex;
        width: 51.5rem;
        padding: 0.5rem 2.5rem;
        flex-direction: column;
        align-items: flex-start;
        gap: 2rem;
        border-left: 0.3rem solid #ffe600;
        margin-left: 3rem;

        p {
            color: #b8b8b8;
            font-size: 1.5rem;
            font-style: normal;
            font-weight: 400;
            line-height: 115%; /* 1.725rem */
        }

        span {
            color: #2125ff;
        }

        p:last-child {
            span {
                color: #ffe600;
            }
        }
    }

    .title {
        h1 {
            color: #fff;
            font-size: 3rem;
            font-style: normal;
            font-weight: 700;
            line-height: 105%; /* 3.15rem */
        }
    }

    .bottom {
        width: 51.5rem;

        color: #b8b8b8;
        font-size: 1.4rem;
        font-style: normal;
        font-weight: 400;
        line-height: normal;

        margin-left: 3rem;
        padding-left: 2.5rem;

        display: flex;
        flex-direction: column;
        justify-content: center;
        gap: 1.5rem;

        b {
            color: #ffe600;
        }

        span {
            color: #fff;
            font-weight: 800;
        }
    }

    .footer {
        margin-top: 6.1rem;
        color: #828282;

        margin-left: 3rem;
        font-size: 1.2rem;
        font-style: normal;
        font-weight: 400;
        line-height: normal;
    }
`,ny=()=>{const[e,t]=x.useState();x.useEffect(()=>{an("requestBox",{}).then(r=>{t(r),console.log(JSON.stringify(r,null,4))})},[]);function n(){window.invokeNative("openUrl",e==null?void 0:e.website)}return R(Kv,{children:[R(Zv,{children:[R(Jv,{children:[y("p",{children:"COINS"}),R("span",{children:["Receba ",y("b",{children:"5x COIN"})," em: ",R("b",{children:[(e==null?void 0:e.payday)||0," MINUTOS"]})]})]}),R(ey,{children:[y("div",{className:"flex",children:y("p",{children:"VIP COINS"})}),R("span",{children:["Receba ",R("b",{children:[(e==null?void 0:e.paydayVip.amount)||0,"x VIP COIN"]})," em: ",R("b",{children:[(e==null?void 0:e.paydayVip.timing)||0," MINUTOS"]})]}),e!=null&&e.paydayVip.status?"":R("div",{className:"modalVip",children:[y("p",{children:"ADIQUIRA UM PLANO VIP PARA HABILITAR O VIP COINS"}),y("button",{onClick:n,children:"LOJA"})]})]})]}),R(ty,{children:[R("div",{className:"top",children:[R("div",{className:"title",children:[y("h1",{children:"Vamos lá!"}),y("h1",{children:"Como funciona?"})]}),R("div",{className:"description",children:[R("p",{children:["A cada ",y("b",{children:"20 minutos"})," online você receberá um ",y("span",{children:"COIN"})]}),R("p",{children:["A cada ",y("b",{children:"30 minutos"})," online você receberá um ",y("span",{children:"VIP COIN"})," a mais por cada vip ativo."]})]})]}),R("div",{className:"bottom",children:[R("li",{children:["É possível ganhar VIP COINS abrindo caixas ",y("span",{children:"ESPECIAIS"}),", ",y("span",{children:"ÉPICAS"})," ou ",y("span",{children:"LENDÁRIAS"}),"."]}),y("li",{children:"A cada rota de farm completa, você recebe um COIN."}),y("li",{children:"Sempre que vencer ações de lojinha/ammunation, receberá um COIN."}),y("li",{children:"Caso não goste do prêmio resgatado, não poderá troca-lo."})]}),R("div",{className:"footer",children:["Não reembolsamos ",y("b",{children:"COINS"})," ou ",y("b",{children:"VIP COINS"})," gastos."]})]})]})},ry=fe.div`
    width: 120.6rem;
    background: url(${ct.backgroundBox});
    position: relative;

    .rc-tooltip {
        z-index: 9999; /* ou um número adequado */
        position: absolute;
        background: red;
    }

    button {
        width: 22.2rem;

        display: flex;
        justify-content: center;
        align-items: center;
        padding: 1.5rem 2.5rem;
        gap: 1rem;

        color: #fff;
        font-size: 2rem;
        font-style: normal;
        font-weight: 500;
        line-height: 94%; /* 18.8px */
        border-radius: 1rem;
        background: transparent;
        border: 0.1rem solid #2125ff;
        cursor: pointer;
        margin: auto;
        transition: all 0.2s ease;

        :hover {
            background: #2125ff;
        }
    }
`,oy=fe.div`
    text-align: center;
    margin-top: 25px;

    p {
        color: #828282;
        text-align: center;
        font-size: 1.5rem;
        font-style: normal;
        font-weight: 400;
        line-height: 110%; /* 16.5px */
    }

    b {
        color: #fff;
        text-align: center;
        font-size: 2.5rem;
        font-style: normal;
        font-weight: 800;
        line-height: 110%; /* 27.5px */
    }
`,iy=fe.div`
    display: flex;
    height: 24.2rem;

    display: flex;
    align-items: center;
    justify-content: center;
    gap: 1rem;
`,ly=Am`
    0%{transform: scale(1.04)  rotate(0);}
    30%{transform: scale(0.98)  rotate(0);}
    50%{transform: scale(1.07)  rotate(0);}
    70%{transform: scale(1)  rotate(-3.001deg);}
    100%{transform: scale(1.12)  rotate(-3.001deg);}
`,ay=fe.div`
    display: flex;
    width: 22.28rem;
    height: 22.2rem;
    flex-direction: column;
    justify-content: flex-start;
    align-items: center;
    gap: 0.5rem;
    flex-shrink: 0;
    position: relative;
    overflow: hidden;
    transition: all 0.2s ease-in-out;

    border-radius: 1rem;
    border: 0.1rem solid rgba(255, 255, 255, 0.15);

    .title {
        text-align: center;
        margin-top: 2rem;

        h1 {
            color: #4eabff;
            text-align: center;
            font-size: 1.6rem;
            font-style: normal;
            font-weight: 800;
            line-height: 110%; /* 1.76rem */
        }

        p {
            color: #fff;
            font-size: 1rem;
            font-style: normal;
            font-weight: 500;
            line-height: 110%; /* 1.1rem */
        }
    }

    .box {
        width: 100%;
        z-index: 0;
        transition: transform 0.2s cubic-bezier(0.95, 0.05, 0.795, 0.035);

        position: absolute;
        bottom: 0;
    }

    .value {
        display: flex;
        align-items: center;
        justify-content: center;

        border-radius: 0.5rem;
        border: 0.1rem solid rgba(255, 255, 255, 0.25);
        padding: 0.2rem 1rem;

        color: #fff;
        font-size: 1.096rem;
        font-style: normal;
        font-weight: 700;
        line-height: normal;
        gap: 0.1rem;

        img {
            width: 2rem;
            box-shadow: 0rem 0.32rem 0.32rem 0rem rgba(0, 0, 0, 0.25);
        }
    }

    .selectedMessage {
        display: flex;
        height: 2.7rem;
        padding: 1rem;
        justify-content: center;
        align-items: center;
        gap: 0.5rem;

        color: #fff;
        text-align: center;
        font-size: 1.6rem;
        font-style: normal;
        font-weight: 800;
        line-height: 110%; /* 1.76rem */

        border-radius: 0.5rem;
        border: 0.1rem solid #fff;
        background: rgba(255, 255, 255, 0.09);
        background-blend-mode: soft-light;

        z-index: 2;
    }

    &:hover {
        cursor: pointer;

        border-radius: 1rem;
        background: radial-gradient(
                92.78% 78.77% at 50% 100%,
                #4eabff 0%,
                rgba(25, 25, 25, 0) 100%
            ),
            linear-gradient(180deg, #1a1a1a 0%, #191919 100%);

        background-image: ${({isHovered:e,hoverColor:t})=>e?`radial-gradient(92.78% 78.77% at 50% 100%, ${t} 0%, rgba(25, 25, 25, 0) 100%), linear-gradient(180deg, #1a1a1a 0%, #191919 100%)`:"transparent"};

        border: ${({isHovered:e,hoverColor:t})=>e?`0.1rem solid ${t}`:""};

        .box {
            animation: ${ly} 0.5s linear 1;
            transform: scale(1.19) rotate(-3.001deg);
        }
    }

    ${({isSelected:e,hoverColor:t})=>e&&`
            background-image: radial-gradient(92.78% 78.77% at 50% 100%, ${t} 0%, rgba(25, 25, 25, 0) 100%), linear-gradient(180deg, #1a1a1a 0%, #191919 100%);
            border: 0.1rem solid ${t};    
        `}

    .box {
        ${({isSelected:e})=>e&&`
            transform: scale(1.19) rotate(-3.001deg);
        `}
    }
`,sy=fe.div`
    margin-top: 2rem;
    width: 120.6rem;

    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;

    .top {
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        gap: 2rem;

        p {
            color: #828282;
            text-align: center;
            font-size: 1.4rem;
            font-style: normal;
            font-weight: 400;
            line-height: 15%; /* 1.54rem */
        }

        b {
            color: #fff;
            text-align: center;
            font-size: 2rem;
            font-style: normal;
            font-weight: 800;
            line-height: 50%; /* 2.2rem */
        }
    }

    .list {
        width: 90%;
        height: 27rem;
        background-size: 100% 100%;
        overflow: auto;
        margin-top: 1rem;

        display: grid;
        grid-template-columns: repeat(9, 1fr);
        grid-template-rows: repeat(3, 1fr);

        .item {
            width: 11.6rem;
            height: 11.6rem;

            border-radius: 1rem;
            border: 0.1rem solid rgba(255, 255, 255, 0.1);

            margin-bottom: 1.1rem;

            position: relative;

            .rc-tooltip {
                position: absolute;
            }

            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;

            img {
                max-width: 60%;
                max-height: 60%;
            }

            svg {
                position: absolute;
                right: 0.8rem;
                top: 0.7rem;
            }

            .line {
                width: 5.7rem;
                height: 0.1rem;

                position: absolute;
                bottom: 0.1rem;
            }

            .nameItem {
                color: rgba(255, 255, 255, 0.37);
                font-size: 1.167rem;
                font-style: normal;
                font-weight: 500;
                line-height: normal;
                position: absolute;
                bottom: 1rem;
            }
            .amountItem {
                position: absolute;
                top: 1rem;
                left: 1rem;

                color: rgba(255, 255, 255, 1);
                font-size: 1.167rem;
                font-style: normal;
                font-weight: 500;
                line-height: normal;
            }
        }
    }

    button {
        width: 23.5rem;
        height: 6rem;

        color: #fff;
        text-align: center;
        font-size: 2.042rem;
        font-style: normal;
        font-weight: 800;
        line-height: normal;
        cursor: pointer;
        margin: auto;

        transition: all 0.2s ease-in-out;

        border: 0.101rem solid rgba(255, 255, 255, 0.12);
        background: radial-gradient(
                47.62% 70.59% at 50% 78.53%,
                rgba(255, 255, 255, 0.1) 0%,
                rgba(255, 255, 255, 0) 100%
            ),
            radial-gradient(
                299.1% 426.27% at 50% 50%,
                rgba(212, 212, 212, 0.1) 0%,
                rgba(0, 0, 0, 0) 100%
            ),
            rgba(0, 0, 0, 0.35);

        :hover {
            border: 0.1rem solid #2125ff;
            background: radial-gradient(
                    90.15% 306.8% at 49.79% 50.2%,
                    rgba(212, 212, 212, 0.09) 0%,
                    rgba(0, 0, 0, 0) 100%
                ),
                linear-gradient(
                    9deg,
                    #2125ff -20.9%,
                    #2125ff -20.88%,
                    rgba(88, 58, 255, 0) 132.68%
                );
            box-shadow: 0rem 0rem 2rem 0rem rgba(88, 58, 255, 0.1);
        }
    }
`,uy=fe.div`
    position: absolute;
    top: 0;
    left: 0;

    display: flex;
    width: 120.6rem;
    height: 80.7rem;
    padding: 24.2rem 0rem;
    justify-content: center;
    align-items: center;
    flex-shrink: 0;
    border-radius: 2rem;
    background: rgba(17, 17, 17, 0.95);
    display: flex;
    align-items: center;
    flex-direction: column;
    justify-content: center;

    .opening {
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;

        .cover {
            position: absolute;
            width: 100%;
            height: 100%;
        }

        video {
            width: 100%;
        }

        filter: drop-shadow(3rem 5rem 0.56rem #0004);

        img {
            width: 50rem;
        }
    }

    .opened {
        width: 100%;
        height: 100%;
        /* background: linear-gradient(72deg, rgba(0, 0, 0, 0.35) 19.47%, rgba(0, 0, 0, 0.00) 94.28%);
        border: 0.1rem solid rgba(255, 255, 255, 0.15); */

        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;

        position: relative;

        /* filter: drop-shadow(3rem 5rem .56rem #0004); */

        .item {
            width: 24.7rem;
            height: 26.9rem;
            margin-bottom: 1rem;

            backdrop-filter: calc(1rem);

            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;

            border-radius: 1rem;
            border: 0.1rem solid #2125ff;
            background: #111;

            img {
                min-width: 10rem;
                max-width: 15rem;
                max-height: 15rem;
            }

            h1 {
                font-size: 3.5316rem;
                font-style: normal;
                font-weight: 800;
                line-height: normal;
                background: linear-gradient(
                    56deg,
                    #fff 4.06%,
                    rgba(255, 255, 255, 0) 153.86%
                );
                background-clip: text;
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
            }

            p {
                color: #fff;
                text-align: center;
                font-size: 2rem;
                font-style: normal;
                font-weight: 600;
                line-height: 110%; /* 22px */

                border-radius: 0.3rem;
                padding: 0.5rem 1rem;
                background: #2125ff;
            }

            .nameItem {
                color: #fff;
                text-align: center;
                font-size: 2rem;
                font-style: normal;
                font-weight: 600;
                line-height: 110%; /* 22px */
            }
        }
    }

    button {
        display: flex;
        width: 24.9rem;
        padding: 1.5rem 2.5rem;
        justify-content: center;
        align-items: center;
        gap: 1rem;
        border-radius: 1rem;
        border: 0.1rem solid #2125ff;

        &:hover {
            filter: brightness(0.8);
            cursor: pointer;
        }
    }
`,Cs=Math.min,cy=Math.max,fy={left:"right",right:"left",bottom:"top",top:"bottom"},dy={start:"end",end:"start"};function Es(e,t,n){return cy(e,Cs(t,n))}function Go(e,t){return typeof e=="function"?e(t):e}function Kn(e){return e.split("-")[0]}function Yo(e){return e.split("-")[1]}function Nm(e){return e==="x"?"y":"x"}function ju(e){return e==="y"?"height":"width"}function Fl(e){return["top","bottom"].includes(Kn(e))?"y":"x"}function Du(e){return Nm(Fl(e))}function py(e,t,n){n===void 0&&(n=!1);const r=Yo(e),o=Du(e),i=ju(o);let l=o==="x"?r===(n?"end":"start")?"right":"left":r==="start"?"bottom":"top";return t.reference[i]>t.floating[i]&&(l=ul(l)),[l,ul(l)]}function my(e){const t=ul(e);return[As(e),t,As(t)]}function As(e){return e.replace(/start|end/g,t=>dy[t])}function hy(e,t,n){const r=["left","right"],o=["right","left"],i=["top","bottom"],l=["bottom","top"];switch(e){case"top":case"bottom":return n?t?o:r:t?r:o;case"left":case"right":return t?i:l;default:return[]}}function gy(e,t,n,r){const o=Yo(e);let i=hy(Kn(e),n==="start",r);return o&&(i=i.map(l=>l+"-"+o),t&&(i=i.concat(i.map(As)))),i}function ul(e){return e.replace(/left|right|bottom|top/g,t=>fy[t])}function vy(e){return{top:0,right:0,bottom:0,left:0,...e}}function bm(e){return typeof e!="number"?vy(e):{top:e,right:e,bottom:e,left:e}}function cl(e){return{...e,top:e.y,left:e.x,right:e.x+e.width,bottom:e.y+e.height}}function Af(e,t,n){let{reference:r,floating:o}=e;const i=Fl(t),l=Du(t),a=ju(l),s=Kn(t),u=i==="y",d=r.x+r.width/2-o.width/2,p=r.y+r.height/2-o.height/2,h=r[a]/2-o[a]/2;let v;switch(s){case"top":v={x:d,y:r.y-o.height};break;case"bottom":v={x:d,y:r.y+r.height};break;case"right":v={x:r.x+r.width,y:p};break;case"left":v={x:r.x-o.width,y:p};break;default:v={x:r.x,y:r.y}}switch(Yo(t)){case"start":v[l]-=h*(n&&u?-1:1);break;case"end":v[l]+=h*(n&&u?-1:1);break}return v}const yy=async(e,t,n)=>{const{placement:r="bottom",strategy:o="absolute",middleware:i=[],platform:l}=n,a=i.filter(Boolean),s=await(l.isRTL==null?void 0:l.isRTL(t));let u=await l.getElementRects({reference:e,floating:t,strategy:o}),{x:d,y:p}=Af(u,r,s),h=r,v={},g=0;for(let w=0;w<a.length;w++){const{name:C,fn:f}=a[w],{x:c,y:m,data:S,reset:A}=await f({x:d,y:p,initialPlacement:r,placement:h,strategy:o,middlewareData:v,rects:u,platform:l,elements:{reference:e,floating:t}});d=c??d,p=m??p,v={...v,[C]:{...v[C],...S}},A&&g<=50&&(g++,typeof A=="object"&&(A.placement&&(h=A.placement),A.rects&&(u=A.rects===!0?await l.getElementRects({reference:e,floating:t,strategy:o}):A.rects),{x:d,y:p}=Af(u,h,s)),w=-1)}return{x:d,y:p,placement:h,strategy:o,middlewareData:v}};async function Rm(e,t){var n;t===void 0&&(t={});const{x:r,y:o,platform:i,rects:l,elements:a,strategy:s}=e,{boundary:u="clippingAncestors",rootBoundary:d="viewport",elementContext:p="floating",altBoundary:h=!1,padding:v=0}=Go(t,e),g=bm(v),C=a[h?p==="floating"?"reference":"floating":p],f=cl(await i.getClippingRect({element:(n=await(i.isElement==null?void 0:i.isElement(C)))==null||n?C:C.contextElement||await(i.getDocumentElement==null?void 0:i.getDocumentElement(a.floating)),boundary:u,rootBoundary:d,strategy:s})),c=p==="floating"?{...l.floating,x:r,y:o}:l.reference,m=await(i.getOffsetParent==null?void 0:i.getOffsetParent(a.floating)),S=await(i.isElement==null?void 0:i.isElement(m))?await(i.getScale==null?void 0:i.getScale(m))||{x:1,y:1}:{x:1,y:1},A=cl(i.convertOffsetParentRelativeRectToViewportRelativeRect?await i.convertOffsetParentRelativeRectToViewportRelativeRect({elements:a,rect:c,offsetParent:m,strategy:s}):c);return{top:(f.top-A.top+g.top)/S.y,bottom:(A.bottom-f.bottom+g.bottom)/S.y,left:(f.left-A.left+g.left)/S.x,right:(A.right-f.right+g.right)/S.x}}const wy=e=>({name:"arrow",options:e,async fn(t){const{x:n,y:r,placement:o,rects:i,platform:l,elements:a,middlewareData:s}=t,{element:u,padding:d=0}=Go(e,t)||{};if(u==null)return{};const p=bm(d),h={x:n,y:r},v=Du(o),g=ju(v),w=await l.getDimensions(u),C=v==="y",f=C?"top":"left",c=C?"bottom":"right",m=C?"clientHeight":"clientWidth",S=i.reference[g]+i.reference[v]-h[v]-i.floating[g],A=h[v]-i.reference[v],E=await(l.getOffsetParent==null?void 0:l.getOffsetParent(u));let N=E?E[m]:0;(!N||!await(l.isElement==null?void 0:l.isElement(E)))&&(N=a.floating[m]||i.floating[g]);const b=S/2-A/2,z=N/2-w[g]/2-1,F=Cs(p[f],z),ae=Cs(p[c],z),ee=F,I=N-w[g]-ae,H=N/2-w[g]/2+b,M=Es(ee,H,I),V=!s.arrow&&Yo(o)!=null&&H!==M&&i.reference[g]/2-(H<ee?F:ae)-w[g]/2<0,G=V?H<ee?H-ee:H-I:0;return{[v]:h[v]+G,data:{[v]:M,centerOffset:H-M-G,...V&&{alignmentOffset:G}},reset:V}}}),xy=function(e){return e===void 0&&(e={}),{name:"flip",options:e,async fn(t){var n,r;const{placement:o,middlewareData:i,rects:l,initialPlacement:a,platform:s,elements:u}=t,{mainAxis:d=!0,crossAxis:p=!0,fallbackPlacements:h,fallbackStrategy:v="bestFit",fallbackAxisSideDirection:g="none",flipAlignment:w=!0,...C}=Go(e,t);if((n=i.arrow)!=null&&n.alignmentOffset)return{};const f=Kn(o),c=Kn(a)===a,m=await(s.isRTL==null?void 0:s.isRTL(u.floating)),S=h||(c||!w?[ul(a)]:my(a));!h&&g!=="none"&&S.push(...gy(a,w,g,m));const A=[a,...S],E=await Rm(t,C),N=[];let b=((r=i.flip)==null?void 0:r.overflows)||[];if(d&&N.push(E[f]),p){const ee=py(o,l,m);N.push(E[ee[0]],E[ee[1]])}if(b=[...b,{placement:o,overflows:N}],!N.every(ee=>ee<=0)){var z,F;const ee=(((z=i.flip)==null?void 0:z.index)||0)+1,I=A[ee];if(I)return{data:{index:ee,overflows:b},reset:{placement:I}};let H=(F=b.filter(M=>M.overflows[0]<=0).sort((M,V)=>M.overflows[1]-V.overflows[1])[0])==null?void 0:F.placement;if(!H)switch(v){case"bestFit":{var ae;const M=(ae=b.map(V=>[V.placement,V.overflows.filter(G=>G>0).reduce((G,P)=>G+P,0)]).sort((V,G)=>V[1]-G[1])[0])==null?void 0:ae[0];M&&(H=M);break}case"initialPlacement":H=a;break}if(o!==H)return{reset:{placement:H}}}return{}}}};async function Sy(e,t){const{placement:n,platform:r,elements:o}=e,i=await(r.isRTL==null?void 0:r.isRTL(o.floating)),l=Kn(n),a=Yo(n),s=Fl(n)==="y",u=["left","top"].includes(l)?-1:1,d=i&&s?-1:1,p=Go(t,e);let{mainAxis:h,crossAxis:v,alignmentAxis:g}=typeof p=="number"?{mainAxis:p,crossAxis:0,alignmentAxis:null}:{mainAxis:0,crossAxis:0,alignmentAxis:null,...p};return a&&typeof g=="number"&&(v=a==="end"?g*-1:g),s?{x:v*d,y:h*u}:{x:h*u,y:v*d}}const ky=function(e){return e===void 0&&(e=0),{name:"offset",options:e,async fn(t){var n,r;const{x:o,y:i,placement:l,middlewareData:a}=t,s=await Sy(t,e);return l===((n=a.offset)==null?void 0:n.placement)&&(r=a.arrow)!=null&&r.alignmentOffset?{}:{x:o+s.x,y:i+s.y,data:{...s,placement:l}}}}},Cy=function(e){return e===void 0&&(e={}),{name:"shift",options:e,async fn(t){const{x:n,y:r,placement:o}=t,{mainAxis:i=!0,crossAxis:l=!1,limiter:a={fn:C=>{let{x:f,y:c}=C;return{x:f,y:c}}},...s}=Go(e,t),u={x:n,y:r},d=await Rm(t,s),p=Fl(Kn(o)),h=Nm(p);let v=u[h],g=u[p];if(i){const C=h==="y"?"top":"left",f=h==="y"?"bottom":"right",c=v+d[C],m=v-d[f];v=Es(c,v,m)}if(l){const C=p==="y"?"top":"left",f=p==="y"?"bottom":"right",c=g+d[C],m=g-d[f];g=Es(c,g,m)}const w=a.fn({...t,[h]:v,[p]:g});return{...w,data:{x:w.x-n,y:w.y-r}}}}},Ns=Math.min,Rr=Math.max,fl=Math.round,wi=Math.floor,_n=e=>({x:e,y:e});function On(e){return Pm(e)?(e.nodeName||"").toLowerCase():"#document"}function dt(e){var t;return(e==null||(t=e.ownerDocument)==null?void 0:t.defaultView)||window}function cn(e){var t;return(t=(Pm(e)?e.ownerDocument:e.document)||window.document)==null?void 0:t.documentElement}function Pm(e){return e instanceof Node||e instanceof dt(e).Node}function sn(e){return e instanceof Element||e instanceof dt(e).Element}function Gt(e){return e instanceof HTMLElement||e instanceof dt(e).HTMLElement}function Nf(e){return typeof ShadowRoot>"u"?!1:e instanceof ShadowRoot||e instanceof dt(e).ShadowRoot}function Xo(e){const{overflow:t,overflowX:n,overflowY:r,display:o}=At(e);return/auto|scroll|overlay|hidden|clip/.test(t+r+n)&&!["inline","contents"].includes(o)}function Ey(e){return["table","td","th"].includes(On(e))}function Uu(e){const t=Fu(),n=At(e);return n.transform!=="none"||n.perspective!=="none"||(n.containerType?n.containerType!=="normal":!1)||!t&&(n.backdropFilter?n.backdropFilter!=="none":!1)||!t&&(n.filter?n.filter!=="none":!1)||["transform","perspective","filter"].some(r=>(n.willChange||"").includes(r))||["paint","layout","strict","content"].some(r=>(n.contain||"").includes(r))}function Ay(e){let t=jr(e);for(;Gt(t)&&!Bl(t);){if(Uu(t))return t;t=jr(t)}return null}function Fu(){return typeof CSS>"u"||!CSS.supports?!1:CSS.supports("-webkit-backdrop-filter","none")}function Bl(e){return["html","body","#document"].includes(On(e))}function At(e){return dt(e).getComputedStyle(e)}function Vl(e){return sn(e)?{scrollLeft:e.scrollLeft,scrollTop:e.scrollTop}:{scrollLeft:e.pageXOffset,scrollTop:e.pageYOffset}}function jr(e){if(On(e)==="html")return e;const t=e.assignedSlot||e.parentNode||Nf(e)&&e.host||cn(e);return Nf(t)?t.host:t}function Lm(e){const t=jr(e);return Bl(t)?e.ownerDocument?e.ownerDocument.body:e.body:Gt(t)&&Xo(t)?t:Lm(t)}function Do(e,t,n){var r;t===void 0&&(t=[]),n===void 0&&(n=!0);const o=Lm(e),i=o===((r=e.ownerDocument)==null?void 0:r.body),l=dt(o);return i?t.concat(l,l.visualViewport||[],Xo(o)?o:[],l.frameElement&&n?Do(l.frameElement):[]):t.concat(o,Do(o,[],n))}function _m(e){const t=At(e);let n=parseFloat(t.width)||0,r=parseFloat(t.height)||0;const o=Gt(e),i=o?e.offsetWidth:n,l=o?e.offsetHeight:r,a=fl(n)!==i||fl(r)!==l;return a&&(n=i,r=l),{width:n,height:r,$:a}}function Bu(e){return sn(e)?e:e.contextElement}function Pr(e){const t=Bu(e);if(!Gt(t))return _n(1);const n=t.getBoundingClientRect(),{width:r,height:o,$:i}=_m(t);let l=(i?fl(n.width):n.width)/r,a=(i?fl(n.height):n.height)/o;return(!l||!Number.isFinite(l))&&(l=1),(!a||!Number.isFinite(a))&&(a=1),{x:l,y:a}}const Ny=_n(0);function Om(e){const t=dt(e);return!Fu()||!t.visualViewport?Ny:{x:t.visualViewport.offsetLeft,y:t.visualViewport.offsetTop}}function by(e,t,n){return t===void 0&&(t=!1),!n||t&&n!==dt(e)?!1:t}function Zn(e,t,n,r){t===void 0&&(t=!1),n===void 0&&(n=!1);const o=e.getBoundingClientRect(),i=Bu(e);let l=_n(1);t&&(r?sn(r)&&(l=Pr(r)):l=Pr(e));const a=by(i,n,r)?Om(i):_n(0);let s=(o.left+a.x)/l.x,u=(o.top+a.y)/l.y,d=o.width/l.x,p=o.height/l.y;if(i){const h=dt(i),v=r&&sn(r)?dt(r):r;let g=h,w=g.frameElement;for(;w&&r&&v!==g;){const C=Pr(w),f=w.getBoundingClientRect(),c=At(w),m=f.left+(w.clientLeft+parseFloat(c.paddingLeft))*C.x,S=f.top+(w.clientTop+parseFloat(c.paddingTop))*C.y;s*=C.x,u*=C.y,d*=C.x,p*=C.y,s+=m,u+=S,g=dt(w),w=g.frameElement}}return cl({width:d,height:p,x:s,y:u})}const Ry=[":popover-open",":modal"];function Im(e){return Ry.some(t=>{try{return e.matches(t)}catch{return!1}})}function Py(e){let{elements:t,rect:n,offsetParent:r,strategy:o}=e;const i=o==="fixed",l=cn(r),a=t?Im(t.floating):!1;if(r===l||a&&i)return n;let s={scrollLeft:0,scrollTop:0},u=_n(1);const d=_n(0),p=Gt(r);if((p||!p&&!i)&&((On(r)!=="body"||Xo(l))&&(s=Vl(r)),Gt(r))){const h=Zn(r);u=Pr(r),d.x=h.x+r.clientLeft,d.y=h.y+r.clientTop}return{width:n.width*u.x,height:n.height*u.y,x:n.x*u.x-s.scrollLeft*u.x+d.x,y:n.y*u.y-s.scrollTop*u.y+d.y}}function Ly(e){return Array.from(e.getClientRects())}function Tm(e){return Zn(cn(e)).left+Vl(e).scrollLeft}function _y(e){const t=cn(e),n=Vl(e),r=e.ownerDocument.body,o=Rr(t.scrollWidth,t.clientWidth,r.scrollWidth,r.clientWidth),i=Rr(t.scrollHeight,t.clientHeight,r.scrollHeight,r.clientHeight);let l=-n.scrollLeft+Tm(e);const a=-n.scrollTop;return At(r).direction==="rtl"&&(l+=Rr(t.clientWidth,r.clientWidth)-o),{width:o,height:i,x:l,y:a}}function Oy(e,t){const n=dt(e),r=cn(e),o=n.visualViewport;let i=r.clientWidth,l=r.clientHeight,a=0,s=0;if(o){i=o.width,l=o.height;const u=Fu();(!u||u&&t==="fixed")&&(a=o.offsetLeft,s=o.offsetTop)}return{width:i,height:l,x:a,y:s}}function Iy(e,t){const n=Zn(e,!0,t==="fixed"),r=n.top+e.clientTop,o=n.left+e.clientLeft,i=Gt(e)?Pr(e):_n(1),l=e.clientWidth*i.x,a=e.clientHeight*i.y,s=o*i.x,u=r*i.y;return{width:l,height:a,x:s,y:u}}function bf(e,t,n){let r;if(t==="viewport")r=Oy(e,n);else if(t==="document")r=_y(cn(e));else if(sn(t))r=Iy(t,n);else{const o=Om(e);r={...t,x:t.x-o.x,y:t.y-o.y}}return cl(r)}function zm(e,t){const n=jr(e);return n===t||!sn(n)||Bl(n)?!1:At(n).position==="fixed"||zm(n,t)}function Ty(e,t){const n=t.get(e);if(n)return n;let r=Do(e,[],!1).filter(a=>sn(a)&&On(a)!=="body"),o=null;const i=At(e).position==="fixed";let l=i?jr(e):e;for(;sn(l)&&!Bl(l);){const a=At(l),s=Uu(l);!s&&a.position==="fixed"&&(o=null),(i?!s&&!o:!s&&a.position==="static"&&!!o&&["absolute","fixed"].includes(o.position)||Xo(l)&&!s&&zm(e,l))?r=r.filter(d=>d!==l):o=a,l=jr(l)}return t.set(e,r),r}function zy(e){let{element:t,boundary:n,rootBoundary:r,strategy:o}=e;const l=[...n==="clippingAncestors"?Ty(t,this._c):[].concat(n),r],a=l[0],s=l.reduce((u,d)=>{const p=bf(t,d,o);return u.top=Rr(p.top,u.top),u.right=Ns(p.right,u.right),u.bottom=Ns(p.bottom,u.bottom),u.left=Rr(p.left,u.left),u},bf(t,a,o));return{width:s.right-s.left,height:s.bottom-s.top,x:s.left,y:s.top}}function My(e){const{width:t,height:n}=_m(e);return{width:t,height:n}}function $y(e,t,n){const r=Gt(t),o=cn(t),i=n==="fixed",l=Zn(e,!0,i,t);let a={scrollLeft:0,scrollTop:0};const s=_n(0);if(r||!r&&!i)if((On(t)!=="body"||Xo(o))&&(a=Vl(t)),r){const p=Zn(t,!0,i,t);s.x=p.x+t.clientLeft,s.y=p.y+t.clientTop}else o&&(s.x=Tm(o));const u=l.left+a.scrollLeft-s.x,d=l.top+a.scrollTop-s.y;return{x:u,y:d,width:l.width,height:l.height}}function Rf(e,t){return!Gt(e)||At(e).position==="fixed"?null:t?t(e):e.offsetParent}function Mm(e,t){const n=dt(e);if(!Gt(e)||Im(e))return n;let r=Rf(e,t);for(;r&&Ey(r)&&At(r).position==="static";)r=Rf(r,t);return r&&(On(r)==="html"||On(r)==="body"&&At(r).position==="static"&&!Uu(r))?n:r||Ay(e)||n}const jy=async function(e){const t=this.getOffsetParent||Mm,n=this.getDimensions;return{reference:$y(e.reference,await t(e.floating),e.strategy),floating:{x:0,y:0,...await n(e.floating)}}};function Dy(e){return At(e).direction==="rtl"}const Uy={convertOffsetParentRelativeRectToViewportRelativeRect:Py,getDocumentElement:cn,getClippingRect:zy,getOffsetParent:Mm,getElementRects:jy,getClientRects:Ly,getDimensions:My,getScale:Pr,isElement:sn,isRTL:Dy};function Fy(e,t){let n=null,r;const o=cn(e);function i(){var a;clearTimeout(r),(a=n)==null||a.disconnect(),n=null}function l(a,s){a===void 0&&(a=!1),s===void 0&&(s=1),i();const{left:u,top:d,width:p,height:h}=e.getBoundingClientRect();if(a||t(),!p||!h)return;const v=wi(d),g=wi(o.clientWidth-(u+p)),w=wi(o.clientHeight-(d+h)),C=wi(u),c={rootMargin:-v+"px "+-g+"px "+-w+"px "+-C+"px",threshold:Rr(0,Ns(1,s))||1};let m=!0;function S(A){const E=A[0].intersectionRatio;if(E!==s){if(!m)return l();E?l(!1,E):r=setTimeout(()=>{l(!1,1e-7)},100)}m=!1}try{n=new IntersectionObserver(S,{...c,root:o.ownerDocument})}catch{n=new IntersectionObserver(S,c)}n.observe(e)}return l(!0),i}function By(e,t,n,r){r===void 0&&(r={});const{ancestorScroll:o=!0,ancestorResize:i=!0,elementResize:l=typeof ResizeObserver=="function",layoutShift:a=typeof IntersectionObserver=="function",animationFrame:s=!1}=r,u=Bu(e),d=o||i?[...u?Do(u):[],...Do(t)]:[];d.forEach(f=>{o&&f.addEventListener("scroll",n,{passive:!0}),i&&f.addEventListener("resize",n)});const p=u&&a?Fy(u,n):null;let h=-1,v=null;l&&(v=new ResizeObserver(f=>{let[c]=f;c&&c.target===u&&v&&(v.unobserve(t),cancelAnimationFrame(h),h=requestAnimationFrame(()=>{var m;(m=v)==null||m.observe(t)})),n()}),u&&!s&&v.observe(u),v.observe(t));let g,w=s?Zn(e):null;s&&C();function C(){const f=Zn(e);w&&(f.x!==w.x||f.y!==w.y||f.width!==w.width||f.height!==w.height)&&n(),w=f,g=requestAnimationFrame(C)}return n(),()=>{var f;d.forEach(c=>{o&&c.removeEventListener("scroll",n),i&&c.removeEventListener("resize",n)}),p==null||p(),(f=v)==null||f.disconnect(),v=null,s&&cancelAnimationFrame(g)}}const Vy=Cy,Hy=xy,Wy=wy,Pf=(e,t,n)=>{const r=new Map,o={platform:Uy,...n},i={...o.platform,_c:r};return yy(e,t,{...o,platform:i})};var $m={exports:{}};/*!
	Copyright (c) 2018 Jed Watson.
	Licensed under the MIT License (MIT), see
	http://jedwatson.github.io/classnames
*/(function(e){(function(){var t={}.hasOwnProperty;function n(){for(var r=[],o=0;o<arguments.length;o++){var i=arguments[o];if(i){var l=typeof i;if(l==="string"||l==="number")r.push(i);else if(Array.isArray(i)){if(i.length){var a=n.apply(null,i);a&&r.push(a)}}else if(l==="object"){if(i.toString!==Object.prototype.toString&&!i.toString.toString().includes("[native code]")){r.push(i.toString());continue}for(var s in i)t.call(i,s)&&i[s]&&r.push(s)}}}return r.join(" ")}e.exports?(n.default=n,e.exports=n):window.classNames=n})()})($m);var Qy=$m.exports;const bs=Ps(Qy);/*
* React Tooltip
* {@link https://github.com/ReactTooltip/react-tooltip}
* @copyright ReactTooltip Team
* @license MIT
*/const Gy="react-tooltip-core-styles",Yy="react-tooltip-base-styles",Lf={core:!1,base:!1};function _f({css:e,id:t=Yy,type:n="base",ref:r}){var o,i;if(!e||typeof document>"u"||Lf[n]||n==="core"&&typeof process<"u"&&(!((o=process==null?void 0:process.env)===null||o===void 0)&&o.REACT_TOOLTIP_DISABLE_CORE_STYLES)||n!=="base"&&typeof process<"u"&&(!((i=process==null?void 0:process.env)===null||i===void 0)&&i.REACT_TOOLTIP_DISABLE_BASE_STYLES))return;n==="core"&&(t=Gy),r||(r={});const{insertAt:l}=r;if(document.getElementById(t))return void console.warn(`[react-tooltip] Element with id '${t}' already exists. Call \`removeStyle()\` first`);const a=document.head||document.getElementsByTagName("head")[0],s=document.createElement("style");s.id=t,s.type="text/css",l==="top"&&a.firstChild?a.insertBefore(s,a.firstChild):a.appendChild(s),s.styleSheet?s.styleSheet.cssText=e:s.appendChild(document.createTextNode(e)),Lf[n]=!0}const Of=async({elementReference:e=null,tooltipReference:t=null,tooltipArrowReference:n=null,place:r="top",offset:o=10,strategy:i="absolute",middlewares:l=[ky(Number(o)),Hy({fallbackAxisSideDirection:"start"}),Vy({padding:5})],border:a})=>{if(!e)return{tooltipStyles:{},tooltipArrowStyles:{},place:r};if(t===null)return{tooltipStyles:{},tooltipArrowStyles:{},place:r};const s=l;return n?(s.push(Wy({element:n,padding:5})),Pf(e,t,{placement:r,strategy:i,middleware:s}).then(({x:u,y:d,placement:p,middlewareData:h})=>{var v,g;const w={left:`${u}px`,top:`${d}px`,border:a},{x:C,y:f}=(v=h.arrow)!==null&&v!==void 0?v:{x:0,y:0},c=(g={top:"bottom",right:"left",bottom:"top",left:"right"}[p.split("-")[0]])!==null&&g!==void 0?g:"bottom",m=a&&{borderBottom:a,borderRight:a};let S=0;if(a){const A=`${a}`.match(/(\d+)px/);S=A!=null&&A[1]?Number(A[1]):1}return{tooltipStyles:w,tooltipArrowStyles:{left:C!=null?`${C}px`:"",top:f!=null?`${f}px`:"",right:"",bottom:"",...m,[c]:`-${4+S}px`},place:p}})):Pf(e,t,{placement:"bottom",strategy:i,middleware:s}).then(({x:u,y:d,placement:p})=>({tooltipStyles:{left:`${u}px`,top:`${d}px`},tooltipArrowStyles:{},place:p}))},If=(e,t)=>!("CSS"in window&&"supports"in window.CSS)||window.CSS.supports(e,t),Tf=(e,t,n)=>{let r=null;const o=function(...i){const l=()=>{r=null,n||e.apply(this,i)};n&&!r&&(e.apply(this,i),r=setTimeout(l,t)),n||(r&&clearTimeout(r),r=setTimeout(l,t))};return o.cancel=()=>{r&&(clearTimeout(r),r=null)},o},zf=e=>e!==null&&!Array.isArray(e)&&typeof e=="object",Rs=(e,t)=>{if(e===t)return!0;if(Array.isArray(e)&&Array.isArray(t))return e.length===t.length&&e.every((o,i)=>Rs(o,t[i]));if(Array.isArray(e)!==Array.isArray(t))return!1;if(!zf(e)||!zf(t))return e===t;const n=Object.keys(e),r=Object.keys(t);return n.length===r.length&&n.every(o=>Rs(e[o],t[o]))},Xy=e=>{if(!(e instanceof HTMLElement||e instanceof SVGElement))return!1;const t=getComputedStyle(e);return["overflow","overflow-x","overflow-y"].some(n=>{const r=t.getPropertyValue(n);return r==="auto"||r==="scroll"})},Mf=e=>{if(!e)return null;let t=e.parentElement;for(;t;){if(Xy(t))return t;t=t.parentElement}return document.scrollingElement||document.documentElement},Ky=typeof window<"u"?x.useLayoutEffect:x.useEffect,Zy="DEFAULT_TOOLTIP_ID",Jy={anchorRefs:new Set,activeAnchor:{current:null},attach:()=>{},detach:()=>{},setActiveAnchor:()=>{}},qy=x.createContext({getTooltipData:()=>Jy});function jm(e=Zy){return x.useContext(qy).getTooltipData(e)}var sr={tooltip:"core-styles-module_tooltip__3vRRp",fixed:"core-styles-module_fixed__pcSol",arrow:"core-styles-module_arrow__cvMwQ",noArrow:"core-styles-module_noArrow__xock6",clickable:"core-styles-module_clickable__ZuTTB",show:"core-styles-module_show__Nt9eE",closing:"core-styles-module_closing__sGnxF"},Sa={tooltip:"styles-module_tooltip__mnnfp",arrow:"styles-module_arrow__K0L3T",dark:"styles-module_dark__xNqje",light:"styles-module_light__Z6W-X",success:"styles-module_success__A2AKt",warning:"styles-module_warning__SCK0X",error:"styles-module_error__JvumD",info:"styles-module_info__BWdHW"};const e2=({forwardRef:e,id:t,className:n,classNameArrow:r,variant:o="dark",anchorId:i,anchorSelect:l,place:a="top",offset:s=10,events:u=["hover"],openOnClick:d=!1,positionStrategy:p="absolute",middlewares:h,wrapper:v,delayShow:g=0,delayHide:w=0,float:C=!1,hidden:f=!1,noArrow:c=!1,clickable:m=!1,closeOnEsc:S=!1,closeOnScroll:A=!1,closeOnResize:E=!1,openEvents:N,closeEvents:b,globalCloseEvents:z,imperativeModeOnly:F,style:ae,position:ee,afterShow:I,afterHide:H,content:M,contentWrapperRef:V,isOpen:G,defaultIsOpen:P=!1,setIsOpen:B,activeAnchor:j,setActiveAnchor:se,border:O,opacity:T,arrowColor:$,role:X="tooltip"})=>{var k;const W=x.useRef(null),_=x.useRef(null),ne=x.useRef(null),J=x.useRef(null),oe=x.useRef(null),[Y,Re]=x.useState({tooltipStyles:{},tooltipArrowStyles:{},place:a}),[he,ie]=x.useState(!1),[xe,re]=x.useState(!1),[te,Nt]=x.useState(null),Ce=x.useRef(!1),jt=x.useRef(null),{anchorRefs:bt,setActiveAnchor:Ve}=jm(t),Q=x.useRef(!1),[de,Yt]=x.useState([]),Rt=x.useRef(!1),Xe=d||u.includes("click"),Vr=Xe||(N==null?void 0:N.click)||(N==null?void 0:N.dblclick)||(N==null?void 0:N.mousedown),nr=N?{...N}:{mouseenter:!0,focus:!0,click:!1,dblclick:!1,mousedown:!1};!N&&Xe&&Object.assign(nr,{mouseenter:!1,focus:!1,click:!0});const Hr=b?{...b}:{mouseleave:!0,blur:!0,click:!1,dblclick:!1,mouseup:!1};!b&&Xe&&Object.assign(Hr,{mouseleave:!1,blur:!1});const Pt=z?{...z}:{escape:S||!1,scroll:A||!1,resize:E||!1,clickOutsideAnchor:Vr||!1};F&&(Object.assign(nr,{mouseenter:!1,focus:!1,click:!1,dblclick:!1,mousedown:!1}),Object.assign(Hr,{mouseleave:!1,blur:!1,click:!1,dblclick:!1,mouseup:!1}),Object.assign(Pt,{escape:!1,scroll:!1,resize:!1,clickOutsideAnchor:!1})),Ky(()=>(Rt.current=!0,()=>{Rt.current=!1}),[]);const Le=D=>{Rt.current&&(D&&re(!0),setTimeout(()=>{Rt.current&&(B==null||B(D),G===void 0&&ie(D))},10))};x.useEffect(()=>{if(G===void 0)return()=>null;G&&re(!0);const D=setTimeout(()=>{ie(G)},10);return()=>{clearTimeout(D)}},[G]),x.useEffect(()=>{if(he!==Ce.current)if(oe.current&&clearTimeout(oe.current),Ce.current=he,he)I==null||I();else{const D=(Z=>{const q=Z.match(/^([\d.]+)(ms|s)$/);if(!q)return 0;const[,Me,He]=q;return Number(Me)*(He==="ms"?1:1e3)})(getComputedStyle(document.body).getPropertyValue("--rt-transition-show-delay"));oe.current=setTimeout(()=>{re(!1),Nt(null),H==null||H()},D+25)}},[he]);const Ko=D=>{Re(Z=>Rs(Z,D)?Z:D)},Wr=(D=g)=>{ne.current&&clearTimeout(ne.current),xe?Le(!0):ne.current=setTimeout(()=>{Le(!0)},D)},rr=(D=w)=>{J.current&&clearTimeout(J.current),J.current=setTimeout(()=>{Q.current||Le(!1)},D)},Qr=D=>{var Z;if(!D)return;const q=(Z=D.currentTarget)!==null&&Z!==void 0?Z:D.target;if(!(q!=null&&q.isConnected))return se(null),void Ve({current:null});g?Wr():Le(!0),se(q),Ve({current:q}),J.current&&clearTimeout(J.current)},or=()=>{m?rr(w||100):w?rr():Le(!1),ne.current&&clearTimeout(ne.current)},ir=({x:D,y:Z})=>{var q;const Me={getBoundingClientRect:()=>({x:D,y:Z,width:0,height:0,top:Z,left:D,right:D,bottom:Z})};Of({place:(q=te==null?void 0:te.place)!==null&&q!==void 0?q:a,offset:s,elementReference:Me,tooltipReference:W.current,tooltipArrowReference:_.current,strategy:p,middlewares:h,border:O}).then(He=>{Ko(He)})},lr=D=>{if(!D)return;const Z=D,q={x:Z.clientX,y:Z.clientY};ir(q),jt.current=q},Gr=D=>{var Z;if(!he)return;const q=D.target;q.isConnected&&(!((Z=W.current)===null||Z===void 0)&&Z.contains(q)||[document.querySelector(`[id='${i}']`),...de].some(Me=>Me==null?void 0:Me.contains(q))||(Le(!1),ne.current&&clearTimeout(ne.current)))},Zo=Tf(Qr,50,!0),ze=Tf(or,50,!0),vt=D=>{ze.cancel(),Zo(D)},K=()=>{Zo.cancel(),ze()},ue=x.useCallback(()=>{var D,Z;const q=(D=te==null?void 0:te.position)!==null&&D!==void 0?D:ee;q?ir(q):C?jt.current&&ir(jt.current):j!=null&&j.isConnected&&Of({place:(Z=te==null?void 0:te.place)!==null&&Z!==void 0?Z:a,offset:s,elementReference:j,tooltipReference:W.current,tooltipArrowReference:_.current,strategy:p,middlewares:h,border:O}).then(Me=>{Rt.current&&Ko(Me)})},[he,j,M,ae,a,te==null?void 0:te.place,s,p,ee,te==null?void 0:te.position,C]);x.useEffect(()=>{var D,Z;const q=new Set(bt);de.forEach(ge=>{q.add({current:ge})});const Me=document.querySelector(`[id='${i}']`);Me&&q.add({current:Me});const He=()=>{Le(!1)},Dt=Mf(j),Ut=Mf(W.current);Pt.scroll&&(window.addEventListener("scroll",He),Dt==null||Dt.addEventListener("scroll",He),Ut==null||Ut.addEventListener("scroll",He));let Ke=null;Pt.resize?window.addEventListener("resize",He):j&&W.current&&(Ke=By(j,W.current,ue,{ancestorResize:!0,elementResize:!0,layoutShift:!0}));const yt=ge=>{ge.key==="Escape"&&Le(!1)};Pt.escape&&window.addEventListener("keydown",yt),Pt.clickOutsideAnchor&&window.addEventListener("click",Gr);const Se=[],Yr=ge=>{he&&(ge==null?void 0:ge.target)===j||Qr(ge)},Dm=ge=>{he&&(ge==null?void 0:ge.target)===j&&or()},Vu=["mouseenter","mouseleave","focus","blur"],Hu=["click","dblclick","mousedown","mouseup"];Object.entries(nr).forEach(([ge,Xt])=>{Xt&&(Vu.includes(ge)?Se.push({event:ge,listener:vt}):Hu.includes(ge)&&Se.push({event:ge,listener:Yr}))}),Object.entries(Hr).forEach(([ge,Xt])=>{Xt&&(Vu.includes(ge)?Se.push({event:ge,listener:K}):Hu.includes(ge)&&Se.push({event:ge,listener:Dm}))}),C&&Se.push({event:"pointermove",listener:lr});const Wu=()=>{Q.current=!0},Qu=()=>{Q.current=!1,or()};return m&&!Vr&&((D=W.current)===null||D===void 0||D.addEventListener("mouseenter",Wu),(Z=W.current)===null||Z===void 0||Z.addEventListener("mouseleave",Qu)),Se.forEach(({event:ge,listener:Xt})=>{q.forEach(Hl=>{var Xr;(Xr=Hl.current)===null||Xr===void 0||Xr.addEventListener(ge,Xt)})}),()=>{var ge,Xt;Pt.scroll&&(window.removeEventListener("scroll",He),Dt==null||Dt.removeEventListener("scroll",He),Ut==null||Ut.removeEventListener("scroll",He)),Pt.resize?window.removeEventListener("resize",He):Ke==null||Ke(),Pt.clickOutsideAnchor&&window.removeEventListener("click",Gr),Pt.escape&&window.removeEventListener("keydown",yt),m&&!Vr&&((ge=W.current)===null||ge===void 0||ge.removeEventListener("mouseenter",Wu),(Xt=W.current)===null||Xt===void 0||Xt.removeEventListener("mouseleave",Qu)),Se.forEach(({event:Hl,listener:Xr})=>{q.forEach(Um=>{var Wl;(Wl=Um.current)===null||Wl===void 0||Wl.removeEventListener(Hl,Xr)})})}},[j,ue,xe,bt,de,N,b,z,Xe,g,w]),x.useEffect(()=>{var D,Z;let q=(Z=(D=te==null?void 0:te.anchorSelect)!==null&&D!==void 0?D:l)!==null&&Z!==void 0?Z:"";!q&&t&&(q=`[data-tooltip-id='${t}']`);const Me=new MutationObserver(He=>{const Dt=[],Ut=[];He.forEach(Ke=>{if(Ke.type==="attributes"&&Ke.attributeName==="data-tooltip-id"&&(Ke.target.getAttribute("data-tooltip-id")===t?Dt.push(Ke.target):Ke.oldValue===t&&Ut.push(Ke.target)),Ke.type==="childList"){if(j){const yt=[...Ke.removedNodes].filter(Se=>Se.nodeType===1);if(q)try{Ut.push(...yt.filter(Se=>Se.matches(q))),Ut.push(...yt.flatMap(Se=>[...Se.querySelectorAll(q)]))}catch{}yt.some(Se=>{var Yr;return!!(!((Yr=Se==null?void 0:Se.contains)===null||Yr===void 0)&&Yr.call(Se,j))&&(re(!1),Le(!1),se(null),ne.current&&clearTimeout(ne.current),J.current&&clearTimeout(J.current),!0)})}if(q)try{const yt=[...Ke.addedNodes].filter(Se=>Se.nodeType===1);Dt.push(...yt.filter(Se=>Se.matches(q))),Dt.push(...yt.flatMap(Se=>[...Se.querySelectorAll(q)]))}catch{}}}),(Dt.length||Ut.length)&&Yt(Ke=>[...Ke.filter(yt=>!Ut.includes(yt)),...Dt])});return Me.observe(document.body,{childList:!0,subtree:!0,attributes:!0,attributeFilter:["data-tooltip-id"],attributeOldValue:!0}),()=>{Me.disconnect()}},[t,l,te==null?void 0:te.anchorSelect,j]),x.useEffect(()=>{ue()},[ue]),x.useEffect(()=>{if(!(V!=null&&V.current))return()=>null;const D=new ResizeObserver(()=>{setTimeout(()=>ue())});return D.observe(V.current),()=>{D.disconnect()}},[M,V==null?void 0:V.current]),x.useEffect(()=>{var D;const Z=document.querySelector(`[id='${i}']`),q=[...de,Z];j&&q.includes(j)||se((D=de[0])!==null&&D!==void 0?D:Z)},[i,de,j]),x.useEffect(()=>(P&&Le(!0),()=>{ne.current&&clearTimeout(ne.current),J.current&&clearTimeout(J.current)}),[]),x.useEffect(()=>{var D;let Z=(D=te==null?void 0:te.anchorSelect)!==null&&D!==void 0?D:l;if(!Z&&t&&(Z=`[data-tooltip-id='${t}']`),Z)try{const q=Array.from(document.querySelectorAll(Z));Yt(q)}catch{Yt([])}},[t,l,te==null?void 0:te.anchorSelect]),x.useEffect(()=>{ne.current&&(clearTimeout(ne.current),Wr(g))},[g]);const lt=(k=te==null?void 0:te.content)!==null&&k!==void 0?k:M,Mn=he&&Object.keys(Y.tooltipStyles).length>0;return x.useImperativeHandle(e,()=>({open:D=>{if(D!=null&&D.anchorSelect)try{document.querySelector(D.anchorSelect)}catch{return void console.warn(`[react-tooltip] "${D.anchorSelect}" is not a valid CSS selector`)}Nt(D??null),D!=null&&D.delay?Wr(D.delay):Le(!0)},close:D=>{D!=null&&D.delay?rr(D.delay):Le(!1)},activeAnchor:j,place:Y.place,isOpen:!!(xe&&!f&&lt&&Mn)})),xe&&!f&&lt?st.createElement(v,{id:t,role:X,className:bs("react-tooltip",sr.tooltip,Sa.tooltip,Sa[o],n,`react-tooltip__place-${Y.place}`,sr[Mn?"show":"closing"],Mn?"react-tooltip__show":"react-tooltip__closing",p==="fixed"&&sr.fixed,m&&sr.clickable),onTransitionEnd:D=>{oe.current&&clearTimeout(oe.current),he||D.propertyName!=="opacity"||(re(!1),Nt(null),H==null||H())},style:{...ae,...Y.tooltipStyles,opacity:T!==void 0&&Mn?T:void 0},ref:W},lt,st.createElement(v,{className:bs("react-tooltip-arrow",sr.arrow,Sa.arrow,r,c&&sr.noArrow),style:{...Y.tooltipArrowStyles,background:$?`linear-gradient(to right bottom, transparent 50%, ${$} 50%)`:void 0},ref:_})):null},t2=({content:e})=>st.createElement("span",{dangerouslySetInnerHTML:{__html:e}}),n2=st.forwardRef(({id:e,anchorId:t,anchorSelect:n,content:r,html:o,render:i,className:l,classNameArrow:a,variant:s="dark",place:u="top",offset:d=10,wrapper:p="div",children:h=null,events:v=["hover"],openOnClick:g=!1,positionStrategy:w="absolute",middlewares:C,delayShow:f=0,delayHide:c=0,float:m=!1,hidden:S=!1,noArrow:A=!1,clickable:E=!1,closeOnEsc:N=!1,closeOnScroll:b=!1,closeOnResize:z=!1,openEvents:F,closeEvents:ae,globalCloseEvents:ee,imperativeModeOnly:I=!1,style:H,position:M,isOpen:V,defaultIsOpen:G=!1,disableStyleInjection:P=!1,border:B,opacity:j,arrowColor:se,setIsOpen:O,afterShow:T,afterHide:$,role:X="tooltip"},k)=>{const[W,_]=x.useState(r),[ne,J]=x.useState(o),[oe,Y]=x.useState(u),[Re,he]=x.useState(s),[ie,xe]=x.useState(d),[re,te]=x.useState(f),[Nt,Ce]=x.useState(c),[jt,bt]=x.useState(m),[Ve,Q]=x.useState(S),[de,Yt]=x.useState(p),[Rt,Xe]=x.useState(v),[Vr,nr]=x.useState(w),[Hr,Pt]=x.useState(null),[Le,Ko]=x.useState(null),Wr=x.useRef(P),{anchorRefs:rr,activeAnchor:Qr}=jm(e),or=ze=>ze==null?void 0:ze.getAttributeNames().reduce((vt,K)=>{var ue;return K.startsWith("data-tooltip-")&&(vt[K.replace(/^data-tooltip-/,"")]=(ue=ze==null?void 0:ze.getAttribute(K))!==null&&ue!==void 0?ue:null),vt},{}),ir=ze=>{const vt={place:K=>{var ue;Y((ue=K)!==null&&ue!==void 0?ue:u)},content:K=>{_(K??r)},html:K=>{J(K??o)},variant:K=>{var ue;he((ue=K)!==null&&ue!==void 0?ue:s)},offset:K=>{xe(K===null?d:Number(K))},wrapper:K=>{var ue;Yt((ue=K)!==null&&ue!==void 0?ue:p)},events:K=>{const ue=K==null?void 0:K.split(" ");Xe(ue??v)},"position-strategy":K=>{var ue;nr((ue=K)!==null&&ue!==void 0?ue:w)},"delay-show":K=>{te(K===null?f:Number(K))},"delay-hide":K=>{Ce(K===null?c:Number(K))},float:K=>{bt(K===null?m:K==="true")},hidden:K=>{Q(K===null?S:K==="true")},"class-name":K=>{Pt(K)}};Object.values(vt).forEach(K=>K(null)),Object.entries(ze).forEach(([K,ue])=>{var lt;(lt=vt[K])===null||lt===void 0||lt.call(vt,ue)})};x.useEffect(()=>{_(r)},[r]),x.useEffect(()=>{J(o)},[o]),x.useEffect(()=>{Y(u)},[u]),x.useEffect(()=>{he(s)},[s]),x.useEffect(()=>{xe(d)},[d]),x.useEffect(()=>{te(f)},[f]),x.useEffect(()=>{Ce(c)},[c]),x.useEffect(()=>{bt(m)},[m]),x.useEffect(()=>{Q(S)},[S]),x.useEffect(()=>{nr(w)},[w]),x.useEffect(()=>{Wr.current!==P&&console.warn("[react-tooltip] Do not change `disableStyleInjection` dynamically.")},[P]),x.useEffect(()=>{typeof window<"u"&&window.dispatchEvent(new CustomEvent("react-tooltip-inject-styles",{detail:{disableCore:P==="core",disableBase:P}}))},[]),x.useEffect(()=>{var ze;const vt=new Set(rr);let K=n;if(!K&&e&&(K=`[data-tooltip-id='${e}']`),K)try{document.querySelectorAll(K).forEach(Z=>{vt.add({current:Z})})}catch{console.warn(`[react-tooltip] "${K}" is not a valid CSS selector`)}const ue=document.querySelector(`[id='${t}']`);if(ue&&vt.add({current:ue}),!vt.size)return()=>null;const lt=(ze=Le??ue)!==null&&ze!==void 0?ze:Qr.current,Mn=new MutationObserver(Z=>{Z.forEach(q=>{var Me;if(!lt||q.type!=="attributes"||!(!((Me=q.attributeName)===null||Me===void 0)&&Me.startsWith("data-tooltip-")))return;const He=or(lt);ir(He)})}),D={attributes:!0,childList:!1,subtree:!1};if(lt){const Z=or(lt);ir(Z),Mn.observe(lt,D)}return()=>{Mn.disconnect()}},[rr,Qr,Le,t,n]),x.useEffect(()=>{H!=null&&H.border&&console.warn("[react-tooltip] Do not set `style.border`. Use `border` prop instead."),B&&!If("border",`${B}`)&&console.warn(`[react-tooltip] "${B}" is not a valid \`border\`.`),H!=null&&H.opacity&&console.warn("[react-tooltip] Do not set `style.opacity`. Use `opacity` prop instead."),j&&!If("opacity",`${j}`)&&console.warn(`[react-tooltip] "${j}" is not a valid \`opacity\`.`)},[]);let lr=h;const Gr=x.useRef(null);if(i){const ze=i({content:(Le==null?void 0:Le.getAttribute("data-tooltip-content"))||W||null,activeAnchor:Le});lr=ze?st.createElement("div",{ref:Gr,className:"react-tooltip-content-wrapper"},ze):null}else W&&(lr=W);ne&&(lr=st.createElement(t2,{content:ne}));const Zo={forwardRef:k,id:e,anchorId:t,anchorSelect:n,className:bs(l,Hr),classNameArrow:a,content:lr,contentWrapperRef:Gr,place:oe,variant:Re,offset:ie,wrapper:de,events:Rt,openOnClick:g,positionStrategy:Vr,middlewares:C,delayShow:re,delayHide:Nt,float:jt,hidden:Ve,noArrow:A,clickable:E,closeOnEsc:N,closeOnScroll:b,closeOnResize:z,openEvents:F,closeEvents:ae,globalCloseEvents:ee,imperativeModeOnly:I,style:H,position:M,isOpen:V,defaultIsOpen:G,border:B,opacity:j,arrowColor:se,setIsOpen:O,afterShow:T,afterHide:$,activeAnchor:Le,setActiveAnchor:ze=>Ko(ze),role:X};return st.createElement(e2,{...Zo})});typeof window<"u"&&window.addEventListener("react-tooltip-inject-styles",e=>{e.detail.disableCore||_f({css:":root{--rt-color-white:#fff;--rt-color-dark:#222;--rt-color-success:#8dc572;--rt-color-error:#be6464;--rt-color-warning:#f0ad4e;--rt-color-info:#337ab7;--rt-opacity:0.9;--rt-transition-show-delay:0.15s;--rt-transition-closing-delay:0.15s}.core-styles-module_tooltip__3vRRp{position:absolute;top:0;left:0;pointer-events:none;opacity:0;will-change:opacity}.core-styles-module_fixed__pcSol{position:fixed}.core-styles-module_arrow__cvMwQ{position:absolute;background:inherit}.core-styles-module_noArrow__xock6{display:none}.core-styles-module_clickable__ZuTTB{pointer-events:auto}.core-styles-module_show__Nt9eE{opacity:var(--rt-opacity);transition:opacity var(--rt-transition-show-delay)ease-out}.core-styles-module_closing__sGnxF{opacity:0;transition:opacity var(--rt-transition-closing-delay)ease-in}",type:"core"}),e.detail.disableBase||_f({css:`
.styles-module_tooltip__mnnfp{padding:8px 16px;border-radius:3px;font-size:90%;width:max-content}.styles-module_arrow__K0L3T{width:8px;height:8px}[class*='react-tooltip__place-top']>.styles-module_arrow__K0L3T{transform:rotate(45deg)}[class*='react-tooltip__place-right']>.styles-module_arrow__K0L3T{transform:rotate(135deg)}[class*='react-tooltip__place-bottom']>.styles-module_arrow__K0L3T{transform:rotate(225deg)}[class*='react-tooltip__place-left']>.styles-module_arrow__K0L3T{transform:rotate(315deg)}.styles-module_dark__xNqje{background:var(--rt-color-dark);color:var(--rt-color-white)}.styles-module_light__Z6W-X{background-color:var(--rt-color-white);color:var(--rt-color-dark)}.styles-module_success__A2AKt{background-color:var(--rt-color-success);color:var(--rt-color-white)}.styles-module_warning__SCK0X{background-color:var(--rt-color-warning);color:var(--rt-color-white)}.styles-module_error__JvumD{background-color:var(--rt-color-error);color:var(--rt-color-white)}.styles-module_info__BWdHW{background-color:var(--rt-color-info);color:var(--rt-color-white)}`,type:"base"})});const r2=()=>{const[e,t]=x.useState([]),[n,r]=x.useState(),[o,i]=x.useState(0),[l,a]=x.useState([]),[s,u]=x.useState(!1),[d,p]=x.useState(!1),[h,v]=x.useState(),[g,w]=x.useState({}),C=x.useRef(null),f=new Audio(Sf.openedMusic),c=new Audio(Sf.win),m=6e3,[S,A]=x.useState(!1);f.volume=.3,c.volume=.3,x.useEffect(()=>{an("requestCrates",{}).then(I=>{t(I),a(I[0].itens),r(I[0].name),i(I[0].crate_index),v(I[0].icon_opened)})},[]);function E(I,H,M,V){a(I),r(H),i(M),v(V)}async function N(){try{const I=await an("openCrate",{indexCrate:o});C.current&&(clearTimeout(C.current),C.current=null),I&&(b(I),F(f),await ae(m),z(),F(c))}catch(I){console.error("Erro ao abrir caixa:",I)}}function b(I){p(!0),w(I)}function z(){f.pause(),u(!0)}function F(I){I.play()}function ae(I){return new Promise(H=>{C.current=setTimeout(()=>{H(null),C.current=null},I)})}function ee(){p(!1),u(!1),c.pause()}return R(ry,{children:[R(oy,{children:[y("b",{children:"CAIXAS"}),y("p",{children:"Escolha uma caixa para abrir"})]}),y(iy,{children:e==null?void 0:e.map((I,H)=>R(ay,{className:n==I.name?"itemBoxSelected":"",isSelected:n==I.name,hoverColor:I.color,isHovered:S,onMouseEnter:()=>A(!0),onMouseLeave:()=>A(!1),onClick:()=>E(I.itens,I.name,I.crate_index,I.icon_opened),children:[R("div",{className:"title",children:[y("p",{children:"CAIXA"}),y("h1",{style:{color:I.color},children:I.name})]}),y("div",{className:"value",children:n==I.name?y(Tt,{children:"SELECIONADO"}):R(Tt,{children:[y("img",{src:ct.coin,alt:""}),y("p",{children:I.coins})]})}),y("img",{className:"box",src:I.icon,alt:""})]},I.name+H))}),y("button",{onClick:N,children:"ABRIR CAIXA"}),R(sy,{children:[R("div",{className:"top",children:[y("b",{children:"CONTEÚDO"}),y("p",{children:"O que você ganha nessa caixa?"})]}),y("div",{className:"list",children:l==null?void 0:l.map((I,H)=>R("div",{className:"item",children:[y(n2,{id:`my-tooltip${H}`}),y("div",{className:"nameItem",children:I.name.toUpperCase()}),R("div",{className:"amountItem",children:[I.amount,"x",I.maxAmount?" - "+I.maxAmount+"x":""]}),y("img",{src:I.type=="ITEM"?"http://189.127.165.210/inventario/"+I.spawn+".png":I.type=="OTHERS"?"http://189.127.165.210/inventario/"+I.spawn+".png":"http://189.127.165.210/inventario/vehicles/v1/"+I.spawn+".png",alt:""}),y("div",{className:"line",style:{backgroundColor:I.color}})]},I.spawn+H))})]}),d&&R(uy,{children:[!s&&R("div",{className:"opening",children:[y("video",{autoPlay:!0,muted:!0,children:y("source",{src:h,type:"video/webm"})}),y("div",{className:"cover"})]}),s&&R(Tt,{children:[y("div",{className:"opened",children:R("div",{className:"item",children:[R("p",{children:[g.amount,"x"]}),y("img",{src:g.type=="ITEM"||g.type=="OTHERS"?"http://189.127.165.210/inventario/"+g.spawn+".png":"http:http://189.127.165.210/inventario/vehicles/v1/"+g.spawn+".png",alt:""}),y("div",{className:"nameItem",children:g.name.toUpperCase()})]})}),y("button",{onClick:ee,children:"FECHAR"})]})]})]})},o2=fe.div`
    width: 120.6rem;

    display: flex;
    flex-direction: column;
    padding: 2.5rem;

    position: relative;
`,i2=fe.div`
    height: 16.5rem;
    padding: 2.5rem;
    display: flex;
    flex: 1;
    align-items: flex-start;
    justify-content: center;
    background: url(${ct.bannerShop});
    background-size: 100% 100%;

    flex-direction: column;
    gap: 1rem;

    h1 {
        color: #fff;
        font-size: 1.8rem;
        font-style: normal;
        font-weight: 800;
        line-height: 110%; /* 1.98rem */
    }

    p {
        color: #fff;
        font-size: 1.4rem;
        font-style: normal;

        max-width: 32rem;
        font-weight: 400;
        line-height: 110%; /* 1.54rem */
    }

    img {
        position: absolute;
        bottom: -2.9rem;
        left: -0.7rem;
        width: 29.9rem;
    }

    button {
        width: 11rem;
        height: 3rem;

        margin-top: 2rem;

        color: #fff;
        text-align: center;
        font-size: 1.2rem;
        font-style: normal;
        font-weight: 700;
        line-height: normal;

        outline: none;
        border: 0.1rem solid rgba(255, 255, 255, 0.2);
        background: rgba(0, 0, 0, 0.35);

        &:hover {
            filter: brightness(0.8);
            cursor: pointer;
        }
    }

    .cupom {
        width: 23.5rem;
        height: 3.8rem;
        background: rgba(0, 0, 0, 0.57);

        display: flex;
        align-items: center;
        justify-content: center;
        position: absolute;
        bottom: -0.1rem;

        color: #fff;
        font-size: 1.4182rem;
        font-style: normal;
        font-weight: 700;
        line-height: normal;

        b {
            color: #bfffe0;
        }
    }
`,l2=fe.div`
    .flex {
        display: flex;
        align-items: center;
        gap: 1rem;
        margin-top: 1.5rem;

        input {
            display: flex;
            padding: 1.5rem 2rem;
            align-items: center;
            gap: 2rem;
            flex: 1;
            border-radius: 1rem;
            background: #191919;
            border: 0;
            outline: none;

            color: rgba(255, 255, 255, 1);
            font-size: 1.4rem;
            font-style: normal;
            font-weight: 300;
            line-height: 110%; /* 1.54rem */
        }

        .total {
            display: flex;
        }

        .cart {
            display: flex;
            width: 12.2rem;
            height: 4rem;
            padding: 2.2rem 2rem;
            align-items: center;
            gap: 1rem;

            background-color: transparent;
            border-radius: 1rem 0rem 0rem 1rem;
            border: 0.1rem solid #292929;

            display: flex;
            align-items: center;
            justify-content: center;

            color: #fff;
            font-size: 1.4rem;
            font-style: normal;
            font-weight: 600;
            line-height: 110%; /* 1.54rem */

            &:hover {
                background: #2125ff;
                cursor: pointer;
            }
        }

        .payment {
            display: flex;
            height: 4rem;
            padding: 2rem 2.5rem;
            justify-content: center;
            align-items: center;
            gap: 1rem;
            border-radius: 1rem;
            border: 0.1rem solid #2125ff;

            background: transparent;

            color: #fff;
            font-size: 1.4rem;
            font-style: normal;
            font-weight: 500;
            line-height: 94%;

            &:hover {
                background: #2125ff;
                cursor: pointer;
            }
        }

        .value {
            width: 12.2rem;
            height: 4rem;
            padding: 2.2rem 2rem;
            align-items: center;
            gap: 1rem;
            border-radius: 0rem 1rem 1rem 0rem;
            border-top: 0.1rem solid #292929;
            border-right: 0.1rem solid #292929;
            border-bottom: 0.1rem solid #292929;

            display: flex;
            align-items: center;
            justify-content: center;

            color: #fff;
            font-size: 1.4rem;
            font-style: normal;
            font-weight: 600;
            line-height: 125%; /* 1.54rem */

            img {
                width: 2rem;
            }
        }

        .subMenu {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 2rem;

            padding: 1.5rem 2rem;
            border-radius: 1rem;
            border: 0.1rem solid #292929;
            button {
                color: #fff;
                text-align: center;
                font-size: 1.4rem;
                font-style: normal;
                font-weight: 700;
                line-height: normal;
                flex-shrink: 0;
                outline: none;
                border: 0;
                background: transparent;

                &:hover {
                    filter: brightness(0.8);
                    cursor: pointer;
                    color: #2125ff;
                }
            }

            img {
                width: 45rem;
            }

            .selectedSubMenu {
                color: #2125ff;
            }
        }
    }

    .list {
        width: 100%;
        height: 43rem;
        margin-top: 0.9rem;
        overflow: auto;

        display: grid;
        grid-template-columns: repeat(9, 1fr);

        .item {
            width: 11.6rem;
            height: 13.3rem;
            background-size: 100% 100%;
            background-position: center center;
            margin-top: 0.9rem;

            padding: 1rem;

            position: relative;
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.15);

            .itemIsCart {
                position: absolute;
            }

            .imgItem {
                max-width: 6.72rem;
                max-height: 6.72rem;
                transition: transform 0.2s ease-in-out;
            }
            .nameItem {
                position: absolute;
                bottom: 1rem;
                color: #fff;
                text-align: center;
                font-size: 1.08rem;
                font-style: normal;
                font-weight: 700;
                line-height: normal;
            }
            .coinItem {
                img {
                    width: 1.6rem;
                }

                position: absolute;
                top: 0.5rem;
                left: 1rem;
                color: #fff;
                text-align: center;
                font-size: 1.08rem;
                font-style: normal;
                font-weight: 700;
                line-height: normal;

                display: flex;
                align-items: center;
                gap: 0.4rem;
            }
            .amount {
                position: absolute;
                right: 1rem;
                top: 0.5rem;
                min-width: 1.92rem;
                padding-left: 0.5rem;
                padding-right: 0.5rem;
                height: 1.44rem;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #fff;
                text-align: center;
                font-size: 1.08rem;
                font-style: normal;
                font-weight: 700;
                line-height: normal;
            }

            display: flex;
            align-items: center;
            justify-content: center;

            .buttonCart {
                width: 6.84rem;
                height: 1.8rem;

                display: flex;
                align-items: center;
                justify-content: center;
                position: absolute;
                bottom: 0.5rem;

                transition: all 0.2s ease-in-out;

                opacity: 0;

                border: 0.12rem solid #2125ff;
                background: linear-gradient(
                        20deg,
                        #2125ff -4.5%,
                        rgba(88, 58, 255, 0) 163.37%
                    ),
                    rgba(0, 0, 0, 0.2);
                box-shadow: 0rem 0rem 2.04rem 0rem rgba(88, 58, 255, 0.43);
            }

            /* &:hover .amount,
            &:hover .coinItem {
                display: none;
            } */

            &:hover {
                opacity: 1;
                cursor: pointer;
                border: .1rem solid #2125ff;

                .imgItem {
                    transform: scale(1.1);
                }
            }
        }

        .isItemInCart {
            border: 0.1rem solid #2125ff;

            .amountItem {
                position: absolute;
                right: 0;

                padding: 0.5rem 1rem;

                background: #2125ff;
                border-radius: 0.5rem 0 0 0.5rem;
                color: #fff;
                font-size: 1.2rem;
            }
        }
    }
`,a2=fe.div`
    margin-left: 1.5rem;

    .bestSellers {
        width: 21.4rem;
        height: 56.2rem;
        background: linear-gradient(
            72deg,
            rgba(0, 0, 0, 0.35) 19.47%,
            rgba(0, 0, 0, 0) 94.28%
        );
        border: 0.1rem solid rgba(255, 255, 255, 0.15);
        padding: 2rem;

        .overflow {
            height: 88%;
            margin-top: 1rem;
            display: grid;
            grid-template-columns: 1fr;
            gap: 1rem;
            overflow: auto;
        }

        h1 {
            text-align: center;
            font-size: 3rem;
            font-style: normal;
            font-weight: 700;
            line-height: 91.5%; /* 2.745rem */
            background: linear-gradient(
                89deg,
                #fff 31.77%,
                rgba(255, 255, 255, 0) 172.15%
            );
            background-clip: text;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .item {
            width: 13.0846rem;
            height: 12.96rem;
            background: url(${ct.bgItemShop});
            background-size: 100% 100%;
            background-position: center center;
            margin: auto;
            padding: 1rem;

            position: relative;

            .topitemOrnament {
                position: absolute;
                top: 0;
                right: 0;
            }

            .imgItem {
                max-width: 6.72rem;
                max-height: 6.72rem;
            }
            .nameItem {
                position: absolute;
                top: 1rem;
                color: #fff;
                text-align: center;
                font-size: 1.08rem;
                font-style: normal;
                font-weight: 700;
                line-height: normal;
            }
            .coinItem {
                img {
                    width: 1.6rem;
                }

                position: absolute;
                bottom: 0.5rem;
                left: 1rem;
                color: #fff;
                text-align: center;
                font-size: 1.08rem;
                font-style: normal;
                font-weight: 700;
                line-height: normal;

                display: flex;
                align-items: center;
                gap: 0.4rem;
            }
            .amount {
                position: absolute;
                right: 1rem;
                bottom: 0.5rem;
                min-width: 1.92rem;
                height: 1.44rem;
                border: 0.12rem solid #2125ff;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #fff;
                text-align: center;
                font-size: 1.08rem;
                font-style: normal;
                font-weight: 700;
                line-height: normal;
                background: linear-gradient(
                        20deg,
                        #2125ff -4.5%,
                        rgba(88, 58, 255, 0) 163.37%
                    ),
                    rgba(0, 0, 0, 0.2);
                box-shadow: 0rem 0rem 2.04rem 0rem rgba(88, 58, 255, 0.43);
            }

            display: flex;
            align-items: center;
            justify-content: center;

            .buttonCart {
                width: 6.84rem;
                height: 1.8rem;

                display: flex;
                align-items: center;
                justify-content: center;
                position: absolute;
                bottom: 0.5rem;

                transition: all 0.2s ease-in-out;

                opacity: 0;

                border: 0.12rem solid #2125ff;
                background: linear-gradient(
                        20deg,
                        #2125ff -4.5%,
                        rgba(88, 58, 255, 0) 163.37%
                    ),
                    rgba(0, 0, 0, 0.2);
                box-shadow: 0rem 0rem 2.04rem 0rem rgba(88, 58, 255, 0.43);
            }

            &:hover {
                opacity: 1;
                cursor: pointer;
            }
        }
    }

    .contentCart {
        width: 100%;
        height: 100%;

        border-radius: 2rem;
        background: rgba(17, 17, 17, 0.95);

        position: absolute;
        top: 0;
        left: 0;

        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;

        .content {
            display: flex;
            width: 24.62rem;
            padding: 2.4rem 2rem;
            flex-direction: column;
            align-items: flex-start;
            gap: 2.5rem;
            flex-shrink: 0;

            border-radius: 1rem;
            border: 0.1rem solid #2125ff;
            background: #111;
        }

        .flex {
            width: 100%;
            display: flex;
            justify-content: space-between;
        }

        .closeCart {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 1rem;

            width: 2.8rem;
            height: 2.8rem;

            border-radius: 0.3rem;
            border: 0.1rem solid #292929;

            color: #ffffff;
            font-size: 2rem;

            p {
                transform: rotate(45deg);
            }

            &:hover {
                background: #2125ff;
                color: #111;
                cursor: pointer;
            }
        }

        h1 {
            display: flex;
            padding: 0.5rem 1rem;
            align-items: center;
            gap: 1rem;
            border-radius: 0.3rem;
            background: #2125ff;

            color: #fff;
            font-size: 2rem;
            font-style: normal;
            font-weight: 600;
            line-height: 110%; /* 2.2rem */
        }

        .overflow {
            height: 88%;
            margin-top: 1rem;

            overflow: auto;

            .item {
                width: 20.62rem;

                display: flex;
                margin-bottom: 1rem;

                .rightItem {
                    position: relative;
                    width: 100%;

                    display: flex;
                    align-items: center;
                    justify-content: space-between;

                    color: #fff;
                    text-align: center;
                    font-size: 1.4rem;
                    font-style: normal;
                    font-weight: 400;
                    line-height: 110%;

                    .actions {
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;

                        p {
                            padding-left: 0.5rem;
                            padding-right: 0.5rem;
                            min-width: 1.82rem;
                            height: 1.82rem;
                            position: static;

                            display: flex;
                            align-items: center;
                            justify-content: center;
                            border-radius: 1rem;
                            border: 0.13rem solid #292929;
                            background: #111;

                            color: #fff;
                            text-align: center;
                            font-size: 0.91rem;
                            font-style: normal;
                            font-weight: 400;
                            line-height: normal;
                        }

                        button {
                            width: 1.82rem;
                            height: 1.82rem;
                            margin: 0;

                            display: flex;
                            align-items: center;
                            justify-content: center;
                            line-height: 0;
                        }

                        .rem {
                            display: flex;
                            align-items: center;
                            justify-content: center;

                            border-radius: 1rem;
                            border: 0.13rem solid #2125ff;
                            background: #111;
                        }

                        .add {
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            border-radius: 1rem;
                            border: 0.13rem solid #2125ff;
                            background: #111;
                        }
                    }

                    .close {
                        position: absolute;
                        width: 1.43rem;
                        height: 1.43rem;

                        border-radius: 0.13rem;
                        border: 0.13rem solid #fe7171;
                        background: #c25d5d;

                        display: flex;
                        align-items: center;
                        justify-content: center;

                        right: 0;
                        bottom: 0;

                        p {
                            transform: rotate(45deg);
                            position: static;
                        }
                    }

                    b {
                        display: flex;
                        position: absolute;
                        right: 1rem;
                        top: 55%;
                        transform: translateY(-50%);
                        color: #fff;
                        font-size: 0.8789rem;
                        font-style: normal;
                        font-weight: 700;
                        line-height: 200%;

                        img {
                            width: 1.6038rem;
                        }
                    }
                }
            }
        }
    }

    .totalValueItem {
        width: 21.4rem;
        height: 6.7rem;
        margin-top: 1rem;
        border: 0.1rem solid rgba(255, 255, 255, 0.15);
        background: linear-gradient(
            72deg,
            rgba(0, 0, 0, 0.35) 19.47%,
            rgba(0, 0, 0, 0) 94.28%
        );

        display: flex;
        align-items: center;
        justify-content: center;

        p {
            width: 50%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #fff;
            font-size: 1.3rem;
            font-style: normal;
            font-weight: 700;
            line-height: normal;
        }

        .amount {
            width: 50%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            gap: 0.5rem;

            background: rgba(255, 255, 255, 0.05);
            img {
                width: 2rem;
            }

            span {
                color: #fff;
                font-size: 1.1097rem;
                font-style: normal;
                font-weight: 700;
                line-height: normal;
            }
        }
    }

    button {
        width: 21.4rem;
        height: 6rem;
        border: 0.1rem solid rgba(255, 255, 255, 0.12);
        background: radial-gradient(
                47.62% 70.59% at 50% 78.53%,
                rgba(255, 255, 255, 0.1) 0%,
                rgba(255, 255, 255, 0) 100%
            ),
            radial-gradient(
                299.1% 426.27% at 50% 50%,
                rgba(212, 212, 212, 0.1) 0%,
                rgba(0, 0, 0, 0) 100%
            ),
            rgba(0, 0, 0, 0.35);
        outline: none;

        margin-top: 1rem;

        color: #fff;
        text-align: center;
        font-size: 1.542rem;
        font-style: normal;
        font-weight: 800;
        line-height: normal;

        &:hover {
            filter: brightness(0.8);
            cursor: pointer;
        }
    }
`,s2=fe.div`
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;

    background: rgba(17, 17, 17, 0.95);

    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;

    .content {
        display: flex;
        width: 34.62rem;
        padding: 2.4rem 2rem;
        flex-direction: column;
        align-items: center;
        gap: 2.5rem;

        border-radius: 1rem;
        border: 0.1rem solid #2125ff;
        background: #111;

        .top {
            display: flex;
            padding: 0.5rem 1rem;
            align-items: center;
            gap: 1rem;
            border-radius: 0.3rem;
            background: #2125ff;

            color: #fff;
            font-size: 2rem;
            font-style: normal;
            font-weight: 600;
            line-height: 110%; /* 22px */
        }

        hr {
            width: 100%;
            border: 0.1rem solid #ffffff20;
        }

        .text {
            color: #fff6;
            text-align: center;
            font-size: 1.2rem;
            font-style: normal;
            font-weight: 400;
            line-height: 110%; /* 15.4px */

            b {
                color: #fff;
            }
        }

        .list {
            width: fit-content;
            max-height: 30rem;
            overflow-y: auto;
            padding-right: 1rem;

            .item {
                width: 20.62rem;

                display: flex;
                margin-bottom: 1rem;

                .rightItem {
                    position: relative;
                    width: 100%;

                    display: flex;
                    align-items: center;
                    justify-content: space-between;

                    color: #fff;
                    text-align: center;
                    font-size: 1.4rem;
                    font-style: normal;
                    font-weight: 400;
                    line-height: 110%;

                    .actions {
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;

                        p {
                            padding-left: 0.5rem;
                            padding-right: 0.5rem;
                            min-width: 1.82rem;
                            height: 1.82rem;
                            position: static;

                            display: flex;
                            align-items: center;
                            justify-content: center;
                            border-radius: 1rem;
                            border: 0.13rem solid #292929;
                            background: #111;

                            color: #fff;
                            text-align: center;
                            font-size: 0.91rem;
                            font-style: normal;
                            font-weight: 400;
                            line-height: normal;
                        }

                        button {
                            width: 1.82rem;
                            height: 1.82rem;
                            margin: 0;

                            color: #fff;
                            text-align: center;
                            font-size: 0.91rem;
                            font-style: normal;
                            font-weight: 400;
                            line-height: normal;

                            display: flex;
                            align-items: center;
                            justify-content: center;
                            line-height: 0;

                            transition: all 0.2s ease-in-out;

                            &:hover {
                                background: #2125ff;
                                cursor: pointer;
                            }
                        }

                        .rem {
                            display: flex;
                            align-items: center;
                            justify-content: center;

                            border-radius: 1rem;
                            border: 0.13rem solid #2125ff;
                            background: #111;
                        }

                        .add {
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            border-radius: 1rem;
                            border: 0.13rem solid #2125ff;
                            background: #111;
                        }
                    }

                    .close {
                        position: absolute;
                        width: 1.43rem;
                        height: 1.43rem;

                        border-radius: 0.13rem;
                        border: 0.13rem solid #fe7171;
                        background: #c25d5d;

                        display: flex;
                        align-items: center;
                        justify-content: center;

                        right: 0;
                        bottom: 0;

                        p {
                            transform: rotate(45deg);
                            position: static;
                        }
                    }

                    b {
                        display: flex;
                        position: absolute;
                        right: 1rem;
                        top: 55%;
                        transform: translateY(-50%);
                        color: #fff;
                        font-size: 0.8789rem;
                        font-style: normal;
                        font-weight: 700;
                        line-height: 200%;

                        img {
                            width: 1.6038rem;
                        }
                    }
                }
            }
        }
    }

    .buttons {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 1rem;

        button:first-child {
            display: flex;
            flex: 1;
            padding: 1.5rem 2.5rem;
            justify-content: center;
            align-items: center;
            gap: 1rem;
            border-radius: 1rem;
            border: 0.1rem solid #fff;
            opacity: 0.25;

            background: transparent;

            color: #fff;
            font-size: 1.4rem;
            font-style: normal;
            font-weight: 500;
            line-height: 94%; /* 13.16px */
            transition: all 0.2s ease-in-out;
            &:hover {
                opacity: 1;
                cursor: pointer;
            }
        }
        button:last-child {
            display: flex;
            flex: 1;
            padding: 1.5rem 2.5rem;
            justify-content: center;
            align-items: center;
            gap: 1rem;
            border-radius: 1rem;
            border: 0.1rem solid #2125ff;

            background: transparent;

            color: #fff;
            font-size: 1.4rem;
            font-style: normal;
            font-weight: 500;
            line-height: 94%; /* 13.16px */
            transition: all 0.2s ease-in-out;

            &:hover {
                background: #2125ff;
                cursor: pointer;
            }
        }
    }
`,u2=()=>{const[e,t]=x.useState(),[n,r]=x.useState(),[o,i]=x.useState(!1),[l,a]=x.useState([]),[s,u]=x.useState(0),[d,p]=x.useState([]),[h,v]=x.useState(!1),[g,w]=x.useState("all");x.useEffect(()=>{an("requestStore",{}).then(E=>{t(E.store),r(E.store),p(E.bestSellers)})},[]),x.useEffect(()=>{let E=0;l.map((N,b)=>{E+=N.price*N.multiplier}),u(E)},[l]);function C(E){if(E=="all"){r(e),w(E);return}r(e),r(N=>N==null?void 0:N.filter(b=>b.type.toLowerCase()===E)),w(E)}function f(E){let N=E.target.value;console.log(N),r(e),r(b=>b==null?void 0:b.filter(z=>z.name.toLowerCase().includes(N.toString().toLowerCase())))}function c(E){a(N=>N.find(z=>z.index===E.index)?N.map(z=>z.index===E.index?{...z,amount:z.amount+E.amount,multiplier:(z.multiplier||1)+1}:z):[...N,{...E,originalAmount:E.amount,multiplier:1}])}function m(){if(l.length<=0&&i(!0),l.length>0){const E=l.map(N=>({index:N.index,amount:N.multiplier}));an("paymentStore",{cart:E}).then(N=>{N&&(a([]),v(!1))})}}function S(E){a(N=>N.map(b=>b.index===E?{...b,amount:b.amount+b.originalAmount,multiplier:b.multiplier+1}:b))}function A(E){a(N=>{const b=N.map(z=>{if(z.index===E){const F=z.amount>z.originalAmount?z.amount-z.originalAmount:0;return{...z,amount:F,multiplier:F===0?0:z.multiplier-1}}return z}).filter(z=>z.amount>0);return b.length<=0&&i(!1),b})}return R(o2,{children:[R(i2,{children:[y("h1",{children:"LOJA VIP COINS"}),R("p",{children:["Caso você possua um VIP, a cada 30 minutos você irá receber um",y("b",{children:" VIP COIN"})," para cada ",y("b",{children:"VIP ATIVO"}),", e poderá trocar por itens aqui em nossa loja, Adquira já o seu VIP."]})]}),R(l2,{children:[R("div",{className:"flex",children:[R("div",{className:"subMenu",children:[y("button",{className:g=="all"?"selectedSubMenu":"",onClick:()=>C("all"),children:"TODOS"}),y("button",{className:g=="item"?"selectedSubMenu":"",onClick:()=>C("item"),children:"ITENS"}),y("button",{className:g=="vehicle"?"selectedSubMenu":"",onClick:()=>C("vehicle"),children:"CARROS"}),y("button",{className:g=="others"?"selectedSubMenu":"",onClick:()=>C("others"),children:"EXTRAS"})]}),y("input",{onChange:E=>f(E),type:"text",placeholder:"Pesquisar item"}),R("div",{className:"total",children:[y("button",{className:"cart",onClick:()=>i(!0),children:"CARRINHO"}),R("div",{className:"value",children:[y("img",{src:ct.vipcoin,alt:""})," ",s]})]}),y("button",{className:"payment",onClick:()=>v(!0),children:"FINALIZAR COMPRA"})]}),y("div",{className:"list",children:n==null?void 0:n.map((E,N)=>{const b=l.find(F=>F.index===E.index),z=!!b;return R("div",{className:z?"item isItemInCart":"item",onClick:()=>c(E),children:[y("img",{src:E.type=="ITEM"||E.type=="OTHERS"?"http://189.127.165.210/inventario/"+E.spawn+".png":"http://177.54.148.31:4020/imgfusion/vehicles/v1/"+E.spawn+".png",alt:"",className:"imgItem"}),y("div",{className:"nameItem",children:E.name.toUpperCase()}),R("div",{className:"coinItem",children:[y("img",{src:ct.vipcoin,alt:""}),y("p",{children:E.price})]}),R("div",{className:"amount",children:[E.amount,"x"]}),z&&R(Tt,{children:[y("div",{className:"itemIsCart",children:y("img",{src:Kt.check,alt:""})}),y("div",{className:"amountItem",children:(b==null?void 0:b.multiplier)||0})]})]})})})]}),y(a2,{children:o&&y(Tt,{children:y("div",{className:"contentCart",children:R("div",{className:"content",children:[R("div",{className:"flex",children:[y("h1",{children:"CARRINHO"}),y("div",{className:"closeCart",onClick:()=>i(!1),children:y("p",{children:"+"})})]}),y("div",{className:"overflow",children:l.map((E,N)=>y("div",{className:"item",children:R("div",{className:"rightItem",children:[y("p",{children:E.name.toUpperCase()}),R("div",{className:"actions",children:[y("button",{className:"rem",onClick:()=>A(E.index),children:"-"}),y("p",{children:E.multiplier}),y("button",{className:"add",onClick:()=>S(E.index),children:"+"})]})]})}))})]})})})}),h&&y(s2,{children:R("div",{className:"content",children:[y("div",{className:"top",children:"FINALIZAR COMPRA"}),y("hr",{}),y("div",{className:"text",children:R("p",{children:["VOCÊ TEM CERTEZA QUE DESEJA FINALIZAR A COMPRA NO VALOR DE ",R("b",{children:[s,"  VIP COINS"]})," ?"]})}),y("div",{className:"list",children:l.map((E,N)=>y("div",{className:"item",children:R("div",{className:"rightItem",children:[y("p",{children:E.name.toUpperCase()}),R("div",{className:"actions",children:[y("button",{className:"rem",onClick:()=>A(E.index),children:"-"}),y("p",{children:E.multiplier}),y("button",{className:"add",onClick:()=>S(E.index),children:"+"})]})]})}))}),R("div",{className:"buttons",children:[y("button",{onClick:()=>v(!1),children:"CANCELAR"}),y("button",{onClick:m,children:"CONFIRMAR"})]})]})})]})},c2=fe.div`
    position: relative;
    left: 1rem;

    .slide {
        width: 120.6rem;
        height: 25.9rem;

        overflow: hidden;
        display: flex;
        align-items: flex-end;
    }

    .sliderContainer {
        width: 1000rem;
        display: flex;
        transition: all 0.2s ease-in-out;
    }

    .lastMonth {
        width: 120.6rem;
        margin-left: 2rem;

        .title {
            width: 120.6rem;

            height: 5.2rem;
            color: #fff;
            font-size: 26px;
            font-style: normal;
            font-weight: 900;
            line-height: normal;
            padding: 1.5rem;
            display: flex;
            align-items: center;
            margin-bottom: 1rem;

            b {
                color: #2125ff;
                font-size: 26px;
                font-style: normal;
                font-weight: 900;
                line-height: normal;
            }

            border: 0.1rem solid rgba(255, 255, 255, 0.15);
            background: linear-gradient(
                72deg,
                rgba(0, 0, 0, 0.35) 19.47%,
                rgba(0, 0, 0, 0) 94.28%
            );
        }

        .oldWinner {
            width: 120.6rem;
            height: 19.6rem;
            background: radial-gradient(
                    75% 263.05% at 100% 102.91%,
                    #2125ff 0%,
                    rgba(0, 0, 0, 0) 100%
                ),
                linear-gradient(
                    72deg,
                    rgba(0, 0, 0, 0.35) 19.47%,
                    rgba(0, 0, 0, 0) 94.28%
                );
            border: 1px solid rgba(255, 255, 255, 0.15);
            position: relative;

            display: flex;
            align-items: center;
            justify-content: center;

            .awards {
                position: absolute;
                top: 1rem;
                left: 1rem;
                color: #fff;
                font-size: 1.3rem;
                font-style: normal;
                font-weight: 700;
                line-height: normal;

                .value {
                    width: 20rem;
                    height: 4.4rem;
                    background: radial-gradient(
                            75% 263.05% at 100% 102.91%,
                            rgba(255, 255, 255, 0.1) 0%,
                            rgba(0, 0, 0, 0) 100%
                        ),
                        radial-gradient(
                            36.84% 209.7% at 15.96% 50.15%,
                            rgba(255, 255, 255, 0.1) 0%,
                            rgba(0, 0, 0, 0) 100%
                        ),
                        linear-gradient(
                            275deg,
                            rgba(0, 0, 0, 0.15) 0%,
                            rgba(255, 255, 255, 0) 108.66%
                        );
                    border: 0.1rem solid rgba(255, 255, 255, 0.15);

                    display: flex;
                    align-items: center;
                    justify-content: center;
                }
            }

            .timingPlayed {
                position: absolute;
                bottom: 1rem;
                top: initial;
                left: 1rem;
            }

            .ornament {
                position: absolute;
                right: 0;
                bottom: 0;

                img:first-child {
                    width: 16.9rem;
                    position: absolute;
                    bottom: 0;
                    right: -2.1rem;
                }

                img:last-child {
                    width: 10.6rem;
                    position: absolute;
                    right: 6.8rem;
                    bottom: -0.4rem;
                }
            }

            .description {
                width: 79.3rem;
                height: 11.4rem;
                background: linear-gradient(
                    72deg,
                    rgba(0, 0, 0, 0.35) 19.47%,
                    rgba(0, 0, 0, 0) 94.28%
                );
                border: 0.1rem solid rgba(255, 255, 255, 0.15);
                position: relative;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 2rem;

                .avatar {
                    width: 8.2rem;
                    height: 9.4rem;
                    position: absolute;
                    left: 1rem;

                    img {
                        width: 100%;
                        height: 100%;
                        object-fit: cover;
                    }
                }

                p {
                    width: 55.4rem;
                    display: block;
                    height: 80%;
                    color: #fff;
                    font-size: 1.3rem;
                    text-align: center;
                    font-style: normal;
                    font-weight: 400;
                    line-height: normal;
                    position: relative;

                    img {
                        margin-left: 0.5rem;
                        margin-right: 0.5rem;

                        &:first-child {
                            position: relative;
                            bottom: 0.5rem;
                        }

                        &:last-child {
                            position: relative;
                            top: 0.5rem;
                        }
                    }
                }

                .author {
                    float: right;
                    color: #fff;
                    text-align: center;
                    font-size: 1.3rem;
                    font-style: normal;
                    font-weight: 900;
                    line-height: normal;
                    position: absolute;
                    right: 0;
                }
            }
        }
    }

    .flex {
        display: flex;
        gap: 1.3rem;

        .title {
            width: 85rem;
            height: 5.2rem;
            flex-shrink: 0;
            padding: 1.5rem;

            color: #fff;
            font-size: 1.8rem;
            font-style: normal;
            font-weight: 700;
            line-height: 110%; /* 1.98rem */

            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .timingLeft {
            width: 41rem;
            height: 5.2rem;

            padding: 0.5rem;

            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;

            p {
                color: #fff;
                font-size: 1.6rem;
                font-style: normal;
                font-weight: 400;
                line-height: 110%; /* 1.76rem */
            }

            b {
                color: #fff;
                font-size: 1.8rem;
                font-style: normal;
                font-weight: 700;
                line-height: 110%; /* 1.98rem */
            }

            img {
                width: 8.5rem;
                position: absolute;
                right: -2rem;
            }
        }
    }
`,f2=fe.div`
    width: 117.6rem;
    display: flex;
    justify-content: space-between;
    margin-top: 1rem;

    .itemPossible {
        width: 37.9rem;
        height: 20.3rem;
        position: relative;

        border-radius: 1rem;
        border: 0.1rem solid #f9f9f9;
        background: radial-gradient(
                188.11% 137.73% at 91.14% 0%,
                #f9f9f9 0%,
                rgba(31, 31, 31, 0) 100%
            ),
            radial-gradient(
                67.21% 129.21% at 97.11% 0%,
                rgba(17, 17, 17, 0) 0%,
                #111 100%
            ),
            linear-gradient(
                294deg,
                rgba(31, 31, 31, 0) 12.11%,
                #f9f9f9 20.03%,
                #f9f9f9 24.92%,
                rgba(31, 31, 31, 0) 30.28%,
                rgba(249, 249, 249, 0.98) 40.76%,
                #f9f9f9 40.76%,
                rgba(31, 31, 31, 0) 46.82%,
                #f9f9f9 52.41%,
                rgba(31, 31, 31, 0) 58.7%
            );

        img {
            position: absolute;
            right: -4rem;
            top: -4rem;
            width: 22.4955rem;
        }

        &:first-child {
            border-radius: 1rem;
            border: 0.1rem solid #fdd731;
            background: radial-gradient(
                    188.11% 137.73% at 91.14% 0%,
                    #fdd731 0%,
                    rgba(31, 31, 31, 0) 100%
                ),
                radial-gradient(
                    67.21% 129.21% at 97.11% 0%,
                    rgba(17, 17, 17, 0) 0%,
                    #111 100%
                ),
                linear-gradient(
                    294deg,
                    rgba(31, 31, 31, 0) 12.11%,
                    #fdd731 20.03%,
                    #fdd731 24.92%,
                    rgba(31, 31, 31, 0) 30.28%,
                    #fdd731 40.76%,
                    rgba(31, 31, 31, 0) 46.82%,
                    #fdd731 52.41%,
                    rgba(31, 31, 31, 0) 58.7%
                );

            img {
                position: absolute;
                right: -4rem;
                top: -4rem;
                width: 22.4955rem;
            }
        }

        &:last-child {
            border-radius: 10px;
            border: 1px solid #dd9876;
            background: radial-gradient(
                    188.11% 137.73% at 91.14% 0%,
                    #dd9876 0%,
                    rgba(31, 31, 31, 0) 100%
                ),
                radial-gradient(
                    67.21% 129.21% at 97.11% 0%,
                    rgba(17, 17, 17, 0) 0%,
                    #111 100%
                ),
                linear-gradient(
                    294deg,
                    rgba(31, 31, 31, 0) 12.11%,
                    #dd9876 20.03%,
                    #dd9876 24.92%,
                    rgba(31, 31, 31, 0) 30.28%,
                    #dd9876 40.76%,
                    rgba(31, 31, 31, 0) 46.82%,
                    #dd9876 52.41%,
                    rgba(31, 31, 31, 0) 58.7%
                );

            img {
                position: absolute;
                right: -3rem;
                top: -4rem;
                width: 22.4955rem;
            }
        }

        .top {
            position: absolute;
            top: 1rem;
            left: 1rem;

            p {
                display: flex;
                width: 11.3rem;
                height: 3rem;
                justify-content: center;
                align-items: center;
                gap: 1rem;

                border-radius: 0.5rem;
                background: #f9f9f9;

                color: #292929;
                font-size: 2rem;
                font-style: normal;
                font-weight: 800;
                line-height: 100%; /* 22px */
            }

            b {
                color: #fff;
                font-size: 1.6rem;
                font-style: normal;
                font-weight: 800;
                line-height: 110%; /* 1.76rem */
                text-shadow: 0 0 2px #000;
                margin-top: 1.5rem;
            }

            .timing {
                color: #fff;
                font-size: 1.4rem;
                font-style: normal;
                font-weight: 800;
                line-height: 110%; /* 15.4px */
                text-shadow: 0 0 2px #000;
                span {
                    color: #fff;
                }
            }
        }

        &:first-child .top p {
            border-radius: 0.5rem;
            background: #fdd731;
        }

        &:last-child .top p {
            border-radius: 0.5rem;
            background: #dd9876;
        }

        .awards {
            position: absolute;
            bottom: 1rem;
            left: 1rem;
            color: #fff;
            font-size: 1.3rem;
            font-style: normal;
            font-weight: 700;
            line-height: normal;

            .value {
                width: 20rem;
                height: 4.4rem;
                background: radial-gradient(
                        28.98% 173.44% at 93.43% 69.57%,
                        rgba(255, 255, 255, 0.1) 0%,
                        rgba(0, 0, 0, 0) 100%
                    ),
                    radial-gradient(
                        36.84% 209.7% at 15.96% 50.15%,
                        rgba(255, 255, 255, 0.1) 0%,
                        rgba(0, 0, 0, 0) 100%
                    ),
                    linear-gradient(
                        275deg,
                        rgba(0, 0, 0, 0.15) 0%,
                        rgba(255, 255, 255, 0) 108.66%
                    );
                border: 0.1rem solid rgba(255, 255, 255, 0.15);

                display: flex;
                align-items: center;
                justify-content: center;
            }
        }
    }
`,d2=fe.div`
    width: 117.6rem;
    height: 42.8rem;

    margin-top: 1rem;

    table {
        width: 117.7rem;
        border-collapse: separate;
        border-spacing: 0;
    }

    td {
        padding: 0; /* Removendo o padding padrão das células */

        div {
            margin: 0.5rem;
        }
    }

    thead {
        width: 117.7rem;
        tr {
            width: 100%;

            border-radius: 1rem;
            background: #1a1a1a;
            height: 5.3rem;

            display: grid;
            grid-template-columns: 0.4fr 1fr 1fr 1fr 1fr 1fr;
            align-items: center;
            color: #828282;
            text-align: center;
            font-size: 1.2rem;
            font-style: normal;
            font-weight: 700;
            line-height: 110%; /* 1.32rem */
        }

        th b {
            color: #2125ff;
        }
    }

    tbody {
        width: 117.7rem;
        height: 35rem;
        overflow: auto;
        display: block;

        &::-webkit-scrollbar {
            display: none;
        }

        tr {
            width: 100%;

            height: 5.3rem;

            display: grid;
            grid-template-columns: 0.4fr 1fr 1fr 1fr 1fr 1fr;
            align-items: center;

            color: #fff;
            text-align: center;
            font-size: 1.3rem;
            font-style: normal;
            font-weight: 700;
            line-height: normal;
            margin-top: 1rem;
            border: 0;
            border-radius: 1rem;
            border: 1px solid rgba(255, 255, 255, 0.15);
        }

    }
`,p2=()=>{const[e,t]=x.useState(),[n,r]=x.useState("hours"),[o,i]=x.useState(),[l,a]=x.useState(),[s,u]=x.useState(),[d,p]=x.useState(0),[h,v]=x.useState("00:00:00:00"),[g,w]=x.useState([""]),[C,f]=x.useState(0),[c,m]=x.useState(),[S,A]=x.useState(!1),[E,N]=x.useState(0),[b,z]=x.useState(0);x.useEffect(()=>{an("requestRanking",{}).then(M=>{t(M.rank.hours),i(M.rank.hours[0]),a(M.rank.hours[1]),u(M.rank.hours[2]),p(M.time),m(M.lastWinner),w(M.topRewards);const{days:V,hours:G,minutes:P,seconds:B}=H(d);v(`${V.toString().padStart(2,"0")}:${G.toString().padStart(2,"0")}:${P.toString().padStart(2,"0")}:${B.toString().padStart(2,"0")}`)})},[]);const F=M=>{A(!0),N(M.clientX),z(C)},ae=M=>{if(!S)return;let V=M.clientX,G=E-V;return b-G<0?f(-129.3):f(0)},ee=M=>{A(!1)};x.useEffect(()=>(S&&(window.addEventListener("mousemove",ae),window.addEventListener("mouseup",ee)),()=>{window.removeEventListener("mousemove",ae),window.removeEventListener("mouseup",ee)}),[S,E,b]),x.useEffect(()=>{an("requestRanking",{}).then(M=>{n=="hours"&&t(M.rank.hours),n=="coins"&&t(M.rank.coin),n=="vipcoins"&&t(M.rank.vipcoin),p(M.time);const{days:V,hours:G,minutes:P,seconds:B}=H(d);v(`${V.toString().padStart(2,"0")}:${G.toString().padStart(2,"0")}:${P.toString().padStart(2,"0")}:${B.toString().padStart(2,"0")}`)})},[n]),x.useEffect(()=>{const M=setInterval(()=>{const{days:V,hours:G,minutes:P,seconds:B}=H(d);v(`${V.toString().padStart(2,"0")}:${G.toString().padStart(2,"0")}:${P.toString().padStart(2,"0")}:${B.toString().padStart(2,"0")}`),p(j=>j-1),d<=0&&clearInterval(M)},1e3);return()=>{clearInterval(M)}},[d]);function I(M){let V=M*60,G=Math.floor(V/3600);V%=3600;let P=Math.floor(V/60);return V%=60,`${G.toString().padStart(2,"0")}H ${P.toString().padStart(2,"0")}M ${V.toString().padStart(2,"0")}S`}function H(M){let V=Math.floor(M/60);M=M%60;let G=Math.floor(V/60);V=V%60;let P=Math.floor(G/24);return G=G%24,P<0&&(P=0),G<0&&(G=0),V<0&&(V=0),M<0&&(M=0),{days:P,hours:G,minutes:V,seconds:M}}return R(c2,{children:[y("div",{className:"slide",onMouseDown:F,children:R("div",{className:"sliderContainer",style:{transform:`translateX(${C}rem)`},children:[R("div",{className:"possible",children:[R("div",{className:"flex",children:[R("div",{className:"title",children:["POSSÍVEIS ",y("b",{children:"VENCEDORES"})]}),y("div",{className:"timingLeft",children:R("p",{children:["ENCERRA EM: ",y("b",{children:h})]})})]}),R(f2,{children:[R("div",{className:"itemPossible",children:[R("div",{className:"top",children:[y("p",{children:"1° LUGAR"}),y("b",{children:(o==null?void 0:o.name.toUpperCase())||"Nenhum Jogador"}),R("div",{className:"timing",children:[y("span",{children:I((o==null?void 0:o.seconds)||0)})," JOGADOS"]})]}),R("div",{className:"awards",children:[y("p",{children:"PREMIAÇÃO"}),y("div",{className:"value",children:g[0]})]}),y("img",{src:ct.first,alt:""})]}),R("div",{className:"itemPossible",children:[R("div",{className:"top",children:[y("p",{children:"2° LUGAR"}),y("b",{children:(l==null?void 0:l.name.toUpperCase())||"Nenhum Jogador"}),R("div",{className:"timing",children:[y("span",{children:I((l==null?void 0:l.seconds)||0)})," ","JOGADOS"]})]}),R("div",{className:"awards",children:[y("p",{children:"PREMIAÇÃO"}),y("div",{className:"value",children:g[1]})]}),y("img",{src:ct.second,alt:""})]}),R("div",{className:"itemPossible",children:[R("div",{className:"top",children:[y("p",{children:"3° LUGAR"}),y("b",{children:(s==null?void 0:s.name.toUpperCase())||"Nenhum Jogador"}),R("div",{className:"timing",children:[y("span",{children:I((s==null?void 0:s.seconds)||0)})," JOGADOS"]})]}),R("div",{className:"awards",children:[y("p",{children:"PREMIAÇÃO"}),y("div",{className:"value",children:g[2]})]}),y("img",{src:ct.thirst,alt:""})]})]})]}),R("div",{className:"lastMonth",children:[R("div",{className:"title",children:["ÚLTIMO ",y("b",{children:"VENCEDOR"})]}),R("div",{className:"oldWinner",children:[R("div",{className:"awards",children:[y("p",{children:"PREMIO RECEBIDO"}),y("div",{className:"value",children:c==null?void 0:c.award})]}),R("div",{className:"awards timingPlayed",children:[y("p",{children:"TEMPO JOGADO"}),y("div",{className:"value",children:I((c==null?void 0:c.time_played)||0)})]}),R("div",{className:"description",children:[y("div",{className:"avatar",children:y("img",{src:c==null?void 0:c.avatar,alt:""})}),y("div",{className:"text",children:R("p",{children:[y("img",{src:Kt.aspas,alt:""}),c==null?void 0:c.desc," ",y("img",{src:Kt.aspas,alt:""}),R("div",{className:"author",children:["- ",c==null?void 0:c.name]})]})})]}),y("div",{className:"ornament",children:y("img",{src:ct.first,alt:""})})]})]})]})}),y(d2,{children:R("table",{children:[y("thead",{children:R("tr",{children:[y("th",{children:"°"}),y("th",{children:"NOME"}),y("th",{onClick:()=>r("hours"),children:n=="hours"?R(Tt,{children:[y("b",{children:"TEMPO JOGADO"})," ",y("img",{src:Kt.arrow,alt:""})]}):R(Tt,{children:["TEMPO JOGADO ",y("img",{src:Kt.arrow,alt:""})]})}),y("th",{onClick:()=>r("coins"),children:n=="coins"?R(Tt,{children:[y("b",{children:"COINS"})," ",y("img",{src:Kt.arrow,alt:""})]}):R(Tt,{children:["COINS ",y("img",{src:Kt.arrow,alt:""})]})}),y("th",{onClick:()=>r("vipcoins"),children:n=="vipcoins"?R(Tt,{children:[y("b",{children:"VIP COINS"})," ",y("img",{src:Kt.arrow,alt:""})]}):R(Tt,{children:["VIP COINS ",y("img",{src:Kt.arrow,alt:""})]})}),y("th",{children:"PREMIAÇÃO"})]})}),y("tbody",{children:e==null?void 0:e.map((M,V)=>R("tr",{children:[R("td",{children:[V+1,"°"]}),R("td",{children:[M.name," #",M.user_id]}),y("td",{children:I(M.seconds)}),y("td",{children:M.coin}),y("td",{children:M.vipcoin}),y("td",{children:n=="hours"?g[V]:"-"})]}))})]})})]})},m2=()=>{const{visible:e}=dg();return e?y(sv,{children:R("div",{className:"container",children:[y(Xv,{}),R(X0,{children:[y(so,{path:"/",element:y(ny,{})}),y(so,{path:"/box",element:y(r2,{})}),y(so,{path:"/shop",element:y(u2,{})}),y(so,{path:"/rank",element:y(p2,{})})]})]})}):null},h2=av`
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        user-select: none;
    }

    html {
        font-size: 62.5%;
    }

    body {
        width: 100vw;
        height: 100vh;
        font-family: 'Poppins', sans-serif;

        display: flex;
        align-items: center;
        justify-content: center;
    }
    
    input[type=number]::-webkit-inner-spin-button { 
        -webkit-appearance: none;
    }

    input[type=number] { 
        -moz-appearance: textfield;
        appearance: textfield;
    }

    img {
        -webkit-user-drag: none;
        -khtml-user-drag: none;
        -moz-user-drag: none;
        -o-user-drag: none;
        user-drag: none;
    }

    
    ::-webkit-scrollbar{
        width: .5rem;

    }

    ::-webkit-scrollbar-track{
        background: #fff2;
    }

    ::-webkit-scrollbar-thumb{
        background: #2125ff;
    }



    
    @media (max-width: 3840px) {
        html {
        font-size: 139% !important;
        }
    }

    @media (max-height: 1440px) and (max-width: 2560px) {
        html {
        font-size: 85% !important;
        }
    }

    @media (max-width: 2560px) and (max-height: 1080px) {
        html {
        font-size: 69% !important;
        }
    }

    @media (max-width: 1920px) {
        html {
        font-size: 62.5% !important;
        }
    }

    @media (max-width: 1600px) {
        html {
        font-size: 54% !important;
        }
    }

    @media (max-width: 1440px) {
        html {
        font-size: 55% !important;
        }
    }

    @media (max-width: 1366px) {
        html {
        font-size: 49% !important;
        }
    }

    @media (max-width: 1280px) {
        html {
        font-size: 45.7% !important;
        }
    }

    @media (max-width: 800px) {
        html {
        font-size: 29% !important;
        }
    }
    
`;ka.createRoot(document.getElementById("root")).render(y(tg,{children:R(fg,{children:[y(h2,{}),y(m2,{})]})}));

function pv(e, t) {
    return t.forEach(function(n) {
        n && typeof n != "string" && !Array.isArray(n) && Object.keys(n).forEach(function(r) {
            if (r !== "default" && !(r in e)) {
                var i = Object.getOwnPropertyDescriptor(n, r);
                Object.defineProperty(e, r, i.get ? i : {
                    enumerable: !0,
                    get: function() {
                        return n[r]
                    }
                })
            }
        })
    }), Object.freeze(Object.defineProperty(e, Symbol.toStringTag, {
        value: "Module"
    }))
}
const hv = function() {
    const t = document.createElement("link").relList;
    if (t && t.supports && t.supports("modulepreload")) return;
    for (const i of document.querySelectorAll('link[rel="modulepreload"]')) r(i);
    new MutationObserver(i => {
        for (const o of i)
            if (o.type === "childList")
                for (const s of o.addedNodes) s.tagName === "LINK" && s.rel === "modulepreload" && r(s)
    }).observe(document, {
        childList: !0,
        subtree: !0
    });

    function n(i) {
        const o = {};
        return i.integrity && (o.integrity = i.integrity), i.referrerpolicy && (o.referrerPolicy = i.referrerpolicy), i.crossorigin === "use-credentials" ? o.credentials = "include" : i.crossorigin === "anonymous" ? o.credentials = "omit" : o.credentials = "same-origin", o
    }

    function r(i) {
        if (i.ep) return;
        i.ep = !0;
        const o = n(i);
        fetch(i.href, o)
    }
};
hv();
var mv = typeof globalThis != "undefined" ? globalThis : typeof window != "undefined" ? window : typeof global != "undefined" ? global : typeof self != "undefined" ? self : {};

function vv(e) {
    return e && e.__esModule && Object.prototype.hasOwnProperty.call(e, "default") ? e.default : e
}
var S = {
        exports: {}
    },
    H = {};
/**
 * @license React
 * react.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
var wi = Symbol.for("react.element"),
    gv = Symbol.for("react.portal"),
    yv = Symbol.for("react.fragment"),
    wv = Symbol.for("react.strict_mode"),
    xv = Symbol.for("react.profiler"),
    Sv = Symbol.for("react.provider"),
    Cv = Symbol.for("react.context"),
    kv = Symbol.for("react.forward_ref"),
    Pv = Symbol.for("react.suspense"),
    Ev = Symbol.for("react.memo"),
    Nv = Symbol.for("react.lazy"),
    tc = Symbol.iterator;

function Tv(e) {
    return e === null || typeof e != "object" ? null : (e = tc && e[tc] || e["@@iterator"], typeof e == "function" ? e : null)
}
var kd = {
        isMounted: function() {
            return !1
        },
        enqueueForceUpdate: function() {},
        enqueueReplaceState: function() {},
        enqueueSetState: function() {}
    },
    Pd = Object.assign,
    Ed = {};

function mr(e, t, n) {
    this.props = e, this.context = t, this.refs = Ed, this.updater = n || kd
}
mr.prototype.isReactComponent = {};
mr.prototype.setState = function(e, t) {
    if (typeof e != "object" && typeof e != "function" && e != null) throw Error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.");
    this.updater.enqueueSetState(this, e, t, "setState")
};
mr.prototype.forceUpdate = function(e) {
    this.updater.enqueueForceUpdate(this, e, "forceUpdate")
};

function Nd() {}
Nd.prototype = mr.prototype;

function Ra(e, t, n) {
    this.props = e, this.context = t, this.refs = Ed, this.updater = n || kd
}
var _a = Ra.prototype = new Nd;
_a.constructor = Ra;
Pd(_a, mr.prototype);
_a.isPureReactComponent = !0;
var nc = Array.isArray,
    Td = Object.prototype.hasOwnProperty,
    Da = {
        current: null
    },
    Ld = {
        key: !0,
        ref: !0,
        __self: !0,
        __source: !0
    };

function Rd(e, t, n) {
    var r, i = {},
        o = null,
        s = null;
    if (t != null)
        for (r in t.ref !== void 0 && (s = t.ref), t.key !== void 0 && (o = "" + t.key), t) Td.call(t, r) && !Ld.hasOwnProperty(r) && (i[r] = t[r]);
    var l = arguments.length - 2;
    if (l === 1) i.children = n;
    else if (1 < l) {
        for (var a = Array(l), u = 0; u < l; u++) a[u] = arguments[u + 2];
        i.children = a
    }
    if (e && e.defaultProps)
        for (r in l = e.defaultProps, l) i[r] === void 0 && (i[r] = l[r]);
    return {
        $$typeof: wi,
        type: e,
        key: o,
        ref: s,
        props: i,
        _owner: Da.current
    }
}

function Lv(e, t) {
    return {
        $$typeof: wi,
        type: e.type,
        key: t,
        ref: e.ref,
        props: e.props,
        _owner: e._owner
    }
}

function Va(e) {
    return typeof e == "object" && e !== null && e.$$typeof === wi
}

function Rv(e) {
    var t = {
        "=": "=0",
        ":": "=2"
    };
    return "$" + e.replace(/[=:]/g, function(n) {
        return t[n]
    })
}
var rc = /\/+/g;

function Ts(e, t) {
    return typeof e == "object" && e !== null && e.key != null ? Rv("" + e.key) : t.toString(36)
}

function Ji(e, t, n, r, i) {
    var o = typeof e;
    (o === "undefined" || o === "boolean") && (e = null);
    var s = !1;
    if (e === null) s = !0;
    else switch (o) {
        case "string":
        case "number":
            s = !0;
            break;
        case "object":
            switch (e.$$typeof) {
                case wi:
                case gv:
                    s = !0
            }
    }
    if (s) return s = e, i = i(s), e = r === "" ? "." + Ts(s, 0) : r, nc(i) ? (n = "", e != null && (n = e.replace(rc, "$&/") + "/"), Ji(i, t, n, "", function(u) {
        return u
    })) : i != null && (Va(i) && (i = Lv(i, n + (!i.key || s && s.key === i.key ? "" : ("" + i.key).replace(rc, "$&/") + "/") + e)), t.push(i)), 1;
    if (s = 0, r = r === "" ? "." : r + ":", nc(e))
        for (var l = 0; l < e.length; l++) {
            o = e[l];
            var a = r + Ts(o, l);
            s += Ji(o, t, n, a, i)
        } else if (a = Tv(e), typeof a == "function")
            for (e = a.call(e), l = 0; !(o = e.next()).done;) o = o.value, a = r + Ts(o, l++), s += Ji(o, t, n, a, i);
        else if (o === "object") throw t = String(e), Error("Objects are not valid as a React child (found: " + (t === "[object Object]" ? "object with keys {" + Object.keys(e).join(", ") + "}" : t) + "). If you meant to render a collection of children, use an array instead.");
    return s
}

function _i(e, t, n) {
    if (e == null) return e;
    var r = [],
        i = 0;
    return Ji(e, r, "", "", function(o) {
        return t.call(n, o, i++)
    }), r
}

function _v(e) {
    if (e._status === -1) {
        var t = e._result;
        t = t(), t.then(function(n) {
            (e._status === 0 || e._status === -1) && (e._status = 1, e._result = n)
        }, function(n) {
            (e._status === 0 || e._status === -1) && (e._status = 2, e._result = n)
        }), e._status === -1 && (e._status = 0, e._result = t)
    }
    if (e._status === 1) return e._result.default;
    throw e._result
}
var De = {
        current: null
    },
    qi = {
        transition: null
    },
    Dv = {
        ReactCurrentDispatcher: De,
        ReactCurrentBatchConfig: qi,
        ReactCurrentOwner: Da
    };
H.Children = {
    map: _i,
    forEach: function(e, t, n) {
        _i(e, function() {
            t.apply(this, arguments)
        }, n)
    },
    count: function(e) {
        var t = 0;
        return _i(e, function() {
            t++
        }), t
    },
    toArray: function(e) {
        return _i(e, function(t) {
            return t
        }) || []
    },
    only: function(e) {
        if (!Va(e)) throw Error("React.Children.only expected to receive a single React element child.");
        return e
    }
};
H.Component = mr;
H.Fragment = yv;
H.Profiler = xv;
H.PureComponent = Ra;
H.StrictMode = wv;
H.Suspense = Pv;
H.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = Dv;
H.cloneElement = function(e, t, n) {
    if (e == null) throw Error("React.cloneElement(...): The argument must be a React element, but you passed " + e + ".");
    var r = Pd({}, e.props),
        i = e.key,
        o = e.ref,
        s = e._owner;
    if (t != null) {
        if (t.ref !== void 0 && (o = t.ref, s = Da.current), t.key !== void 0 && (i = "" + t.key), e.type && e.type.defaultProps) var l = e.type.defaultProps;
        for (a in t) Td.call(t, a) && !Ld.hasOwnProperty(a) && (r[a] = t[a] === void 0 && l !== void 0 ? l[a] : t[a])
    }
    var a = arguments.length - 2;
    if (a === 1) r.children = n;
    else if (1 < a) {
        l = Array(a);
        for (var u = 0; u < a; u++) l[u] = arguments[u + 2];
        r.children = l
    }
    return {
        $$typeof: wi,
        type: e.type,
        key: i,
        ref: o,
        props: r,
        _owner: s
    }
};
H.createContext = function(e) {
    return e = {
        $$typeof: Cv,
        _currentValue: e,
        _currentValue2: e,
        _threadCount: 0,
        Provider: null,
        Consumer: null,
        _defaultValue: null,
        _globalName: null
    }, e.Provider = {
        $$typeof: Sv,
        _context: e
    }, e.Consumer = e
};
H.createElement = Rd;
H.createFactory = function(e) {
    var t = Rd.bind(null, e);
    return t.type = e, t
};
H.createRef = function() {
    return {
        current: null
    }
};
H.forwardRef = function(e) {
    return {
        $$typeof: kv,
        render: e
    }
};
H.isValidElement = Va;
H.lazy = function(e) {
    return {
        $$typeof: Nv,
        _payload: {
            _status: -1,
            _result: e
        },
        _init: _v
    }
};
H.memo = function(e, t) {
    return {
        $$typeof: Ev,
        type: e,
        compare: t === void 0 ? null : t
    }
};
H.startTransition = function(e) {
    var t = qi.transition;
    qi.transition = {};
    try {
        e()
    } finally {
        qi.transition = t
    }
};
H.unstable_act = function() {
    throw Error("act(...) is not supported in production builds of React.")
};
H.useCallback = function(e, t) {
    return De.current.useCallback(e, t)
};
H.useContext = function(e) {
    return De.current.useContext(e)
};
H.useDebugValue = function() {};
H.useDeferredValue = function(e) {
    return De.current.useDeferredValue(e)
};
H.useEffect = function(e, t) {
    return De.current.useEffect(e, t)
};
H.useId = function() {
    return De.current.useId()
};
H.useImperativeHandle = function(e, t, n) {
    return De.current.useImperativeHandle(e, t, n)
};
H.useInsertionEffect = function(e, t) {
    return De.current.useInsertionEffect(e, t)
};
H.useLayoutEffect = function(e, t) {
    return De.current.useLayoutEffect(e, t)
};
H.useMemo = function(e, t) {
    return De.current.useMemo(e, t)
};
H.useReducer = function(e, t, n) {
    return De.current.useReducer(e, t, n)
};
H.useRef = function(e) {
    return De.current.useRef(e)
};
H.useState = function(e) {
    return De.current.useState(e)
};
H.useSyncExternalStore = function(e, t, n) {
    return De.current.useSyncExternalStore(e, t, n)
};
H.useTransition = function() {
    return De.current.useTransition()
};
H.version = "18.2.0";
S.exports = H;
var Jo = S.exports,
    hl = pv({
        __proto__: null,
        default: Jo
    }, [S.exports]),
    ml = {},
    _d = {
        exports: {}
    },
    He = {},
    Dd = {
        exports: {}
    },
    Vd = {};
/**
 * @license React
 * scheduler.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
(function(e) {
    function t(R, E) {
        var C = R.length;
        R.push(E);
        e: for (; 0 < C;) {
            var F = C - 1 >>> 1,
                _ = R[F];
            if (0 < i(_, E)) R[F] = E, R[C] = _, C = F;
            else break e
        }
    }

    function n(R) {
        return R.length === 0 ? null : R[0]
    }

    function r(R) {
        if (R.length === 0) return null;
        var E = R[0],
            C = R.pop();
        if (C !== E) {
            R[0] = C;
            e: for (var F = 0, _ = R.length, U = _ >>> 1; F < U;) {
                var b = 2 * (F + 1) - 1,
                    J = R[b],
                    te = b + 1,
                    Ee = R[te];
                if (0 > i(J, C)) te < _ && 0 > i(Ee, J) ? (R[F] = Ee, R[te] = C, F = te) : (R[F] = J, R[b] = C, F = b);
                else if (te < _ && 0 > i(Ee, C)) R[F] = Ee, R[te] = C, F = te;
                else break e
            }
        }
        return E
    }

    function i(R, E) {
        var C = R.sortIndex - E.sortIndex;
        return C !== 0 ? C : R.id - E.id
    }
    if (typeof performance == "object" && typeof performance.now == "function") {
        var o = performance;
        e.unstable_now = function() {
            return o.now()
        }
    } else {
        var s = Date,
            l = s.now();
        e.unstable_now = function() {
            return s.now() - l
        }
    }
    var a = [],
        u = [],
        c = 1,
        f = null,
        d = 3,
        m = !1,
        g = !1,
        w = !1,
        k = typeof setTimeout == "function" ? setTimeout : null,
        h = typeof clearTimeout == "function" ? clearTimeout : null,
        p = typeof setImmediate != "undefined" ? setImmediate : null;
    typeof navigator != "undefined" && navigator.scheduling !== void 0 && navigator.scheduling.isInputPending !== void 0 && navigator.scheduling.isInputPending.bind(navigator.scheduling);

    function v(R) {
        for (var E = n(u); E !== null;) {
            if (E.callback === null) r(u);
            else if (E.startTime <= R) r(u), E.sortIndex = E.expirationTime, t(a, E);
            else break;
            E = n(u)
        }
    }

    function x(R) {
        if (w = !1, v(R), !g)
            if (n(a) !== null) g = !0, Z(P);
            else {
                var E = n(u);
                E !== null && ve(x, E.startTime - R)
            }
    }

    function P(R, E) {
        g = !1, w && (w = !1, h(D), D = -1), m = !0;
        var C = d;
        try {
            for (v(E), f = n(a); f !== null && (!(f.expirationTime > E) || R && !ee());) {
                var F = f.callback;
                if (typeof F == "function") {
                    f.callback = null, d = f.priorityLevel;
                    var _ = F(f.expirationTime <= E);
                    E = e.unstable_now(), typeof _ == "function" ? f.callback = _ : f === n(a) && r(a), v(E)
                } else r(a);
                f = n(a)
            }
            if (f !== null) var U = !0;
            else {
                var b = n(u);
                b !== null && ve(x, b.startTime - E), U = !1
            }
            return U
        } finally {
            f = null, d = C, m = !1
        }
    }
    var T = !1,
        L = null,
        D = -1,
        B = 5,
        I = -1;

    function ee() {
        return !(e.unstable_now() - I < B)
    }

    function M() {
        if (L !== null) {
            var R = e.unstable_now();
            I = R;
            var E = !0;
            try {
                E = L(!0, R)
            } finally {
                E ? O() : (T = !1, L = null)
            }
        } else T = !1
    }
    var O;
    if (typeof p == "function") O = function() {
        p(M)
    };
    else if (typeof MessageChannel != "undefined") {
        var $ = new MessageChannel,
            j = $.port2;
        $.port1.onmessage = M, O = function() {
            j.postMessage(null)
        }
    } else O = function() {
        k(M, 0)
    };

    function Z(R) {
        L = R, T || (T = !0, O())
    }

    function ve(R, E) {
        D = k(function() {
            R(e.unstable_now())
        }, E)
    }
    e.unstable_IdlePriority = 5, e.unstable_ImmediatePriority = 1, e.unstable_LowPriority = 4, e.unstable_NormalPriority = 3, e.unstable_Profiling = null, e.unstable_UserBlockingPriority = 2, e.unstable_cancelCallback = function(R) {
        R.callback = null
    }, e.unstable_continueExecution = function() {
        g || m || (g = !0, Z(P))
    }, e.unstable_forceFrameRate = function(R) {
        0 > R || 125 < R ? console.error("forceFrameRate takes a positive int between 0 and 125, forcing frame rates higher than 125 fps is not supported") : B = 0 < R ? Math.floor(1e3 / R) : 5
    }, e.unstable_getCurrentPriorityLevel = function() {
        return d
    }, e.unstable_getFirstCallbackNode = function() {
        return n(a)
    }, e.unstable_next = function(R) {
        switch (d) {
            case 1:
            case 2:
            case 3:
                var E = 3;
                break;
            default:
                E = d
        }
        var C = d;
        d = E;
        try {
            return R()
        } finally {
            d = C
        }
    }, e.unstable_pauseExecution = function() {}, e.unstable_requestPaint = function() {}, e.unstable_runWithPriority = function(R, E) {
        switch (R) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
                break;
            default:
                R = 3
        }
        var C = d;
        d = R;
        try {
            return E()
        } finally {
            d = C
        }
    }, e.unstable_scheduleCallback = function(R, E, C) {
        var F = e.unstable_now();
        switch (typeof C == "object" && C !== null ? (C = C.delay, C = typeof C == "number" && 0 < C ? F + C : F) : C = F, R) {
            case 1:
                var _ = -1;
                break;
            case 2:
                _ = 250;
                break;
            case 5:
                _ = 1073741823;
                break;
            case 4:
                _ = 1e4;
                break;
            default:
                _ = 5e3
        }
        return _ = C + _, R = {
            id: c++,
            callback: E,
            priorityLevel: R,
            startTime: C,
            expirationTime: _,
            sortIndex: -1
        }, C > F ? (R.sortIndex = C, t(u, R), n(a) === null && R === n(u) && (w ? (h(D), D = -1) : w = !0, ve(x, C - F))) : (R.sortIndex = _, t(a, R), g || m || (g = !0, Z(P))), R
    }, e.unstable_shouldYield = ee, e.unstable_wrapCallback = function(R) {
        var E = d;
        return function() {
            var C = d;
            d = E;
            try {
                return R.apply(this, arguments)
            } finally {
                d = C
            }
        }
    }
})(Vd);
Dd.exports = Vd;
/**
 * @license React
 * react-dom.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
var Ad = S.exports,
    $e = Dd.exports;

function N(e) {
    for (var t = "https://reactjs.org/docs/error-decoder.html?invariant=" + e, n = 1; n < arguments.length; n++) t += "&args[]=" + encodeURIComponent(arguments[n]);
    return "Minified React error #" + e + "; visit " + t + " for the full message or use the non-minified dev environment for full errors and additional helpful warnings."
}
var Md = new Set,
    Zr = {};

function Ln(e, t) {
    sr(e, t), sr(e + "Capture", t)
}

function sr(e, t) {
    for (Zr[e] = t, e = 0; e < t.length; e++) Md.add(t[e])
}
var Tt = !(typeof window == "undefined" || typeof window.document == "undefined" || typeof window.document.createElement == "undefined"),
    vl = Object.prototype.hasOwnProperty,
    Vv = /^[:A-Z_a-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02FF\u0370-\u037D\u037F-\u1FFF\u200C-\u200D\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD][:A-Z_a-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02FF\u0370-\u037D\u037F-\u1FFF\u200C-\u200D\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD\-.0-9\u00B7\u0300-\u036F\u203F-\u2040]*$/,
    ic = {},
    oc = {};

function Av(e) {
    return vl.call(oc, e) ? !0 : vl.call(ic, e) ? !1 : Vv.test(e) ? oc[e] = !0 : (ic[e] = !0, !1)
}

function Mv(e, t, n, r) {
    if (n !== null && n.type === 0) return !1;
    switch (typeof t) {
        case "function":
        case "symbol":
            return !0;
        case "boolean":
            return r ? !1 : n !== null ? !n.acceptsBooleans : (e = e.toLowerCase().slice(0, 5), e !== "data-" && e !== "aria-");
        default:
            return !1
    }
}

function Ov(e, t, n, r) {
    if (t === null || typeof t == "undefined" || Mv(e, t, n, r)) return !0;
    if (r) return !1;
    if (n !== null) switch (n.type) {
        case 3:
            return !t;
        case 4:
            return t === !1;
        case 5:
            return isNaN(t);
        case 6:
            return isNaN(t) || 1 > t
    }
    return !1
}

function Ve(e, t, n, r, i, o, s) {
    this.acceptsBooleans = t === 2 || t === 3 || t === 4, this.attributeName = r, this.attributeNamespace = i, this.mustUseProperty = n, this.propertyName = e, this.type = t, this.sanitizeURL = o, this.removeEmptyString = s
}
var xe = {};
"children dangerouslySetInnerHTML defaultValue defaultChecked innerHTML suppressContentEditableWarning suppressHydrationWarning style".split(" ").forEach(function(e) {
    xe[e] = new Ve(e, 0, !1, e, null, !1, !1)
});
[
    ["acceptCharset", "accept-charset"],
    ["className", "class"],
    ["htmlFor", "for"],
    ["httpEquiv", "http-equiv"]
].forEach(function(e) {
    var t = e[0];
    xe[t] = new Ve(t, 1, !1, e[1], null, !1, !1)
});
["contentEditable", "draggable", "spellCheck", "value"].forEach(function(e) {
    xe[e] = new Ve(e, 2, !1, e.toLowerCase(), null, !1, !1)
});
["autoReverse", "externalResourcesRequired", "focusable", "preserveAlpha"].forEach(function(e) {
    xe[e] = new Ve(e, 2, !1, e, null, !1, !1)
});
"allowFullScreen async autoFocus autoPlay controls default defer disabled disablePictureInPicture disableRemotePlayback formNoValidate hidden loop noModule noValidate open playsInline readOnly required reversed scoped seamless itemScope".split(" ").forEach(function(e) {
    xe[e] = new Ve(e, 3, !1, e.toLowerCase(), null, !1, !1)
});
["checked", "multiple", "muted", "selected"].forEach(function(e) {
    xe[e] = new Ve(e, 3, !0, e, null, !1, !1)
});
["capture", "download"].forEach(function(e) {
    xe[e] = new Ve(e, 4, !1, e, null, !1, !1)
});
["cols", "rows", "size", "span"].forEach(function(e) {
    xe[e] = new Ve(e, 6, !1, e, null, !1, !1)
});
["rowSpan", "start"].forEach(function(e) {
    xe[e] = new Ve(e, 5, !1, e.toLowerCase(), null, !1, !1)
});
var Aa = /[\-:]([a-z])/g;

function Ma(e) {
    return e[1].toUpperCase()
}
"accent-height alignment-baseline arabic-form baseline-shift cap-height clip-path clip-rule color-interpolation color-interpolation-filters color-profile color-rendering dominant-baseline enable-background fill-opacity fill-rule flood-color flood-opacity font-family font-size font-size-adjust font-stretch font-style font-variant font-weight glyph-name glyph-orientation-horizontal glyph-orientation-vertical horiz-adv-x horiz-origin-x image-rendering letter-spacing lighting-color marker-end marker-mid marker-start overline-position overline-thickness paint-order panose-1 pointer-events rendering-intent shape-rendering stop-color stop-opacity strikethrough-position strikethrough-thickness stroke-dasharray stroke-dashoffset stroke-linecap stroke-linejoin stroke-miterlimit stroke-opacity stroke-width text-anchor text-decoration text-rendering underline-position underline-thickness unicode-bidi unicode-range units-per-em v-alphabetic v-hanging v-ideographic v-mathematical vector-effect vert-adv-y vert-origin-x vert-origin-y word-spacing writing-mode xmlns:xlink x-height".split(" ").forEach(function(e) {
    var t = e.replace(Aa, Ma);
    xe[t] = new Ve(t, 1, !1, e, null, !1, !1)
});
"xlink:actuate xlink:arcrole xlink:role xlink:show xlink:title xlink:type".split(" ").forEach(function(e) {
    var t = e.replace(Aa, Ma);
    xe[t] = new Ve(t, 1, !1, e, "http://www.w3.org/1999/xlink", !1, !1)
});
["xml:base", "xml:lang", "xml:space"].forEach(function(e) {
    var t = e.replace(Aa, Ma);
    xe[t] = new Ve(t, 1, !1, e, "http://www.w3.org/XML/1998/namespace", !1, !1)
});
["tabIndex", "crossOrigin"].forEach(function(e) {
    xe[e] = new Ve(e, 1, !1, e.toLowerCase(), null, !1, !1)
});
xe.xlinkHref = new Ve("xlinkHref", 1, !1, "xlink:href", "http://www.w3.org/1999/xlink", !0, !1);
["src", "href", "action", "formAction"].forEach(function(e) {
    xe[e] = new Ve(e, 1, !1, e.toLowerCase(), null, !0, !0)
});

function Oa(e, t, n, r) {
    var i = xe.hasOwnProperty(t) ? xe[t] : null;
    (i !== null ? i.type !== 0 : r || !(2 < t.length) || t[0] !== "o" && t[0] !== "O" || t[1] !== "n" && t[1] !== "N") && (Ov(t, n, i, r) && (n = null), r || i === null ? Av(t) && (n === null ? e.removeAttribute(t) : e.setAttribute(t, "" + n)) : i.mustUseProperty ? e[i.propertyName] = n === null ? i.type === 3 ? !1 : "" : n : (t = i.attributeName, r = i.attributeNamespace, n === null ? e.removeAttribute(t) : (i = i.type, n = i === 3 || i === 4 && n === !0 ? "" : "" + n, r ? e.setAttributeNS(r, t, n) : e.setAttribute(t, n))))
}
var Dt = Ad.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED,
    Di = Symbol.for("react.element"),
    jn = Symbol.for("react.portal"),
    zn = Symbol.for("react.fragment"),
    Ia = Symbol.for("react.strict_mode"),
    gl = Symbol.for("react.profiler"),
    Od = Symbol.for("react.provider"),
    Id = Symbol.for("react.context"),
    Fa = Symbol.for("react.forward_ref"),
    yl = Symbol.for("react.suspense"),
    wl = Symbol.for("react.suspense_list"),
    ja = Symbol.for("react.memo"),
    jt = Symbol.for("react.lazy"),
    Fd = Symbol.for("react.offscreen"),
    sc = Symbol.iterator;

function Sr(e) {
    return e === null || typeof e != "object" ? null : (e = sc && e[sc] || e["@@iterator"], typeof e == "function" ? e : null)
}
var ie = Object.assign,
    Ls;

function Dr(e) {
    if (Ls === void 0) try {
        throw Error()
    } catch (n) {
        var t = n.stack.trim().match(/\n( *(at )?)/);
        Ls = t && t[1] || ""
    }
    return `
` + Ls + e
}
var Rs = !1;

function _s(e, t) {
    if (!e || Rs) return "";
    Rs = !0;
    var n = Error.prepareStackTrace;
    Error.prepareStackTrace = void 0;
    try {
        if (t)
            if (t = function() {
                    throw Error()
                }, Object.defineProperty(t.prototype, "props", {
                    set: function() {
                        throw Error()
                    }
                }), typeof Reflect == "object" && Reflect.construct) {
                try {
                    Reflect.construct(t, [])
                } catch (u) {
                    var r = u
                }
                Reflect.construct(e, [], t)
            } else {
                try {
                    t.call()
                } catch (u) {
                    r = u
                }
                e.call(t.prototype)
            }
        else {
            try {
                throw Error()
            } catch (u) {
                r = u
            }
            e()
        }
    } catch (u) {
        if (u && r && typeof u.stack == "string") {
            for (var i = u.stack.split(`
`), o = r.stack.split(`
`), s = i.length - 1, l = o.length - 1; 1 <= s && 0 <= l && i[s] !== o[l];) l--;
            for (; 1 <= s && 0 <= l; s--, l--)
                if (i[s] !== o[l]) {
                    if (s !== 1 || l !== 1)
                        do
                            if (s--, l--, 0 > l || i[s] !== o[l]) {
                                var a = `
` + i[s].replace(" at new ", " at ");
                                return e.displayName && a.includes("<anonymous>") && (a = a.replace("<anonymous>", e.displayName)), a
                            }
                    while (1 <= s && 0 <= l);
                    break
                }
        }
    } finally {
        Rs = !1, Error.prepareStackTrace = n
    }
    return (e = e ? e.displayName || e.name : "") ? Dr(e) : ""
}

function Iv(e) {
    switch (e.tag) {
        case 5:
            return Dr(e.type);
        case 16:
            return Dr("Lazy");
        case 13:
            return Dr("Suspense");
        case 19:
            return Dr("SuspenseList");
        case 0:
        case 2:
        case 15:
            return e = _s(e.type, !1), e;
        case 11:
            return e = _s(e.type.render, !1), e;
        case 1:
            return e = _s(e.type, !0), e;
        default:
            return ""
    }
}

function xl(e) {
    if (e == null) return null;
    if (typeof e == "function") return e.displayName || e.name || null;
    if (typeof e == "string") return e;
    switch (e) {
        case zn:
            return "Fragment";
        case jn:
            return "Portal";
        case gl:
            return "Profiler";
        case Ia:
            return "StrictMode";
        case yl:
            return "Suspense";
        case wl:
            return "SuspenseList"
    }
    if (typeof e == "object") switch (e.$$typeof) {
        case Id:
            return (e.displayName || "Context") + ".Consumer";
        case Od:
            return (e._context.displayName || "Context") + ".Provider";
        case Fa:
            var t = e.render;
            return e = e.displayName, e || (e = t.displayName || t.name || "", e = e !== "" ? "ForwardRef(" + e + ")" : "ForwardRef"), e;
        case ja:
            return t = e.displayName || null, t !== null ? t : xl(e.type) || "Memo";
        case jt:
            t = e._payload, e = e._init;
            try {
                return xl(e(t))
            } catch {}
    }
    return null
}

function Fv(e) {
    var t = e.type;
    switch (e.tag) {
        case 24:
            return "Cache";
        case 9:
            return (t.displayName || "Context") + ".Consumer";
        case 10:
            return (t._context.displayName || "Context") + ".Provider";
        case 18:
            return "DehydratedFragment";
        case 11:
            return e = t.render, e = e.displayName || e.name || "", t.displayName || (e !== "" ? "ForwardRef(" + e + ")" : "ForwardRef");
        case 7:
            return "Fragment";
        case 5:
            return t;
        case 4:
            return "Portal";
        case 3:
            return "Root";
        case 6:
            return "Text";
        case 16:
            return xl(t);
        case 8:
            return t === Ia ? "StrictMode" : "Mode";
        case 22:
            return "Offscreen";
        case 12:
            return "Profiler";
        case 21:
            return "Scope";
        case 13:
            return "Suspense";
        case 19:
            return "SuspenseList";
        case 25:
            return "TracingMarker";
        case 1:
        case 0:
        case 17:
        case 2:
        case 14:
        case 15:
            if (typeof t == "function") return t.displayName || t.name || null;
            if (typeof t == "string") return t
    }
    return null
}

function nn(e) {
    switch (typeof e) {
        case "boolean":
        case "number":
        case "string":
        case "undefined":
            return e;
        case "object":
            return e;
        default:
            return ""
    }
}

function jd(e) {
    var t = e.type;
    return (e = e.nodeName) && e.toLowerCase() === "input" && (t === "checkbox" || t === "radio")
}

function jv(e) {
    var t = jd(e) ? "checked" : "value",
        n = Object.getOwnPropertyDescriptor(e.constructor.prototype, t),
        r = "" + e[t];
    if (!e.hasOwnProperty(t) && typeof n != "undefined" && typeof n.get == "function" && typeof n.set == "function") {
        var i = n.get,
            o = n.set;
        return Object.defineProperty(e, t, {
            configurable: !0,
            get: function() {
                return i.call(this)
            },
            set: function(s) {
                r = "" + s, o.call(this, s)
            }
        }), Object.defineProperty(e, t, {
            enumerable: n.enumerable
        }), {
            getValue: function() {
                return r
            },
            setValue: function(s) {
                r = "" + s
            },
            stopTracking: function() {
                e._valueTracker = null, delete e[t]
            }
        }
    }
}

function Vi(e) {
    e._valueTracker || (e._valueTracker = jv(e))
}

function zd(e) {
    if (!e) return !1;
    var t = e._valueTracker;
    if (!t) return !0;
    var n = t.getValue(),
        r = "";
    return e && (r = jd(e) ? e.checked ? "true" : "false" : e.value), e = r, e !== n ? (t.setValue(e), !0) : !1
}

function po(e) {
    if (e = e || (typeof document != "undefined" ? document : void 0), typeof e == "undefined") return null;
    try {
        return e.activeElement || e.body
    } catch {
        return e.body
    }
}

function Sl(e, t) {
    var n = t.checked;
    return ie({}, t, {
        defaultChecked: void 0,
        defaultValue: void 0,
        value: void 0,
        checked: n != null ? n : e._wrapperState.initialChecked
    })
}

function lc(e, t) {
    var n = t.defaultValue == null ? "" : t.defaultValue,
        r = t.checked != null ? t.checked : t.defaultChecked;
    n = nn(t.value != null ? t.value : n), e._wrapperState = {
        initialChecked: r,
        initialValue: n,
        controlled: t.type === "checkbox" || t.type === "radio" ? t.checked != null : t.value != null
    }
}

function Bd(e, t) {
    t = t.checked, t != null && Oa(e, "checked", t, !1)
}

function Cl(e, t) {
    Bd(e, t);
    var n = nn(t.value),
        r = t.type;
    if (n != null) r === "number" ? (n === 0 && e.value === "" || e.value != n) && (e.value = "" + n) : e.value !== "" + n && (e.value = "" + n);
    else if (r === "submit" || r === "reset") {
        e.removeAttribute("value");
        return
    }
    t.hasOwnProperty("value") ? kl(e, t.type, n) : t.hasOwnProperty("defaultValue") && kl(e, t.type, nn(t.defaultValue)), t.checked == null && t.defaultChecked != null && (e.defaultChecked = !!t.defaultChecked)
}

function ac(e, t, n) {
    if (t.hasOwnProperty("value") || t.hasOwnProperty("defaultValue")) {
        var r = t.type;
        if (!(r !== "submit" && r !== "reset" || t.value !== void 0 && t.value !== null)) return;
        t = "" + e._wrapperState.initialValue, n || t === e.value || (e.value = t), e.defaultValue = t
    }
    n = e.name, n !== "" && (e.name = ""), e.defaultChecked = !!e._wrapperState.initialChecked, n !== "" && (e.name = n)
}

function kl(e, t, n) {
    (t !== "number" || po(e.ownerDocument) !== e) && (n == null ? e.defaultValue = "" + e._wrapperState.initialValue : e.defaultValue !== "" + n && (e.defaultValue = "" + n))
}
var Vr = Array.isArray;

function qn(e, t, n, r) {
    if (e = e.options, t) {
        t = {};
        for (var i = 0; i < n.length; i++) t["$" + n[i]] = !0;
        for (n = 0; n < e.length; n++) i = t.hasOwnProperty("$" + e[n].value), e[n].selected !== i && (e[n].selected = i), i && r && (e[n].defaultSelected = !0)
    } else {
        for (n = "" + nn(n), t = null, i = 0; i < e.length; i++) {
            if (e[i].value === n) {
                e[i].selected = !0, r && (e[i].defaultSelected = !0);
                return
            }
            t !== null || e[i].disabled || (t = e[i])
        }
        t !== null && (t.selected = !0)
    }
}

function Pl(e, t) {
    if (t.dangerouslySetInnerHTML != null) throw Error(N(91));
    return ie({}, t, {
        value: void 0,
        defaultValue: void 0,
        children: "" + e._wrapperState.initialValue
    })
}

function uc(e, t) {
    var n = t.value;
    if (n == null) {
        if (n = t.children, t = t.defaultValue, n != null) {
            if (t != null) throw Error(N(92));
            if (Vr(n)) {
                if (1 < n.length) throw Error(N(93));
                n = n[0]
            }
            t = n
        }
        t == null && (t = ""), n = t
    }
    e._wrapperState = {
        initialValue: nn(n)
    }
}

function Ud(e, t) {
    var n = nn(t.value),
        r = nn(t.defaultValue);
    n != null && (n = "" + n, n !== e.value && (e.value = n), t.defaultValue == null && e.defaultValue !== n && (e.defaultValue = n)), r != null && (e.defaultValue = "" + r)
}

function cc(e) {
    var t = e.textContent;
    t === e._wrapperState.initialValue && t !== "" && t !== null && (e.value = t)
}

function $d(e) {
    switch (e) {
        case "svg":
            return "http://www.w3.org/2000/svg";
        case "math":
            return "http://www.w3.org/1998/Math/MathML";
        default:
            return "http://www.w3.org/1999/xhtml"
    }
}

function El(e, t) {
    return e == null || e === "http://www.w3.org/1999/xhtml" ? $d(t) : e === "http://www.w3.org/2000/svg" && t === "foreignObject" ? "http://www.w3.org/1999/xhtml" : e
}
var Ai, bd = function(e) {
    return typeof MSApp != "undefined" && MSApp.execUnsafeLocalFunction ? function(t, n, r, i) {
        MSApp.execUnsafeLocalFunction(function() {
            return e(t, n, r, i)
        })
    } : e
}(function(e, t) {
    if (e.namespaceURI !== "http://www.w3.org/2000/svg" || "innerHTML" in e) e.innerHTML = t;
    else {
        for (Ai = Ai || document.createElement("div"), Ai.innerHTML = "<svg>" + t.valueOf().toString() + "</svg>", t = Ai.firstChild; e.firstChild;) e.removeChild(e.firstChild);
        for (; t.firstChild;) e.appendChild(t.firstChild)
    }
});

function Jr(e, t) {
    if (t) {
        var n = e.firstChild;
        if (n && n === e.lastChild && n.nodeType === 3) {
            n.nodeValue = t;
            return
        }
    }
    e.textContent = t
}
var Ir = {
        animationIterationCount: !0,
        aspectRatio: !0,
        borderImageOutset: !0,
        borderImageSlice: !0,
        borderImageWidth: !0,
        boxFlex: !0,
        boxFlexGroup: !0,
        boxOrdinalGroup: !0,
        columnCount: !0,
        columns: !0,
        flex: !0,
        flexGrow: !0,
        flexPositive: !0,
        flexShrink: !0,
        flexNegative: !0,
        flexOrder: !0,
        gridArea: !0,
        gridRow: !0,
        gridRowEnd: !0,
        gridRowSpan: !0,
        gridRowStart: !0,
        gridColumn: !0,
        gridColumnEnd: !0,
        gridColumnSpan: !0,
        gridColumnStart: !0,
        fontWeight: !0,
        lineClamp: !0,
        lineHeight: !0,
        opacity: !0,
        order: !0,
        orphans: !0,
        tabSize: !0,
        widows: !0,
        zIndex: !0,
        zoom: !0,
        fillOpacity: !0,
        floodOpacity: !0,
        stopOpacity: !0,
        strokeDasharray: !0,
        strokeDashoffset: !0,
        strokeMiterlimit: !0,
        strokeOpacity: !0,
        strokeWidth: !0
    },
    zv = ["Webkit", "ms", "Moz", "O"];
Object.keys(Ir).forEach(function(e) {
    zv.forEach(function(t) {
        t = t + e.charAt(0).toUpperCase() + e.substring(1), Ir[t] = Ir[e]
    })
});

function Hd(e, t, n) {
    return t == null || typeof t == "boolean" || t === "" ? "" : n || typeof t != "number" || t === 0 || Ir.hasOwnProperty(e) && Ir[e] ? ("" + t).trim() : t + "px"
}

function Wd(e, t) {
    e = e.style;
    for (var n in t)
        if (t.hasOwnProperty(n)) {
            var r = n.indexOf("--") === 0,
                i = Hd(n, t[n], r);
            n === "float" && (n = "cssFloat"), r ? e.setProperty(n, i) : e[n] = i
        }
}
var Bv = ie({
    menuitem: !0
}, {
    area: !0,
    base: !0,
    br: !0,
    col: !0,
    embed: !0,
    hr: !0,
    img: !0,
    input: !0,
    keygen: !0,
    link: !0,
    meta: !0,
    param: !0,
    source: !0,
    track: !0,
    wbr: !0
});

function Nl(e, t) {
    if (t) {
        if (Bv[e] && (t.children != null || t.dangerouslySetInnerHTML != null)) throw Error(N(137, e));
        if (t.dangerouslySetInnerHTML != null) {
            if (t.children != null) throw Error(N(60));
            if (typeof t.dangerouslySetInnerHTML != "object" || !("__html" in t.dangerouslySetInnerHTML)) throw Error(N(61))
        }
        if (t.style != null && typeof t.style != "object") throw Error(N(62))
    }
}

function Tl(e, t) {
    if (e.indexOf("-") === -1) return typeof t.is == "string";
    switch (e) {
        case "annotation-xml":
        case "color-profile":
        case "font-face":
        case "font-face-src":
        case "font-face-uri":
        case "font-face-format":
        case "font-face-name":
        case "missing-glyph":
            return !1;
        default:
            return !0
    }
}
var Ll = null;

function za(e) {
    return e = e.target || e.srcElement || window, e.correspondingUseElement && (e = e.correspondingUseElement), e.nodeType === 3 ? e.parentNode : e
}
var Rl = null,
    er = null,
    tr = null;

function fc(e) {
    if (e = Ci(e)) {
        if (typeof Rl != "function") throw Error(N(280));
        var t = e.stateNode;
        t && (t = rs(t), Rl(e.stateNode, e.type, t))
    }
}

function Kd(e) {
    er ? tr ? tr.push(e) : tr = [e] : er = e
}

function Qd() {
    if (er) {
        var e = er,
            t = tr;
        if (tr = er = null, fc(e), t)
            for (e = 0; e < t.length; e++) fc(t[e])
    }
}

function Gd(e, t) {
    return e(t)
}

function Yd() {}
var Ds = !1;

function Xd(e, t, n) {
    if (Ds) return e(t, n);
    Ds = !0;
    try {
        return Gd(e, t, n)
    } finally {
        Ds = !1, (er !== null || tr !== null) && (Yd(), Qd())
    }
}

function qr(e, t) {
    var n = e.stateNode;
    if (n === null) return null;
    var r = rs(n);
    if (r === null) return null;
    n = r[t];
    e: switch (t) {
        case "onClick":
        case "onClickCapture":
        case "onDoubleClick":
        case "onDoubleClickCapture":
        case "onMouseDown":
        case "onMouseDownCapture":
        case "onMouseMove":
        case "onMouseMoveCapture":
        case "onMouseUp":
        case "onMouseUpCapture":
        case "onMouseEnter":
            (r = !r.disabled) || (e = e.type, r = !(e === "button" || e === "input" || e === "select" || e === "textarea")), e = !r;
            break e;
        default:
            e = !1
    }
    if (e) return null;
    if (n && typeof n != "function") throw Error(N(231, t, typeof n));
    return n
}
var _l = !1;
if (Tt) try {
    var Cr = {};
    Object.defineProperty(Cr, "passive", {
        get: function() {
            _l = !0
        }
    }), window.addEventListener("test", Cr, Cr), window.removeEventListener("test", Cr, Cr)
} catch {
    _l = !1
}

function Uv(e, t, n, r, i, o, s, l, a) {
    var u = Array.prototype.slice.call(arguments, 3);
    try {
        t.apply(n, u)
    } catch (c) {
        this.onError(c)
    }
}
var Fr = !1,
    ho = null,
    mo = !1,
    Dl = null,
    $v = {
        onError: function(e) {
            Fr = !0, ho = e
        }
    };

function bv(e, t, n, r, i, o, s, l, a) {
    Fr = !1, ho = null, Uv.apply($v, arguments)
}

function Hv(e, t, n, r, i, o, s, l, a) {
    if (bv.apply(this, arguments), Fr) {
        if (Fr) {
            var u = ho;
            Fr = !1, ho = null
        } else throw Error(N(198));
        mo || (mo = !0, Dl = u)
    }
}

function Rn(e) {
    var t = e,
        n = e;
    if (e.alternate)
        for (; t.return;) t = t.return;
    else {
        e = t;
        do t = e, (t.flags & 4098) !== 0 && (n = t.return), e = t.return; while (e)
    }
    return t.tag === 3 ? n : null
}

function Zd(e) {
    if (e.tag === 13) {
        var t = e.memoizedState;
        if (t === null && (e = e.alternate, e !== null && (t = e.memoizedState)), t !== null) return t.dehydrated
    }
    return null
}

function dc(e) {
    if (Rn(e) !== e) throw Error(N(188))
}

function Wv(e) {
    var t = e.alternate;
    if (!t) {
        if (t = Rn(e), t === null) throw Error(N(188));
        return t !== e ? null : e
    }
    for (var n = e, r = t;;) {
        var i = n.return;
        if (i === null) break;
        var o = i.alternate;
        if (o === null) {
            if (r = i.return, r !== null) {
                n = r;
                continue
            }
            break
        }
        if (i.child === o.child) {
            for (o = i.child; o;) {
                if (o === n) return dc(i), e;
                if (o === r) return dc(i), t;
                o = o.sibling
            }
            throw Error(N(188))
        }
        if (n.return !== r.return) n = i, r = o;
        else {
            for (var s = !1, l = i.child; l;) {
                if (l === n) {
                    s = !0, n = i, r = o;
                    break
                }
                if (l === r) {
                    s = !0, r = i, n = o;
                    break
                }
                l = l.sibling
            }
            if (!s) {
                for (l = o.child; l;) {
                    if (l === n) {
                        s = !0, n = o, r = i;
                        break
                    }
                    if (l === r) {
                        s = !0, r = o, n = i;
                        break
                    }
                    l = l.sibling
                }
                if (!s) throw Error(N(189))
            }
        }
        if (n.alternate !== r) throw Error(N(190))
    }
    if (n.tag !== 3) throw Error(N(188));
    return n.stateNode.current === n ? e : t
}

function Jd(e) {
    return e = Wv(e), e !== null ? qd(e) : null
}

function qd(e) {
    if (e.tag === 5 || e.tag === 6) return e;
    for (e = e.child; e !== null;) {
        var t = qd(e);
        if (t !== null) return t;
        e = e.sibling
    }
    return null
}
var ep = $e.unstable_scheduleCallback,
    pc = $e.unstable_cancelCallback,
    Kv = $e.unstable_shouldYield,
    Qv = $e.unstable_requestPaint,
    ae = $e.unstable_now,
    Gv = $e.unstable_getCurrentPriorityLevel,
    Ba = $e.unstable_ImmediatePriority,
    tp = $e.unstable_UserBlockingPriority,
    vo = $e.unstable_NormalPriority,
    Yv = $e.unstable_LowPriority,
    np = $e.unstable_IdlePriority,
    qo = null,
    pt = null;

function Xv(e) {
    if (pt && typeof pt.onCommitFiberRoot == "function") try {
        pt.onCommitFiberRoot(qo, e, void 0, (e.current.flags & 128) === 128)
    } catch {}
}
var ot = Math.clz32 ? Math.clz32 : qv,
    Zv = Math.log,
    Jv = Math.LN2;

function qv(e) {
    return e >>>= 0, e === 0 ? 32 : 31 - (Zv(e) / Jv | 0) | 0
}
var Mi = 64,
    Oi = 4194304;

function Ar(e) {
    switch (e & -e) {
        case 1:
            return 1;
        case 2:
            return 2;
        case 4:
            return 4;
        case 8:
            return 8;
        case 16:
            return 16;
        case 32:
            return 32;
        case 64:
        case 128:
        case 256:
        case 512:
        case 1024:
        case 2048:
        case 4096:
        case 8192:
        case 16384:
        case 32768:
        case 65536:
        case 131072:
        case 262144:
        case 524288:
        case 1048576:
        case 2097152:
            return e & 4194240;
        case 4194304:
        case 8388608:
        case 16777216:
        case 33554432:
        case 67108864:
            return e & 130023424;
        case 134217728:
            return 134217728;
        case 268435456:
            return 268435456;
        case 536870912:
            return 536870912;
        case 1073741824:
            return 1073741824;
        default:
            return e
    }
}

function go(e, t) {
    var n = e.pendingLanes;
    if (n === 0) return 0;
    var r = 0,
        i = e.suspendedLanes,
        o = e.pingedLanes,
        s = n & 268435455;
    if (s !== 0) {
        var l = s & ~i;
        l !== 0 ? r = Ar(l) : (o &= s, o !== 0 && (r = Ar(o)))
    } else s = n & ~i, s !== 0 ? r = Ar(s) : o !== 0 && (r = Ar(o));
    if (r === 0) return 0;
    if (t !== 0 && t !== r && (t & i) === 0 && (i = r & -r, o = t & -t, i >= o || i === 16 && (o & 4194240) !== 0)) return t;
    if ((r & 4) !== 0 && (r |= n & 16), t = e.entangledLanes, t !== 0)
        for (e = e.entanglements, t &= r; 0 < t;) n = 31 - ot(t), i = 1 << n, r |= e[n], t &= ~i;
    return r
}

function eg(e, t) {
    switch (e) {
        case 1:
        case 2:
        case 4:
            return t + 250;
        case 8:
        case 16:
        case 32:
        case 64:
        case 128:
        case 256:
        case 512:
        case 1024:
        case 2048:
        case 4096:
        case 8192:
        case 16384:
        case 32768:
        case 65536:
        case 131072:
        case 262144:
        case 524288:
        case 1048576:
        case 2097152:
            return t + 5e3;
        case 4194304:
        case 8388608:
        case 16777216:
        case 33554432:
        case 67108864:
            return -1;
        case 134217728:
        case 268435456:
        case 536870912:
        case 1073741824:
            return -1;
        default:
            return -1
    }
}

function tg(e, t) {
    for (var n = e.suspendedLanes, r = e.pingedLanes, i = e.expirationTimes, o = e.pendingLanes; 0 < o;) {
        var s = 31 - ot(o),
            l = 1 << s,
            a = i[s];
        a === -1 ? ((l & n) === 0 || (l & r) !== 0) && (i[s] = eg(l, t)) : a <= t && (e.expiredLanes |= l), o &= ~l
    }
}

function Vl(e) {
    return e = e.pendingLanes & -1073741825, e !== 0 ? e : e & 1073741824 ? 1073741824 : 0
}

function rp() {
    var e = Mi;
    return Mi <<= 1, (Mi & 4194240) === 0 && (Mi = 64), e
}

function Vs(e) {
    for (var t = [], n = 0; 31 > n; n++) t.push(e);
    return t
}

function xi(e, t, n) {
    e.pendingLanes |= t, t !== 536870912 && (e.suspendedLanes = 0, e.pingedLanes = 0), e = e.eventTimes, t = 31 - ot(t), e[t] = n
}

function ng(e, t) {
    var n = e.pendingLanes & ~t;
    e.pendingLanes = t, e.suspendedLanes = 0, e.pingedLanes = 0, e.expiredLanes &= t, e.mutableReadLanes &= t, e.entangledLanes &= t, t = e.entanglements;
    var r = e.eventTimes;
    for (e = e.expirationTimes; 0 < n;) {
        var i = 31 - ot(n),
            o = 1 << i;
        t[i] = 0, r[i] = -1, e[i] = -1, n &= ~o
    }
}

function Ua(e, t) {
    var n = e.entangledLanes |= t;
    for (e = e.entanglements; n;) {
        var r = 31 - ot(n),
            i = 1 << r;
        i & t | e[r] & t && (e[r] |= t), n &= ~i
    }
}
var K = 0;

function ip(e) {
    return e &= -e, 1 < e ? 4 < e ? (e & 268435455) !== 0 ? 16 : 536870912 : 4 : 1
}
var op, $a, sp, lp, ap, Al = !1,
    Ii = [],
    Qt = null,
    Gt = null,
    Yt = null,
    ei = new Map,
    ti = new Map,
    Ut = [],
    rg = "mousedown mouseup touchcancel touchend touchstart auxclick dblclick pointercancel pointerdown pointerup dragend dragstart drop compositionend compositionstart keydown keypress keyup input textInput copy cut paste click change contextmenu reset submit".split(" ");

function hc(e, t) {
    switch (e) {
        case "focusin":
        case "focusout":
            Qt = null;
            break;
        case "dragenter":
        case "dragleave":
            Gt = null;
            break;
        case "mouseover":
        case "mouseout":
            Yt = null;
            break;
        case "pointerover":
        case "pointerout":
            ei.delete(t.pointerId);
            break;
        case "gotpointercapture":
        case "lostpointercapture":
            ti.delete(t.pointerId)
    }
}

function kr(e, t, n, r, i, o) {
    return e === null || e.nativeEvent !== o ? (e = {
        blockedOn: t,
        domEventName: n,
        eventSystemFlags: r,
        nativeEvent: o,
        targetContainers: [i]
    }, t !== null && (t = Ci(t), t !== null && $a(t)), e) : (e.eventSystemFlags |= r, t = e.targetContainers, i !== null && t.indexOf(i) === -1 && t.push(i), e)
}

function ig(e, t, n, r, i) {
    switch (t) {
        case "focusin":
            return Qt = kr(Qt, e, t, n, r, i), !0;
        case "dragenter":
            return Gt = kr(Gt, e, t, n, r, i), !0;
        case "mouseover":
            return Yt = kr(Yt, e, t, n, r, i), !0;
        case "pointerover":
            var o = i.pointerId;
            return ei.set(o, kr(ei.get(o) || null, e, t, n, r, i)), !0;
        case "gotpointercapture":
            return o = i.pointerId, ti.set(o, kr(ti.get(o) || null, e, t, n, r, i)), !0
    }
    return !1
}

function up(e) {
    var t = gn(e.target);
    if (t !== null) {
        var n = Rn(t);
        if (n !== null) {
            if (t = n.tag, t === 13) {
                if (t = Zd(n), t !== null) {
                    e.blockedOn = t, ap(e.priority, function() {
                        sp(n)
                    });
                    return
                }
            } else if (t === 3 && n.stateNode.current.memoizedState.isDehydrated) {
                e.blockedOn = n.tag === 3 ? n.stateNode.containerInfo : null;
                return
            }
        }
    }
    e.blockedOn = null
}

function eo(e) {
    if (e.blockedOn !== null) return !1;
    for (var t = e.targetContainers; 0 < t.length;) {
        var n = Ml(e.domEventName, e.eventSystemFlags, t[0], e.nativeEvent);
        if (n === null) {
            n = e.nativeEvent;
            var r = new n.constructor(n.type, n);
            Ll = r, n.target.dispatchEvent(r), Ll = null
        } else return t = Ci(n), t !== null && $a(t), e.blockedOn = n, !1;
        t.shift()
    }
    return !0
}

function mc(e, t, n) {
    eo(e) && n.delete(t)
}

function og() {
    Al = !1, Qt !== null && eo(Qt) && (Qt = null), Gt !== null && eo(Gt) && (Gt = null), Yt !== null && eo(Yt) && (Yt = null), ei.forEach(mc), ti.forEach(mc)
}

function Pr(e, t) {
    e.blockedOn === t && (e.blockedOn = null, Al || (Al = !0, $e.unstable_scheduleCallback($e.unstable_NormalPriority, og)))
}

function ni(e) {
    function t(i) {
        return Pr(i, e)
    }
    if (0 < Ii.length) {
        Pr(Ii[0], e);
        for (var n = 1; n < Ii.length; n++) {
            var r = Ii[n];
            r.blockedOn === e && (r.blockedOn = null)
        }
    }
    for (Qt !== null && Pr(Qt, e), Gt !== null && Pr(Gt, e), Yt !== null && Pr(Yt, e), ei.forEach(t), ti.forEach(t), n = 0; n < Ut.length; n++) r = Ut[n], r.blockedOn === e && (r.blockedOn = null);
    for (; 0 < Ut.length && (n = Ut[0], n.blockedOn === null);) up(n), n.blockedOn === null && Ut.shift()
}
var nr = Dt.ReactCurrentBatchConfig,
    yo = !0;

function sg(e, t, n, r) {
    var i = K,
        o = nr.transition;
    nr.transition = null;
    try {
        K = 1, ba(e, t, n, r)
    } finally {
        K = i, nr.transition = o
    }
}

function lg(e, t, n, r) {
    var i = K,
        o = nr.transition;
    nr.transition = null;
    try {
        K = 4, ba(e, t, n, r)
    } finally {
        K = i, nr.transition = o
    }
}

function ba(e, t, n, r) {
    if (yo) {
        var i = Ml(e, t, n, r);
        if (i === null) $s(e, t, r, wo, n), hc(e, r);
        else if (ig(i, e, t, n, r)) r.stopPropagation();
        else if (hc(e, r), t & 4 && -1 < rg.indexOf(e)) {
            for (; i !== null;) {
                var o = Ci(i);
                if (o !== null && op(o), o = Ml(e, t, n, r), o === null && $s(e, t, r, wo, n), o === i) break;
                i = o
            }
            i !== null && r.stopPropagation()
        } else $s(e, t, r, null, n)
    }
}
var wo = null;

function Ml(e, t, n, r) {
    if (wo = null, e = za(r), e = gn(e), e !== null)
        if (t = Rn(e), t === null) e = null;
        else if (n = t.tag, n === 13) {
        if (e = Zd(t), e !== null) return e;
        e = null
    } else if (n === 3) {
        if (t.stateNode.current.memoizedState.isDehydrated) return t.tag === 3 ? t.stateNode.containerInfo : null;
        e = null
    } else t !== e && (e = null);
    return wo = e, null
}

function cp(e) {
    switch (e) {
        case "cancel":
        case "click":
        case "close":
        case "contextmenu":
        case "copy":
        case "cut":
        case "auxclick":
        case "dblclick":
        case "dragend":
        case "dragstart":
        case "drop":
        case "focusin":
        case "focusout":
        case "input":
        case "invalid":
        case "keydown":
        case "keypress":
        case "keyup":
        case "mousedown":
        case "mouseup":
        case "paste":
        case "pause":
        case "play":
        case "pointercancel":
        case "pointerdown":
        case "pointerup":
        case "ratechange":
        case "reset":
        case "resize":
        case "seeked":
        case "submit":
        case "touchcancel":
        case "touchend":
        case "touchstart":
        case "volumechange":
        case "change":
        case "selectionchange":
        case "textInput":
        case "compositionstart":
        case "compositionend":
        case "compositionupdate":
        case "beforeblur":
        case "afterblur":
        case "beforeinput":
        case "blur":
        case "fullscreenchange":
        case "focus":
        case "hashchange":
        case "popstate":
        case "select":
        case "selectstart":
            return 1;
        case "drag":
        case "dragenter":
        case "dragexit":
        case "dragleave":
        case "dragover":
        case "mousemove":
        case "mouseout":
        case "mouseover":
        case "pointermove":
        case "pointerout":
        case "pointerover":
        case "scroll":
        case "toggle":
        case "touchmove":
        case "wheel":
        case "mouseenter":
        case "mouseleave":
        case "pointerenter":
        case "pointerleave":
            return 4;
        case "message":
            switch (Gv()) {
                case Ba:
                    return 1;
                case tp:
                    return 4;
                case vo:
                case Yv:
                    return 16;
                case np:
                    return 536870912;
                default:
                    return 16
            }
        default:
            return 16
    }
}
var bt = null,
    Ha = null,
    to = null;

function fp() {
    if (to) return to;
    var e, t = Ha,
        n = t.length,
        r, i = "value" in bt ? bt.value : bt.textContent,
        o = i.length;
    for (e = 0; e < n && t[e] === i[e]; e++);
    var s = n - e;
    for (r = 1; r <= s && t[n - r] === i[o - r]; r++);
    return to = i.slice(e, 1 < r ? 1 - r : void 0)
}

function no(e) {
    var t = e.keyCode;
    return "charCode" in e ? (e = e.charCode, e === 0 && t === 13 && (e = 13)) : e = t, e === 10 && (e = 13), 32 <= e || e === 13 ? e : 0
}

function Fi() {
    return !0
}

function vc() {
    return !1
}

function We(e) {
    function t(n, r, i, o, s) {
        this._reactName = n, this._targetInst = i, this.type = r, this.nativeEvent = o, this.target = s, this.currentTarget = null;
        for (var l in e) e.hasOwnProperty(l) && (n = e[l], this[l] = n ? n(o) : o[l]);
        return this.isDefaultPrevented = (o.defaultPrevented != null ? o.defaultPrevented : o.returnValue === !1) ? Fi : vc, this.isPropagationStopped = vc, this
    }
    return ie(t.prototype, {
        preventDefault: function() {
            this.defaultPrevented = !0;
            var n = this.nativeEvent;
            n && (n.preventDefault ? n.preventDefault() : typeof n.returnValue != "unknown" && (n.returnValue = !1), this.isDefaultPrevented = Fi)
        },
        stopPropagation: function() {
            var n = this.nativeEvent;
            n && (n.stopPropagation ? n.stopPropagation() : typeof n.cancelBubble != "unknown" && (n.cancelBubble = !0), this.isPropagationStopped = Fi)
        },
        persist: function() {},
        isPersistent: Fi
    }), t
}
var vr = {
        eventPhase: 0,
        bubbles: 0,
        cancelable: 0,
        timeStamp: function(e) {
            return e.timeStamp || Date.now()
        },
        defaultPrevented: 0,
        isTrusted: 0
    },
    Wa = We(vr),
    Si = ie({}, vr, {
        view: 0,
        detail: 0
    }),
    ag = We(Si),
    As, Ms, Er, es = ie({}, Si, {
        screenX: 0,
        screenY: 0,
        clientX: 0,
        clientY: 0,
        pageX: 0,
        pageY: 0,
        ctrlKey: 0,
        shiftKey: 0,
        altKey: 0,
        metaKey: 0,
        getModifierState: Ka,
        button: 0,
        buttons: 0,
        relatedTarget: function(e) {
            return e.relatedTarget === void 0 ? e.fromElement === e.srcElement ? e.toElement : e.fromElement : e.relatedTarget
        },
        movementX: function(e) {
            return "movementX" in e ? e.movementX : (e !== Er && (Er && e.type === "mousemove" ? (As = e.screenX - Er.screenX, Ms = e.screenY - Er.screenY) : Ms = As = 0, Er = e), As)
        },
        movementY: function(e) {
            return "movementY" in e ? e.movementY : Ms
        }
    }),
    gc = We(es),
    ug = ie({}, es, {
        dataTransfer: 0
    }),
    cg = We(ug),
    fg = ie({}, Si, {
        relatedTarget: 0
    }),
    Os = We(fg),
    dg = ie({}, vr, {
        animationName: 0,
        elapsedTime: 0,
        pseudoElement: 0
    }),
    pg = We(dg),
    hg = ie({}, vr, {
        clipboardData: function(e) {
            return "clipboardData" in e ? e.clipboardData : window.clipboardData
        }
    }),
    mg = We(hg),
    vg = ie({}, vr, {
        data: 0
    }),
    yc = We(vg),
    gg = {
        Esc: "Escape",
        Spacebar: " ",
        Left: "ArrowLeft",
        Up: "ArrowUp",
        Right: "ArrowRight",
        Down: "ArrowDown",
        Del: "Delete",
        Win: "OS",
        Menu: "ContextMenu",
        Apps: "ContextMenu",
        Scroll: "ScrollLock",
        MozPrintableKey: "Unidentified"
    },
    yg = {
        8: "Backspace",
        9: "Tab",
        12: "Clear",
        13: "Enter",
        16: "Shift",
        17: "Control",
        18: "Alt",
        19: "Pause",
        20: "CapsLock",
        27: "Escape",
        32: " ",
        33: "PageUp",
        34: "PageDown",
        35: "End",
        36: "Home",
        37: "ArrowLeft",
        38: "ArrowUp",
        39: "ArrowRight",
        40: "ArrowDown",
        45: "Insert",
        46: "Delete",
        112: "F1",
        113: "F2",
        114: "F3",
        115: "F4",
        116: "F5",
        117: "F6",
        118: "F7",
        119: "F8",
        120: "F9",
        121: "F10",
        122: "F11",
        123: "F12",
        144: "NumLock",
        145: "ScrollLock",
        224: "Meta"
    },
    wg = {
        Alt: "altKey",
        Control: "ctrlKey",
        Meta: "metaKey",
        Shift: "shiftKey"
    };

function xg(e) {
    var t = this.nativeEvent;
    return t.getModifierState ? t.getModifierState(e) : (e = wg[e]) ? !!t[e] : !1
}

function Ka() {
    return xg
}
var Sg = ie({}, Si, {
        key: function(e) {
            if (e.key) {
                var t = gg[e.key] || e.key;
                if (t !== "Unidentified") return t
            }
            return e.type === "keypress" ? (e = no(e), e === 13 ? "Enter" : String.fromCharCode(e)) : e.type === "keydown" || e.type === "keyup" ? yg[e.keyCode] || "Unidentified" : ""
        },
        code: 0,
        location: 0,
        ctrlKey: 0,
        shiftKey: 0,
        altKey: 0,
        metaKey: 0,
        repeat: 0,
        locale: 0,
        getModifierState: Ka,
        charCode: function(e) {
            return e.type === "keypress" ? no(e) : 0
        },
        keyCode: function(e) {
            return e.type === "keydown" || e.type === "keyup" ? e.keyCode : 0
        },
        which: function(e) {
            return e.type === "keypress" ? no(e) : e.type === "keydown" || e.type === "keyup" ? e.keyCode : 0
        }
    }),
    Cg = We(Sg),
    kg = ie({}, es, {
        pointerId: 0,
        width: 0,
        height: 0,
        pressure: 0,
        tangentialPressure: 0,
        tiltX: 0,
        tiltY: 0,
        twist: 0,
        pointerType: 0,
        isPrimary: 0
    }),
    wc = We(kg),
    Pg = ie({}, Si, {
        touches: 0,
        targetTouches: 0,
        changedTouches: 0,
        altKey: 0,
        metaKey: 0,
        ctrlKey: 0,
        shiftKey: 0,
        getModifierState: Ka
    }),
    Eg = We(Pg),
    Ng = ie({}, vr, {
        propertyName: 0,
        elapsedTime: 0,
        pseudoElement: 0
    }),
    Tg = We(Ng),
    Lg = ie({}, es, {
        deltaX: function(e) {
            return "deltaX" in e ? e.deltaX : "wheelDeltaX" in e ? -e.wheelDeltaX : 0
        },
        deltaY: function(e) {
            return "deltaY" in e ? e.deltaY : "wheelDeltaY" in e ? -e.wheelDeltaY : "wheelDelta" in e ? -e.wheelDelta : 0
        },
        deltaZ: 0,
        deltaMode: 0
    }),
    Rg = We(Lg),
    _g = [9, 13, 27, 32],
    Qa = Tt && "CompositionEvent" in window,
    jr = null;
Tt && "documentMode" in document && (jr = document.documentMode);
var Dg = Tt && "TextEvent" in window && !jr,
    dp = Tt && (!Qa || jr && 8 < jr && 11 >= jr),
    xc = String.fromCharCode(32),
    Sc = !1;

function pp(e, t) {
    switch (e) {
        case "keyup":
            return _g.indexOf(t.keyCode) !== -1;
        case "keydown":
            return t.keyCode !== 229;
        case "keypress":
        case "mousedown":
        case "focusout":
            return !0;
        default:
            return !1
    }
}

function hp(e) {
    return e = e.detail, typeof e == "object" && "data" in e ? e.data : null
}
var Bn = !1;

function Vg(e, t) {
    switch (e) {
        case "compositionend":
            return hp(t);
        case "keypress":
            return t.which !== 32 ? null : (Sc = !0, xc);
        case "textInput":
            return e = t.data, e === xc && Sc ? null : e;
        default:
            return null
    }
}

function Ag(e, t) {
    if (Bn) return e === "compositionend" || !Qa && pp(e, t) ? (e = fp(), to = Ha = bt = null, Bn = !1, e) : null;
    switch (e) {
        case "paste":
            return null;
        case "keypress":
            if (!(t.ctrlKey || t.altKey || t.metaKey) || t.ctrlKey && t.altKey) {
                if (t.char && 1 < t.char.length) return t.char;
                if (t.which) return String.fromCharCode(t.which)
            }
            return null;
        case "compositionend":
            return dp && t.locale !== "ko" ? null : t.data;
        default:
            return null
    }
}
var Mg = {
    color: !0,
    date: !0,
    datetime: !0,
    "datetime-local": !0,
    email: !0,
    month: !0,
    number: !0,
    password: !0,
    range: !0,
    search: !0,
    tel: !0,
    text: !0,
    time: !0,
    url: !0,
    week: !0
};

function Cc(e) {
    var t = e && e.nodeName && e.nodeName.toLowerCase();
    return t === "input" ? !!Mg[e.type] : t === "textarea"
}

function mp(e, t, n, r) {
    Kd(r), t = xo(t, "onChange"), 0 < t.length && (n = new Wa("onChange", "change", null, n, r), e.push({
        event: n,
        listeners: t
    }))
}
var zr = null,
    ri = null;

function Og(e) {
    Np(e, 0)
}

function ts(e) {
    var t = bn(e);
    if (zd(t)) return e
}

function Ig(e, t) {
    if (e === "change") return t
}
var vp = !1;
if (Tt) {
    var Is;
    if (Tt) {
        var Fs = "oninput" in document;
        if (!Fs) {
            var kc = document.createElement("div");
            kc.setAttribute("oninput", "return;"), Fs = typeof kc.oninput == "function"
        }
        Is = Fs
    } else Is = !1;
    vp = Is && (!document.documentMode || 9 < document.documentMode)
}

function Pc() {
    zr && (zr.detachEvent("onpropertychange", gp), ri = zr = null)
}

function gp(e) {
    if (e.propertyName === "value" && ts(ri)) {
        var t = [];
        mp(t, ri, e, za(e)), Xd(Og, t)
    }
}

function Fg(e, t, n) {
    e === "focusin" ? (Pc(), zr = t, ri = n, zr.attachEvent("onpropertychange", gp)) : e === "focusout" && Pc()
}

function jg(e) {
    if (e === "selectionchange" || e === "keyup" || e === "keydown") return ts(ri)
}

function zg(e, t) {
    if (e === "click") return ts(t)
}

function Bg(e, t) {
    if (e === "input" || e === "change") return ts(t)
}

function Ug(e, t) {
    return e === t && (e !== 0 || 1 / e === 1 / t) || e !== e && t !== t
}
var lt = typeof Object.is == "function" ? Object.is : Ug;

function ii(e, t) {
    if (lt(e, t)) return !0;
    if (typeof e != "object" || e === null || typeof t != "object" || t === null) return !1;
    var n = Object.keys(e),
        r = Object.keys(t);
    if (n.length !== r.length) return !1;
    for (r = 0; r < n.length; r++) {
        var i = n[r];
        if (!vl.call(t, i) || !lt(e[i], t[i])) return !1
    }
    return !0
}

function Ec(e) {
    for (; e && e.firstChild;) e = e.firstChild;
    return e
}

function Nc(e, t) {
    var n = Ec(e);
    e = 0;
    for (var r; n;) {
        if (n.nodeType === 3) {
            if (r = e + n.textContent.length, e <= t && r >= t) return {
                node: n,
                offset: t - e
            };
            e = r
        }
        e: {
            for (; n;) {
                if (n.nextSibling) {
                    n = n.nextSibling;
                    break e
                }
                n = n.parentNode
            }
            n = void 0
        }
        n = Ec(n)
    }
}

function yp(e, t) {
    return e && t ? e === t ? !0 : e && e.nodeType === 3 ? !1 : t && t.nodeType === 3 ? yp(e, t.parentNode) : "contains" in e ? e.contains(t) : e.compareDocumentPosition ? !!(e.compareDocumentPosition(t) & 16) : !1 : !1
}

function wp() {
    for (var e = window, t = po(); t instanceof e.HTMLIFrameElement;) {
        try {
            var n = typeof t.contentWindow.location.href == "string"
        } catch {
            n = !1
        }
        if (n) e = t.contentWindow;
        else break;
        t = po(e.document)
    }
    return t
}

function Ga(e) {
    var t = e && e.nodeName && e.nodeName.toLowerCase();
    return t && (t === "input" && (e.type === "text" || e.type === "search" || e.type === "tel" || e.type === "url" || e.type === "password") || t === "textarea" || e.contentEditable === "true")
}

function $g(e) {
    var t = wp(),
        n = e.focusedElem,
        r = e.selectionRange;
    if (t !== n && n && n.ownerDocument && yp(n.ownerDocument.documentElement, n)) {
        if (r !== null && Ga(n)) {
            if (t = r.start, e = r.end, e === void 0 && (e = t), "selectionStart" in n) n.selectionStart = t, n.selectionEnd = Math.min(e, n.value.length);
            else if (e = (t = n.ownerDocument || document) && t.defaultView || window, e.getSelection) {
                e = e.getSelection();
                var i = n.textContent.length,
                    o = Math.min(r.start, i);
                r = r.end === void 0 ? o : Math.min(r.end, i), !e.extend && o > r && (i = r, r = o, o = i), i = Nc(n, o);
                var s = Nc(n, r);
                i && s && (e.rangeCount !== 1 || e.anchorNode !== i.node || e.anchorOffset !== i.offset || e.focusNode !== s.node || e.focusOffset !== s.offset) && (t = t.createRange(), t.setStart(i.node, i.offset), e.removeAllRanges(), o > r ? (e.addRange(t), e.extend(s.node, s.offset)) : (t.setEnd(s.node, s.offset), e.addRange(t)))
            }
        }
        for (t = [], e = n; e = e.parentNode;) e.nodeType === 1 && t.push({
            element: e,
            left: e.scrollLeft,
            top: e.scrollTop
        });
        for (typeof n.focus == "function" && n.focus(), n = 0; n < t.length; n++) e = t[n], e.element.scrollLeft = e.left, e.element.scrollTop = e.top
    }
}
var bg = Tt && "documentMode" in document && 11 >= document.documentMode,
    Un = null,
    Ol = null,
    Br = null,
    Il = !1;

function Tc(e, t, n) {
    var r = n.window === n ? n.document : n.nodeType === 9 ? n : n.ownerDocument;
    Il || Un == null || Un !== po(r) || (r = Un, "selectionStart" in r && Ga(r) ? r = {
        start: r.selectionStart,
        end: r.selectionEnd
    } : (r = (r.ownerDocument && r.ownerDocument.defaultView || window).getSelection(), r = {
        anchorNode: r.anchorNode,
        anchorOffset: r.anchorOffset,
        focusNode: r.focusNode,
        focusOffset: r.focusOffset
    }), Br && ii(Br, r) || (Br = r, r = xo(Ol, "onSelect"), 0 < r.length && (t = new Wa("onSelect", "select", null, t, n), e.push({
        event: t,
        listeners: r
    }), t.target = Un)))
}

function ji(e, t) {
    var n = {};
    return n[e.toLowerCase()] = t.toLowerCase(), n["Webkit" + e] = "webkit" + t, n["Moz" + e] = "moz" + t, n
}
var $n = {
        animationend: ji("Animation", "AnimationEnd"),
        animationiteration: ji("Animation", "AnimationIteration"),
        animationstart: ji("Animation", "AnimationStart"),
        transitionend: ji("Transition", "TransitionEnd")
    },
    js = {},
    xp = {};
Tt && (xp = document.createElement("div").style, "AnimationEvent" in window || (delete $n.animationend.animation, delete $n.animationiteration.animation, delete $n.animationstart.animation), "TransitionEvent" in window || delete $n.transitionend.transition);

function ns(e) {
    if (js[e]) return js[e];
    if (!$n[e]) return e;
    var t = $n[e],
        n;
    for (n in t)
        if (t.hasOwnProperty(n) && n in xp) return js[e] = t[n];
    return e
}
var Sp = ns("animationend"),
    Cp = ns("animationiteration"),
    kp = ns("animationstart"),
    Pp = ns("transitionend"),
    Ep = new Map,
    Lc = "abort auxClick cancel canPlay canPlayThrough click close contextMenu copy cut drag dragEnd dragEnter dragExit dragLeave dragOver dragStart drop durationChange emptied encrypted ended error gotPointerCapture input invalid keyDown keyPress keyUp load loadedData loadedMetadata loadStart lostPointerCapture mouseDown mouseMove mouseOut mouseOver mouseUp paste pause play playing pointerCancel pointerDown pointerMove pointerOut pointerOver pointerUp progress rateChange reset resize seeked seeking stalled submit suspend timeUpdate touchCancel touchEnd touchStart volumeChange scroll toggle touchMove waiting wheel".split(" ");

function ln(e, t) {
    Ep.set(e, t), Ln(t, [e])
}
for (var zs = 0; zs < Lc.length; zs++) {
    var Bs = Lc[zs],
        Hg = Bs.toLowerCase(),
        Wg = Bs[0].toUpperCase() + Bs.slice(1);
    ln(Hg, "on" + Wg)
}
ln(Sp, "onAnimationEnd");
ln(Cp, "onAnimationIteration");
ln(kp, "onAnimationStart");
ln("dblclick", "onDoubleClick");
ln("focusin", "onFocus");
ln("focusout", "onBlur");
ln(Pp, "onTransitionEnd");
sr("onMouseEnter", ["mouseout", "mouseover"]);
sr("onMouseLeave", ["mouseout", "mouseover"]);
sr("onPointerEnter", ["pointerout", "pointerover"]);
sr("onPointerLeave", ["pointerout", "pointerover"]);
Ln("onChange", "change click focusin focusout input keydown keyup selectionchange".split(" "));
Ln("onSelect", "focusout contextmenu dragend focusin keydown keyup mousedown mouseup selectionchange".split(" "));
Ln("onBeforeInput", ["compositionend", "keypress", "textInput", "paste"]);
Ln("onCompositionEnd", "compositionend focusout keydown keypress keyup mousedown".split(" "));
Ln("onCompositionStart", "compositionstart focusout keydown keypress keyup mousedown".split(" "));
Ln("onCompositionUpdate", "compositionupdate focusout keydown keypress keyup mousedown".split(" "));
var Mr = "abort canplay canplaythrough durationchange emptied encrypted ended error loadeddata loadedmetadata loadstart pause play playing progress ratechange resize seeked seeking stalled suspend timeupdate volumechange waiting".split(" "),
    Kg = new Set("cancel close invalid load scroll toggle".split(" ").concat(Mr));

function Rc(e, t, n) {
    var r = e.type || "unknown-event";
    e.currentTarget = n, Hv(r, t, void 0, e), e.currentTarget = null
}

function Np(e, t) {
    t = (t & 4) !== 0;
    for (var n = 0; n < e.length; n++) {
        var r = e[n],
            i = r.event;
        r = r.listeners;
        e: {
            var o = void 0;
            if (t)
                for (var s = r.length - 1; 0 <= s; s--) {
                    var l = r[s],
                        a = l.instance,
                        u = l.currentTarget;
                    if (l = l.listener, a !== o && i.isPropagationStopped()) break e;
                    Rc(i, l, u), o = a
                } else
                    for (s = 0; s < r.length; s++) {
                        if (l = r[s], a = l.instance, u = l.currentTarget, l = l.listener, a !== o && i.isPropagationStopped()) break e;
                        Rc(i, l, u), o = a
                    }
        }
    }
    if (mo) throw e = Dl, mo = !1, Dl = null, e
}

function Y(e, t) {
    var n = t[Ul];
    n === void 0 && (n = t[Ul] = new Set);
    var r = e + "__bubble";
    n.has(r) || (Tp(t, e, 2, !1), n.add(r))
}

function Us(e, t, n) {
    var r = 0;
    t && (r |= 4), Tp(n, e, r, t)
}
var zi = "_reactListening" + Math.random().toString(36).slice(2);

function oi(e) {
    if (!e[zi]) {
        e[zi] = !0, Md.forEach(function(n) {
            n !== "selectionchange" && (Kg.has(n) || Us(n, !1, e), Us(n, !0, e))
        });
        var t = e.nodeType === 9 ? e : e.ownerDocument;
        t === null || t[zi] || (t[zi] = !0, Us("selectionchange", !1, t))
    }
}

function Tp(e, t, n, r) {
    switch (cp(t)) {
        case 1:
            var i = sg;
            break;
        case 4:
            i = lg;
            break;
        default:
            i = ba
    }
    n = i.bind(null, t, n, e), i = void 0, !_l || t !== "touchstart" && t !== "touchmove" && t !== "wheel" || (i = !0), r ? i !== void 0 ? e.addEventListener(t, n, {
        capture: !0,
        passive: i
    }) : e.addEventListener(t, n, !0) : i !== void 0 ? e.addEventListener(t, n, {
        passive: i
    }) : e.addEventListener(t, n, !1)
}

function $s(e, t, n, r, i) {
    var o = r;
    if ((t & 1) === 0 && (t & 2) === 0 && r !== null) e: for (;;) {
        if (r === null) return;
        var s = r.tag;
        if (s === 3 || s === 4) {
            var l = r.stateNode.containerInfo;
            if (l === i || l.nodeType === 8 && l.parentNode === i) break;
            if (s === 4)
                for (s = r.return; s !== null;) {
                    var a = s.tag;
                    if ((a === 3 || a === 4) && (a = s.stateNode.containerInfo, a === i || a.nodeType === 8 && a.parentNode === i)) return;
                    s = s.return
                }
            for (; l !== null;) {
                if (s = gn(l), s === null) return;
                if (a = s.tag, a === 5 || a === 6) {
                    r = o = s;
                    continue e
                }
                l = l.parentNode
            }
        }
        r = r.return
    }
    Xd(function() {
        var u = o,
            c = za(n),
            f = [];
        e: {
            var d = Ep.get(e);
            if (d !== void 0) {
                var m = Wa,
                    g = e;
                switch (e) {
                    case "keypress":
                        if (no(n) === 0) break e;
                    case "keydown":
                    case "keyup":
                        m = Cg;
                        break;
                    case "focusin":
                        g = "focus", m = Os;
                        break;
                    case "focusout":
                        g = "blur", m = Os;
                        break;
                    case "beforeblur":
                    case "afterblur":
                        m = Os;
                        break;
                    case "click":
                        if (n.button === 2) break e;
                    case "auxclick":
                    case "dblclick":
                    case "mousedown":
                    case "mousemove":
                    case "mouseup":
                    case "mouseout":
                    case "mouseover":
                    case "contextmenu":
                        m = gc;
                        break;
                    case "drag":
                    case "dragend":
                    case "dragenter":
                    case "dragexit":
                    case "dragleave":
                    case "dragover":
                    case "dragstart":
                    case "drop":
                        m = cg;
                        break;
                    case "touchcancel":
                    case "touchend":
                    case "touchmove":
                    case "touchstart":
                        m = Eg;
                        break;
                    case Sp:
                    case Cp:
                    case kp:
                        m = pg;
                        break;
                    case Pp:
                        m = Tg;
                        break;
                    case "scroll":
                        m = ag;
                        break;
                    case "wheel":
                        m = Rg;
                        break;
                    case "copy":
                    case "cut":
                    case "paste":
                        m = mg;
                        break;
                    case "gotpointercapture":
                    case "lostpointercapture":
                    case "pointercancel":
                    case "pointerdown":
                    case "pointermove":
                    case "pointerout":
                    case "pointerover":
                    case "pointerup":
                        m = wc
                }
                var w = (t & 4) !== 0,
                    k = !w && e === "scroll",
                    h = w ? d !== null ? d + "Capture" : null : d;
                w = [];
                for (var p = u, v; p !== null;) {
                    v = p;
                    var x = v.stateNode;
                    if (v.tag === 5 && x !== null && (v = x, h !== null && (x = qr(p, h), x != null && w.push(si(p, x, v)))), k) break;
                    p = p.return
                }
                0 < w.length && (d = new m(d, g, null, n, c), f.push({
                    event: d,
                    listeners: w
                }))
            }
        }
        if ((t & 7) === 0) {
            e: {
                if (d = e === "mouseover" || e === "pointerover", m = e === "mouseout" || e === "pointerout", d && n !== Ll && (g = n.relatedTarget || n.fromElement) && (gn(g) || g[Lt])) break e;
                if ((m || d) && (d = c.window === c ? c : (d = c.ownerDocument) ? d.defaultView || d.parentWindow : window, m ? (g = n.relatedTarget || n.toElement, m = u, g = g ? gn(g) : null, g !== null && (k = Rn(g), g !== k || g.tag !== 5 && g.tag !== 6) && (g = null)) : (m = null, g = u), m !== g)) {
                    if (w = gc, x = "onMouseLeave", h = "onMouseEnter", p = "mouse", (e === "pointerout" || e === "pointerover") && (w = wc, x = "onPointerLeave", h = "onPointerEnter", p = "pointer"), k = m == null ? d : bn(m), v = g == null ? d : bn(g), d = new w(x, p + "leave", m, n, c), d.target = k, d.relatedTarget = v, x = null, gn(c) === u && (w = new w(h, p + "enter", g, n, c), w.target = v, w.relatedTarget = k, x = w), k = x, m && g) t: {
                        for (w = m, h = g, p = 0, v = w; v; v = Fn(v)) p++;
                        for (v = 0, x = h; x; x = Fn(x)) v++;
                        for (; 0 < p - v;) w = Fn(w),
                        p--;
                        for (; 0 < v - p;) h = Fn(h),
                        v--;
                        for (; p--;) {
                            if (w === h || h !== null && w === h.alternate) break t;
                            w = Fn(w), h = Fn(h)
                        }
                        w = null
                    }
                    else w = null;
                    m !== null && _c(f, d, m, w, !1), g !== null && k !== null && _c(f, k, g, w, !0)
                }
            }
            e: {
                if (d = u ? bn(u) : window, m = d.nodeName && d.nodeName.toLowerCase(), m === "select" || m === "input" && d.type === "file") var P = Ig;
                else if (Cc(d))
                    if (vp) P = Bg;
                    else {
                        P = jg;
                        var T = Fg
                    }
                else(m = d.nodeName) && m.toLowerCase() === "input" && (d.type === "checkbox" || d.type === "radio") && (P = zg);
                if (P && (P = P(e, u))) {
                    mp(f, P, n, c);
                    break e
                }
                T && T(e, d, u),
                e === "focusout" && (T = d._wrapperState) && T.controlled && d.type === "number" && kl(d, "number", d.value)
            }
            switch (T = u ? bn(u) : window, e) {
                case "focusin":
                    (Cc(T) || T.contentEditable === "true") && (Un = T, Ol = u, Br = null);
                    break;
                case "focusout":
                    Br = Ol = Un = null;
                    break;
                case "mousedown":
                    Il = !0;
                    break;
                case "contextmenu":
                case "mouseup":
                case "dragend":
                    Il = !1, Tc(f, n, c);
                    break;
                case "selectionchange":
                    if (bg) break;
                case "keydown":
                case "keyup":
                    Tc(f, n, c)
            }
            var L;
            if (Qa) e: {
                switch (e) {
                    case "compositionstart":
                        var D = "onCompositionStart";
                        break e;
                    case "compositionend":
                        D = "onCompositionEnd";
                        break e;
                    case "compositionupdate":
                        D = "onCompositionUpdate";
                        break e
                }
                D = void 0
            }
            else Bn ? pp(e, n) && (D = "onCompositionEnd") : e === "keydown" && n.keyCode === 229 && (D = "onCompositionStart");D && (dp && n.locale !== "ko" && (Bn || D !== "onCompositionStart" ? D === "onCompositionEnd" && Bn && (L = fp()) : (bt = c, Ha = "value" in bt ? bt.value : bt.textContent, Bn = !0)), T = xo(u, D), 0 < T.length && (D = new yc(D, e, null, n, c), f.push({
                event: D,
                listeners: T
            }), L ? D.data = L : (L = hp(n), L !== null && (D.data = L)))),
            (L = Dg ? Vg(e, n) : Ag(e, n)) && (u = xo(u, "onBeforeInput"), 0 < u.length && (c = new yc("onBeforeInput", "beforeinput", null, n, c), f.push({
                event: c,
                listeners: u
            }), c.data = L))
        }
        Np(f, t)
    })
}

function si(e, t, n) {
    return {
        instance: e,
        listener: t,
        currentTarget: n
    }
}

function xo(e, t) {
    for (var n = t + "Capture", r = []; e !== null;) {
        var i = e,
            o = i.stateNode;
        i.tag === 5 && o !== null && (i = o, o = qr(e, n), o != null && r.unshift(si(e, o, i)), o = qr(e, t), o != null && r.push(si(e, o, i))), e = e.return
    }
    return r
}

function Fn(e) {
    if (e === null) return null;
    do e = e.return; while (e && e.tag !== 5);
    return e || null
}

function _c(e, t, n, r, i) {
    for (var o = t._reactName, s = []; n !== null && n !== r;) {
        var l = n,
            a = l.alternate,
            u = l.stateNode;
        if (a !== null && a === r) break;
        l.tag === 5 && u !== null && (l = u, i ? (a = qr(n, o), a != null && s.unshift(si(n, a, l))) : i || (a = qr(n, o), a != null && s.push(si(n, a, l)))), n = n.return
    }
    s.length !== 0 && e.push({
        event: t,
        listeners: s
    })
}
var Qg = /\r\n?/g,
    Gg = /\u0000|\uFFFD/g;

function Dc(e) {
    return (typeof e == "string" ? e : "" + e).replace(Qg, `
`).replace(Gg, "")
}

function Bi(e, t, n) {
    if (t = Dc(t), Dc(e) !== t && n) throw Error(N(425))
}

function So() {}
var Fl = null,
    jl = null;

function zl(e, t) {
    return e === "textarea" || e === "noscript" || typeof t.children == "string" || typeof t.children == "number" || typeof t.dangerouslySetInnerHTML == "object" && t.dangerouslySetInnerHTML !== null && t.dangerouslySetInnerHTML.__html != null
}
var Bl = typeof setTimeout == "function" ? setTimeout : void 0,
    Yg = typeof clearTimeout == "function" ? clearTimeout : void 0,
    Vc = typeof Promise == "function" ? Promise : void 0,
    Xg = typeof queueMicrotask == "function" ? queueMicrotask : typeof Vc != "undefined" ? function(e) {
        return Vc.resolve(null).then(e).catch(Zg)
    } : Bl;

function Zg(e) {
    setTimeout(function() {
        throw e
    })
}

function bs(e, t) {
    var n = t,
        r = 0;
    do {
        var i = n.nextSibling;
        if (e.removeChild(n), i && i.nodeType === 8)
            if (n = i.data, n === "/$") {
                if (r === 0) {
                    e.removeChild(i), ni(t);
                    return
                }
                r--
            } else n !== "$" && n !== "$?" && n !== "$!" || r++;
        n = i
    } while (n);
    ni(t)
}

function Xt(e) {
    for (; e != null; e = e.nextSibling) {
        var t = e.nodeType;
        if (t === 1 || t === 3) break;
        if (t === 8) {
            if (t = e.data, t === "$" || t === "$!" || t === "$?") break;
            if (t === "/$") return null
        }
    }
    return e
}

function Ac(e) {
    e = e.previousSibling;
    for (var t = 0; e;) {
        if (e.nodeType === 8) {
            var n = e.data;
            if (n === "$" || n === "$!" || n === "$?") {
                if (t === 0) return e;
                t--
            } else n === "/$" && t++
        }
        e = e.previousSibling
    }
    return null
}
var gr = Math.random().toString(36).slice(2),
    dt = "__reactFiber$" + gr,
    li = "__reactProps$" + gr,
    Lt = "__reactContainer$" + gr,
    Ul = "__reactEvents$" + gr,
    Jg = "__reactListeners$" + gr,
    qg = "__reactHandles$" + gr;

function gn(e) {
    var t = e[dt];
    if (t) return t;
    for (var n = e.parentNode; n;) {
        if (t = n[Lt] || n[dt]) {
            if (n = t.alternate, t.child !== null || n !== null && n.child !== null)
                for (e = Ac(e); e !== null;) {
                    if (n = e[dt]) return n;
                    e = Ac(e)
                }
            return t
        }
        e = n, n = e.parentNode
    }
    return null
}

function Ci(e) {
    return e = e[dt] || e[Lt], !e || e.tag !== 5 && e.tag !== 6 && e.tag !== 13 && e.tag !== 3 ? null : e
}

function bn(e) {
    if (e.tag === 5 || e.tag === 6) return e.stateNode;
    throw Error(N(33))
}

function rs(e) {
    return e[li] || null
}
var $l = [],
    Hn = -1;

function an(e) {
    return {
        current: e
    }
}

function X(e) {
    0 > Hn || (e.current = $l[Hn], $l[Hn] = null, Hn--)
}

function G(e, t) {
    Hn++, $l[Hn] = e.current, e.current = t
}
var rn = {},
    Pe = an(rn),
    Oe = an(!1),
    kn = rn;

function lr(e, t) {
    var n = e.type.contextTypes;
    if (!n) return rn;
    var r = e.stateNode;
    if (r && r.__reactInternalMemoizedUnmaskedChildContext === t) return r.__reactInternalMemoizedMaskedChildContext;
    var i = {},
        o;
    for (o in n) i[o] = t[o];
    return r && (e = e.stateNode, e.__reactInternalMemoizedUnmaskedChildContext = t, e.__reactInternalMemoizedMaskedChildContext = i), i
}

function Ie(e) {
    return e = e.childContextTypes, e != null
}

function Co() {
    X(Oe), X(Pe)
}

function Mc(e, t, n) {
    if (Pe.current !== rn) throw Error(N(168));
    G(Pe, t), G(Oe, n)
}

function Lp(e, t, n) {
    var r = e.stateNode;
    if (t = t.childContextTypes, typeof r.getChildContext != "function") return n;
    r = r.getChildContext();
    for (var i in r)
        if (!(i in t)) throw Error(N(108, Fv(e) || "Unknown", i));
    return ie({}, n, r)
}

function ko(e) {
    return e = (e = e.stateNode) && e.__reactInternalMemoizedMergedChildContext || rn, kn = Pe.current, G(Pe, e), G(Oe, Oe.current), !0
}

function Oc(e, t, n) {
    var r = e.stateNode;
    if (!r) throw Error(N(169));
    n ? (e = Lp(e, t, kn), r.__reactInternalMemoizedMergedChildContext = e, X(Oe), X(Pe), G(Pe, e)) : X(Oe), G(Oe, n)
}
var St = null,
    is = !1,
    Hs = !1;

function Rp(e) {
    St === null ? St = [e] : St.push(e)
}

function e0(e) {
    is = !0, Rp(e)
}

function un() {
    if (!Hs && St !== null) {
        Hs = !0;
        var e = 0,
            t = K;
        try {
            var n = St;
            for (K = 1; e < n.length; e++) {
                var r = n[e];
                do r = r(!0); while (r !== null)
            }
            St = null, is = !1
        } catch (i) {
            throw St !== null && (St = St.slice(e + 1)), ep(Ba, un), i
        } finally {
            K = t, Hs = !1
        }
    }
    return null
}
var Wn = [],
    Kn = 0,
    Po = null,
    Eo = 0,
    Qe = [],
    Ge = 0,
    Pn = null,
    kt = 1,
    Pt = "";

function hn(e, t) {
    Wn[Kn++] = Eo, Wn[Kn++] = Po, Po = e, Eo = t
}

function _p(e, t, n) {
    Qe[Ge++] = kt, Qe[Ge++] = Pt, Qe[Ge++] = Pn, Pn = e;
    var r = kt;
    e = Pt;
    var i = 32 - ot(r) - 1;
    r &= ~(1 << i), n += 1;
    var o = 32 - ot(t) + i;
    if (30 < o) {
        var s = i - i % 5;
        o = (r & (1 << s) - 1).toString(32), r >>= s, i -= s, kt = 1 << 32 - ot(t) + i | n << i | r, Pt = o + e
    } else kt = 1 << o | n << i | r, Pt = e
}

function Ya(e) {
    e.return !== null && (hn(e, 1), _p(e, 1, 0))
}

function Xa(e) {
    for (; e === Po;) Po = Wn[--Kn], Wn[Kn] = null, Eo = Wn[--Kn], Wn[Kn] = null;
    for (; e === Pn;) Pn = Qe[--Ge], Qe[Ge] = null, Pt = Qe[--Ge], Qe[Ge] = null, kt = Qe[--Ge], Qe[Ge] = null
}
var Be = null,
    ze = null,
    q = !1,
    it = null;

function Dp(e, t) {
    var n = Ye(5, null, null, 0);
    n.elementType = "DELETED", n.stateNode = t, n.return = e, t = e.deletions, t === null ? (e.deletions = [n], e.flags |= 16) : t.push(n)
}

function Ic(e, t) {
    switch (e.tag) {
        case 5:
            var n = e.type;
            return t = t.nodeType !== 1 || n.toLowerCase() !== t.nodeName.toLowerCase() ? null : t, t !== null ? (e.stateNode = t, Be = e, ze = Xt(t.firstChild), !0) : !1;
        case 6:
            return t = e.pendingProps === "" || t.nodeType !== 3 ? null : t, t !== null ? (e.stateNode = t, Be = e, ze = null, !0) : !1;
        case 13:
            return t = t.nodeType !== 8 ? null : t, t !== null ? (n = Pn !== null ? {
                id: kt,
                overflow: Pt
            } : null, e.memoizedState = {
                dehydrated: t,
                treeContext: n,
                retryLane: 1073741824
            }, n = Ye(18, null, null, 0), n.stateNode = t, n.return = e, e.child = n, Be = e, ze = null, !0) : !1;
        default:
            return !1
    }
}

function bl(e) {
    return (e.mode & 1) !== 0 && (e.flags & 128) === 0
}

function Hl(e) {
    if (q) {
        var t = ze;
        if (t) {
            var n = t;
            if (!Ic(e, t)) {
                if (bl(e)) throw Error(N(418));
                t = Xt(n.nextSibling);
                var r = Be;
                t && Ic(e, t) ? Dp(r, n) : (e.flags = e.flags & -4097 | 2, q = !1, Be = e)
            }
        } else {
            if (bl(e)) throw Error(N(418));
            e.flags = e.flags & -4097 | 2, q = !1, Be = e
        }
    }
}

function Fc(e) {
    for (e = e.return; e !== null && e.tag !== 5 && e.tag !== 3 && e.tag !== 13;) e = e.return;
    Be = e
}

function Ui(e) {
    if (e !== Be) return !1;
    if (!q) return Fc(e), q = !0, !1;
    var t;
    if ((t = e.tag !== 3) && !(t = e.tag !== 5) && (t = e.type, t = t !== "head" && t !== "body" && !zl(e.type, e.memoizedProps)), t && (t = ze)) {
        if (bl(e)) throw Vp(), Error(N(418));
        for (; t;) Dp(e, t), t = Xt(t.nextSibling)
    }
    if (Fc(e), e.tag === 13) {
        if (e = e.memoizedState, e = e !== null ? e.dehydrated : null, !e) throw Error(N(317));
        e: {
            for (e = e.nextSibling, t = 0; e;) {
                if (e.nodeType === 8) {
                    var n = e.data;
                    if (n === "/$") {
                        if (t === 0) {
                            ze = Xt(e.nextSibling);
                            break e
                        }
                        t--
                    } else n !== "$" && n !== "$!" && n !== "$?" || t++
                }
                e = e.nextSibling
            }
            ze = null
        }
    } else ze = Be ? Xt(e.stateNode.nextSibling) : null;
    return !0
}

function Vp() {
    for (var e = ze; e;) e = Xt(e.nextSibling)
}

function ar() {
    ze = Be = null, q = !1
}

function Za(e) {
    it === null ? it = [e] : it.push(e)
}
var t0 = Dt.ReactCurrentBatchConfig;

function nt(e, t) {
    if (e && e.defaultProps) {
        t = ie({}, t), e = e.defaultProps;
        for (var n in e) t[n] === void 0 && (t[n] = e[n]);
        return t
    }
    return t
}
var No = an(null),
    To = null,
    Qn = null,
    Ja = null;

function qa() {
    Ja = Qn = To = null
}

function eu(e) {
    var t = No.current;
    X(No), e._currentValue = t
}

function Wl(e, t, n) {
    for (; e !== null;) {
        var r = e.alternate;
        if ((e.childLanes & t) !== t ? (e.childLanes |= t, r !== null && (r.childLanes |= t)) : r !== null && (r.childLanes & t) !== t && (r.childLanes |= t), e === n) break;
        e = e.return
    }
}

function rr(e, t) {
    To = e, Ja = Qn = null, e = e.dependencies, e !== null && e.firstContext !== null && ((e.lanes & t) !== 0 && (Me = !0), e.firstContext = null)
}

function Ze(e) {
    var t = e._currentValue;
    if (Ja !== e)
        if (e = {
                context: e,
                memoizedValue: t,
                next: null
            }, Qn === null) {
            if (To === null) throw Error(N(308));
            Qn = e, To.dependencies = {
                lanes: 0,
                firstContext: e
            }
        } else Qn = Qn.next = e;
    return t
}
var yn = null;

function tu(e) {
    yn === null ? yn = [e] : yn.push(e)
}

function Ap(e, t, n, r) {
    var i = t.interleaved;
    return i === null ? (n.next = n, tu(t)) : (n.next = i.next, i.next = n), t.interleaved = n, Rt(e, r)
}

function Rt(e, t) {
    e.lanes |= t;
    var n = e.alternate;
    for (n !== null && (n.lanes |= t), n = e, e = e.return; e !== null;) e.childLanes |= t, n = e.alternate, n !== null && (n.childLanes |= t), n = e, e = e.return;
    return n.tag === 3 ? n.stateNode : null
}
var zt = !1;

function nu(e) {
    e.updateQueue = {
        baseState: e.memoizedState,
        firstBaseUpdate: null,
        lastBaseUpdate: null,
        shared: {
            pending: null,
            interleaved: null,
            lanes: 0
        },
        effects: null
    }
}

function Mp(e, t) {
    e = e.updateQueue, t.updateQueue === e && (t.updateQueue = {
        baseState: e.baseState,
        firstBaseUpdate: e.firstBaseUpdate,
        lastBaseUpdate: e.lastBaseUpdate,
        shared: e.shared,
        effects: e.effects
    })
}

function Et(e, t) {
    return {
        eventTime: e,
        lane: t,
        tag: 0,
        payload: null,
        callback: null,
        next: null
    }
}

function Zt(e, t, n) {
    var r = e.updateQueue;
    if (r === null) return null;
    if (r = r.shared, (W & 2) !== 0) {
        var i = r.pending;
        return i === null ? t.next = t : (t.next = i.next, i.next = t), r.pending = t, Rt(e, n)
    }
    return i = r.interleaved, i === null ? (t.next = t, tu(r)) : (t.next = i.next, i.next = t), r.interleaved = t, Rt(e, n)
}

function ro(e, t, n) {
    if (t = t.updateQueue, t !== null && (t = t.shared, (n & 4194240) !== 0)) {
        var r = t.lanes;
        r &= e.pendingLanes, n |= r, t.lanes = n, Ua(e, n)
    }
}

function jc(e, t) {
    var n = e.updateQueue,
        r = e.alternate;
    if (r !== null && (r = r.updateQueue, n === r)) {
        var i = null,
            o = null;
        if (n = n.firstBaseUpdate, n !== null) {
            do {
                var s = {
                    eventTime: n.eventTime,
                    lane: n.lane,
                    tag: n.tag,
                    payload: n.payload,
                    callback: n.callback,
                    next: null
                };
                o === null ? i = o = s : o = o.next = s, n = n.next
            } while (n !== null);
            o === null ? i = o = t : o = o.next = t
        } else i = o = t;
        n = {
            baseState: r.baseState,
            firstBaseUpdate: i,
            lastBaseUpdate: o,
            shared: r.shared,
            effects: r.effects
        }, e.updateQueue = n;
        return
    }
    e = n.lastBaseUpdate, e === null ? n.firstBaseUpdate = t : e.next = t, n.lastBaseUpdate = t
}

function Lo(e, t, n, r) {
    var i = e.updateQueue;
    zt = !1;
    var o = i.firstBaseUpdate,
        s = i.lastBaseUpdate,
        l = i.shared.pending;
    if (l !== null) {
        i.shared.pending = null;
        var a = l,
            u = a.next;
        a.next = null, s === null ? o = u : s.next = u, s = a;
        var c = e.alternate;
        c !== null && (c = c.updateQueue, l = c.lastBaseUpdate, l !== s && (l === null ? c.firstBaseUpdate = u : l.next = u, c.lastBaseUpdate = a))
    }
    if (o !== null) {
        var f = i.baseState;
        s = 0, c = u = a = null, l = o;
        do {
            var d = l.lane,
                m = l.eventTime;
            if ((r & d) === d) {
                c !== null && (c = c.next = {
                    eventTime: m,
                    lane: 0,
                    tag: l.tag,
                    payload: l.payload,
                    callback: l.callback,
                    next: null
                });
                e: {
                    var g = e,
                        w = l;
                    switch (d = t, m = n, w.tag) {
                        case 1:
                            if (g = w.payload, typeof g == "function") {
                                f = g.call(m, f, d);
                                break e
                            }
                            f = g;
                            break e;
                        case 3:
                            g.flags = g.flags & -65537 | 128;
                        case 0:
                            if (g = w.payload, d = typeof g == "function" ? g.call(m, f, d) : g, d == null) break e;
                            f = ie({}, f, d);
                            break e;
                        case 2:
                            zt = !0
                    }
                }
                l.callback !== null && l.lane !== 0 && (e.flags |= 64, d = i.effects, d === null ? i.effects = [l] : d.push(l))
            } else m = {
                eventTime: m,
                lane: d,
                tag: l.tag,
                payload: l.payload,
                callback: l.callback,
                next: null
            }, c === null ? (u = c = m, a = f) : c = c.next = m, s |= d;
            if (l = l.next, l === null) {
                if (l = i.shared.pending, l === null) break;
                d = l, l = d.next, d.next = null, i.lastBaseUpdate = d, i.shared.pending = null
            }
        } while (1);
        if (c === null && (a = f), i.baseState = a, i.firstBaseUpdate = u, i.lastBaseUpdate = c, t = i.shared.interleaved, t !== null) {
            i = t;
            do s |= i.lane, i = i.next; while (i !== t)
        } else o === null && (i.shared.lanes = 0);
        Nn |= s, e.lanes = s, e.memoizedState = f
    }
}

function zc(e, t, n) {
    if (e = t.effects, t.effects = null, e !== null)
        for (t = 0; t < e.length; t++) {
            var r = e[t],
                i = r.callback;
            if (i !== null) {
                if (r.callback = null, r = n, typeof i != "function") throw Error(N(191, i));
                i.call(r)
            }
        }
}
var Op = new Ad.Component().refs;

function Kl(e, t, n, r) {
    t = e.memoizedState, n = n(r, t), n = n == null ? t : ie({}, t, n), e.memoizedState = n, e.lanes === 0 && (e.updateQueue.baseState = n)
}
var os = {
    isMounted: function(e) {
        return (e = e._reactInternals) ? Rn(e) === e : !1
    },
    enqueueSetState: function(e, t, n) {
        e = e._reactInternals;
        var r = _e(),
            i = qt(e),
            o = Et(r, i);
        o.payload = t, n != null && (o.callback = n), t = Zt(e, o, i), t !== null && (st(t, e, i, r), ro(t, e, i))
    },
    enqueueReplaceState: function(e, t, n) {
        e = e._reactInternals;
        var r = _e(),
            i = qt(e),
            o = Et(r, i);
        o.tag = 1, o.payload = t, n != null && (o.callback = n), t = Zt(e, o, i), t !== null && (st(t, e, i, r), ro(t, e, i))
    },
    enqueueForceUpdate: function(e, t) {
        e = e._reactInternals;
        var n = _e(),
            r = qt(e),
            i = Et(n, r);
        i.tag = 2, t != null && (i.callback = t), t = Zt(e, i, r), t !== null && (st(t, e, r, n), ro(t, e, r))
    }
};

function Bc(e, t, n, r, i, o, s) {
    return e = e.stateNode, typeof e.shouldComponentUpdate == "function" ? e.shouldComponentUpdate(r, o, s) : t.prototype && t.prototype.isPureReactComponent ? !ii(n, r) || !ii(i, o) : !0
}

function Ip(e, t, n) {
    var r = !1,
        i = rn,
        o = t.contextType;
    return typeof o == "object" && o !== null ? o = Ze(o) : (i = Ie(t) ? kn : Pe.current, r = t.contextTypes, o = (r = r != null) ? lr(e, i) : rn), t = new t(n, o), e.memoizedState = t.state !== null && t.state !== void 0 ? t.state : null, t.updater = os, e.stateNode = t, t._reactInternals = e, r && (e = e.stateNode, e.__reactInternalMemoizedUnmaskedChildContext = i, e.__reactInternalMemoizedMaskedChildContext = o), t
}

function Uc(e, t, n, r) {
    e = t.state, typeof t.componentWillReceiveProps == "function" && t.componentWillReceiveProps(n, r), typeof t.UNSAFE_componentWillReceiveProps == "function" && t.UNSAFE_componentWillReceiveProps(n, r), t.state !== e && os.enqueueReplaceState(t, t.state, null)
}

function Ql(e, t, n, r) {
    var i = e.stateNode;
    i.props = n, i.state = e.memoizedState, i.refs = Op, nu(e);
    var o = t.contextType;
    typeof o == "object" && o !== null ? i.context = Ze(o) : (o = Ie(t) ? kn : Pe.current, i.context = lr(e, o)), i.state = e.memoizedState, o = t.getDerivedStateFromProps, typeof o == "function" && (Kl(e, t, o, n), i.state = e.memoizedState), typeof t.getDerivedStateFromProps == "function" || typeof i.getSnapshotBeforeUpdate == "function" || typeof i.UNSAFE_componentWillMount != "function" && typeof i.componentWillMount != "function" || (t = i.state, typeof i.componentWillMount == "function" && i.componentWillMount(), typeof i.UNSAFE_componentWillMount == "function" && i.UNSAFE_componentWillMount(), t !== i.state && os.enqueueReplaceState(i, i.state, null), Lo(e, n, i, r), i.state = e.memoizedState), typeof i.componentDidMount == "function" && (e.flags |= 4194308)
}

function Nr(e, t, n) {
    if (e = n.ref, e !== null && typeof e != "function" && typeof e != "object") {
        if (n._owner) {
            if (n = n._owner, n) {
                if (n.tag !== 1) throw Error(N(309));
                var r = n.stateNode
            }
            if (!r) throw Error(N(147, e));
            var i = r,
                o = "" + e;
            return t !== null && t.ref !== null && typeof t.ref == "function" && t.ref._stringRef === o ? t.ref : (t = function(s) {
                var l = i.refs;
                l === Op && (l = i.refs = {}), s === null ? delete l[o] : l[o] = s
            }, t._stringRef = o, t)
        }
        if (typeof e != "string") throw Error(N(284));
        if (!n._owner) throw Error(N(290, e))
    }
    return e
}

function $i(e, t) {
    throw e = Object.prototype.toString.call(t), Error(N(31, e === "[object Object]" ? "object with keys {" + Object.keys(t).join(", ") + "}" : e))
}

function $c(e) {
    var t = e._init;
    return t(e._payload)
}

function Fp(e) {
    function t(h, p) {
        if (e) {
            var v = h.deletions;
            v === null ? (h.deletions = [p], h.flags |= 16) : v.push(p)
        }
    }

    function n(h, p) {
        if (!e) return null;
        for (; p !== null;) t(h, p), p = p.sibling;
        return null
    }

    function r(h, p) {
        for (h = new Map; p !== null;) p.key !== null ? h.set(p.key, p) : h.set(p.index, p), p = p.sibling;
        return h
    }

    function i(h, p) {
        return h = en(h, p), h.index = 0, h.sibling = null, h
    }

    function o(h, p, v) {
        return h.index = v, e ? (v = h.alternate, v !== null ? (v = v.index, v < p ? (h.flags |= 2, p) : v) : (h.flags |= 2, p)) : (h.flags |= 1048576, p)
    }

    function s(h) {
        return e && h.alternate === null && (h.flags |= 2), h
    }

    function l(h, p, v, x) {
        return p === null || p.tag !== 6 ? (p = Zs(v, h.mode, x), p.return = h, p) : (p = i(p, v), p.return = h, p)
    }

    function a(h, p, v, x) {
        var P = v.type;
        return P === zn ? c(h, p, v.props.children, x, v.key) : p !== null && (p.elementType === P || typeof P == "object" && P !== null && P.$$typeof === jt && $c(P) === p.type) ? (x = i(p, v.props), x.ref = Nr(h, p, v), x.return = h, x) : (x = uo(v.type, v.key, v.props, null, h.mode, x), x.ref = Nr(h, p, v), x.return = h, x)
    }

    function u(h, p, v, x) {
        return p === null || p.tag !== 4 || p.stateNode.containerInfo !== v.containerInfo || p.stateNode.implementation !== v.implementation ? (p = Js(v, h.mode, x), p.return = h, p) : (p = i(p, v.children || []), p.return = h, p)
    }

    function c(h, p, v, x, P) {
        return p === null || p.tag !== 7 ? (p = Cn(v, h.mode, x, P), p.return = h, p) : (p = i(p, v), p.return = h, p)
    }

    function f(h, p, v) {
        if (typeof p == "string" && p !== "" || typeof p == "number") return p = Zs("" + p, h.mode, v), p.return = h, p;
        if (typeof p == "object" && p !== null) {
            switch (p.$$typeof) {
                case Di:
                    return v = uo(p.type, p.key, p.props, null, h.mode, v), v.ref = Nr(h, null, p), v.return = h, v;
                case jn:
                    return p = Js(p, h.mode, v), p.return = h, p;
                case jt:
                    var x = p._init;
                    return f(h, x(p._payload), v)
            }
            if (Vr(p) || Sr(p)) return p = Cn(p, h.mode, v, null), p.return = h, p;
            $i(h, p)
        }
        return null
    }

    function d(h, p, v, x) {
        var P = p !== null ? p.key : null;
        if (typeof v == "string" && v !== "" || typeof v == "number") return P !== null ? null : l(h, p, "" + v, x);
        if (typeof v == "object" && v !== null) {
            switch (v.$$typeof) {
                case Di:
                    return v.key === P ? a(h, p, v, x) : null;
                case jn:
                    return v.key === P ? u(h, p, v, x) : null;
                case jt:
                    return P = v._init, d(h, p, P(v._payload), x)
            }
            if (Vr(v) || Sr(v)) return P !== null ? null : c(h, p, v, x, null);
            $i(h, v)
        }
        return null
    }

    function m(h, p, v, x, P) {
        if (typeof x == "string" && x !== "" || typeof x == "number") return h = h.get(v) || null, l(p, h, "" + x, P);
        if (typeof x == "object" && x !== null) {
            switch (x.$$typeof) {
                case Di:
                    return h = h.get(x.key === null ? v : x.key) || null, a(p, h, x, P);
                case jn:
                    return h = h.get(x.key === null ? v : x.key) || null, u(p, h, x, P);
                case jt:
                    var T = x._init;
                    return m(h, p, v, T(x._payload), P)
            }
            if (Vr(x) || Sr(x)) return h = h.get(v) || null, c(p, h, x, P, null);
            $i(p, x)
        }
        return null
    }

    function g(h, p, v, x) {
        for (var P = null, T = null, L = p, D = p = 0, B = null; L !== null && D < v.length; D++) {
            L.index > D ? (B = L, L = null) : B = L.sibling;
            var I = d(h, L, v[D], x);
            if (I === null) {
                L === null && (L = B);
                break
            }
            e && L && I.alternate === null && t(h, L), p = o(I, p, D), T === null ? P = I : T.sibling = I, T = I, L = B
        }
        if (D === v.length) return n(h, L), q && hn(h, D), P;
        if (L === null) {
            for (; D < v.length; D++) L = f(h, v[D], x), L !== null && (p = o(L, p, D), T === null ? P = L : T.sibling = L, T = L);
            return q && hn(h, D), P
        }
        for (L = r(h, L); D < v.length; D++) B = m(L, h, D, v[D], x), B !== null && (e && B.alternate !== null && L.delete(B.key === null ? D : B.key), p = o(B, p, D), T === null ? P = B : T.sibling = B, T = B);
        return e && L.forEach(function(ee) {
            return t(h, ee)
        }), q && hn(h, D), P
    }

    function w(h, p, v, x) {
        var P = Sr(v);
        if (typeof P != "function") throw Error(N(150));
        if (v = P.call(v), v == null) throw Error(N(151));
        for (var T = P = null, L = p, D = p = 0, B = null, I = v.next(); L !== null && !I.done; D++, I = v.next()) {
            L.index > D ? (B = L, L = null) : B = L.sibling;
            var ee = d(h, L, I.value, x);
            if (ee === null) {
                L === null && (L = B);
                break
            }
            e && L && ee.alternate === null && t(h, L), p = o(ee, p, D), T === null ? P = ee : T.sibling = ee, T = ee, L = B
        }
        if (I.done) return n(h, L), q && hn(h, D), P;
        if (L === null) {
            for (; !I.done; D++, I = v.next()) I = f(h, I.value, x), I !== null && (p = o(I, p, D), T === null ? P = I : T.sibling = I, T = I);
            return q && hn(h, D), P
        }
        for (L = r(h, L); !I.done; D++, I = v.next()) I = m(L, h, D, I.value, x), I !== null && (e && I.alternate !== null && L.delete(I.key === null ? D : I.key), p = o(I, p, D), T === null ? P = I : T.sibling = I, T = I);
        return e && L.forEach(function(M) {
            return t(h, M)
        }), q && hn(h, D), P
    }

    function k(h, p, v, x) {
        if (typeof v == "object" && v !== null && v.type === zn && v.key === null && (v = v.props.children), typeof v == "object" && v !== null) {
            switch (v.$$typeof) {
                case Di:
                    e: {
                        for (var P = v.key, T = p; T !== null;) {
                            if (T.key === P) {
                                if (P = v.type, P === zn) {
                                    if (T.tag === 7) {
                                        n(h, T.sibling), p = i(T, v.props.children), p.return = h, h = p;
                                        break e
                                    }
                                } else if (T.elementType === P || typeof P == "object" && P !== null && P.$$typeof === jt && $c(P) === T.type) {
                                    n(h, T.sibling), p = i(T, v.props), p.ref = Nr(h, T, v), p.return = h, h = p;
                                    break e
                                }
                                n(h, T);
                                break
                            } else t(h, T);
                            T = T.sibling
                        }
                        v.type === zn ? (p = Cn(v.props.children, h.mode, x, v.key), p.return = h, h = p) : (x = uo(v.type, v.key, v.props, null, h.mode, x), x.ref = Nr(h, p, v), x.return = h, h = x)
                    }
                    return s(h);
                case jn:
                    e: {
                        for (T = v.key; p !== null;) {
                            if (p.key === T)
                                if (p.tag === 4 && p.stateNode.containerInfo === v.containerInfo && p.stateNode.implementation === v.implementation) {
                                    n(h, p.sibling), p = i(p, v.children || []), p.return = h, h = p;
                                    break e
                                } else {
                                    n(h, p);
                                    break
                                }
                            else t(h, p);
                            p = p.sibling
                        }
                        p = Js(v, h.mode, x),
                        p.return = h,
                        h = p
                    }
                    return s(h);
                case jt:
                    return T = v._init, k(h, p, T(v._payload), x)
            }
            if (Vr(v)) return g(h, p, v, x);
            if (Sr(v)) return w(h, p, v, x);
            $i(h, v)
        }
        return typeof v == "string" && v !== "" || typeof v == "number" ? (v = "" + v, p !== null && p.tag === 6 ? (n(h, p.sibling), p = i(p, v), p.return = h, h = p) : (n(h, p), p = Zs(v, h.mode, x), p.return = h, h = p), s(h)) : n(h, p)
    }
    return k
}
var ur = Fp(!0),
    jp = Fp(!1),
    ki = {},
    ht = an(ki),
    ai = an(ki),
    ui = an(ki);

function wn(e) {
    if (e === ki) throw Error(N(174));
    return e
}

function ru(e, t) {
    switch (G(ui, t), G(ai, e), G(ht, ki), e = t.nodeType, e) {
        case 9:
        case 11:
            t = (t = t.documentElement) ? t.namespaceURI : El(null, "");
            break;
        default:
            e = e === 8 ? t.parentNode : t, t = e.namespaceURI || null, e = e.tagName, t = El(t, e)
    }
    X(ht), G(ht, t)
}

function cr() {
    X(ht), X(ai), X(ui)
}

function zp(e) {
    wn(ui.current);
    var t = wn(ht.current),
        n = El(t, e.type);
    t !== n && (G(ai, e), G(ht, n))
}

function iu(e) {
    ai.current === e && (X(ht), X(ai))
}
var ne = an(0);

function Ro(e) {
    for (var t = e; t !== null;) {
        if (t.tag === 13) {
            var n = t.memoizedState;
            if (n !== null && (n = n.dehydrated, n === null || n.data === "$?" || n.data === "$!")) return t
        } else if (t.tag === 19 && t.memoizedProps.revealOrder !== void 0) {
            if ((t.flags & 128) !== 0) return t
        } else if (t.child !== null) {
            t.child.return = t, t = t.child;
            continue
        }
        if (t === e) break;
        for (; t.sibling === null;) {
            if (t.return === null || t.return === e) return null;
            t = t.return
        }
        t.sibling.return = t.return, t = t.sibling
    }
    return null
}
var Ws = [];

function ou() {
    for (var e = 0; e < Ws.length; e++) Ws[e]._workInProgressVersionPrimary = null;
    Ws.length = 0
}
var io = Dt.ReactCurrentDispatcher,
    Ks = Dt.ReactCurrentBatchConfig,
    En = 0,
    re = null,
    de = null,
    he = null,
    _o = !1,
    Ur = !1,
    ci = 0,
    n0 = 0;

function Se() {
    throw Error(N(321))
}

function su(e, t) {
    if (t === null) return !1;
    for (var n = 0; n < t.length && n < e.length; n++)
        if (!lt(e[n], t[n])) return !1;
    return !0
}

function lu(e, t, n, r, i, o) {
    if (En = o, re = t, t.memoizedState = null, t.updateQueue = null, t.lanes = 0, io.current = e === null || e.memoizedState === null ? s0 : l0, e = n(r, i), Ur) {
        o = 0;
        do {
            if (Ur = !1, ci = 0, 25 <= o) throw Error(N(301));
            o += 1, he = de = null, t.updateQueue = null, io.current = a0, e = n(r, i)
        } while (Ur)
    }
    if (io.current = Do, t = de !== null && de.next !== null, En = 0, he = de = re = null, _o = !1, t) throw Error(N(300));
    return e
}

function au() {
    var e = ci !== 0;
    return ci = 0, e
}

function ct() {
    var e = {
        memoizedState: null,
        baseState: null,
        baseQueue: null,
        queue: null,
        next: null
    };
    return he === null ? re.memoizedState = he = e : he = he.next = e, he
}

function Je() {
    if (de === null) {
        var e = re.alternate;
        e = e !== null ? e.memoizedState : null
    } else e = de.next;
    var t = he === null ? re.memoizedState : he.next;
    if (t !== null) he = t, de = e;
    else {
        if (e === null) throw Error(N(310));
        de = e, e = {
            memoizedState: de.memoizedState,
            baseState: de.baseState,
            baseQueue: de.baseQueue,
            queue: de.queue,
            next: null
        }, he === null ? re.memoizedState = he = e : he = he.next = e
    }
    return he
}

function fi(e, t) {
    return typeof t == "function" ? t(e) : t
}

function Qs(e) {
    var t = Je(),
        n = t.queue;
    if (n === null) throw Error(N(311));
    n.lastRenderedReducer = e;
    var r = de,
        i = r.baseQueue,
        o = n.pending;
    if (o !== null) {
        if (i !== null) {
            var s = i.next;
            i.next = o.next, o.next = s
        }
        r.baseQueue = i = o, n.pending = null
    }
    if (i !== null) {
        o = i.next, r = r.baseState;
        var l = s = null,
            a = null,
            u = o;
        do {
            var c = u.lane;
            if ((En & c) === c) a !== null && (a = a.next = {
                lane: 0,
                action: u.action,
                hasEagerState: u.hasEagerState,
                eagerState: u.eagerState,
                next: null
            }), r = u.hasEagerState ? u.eagerState : e(r, u.action);
            else {
                var f = {
                    lane: c,
                    action: u.action,
                    hasEagerState: u.hasEagerState,
                    eagerState: u.eagerState,
                    next: null
                };
                a === null ? (l = a = f, s = r) : a = a.next = f, re.lanes |= c, Nn |= c
            }
            u = u.next
        } while (u !== null && u !== o);
        a === null ? s = r : a.next = l, lt(r, t.memoizedState) || (Me = !0), t.memoizedState = r, t.baseState = s, t.baseQueue = a, n.lastRenderedState = r
    }
    if (e = n.interleaved, e !== null) {
        i = e;
        do o = i.lane, re.lanes |= o, Nn |= o, i = i.next; while (i !== e)
    } else i === null && (n.lanes = 0);
    return [t.memoizedState, n.dispatch]
}

function Gs(e) {
    var t = Je(),
        n = t.queue;
    if (n === null) throw Error(N(311));
    n.lastRenderedReducer = e;
    var r = n.dispatch,
        i = n.pending,
        o = t.memoizedState;
    if (i !== null) {
        n.pending = null;
        var s = i = i.next;
        do o = e(o, s.action), s = s.next; while (s !== i);
        lt(o, t.memoizedState) || (Me = !0), t.memoizedState = o, t.baseQueue === null && (t.baseState = o), n.lastRenderedState = o
    }
    return [o, r]
}

function Bp() {}

function Up(e, t) {
    var n = re,
        r = Je(),
        i = t(),
        o = !lt(r.memoizedState, i);
    if (o && (r.memoizedState = i, Me = !0), r = r.queue, uu(Hp.bind(null, n, r, e), [e]), r.getSnapshot !== t || o || he !== null && he.memoizedState.tag & 1) {
        if (n.flags |= 2048, di(9, bp.bind(null, n, r, i, t), void 0, null), me === null) throw Error(N(349));
        (En & 30) !== 0 || $p(n, t, i)
    }
    return i
}

function $p(e, t, n) {
    e.flags |= 16384, e = {
        getSnapshot: t,
        value: n
    }, t = re.updateQueue, t === null ? (t = {
        lastEffect: null,
        stores: null
    }, re.updateQueue = t, t.stores = [e]) : (n = t.stores, n === null ? t.stores = [e] : n.push(e))
}

function bp(e, t, n, r) {
    t.value = n, t.getSnapshot = r, Wp(t) && Kp(e)
}

function Hp(e, t, n) {
    return n(function() {
        Wp(t) && Kp(e)
    })
}

function Wp(e) {
    var t = e.getSnapshot;
    e = e.value;
    try {
        var n = t();
        return !lt(e, n)
    } catch {
        return !0
    }
}

function Kp(e) {
    var t = Rt(e, 1);
    t !== null && st(t, e, 1, -1)
}

function bc(e) {
    var t = ct();
    return typeof e == "function" && (e = e()), t.memoizedState = t.baseState = e, e = {
        pending: null,
        interleaved: null,
        lanes: 0,
        dispatch: null,
        lastRenderedReducer: fi,
        lastRenderedState: e
    }, t.queue = e, e = e.dispatch = o0.bind(null, re, e), [t.memoizedState, e]
}

function di(e, t, n, r) {
    return e = {
        tag: e,
        create: t,
        destroy: n,
        deps: r,
        next: null
    }, t = re.updateQueue, t === null ? (t = {
        lastEffect: null,
        stores: null
    }, re.updateQueue = t, t.lastEffect = e.next = e) : (n = t.lastEffect, n === null ? t.lastEffect = e.next = e : (r = n.next, n.next = e, e.next = r, t.lastEffect = e)), e
}

function Qp() {
    return Je().memoizedState
}

function oo(e, t, n, r) {
    var i = ct();
    re.flags |= e, i.memoizedState = di(1 | t, n, void 0, r === void 0 ? null : r)
}

function ss(e, t, n, r) {
    var i = Je();
    r = r === void 0 ? null : r;
    var o = void 0;
    if (de !== null) {
        var s = de.memoizedState;
        if (o = s.destroy, r !== null && su(r, s.deps)) {
            i.memoizedState = di(t, n, o, r);
            return
        }
    }
    re.flags |= e, i.memoizedState = di(1 | t, n, o, r)
}

function Hc(e, t) {
    return oo(8390656, 8, e, t)
}

function uu(e, t) {
    return ss(2048, 8, e, t)
}

function Gp(e, t) {
    return ss(4, 2, e, t)
}

function Yp(e, t) {
    return ss(4, 4, e, t)
}

function Xp(e, t) {
    if (typeof t == "function") return e = e(), t(e),
        function() {
            t(null)
        };
    if (t != null) return e = e(), t.current = e,
        function() {
            t.current = null
        }
}

function Zp(e, t, n) {
    return n = n != null ? n.concat([e]) : null, ss(4, 4, Xp.bind(null, t, e), n)
}

function cu() {}

function Jp(e, t) {
    var n = Je();
    t = t === void 0 ? null : t;
    var r = n.memoizedState;
    return r !== null && t !== null && su(t, r[1]) ? r[0] : (n.memoizedState = [e, t], e)
}

function qp(e, t) {
    var n = Je();
    t = t === void 0 ? null : t;
    var r = n.memoizedState;
    return r !== null && t !== null && su(t, r[1]) ? r[0] : (e = e(), n.memoizedState = [e, t], e)
}

function eh(e, t, n) {
    return (En & 21) === 0 ? (e.baseState && (e.baseState = !1, Me = !0), e.memoizedState = n) : (lt(n, t) || (n = rp(), re.lanes |= n, Nn |= n, e.baseState = !0), t)
}

function r0(e, t) {
    var n = K;
    K = n !== 0 && 4 > n ? n : 4, e(!0);
    var r = Ks.transition;
    Ks.transition = {};
    try {
        e(!1), t()
    } finally {
        K = n, Ks.transition = r
    }
}

function th() {
    return Je().memoizedState
}

function i0(e, t, n) {
    var r = qt(e);
    if (n = {
            lane: r,
            action: n,
            hasEagerState: !1,
            eagerState: null,
            next: null
        }, nh(e)) rh(t, n);
    else if (n = Ap(e, t, n, r), n !== null) {
        var i = _e();
        st(n, e, r, i), ih(n, t, r)
    }
}

function o0(e, t, n) {
    var r = qt(e),
        i = {
            lane: r,
            action: n,
            hasEagerState: !1,
            eagerState: null,
            next: null
        };
    if (nh(e)) rh(t, i);
    else {
        var o = e.alternate;
        if (e.lanes === 0 && (o === null || o.lanes === 0) && (o = t.lastRenderedReducer, o !== null)) try {
            var s = t.lastRenderedState,
                l = o(s, n);
            if (i.hasEagerState = !0, i.eagerState = l, lt(l, s)) {
                var a = t.interleaved;
                a === null ? (i.next = i, tu(t)) : (i.next = a.next, a.next = i), t.interleaved = i;
                return
            }
        } catch {} finally {}
        n = Ap(e, t, i, r), n !== null && (i = _e(), st(n, e, r, i), ih(n, t, r))
    }
}

function nh(e) {
    var t = e.alternate;
    return e === re || t !== null && t === re
}

function rh(e, t) {
    Ur = _o = !0;
    var n = e.pending;
    n === null ? t.next = t : (t.next = n.next, n.next = t), e.pending = t
}

function ih(e, t, n) {
    if ((n & 4194240) !== 0) {
        var r = t.lanes;
        r &= e.pendingLanes, n |= r, t.lanes = n, Ua(e, n)
    }
}
var Do = {
        readContext: Ze,
        useCallback: Se,
        useContext: Se,
        useEffect: Se,
        useImperativeHandle: Se,
        useInsertionEffect: Se,
        useLayoutEffect: Se,
        useMemo: Se,
        useReducer: Se,
        useRef: Se,
        useState: Se,
        useDebugValue: Se,
        useDeferredValue: Se,
        useTransition: Se,
        useMutableSource: Se,
        useSyncExternalStore: Se,
        useId: Se,
        unstable_isNewReconciler: !1
    },
    s0 = {
        readContext: Ze,
        useCallback: function(e, t) {
            return ct().memoizedState = [e, t === void 0 ? null : t], e
        },
        useContext: Ze,
        useEffect: Hc,
        useImperativeHandle: function(e, t, n) {
            return n = n != null ? n.concat([e]) : null, oo(4194308, 4, Xp.bind(null, t, e), n)
        },
        useLayoutEffect: function(e, t) {
            return oo(4194308, 4, e, t)
        },
        useInsertionEffect: function(e, t) {
            return oo(4, 2, e, t)
        },
        useMemo: function(e, t) {
            var n = ct();
            return t = t === void 0 ? null : t, e = e(), n.memoizedState = [e, t], e
        },
        useReducer: function(e, t, n) {
            var r = ct();
            return t = n !== void 0 ? n(t) : t, r.memoizedState = r.baseState = t, e = {
                pending: null,
                interleaved: null,
                lanes: 0,
                dispatch: null,
                lastRenderedReducer: e,
                lastRenderedState: t
            }, r.queue = e, e = e.dispatch = i0.bind(null, re, e), [r.memoizedState, e]
        },
        useRef: function(e) {
            var t = ct();
            return e = {
                current: e
            }, t.memoizedState = e
        },
        useState: bc,
        useDebugValue: cu,
        useDeferredValue: function(e) {
            return ct().memoizedState = e
        },
        useTransition: function() {
            var e = bc(!1),
                t = e[0];
            return e = r0.bind(null, e[1]), ct().memoizedState = e, [t, e]
        },
        useMutableSource: function() {},
        useSyncExternalStore: function(e, t, n) {
            var r = re,
                i = ct();
            if (q) {
                if (n === void 0) throw Error(N(407));
                n = n()
            } else {
                if (n = t(), me === null) throw Error(N(349));
                (En & 30) !== 0 || $p(r, t, n)
            }
            i.memoizedState = n;
            var o = {
                value: n,
                getSnapshot: t
            };
            return i.queue = o, Hc(Hp.bind(null, r, o, e), [e]), r.flags |= 2048, di(9, bp.bind(null, r, o, n, t), void 0, null), n
        },
        useId: function() {
            var e = ct(),
                t = me.identifierPrefix;
            if (q) {
                var n = Pt,
                    r = kt;
                n = (r & ~(1 << 32 - ot(r) - 1)).toString(32) + n, t = ":" + t + "R" + n, n = ci++, 0 < n && (t += "H" + n.toString(32)), t += ":"
            } else n = n0++, t = ":" + t + "r" + n.toString(32) + ":";
            return e.memoizedState = t
        },
        unstable_isNewReconciler: !1
    },
    l0 = {
        readContext: Ze,
        useCallback: Jp,
        useContext: Ze,
        useEffect: uu,
        useImperativeHandle: Zp,
        useInsertionEffect: Gp,
        useLayoutEffect: Yp,
        useMemo: qp,
        useReducer: Qs,
        useRef: Qp,
        useState: function() {
            return Qs(fi)
        },
        useDebugValue: cu,
        useDeferredValue: function(e) {
            var t = Je();
            return eh(t, de.memoizedState, e)
        },
        useTransition: function() {
            var e = Qs(fi)[0],
                t = Je().memoizedState;
            return [e, t]
        },
        useMutableSource: Bp,
        useSyncExternalStore: Up,
        useId: th,
        unstable_isNewReconciler: !1
    },
    a0 = {
        readContext: Ze,
        useCallback: Jp,
        useContext: Ze,
        useEffect: uu,
        useImperativeHandle: Zp,
        useInsertionEffect: Gp,
        useLayoutEffect: Yp,
        useMemo: qp,
        useReducer: Gs,
        useRef: Qp,
        useState: function() {
            return Gs(fi)
        },
        useDebugValue: cu,
        useDeferredValue: function(e) {
            var t = Je();
            return de === null ? t.memoizedState = e : eh(t, de.memoizedState, e)
        },
        useTransition: function() {
            var e = Gs(fi)[0],
                t = Je().memoizedState;
            return [e, t]
        },
        useMutableSource: Bp,
        useSyncExternalStore: Up,
        useId: th,
        unstable_isNewReconciler: !1
    };

function fr(e, t) {
    try {
        var n = "",
            r = t;
        do n += Iv(r), r = r.return; while (r);
        var i = n
    } catch (o) {
        i = `
Error generating stack: ` + o.message + `
` + o.stack
    }
    return {
        value: e,
        source: t,
        stack: i,
        digest: null
    }
}

function Ys(e, t, n) {
    return {
        value: e,
        source: null,
        stack: n != null ? n : null,
        digest: t != null ? t : null
    }
}

function Gl(e, t) {
    try {
        // Here we check if t is not null or undefined before trying to access 'Time'
        if (t !== null && t !== undefined) {
            console.error(t.Time);
        } else {
            console.error("Object is null or undefined");
        }
    } catch (n) {
        setTimeout(function() {
            throw n
        })
    }
}

var u0 = typeof WeakMap == "function" ? WeakMap : Map;

function oh(e, t, n) {
    n = Et(-1, n), n.tag = 3, n.payload = {
        element: null
    };
    var r = t.value;
    return n.callback = function() {
        Ao || (Ao = !0, ia = r), Gl(e, t)
    }, n
}

function sh(e, t, n) {
    n = Et(-1, n), n.tag = 3;
    var r = e.type.getDerivedStateFromError;
    if (typeof r == "function") {
        var i = t.value;
        n.payload = function() {
            return r(i)
        }, n.callback = function() {
            Gl(e, t)
        }
    }
    var o = e.stateNode;
    return o !== null && typeof o.componentDidCatch == "function" && (n.callback = function() {
        Gl(e, t), typeof r != "function" && (Jt === null ? Jt = new Set([this]) : Jt.add(this));
        var s = t.stack;
        this.componentDidCatch(t.value, {
            componentStack: s !== null ? s : ""
        })
    }), n
}

function Wc(e, t, n) {
    var r = e.pingCache;
    if (r === null) {
        r = e.pingCache = new u0;
        var i = new Set;
        r.set(t, i)
    } else i = r.get(t), i === void 0 && (i = new Set, r.set(t, i));
    i.has(n) || (i.add(n), e = k0.bind(null, e, t, n), t.then(e, e))
}

function Kc(e) {
    do {
        var t;
        if ((t = e.tag === 13) && (t = e.memoizedState, t = t !== null ? t.dehydrated !== null : !0), t) return e;
        e = e.return
    } while (e !== null);
    return null
}

function Qc(e, t, n, r, i) {
    return (e.mode & 1) === 0 ? (e === t ? e.flags |= 65536 : (e.flags |= 128, n.flags |= 131072, n.flags &= -52805, n.tag === 1 && (n.alternate === null ? n.tag = 17 : (t = Et(-1, 1), t.tag = 2, Zt(n, t, 1))), n.lanes |= 1), e) : (e.flags |= 65536, e.lanes = i, e)
}
var c0 = Dt.ReactCurrentOwner,
    Me = !1;

function Le(e, t, n, r) {
    t.child = e === null ? jp(t, null, n, r) : ur(t, e.child, n, r)
}

function Gc(e, t, n, r, i) {
    n = n.render;
    var o = t.ref;
    return rr(t, i), r = lu(e, t, n, r, o, i), n = au(), e !== null && !Me ? (t.updateQueue = e.updateQueue, t.flags &= -2053, e.lanes &= ~i, _t(e, t, i)) : (q && n && Ya(t), t.flags |= 1, Le(e, t, r, i), t.child)
}

function Yc(e, t, n, r, i) {
    if (e === null) {
        var o = n.type;
        return typeof o == "function" && !yu(o) && o.defaultProps === void 0 && n.compare === null && n.defaultProps === void 0 ? (t.tag = 15, t.type = o, lh(e, t, o, r, i)) : (e = uo(n.type, null, r, t, t.mode, i), e.ref = t.ref, e.return = t, t.child = e)
    }
    if (o = e.child, (e.lanes & i) === 0) {
        var s = o.memoizedProps;
        if (n = n.compare, n = n !== null ? n : ii, n(s, r) && e.ref === t.ref) return _t(e, t, i)
    }
    return t.flags |= 1, e = en(o, r), e.ref = t.ref, e.return = t, t.child = e
}

function lh(e, t, n, r, i) {
    if (e !== null) {
        var o = e.memoizedProps;
        if (ii(o, r) && e.ref === t.ref)
            if (Me = !1, t.pendingProps = r = o, (e.lanes & i) !== 0)(e.flags & 131072) !== 0 && (Me = !0);
            else return t.lanes = e.lanes, _t(e, t, i)
    }
    return Yl(e, t, n, r, i)
}

function ah(e, t, n) {
    var r = t.pendingProps,
        i = r.children,
        o = e !== null ? e.memoizedState : null;
    if (r.mode === "hidden")
        if ((t.mode & 1) === 0) t.memoizedState = {
            baseLanes: 0,
            cachePool: null,
            transitions: null
        }, G(Yn, je), je |= n;
        else {
            if ((n & 1073741824) === 0) return e = o !== null ? o.baseLanes | n : n, t.lanes = t.childLanes = 1073741824, t.memoizedState = {
                baseLanes: e,
                cachePool: null,
                transitions: null
            }, t.updateQueue = null, G(Yn, je), je |= e, null;
            t.memoizedState = {
                baseLanes: 0,
                cachePool: null,
                transitions: null
            }, r = o !== null ? o.baseLanes : n, G(Yn, je), je |= r
        }
    else o !== null ? (r = o.baseLanes | n, t.memoizedState = null) : r = n, G(Yn, je), je |= r;
    return Le(e, t, i, n), t.child
}

function uh(e, t) {
    var n = t.ref;
    (e === null && n !== null || e !== null && e.ref !== n) && (t.flags |= 512, t.flags |= 2097152)
}

function Yl(e, t, n, r, i) {
    var o = Ie(n) ? kn : Pe.current;
    return o = lr(t, o), rr(t, i), n = lu(e, t, n, r, o, i), r = au(), e !== null && !Me ? (t.updateQueue = e.updateQueue, t.flags &= -2053, e.lanes &= ~i, _t(e, t, i)) : (q && r && Ya(t), t.flags |= 1, Le(e, t, n, i), t.child)
}

function Xc(e, t, n, r, i) {
    if (Ie(n)) {
        var o = !0;
        ko(t)
    } else o = !1;
    if (rr(t, i), t.stateNode === null) so(e, t), Ip(t, n, r), Ql(t, n, r, i), r = !0;
    else if (e === null) {
        var s = t.stateNode,
            l = t.memoizedProps;
        s.props = l;
        var a = s.context,
            u = n.contextType;
        typeof u == "object" && u !== null ? u = Ze(u) : (u = Ie(n) ? kn : Pe.current, u = lr(t, u));
        var c = n.getDerivedStateFromProps,
            f = typeof c == "function" || typeof s.getSnapshotBeforeUpdate == "function";
        f || typeof s.UNSAFE_componentWillReceiveProps != "function" && typeof s.componentWillReceiveProps != "function" || (l !== r || a !== u) && Uc(t, s, r, u), zt = !1;
        var d = t.memoizedState;
        s.state = d, Lo(t, r, s, i), a = t.memoizedState, l !== r || d !== a || Oe.current || zt ? (typeof c == "function" && (Kl(t, n, c, r), a = t.memoizedState), (l = zt || Bc(t, n, l, r, d, a, u)) ? (f || typeof s.UNSAFE_componentWillMount != "function" && typeof s.componentWillMount != "function" || (typeof s.componentWillMount == "function" && s.componentWillMount(), typeof s.UNSAFE_componentWillMount == "function" && s.UNSAFE_componentWillMount()), typeof s.componentDidMount == "function" && (t.flags |= 4194308)) : (typeof s.componentDidMount == "function" && (t.flags |= 4194308), t.memoizedProps = r, t.memoizedState = a), s.props = r, s.state = a, s.context = u, r = l) : (typeof s.componentDidMount == "function" && (t.flags |= 4194308), r = !1)
    } else {
        s = t.stateNode, Mp(e, t), l = t.memoizedProps, u = t.type === t.elementType ? l : nt(t.type, l), s.props = u, f = t.pendingProps, d = s.context, a = n.contextType, typeof a == "object" && a !== null ? a = Ze(a) : (a = Ie(n) ? kn : Pe.current, a = lr(t, a));
        var m = n.getDerivedStateFromProps;
        (c = typeof m == "function" || typeof s.getSnapshotBeforeUpdate == "function") || typeof s.UNSAFE_componentWillReceiveProps != "function" && typeof s.componentWillReceiveProps != "function" || (l !== f || d !== a) && Uc(t, s, r, a), zt = !1, d = t.memoizedState, s.state = d, Lo(t, r, s, i);
        var g = t.memoizedState;
        l !== f || d !== g || Oe.current || zt ? (typeof m == "function" && (Kl(t, n, m, r), g = t.memoizedState), (u = zt || Bc(t, n, u, r, d, g, a) || !1) ? (c || typeof s.UNSAFE_componentWillUpdate != "function" && typeof s.componentWillUpdate != "function" || (typeof s.componentWillUpdate == "function" && s.componentWillUpdate(r, g, a), typeof s.UNSAFE_componentWillUpdate == "function" && s.UNSAFE_componentWillUpdate(r, g, a)), typeof s.componentDidUpdate == "function" && (t.flags |= 4), typeof s.getSnapshotBeforeUpdate == "function" && (t.flags |= 1024)) : (typeof s.componentDidUpdate != "function" || l === e.memoizedProps && d === e.memoizedState || (t.flags |= 4), typeof s.getSnapshotBeforeUpdate != "function" || l === e.memoizedProps && d === e.memoizedState || (t.flags |= 1024), t.memoizedProps = r, t.memoizedState = g), s.props = r, s.state = g, s.context = a, r = u) : (typeof s.componentDidUpdate != "function" || l === e.memoizedProps && d === e.memoizedState || (t.flags |= 4), typeof s.getSnapshotBeforeUpdate != "function" || l === e.memoizedProps && d === e.memoizedState || (t.flags |= 1024), r = !1)
    }
    return Xl(e, t, n, r, o, i)
}

function Xl(e, t, n, r, i, o) {
    uh(e, t);
    var s = (t.flags & 128) !== 0;
    if (!r && !s) return i && Oc(t, n, !1), _t(e, t, o);
    r = t.stateNode, c0.current = t;
    var l = s && typeof n.getDerivedStateFromError != "function" ? null : r.render();
    return t.flags |= 1, e !== null && s ? (t.child = ur(t, e.child, null, o), t.child = ur(t, null, l, o)) : Le(e, t, l, o), t.memoizedState = r.state, i && Oc(t, n, !0), t.child
}

function ch(e) {
    var t = e.stateNode;
    t.pendingContext ? Mc(e, t.pendingContext, t.pendingContext !== t.context) : t.context && Mc(e, t.context, !1), ru(e, t.containerInfo)
}

function Zc(e, t, n, r, i) {
    return ar(), Za(i), t.flags |= 256, Le(e, t, n, r), t.child
}
var Zl = {
    dehydrated: null,
    treeContext: null,
    retryLane: 0
};

function Jl(e) {
    return {
        baseLanes: e,
        cachePool: null,
        transitions: null
    }
}

function fh(e, t, n) {
    var r = t.pendingProps,
        i = ne.current,
        o = !1,
        s = (t.flags & 128) !== 0,
        l;
    if ((l = s) || (l = e !== null && e.memoizedState === null ? !1 : (i & 2) !== 0), l ? (o = !0, t.flags &= -129) : (e === null || e.memoizedState !== null) && (i |= 1), G(ne, i & 1), e === null) return Hl(t), e = t.memoizedState, e !== null && (e = e.dehydrated, e !== null) ? ((t.mode & 1) === 0 ? t.lanes = 1 : e.data === "$!" ? t.lanes = 8 : t.lanes = 1073741824, null) : (s = r.children, e = r.fallback, o ? (r = t.mode, o = t.child, s = {
        mode: "hidden",
        children: s
    }, (r & 1) === 0 && o !== null ? (o.childLanes = 0, o.pendingProps = s) : o = us(s, r, 0, null), e = Cn(e, r, n, null), o.return = t, e.return = t, o.sibling = e, t.child = o, t.child.memoizedState = Jl(n), t.memoizedState = Zl, e) : fu(t, s));
    if (i = e.memoizedState, i !== null && (l = i.dehydrated, l !== null)) return f0(e, t, s, r, l, i, n);
    if (o) {
        o = r.fallback, s = t.mode, i = e.child, l = i.sibling;
        var a = {
            mode: "hidden",
            children: r.children
        };
        return (s & 1) === 0 && t.child !== i ? (r = t.child, r.childLanes = 0, r.pendingProps = a, t.deletions = null) : (r = en(i, a), r.subtreeFlags = i.subtreeFlags & 14680064), l !== null ? o = en(l, o) : (o = Cn(o, s, n, null), o.flags |= 2), o.return = t, r.return = t, r.sibling = o, t.child = r, r = o, o = t.child, s = e.child.memoizedState, s = s === null ? Jl(n) : {
            baseLanes: s.baseLanes | n,
            cachePool: null,
            transitions: s.transitions
        }, o.memoizedState = s, o.childLanes = e.childLanes & ~n, t.memoizedState = Zl, r
    }
    return o = e.child, e = o.sibling, r = en(o, {
        mode: "visible",
        children: r.children
    }), (t.mode & 1) === 0 && (r.lanes = n), r.return = t, r.sibling = null, e !== null && (n = t.deletions, n === null ? (t.deletions = [e], t.flags |= 16) : n.push(e)), t.child = r, t.memoizedState = null, r
}

function fu(e, t) {
    return t = us({
        mode: "visible",
        children: t
    }, e.mode, 0, null), t.return = e, e.child = t
}

function bi(e, t, n, r) {
    return r !== null && Za(r), ur(t, e.child, null, n), e = fu(t, t.pendingProps.children), e.flags |= 2, t.memoizedState = null, e
}

function f0(e, t, n, r, i, o, s) {
    if (n) return t.flags & 256 ? (t.flags &= -257, r = Ys(Error(N(422))), bi(e, t, s, r)) : t.memoizedState !== null ? (t.child = e.child, t.flags |= 128, null) : (o = r.fallback, i = t.mode, r = us({
        mode: "visible",
        children: r.children
    }, i, 0, null), o = Cn(o, i, s, null), o.flags |= 2, r.return = t, o.return = t, r.sibling = o, t.child = r, (t.mode & 1) !== 0 && ur(t, e.child, null, s), t.child.memoizedState = Jl(s), t.memoizedState = Zl, o);
    if ((t.mode & 1) === 0) return bi(e, t, s, null);
    if (i.data === "$!") {
        if (r = i.nextSibling && i.nextSibling.dataset, r) var l = r.dgst;
        return r = l, o = Error(N(419)), r = Ys(o, r, void 0), bi(e, t, s, r)
    }
    if (l = (s & e.childLanes) !== 0, Me || l) {
        if (r = me, r !== null) {
            switch (s & -s) {
                case 4:
                    i = 2;
                    break;
                case 16:
                    i = 8;
                    break;
                case 64:
                case 128:
                case 256:
                case 512:
                case 1024:
                case 2048:
                case 4096:
                case 8192:
                case 16384:
                case 32768:
                case 65536:
                case 131072:
                case 262144:
                case 524288:
                case 1048576:
                case 2097152:
                case 4194304:
                case 8388608:
                case 16777216:
                case 33554432:
                case 67108864:
                    i = 32;
                    break;
                case 536870912:
                    i = 268435456;
                    break;
                default:
                    i = 0
            }
            i = (i & (r.suspendedLanes | s)) !== 0 ? 0 : i, i !== 0 && i !== o.retryLane && (o.retryLane = i, Rt(e, i), st(r, e, i, -1))
        }
        return gu(), r = Ys(Error(N(421))), bi(e, t, s, r)
    }
    return i.data === "$?" ? (t.flags |= 128, t.child = e.child, t = P0.bind(null, e), i._reactRetry = t, null) : (e = o.treeContext, ze = Xt(i.nextSibling), Be = t, q = !0, it = null, e !== null && (Qe[Ge++] = kt, Qe[Ge++] = Pt, Qe[Ge++] = Pn, kt = e.id, Pt = e.overflow, Pn = t), t = fu(t, r.children), t.flags |= 4096, t)
}

function Jc(e, t, n) {
    e.lanes |= t;
    var r = e.alternate;
    r !== null && (r.lanes |= t), Wl(e.return, t, n)
}

function Xs(e, t, n, r, i) {
    var o = e.memoizedState;
    o === null ? e.memoizedState = {
        isBackwards: t,
        rendering: null,
        renderingStartTime: 0,
        last: r,
        tail: n,
        tailMode: i
    } : (o.isBackwards = t, o.rendering = null, o.renderingStartTime = 0, o.last = r, o.tail = n, o.tailMode = i)
}

function dh(e, t, n) {
    var r = t.pendingProps,
        i = r.revealOrder,
        o = r.tail;
    if (Le(e, t, r.children, n), r = ne.current, (r & 2) !== 0) r = r & 1 | 2, t.flags |= 128;
    else {
        if (e !== null && (e.flags & 128) !== 0) e: for (e = t.child; e !== null;) {
            if (e.tag === 13) e.memoizedState !== null && Jc(e, n, t);
            else if (e.tag === 19) Jc(e, n, t);
            else if (e.child !== null) {
                e.child.return = e, e = e.child;
                continue
            }
            if (e === t) break e;
            for (; e.sibling === null;) {
                if (e.return === null || e.return === t) break e;
                e = e.return
            }
            e.sibling.return = e.return, e = e.sibling
        }
        r &= 1
    }
    if (G(ne, r), (t.mode & 1) === 0) t.memoizedState = null;
    else switch (i) {
        case "forwards":
            for (n = t.child, i = null; n !== null;) e = n.alternate, e !== null && Ro(e) === null && (i = n), n = n.sibling;
            n = i, n === null ? (i = t.child, t.child = null) : (i = n.sibling, n.sibling = null), Xs(t, !1, i, n, o);
            break;
        case "backwards":
            for (n = null, i = t.child, t.child = null; i !== null;) {
                if (e = i.alternate, e !== null && Ro(e) === null) {
                    t.child = i;
                    break
                }
                e = i.sibling, i.sibling = n, n = i, i = e
            }
            Xs(t, !0, n, null, o);
            break;
        case "together":
            Xs(t, !1, null, null, void 0);
            break;
        default:
            t.memoizedState = null
    }
    return t.child
}

function so(e, t) {
    (t.mode & 1) === 0 && e !== null && (e.alternate = null, t.alternate = null, t.flags |= 2)
}

function _t(e, t, n) {
    if (e !== null && (t.dependencies = e.dependencies), Nn |= t.lanes, (n & t.childLanes) === 0) return null;
    if (e !== null && t.child !== e.child) throw Error(N(153));
    if (t.child !== null) {
        for (e = t.child, n = en(e, e.pendingProps), t.child = n, n.return = t; e.sibling !== null;) e = e.sibling, n = n.sibling = en(e, e.pendingProps), n.return = t;
        n.sibling = null
    }
    return t.child
}

function d0(e, t, n) {
    switch (t.tag) {
        case 3:
            ch(t), ar();
            break;
        case 5:
            zp(t);
            break;
        case 1:
            Ie(t.type) && ko(t);
            break;
        case 4:
            ru(t, t.stateNode.containerInfo);
            break;
        case 10:
            var r = t.type._context,
                i = t.memoizedProps.value;
            G(No, r._currentValue), r._currentValue = i;
            break;
        case 13:
            if (r = t.memoizedState, r !== null) return r.dehydrated !== null ? (G(ne, ne.current & 1), t.flags |= 128, null) : (n & t.child.childLanes) !== 0 ? fh(e, t, n) : (G(ne, ne.current & 1), e = _t(e, t, n), e !== null ? e.sibling : null);
            G(ne, ne.current & 1);
            break;
        case 19:
            if (r = (n & t.childLanes) !== 0, (e.flags & 128) !== 0) {
                if (r) return dh(e, t, n);
                t.flags |= 128
            }
            if (i = t.memoizedState, i !== null && (i.rendering = null, i.tail = null, i.lastEffect = null), G(ne, ne.current), r) break;
            return null;
        case 22:
        case 23:
            return t.lanes = 0, ah(e, t, n)
    }
    return _t(e, t, n)
}
var ph, ql, hh, mh;
ph = function(e, t) {
    for (var n = t.child; n !== null;) {
        if (n.tag === 5 || n.tag === 6) e.appendChild(n.stateNode);
        else if (n.tag !== 4 && n.child !== null) {
            n.child.return = n, n = n.child;
            continue
        }
        if (n === t) break;
        for (; n.sibling === null;) {
            if (n.return === null || n.return === t) return;
            n = n.return
        }
        n.sibling.return = n.return, n = n.sibling
    }
};
ql = function() {};
hh = function(e, t, n, r) {
    var i = e.memoizedProps;
    if (i !== r) {
        e = t.stateNode, wn(ht.current);
        var o = null;
        switch (n) {
            case "input":
                i = Sl(e, i), r = Sl(e, r), o = [];
                break;
            case "select":
                i = ie({}, i, {
                    value: void 0
                }), r = ie({}, r, {
                    value: void 0
                }), o = [];
                break;
            case "textarea":
                i = Pl(e, i), r = Pl(e, r), o = [];
                break;
            default:
                typeof i.onClick != "function" && typeof r.onClick == "function" && (e.onclick = So)
        }
        Nl(n, r);
        var s;
        n = null;
        for (u in i)
            if (!r.hasOwnProperty(u) && i.hasOwnProperty(u) && i[u] != null)
                if (u === "style") {
                    var l = i[u];
                    for (s in l) l.hasOwnProperty(s) && (n || (n = {}), n[s] = "")
                } else u !== "dangerouslySetInnerHTML" && u !== "children" && u !== "suppressContentEditableWarning" && u !== "suppressHydrationWarning" && u !== "autoFocus" && (Zr.hasOwnProperty(u) ? o || (o = []) : (o = o || []).push(u, null));
        for (u in r) {
            var a = r[u];
            if (l = i != null ? i[u] : void 0, r.hasOwnProperty(u) && a !== l && (a != null || l != null))
                if (u === "style")
                    if (l) {
                        for (s in l) !l.hasOwnProperty(s) || a && a.hasOwnProperty(s) || (n || (n = {}), n[s] = "");
                        for (s in a) a.hasOwnProperty(s) && l[s] !== a[s] && (n || (n = {}), n[s] = a[s])
                    } else n || (o || (o = []), o.push(u, n)), n = a;
            else u === "dangerouslySetInnerHTML" ? (a = a ? a.__html : void 0, l = l ? l.__html : void 0, a != null && l !== a && (o = o || []).push(u, a)) : u === "children" ? typeof a != "string" && typeof a != "number" || (o = o || []).push(u, "" + a) : u !== "suppressContentEditableWarning" && u !== "suppressHydrationWarning" && (Zr.hasOwnProperty(u) ? (a != null && u === "onScroll" && Y("scroll", e), o || l === a || (o = [])) : (o = o || []).push(u, a))
        }
        n && (o = o || []).push("style", n);
        var u = o;
        (t.updateQueue = u) && (t.flags |= 4)
    }
};
mh = function(e, t, n, r) {
    n !== r && (t.flags |= 4)
};

function Tr(e, t) {
    if (!q) switch (e.tailMode) {
        case "hidden":
            t = e.tail;
            for (var n = null; t !== null;) t.alternate !== null && (n = t), t = t.sibling;
            n === null ? e.tail = null : n.sibling = null;
            break;
        case "collapsed":
            n = e.tail;
            for (var r = null; n !== null;) n.alternate !== null && (r = n), n = n.sibling;
            r === null ? t || e.tail === null ? e.tail = null : e.tail.sibling = null : r.sibling = null
    }
}

function Ce(e) {
    var t = e.alternate !== null && e.alternate.child === e.child,
        n = 0,
        r = 0;
    if (t)
        for (var i = e.child; i !== null;) n |= i.lanes | i.childLanes, r |= i.subtreeFlags & 14680064, r |= i.flags & 14680064, i.return = e, i = i.sibling;
    else
        for (i = e.child; i !== null;) n |= i.lanes | i.childLanes, r |= i.subtreeFlags, r |= i.flags, i.return = e, i = i.sibling;
    return e.subtreeFlags |= r, e.childLanes = n, t
}

function p0(e, t, n) {
    var r = t.pendingProps;
    switch (Xa(t), t.tag) {
        case 2:
        case 16:
        case 15:
        case 0:
        case 11:
        case 7:
        case 8:
        case 12:
        case 9:
        case 14:
            return Ce(t), null;
        case 1:
            return Ie(t.type) && Co(), Ce(t), null;
        case 3:
            return r = t.stateNode, cr(), X(Oe), X(Pe), ou(), r.pendingContext && (r.context = r.pendingContext, r.pendingContext = null), (e === null || e.child === null) && (Ui(t) ? t.flags |= 4 : e === null || e.memoizedState.isDehydrated && (t.flags & 256) === 0 || (t.flags |= 1024, it !== null && (la(it), it = null))), ql(e, t), Ce(t), null;
        case 5:
            iu(t);
            var i = wn(ui.current);
            if (n = t.type, e !== null && t.stateNode != null) hh(e, t, n, r, i), e.ref !== t.ref && (t.flags |= 512, t.flags |= 2097152);
            else {
                if (!r) {
                    if (t.stateNode === null) throw Error(N(166));
                    return Ce(t), null
                }
                if (e = wn(ht.current), Ui(t)) {
                    r = t.stateNode, n = t.type;
                    var o = t.memoizedProps;
                    switch (r[dt] = t, r[li] = o, e = (t.mode & 1) !== 0, n) {
                        case "dialog":
                            Y("cancel", r), Y("close", r);
                            break;
                        case "iframe":
                        case "object":
                        case "embed":
                            Y("load", r);
                            break;
                        case "video":
                        case "audio":
                            for (i = 0; i < Mr.length; i++) Y(Mr[i], r);
                            break;
                        case "source":
                            Y("error", r);
                            break;
                        case "img":
                        case "image":
                        case "link":
                            Y("error", r), Y("load", r);
                            break;
                        case "details":
                            Y("toggle", r);
                            break;
                        case "input":
                            lc(r, o), Y("invalid", r);
                            break;
                        case "select":
                            r._wrapperState = {
                                wasMultiple: !!o.multiple
                            }, Y("invalid", r);
                            break;
                        case "textarea":
                            uc(r, o), Y("invalid", r)
                    }
                    Nl(n, o), i = null;
                    for (var s in o)
                        if (o.hasOwnProperty(s)) {
                            var l = o[s];
                            s === "children" ? typeof l == "string" ? r.textContent !== l && (o.suppressHydrationWarning !== !0 && Bi(r.textContent, l, e), i = ["children", l]) : typeof l == "number" && r.textContent !== "" + l && (o.suppressHydrationWarning !== !0 && Bi(r.textContent, l, e), i = ["children", "" + l]) : Zr.hasOwnProperty(s) && l != null && s === "onScroll" && Y("scroll", r)
                        }
                    switch (n) {
                        case "input":
                            Vi(r), ac(r, o, !0);
                            break;
                        case "textarea":
                            Vi(r), cc(r);
                            break;
                        case "select":
                        case "option":
                            break;
                        default:
                            typeof o.onClick == "function" && (r.onclick = So)
                    }
                    r = i, t.updateQueue = r, r !== null && (t.flags |= 4)
                } else {
                    s = i.nodeType === 9 ? i : i.ownerDocument, e === "http://www.w3.org/1999/xhtml" && (e = $d(n)), e === "http://www.w3.org/1999/xhtml" ? n === "script" ? (e = s.createElement("div"), e.innerHTML = "<script><\/script>", e = e.removeChild(e.firstChild)) : typeof r.is == "string" ? e = s.createElement(n, {
                        is: r.is
                    }) : (e = s.createElement(n), n === "select" && (s = e, r.multiple ? s.multiple = !0 : r.size && (s.size = r.size))) : e = s.createElementNS(e, n), e[dt] = t, e[li] = r, ph(e, t, !1, !1), t.stateNode = e;
                    e: {
                        switch (s = Tl(n, r), n) {
                            case "dialog":
                                Y("cancel", e), Y("close", e), i = r;
                                break;
                            case "iframe":
                            case "object":
                            case "embed":
                                Y("load", e), i = r;
                                break;
                            case "video":
                            case "audio":
                                for (i = 0; i < Mr.length; i++) Y(Mr[i], e);
                                i = r;
                                break;
                            case "source":
                                Y("error", e), i = r;
                                break;
                            case "img":
                            case "image":
                            case "link":
                                Y("error", e), Y("load", e), i = r;
                                break;
                            case "details":
                                Y("toggle", e), i = r;
                                break;
                            case "input":
                                lc(e, r), i = Sl(e, r), Y("invalid", e);
                                break;
                            case "option":
                                i = r;
                                break;
                            case "select":
                                e._wrapperState = {
                                    wasMultiple: !!r.multiple
                                }, i = ie({}, r, {
                                    value: void 0
                                }), Y("invalid", e);
                                break;
                            case "textarea":
                                uc(e, r), i = Pl(e, r), Y("invalid", e);
                                break;
                            default:
                                i = r
                        }
                        Nl(n, i),
                        l = i;
                        for (o in l)
                            if (l.hasOwnProperty(o)) {
                                var a = l[o];
                                o === "style" ? Wd(e, a) : o === "dangerouslySetInnerHTML" ? (a = a ? a.__html : void 0, a != null && bd(e, a)) : o === "children" ? typeof a == "string" ? (n !== "textarea" || a !== "") && Jr(e, a) : typeof a == "number" && Jr(e, "" + a) : o !== "suppressContentEditableWarning" && o !== "suppressHydrationWarning" && o !== "autoFocus" && (Zr.hasOwnProperty(o) ? a != null && o === "onScroll" && Y("scroll", e) : a != null && Oa(e, o, a, s))
                            }
                        switch (n) {
                            case "input":
                                Vi(e), ac(e, r, !1);
                                break;
                            case "textarea":
                                Vi(e), cc(e);
                                break;
                            case "option":
                                r.value != null && e.setAttribute("value", "" + nn(r.value));
                                break;
                            case "select":
                                e.multiple = !!r.multiple, o = r.value, o != null ? qn(e, !!r.multiple, o, !1) : r.defaultValue != null && qn(e, !!r.multiple, r.defaultValue, !0);
                                break;
                            default:
                                typeof i.onClick == "function" && (e.onclick = So)
                        }
                        switch (n) {
                            case "button":
                            case "input":
                            case "select":
                            case "textarea":
                                r = !!r.autoFocus;
                                break e;
                            case "img":
                                r = !0;
                                break e;
                            default:
                                r = !1
                        }
                    }
                    r && (t.flags |= 4)
                }
                t.ref !== null && (t.flags |= 512, t.flags |= 2097152)
            }
            return Ce(t), null;
        case 6:
            if (e && t.stateNode != null) mh(e, t, e.memoizedProps, r);
            else {
                if (typeof r != "string" && t.stateNode === null) throw Error(N(166));
                if (n = wn(ui.current), wn(ht.current), Ui(t)) {
                    if (r = t.stateNode, n = t.memoizedProps, r[dt] = t, (o = r.nodeValue !== n) && (e = Be, e !== null)) switch (e.tag) {
                        case 3:
                            Bi(r.nodeValue, n, (e.mode & 1) !== 0);
                            break;
                        case 5:
                            e.memoizedProps.suppressHydrationWarning !== !0 && Bi(r.nodeValue, n, (e.mode & 1) !== 0)
                    }
                    o && (t.flags |= 4)
                } else r = (n.nodeType === 9 ? n : n.ownerDocument).createTextNode(r), r[dt] = t, t.stateNode = r
            }
            return Ce(t), null;
        case 13:
            if (X(ne), r = t.memoizedState, e === null || e.memoizedState !== null && e.memoizedState.dehydrated !== null) {
                if (q && ze !== null && (t.mode & 1) !== 0 && (t.flags & 128) === 0) Vp(), ar(), t.flags |= 98560, o = !1;
                else if (o = Ui(t), r !== null && r.dehydrated !== null) {
                    if (e === null) {
                        if (!o) throw Error(N(318));
                        if (o = t.memoizedState, o = o !== null ? o.dehydrated : null, !o) throw Error(N(317));
                        o[dt] = t
                    } else ar(), (t.flags & 128) === 0 && (t.memoizedState = null), t.flags |= 4;
                    Ce(t), o = !1
                } else it !== null && (la(it), it = null), o = !0;
                if (!o) return t.flags & 65536 ? t : null
            }
            return (t.flags & 128) !== 0 ? (t.lanes = n, t) : (r = r !== null, r !== (e !== null && e.memoizedState !== null) && r && (t.child.flags |= 8192, (t.mode & 1) !== 0 && (e === null || (ne.current & 1) !== 0 ? pe === 0 && (pe = 3) : gu())), t.updateQueue !== null && (t.flags |= 4), Ce(t), null);
        case 4:
            return cr(), ql(e, t), e === null && oi(t.stateNode.containerInfo), Ce(t), null;
        case 10:
            return eu(t.type._context), Ce(t), null;
        case 17:
            return Ie(t.type) && Co(), Ce(t), null;
        case 19:
            if (X(ne), o = t.memoizedState, o === null) return Ce(t), null;
            if (r = (t.flags & 128) !== 0, s = o.rendering, s === null)
                if (r) Tr(o, !1);
                else {
                    if (pe !== 0 || e !== null && (e.flags & 128) !== 0)
                        for (e = t.child; e !== null;) {
                            if (s = Ro(e), s !== null) {
                                for (t.flags |= 128, Tr(o, !1), r = s.updateQueue, r !== null && (t.updateQueue = r, t.flags |= 4), t.subtreeFlags = 0, r = n, n = t.child; n !== null;) o = n, e = r, o.flags &= 14680066, s = o.alternate, s === null ? (o.childLanes = 0, o.lanes = e, o.child = null, o.subtreeFlags = 0, o.memoizedProps = null, o.memoizedState = null, o.updateQueue = null, o.dependencies = null, o.stateNode = null) : (o.childLanes = s.childLanes, o.lanes = s.lanes, o.child = s.child, o.subtreeFlags = 0, o.deletions = null, o.memoizedProps = s.memoizedProps, o.memoizedState = s.memoizedState, o.updateQueue = s.updateQueue, o.type = s.type, e = s.dependencies, o.dependencies = e === null ? null : {
                                    lanes: e.lanes,
                                    firstContext: e.firstContext
                                }), n = n.sibling;
                                return G(ne, ne.current & 1 | 2), t.child
                            }
                            e = e.sibling
                        }
                    o.tail !== null && ae() > dr && (t.flags |= 128, r = !0, Tr(o, !1), t.lanes = 4194304)
                }
            else {
                if (!r)
                    if (e = Ro(s), e !== null) {
                        if (t.flags |= 128, r = !0, n = e.updateQueue, n !== null && (t.updateQueue = n, t.flags |= 4), Tr(o, !0), o.tail === null && o.tailMode === "hidden" && !s.alternate && !q) return Ce(t), null
                    } else 2 * ae() - o.renderingStartTime > dr && n !== 1073741824 && (t.flags |= 128, r = !0, Tr(o, !1), t.lanes = 4194304);
                o.isBackwards ? (s.sibling = t.child, t.child = s) : (n = o.last, n !== null ? n.sibling = s : t.child = s, o.last = s)
            }
            return o.tail !== null ? (t = o.tail, o.rendering = t, o.tail = t.sibling, o.renderingStartTime = ae(), t.sibling = null, n = ne.current, G(ne, r ? n & 1 | 2 : n & 1), t) : (Ce(t), null);
        case 22:
        case 23:
            return vu(), r = t.memoizedState !== null, e !== null && e.memoizedState !== null !== r && (t.flags |= 8192), r && (t.mode & 1) !== 0 ? (je & 1073741824) !== 0 && (Ce(t), t.subtreeFlags & 6 && (t.flags |= 8192)) : Ce(t), null;
        case 24:
            return null;
        case 25:
            return null
    }
    throw Error(N(156, t.tag))
}

function h0(e, t) {
    switch (Xa(t), t.tag) {
        case 1:
            return Ie(t.type) && Co(), e = t.flags, e & 65536 ? (t.flags = e & -65537 | 128, t) : null;
        case 3:
            return cr(), X(Oe), X(Pe), ou(), e = t.flags, (e & 65536) !== 0 && (e & 128) === 0 ? (t.flags = e & -65537 | 128, t) : null;
        case 5:
            return iu(t), null;
        case 13:
            if (X(ne), e = t.memoizedState, e !== null && e.dehydrated !== null) {
                if (t.alternate === null) throw Error(N(340));
                ar()
            }
            return e = t.flags, e & 65536 ? (t.flags = e & -65537 | 128, t) : null;
        case 19:
            return X(ne), null;
        case 4:
            return cr(), null;
        case 10:
            return eu(t.type._context), null;
        case 22:
        case 23:
            return vu(), null;
        case 24:
            return null;
        default:
            return null
    }
}
var Hi = !1,
    ke = !1,
    m0 = typeof WeakSet == "function" ? WeakSet : Set,
    A = null;

function Gn(e, t) {
    var n = e.ref;
    if (n !== null)
        if (typeof n == "function") try {
            n(null)
        } catch (r) {
            oe(e, t, r)
        } else n.current = null
}

function ea(e, t, n) {
    try {
        n()
    } catch (r) {
        oe(e, t, r)
    }
}
var qc = !1;

function v0(e, t) {
    if (Fl = yo, e = wp(), Ga(e)) {
        if ("selectionStart" in e) var n = {
            start: e.selectionStart,
            end: e.selectionEnd
        };
        else e: {
            n = (n = e.ownerDocument) && n.defaultView || window;
            var r = n.getSelection && n.getSelection();
            if (r && r.rangeCount !== 0) {
                n = r.anchorNode;
                var i = r.anchorOffset,
                    o = r.focusNode;
                r = r.focusOffset;
                try {
                    n.nodeType, o.nodeType
                } catch {
                    n = null;
                    break e
                }
                var s = 0,
                    l = -1,
                    a = -1,
                    u = 0,
                    c = 0,
                    f = e,
                    d = null;
                t: for (;;) {
                    for (var m; f !== n || i !== 0 && f.nodeType !== 3 || (l = s + i), f !== o || r !== 0 && f.nodeType !== 3 || (a = s + r), f.nodeType === 3 && (s += f.nodeValue.length), (m = f.firstChild) !== null;) d = f, f = m;
                    for (;;) {
                        if (f === e) break t;
                        if (d === n && ++u === i && (l = s), d === o && ++c === r && (a = s), (m = f.nextSibling) !== null) break;
                        f = d, d = f.parentNode
                    }
                    f = m
                }
                n = l === -1 || a === -1 ? null : {
                    start: l,
                    end: a
                }
            } else n = null
        }
        n = n || {
            start: 0,
            end: 0
        }
    } else n = null;
    for (jl = {
            focusedElem: e,
            selectionRange: n
        }, yo = !1, A = t; A !== null;)
        if (t = A, e = t.child, (t.subtreeFlags & 1028) !== 0 && e !== null) e.return = t, A = e;
        else
            for (; A !== null;) {
                t = A;
                try {
                    var g = t.alternate;
                    if ((t.flags & 1024) !== 0) switch (t.tag) {
                        case 0:
                        case 11:
                        case 15:
                            break;
                        case 1:
                            if (g !== null) {
                                var w = g.memoizedProps,
                                    k = g.memoizedState,
                                    h = t.stateNode,
                                    p = h.getSnapshotBeforeUpdate(t.elementType === t.type ? w : nt(t.type, w), k);
                                h.__reactInternalSnapshotBeforeUpdate = p
                            }
                            break;
                        case 3:
                            var v = t.stateNode.containerInfo;
                            v.nodeType === 1 ? v.textContent = "" : v.nodeType === 9 && v.documentElement && v.removeChild(v.documentElement);
                            break;
                        case 5:
                        case 6:
                        case 4:
                        case 17:
                            break;
                        default:
                            throw Error(N(163))
                    }
                } catch (x) {
                    oe(t, t.return, x)
                }
                if (e = t.sibling, e !== null) {
                    e.return = t.return, A = e;
                    break
                }
                A = t.return
            }
    return g = qc, qc = !1, g
}

function $r(e, t, n) {
    var r = t.updateQueue;
    if (r = r !== null ? r.lastEffect : null, r !== null) {
        var i = r = r.next;
        do {
            if ((i.tag & e) === e) {
                var o = i.destroy;
                i.destroy = void 0, o !== void 0 && ea(t, n, o)
            }
            i = i.next
        } while (i !== r)
    }
}

function ls(e, t) {
    if (t = t.updateQueue, t = t !== null ? t.lastEffect : null, t !== null) {
        var n = t = t.next;
        do {
            if ((n.tag & e) === e) {
                var r = n.create;
                n.destroy = r()
            }
            n = n.next
        } while (n !== t)
    }
}

function ta(e) {
    var t = e.ref;
    if (t !== null) {
        var n = e.stateNode;
        switch (e.tag) {
            case 5:
                e = n;
                break;
            default:
                e = n
        }
        typeof t == "function" ? t(e) : t.current = e
    }
}

function vh(e) {
    var t = e.alternate;
    t !== null && (e.alternate = null, vh(t)), e.child = null, e.deletions = null, e.sibling = null, e.tag === 5 && (t = e.stateNode, t !== null && (delete t[dt], delete t[li], delete t[Ul], delete t[Jg], delete t[qg])), e.stateNode = null, e.return = null, e.dependencies = null, e.memoizedProps = null, e.memoizedState = null, e.pendingProps = null, e.stateNode = null, e.updateQueue = null
}

function gh(e) {
    return e.tag === 5 || e.tag === 3 || e.tag === 4
}

function ef(e) {
    e: for (;;) {
        for (; e.sibling === null;) {
            if (e.return === null || gh(e.return)) return null;
            e = e.return
        }
        for (e.sibling.return = e.return, e = e.sibling; e.tag !== 5 && e.tag !== 6 && e.tag !== 18;) {
            if (e.flags & 2 || e.child === null || e.tag === 4) continue e;
            e.child.return = e, e = e.child
        }
        if (!(e.flags & 2)) return e.stateNode
    }
}

function na(e, t, n) {
    var r = e.tag;
    if (r === 5 || r === 6) e = e.stateNode, t ? n.nodeType === 8 ? n.parentNode.insertBefore(e, t) : n.insertBefore(e, t) : (n.nodeType === 8 ? (t = n.parentNode, t.insertBefore(e, n)) : (t = n, t.appendChild(e)), n = n._reactRootContainer, n != null || t.onclick !== null || (t.onclick = So));
    else if (r !== 4 && (e = e.child, e !== null))
        for (na(e, t, n), e = e.sibling; e !== null;) na(e, t, n), e = e.sibling
}

function ra(e, t, n) {
    var r = e.tag;
    if (r === 5 || r === 6) e = e.stateNode, t ? n.insertBefore(e, t) : n.appendChild(e);
    else if (r !== 4 && (e = e.child, e !== null))
        for (ra(e, t, n), e = e.sibling; e !== null;) ra(e, t, n), e = e.sibling
}
var ge = null,
    rt = !1;

function It(e, t, n) {
    for (n = n.child; n !== null;) yh(e, t, n), n = n.sibling
}

function yh(e, t, n) {
    if (pt && typeof pt.onCommitFiberUnmount == "function") try {
        pt.onCommitFiberUnmount(qo, n)
    } catch {}
    switch (n.tag) {
        case 5:
            ke || Gn(n, t);
        case 6:
            var r = ge,
                i = rt;
            ge = null, It(e, t, n), ge = r, rt = i, ge !== null && (rt ? (e = ge, n = n.stateNode, e.nodeType === 8 ? e.parentNode.removeChild(n) : e.removeChild(n)) : ge.removeChild(n.stateNode));
            break;
        case 18:
            ge !== null && (rt ? (e = ge, n = n.stateNode, e.nodeType === 8 ? bs(e.parentNode, n) : e.nodeType === 1 && bs(e, n), ni(e)) : bs(ge, n.stateNode));
            break;
        case 4:
            r = ge, i = rt, ge = n.stateNode.containerInfo, rt = !0, It(e, t, n), ge = r, rt = i;
            break;
        case 0:
        case 11:
        case 14:
        case 15:
            if (!ke && (r = n.updateQueue, r !== null && (r = r.lastEffect, r !== null))) {
                i = r = r.next;
                do {
                    var o = i,
                        s = o.destroy;
                    o = o.tag, s !== void 0 && ((o & 2) !== 0 || (o & 4) !== 0) && ea(n, t, s), i = i.next
                } while (i !== r)
            }
            It(e, t, n);
            break;
        case 1:
            if (!ke && (Gn(n, t), r = n.stateNode, typeof r.componentWillUnmount == "function")) try {
                r.props = n.memoizedProps, r.state = n.memoizedState, r.componentWillUnmount()
            } catch (l) {
                oe(n, t, l)
            }
            It(e, t, n);
            break;
        case 21:
            It(e, t, n);
            break;
        case 22:
            n.mode & 1 ? (ke = (r = ke) || n.memoizedState !== null, It(e, t, n), ke = r) : It(e, t, n);
            break;
        default:
            It(e, t, n)
    }
}

function tf(e) {
    var t = e.updateQueue;
    if (t !== null) {
        e.updateQueue = null;
        var n = e.stateNode;
        n === null && (n = e.stateNode = new m0), t.forEach(function(r) {
            var i = E0.bind(null, e, r);
            n.has(r) || (n.add(r), r.then(i, i))
        })
    }
}

function et(e, t) {
    var n = t.deletions;
    if (n !== null)
        for (var r = 0; r < n.length; r++) {
            var i = n[r];
            try {
                var o = e,
                    s = t,
                    l = s;
                e: for (; l !== null;) {
                    switch (l.tag) {
                        case 5:
                            ge = l.stateNode, rt = !1;
                            break e;
                        case 3:
                            ge = l.stateNode.containerInfo, rt = !0;
                            break e;
                        case 4:
                            ge = l.stateNode.containerInfo, rt = !0;
                            break e
                    }
                    l = l.return
                }
                if (ge === null) throw Error(N(160));
                yh(o, s, i), ge = null, rt = !1;
                var a = i.alternate;
                a !== null && (a.return = null), i.return = null
            } catch (u) {
                oe(i, t, u)
            }
        }
    if (t.subtreeFlags & 12854)
        for (t = t.child; t !== null;) wh(t, e), t = t.sibling
}

function wh(e, t) {
    var n = e.alternate,
        r = e.flags;
    switch (e.tag) {
        case 0:
        case 11:
        case 14:
        case 15:
            if (et(t, e), at(e), r & 4) {
                try {
                    $r(3, e, e.return), ls(3, e)
                } catch (w) {
                    oe(e, e.return, w)
                }
                try {
                    $r(5, e, e.return)
                } catch (w) {
                    oe(e, e.return, w)
                }
            }
            break;
        case 1:
            et(t, e), at(e), r & 512 && n !== null && Gn(n, n.return);
            break;
        case 5:
            if (et(t, e), at(e), r & 512 && n !== null && Gn(n, n.return), e.flags & 32) {
                var i = e.stateNode;
                try {
                    Jr(i, "")
                } catch (w) {
                    oe(e, e.return, w)
                }
            }
            if (r & 4 && (i = e.stateNode, i != null)) {
                var o = e.memoizedProps,
                    s = n !== null ? n.memoizedProps : o,
                    l = e.type,
                    a = e.updateQueue;
                if (e.updateQueue = null, a !== null) try {
                    l === "input" && o.type === "radio" && o.name != null && Bd(i, o), Tl(l, s);
                    var u = Tl(l, o);
                    for (s = 0; s < a.length; s += 2) {
                        var c = a[s],
                            f = a[s + 1];
                        c === "style" ? Wd(i, f) : c === "dangerouslySetInnerHTML" ? bd(i, f) : c === "children" ? Jr(i, f) : Oa(i, c, f, u)
                    }
                    switch (l) {
                        case "input":
                            Cl(i, o);
                            break;
                        case "textarea":
                            Ud(i, o);
                            break;
                        case "select":
                            var d = i._wrapperState.wasMultiple;
                            i._wrapperState.wasMultiple = !!o.multiple;
                            var m = o.value;
                            m != null ? qn(i, !!o.multiple, m, !1) : d !== !!o.multiple && (o.defaultValue != null ? qn(i, !!o.multiple, o.defaultValue, !0) : qn(i, !!o.multiple, o.multiple ? [] : "", !1))
                    }
                    i[li] = o
                } catch (w) {
                    oe(e, e.return, w)
                }
            }
            break;
        case 6:
            if (et(t, e), at(e), r & 4) {
                if (e.stateNode === null) throw Error(N(162));
                i = e.stateNode, o = e.memoizedProps;
                try {
                    i.nodeValue = o
                } catch (w) {
                    oe(e, e.return, w)
                }
            }
            break;
        case 3:
            if (et(t, e), at(e), r & 4 && n !== null && n.memoizedState.isDehydrated) try {
                ni(t.containerInfo)
            } catch (w) {
                oe(e, e.return, w)
            }
            break;
        case 4:
            et(t, e), at(e);
            break;
        case 13:
            et(t, e), at(e), i = e.child, i.flags & 8192 && (o = i.memoizedState !== null, i.stateNode.isHidden = o, !o || i.alternate !== null && i.alternate.memoizedState !== null || (hu = ae())), r & 4 && tf(e);
            break;
        case 22:
            if (c = n !== null && n.memoizedState !== null, e.mode & 1 ? (ke = (u = ke) || c, et(t, e), ke = u) : et(t, e), at(e), r & 8192) {
                if (u = e.memoizedState !== null, (e.stateNode.isHidden = u) && !c && (e.mode & 1) !== 0)
                    for (A = e, c = e.child; c !== null;) {
                        for (f = A = c; A !== null;) {
                            switch (d = A, m = d.child, d.tag) {
                                case 0:
                                case 11:
                                case 14:
                                case 15:
                                    $r(4, d, d.return);
                                    break;
                                case 1:
                                    Gn(d, d.return);
                                    var g = d.stateNode;
                                    if (typeof g.componentWillUnmount == "function") {
                                        r = d, n = d.return;
                                        try {
                                            t = r, g.props = t.memoizedProps, g.state = t.memoizedState, g.componentWillUnmount()
                                        } catch (w) {
                                            oe(r, n, w)
                                        }
                                    }
                                    break;
                                case 5:
                                    Gn(d, d.return);
                                    break;
                                case 22:
                                    if (d.memoizedState !== null) {
                                        rf(f);
                                        continue
                                    }
                            }
                            m !== null ? (m.return = d, A = m) : rf(f)
                        }
                        c = c.sibling
                    }
                e: for (c = null, f = e;;) {
                    if (f.tag === 5) {
                        if (c === null) {
                            c = f;
                            try {
                                i = f.stateNode, u ? (o = i.style, typeof o.setProperty == "function" ? o.setProperty("display", "none", "important") : o.display = "none") : (l = f.stateNode, a = f.memoizedProps.style, s = a != null && a.hasOwnProperty("display") ? a.display : null, l.style.display = Hd("display", s))
                            } catch (w) {
                                oe(e, e.return, w)
                            }
                        }
                    } else if (f.tag === 6) {
                        if (c === null) try {
                            f.stateNode.nodeValue = u ? "" : f.memoizedProps
                        } catch (w) {
                            oe(e, e.return, w)
                        }
                    } else if ((f.tag !== 22 && f.tag !== 23 || f.memoizedState === null || f === e) && f.child !== null) {
                        f.child.return = f, f = f.child;
                        continue
                    }
                    if (f === e) break e;
                    for (; f.sibling === null;) {
                        if (f.return === null || f.return === e) break e;
                        c === f && (c = null), f = f.return
                    }
                    c === f && (c = null), f.sibling.return = f.return, f = f.sibling
                }
            }
            break;
        case 19:
            et(t, e), at(e), r & 4 && tf(e);
            break;
        case 21:
            break;
        default:
            et(t, e), at(e)
    }
}

function at(e) {
    var t = e.flags;
    if (t & 2) {
        try {
            e: {
                for (var n = e.return; n !== null;) {
                    if (gh(n)) {
                        var r = n;
                        break e
                    }
                    n = n.return
                }
                throw Error(N(160))
            }
            switch (r.tag) {
                case 5:
                    var i = r.stateNode;
                    r.flags & 32 && (Jr(i, ""), r.flags &= -33);
                    var o = ef(e);
                    ra(e, o, i);
                    break;
                case 3:
                case 4:
                    var s = r.stateNode.containerInfo,
                        l = ef(e);
                    na(e, l, s);
                    break;
                default:
                    throw Error(N(161))
            }
        }
        catch (a) {
            oe(e, e.return, a)
        }
        e.flags &= -3
    }
    t & 4096 && (e.flags &= -4097)
}

function g0(e, t, n) {
    A = e, xh(e)
}

function xh(e, t, n) {
    for (var r = (e.mode & 1) !== 0; A !== null;) {
        var i = A,
            o = i.child;
        if (i.tag === 22 && r) {
            var s = i.memoizedState !== null || Hi;
            if (!s) {
                var l = i.alternate,
                    a = l !== null && l.memoizedState !== null || ke;
                l = Hi;
                var u = ke;
                if (Hi = s, (ke = a) && !u)
                    for (A = i; A !== null;) s = A, a = s.child, s.tag === 22 && s.memoizedState !== null ? of(i) : a !== null ? (a.return = s, A = a) : of(i);
                for (; o !== null;) A = o, xh(o), o = o.sibling;
                A = i, Hi = l, ke = u
            }
            nf(e)
        } else(i.subtreeFlags & 8772) !== 0 && o !== null ? (o.return = i, A = o) : nf(e)
    }
}

function nf(e) {
    for (; A !== null;) {
        var t = A;
        if ((t.flags & 8772) !== 0) {
            var n = t.alternate;
            try {
                if ((t.flags & 8772) !== 0) switch (t.tag) {
                    case 0:
                    case 11:
                    case 15:
                        ke || ls(5, t);
                        break;
                    case 1:
                        var r = t.stateNode;
                        if (t.flags & 4 && !ke)
                            if (n === null) r.componentDidMount();
                            else {
                                var i = t.elementType === t.type ? n.memoizedProps : nt(t.type, n.memoizedProps);
                                r.componentDidUpdate(i, n.memoizedState, r.__reactInternalSnapshotBeforeUpdate)
                            }
                        var o = t.updateQueue;
                        o !== null && zc(t, o, r);
                        break;
                    case 3:
                        var s = t.updateQueue;
                        if (s !== null) {
                            if (n = null, t.child !== null) switch (t.child.tag) {
                                case 5:
                                    n = t.child.stateNode;
                                    break;
                                case 1:
                                    n = t.child.stateNode
                            }
                            zc(t, s, n)
                        }
                        break;
                    case 5:
                        var l = t.stateNode;
                        if (n === null && t.flags & 4) {
                            n = l;
                            var a = t.memoizedProps;
                            switch (t.type) {
                                case "button":
                                case "input":
                                case "select":
                                case "textarea":
                                    a.autoFocus && n.focus();
                                    break;
                                case "img":
                                    a.src && (n.src = a.src)
                            }
                        }
                        break;
                    case 6:
                        break;
                    case 4:
                        break;
                    case 12:
                        break;
                    case 13:
                        if (t.memoizedState === null) {
                            var u = t.alternate;
                            if (u !== null) {
                                var c = u.memoizedState;
                                if (c !== null) {
                                    var f = c.dehydrated;
                                    f !== null && ni(f)
                                }
                            }
                        }
                        break;
                    case 19:
                    case 17:
                    case 21:
                    case 22:
                    case 23:
                    case 25:
                        break;
                    default:
                        throw Error(N(163))
                }
                ke || t.flags & 512 && ta(t)
            } catch (d) {
                oe(t, t.return, d)
            }
        }
        if (t === e) {
            A = null;
            break
        }
        if (n = t.sibling, n !== null) {
            n.return = t.return, A = n;
            break
        }
        A = t.return
    }
}

function rf(e) {
    for (; A !== null;) {
        var t = A;
        if (t === e) {
            A = null;
            break
        }
        var n = t.sibling;
        if (n !== null) {
            n.return = t.return, A = n;
            break
        }
        A = t.return
    }
}

function of(e) {
    for (; A !== null;) {
        var t = A;
        try {
            switch (t.tag) {
                case 0:
                case 11:
                case 15:
                    var n = t.return;
                    try {
                        ls(4, t)
                    } catch (a) {
                        oe(t, n, a)
                    }
                    break;
                case 1:
                    var r = t.stateNode;
                    if (typeof r.componentDidMount == "function") {
                        var i = t.return;
                        try {
                            r.componentDidMount()
                        } catch (a) {
                            oe(t, i, a)
                        }
                    }
                    var o = t.return;
                    try {
                        ta(t)
                    } catch (a) {
                        oe(t, o, a)
                    }
                    break;
                case 5:
                    var s = t.return;
                    try {
                        ta(t)
                    } catch (a) {
                        oe(t, s, a)
                    }
            }
        } catch (a) {
            oe(t, t.return, a)
        }
        if (t === e) {
            A = null;
            break
        }
        var l = t.sibling;
        if (l !== null) {
            l.return = t.return, A = l;
            break
        }
        A = t.return
    }
}
var y0 = Math.ceil,
    Vo = Dt.ReactCurrentDispatcher,
    du = Dt.ReactCurrentOwner,
    Xe = Dt.ReactCurrentBatchConfig,
    W = 0,
    me = null,
    ue = null,
    we = 0,
    je = 0,
    Yn = an(0),
    pe = 0,
    pi = null,
    Nn = 0,
    as = 0,
    pu = 0,
    br = null,
    Ae = null,
    hu = 0,
    dr = 1 / 0,
    xt = null,
    Ao = !1,
    ia = null,
    Jt = null,
    Wi = !1,
    Ht = null,
    Mo = 0,
    Hr = 0,
    oa = null,
    lo = -1,
    ao = 0;

function _e() {
    return (W & 6) !== 0 ? ae() : lo !== -1 ? lo : lo = ae()
}

function qt(e) {
    return (e.mode & 1) === 0 ? 1 : (W & 2) !== 0 && we !== 0 ? we & -we : t0.transition !== null ? (ao === 0 && (ao = rp()), ao) : (e = K, e !== 0 || (e = window.event, e = e === void 0 ? 16 : cp(e.type)), e)
}

function st(e, t, n, r) {
    if (50 < Hr) throw Hr = 0, oa = null, Error(N(185));
    xi(e, n, r), ((W & 2) === 0 || e !== me) && (e === me && ((W & 2) === 0 && (as |= n), pe === 4 && $t(e, we)), Fe(e, r), n === 1 && W === 0 && (t.mode & 1) === 0 && (dr = ae() + 500, is && un()))
}

function Fe(e, t) {
    var n = e.callbackNode;
    tg(e, t);
    var r = go(e, e === me ? we : 0);
    if (r === 0) n !== null && pc(n), e.callbackNode = null, e.callbackPriority = 0;
    else if (t = r & -r, e.callbackPriority !== t) {
        if (n != null && pc(n), t === 1) e.tag === 0 ? e0(sf.bind(null, e)) : Rp(sf.bind(null, e)), Xg(function() {
            (W & 6) === 0 && un()
        }), n = null;
        else {
            switch (ip(r)) {
                case 1:
                    n = Ba;
                    break;
                case 4:
                    n = tp;
                    break;
                case 16:
                    n = vo;
                    break;
                case 536870912:
                    n = np;
                    break;
                default:
                    n = vo
            }
            n = Lh(n, Sh.bind(null, e))
        }
        e.callbackPriority = t, e.callbackNode = n
    }
}

function Sh(e, t) {
    if (lo = -1, ao = 0, (W & 6) !== 0) throw Error(N(327));
    var n = e.callbackNode;
    if (ir() && e.callbackNode !== n) return null;
    var r = go(e, e === me ? we : 0);
    if (r === 0) return null;
    if ((r & 30) !== 0 || (r & e.expiredLanes) !== 0 || t) t = Oo(e, r);
    else {
        t = r;
        var i = W;
        W |= 2;
        var o = kh();
        (me !== e || we !== t) && (xt = null, dr = ae() + 500, Sn(e, t));
        do try {
            S0();
            break
        } catch (l) {
            Ch(e, l)
        }
        while (1);
        qa(), Vo.current = o, W = i, ue !== null ? t = 0 : (me = null, we = 0, t = pe)
    }
    if (t !== 0) {
        if (t === 2 && (i = Vl(e), i !== 0 && (r = i, t = sa(e, i))), t === 1) throw n = pi, Sn(e, 0), $t(e, r), Fe(e, ae()), n;
        if (t === 6) $t(e, r);
        else {
            if (i = e.current.alternate, (r & 30) === 0 && !w0(i) && (t = Oo(e, r), t === 2 && (o = Vl(e), o !== 0 && (r = o, t = sa(e, o))), t === 1)) throw n = pi, Sn(e, 0), $t(e, r), Fe(e, ae()), n;
            switch (e.finishedWork = i, e.finishedLanes = r, t) {
                case 0:
                case 1:
                    throw Error(N(345));
                case 2:
                    mn(e, Ae, xt);
                    break;
                case 3:
                    if ($t(e, r), (r & 130023424) === r && (t = hu + 500 - ae(), 10 < t)) {
                        if (go(e, 0) !== 0) break;
                        if (i = e.suspendedLanes, (i & r) !== r) {
                            _e(), e.pingedLanes |= e.suspendedLanes & i;
                            break
                        }
                        e.timeoutHandle = Bl(mn.bind(null, e, Ae, xt), t);
                        break
                    }
                    mn(e, Ae, xt);
                    break;
                case 4:
                    if ($t(e, r), (r & 4194240) === r) break;
                    for (t = e.eventTimes, i = -1; 0 < r;) {
                        var s = 31 - ot(r);
                        o = 1 << s, s = t[s], s > i && (i = s), r &= ~o
                    }
                    if (r = i, r = ae() - r, r = (120 > r ? 120 : 480 > r ? 480 : 1080 > r ? 1080 : 1920 > r ? 1920 : 3e3 > r ? 3e3 : 4320 > r ? 4320 : 1960 * y0(r / 1960)) - r, 10 < r) {
                        e.timeoutHandle = Bl(mn.bind(null, e, Ae, xt), r);
                        break
                    }
                    mn(e, Ae, xt);
                    break;
                case 5:
                    mn(e, Ae, xt);
                    break;
                default:
                    throw Error(N(329))
            }
        }
    }
    return Fe(e, ae()), e.callbackNode === n ? Sh.bind(null, e) : null
}

function sa(e, t) {
    var n = br;
    return e.current.memoizedState.isDehydrated && (Sn(e, t).flags |= 256), e = Oo(e, t), e !== 2 && (t = Ae, Ae = n, t !== null && la(t)), e
}

function la(e) {
    Ae === null ? Ae = e : Ae.push.apply(Ae, e)
}

function w0(e) {
    for (var t = e;;) {
        if (t.flags & 16384) {
            var n = t.updateQueue;
            if (n !== null && (n = n.stores, n !== null))
                for (var r = 0; r < n.length; r++) {
                    var i = n[r],
                        o = i.getSnapshot;
                    i = i.value;
                    try {
                        if (!lt(o(), i)) return !1
                    } catch {
                        return !1
                    }
                }
        }
        if (n = t.child, t.subtreeFlags & 16384 && n !== null) n.return = t, t = n;
        else {
            if (t === e) break;
            for (; t.sibling === null;) {
                if (t.return === null || t.return === e) return !0;
                t = t.return
            }
            t.sibling.return = t.return, t = t.sibling
        }
    }
    return !0
}

function $t(e, t) {
    for (t &= ~pu, t &= ~as, e.suspendedLanes |= t, e.pingedLanes &= ~t, e = e.expirationTimes; 0 < t;) {
        var n = 31 - ot(t),
            r = 1 << n;
        e[n] = -1, t &= ~r
    }
}

function sf(e) {
    if ((W & 6) !== 0) throw Error(N(327));
    ir();
    var t = go(e, 0);
    if ((t & 1) === 0) return Fe(e, ae()), null;
    var n = Oo(e, t);
    if (e.tag !== 0 && n === 2) {
        var r = Vl(e);
        r !== 0 && (t = r, n = sa(e, r))
    }
    if (n === 1) throw n = pi, Sn(e, 0), $t(e, t), Fe(e, ae()), n;
    if (n === 6) throw Error(N(345));
    return e.finishedWork = e.current.alternate, e.finishedLanes = t, mn(e, Ae, xt), Fe(e, ae()), null
}

function mu(e, t) {
    var n = W;
    W |= 1;
    try {
        return e(t)
    } finally {
        W = n, W === 0 && (dr = ae() + 500, is && un())
    }
}

function Tn(e) {
    Ht !== null && Ht.tag === 0 && (W & 6) === 0 && ir();
    var t = W;
    W |= 1;
    var n = Xe.transition,
        r = K;
    try {
        if (Xe.transition = null, K = 1, e) return e()
    } finally {
        K = r, Xe.transition = n, W = t, (W & 6) === 0 && un()
    }
}

function vu() {
    je = Yn.current, X(Yn)
}

function Sn(e, t) {
    e.finishedWork = null, e.finishedLanes = 0;
    var n = e.timeoutHandle;
    if (n !== -1 && (e.timeoutHandle = -1, Yg(n)), ue !== null)
        for (n = ue.return; n !== null;) {
            var r = n;
            switch (Xa(r), r.tag) {
                case 1:
                    r = r.type.childContextTypes, r != null && Co();
                    break;
                case 3:
                    cr(), X(Oe), X(Pe), ou();
                    break;
                case 5:
                    iu(r);
                    break;
                case 4:
                    cr();
                    break;
                case 13:
                    X(ne);
                    break;
                case 19:
                    X(ne);
                    break;
                case 10:
                    eu(r.type._context);
                    break;
                case 22:
                case 23:
                    vu()
            }
            n = n.return
        }
    if (me = e, ue = e = en(e.current, null), we = je = t, pe = 0, pi = null, pu = as = Nn = 0, Ae = br = null, yn !== null) {
        for (t = 0; t < yn.length; t++)
            if (n = yn[t], r = n.interleaved, r !== null) {
                n.interleaved = null;
                var i = r.next,
                    o = n.pending;
                if (o !== null) {
                    var s = o.next;
                    o.next = i, r.next = s
                }
                n.pending = r
            }
        yn = null
    }
    return e
}

function Ch(e, t) {
    do {
        var n = ue;
        try {
            if (qa(), io.current = Do, _o) {
                for (var r = re.memoizedState; r !== null;) {
                    var i = r.queue;
                    i !== null && (i.pending = null), r = r.next
                }
                _o = !1
            }
            if (En = 0, he = de = re = null, Ur = !1, ci = 0, du.current = null, n === null || n.return === null) {
                pe = 1, pi = t, ue = null;
                break
            }
            e: {
                var o = e,
                    s = n.return,
                    l = n,
                    a = t;
                if (t = we, l.flags |= 32768, a !== null && typeof a == "object" && typeof a.then == "function") {
                    var u = a,
                        c = l,
                        f = c.tag;
                    if ((c.mode & 1) === 0 && (f === 0 || f === 11 || f === 15)) {
                        var d = c.alternate;
                        d ? (c.updateQueue = d.updateQueue, c.memoizedState = d.memoizedState, c.lanes = d.lanes) : (c.updateQueue = null, c.memoizedState = null)
                    }
                    var m = Kc(s);
                    if (m !== null) {
                        m.flags &= -257, Qc(m, s, l, o, t), m.mode & 1 && Wc(o, u, t), t = m, a = u;
                        var g = t.updateQueue;
                        if (g === null) {
                            var w = new Set;
                            w.add(a), t.updateQueue = w
                        } else g.add(a);
                        break e
                    } else {
                        if ((t & 1) === 0) {
                            Wc(o, u, t), gu();
                            break e
                        }
                        a = Error(N(426))
                    }
                } else if (q && l.mode & 1) {
                    var k = Kc(s);
                    if (k !== null) {
                        (k.flags & 65536) === 0 && (k.flags |= 256), Qc(k, s, l, o, t), Za(fr(a, l));
                        break e
                    }
                }
                o = a = fr(a, l),
                pe !== 4 && (pe = 2),
                br === null ? br = [o] : br.push(o),
                o = s;do {
                    switch (o.tag) {
                        case 3:
                            o.flags |= 65536, t &= -t, o.lanes |= t;
                            var h = oh(o, a, t);
                            jc(o, h);
                            break e;
                        case 1:
                            l = a;
                            var p = o.type,
                                v = o.stateNode;
                            if ((o.flags & 128) === 0 && (typeof p.getDerivedStateFromError == "function" || v !== null && typeof v.componentDidCatch == "function" && (Jt === null || !Jt.has(v)))) {
                                o.flags |= 65536, t &= -t, o.lanes |= t;
                                var x = sh(o, l, t);
                                jc(o, x);
                                break e
                            }
                    }
                    o = o.return
                } while (o !== null)
            }
            Eh(n)
        } catch (P) {
            t = P, ue === n && n !== null && (ue = n = n.return);
            continue
        }
        break
    } while (1)
}

function kh() {
    var e = Vo.current;
    return Vo.current = Do, e === null ? Do : e
}

function gu() {
    (pe === 0 || pe === 3 || pe === 2) && (pe = 4), me === null || (Nn & 268435455) === 0 && (as & 268435455) === 0 || $t(me, we)
}

function Oo(e, t) {
    var n = W;
    W |= 2;
    var r = kh();
    (me !== e || we !== t) && (xt = null, Sn(e, t));
    do try {
        x0();
        break
    } catch (i) {
        Ch(e, i)
    }
    while (1);
    if (qa(), W = n, Vo.current = r, ue !== null) throw Error(N(261));
    return me = null, we = 0, pe
}

function x0() {
    for (; ue !== null;) Ph(ue)
}

function S0() {
    for (; ue !== null && !Kv();) Ph(ue)
}

function Ph(e) {
    var t = Th(e.alternate, e, je);
    e.memoizedProps = e.pendingProps, t === null ? Eh(e) : ue = t, du.current = null
}

function Eh(e) {
    var t = e;
    do {
        var n = t.alternate;
        if (e = t.return, (t.flags & 32768) === 0) {
            if (n = p0(n, t, je), n !== null) {
                ue = n;
                return
            }
        } else {
            if (n = h0(n, t), n !== null) {
                n.flags &= 32767, ue = n;
                return
            }
            if (e !== null) e.flags |= 32768, e.subtreeFlags = 0, e.deletions = null;
            else {
                pe = 6, ue = null;
                return
            }
        }
        if (t = t.sibling, t !== null) {
            ue = t;
            return
        }
        ue = t = e
    } while (t !== null);
    pe === 0 && (pe = 5)
}

function mn(e, t, n) {
    var r = K,
        i = Xe.transition;
    try {
        Xe.transition = null, K = 1, C0(e, t, n, r)
    } finally {
        Xe.transition = i, K = r
    }
    return null
}

function C0(e, t, n, r) {
    do ir(); while (Ht !== null);
    if ((W & 6) !== 0) throw Error(N(327));
    n = e.finishedWork;
    var i = e.finishedLanes;
    if (n === null) return null;
    if (e.finishedWork = null, e.finishedLanes = 0, n === e.current) throw Error(N(177));
    e.callbackNode = null, e.callbackPriority = 0;
    var o = n.lanes | n.childLanes;
    if (ng(e, o), e === me && (ue = me = null, we = 0), (n.subtreeFlags & 2064) === 0 && (n.flags & 2064) === 0 || Wi || (Wi = !0, Lh(vo, function() {
            return ir(), null
        })), o = (n.flags & 15990) !== 0, (n.subtreeFlags & 15990) !== 0 || o) {
        o = Xe.transition, Xe.transition = null;
        var s = K;
        K = 1;
        var l = W;
        W |= 4, du.current = null, v0(e, n), wh(n, e), $g(jl), yo = !!Fl, jl = Fl = null, e.current = n, g0(n), Qv(), W = l, K = s, Xe.transition = o
    } else e.current = n;
    if (Wi && (Wi = !1, Ht = e, Mo = i), o = e.pendingLanes, o === 0 && (Jt = null), Xv(n.stateNode), Fe(e, ae()), t !== null)
        for (r = e.onRecoverableError, n = 0; n < t.length; n++) i = t[n], r(i.value, {
            componentStack: i.stack,
            digest: i.digest
        });
    if (Ao) throw Ao = !1, e = ia, ia = null, e;
    return (Mo & 1) !== 0 && e.tag !== 0 && ir(), o = e.pendingLanes, (o & 1) !== 0 ? e === oa ? Hr++ : (Hr = 0, oa = e) : Hr = 0, un(), null
}

function ir() {
    if (Ht !== null) {
        var e = ip(Mo),
            t = Xe.transition,
            n = K;
        try {
            if (Xe.transition = null, K = 16 > e ? 16 : e, Ht === null) var r = !1;
            else {
                if (e = Ht, Ht = null, Mo = 0, (W & 6) !== 0) throw Error(N(331));
                var i = W;
                for (W |= 4, A = e.current; A !== null;) {
                    var o = A,
                        s = o.child;
                    if ((A.flags & 16) !== 0) {
                        var l = o.deletions;
                        if (l !== null) {
                            for (var a = 0; a < l.length; a++) {
                                var u = l[a];
                                for (A = u; A !== null;) {
                                    var c = A;
                                    switch (c.tag) {
                                        case 0:
                                        case 11:
                                        case 15:
                                            $r(8, c, o)
                                    }
                                    var f = c.child;
                                    if (f !== null) f.return = c, A = f;
                                    else
                                        for (; A !== null;) {
                                            c = A;
                                            var d = c.sibling,
                                                m = c.return;
                                            if (vh(c), c === u) {
                                                A = null;
                                                break
                                            }
                                            if (d !== null) {
                                                d.return = m, A = d;
                                                break
                                            }
                                            A = m
                                        }
                                }
                            }
                            var g = o.alternate;
                            if (g !== null) {
                                var w = g.child;
                                if (w !== null) {
                                    g.child = null;
                                    do {
                                        var k = w.sibling;
                                        w.sibling = null, w = k
                                    } while (w !== null)
                                }
                            }
                            A = o
                        }
                    }
                    if ((o.subtreeFlags & 2064) !== 0 && s !== null) s.return = o, A = s;
                    else e: for (; A !== null;) {
                        if (o = A, (o.flags & 2048) !== 0) switch (o.tag) {
                            case 0:
                            case 11:
                            case 15:
                                $r(9, o, o.return)
                        }
                        var h = o.sibling;
                        if (h !== null) {
                            h.return = o.return, A = h;
                            break e
                        }
                        A = o.return
                    }
                }
                var p = e.current;
                for (A = p; A !== null;) {
                    s = A;
                    var v = s.child;
                    if ((s.subtreeFlags & 2064) !== 0 && v !== null) v.return = s, A = v;
                    else e: for (s = p; A !== null;) {
                        if (l = A, (l.flags & 2048) !== 0) try {
                            switch (l.tag) {
                                case 0:
                                case 11:
                                case 15:
                                    ls(9, l)
                            }
                        } catch (P) {
                            oe(l, l.return, P)
                        }
                        if (l === s) {
                            A = null;
                            break e
                        }
                        var x = l.sibling;
                        if (x !== null) {
                            x.return = l.return, A = x;
                            break e
                        }
                        A = l.return
                    }
                }
                if (W = i, un(), pt && typeof pt.onPostCommitFiberRoot == "function") try {
                    pt.onPostCommitFiberRoot(qo, e)
                } catch {}
                r = !0
            }
            return r
        } finally {
            K = n, Xe.transition = t
        }
    }
    return !1
}

function lf(e, t, n) {
    t = fr(n, t), t = oh(e, t, 1), e = Zt(e, t, 1), t = _e(), e !== null && (xi(e, 1, t), Fe(e, t))
}

function oe(e, t, n) {
    if (e.tag === 3) lf(e, e, n);
    else
        for (; t !== null;) {
            if (t.tag === 3) {
                lf(t, e, n);
                break
            } else if (t.tag === 1) {
                var r = t.stateNode;
                if (typeof t.type.getDerivedStateFromError == "function" || typeof r.componentDidCatch == "function" && (Jt === null || !Jt.has(r))) {
                    e = fr(n, e), e = sh(t, e, 1), t = Zt(t, e, 1), e = _e(), t !== null && (xi(t, 1, e), Fe(t, e));
                    break
                }
            }
            t = t.return
        }
}

function k0(e, t, n) {
    var r = e.pingCache;
    r !== null && r.delete(t), t = _e(), e.pingedLanes |= e.suspendedLanes & n, me === e && (we & n) === n && (pe === 4 || pe === 3 && (we & 130023424) === we && 500 > ae() - hu ? Sn(e, 0) : pu |= n), Fe(e, t)
}

function Nh(e, t) {
    t === 0 && ((e.mode & 1) === 0 ? t = 1 : (t = Oi, Oi <<= 1, (Oi & 130023424) === 0 && (Oi = 4194304)));
    var n = _e();
    e = Rt(e, t), e !== null && (xi(e, t, n), Fe(e, n))
}

function P0(e) {
    var t = e.memoizedState,
        n = 0;
    t !== null && (n = t.retryLane), Nh(e, n)
}

function E0(e, t) {
    var n = 0;
    switch (e.tag) {
        case 13:
            var r = e.stateNode,
                i = e.memoizedState;
            i !== null && (n = i.retryLane);
            break;
        case 19:
            r = e.stateNode;
            break;
        default:
            throw Error(N(314))
    }
    r !== null && r.delete(t), Nh(e, n)
}
var Th;
Th = function(e, t, n) {
    if (e !== null)
        if (e.memoizedProps !== t.pendingProps || Oe.current) Me = !0;
        else {
            if ((e.lanes & n) === 0 && (t.flags & 128) === 0) return Me = !1, d0(e, t, n);
            Me = (e.flags & 131072) !== 0
        }
    else Me = !1, q && (t.flags & 1048576) !== 0 && _p(t, Eo, t.index);
    switch (t.lanes = 0, t.tag) {
        case 2:
            var r = t.type;
            so(e, t), e = t.pendingProps;
            var i = lr(t, Pe.current);
            rr(t, n), i = lu(null, t, r, e, i, n);
            var o = au();
            return t.flags |= 1, typeof i == "object" && i !== null && typeof i.render == "function" && i.$$typeof === void 0 ? (t.tag = 1, t.memoizedState = null, t.updateQueue = null, Ie(r) ? (o = !0, ko(t)) : o = !1, t.memoizedState = i.state !== null && i.state !== void 0 ? i.state : null, nu(t), i.updater = os, t.stateNode = i, i._reactInternals = t, Ql(t, r, e, n), t = Xl(null, t, r, !0, o, n)) : (t.tag = 0, q && o && Ya(t), Le(null, t, i, n), t = t.child), t;
        case 16:
            r = t.elementType;
            e: {
                switch (so(e, t), e = t.pendingProps, i = r._init, r = i(r._payload), t.type = r, i = t.tag = T0(r), e = nt(r, e), i) {
                    case 0:
                        t = Yl(null, t, r, e, n);
                        break e;
                    case 1:
                        t = Xc(null, t, r, e, n);
                        break e;
                    case 11:
                        t = Gc(null, t, r, e, n);
                        break e;
                    case 14:
                        t = Yc(null, t, r, nt(r.type, e), n);
                        break e
                }
                throw Error(N(306, r, ""))
            }
            return t;
        case 0:
            return r = t.type, i = t.pendingProps, i = t.elementType === r ? i : nt(r, i), Yl(e, t, r, i, n);
        case 1:
            return r = t.type, i = t.pendingProps, i = t.elementType === r ? i : nt(r, i), Xc(e, t, r, i, n);
        case 3:
            e: {
                if (ch(t), e === null) throw Error(N(387));r = t.pendingProps,
                o = t.memoizedState,
                i = o.element,
                Mp(e, t),
                Lo(t, r, null, n);
                var s = t.memoizedState;
                if (r = s.element, o.isDehydrated)
                    if (o = {
                            element: r,
                            isDehydrated: !1,
                            cache: s.cache,
                            pendingSuspenseBoundaries: s.pendingSuspenseBoundaries,
                            transitions: s.transitions
                        }, t.updateQueue.baseState = o, t.memoizedState = o, t.flags & 256) {
                        i = fr(Error(N(423)), t), t = Zc(e, t, r, n, i);
                        break e
                    } else if (r !== i) {
                    i = fr(Error(N(424)), t), t = Zc(e, t, r, n, i);
                    break e
                } else
                    for (ze = Xt(t.stateNode.containerInfo.firstChild), Be = t, q = !0, it = null, n = jp(t, null, r, n), t.child = n; n;) n.flags = n.flags & -3 | 4096, n = n.sibling;
                else {
                    if (ar(), r === i) {
                        t = _t(e, t, n);
                        break e
                    }
                    Le(e, t, r, n)
                }
                t = t.child
            }
            return t;
        case 5:
            return zp(t), e === null && Hl(t), r = t.type, i = t.pendingProps, o = e !== null ? e.memoizedProps : null, s = i.children, zl(r, i) ? s = null : o !== null && zl(r, o) && (t.flags |= 32), uh(e, t), Le(e, t, s, n), t.child;
        case 6:
            return e === null && Hl(t), null;
        case 13:
            return fh(e, t, n);
        case 4:
            return ru(t, t.stateNode.containerInfo), r = t.pendingProps, e === null ? t.child = ur(t, null, r, n) : Le(e, t, r, n), t.child;
        case 11:
            return r = t.type, i = t.pendingProps, i = t.elementType === r ? i : nt(r, i), Gc(e, t, r, i, n);
        case 7:
            return Le(e, t, t.pendingProps, n), t.child;
        case 8:
            return Le(e, t, t.pendingProps.children, n), t.child;
        case 12:
            return Le(e, t, t.pendingProps.children, n), t.child;
        case 10:
            e: {
                if (r = t.type._context, i = t.pendingProps, o = t.memoizedProps, s = i.value, G(No, r._currentValue), r._currentValue = s, o !== null)
                    if (lt(o.value, s)) {
                        if (o.children === i.children && !Oe.current) {
                            t = _t(e, t, n);
                            break e
                        }
                    } else
                        for (o = t.child, o !== null && (o.return = t); o !== null;) {
                            var l = o.dependencies;
                            if (l !== null) {
                                s = o.child;
                                for (var a = l.firstContext; a !== null;) {
                                    if (a.context === r) {
                                        if (o.tag === 1) {
                                            a = Et(-1, n & -n), a.tag = 2;
                                            var u = o.updateQueue;
                                            if (u !== null) {
                                                u = u.shared;
                                                var c = u.pending;
                                                c === null ? a.next = a : (a.next = c.next, c.next = a), u.pending = a
                                            }
                                        }
                                        o.lanes |= n, a = o.alternate, a !== null && (a.lanes |= n), Wl(o.return, n, t), l.lanes |= n;
                                        break
                                    }
                                    a = a.next
                                }
                            } else if (o.tag === 10) s = o.type === t.type ? null : o.child;
                            else if (o.tag === 18) {
                                if (s = o.return, s === null) throw Error(N(341));
                                s.lanes |= n, l = s.alternate, l !== null && (l.lanes |= n), Wl(s, n, t), s = o.sibling
                            } else s = o.child;
                            if (s !== null) s.return = o;
                            else
                                for (s = o; s !== null;) {
                                    if (s === t) {
                                        s = null;
                                        break
                                    }
                                    if (o = s.sibling, o !== null) {
                                        o.return = s.return, s = o;
                                        break
                                    }
                                    s = s.return
                                }
                            o = s
                        }
                Le(e, t, i.children, n),
                t = t.child
            }
            return t;
        case 9:
            return i = t.type, r = t.pendingProps.children, rr(t, n), i = Ze(i), r = r(i), t.flags |= 1, Le(e, t, r, n), t.child;
        case 14:
            return r = t.type, i = nt(r, t.pendingProps), i = nt(r.type, i), Yc(e, t, r, i, n);
        case 15:
            return lh(e, t, t.type, t.pendingProps, n);
        case 17:
            return r = t.type, i = t.pendingProps, i = t.elementType === r ? i : nt(r, i), so(e, t), t.tag = 1, Ie(r) ? (e = !0, ko(t)) : e = !1, rr(t, n), Ip(t, r, i), Ql(t, r, i, n), Xl(null, t, r, !0, e, n);
        case 19:
            return dh(e, t, n);
        case 22:
            return ah(e, t, n)
    }
    throw Error(N(156, t.tag))
};

function Lh(e, t) {
    return ep(e, t)
}

function N0(e, t, n, r) {
    this.tag = e, this.key = n, this.sibling = this.child = this.return = this.stateNode = this.type = this.elementType = null, this.index = 0, this.ref = null, this.pendingProps = t, this.dependencies = this.memoizedState = this.updateQueue = this.memoizedProps = null, this.mode = r, this.subtreeFlags = this.flags = 0, this.deletions = null, this.childLanes = this.lanes = 0, this.alternate = null
}

function Ye(e, t, n, r) {
    return new N0(e, t, n, r)
}

function yu(e) {
    return e = e.prototype, !(!e || !e.isReactComponent)
}

function T0(e) {
    if (typeof e == "function") return yu(e) ? 1 : 0;
    if (e != null) {
        if (e = e.$$typeof, e === Fa) return 11;
        if (e === ja) return 14
    }
    return 2
}

function en(e, t) {
    var n = e.alternate;
    return n === null ? (n = Ye(e.tag, t, e.key, e.mode), n.elementType = e.elementType, n.type = e.type, n.stateNode = e.stateNode, n.alternate = e, e.alternate = n) : (n.pendingProps = t, n.type = e.type, n.flags = 0, n.subtreeFlags = 0, n.deletions = null), n.flags = e.flags & 14680064, n.childLanes = e.childLanes, n.lanes = e.lanes, n.child = e.child, n.memoizedProps = e.memoizedProps, n.memoizedState = e.memoizedState, n.updateQueue = e.updateQueue, t = e.dependencies, n.dependencies = t === null ? null : {
        lanes: t.lanes,
        firstContext: t.firstContext
    }, n.sibling = e.sibling, n.index = e.index, n.ref = e.ref, n
}

function uo(e, t, n, r, i, o) {
    var s = 2;
    if (r = e, typeof e == "function") yu(e) && (s = 1);
    else if (typeof e == "string") s = 5;
    else e: switch (e) {
        case zn:
            return Cn(n.children, i, o, t);
        case Ia:
            s = 8, i |= 8;
            break;
        case gl:
            return e = Ye(12, n, t, i | 2), e.elementType = gl, e.lanes = o, e;
        case yl:
            return e = Ye(13, n, t, i), e.elementType = yl, e.lanes = o, e;
        case wl:
            return e = Ye(19, n, t, i), e.elementType = wl, e.lanes = o, e;
        case Fd:
            return us(n, i, o, t);
        default:
            if (typeof e == "object" && e !== null) switch (e.$$typeof) {
                case Od:
                    s = 10;
                    break e;
                case Id:
                    s = 9;
                    break e;
                case Fa:
                    s = 11;
                    break e;
                case ja:
                    s = 14;
                    break e;
                case jt:
                    s = 16, r = null;
                    break e
            }
            throw Error(N(130, e == null ? e : typeof e, ""))
    }
    return t = Ye(s, n, t, i), t.elementType = e, t.type = r, t.lanes = o, t
}

function Cn(e, t, n, r) {
    return e = Ye(7, e, r, t), e.lanes = n, e
}

function us(e, t, n, r) {
    return e = Ye(22, e, r, t), e.elementType = Fd, e.lanes = n, e.stateNode = {
        isHidden: !1
    }, e
}

function Zs(e, t, n) {
    return e = Ye(6, e, null, t), e.lanes = n, e
}

function Js(e, t, n) {
    return t = Ye(4, e.children !== null ? e.children : [], e.key, t), t.lanes = n, t.stateNode = {
        containerInfo: e.containerInfo,
        pendingChildren: null,
        implementation: e.implementation
    }, t
}

function L0(e, t, n, r, i) {
    this.tag = t, this.containerInfo = e, this.finishedWork = this.pingCache = this.current = this.pendingChildren = null, this.timeoutHandle = -1, this.callbackNode = this.pendingContext = this.context = null, this.callbackPriority = 0, this.eventTimes = Vs(0), this.expirationTimes = Vs(-1), this.entangledLanes = this.finishedLanes = this.mutableReadLanes = this.expiredLanes = this.pingedLanes = this.suspendedLanes = this.pendingLanes = 0, this.entanglements = Vs(0), this.identifierPrefix = r, this.onRecoverableError = i, this.mutableSourceEagerHydrationData = null
}

function wu(e, t, n, r, i, o, s, l, a) {
    return e = new L0(e, t, n, l, a), t === 1 ? (t = 1, o === !0 && (t |= 8)) : t = 0, o = Ye(3, null, null, t), e.current = o, o.stateNode = e, o.memoizedState = {
        element: r,
        isDehydrated: n,
        cache: null,
        transitions: null,
        pendingSuspenseBoundaries: null
    }, nu(o), e
}

function R0(e, t, n) {
    var r = 3 < arguments.length && arguments[3] !== void 0 ? arguments[3] : null;
    return {
        $$typeof: jn,
        key: r == null ? null : "" + r,
        children: e,
        containerInfo: t,
        implementation: n
    }
}

function Rh(e) {
    if (!e) return rn;
    e = e._reactInternals;
    e: {
        if (Rn(e) !== e || e.tag !== 1) throw Error(N(170));
        var t = e;do {
            switch (t.tag) {
                case 3:
                    t = t.stateNode.context;
                    break e;
                case 1:
                    if (Ie(t.type)) {
                        t = t.stateNode.__reactInternalMemoizedMergedChildContext;
                        break e
                    }
            }
            t = t.return
        } while (t !== null);
        throw Error(N(171))
    }
    if (e.tag === 1) {
        var n = e.type;
        if (Ie(n)) return Lp(e, n, t)
    }
    return t
}

function _h(e, t, n, r, i, o, s, l, a) {
    return e = wu(n, r, !0, e, i, o, s, l, a), e.context = Rh(null), n = e.current, r = _e(), i = qt(n), o = Et(r, i), o.callback = t != null ? t : null, Zt(n, o, i), e.current.lanes = i, xi(e, i, r), Fe(e, r), e
}

function cs(e, t, n, r) {
    var i = t.current,
        o = _e(),
        s = qt(i);
    return n = Rh(n), t.context === null ? t.context = n : t.pendingContext = n, t = Et(o, s), t.payload = {
        element: e
    }, r = r === void 0 ? null : r, r !== null && (t.callback = r), e = Zt(i, t, s), e !== null && (st(e, i, s, o), ro(e, i, s)), s
}

function Io(e) {
    if (e = e.current, !e.child) return null;
    switch (e.child.tag) {
        case 5:
            return e.child.stateNode;
        default:
            return e.child.stateNode
    }
}

function af(e, t) {
    if (e = e.memoizedState, e !== null && e.dehydrated !== null) {
        var n = e.retryLane;
        e.retryLane = n !== 0 && n < t ? n : t
    }
}

function xu(e, t) {
    af(e, t), (e = e.alternate) && af(e, t)
}

function _0() {
    return null
}
var Dh = typeof reportError == "function" ? reportError : function(e) {
    console.error(e)
};

function Su(e) {
    this._internalRoot = e
}
fs.prototype.render = Su.prototype.render = function(e) {
    var t = this._internalRoot;
    if (t === null) throw Error(N(409));
    cs(e, t, null, null)
};
fs.prototype.unmount = Su.prototype.unmount = function() {
    var e = this._internalRoot;
    if (e !== null) {
        this._internalRoot = null;
        var t = e.containerInfo;
        Tn(function() {
            cs(null, e, null, null)
        }), t[Lt] = null
    }
};

function fs(e) {
    this._internalRoot = e
}
fs.prototype.unstable_scheduleHydration = function(e) {
    if (e) {
        var t = lp();
        e = {
            blockedOn: null,
            target: e,
            priority: t
        };
        for (var n = 0; n < Ut.length && t !== 0 && t < Ut[n].priority; n++);
        Ut.splice(n, 0, e), n === 0 && up(e)
    }
};

function Cu(e) {
    return !(!e || e.nodeType !== 1 && e.nodeType !== 9 && e.nodeType !== 11)
}

function ds(e) {
    return !(!e || e.nodeType !== 1 && e.nodeType !== 9 && e.nodeType !== 11 && (e.nodeType !== 8 || e.nodeValue !== " react-mount-point-unstable "))
}

function uf() {}

function D0(e, t, n, r, i) {
    if (i) {
        if (typeof r == "function") {
            var o = r;
            r = function() {
                var u = Io(s);
                o.call(u)
            }
        }
        var s = _h(t, r, e, 0, null, !1, !1, "", uf);
        return e._reactRootContainer = s, e[Lt] = s.current, oi(e.nodeType === 8 ? e.parentNode : e), Tn(), s
    }
    for (; i = e.lastChild;) e.removeChild(i);
    if (typeof r == "function") {
        var l = r;
        r = function() {
            var u = Io(a);
            l.call(u)
        }
    }
    var a = wu(e, 0, !1, null, null, !1, !1, "", uf);
    return e._reactRootContainer = a, e[Lt] = a.current, oi(e.nodeType === 8 ? e.parentNode : e), Tn(function() {
        cs(t, a, n, r)
    }), a
}

function ps(e, t, n, r, i) {
    var o = n._reactRootContainer;
    if (o) {
        var s = o;
        if (typeof i == "function") {
            var l = i;
            i = function() {
                var a = Io(s);
                l.call(a)
            }
        }
        cs(t, s, e, i)
    } else s = D0(n, t, e, i, r);
    return Io(s)
}
op = function(e) {
    switch (e.tag) {
        case 3:
            var t = e.stateNode;
            if (t.current.memoizedState.isDehydrated) {
                var n = Ar(t.pendingLanes);
                n !== 0 && (Ua(t, n | 1), Fe(t, ae()), (W & 6) === 0 && (dr = ae() + 500, un()))
            }
            break;
        case 13:
            Tn(function() {
                var r = Rt(e, 1);
                if (r !== null) {
                    var i = _e();
                    st(r, e, 1, i)
                }
            }), xu(e, 1)
    }
};
$a = function(e) {
    if (e.tag === 13) {
        var t = Rt(e, 134217728);
        if (t !== null) {
            var n = _e();
            st(t, e, 134217728, n)
        }
        xu(e, 134217728)
    }
};
sp = function(e) {
    if (e.tag === 13) {
        var t = qt(e),
            n = Rt(e, t);
        if (n !== null) {
            var r = _e();
            st(n, e, t, r)
        }
        xu(e, t)
    }
};
lp = function() {
    return K
};
ap = function(e, t) {
    var n = K;
    try {
        return K = e, t()
    } finally {
        K = n
    }
};
Rl = function(e, t, n) {
    switch (t) {
        case "input":
            if (Cl(e, n), t = n.name, n.type === "radio" && t != null) {
                for (n = e; n.parentNode;) n = n.parentNode;
                for (n = n.querySelectorAll("input[name=" + JSON.stringify("" + t) + '][type="radio"]'), t = 0; t < n.length; t++) {
                    var r = n[t];
                    if (r !== e && r.form === e.form) {
                        var i = rs(r);
                        if (!i) throw Error(N(90));
                        zd(r), Cl(r, i)
                    }
                }
            }
            break;
        case "textarea":
            Ud(e, n);
            break;
        case "select":
            t = n.value, t != null && qn(e, !!n.multiple, t, !1)
    }
};
Gd = mu;
Yd = Tn;
var V0 = {
        usingClientEntryPoint: !1,
        Events: [Ci, bn, rs, Kd, Qd, mu]
    },
    Lr = {
        findFiberByHostInstance: gn,
        bundleType: 0,
        version: "18.2.0",
        rendererPackageName: "react-dom"
    },
    A0 = {
        bundleType: Lr.bundleType,
        version: Lr.version,
        rendererPackageName: Lr.rendererPackageName,
        rendererConfig: Lr.rendererConfig,
        overrideHookState: null,
        overrideHookStateDeletePath: null,
        overrideHookStateRenamePath: null,
        overrideProps: null,
        overridePropsDeletePath: null,
        overridePropsRenamePath: null,
        setErrorHandler: null,
        setSuspenseHandler: null,
        scheduleUpdate: null,
        currentDispatcherRef: Dt.ReactCurrentDispatcher,
        findHostInstanceByFiber: function(e) {
            return e = Jd(e), e === null ? null : e.stateNode
        },
        findFiberByHostInstance: Lr.findFiberByHostInstance || _0,
        findHostInstancesForRefresh: null,
        scheduleRefresh: null,
        scheduleRoot: null,
        setRefreshHandler: null,
        getCurrentFiber: null,
        reconcilerVersion: "18.2.0-next-9e3b772b8-20220608"
    };
if (typeof __REACT_DEVTOOLS_GLOBAL_HOOK__ != "undefined") {
    var Ki = __REACT_DEVTOOLS_GLOBAL_HOOK__;
    if (!Ki.isDisabled && Ki.supportsFiber) try {
        qo = Ki.inject(A0), pt = Ki
    } catch {}
}
He.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = V0;
He.createPortal = function(e, t) {
    var n = 2 < arguments.length && arguments[2] !== void 0 ? arguments[2] : null;
    if (!Cu(t)) throw Error(N(200));
    return R0(e, t, null, n)
};
He.createRoot = function(e, t) {
    if (!Cu(e)) throw Error(N(299));
    var n = !1,
        r = "",
        i = Dh;
    return t != null && (t.unstable_strictMode === !0 && (n = !0), t.identifierPrefix !== void 0 && (r = t.identifierPrefix), t.onRecoverableError !== void 0 && (i = t.onRecoverableError)), t = wu(e, 1, !1, null, null, n, !1, r, i), e[Lt] = t.current, oi(e.nodeType === 8 ? e.parentNode : e), new Su(t)
};
He.findDOMNode = function(e) {
    if (e == null) return null;
    if (e.nodeType === 1) return e;
    var t = e._reactInternals;
    if (t === void 0) throw typeof e.render == "function" ? Error(N(188)) : (e = Object.keys(e).join(","), Error(N(268, e)));
    return e = Jd(t), e = e === null ? null : e.stateNode, e
};
He.flushSync = function(e) {
    return Tn(e)
};
He.hydrate = function(e, t, n) {
    if (!ds(t)) throw Error(N(200));
    return ps(null, e, t, !0, n)
};
He.hydrateRoot = function(e, t, n) {
    if (!Cu(e)) throw Error(N(405));
    var r = n != null && n.hydratedSources || null,
        i = !1,
        o = "",
        s = Dh;
    if (n != null && (n.unstable_strictMode === !0 && (i = !0), n.identifierPrefix !== void 0 && (o = n.identifierPrefix), n.onRecoverableError !== void 0 && (s = n.onRecoverableError)), t = _h(t, null, e, 1, n != null ? n : null, i, !1, o, s), e[Lt] = t.current, oi(e), r)
        for (e = 0; e < r.length; e++) n = r[e], i = n._getVersion, i = i(n._source), t.mutableSourceEagerHydrationData == null ? t.mutableSourceEagerHydrationData = [n, i] : t.mutableSourceEagerHydrationData.push(n, i);
    return new fs(t)
};
He.render = function(e, t, n) {
    if (!ds(t)) throw Error(N(200));
    return ps(null, e, t, !1, n)
};
He.unmountComponentAtNode = function(e) {
    if (!ds(e)) throw Error(N(40));
    return e._reactRootContainer ? (Tn(function() {
        ps(null, null, e, !1, function() {
            e._reactRootContainer = null, e[Lt] = null
        })
    }), !0) : !1
};
He.unstable_batchedUpdates = mu;
He.unstable_renderSubtreeIntoContainer = function(e, t, n, r) {
    if (!ds(n)) throw Error(N(200));
    if (e == null || e._reactInternals === void 0) throw Error(N(38));
    return ps(e, t, n, !1, r)
};
He.version = "18.2.0-next-9e3b772b8-20220608";

function Vh() {
    if (!(typeof __REACT_DEVTOOLS_GLOBAL_HOOK__ == "undefined" || typeof __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE != "function")) try {
        __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE(Vh)
    } catch (e) {
        console.error(e)
    }
}
Vh(), _d.exports = He;
var cf = _d.exports;
ml.createRoot = cf.createRoot, ml.hydrateRoot = cf.hydrateRoot;
const ku = () => !window.invokeNative,
    M0 = () => {},
    Ct = (e, t) => {
        const n = S.exports.useRef(M0);
        S.exports.useEffect(() => {
            n.current = t
        }, [t]), S.exports.useEffect(() => {
            const r = i => {
                const {
                    action: o,
                    data: s
                } = i.data;
                n.current && o === e && n.current(s)
            };
            return window.addEventListener("message", r), () => window.removeEventListener("message", r)
        }, [e])
    };
async function Re(e, t, n) {
    const r = {
        method: "post",
        headers: {
            "Content-Type": "application/json; charset=UTF-8"
        },
        body: JSON.stringify(t)
    };
    if (ku() && n) return n;
    const i = window.GetParentResourceName ? window.GetParentResourceName() : "nui-frame-app";
    return await (await fetch(`https://${i}/${e}`, r)).json()
}
var hs = {
        exports: {}
    },
    ms = {};
/**
 * @license React
 * react-jsx-runtime.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
var O0 = S.exports,
    I0 = Symbol.for("react.element"),
    F0 = Symbol.for("react.fragment"),
    j0 = Object.prototype.hasOwnProperty,
    z0 = O0.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED.ReactCurrentOwner,
    B0 = {
        key: !0,
        ref: !0,
        __self: !0,
        __source: !0
    };

function Ah(e, t, n) {
    var r, i = {},
        o = null,
        s = null;
    n !== void 0 && (o = "" + n), t.key !== void 0 && (o = "" + t.key), t.ref !== void 0 && (s = t.ref);
    for (r in t) j0.call(t, r) && !B0.hasOwnProperty(r) && (i[r] = t[r]);
    if (e && e.defaultProps)
        for (r in t = e.defaultProps, t) i[r] === void 0 && (i[r] = t[r]);
    return {
        $$typeof: I0,
        type: e,
        key: o,
        ref: s,
        props: i,
        _owner: z0.current
    }
}
ms.Fragment = F0;
ms.jsx = Ah;
ms.jsxs = Ah;
hs.exports = ms;
const y = hs.exports.jsx,
    V = hs.exports.jsxs,
    ye = hs.exports.Fragment,
    Mh = S.exports.createContext(null),
    U0 = ({
        children: e
    }) => {
        const [t, n] = S.exports.useState(!1);
        return Ct("setVisible", n), S.exports.useEffect(() => {
            if (!t) return;
            const r = i => {
                ["Escape"].includes(i.code) && (ku() ? n(!t) : Re("close"))
            };
            return window.addEventListener("keydown", r), () => window.removeEventListener("keydown", r)
        }, [t]), y(Mh.Provider, {
            value: {
                visible: t,
                setVisible: n
            },
            children: e
        })
    },
    Pi = () => S.exports.useContext(Mh);
/**
 * @remix-run/router v1.3.2
 *
 * Copyright (c) Remix Software Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE.md file in the root directory of this source tree.
 *
 * @license MIT
 */
function hi() {
    return hi = Object.assign ? Object.assign.bind() : function(e) {
        for (var t = 1; t < arguments.length; t++) {
            var n = arguments[t];
            for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (e[r] = n[r])
        }
        return e
    }, hi.apply(this, arguments)
}
var Wt;
(function(e) {
    e.Pop = "POP", e.Push = "PUSH", e.Replace = "REPLACE"
})(Wt || (Wt = {}));
const ff = "popstate";

function $0(e) {
    e === void 0 && (e = {});

    function t(i, o) {
        let {
            pathname: s = "/",
            search: l = "",
            hash: a = ""
        } = _n(i.location.hash.substr(1));
        return aa("", {
            pathname: s,
            search: l,
            hash: a
        }, o.state && o.state.usr || null, o.state && o.state.key || "default")
    }

    function n(i, o) {
        let s = i.document.querySelector("base"),
            l = "";
        if (s && s.getAttribute("href")) {
            let a = i.location.href,
                u = a.indexOf("#");
            l = u === -1 ? a : a.slice(0, u)
        }
        return l + "#" + (typeof o == "string" ? o : Fo(o))
    }

    function r(i, o) {
        b0(i.pathname.charAt(0) === "/", "relative pathnames are not supported in hash history.push(" + JSON.stringify(o) + ")")
    }
    return W0(t, n, r, e)
}

function ce(e, t) {
    if (e === !1 || e === null || typeof e == "undefined") throw new Error(t)
}

function b0(e, t) {
    if (!e) {
        typeof console != "undefined" && console.warn(t);
        try {
            throw new Error(t)
        } catch {}
    }
}

function H0() {
    return Math.random().toString(36).substr(2, 8)
}

function df(e, t) {
    return {
        usr: e.state,
        key: e.key,
        idx: t
    }
}

function aa(e, t, n, r) {
    return n === void 0 && (n = null), hi({
        pathname: typeof e == "string" ? e : e.pathname,
        search: "",
        hash: ""
    }, typeof t == "string" ? _n(t) : t, {
        state: n,
        key: t && t.key || r || H0()
    })
}

function Fo(e) {
    let {
        pathname: t = "/",
        search: n = "",
        hash: r = ""
    } = e;
    return n && n !== "?" && (t += n.charAt(0) === "?" ? n : "?" + n), r && r !== "#" && (t += r.charAt(0) === "#" ? r : "#" + r), t
}

function _n(e) {
    let t = {};
    if (e) {
        let n = e.indexOf("#");
        n >= 0 && (t.hash = e.substr(n), e = e.substr(0, n));
        let r = e.indexOf("?");
        r >= 0 && (t.search = e.substr(r), e = e.substr(0, r)), e && (t.pathname = e)
    }
    return t
}

function W0(e, t, n, r) {
    r === void 0 && (r = {});
    let {
        window: i = document.defaultView,
        v5Compat: o = !1
    } = r, s = i.history, l = Wt.Pop, a = null, u = c();
    u == null && (u = 0, s.replaceState(hi({}, s.state, {
        idx: u
    }), ""));

    function c() {
        return (s.state || {
            idx: null
        }).idx
    }

    function f() {
        l = Wt.Pop;
        let k = c(),
            h = k == null ? null : k - u;
        u = k, a && a({
            action: l,
            location: w.location,
            delta: h
        })
    }

    function d(k, h) {
        l = Wt.Push;
        let p = aa(w.location, k, h);
        n && n(p, k), u = c() + 1;
        let v = df(p, u),
            x = w.createHref(p);
        try {
            s.pushState(v, "", x)
        } catch {
            i.location.assign(x)
        }
        o && a && a({
            action: l,
            location: w.location,
            delta: 1
        })
    }

    function m(k, h) {
        l = Wt.Replace;
        let p = aa(w.location, k, h);
        n && n(p, k), u = c();
        let v = df(p, u),
            x = w.createHref(p);
        s.replaceState(v, "", x), o && a && a({
            action: l,
            location: w.location,
            delta: 0
        })
    }

    function g(k) {
        let h = i.location.origin !== "null" ? i.location.origin : i.location.href,
            p = typeof k == "string" ? k : Fo(k);
        return ce(h, "No window.location.(origin|href) available to create URL for href: " + p), new URL(p, h)
    }
    let w = {
        get action() {
            return l
        },
        get location() {
            return e(i, s)
        },
        listen(k) {
            if (a) throw new Error("A history only accepts one active listener");
            return i.addEventListener(ff, f), a = k, () => {
                i.removeEventListener(ff, f), a = null
            }
        },
        createHref(k) {
            return t(i, k)
        },
        createURL: g,
        encodeLocation(k) {
            let h = g(k);
            return {
                pathname: h.pathname,
                search: h.search,
                hash: h.hash
            }
        },
        push: d,
        replace: m,
        go(k) {
            return s.go(k)
        }
    };
    return w
}
var pf;
(function(e) {
    e.data = "data", e.deferred = "deferred", e.redirect = "redirect", e.error = "error"
})(pf || (pf = {}));

function K0(e, t, n) {
    n === void 0 && (n = "/");
    let r = typeof t == "string" ? _n(t) : t,
        i = Fh(r.pathname || "/", n);
    if (i == null) return null;
    let o = Oh(e);
    Q0(o);
    let s = null;
    for (let l = 0; s == null && l < o.length; ++l) s = ny(o[l], oy(i));
    return s
}

function Oh(e, t, n, r) {
    t === void 0 && (t = []), n === void 0 && (n = []), r === void 0 && (r = "");
    let i = (o, s, l) => {
        let a = {
            relativePath: l === void 0 ? o.path || "" : l,
            caseSensitive: o.caseSensitive === !0,
            childrenIndex: s,
            route: o
        };
        a.relativePath.startsWith("/") && (ce(a.relativePath.startsWith(r), 'Absolute route path "' + a.relativePath + '" nested under path ' + ('"' + r + '" is not valid. An absolute child route path ') + "must start with the combined path of all its parent routes."), a.relativePath = a.relativePath.slice(r.length));
        let u = tn([r, a.relativePath]),
            c = n.concat(a);
        o.children && o.children.length > 0 && (ce(o.index !== !0, "Index routes must not have child routes. Please remove " + ('all child routes from route path "' + u + '".')), Oh(o.children, t, c, u)), !(o.path == null && !o.index) && t.push({
            path: u,
            score: ey(u, o.index),
            routesMeta: c
        })
    };
    return e.forEach((o, s) => {
        var l;
        if (o.path === "" || !((l = o.path) != null && l.includes("?"))) i(o, s);
        else
            for (let a of Ih(o.path)) i(o, s, a)
    }), t
}

function Ih(e) {
    let t = e.split("/");
    if (t.length === 0) return [];
    let [n, ...r] = t, i = n.endsWith("?"), o = n.replace(/\?$/, "");
    if (r.length === 0) return i ? [o, ""] : [o];
    let s = Ih(r.join("/")),
        l = [];
    return l.push(...s.map(a => a === "" ? o : [o, a].join("/"))), i && l.push(...s), l.map(a => e.startsWith("/") && a === "" ? "/" : a)
}

function Q0(e) {
    e.sort((t, n) => t.score !== n.score ? n.score - t.score : ty(t.routesMeta.map(r => r.childrenIndex), n.routesMeta.map(r => r.childrenIndex)))
}
const G0 = /^:\w+$/,
    Y0 = 3,
    X0 = 2,
    Z0 = 1,
    J0 = 10,
    q0 = -2,
    hf = e => e === "*";

function ey(e, t) {
    let n = e.split("/"),
        r = n.length;
    return n.some(hf) && (r += q0), t && (r += X0), n.filter(i => !hf(i)).reduce((i, o) => i + (G0.test(o) ? Y0 : o === "" ? Z0 : J0), r)
}

function ty(e, t) {
    return e.length === t.length && e.slice(0, -1).every((r, i) => r === t[i]) ? e[e.length - 1] - t[t.length - 1] : 0
}

function ny(e, t) {
    let {
        routesMeta: n
    } = e, r = {}, i = "/", o = [];
    for (let s = 0; s < n.length; ++s) {
        let l = n[s],
            a = s === n.length - 1,
            u = i === "/" ? t : t.slice(i.length) || "/",
            c = ry({
                path: l.relativePath,
                caseSensitive: l.caseSensitive,
                end: a
            }, u);
        if (!c) return null;
        Object.assign(r, c.params);
        let f = l.route;
        o.push({
            params: r,
            pathname: tn([i, c.pathname]),
            pathnameBase: uy(tn([i, c.pathnameBase])),
            route: f
        }), c.pathnameBase !== "/" && (i = tn([i, c.pathnameBase]))
    }
    return o
}

function ry(e, t) {
    typeof e == "string" && (e = {
        path: e,
        caseSensitive: !1,
        end: !0
    });
    let [n, r] = iy(e.path, e.caseSensitive, e.end), i = t.match(n);
    if (!i) return null;
    let o = i[0],
        s = o.replace(/(.)\/+$/, "$1"),
        l = i.slice(1);
    return {
        params: r.reduce((u, c, f) => {
            if (c === "*") {
                let d = l[f] || "";
                s = o.slice(0, o.length - d.length).replace(/(.)\/+$/, "$1")
            }
            return u[c] = sy(l[f] || "", c), u
        }, {}),
        pathname: o,
        pathnameBase: s,
        pattern: e
    }
}

function iy(e, t, n) {
    t === void 0 && (t = !1), n === void 0 && (n = !0), Pu(e === "*" || !e.endsWith("*") || e.endsWith("/*"), 'Route path "' + e + '" will be treated as if it were ' + ('"' + e.replace(/\*$/, "/*") + '" because the `*` character must ') + "always follow a `/` in the pattern. To get rid of this warning, " + ('please change the route path to "' + e.replace(/\*$/, "/*") + '".'));
    let r = [],
        i = "^" + e.replace(/\/*\*?$/, "").replace(/^\/*/, "/").replace(/[\\.*+^$?{}|()[\]]/g, "\\$&").replace(/\/:(\w+)/g, (s, l) => (r.push(l), "/([^\\/]+)"));
    return e.endsWith("*") ? (r.push("*"), i += e === "*" || e === "/*" ? "(.*)$" : "(?:\\/(.+)|\\/*)$") : n ? i += "\\/*$" : e !== "" && e !== "/" && (i += "(?:(?=\\/|$))"), [new RegExp(i, t ? void 0 : "i"), r]
}

function oy(e) {
    try {
        return decodeURI(e)
    } catch (t) {
        return Pu(!1, 'The URL path "' + e + '" could not be decoded because it is is a malformed URL segment. This is probably due to a bad percent ' + ("encoding (" + t + ").")), e
    }
}

function sy(e, t) {
    try {
        return decodeURIComponent(e)
    } catch (n) {
        return Pu(!1, 'The value for the URL param "' + t + '" will not be decoded because' + (' the string "' + e + '" is a malformed URL segment. This is probably') + (" due to a bad percent encoding (" + n + ").")), e
    }
}

function Fh(e, t) {
    if (t === "/") return e;
    if (!e.toLowerCase().startsWith(t.toLowerCase())) return null;
    let n = t.endsWith("/") ? t.length - 1 : t.length,
        r = e.charAt(n);
    return r && r !== "/" ? null : e.slice(n) || "/"
}

function Pu(e, t) {
    if (!e) {
        typeof console != "undefined" && console.warn(t);
        try {
            throw new Error(t)
        } catch {}
    }
}

function ly(e, t) {
    t === void 0 && (t = "/");
    let {
        pathname: n,
        search: r = "",
        hash: i = ""
    } = typeof e == "string" ? _n(e) : e;
    return {
        pathname: n ? n.startsWith("/") ? n : ay(n, t) : t,
        search: cy(r),
        hash: fy(i)
    }
}

function ay(e, t) {
    let n = t.replace(/\/+$/, "").split("/");
    return e.split("/").forEach(i => {
        i === ".." ? n.length > 1 && n.pop() : i !== "." && n.push(i)
    }), n.length > 1 ? n.join("/") : "/"
}

function qs(e, t, n, r) {
    return "Cannot include a '" + e + "' character in a manually specified " + ("`to." + t + "` field [" + JSON.stringify(r) + "].  Please separate it out to the ") + ("`to." + n + "` field. Alternatively you may provide the full path as ") + 'a string in <Link to="..."> and the router will parse it for you.'
}

function jh(e) {
    return e.filter((t, n) => n === 0 || t.route.path && t.route.path.length > 0)
}

function zh(e, t, n, r) {
    r === void 0 && (r = !1);
    let i;
    typeof e == "string" ? i = _n(e) : (i = hi({}, e), ce(!i.pathname || !i.pathname.includes("?"), qs("?", "pathname", "search", i)), ce(!i.pathname || !i.pathname.includes("#"), qs("#", "pathname", "hash", i)), ce(!i.search || !i.search.includes("#"), qs("#", "search", "hash", i)));
    let o = e === "" || i.pathname === "",
        s = o ? "/" : i.pathname,
        l;
    if (r || s == null) l = n;
    else {
        let f = t.length - 1;
        if (s.startsWith("..")) {
            let d = s.split("/");
            for (; d[0] === "..";) d.shift(), f -= 1;
            i.pathname = d.join("/")
        }
        l = f >= 0 ? t[f] : "/"
    }
    let a = ly(i, l),
        u = s && s !== "/" && s.endsWith("/"),
        c = (o || s === ".") && n.endsWith("/");
    return !a.pathname.endsWith("/") && (u || c) && (a.pathname += "/"), a
}
const tn = e => e.join("/").replace(/\/\/+/g, "/"),
    uy = e => e.replace(/\/+$/, "").replace(/^\/*/, "/"),
    cy = e => !e || e === "?" ? "" : e.startsWith("?") ? e : "?" + e,
    fy = e => !e || e === "#" ? "" : e.startsWith("#") ? e : "#" + e;

function dy(e) {
    return e != null && typeof e.status == "number" && typeof e.statusText == "string" && typeof e.internal == "boolean" && "data" in e
}
const py = ["post", "put", "patch", "delete"];
[...py];
/**
 * React Router v6.8.1
 *
 * Copyright (c) Remix Software Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE.md file in the root directory of this source tree.
 *
 * @license MIT
 */
function ua() {
    return ua = Object.assign ? Object.assign.bind() : function(e) {
        for (var t = 1; t < arguments.length; t++) {
            var n = arguments[t];
            for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (e[r] = n[r])
        }
        return e
    }, ua.apply(this, arguments)
}

function hy(e, t) {
    return e === t && (e !== 0 || 1 / e === 1 / t) || e !== e && t !== t
}
const my = typeof Object.is == "function" ? Object.is : hy,
    {
        useState: vy,
        useEffect: gy,
        useLayoutEffect: yy,
        useDebugValue: wy
    } = hl;

function xy(e, t, n) {
    const r = t(),
        [{
            inst: i
        }, o] = vy({
            inst: {
                value: r,
                getSnapshot: t
            }
        });
    return yy(() => {
        i.value = r, i.getSnapshot = t, el(i) && o({
            inst: i
        })
    }, [e, r, t]), gy(() => (el(i) && o({
        inst: i
    }), e(() => {
        el(i) && o({
            inst: i
        })
    })), [e]), wy(r), r
}

function el(e) {
    const t = e.getSnapshot,
        n = e.value;
    try {
        const r = t();
        return !my(n, r)
    } catch {
        return !0
    }
}

function Sy(e, t, n) {
    return t()
}
const Cy = typeof window != "undefined" && typeof window.document != "undefined" && typeof window.document.createElement != "undefined",
    ky = !Cy,
    Py = ky ? Sy : xy;
"useSyncExternalStore" in hl && (e => e.useSyncExternalStore)(hl);
const Bh = S.exports.createContext(null),
    Eu = S.exports.createContext(null),
    vs = S.exports.createContext(null),
    gs = S.exports.createContext(null),
    Dn = S.exports.createContext({
        outlet: null,
        matches: []
    }),
    Uh = S.exports.createContext(null);

function Ey(e, t) {
    let {
        relative: n
    } = t === void 0 ? {} : t;
    yr() || ce(!1);
    let {
        basename: r,
        navigator: i
    } = S.exports.useContext(vs), {
        hash: o,
        pathname: s,
        search: l
    } = $h(e, {
        relative: n
    }), a = s;
    return r !== "/" && (a = s === "/" ? r : tn([r, s])), i.createHref({
        pathname: a,
        search: l,
        hash: o
    })
}

function yr() {
    return S.exports.useContext(gs) != null
}

function Ei() {
    return yr() || ce(!1), S.exports.useContext(gs).location
}

function Vn() {
    yr() || ce(!1);
    let {
        basename: e,
        navigator: t
    } = S.exports.useContext(vs), {
        matches: n
    } = S.exports.useContext(Dn), {
        pathname: r
    } = Ei(), i = JSON.stringify(jh(n).map(l => l.pathnameBase)), o = S.exports.useRef(!1);
    return S.exports.useEffect(() => {
        o.current = !0
    }), S.exports.useCallback(function(l, a) {
        if (a === void 0 && (a = {}), !o.current) return;
        if (typeof l == "number") {
            t.go(l);
            return
        }
        let u = zh(l, JSON.parse(i), r, a.relative === "path");
        e !== "/" && (u.pathname = u.pathname === "/" ? e : tn([e, u.pathname])), (a.replace ? t.replace : t.push)(u, a.state, a)
    }, [e, t, i, r])
}
const Ny = S.exports.createContext(null);

function Ty(e) {
    let t = S.exports.useContext(Dn).outlet;
    return t && S.exports.createElement(Ny.Provider, {
        value: e
    }, t)
}

function $h(e, t) {
    let {
        relative: n
    } = t === void 0 ? {} : t, {
        matches: r
    } = S.exports.useContext(Dn), {
        pathname: i
    } = Ei(), o = JSON.stringify(jh(r).map(s => s.pathnameBase));
    return S.exports.useMemo(() => zh(e, JSON.parse(o), i, n === "path"), [e, o, i, n])
}

function Ly(e, t) {
    yr() || ce(!1);
    let {
        navigator: n
    } = S.exports.useContext(vs), r = S.exports.useContext(Eu), {
        matches: i
    } = S.exports.useContext(Dn), o = i[i.length - 1], s = o ? o.params : {};
    o && o.pathname;
    let l = o ? o.pathnameBase : "/";
    o && o.route;
    let a = Ei(),
        u;
    if (t) {
        var c;
        let w = typeof t == "string" ? _n(t) : t;
        l === "/" || ((c = w.pathname) == null ? void 0 : c.startsWith(l)) || ce(!1), u = w
    } else u = a;
    let f = u.pathname || "/",
        d = l === "/" ? f : f.slice(l.length) || "/",
        m = K0(e, {
            pathname: d
        }),
        g = Vy(m && m.map(w => Object.assign({}, w, {
            params: Object.assign({}, s, w.params),
            pathname: tn([l, n.encodeLocation ? n.encodeLocation(w.pathname).pathname : w.pathname]),
            pathnameBase: w.pathnameBase === "/" ? l : tn([l, n.encodeLocation ? n.encodeLocation(w.pathnameBase).pathname : w.pathnameBase])
        })), i, r || void 0);
    return t && g ? S.exports.createElement(gs.Provider, {
        value: {
            location: ua({
                pathname: "/",
                search: "",
                hash: "",
                state: null,
                key: "default"
            }, u),
            navigationType: Wt.Pop
        }
    }, g) : g
}

function Ry() {
    let e = Iy(),
        t = dy(e) ? e.status + " " + e.statusText : e instanceof Error ? e.message : JSON.stringify(e),
        n = e instanceof Error ? e.stack : null,
        i = {
            padding: "0.5rem",
            backgroundColor: "rgba(200,200,200, 0.5)"
        },
        o = null;
    return S.exports.createElement(S.exports.Fragment, null, S.exports.createElement("h2", null, "Unexpected Application Error!"), S.exports.createElement("h3", {
        style: {
            fontStyle: "italic"
        }
    }, t), n ? S.exports.createElement("pre", {
        style: i
    }, n) : null, o)
}
class _y extends S.exports.Component {
    constructor(t) {
        super(t), this.state = {
            location: t.location,
            error: t.error
        }
    }
    static getDerivedStateFromError(t) {
        return {
            error: t
        }
    }
    static getDerivedStateFromProps(t, n) {
        return n.location !== t.location ? {
            error: t.error,
            location: t.location
        } : {
            error: t.error || n.error,
            location: n.location
        }
    }
    componentDidCatch(t, n) {
        console.error("React Router caught the following error during render", t, n)
    }
    render() {
        return this.state.error ? S.exports.createElement(Dn.Provider, {
            value: this.props.routeContext
        }, S.exports.createElement(Uh.Provider, {
            value: this.state.error,
            children: this.props.component
        })) : this.props.children
    }
}

function Dy(e) {
    let {
        routeContext: t,
        match: n,
        children: r
    } = e, i = S.exports.useContext(Bh);
    return i && i.static && i.staticContext && n.route.errorElement && (i.staticContext._deepestRenderedBoundaryId = n.route.id), S.exports.createElement(Dn.Provider, {
        value: t
    }, r)
}

function Vy(e, t, n) {
    if (t === void 0 && (t = []), e == null)
        if (n != null && n.errors) e = n.matches;
        else return null;
    let r = e,
        i = n == null ? void 0 : n.errors;
    if (i != null) {
        let o = r.findIndex(s => s.route.id && (i == null ? void 0 : i[s.route.id]));
        o >= 0 || ce(!1), r = r.slice(0, Math.min(r.length, o + 1))
    }
    return r.reduceRight((o, s, l) => {
        let a = s.route.id ? i == null ? void 0 : i[s.route.id] : null,
            u = n ? s.route.errorElement || S.exports.createElement(Ry, null) : null,
            c = t.concat(r.slice(0, l + 1)),
            f = () => S.exports.createElement(Dy, {
                match: s,
                routeContext: {
                    outlet: o,
                    matches: c
                }
            }, a ? u : s.route.element !== void 0 ? s.route.element : o);
        return n && (s.route.errorElement || l === 0) ? S.exports.createElement(_y, {
            location: n.location,
            component: u,
            error: a,
            children: f(),
            routeContext: {
                outlet: null,
                matches: c
            }
        }) : f()
    }, null)
}
var mf;
(function(e) {
    e.UseBlocker = "useBlocker", e.UseRevalidator = "useRevalidator"
})(mf || (mf = {}));
var jo;
(function(e) {
    e.UseLoaderData = "useLoaderData", e.UseActionData = "useActionData", e.UseRouteError = "useRouteError", e.UseNavigation = "useNavigation", e.UseRouteLoaderData = "useRouteLoaderData", e.UseMatches = "useMatches", e.UseRevalidator = "useRevalidator"
})(jo || (jo = {}));

function Ay(e) {
    let t = S.exports.useContext(Eu);
    return t || ce(!1), t
}

function My(e) {
    let t = S.exports.useContext(Dn);
    return t || ce(!1), t
}

function Oy(e) {
    let t = My(),
        n = t.matches[t.matches.length - 1];
    return n.route.id || ce(!1), n.route.id
}

function Iy() {
    var e;
    let t = S.exports.useContext(Uh),
        n = Ay(jo.UseRouteError),
        r = Oy(jo.UseRouteError);
    return t || ((e = n.errors) == null ? void 0 : e[r])
}

function Fy(e) {
    let {
        to: t,
        replace: n,
        state: r,
        relative: i
    } = e;
    yr() || ce(!1);
    let o = S.exports.useContext(Eu),
        s = Vn();
    return S.exports.useEffect(() => {
        o && o.navigation.state !== "idle" || s(t, {
            replace: n,
            state: r,
            relative: i
        })
    }), null
}

function jy(e) {
    return Ty(e.context)
}

function ut(e) {
    ce(!1)
}

function zy(e) {
    let {
        basename: t = "/",
        children: n = null,
        location: r,
        navigationType: i = Wt.Pop,
        navigator: o,
        static: s = !1
    } = e;
    yr() && ce(!1);
    let l = t.replace(/^\/*/, "/"),
        a = S.exports.useMemo(() => ({
            basename: l,
            navigator: o,
            static: s
        }), [l, o, s]);
    typeof r == "string" && (r = _n(r));
    let {
        pathname: u = "/",
        search: c = "",
        hash: f = "",
        state: d = null,
        key: m = "default"
    } = r, g = S.exports.useMemo(() => {
        let w = Fh(u, l);
        return w == null ? null : {
            pathname: w,
            search: c,
            hash: f,
            state: d,
            key: m
        }
    }, [l, u, c, f, d, m]);
    return g == null ? null : S.exports.createElement(vs.Provider, {
        value: a
    }, S.exports.createElement(gs.Provider, {
        children: n,
        value: {
            location: g,
            navigationType: i
        }
    }))
}

function By(e) {
    let {
        children: t,
        location: n
    } = e, r = S.exports.useContext(Bh), i = r && !t ? r.router.routes : ca(t);
    return Ly(i, n)
}
var vf;
(function(e) {
    e[e.pending = 0] = "pending", e[e.success = 1] = "success", e[e.error = 2] = "error"
})(vf || (vf = {}));
new Promise(() => {});

function ca(e, t) {
    t === void 0 && (t = []);
    let n = [];
    return S.exports.Children.forEach(e, (r, i) => {
        if (!S.exports.isValidElement(r)) return;
        if (r.type === S.exports.Fragment) {
            n.push.apply(n, ca(r.props.children, t));
            return
        }
        r.type !== ut && ce(!1), !r.props.index || !r.props.children || ce(!1);
        let o = [...t, i],
            s = {
                id: r.props.id || o.join("-"),
                caseSensitive: r.props.caseSensitive,
                element: r.props.element,
                index: r.props.index,
                path: r.props.path,
                loader: r.props.loader,
                action: r.props.action,
                errorElement: r.props.errorElement,
                hasErrorBoundary: r.props.errorElement != null,
                shouldRevalidate: r.props.shouldRevalidate,
                handle: r.props.handle
            };
        r.props.children && (s.children = ca(r.props.children, o)), n.push(s)
    }), n
}
/**
 * React Router DOM v6.8.1
 *
 * Copyright (c) Remix Software Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE.md file in the root directory of this source tree.
 *
 * @license MIT
 */
function fa() {
    return fa = Object.assign ? Object.assign.bind() : function(e) {
        for (var t = 1; t < arguments.length; t++) {
            var n = arguments[t];
            for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (e[r] = n[r])
        }
        return e
    }, fa.apply(this, arguments)
}

function Uy(e, t) {
    if (e == null) return {};
    var n = {},
        r = Object.keys(e),
        i, o;
    for (o = 0; o < r.length; o++) i = r[o], !(t.indexOf(i) >= 0) && (n[i] = e[i]);
    return n
}

function $y(e) {
    return !!(e.metaKey || e.altKey || e.ctrlKey || e.shiftKey)
}

function by(e, t) {
    return e.button === 0 && (!t || t === "_self") && !$y(e)
}
const Hy = ["onClick", "relative", "reloadDocument", "replace", "state", "target", "to", "preventScrollReset"];

function Wy(e) {
    let {
        basename: t,
        children: n,
        window: r
    } = e, i = S.exports.useRef();
    i.current == null && (i.current = $0({
        window: r,
        v5Compat: !0
    }));
    let o = i.current,
        [s, l] = S.exports.useState({
            action: o.action,
            location: o.location
        });
    return S.exports.useLayoutEffect(() => o.listen(l), [o]), S.exports.createElement(zy, {
        basename: t,
        children: n,
        location: s.location,
        navigationType: s.action,
        navigator: o
    })
}
const Ky = typeof window != "undefined" && typeof window.document != "undefined" && typeof window.document.createElement != "undefined",
    Qy = S.exports.forwardRef(function(t, n) {
        let {
            onClick: r,
            relative: i,
            reloadDocument: o,
            replace: s,
            state: l,
            target: a,
            to: u,
            preventScrollReset: c
        } = t, f = Uy(t, Hy), d, m = !1;
        if (Ky && typeof u == "string" && /^(?:[a-z][a-z0-9+.-]*:|\/\/)/i.test(u)) {
            d = u;
            let h = new URL(window.location.href),
                p = u.startsWith("//") ? new URL(h.protocol + u) : new URL(u);
            p.origin === h.origin ? u = p.pathname + p.search + p.hash : m = !0
        }
        let g = Ey(u, {
                relative: i
            }),
            w = Gy(u, {
                replace: s,
                state: l,
                target: a,
                preventScrollReset: c,
                relative: i
            });

        function k(h) {
            r && r(h), h.defaultPrevented || w(h)
        }
        return S.exports.createElement("a", fa({}, f, {
            href: d || g,
            onClick: m || o ? r : k,
            ref: n,
            target: a
        }))
    });
var gf;
(function(e) {
    e.UseScrollRestoration = "useScrollRestoration", e.UseSubmitImpl = "useSubmitImpl", e.UseFetcher = "useFetcher"
})(gf || (gf = {}));
var yf;
(function(e) {
    e.UseFetchers = "useFetchers", e.UseScrollRestoration = "useScrollRestoration"
})(yf || (yf = {}));

function Gy(e, t) {
    let {
        target: n,
        replace: r,
        state: i,
        preventScrollReset: o,
        relative: s
    } = t === void 0 ? {} : t, l = Vn(), a = Ei(), u = $h(e, {
        relative: s
    });
    return S.exports.useCallback(c => {
        if (by(c, n)) {
            c.preventDefault();
            let f = r !== void 0 ? r : Fo(a) === Fo(u);
            l(e, {
                replace: f,
                state: i,
                preventScrollReset: o,
                relative: s
            })
        }
    }, [a, l, u, r, i, n, e, o, s])
}
const Nu = ({
    className: e,
    children: t
}) => V("div", {
    className: `${e} modal-bg relative`,
    children: [y("div", {
        className: "w-full h-1/2 absolute bottom-0 gradient-bg"
    }), y("div", {
        className: "w-full h-full px-[2.136vw] absolute flex flex-col items-center",
        children: t
    })]
});
var Yy = "./assets/close-icon.7e4ff5fb.svg";
const Tu = e => {
        const {
            setVisible: t
        } = Pi();

        function n() {
            Re("close", {}, !0), t(!1)
        }
        return y("button", {
            onClick: n,
            className: `${e.className} w-[1.667vw] h-[1.667vw] bg-closeFrame rounded-[0.156vw] flex justify-center items-center cursor-pointer hover:opacity-[.7] transition-opacity absolute m-[1.042vw] top-0 right-0`,
            children: y("img", {
                className: "h-[0.625vw]",
                src: Yy
            })
        })
    },
    bh = S.exports.createContext(null),
    Xy = ({
        children: e
    }) => {
        const [t, n] = S.exports.useState([]);
        return y(bh.Provider, {
            value: {
                help: t,
                setHelp: n
            },
            children: e
        })
    },
    wr = () => S.exports.useContext(bh),
    Zy = ({
        data: e
    }) => {
        const {
            help: t,
            setHelp: n
        } = wr(), r = Vn();

        function i() {
            const o = {
                ...t
            };
            o.selected = e, n(o), r("/denounce")
        }
        return V("div", {
            onClick: i,
            className: "w-full cursor-pointer desc-container flex flex-col p-[1.042vw]",
            children: [y("h1", {
                className: "container-title",
                children: e.title
            }), y("p", {
                className: "text-white/[.2] font-normal text-[0.625vw]",
                dangerouslySetInnerHTML: {
                    __html: e.description.substring(0, 175)
                }
            })]
        })
    },
    Lu = S.exports.createContext({
        transformPagePoint: e => e,
        isStatic: !1,
        reducedMotion: "never"
    }),
    ys = S.exports.createContext({});

function Jy() {
    return S.exports.useContext(ys).visualElement
}
const ws = S.exports.createContext(null),
    An = typeof document != "undefined",
    tl = An ? S.exports.useLayoutEffect : S.exports.useEffect,
    Hh = S.exports.createContext({
        strict: !1
    });

function qy(e, t, n, r) {
    const i = Jy(),
        o = S.exports.useContext(Hh),
        s = S.exports.useContext(ws),
        l = S.exports.useContext(Lu).reducedMotion,
        a = S.exports.useRef();
    r = r || o.renderer, !a.current && r && (a.current = r(e, {
        visualState: t,
        parent: i,
        props: n,
        presenceId: s ? s.id : void 0,
        blockInitialAnimation: s ? s.initial === !1 : !1,
        reducedMotionConfig: l
    }));
    const u = a.current;
    return tl(() => {
        u && u.render()
    }), tl(() => {
        u && u.animationState && u.animationState.animateChanges()
    }), tl(() => () => u && u.notify("Unmount"), []), u
}

function Xn(e) {
    return typeof e == "object" && Object.prototype.hasOwnProperty.call(e, "current")
}

function e1(e, t, n) {
    return S.exports.useCallback(r => {
        r && e.mount && e.mount(r), t && (r ? t.mount(r) : t.unmount()), n && (typeof n == "function" ? n(r) : Xn(n) && (n.current = r))
    }, [t])
}

function mi(e) {
    return typeof e == "string" || Array.isArray(e)
}

function xs(e) {
    return typeof e == "object" && typeof e.start == "function"
}
const t1 = ["initial", "animate", "exit", "whileHover", "whileDrag", "whileTap", "whileFocus", "whileInView"];

function Ss(e) {
    return xs(e.animate) || t1.some(t => mi(e[t]))
}

function Wh(e) {
    return Boolean(Ss(e) || e.variants)
}

function n1(e, t) {
    if (Ss(e)) {
        const {
            initial: n,
            animate: r
        } = e;
        return {
            initial: n === !1 || mi(n) ? n : void 0,
            animate: mi(r) ? r : void 0
        }
    }
    return e.inherit !== !1 ? t : {}
}

function r1(e) {
    const {
        initial: t,
        animate: n
    } = n1(e, S.exports.useContext(ys));
    return S.exports.useMemo(() => ({
        initial: t,
        animate: n
    }), [wf(t), wf(n)])
}

function wf(e) {
    return Array.isArray(e) ? e.join(" ") : e
}
const wt = e => ({
        isEnabled: t => e.some(n => !!t[n])
    }),
    vi = {
        measureLayout: wt(["layout", "layoutId", "drag"]),
        animation: wt(["animate", "exit", "variants", "whileHover", "whileTap", "whileFocus", "whileDrag", "whileInView"]),
        exit: wt(["exit"]),
        drag: wt(["drag", "dragControls"]),
        focus: wt(["whileFocus"]),
        hover: wt(["whileHover", "onHoverStart", "onHoverEnd"]),
        tap: wt(["whileTap", "onTap", "onTapStart", "onTapCancel"]),
        pan: wt(["onPan", "onPanStart", "onPanSessionStart", "onPanEnd"]),
        inView: wt(["whileInView", "onViewportEnter", "onViewportLeave"])
    };

function i1(e) {
    for (const t in e) t === "projectionNodeConstructor" ? vi.projectionNodeConstructor = e[t] : vi[t].Component = e[t]
}

function Ru(e) {
    const t = S.exports.useRef(null);
    return t.current === null && (t.current = e()), t.current
}
const Wr = {
    hasAnimatedSinceResize: !0,
    hasEverUpdated: !1
};
let o1 = 1;

function s1() {
    return Ru(() => {
        if (Wr.hasEverUpdated) return o1++
    })
}
const Kh = S.exports.createContext({});
class l1 extends Jo.Component {
    getSnapshotBeforeUpdate() {
        const {
            visualElement: t,
            props: n
        } = this.props;
        return t && t.setProps(n), null
    }
    componentDidUpdate() {}
    render() {
        return this.props.children
    }
}
const Qh = S.exports.createContext({}),
    a1 = Symbol.for("motionComponentSymbol");

function u1({
    preloadedFeatures: e,
    createVisualElement: t,
    projectionNodeConstructor: n,
    useRender: r,
    useVisualState: i,
    Component: o
}) {
    e && i1(e);

    function s(a, u) {
        const c = {
                ...S.exports.useContext(Lu),
                ...a,
                layoutId: c1(a)
            },
            {
                isStatic: f
            } = c;
        let d = null;
        const m = r1(a),
            g = f ? void 0 : s1(),
            w = i(a, f);
        if (!f && An) {
            m.visualElement = qy(o, w, c, t);
            const k = S.exports.useContext(Hh).strict,
                h = S.exports.useContext(Qh);
            m.visualElement && (d = m.visualElement.loadFeatures(c, k, e, g, n || vi.projectionNodeConstructor, h))
        }
        return S.exports.createElement(l1, {
            visualElement: m.visualElement,
            props: c
        }, d, S.exports.createElement(ys.Provider, {
            value: m
        }, r(o, a, g, e1(w, m.visualElement, u), w, f, m.visualElement)))
    }
    const l = S.exports.forwardRef(s);
    return l[a1] = o, l
}

function c1({
    layoutId: e
}) {
    const t = S.exports.useContext(Kh).id;
    return t && e !== void 0 ? t + "-" + e : e
}

function f1(e) {
    function t(r, i = {}) {
        return u1(e(r, i))
    }
    if (typeof Proxy == "undefined") return t;
    const n = new Map;
    return new Proxy(t, {
        get: (r, i) => (n.has(i) || n.set(i, t(i)), n.get(i))
    })
}
const d1 = ["animate", "circle", "defs", "desc", "ellipse", "g", "image", "line", "filter", "marker", "mask", "metadata", "path", "pattern", "polygon", "polyline", "rect", "stop", "switch", "symbol", "svg", "text", "tspan", "use", "view"];

function _u(e) {
    return typeof e != "string" || e.includes("-") ? !1 : !!(d1.indexOf(e) > -1 || /[A-Z]/.test(e))
}
const zo = {};

function p1(e) {
    Object.assign(zo, e)
}
const Bo = ["transformPerspective", "x", "y", "z", "translateX", "translateY", "translateZ", "scale", "scaleX", "scaleY", "rotate", "rotateX", "rotateY", "rotateZ", "skew", "skewX", "skewY"],
    Mn = new Set(Bo);

function Gh(e, {
    layout: t,
    layoutId: n
}) {
    return Mn.has(e) || e.startsWith("origin") || (t || n !== void 0) && (!!zo[e] || e === "opacity")
}
const gt = e => !!(e != null && e.getVelocity),
    h1 = {
        x: "translateX",
        y: "translateY",
        z: "translateZ",
        transformPerspective: "perspective"
    },
    m1 = (e, t) => Bo.indexOf(e) - Bo.indexOf(t);

function v1({
    transform: e,
    transformKeys: t
}, {
    enableHardwareAcceleration: n = !0,
    allowTransformNone: r = !0
}, i, o) {
    let s = "";
    t.sort(m1);
    for (const l of t) s += `${h1[l]||l}(${e[l]}) `;
    return n && !e.z && (s += "translateZ(0)"), s = s.trim(), o ? s = o(e, i ? "" : s) : r && i && (s = "none"), s
}

function Yh(e) {
    return e.startsWith("--")
}
const g1 = (e, t) => t && typeof e == "number" ? t.transform(e) : e,
    pr = (e, t, n) => Math.min(Math.max(n, e), t),
    On = {
        test: e => typeof e == "number",
        parse: parseFloat,
        transform: e => e
    },
    Kr = {
        ...On,
        transform: e => pr(0, 1, e)
    },
    Qi = {
        ...On,
        default: 1
    },
    Qr = e => Math.round(e * 1e5) / 1e5,
    gi = /(-)?([\d]*\.?[\d])+/g,
    da = /(#[0-9a-f]{6}|#[0-9a-f]{3}|#(?:[0-9a-f]{2}){2,4}|(rgb|hsl)a?\((-?[\d\.]+%?[,\s]+){2}(-?[\d\.]+%?)\s*[\,\/]?\s*[\d\.]*%?\))/gi,
    y1 = /^(#[0-9a-f]{3}|#(?:[0-9a-f]{2}){2,4}|(rgb|hsl)a?\((-?[\d\.]+%?[,\s]+){2}(-?[\d\.]+%?)\s*[\,\/]?\s*[\d\.]*%?\))$/i;

function Ni(e) {
    return typeof e == "string"
}
const Ti = e => ({
        test: t => Ni(t) && t.endsWith(e) && t.split(" ").length === 1,
        parse: parseFloat,
        transform: t => `${t}${e}`
    }),
    Ft = Ti("deg"),
    mt = Ti("%"),
    z = Ti("px"),
    w1 = Ti("vh"),
    x1 = Ti("vw"),
    xf = {
        ...mt,
        parse: e => mt.parse(e) / 100,
        transform: e => mt.transform(e * 100)
    },
    Sf = {
        ...On,
        transform: Math.round
    },
    Xh = {
        borderWidth: z,
        borderTopWidth: z,
        borderRightWidth: z,
        borderBottomWidth: z,
        borderLeftWidth: z,
        borderRadius: z,
        radius: z,
        borderTopLeftRadius: z,
        borderTopRightRadius: z,
        borderBottomRightRadius: z,
        borderBottomLeftRadius: z,
        width: z,
        maxWidth: z,
        height: z,
        maxHeight: z,
        size: z,
        top: z,
        right: z,
        bottom: z,
        left: z,
        padding: z,
        paddingTop: z,
        paddingRight: z,
        paddingBottom: z,
        paddingLeft: z,
        margin: z,
        marginTop: z,
        marginRight: z,
        marginBottom: z,
        marginLeft: z,
        rotate: Ft,
        rotateX: Ft,
        rotateY: Ft,
        rotateZ: Ft,
        scale: Qi,
        scaleX: Qi,
        scaleY: Qi,
        scaleZ: Qi,
        skew: Ft,
        skewX: Ft,
        skewY: Ft,
        distance: z,
        translateX: z,
        translateY: z,
        translateZ: z,
        x: z,
        y: z,
        z,
        perspective: z,
        transformPerspective: z,
        opacity: Kr,
        originX: xf,
        originY: xf,
        originZ: z,
        zIndex: Sf,
        fillOpacity: Kr,
        strokeOpacity: Kr,
        numOctaves: Sf
    };

function Du(e, t, n, r) {
    const {
        style: i,
        vars: o,
        transform: s,
        transformKeys: l,
        transformOrigin: a
    } = e;
    l.length = 0;
    let u = !1,
        c = !1,
        f = !0;
    for (const d in t) {
        const m = t[d];
        if (Yh(d)) {
            o[d] = m;
            continue
        }
        const g = Xh[d],
            w = g1(m, g);
        if (Mn.has(d)) {
            if (u = !0, s[d] = w, l.push(d), !f) continue;
            m !== (g.default || 0) && (f = !1)
        } else d.startsWith("origin") ? (c = !0, a[d] = w) : i[d] = w
    }
    if (t.transform || (u || r ? i.transform = v1(e, n, f, r) : i.transform && (i.transform = "none")), c) {
        const {
            originX: d = "50%",
            originY: m = "50%",
            originZ: g = 0
        } = a;
        i.transformOrigin = `${d} ${m} ${g}`
    }
}
const Vu = () => ({
    style: {},
    transform: {},
    transformKeys: [],
    transformOrigin: {},
    vars: {}
});

function Zh(e, t, n) {
    for (const r in t) !gt(t[r]) && !Gh(r, n) && (e[r] = t[r])
}

function S1({
    transformTemplate: e
}, t, n) {
    return S.exports.useMemo(() => {
        const r = Vu();
        return Du(r, t, {
            enableHardwareAcceleration: !n
        }, e), Object.assign({}, r.vars, r.style)
    }, [t])
}

function C1(e, t, n) {
    const r = e.style || {},
        i = {};
    return Zh(i, r, e), Object.assign(i, S1(e, t, n)), e.transformValues ? e.transformValues(i) : i
}

function k1(e, t, n) {
    const r = {},
        i = C1(e, t, n);
    return e.drag && e.dragListener !== !1 && (r.draggable = !1, i.userSelect = i.WebkitUserSelect = i.WebkitTouchCallout = "none", i.touchAction = e.drag === !0 ? "none" : `pan-${e.drag==="x"?"y":"x"}`), r.style = i, r
}
const P1 = ["animate", "exit", "variants", "whileHover", "whileTap", "whileFocus", "whileDrag", "whileInView"],
    E1 = ["whileTap", "onTap", "onTapStart", "onTapCancel"],
    N1 = ["onPan", "onPanStart", "onPanSessionStart", "onPanEnd"],
    T1 = ["whileInView", "onViewportEnter", "onViewportLeave", "viewport"],
    L1 = new Set(["initial", "style", "values", "variants", "transition", "transformTemplate", "transformValues", "custom", "inherit", "layout", "layoutId", "layoutDependency", "onLayoutAnimationStart", "onLayoutAnimationComplete", "onLayoutMeasure", "onBeforeLayoutMeasure", "onAnimationStart", "onAnimationComplete", "onUpdate", "onDragStart", "onDrag", "onDragEnd", "onMeasureDragConstraints", "onDirectionLock", "onDragTransitionEnd", "drag", "dragControls", "dragListener", "dragConstraints", "dragDirectionLock", "dragSnapToOrigin", "_dragX", "_dragY", "dragElastic", "dragMomentum", "dragPropagation", "dragTransition", "onHoverStart", "onHoverEnd", "layoutScroll", ...T1, ...E1, ...P1, ...N1]);

function Uo(e) {
    return L1.has(e)
}
let Jh = e => !Uo(e);

function R1(e) {
    !e || (Jh = t => t.startsWith("on") ? !Uo(t) : e(t))
}
try {
    R1(require("@emotion/is-prop-valid").default)
} catch {}

function _1(e, t, n) {
    const r = {};
    for (const i in e)(Jh(i) || n === !0 && Uo(i) || !t && !Uo(i) || e.draggable && i.startsWith("onDrag")) && (r[i] = e[i]);
    return r
}

function Cf(e, t, n) {
    return typeof e == "string" ? e : z.transform(t + n * e)
}

function D1(e, t, n) {
    const r = Cf(t, e.x, e.width),
        i = Cf(n, e.y, e.height);
    return `${r} ${i}`
}
const V1 = {
        offset: "stroke-dashoffset",
        array: "stroke-dasharray"
    },
    A1 = {
        offset: "strokeDashoffset",
        array: "strokeDasharray"
    };

function M1(e, t, n = 1, r = 0, i = !0) {
    e.pathLength = 1;
    const o = i ? V1 : A1;
    e[o.offset] = z.transform(-r);
    const s = z.transform(t),
        l = z.transform(n);
    e[o.array] = `${s} ${l}`
}

function Au(e, {
    attrX: t,
    attrY: n,
    originX: r,
    originY: i,
    pathLength: o,
    pathSpacing: s = 1,
    pathOffset: l = 0,
    ...a
}, u, c, f) {
    if (Du(e, a, u, f), c) {
        e.style.viewBox && (e.attrs.viewBox = e.style.viewBox);
        return
    }
    e.attrs = e.style, e.style = {};
    const {
        attrs: d,
        style: m,
        dimensions: g
    } = e;
    d.transform && (g && (m.transform = d.transform), delete d.transform), g && (r !== void 0 || i !== void 0 || m.transform) && (m.transformOrigin = D1(g, r !== void 0 ? r : .5, i !== void 0 ? i : .5)), t !== void 0 && (d.x = t), n !== void 0 && (d.y = n), o !== void 0 && M1(d, o, s, l, !1)
}
const qh = () => ({
        ...Vu(),
        attrs: {}
    }),
    Mu = e => typeof e == "string" && e.toLowerCase() === "svg";

function O1(e, t, n, r) {
    const i = S.exports.useMemo(() => {
        const o = qh();
        return Au(o, t, {
            enableHardwareAcceleration: !1
        }, Mu(r), e.transformTemplate), {
            ...o.attrs,
            style: {
                ...o.style
            }
        }
    }, [t]);
    if (e.style) {
        const o = {};
        Zh(o, e.style, e), i.style = {
            ...o,
            ...i.style
        }
    }
    return i
}

function I1(e = !1) {
    return (n, r, i, o, {
        latestValues: s
    }, l) => {
        const u = (_u(n) ? O1 : k1)(r, s, l, n),
            f = {
                ..._1(r, typeof n == "string", e),
                ...u,
                ref: o
            };
        return i && (f["data-projection-id"] = i), S.exports.createElement(n, f)
    }
}
const Ou = e => e.replace(/([a-z])([A-Z])/g, "$1-$2").toLowerCase();

function em(e, {
    style: t,
    vars: n
}, r, i) {
    Object.assign(e.style, t, i && i.getProjectionStyles(r));
    for (const o in n) e.style.setProperty(o, n[o])
}
const tm = new Set(["baseFrequency", "diffuseConstant", "kernelMatrix", "kernelUnitLength", "keySplines", "keyTimes", "limitingConeAngle", "markerHeight", "markerWidth", "numOctaves", "targetX", "targetY", "surfaceScale", "specularConstant", "specularExponent", "stdDeviation", "tableValues", "viewBox", "gradientTransform", "pathLength", "startOffset", "textLength", "lengthAdjust"]);

function nm(e, t, n, r) {
    em(e, t, void 0, r);
    for (const i in t.attrs) e.setAttribute(tm.has(i) ? i : Ou(i), t.attrs[i])
}

function Iu(e) {
    const {
        style: t
    } = e, n = {};
    for (const r in t)(gt(t[r]) || Gh(r, e)) && (n[r] = t[r]);
    return n
}

function rm(e) {
    const t = Iu(e);
    for (const n in e)
        if (gt(e[n])) {
            const r = n === "x" || n === "y" ? "attr" + n.toUpperCase() : n;
            t[r] = e[n]
        }
    return t
}

function Fu(e, t, n, r = {}, i = {}) {
    return typeof t == "function" && (t = t(n !== void 0 ? n : e.custom, r, i)), typeof t == "string" && (t = e.variants && e.variants[t]), typeof t == "function" && (t = t(n !== void 0 ? n : e.custom, r, i)), t
}
const $o = e => Array.isArray(e),
    F1 = e => Boolean(e && typeof e == "object" && e.mix && e.toValue),
    j1 = e => $o(e) ? e[e.length - 1] || 0 : e;

function co(e) {
    const t = gt(e) ? e.get() : e;
    return F1(t) ? t.toValue() : t
}

function z1({
    scrapeMotionValuesFromProps: e,
    createRenderState: t,
    onMount: n
}, r, i, o) {
    const s = {
        latestValues: B1(r, i, o, e),
        renderState: t()
    };
    return n && (s.mount = l => n(r, l, s)), s
}
const im = e => (t, n) => {
    const r = S.exports.useContext(ys),
        i = S.exports.useContext(ws),
        o = () => z1(e, t, r, i);
    return n ? o() : Ru(o)
};

function B1(e, t, n, r) {
    const i = {},
        o = r(e);
    for (const d in o) i[d] = co(o[d]);
    let {
        initial: s,
        animate: l
    } = e;
    const a = Ss(e),
        u = Wh(e);
    t && u && !a && e.inherit !== !1 && (s === void 0 && (s = t.initial), l === void 0 && (l = t.animate));
    let c = n ? n.initial === !1 : !1;
    c = c || s === !1;
    const f = c ? l : s;
    return f && typeof f != "boolean" && !xs(f) && (Array.isArray(f) ? f : [f]).forEach(m => {
        const g = Fu(e, m);
        if (!g) return;
        const {
            transitionEnd: w,
            transition: k,
            ...h
        } = g;
        for (const p in h) {
            let v = h[p];
            if (Array.isArray(v)) {
                const x = c ? v.length - 1 : 0;
                v = v[x]
            }
            v !== null && (i[p] = v)
        }
        for (const p in w) i[p] = w[p]
    }), i
}
const U1 = {
        useVisualState: im({
            scrapeMotionValuesFromProps: rm,
            createRenderState: qh,
            onMount: (e, t, {
                renderState: n,
                latestValues: r
            }) => {
                try {
                    n.dimensions = typeof t.getBBox == "function" ? t.getBBox() : t.getBoundingClientRect()
                } catch {
                    n.dimensions = {
                        x: 0,
                        y: 0,
                        width: 0,
                        height: 0
                    }
                }
                Au(n, r, {
                    enableHardwareAcceleration: !1
                }, Mu(t.tagName), e.transformTemplate), nm(t, n)
            }
        })
    },
    $1 = {
        useVisualState: im({
            scrapeMotionValuesFromProps: Iu,
            createRenderState: Vu
        })
    };

function b1(e, {
    forwardMotionProps: t = !1
}, n, r, i) {
    return {
        ..._u(e) ? U1 : $1,
        preloadedFeatures: n,
        useRender: I1(t),
        createVisualElement: r,
        projectionNodeConstructor: i,
        Component: e
    }
}
var Q;
(function(e) {
    e.Animate = "animate", e.Hover = "whileHover", e.Tap = "whileTap", e.Drag = "whileDrag", e.Focus = "whileFocus", e.InView = "whileInView", e.Exit = "exit"
})(Q || (Q = {}));

function Cs(e, t, n, r = {
    passive: !0
}) {
    return e.addEventListener(t, n, r), () => e.removeEventListener(t, n)
}

function pa(e, t, n, r) {
    S.exports.useEffect(() => {
        const i = e.current;
        if (n && i) return Cs(i, t, n, r)
    }, [e, t, n, r])
}

function H1({
    whileFocus: e,
    visualElement: t
}) {
    const {
        animationState: n
    } = t, r = () => {
        n && n.setActive(Q.Focus, !0)
    }, i = () => {
        n && n.setActive(Q.Focus, !1)
    };
    pa(t, "focus", e ? r : void 0), pa(t, "blur", e ? i : void 0)
}

function om(e) {
    return typeof PointerEvent != "undefined" && e instanceof PointerEvent ? e.pointerType === "mouse" : e instanceof MouseEvent
}

function sm(e) {
    return !!e.touches
}

function W1(e) {
    return t => {
        const n = t instanceof MouseEvent;
        (!n || n && t.button === 0) && e(t)
    }
}
const K1 = {
    pageX: 0,
    pageY: 0
};

function Q1(e, t = "page") {
    const r = e.touches[0] || e.changedTouches[0] || K1;
    return {
        x: r[t + "X"],
        y: r[t + "Y"]
    }
}

function G1(e, t = "page") {
    return {
        x: e[t + "X"],
        y: e[t + "Y"]
    }
}

function ju(e, t = "page") {
    return {
        point: sm(e) ? Q1(e, t) : G1(e, t)
    }
}
const lm = (e, t = !1) => {
        const n = r => e(r, ju(r));
        return t ? W1(n) : n
    },
    Y1 = () => An && window.onpointerdown === null,
    X1 = () => An && window.ontouchstart === null,
    Z1 = () => An && window.onmousedown === null,
    J1 = {
        pointerdown: "mousedown",
        pointermove: "mousemove",
        pointerup: "mouseup",
        pointercancel: "mousecancel",
        pointerover: "mouseover",
        pointerout: "mouseout",
        pointerenter: "mouseenter",
        pointerleave: "mouseleave"
    },
    q1 = {
        pointerdown: "touchstart",
        pointermove: "touchmove",
        pointerup: "touchend",
        pointercancel: "touchcancel"
    };

function am(e) {
    return Y1() ? e : X1() ? q1[e] : Z1() ? J1[e] : e
}

function or(e, t, n, r) {
    return Cs(e, am(t), lm(n, t === "pointerdown"), r)
}

function bo(e, t, n, r) {
    return pa(e, am(t), n && lm(n, t === "pointerdown"), r)
}

function um(e) {
    let t = null;
    return () => {
        const n = () => {
            t = null
        };
        return t === null ? (t = e, n) : !1
    }
}
const kf = um("dragHorizontal"),
    Pf = um("dragVertical");

function cm(e) {
    let t = !1;
    if (e === "y") t = Pf();
    else if (e === "x") t = kf();
    else {
        const n = kf(),
            r = Pf();
        n && r ? t = () => {
            n(), r()
        } : (n && n(), r && r())
    }
    return t
}

function fm() {
    const e = cm(!0);
    return e ? (e(), !1) : !0
}

function Ef(e, t, n) {
    return (r, i) => {
        !om(r) || fm() || (e.animationState && e.animationState.setActive(Q.Hover, t), n && n(r, i))
    }
}

function ew({
    onHoverStart: e,
    onHoverEnd: t,
    whileHover: n,
    visualElement: r
}) {
    bo(r, "pointerenter", e || n ? Ef(r, !0, e) : void 0, {
        passive: !e
    }), bo(r, "pointerleave", t || n ? Ef(r, !1, t) : void 0, {
        passive: !t
    })
}
const dm = (e, t) => t ? e === t ? !0 : dm(e, t.parentElement) : !1;

function pm(e) {
    return S.exports.useEffect(() => () => e(), [])
}
const tw = (e, t) => n => t(e(n)),
    ks = (...e) => e.reduce(tw);

function nw({
    onTap: e,
    onTapStart: t,
    onTapCancel: n,
    whileTap: r,
    visualElement: i
}) {
    const o = e || t || n || r,
        s = S.exports.useRef(!1),
        l = S.exports.useRef(null),
        a = {
            passive: !(t || e || n || m)
        };

    function u() {
        l.current && l.current(), l.current = null
    }

    function c() {
        return u(), s.current = !1, i.animationState && i.animationState.setActive(Q.Tap, !1), !fm()
    }

    function f(g, w) {
        !c() || (dm(i.current, g.target) ? e && e(g, w) : n && n(g, w))
    }

    function d(g, w) {
        !c() || n && n(g, w)
    }

    function m(g, w) {
        u(), !s.current && (s.current = !0, l.current = ks(or(window, "pointerup", f, a), or(window, "pointercancel", d, a)), i.animationState && i.animationState.setActive(Q.Tap, !0), t && t(g, w))
    }
    bo(i, "pointerdown", o ? m : void 0, a), pm(u)
}
const rw = "production",
    iw = typeof process == "undefined" || process.env === void 0 ? rw : "production",
    Nf = new Set;

function ow(e, t, n) {
    e || Nf.has(t) || (console.warn(t), n && console.warn(n), Nf.add(t))
}
const ha = new WeakMap,
    nl = new WeakMap,
    sw = e => {
        const t = ha.get(e.target);
        t && t(e)
    },
    lw = e => {
        e.forEach(sw)
    };

function aw({
    root: e,
    ...t
}) {
    const n = e || document;
    nl.has(n) || nl.set(n, {});
    const r = nl.get(n),
        i = JSON.stringify(t);
    return r[i] || (r[i] = new IntersectionObserver(lw, {
        root: e,
        ...t
    })), r[i]
}

function uw(e, t, n) {
    const r = aw(t);
    return ha.set(e, n), r.observe(e), () => {
        ha.delete(e), r.unobserve(e)
    }
}

function cw({
    visualElement: e,
    whileInView: t,
    onViewportEnter: n,
    onViewportLeave: r,
    viewport: i = {}
}) {
    const o = S.exports.useRef({
        hasEnteredView: !1,
        isInView: !1
    });
    let s = Boolean(t || n || r);
    i.once && o.current.hasEnteredView && (s = !1), (typeof IntersectionObserver == "undefined" ? pw : dw)(s, o.current, e, i)
}
const fw = {
    some: 0,
    all: 1
};

function dw(e, t, n, {
    root: r,
    margin: i,
    amount: o = "some",
    once: s
}) {
    S.exports.useEffect(() => {
        if (!e || !n.current) return;
        const l = {
                root: r == null ? void 0 : r.current,
                rootMargin: i,
                threshold: typeof o == "number" ? o : fw[o]
            },
            a = u => {
                const {
                    isIntersecting: c
                } = u;
                if (t.isInView === c || (t.isInView = c, s && !c && t.hasEnteredView)) return;
                c && (t.hasEnteredView = !0), n.animationState && n.animationState.setActive(Q.InView, c);
                const f = n.getProps(),
                    d = c ? f.onViewportEnter : f.onViewportLeave;
                d && d(u)
            };
        return uw(n.current, l, a)
    }, [e, r, i, o])
}

function pw(e, t, n, {
    fallback: r = !0
}) {
    S.exports.useEffect(() => {
        !e || !r || (iw !== "production" && ow(!1, "IntersectionObserver not available on this device. whileInView animations will trigger on mount."), requestAnimationFrame(() => {
            t.hasEnteredView = !0;
            const {
                onViewportEnter: i
            } = n.getProps();
            i && i(null), n.animationState && n.animationState.setActive(Q.InView, !0)
        }))
    }, [e])
}
const Kt = e => t => (e(t), null),
    hw = {
        inView: Kt(cw),
        tap: Kt(nw),
        focus: Kt(H1),
        hover: Kt(ew)
    };

function hm() {
    const e = S.exports.useContext(ws);
    if (e === null) return [!0, null];
    const {
        isPresent: t,
        onExitComplete: n,
        register: r
    } = e, i = S.exports.useId();
    return S.exports.useEffect(() => r(i), []), !t && n ? [!1, () => n && n(i)] : [!0]
}

function mm(e, t) {
    if (!Array.isArray(t)) return !1;
    const n = t.length;
    if (n !== e.length) return !1;
    for (let r = 0; r < n; r++)
        if (t[r] !== e[r]) return !1;
    return !0
}
const mw = e => /^\-?\d*\.?\d+$/.test(e),
    vw = e => /^0[^.\s]+$/.test(e),
    Nt = {
        delta: 0,
        timestamp: 0
    },
    vm = 1 / 60 * 1e3,
    gw = typeof performance != "undefined" ? () => performance.now() : () => Date.now(),
    gm = typeof window != "undefined" ? e => window.requestAnimationFrame(e) : e => setTimeout(() => e(gw()), vm);

function yw(e) {
    let t = [],
        n = [],
        r = 0,
        i = !1,
        o = !1;
    const s = new WeakSet,
        l = {
            schedule: (a, u = !1, c = !1) => {
                const f = c && i,
                    d = f ? t : n;
                return u && s.add(a), d.indexOf(a) === -1 && (d.push(a), f && i && (r = t.length)), a
            },
            cancel: a => {
                const u = n.indexOf(a);
                u !== -1 && n.splice(u, 1), s.delete(a)
            },
            process: a => {
                if (i) {
                    o = !0;
                    return
                }
                if (i = !0, [t, n] = [n, t], n.length = 0, r = t.length, r)
                    for (let u = 0; u < r; u++) {
                        const c = t[u];
                        c(a), s.has(c) && (l.schedule(c), e())
                    }
                i = !1, o && (o = !1, l.process(a))
            }
        };
    return l
}
const ww = 40;
let ma = !0,
    yi = !1,
    va = !1;
const Li = ["read", "update", "preRender", "render", "postRender"],
    Ps = Li.reduce((e, t) => (e[t] = yw(() => yi = !0), e), {}),
    Ue = Li.reduce((e, t) => {
        const n = Ps[t];
        return e[t] = (r, i = !1, o = !1) => (yi || Sw(), n.schedule(r, i, o)), e
    }, {}),
    on = Li.reduce((e, t) => (e[t] = Ps[t].cancel, e), {}),
    rl = Li.reduce((e, t) => (e[t] = () => Ps[t].process(Nt), e), {}),
    xw = e => Ps[e].process(Nt),
    ym = e => {
        yi = !1, Nt.delta = ma ? vm : Math.max(Math.min(e - Nt.timestamp, ww), 1), Nt.timestamp = e, va = !0, Li.forEach(xw), va = !1, yi && (ma = !1, gm(ym))
    },
    Sw = () => {
        yi = !0, ma = !0, va || gm(ym)
    };

function zu(e, t) {
    e.indexOf(t) === -1 && e.push(t)
}

function Bu(e, t) {
    const n = e.indexOf(t);
    n > -1 && e.splice(n, 1)
}
class Uu {
    constructor() {
        this.subscriptions = []
    }
    add(t) {
        return zu(this.subscriptions, t), () => Bu(this.subscriptions, t)
    }
    notify(t, n, r) {
        const i = this.subscriptions.length;
        if (!!i)
            if (i === 1) this.subscriptions[0](t, n, r);
            else
                for (let o = 0; o < i; o++) {
                    const s = this.subscriptions[o];
                    s && s(t, n, r)
                }
    }
    getSize() {
        return this.subscriptions.length
    }
    clear() {
        this.subscriptions.length = 0
    }
}

function $u(e, t) {
    return t ? e * (1e3 / t) : 0
}
const Cw = e => !isNaN(parseFloat(e));
class kw {
    constructor(t, n = {}) {
        this.version = "7.10.3", this.timeDelta = 0, this.lastUpdated = 0, this.canTrackVelocity = !1, this.events = {}, this.updateAndNotify = (r, i = !0) => {
            this.prev = this.current, this.current = r;
            const {
                delta: o,
                timestamp: s
            } = Nt;
            this.lastUpdated !== s && (this.timeDelta = o, this.lastUpdated = s, Ue.postRender(this.scheduleVelocityCheck)), this.prev !== this.current && this.events.change && this.events.change.notify(this.current), this.events.velocityChange && this.events.velocityChange.notify(this.getVelocity()), i && this.events.renderRequest && this.events.renderRequest.notify(this.current)
        }, this.scheduleVelocityCheck = () => Ue.postRender(this.velocityCheck), this.velocityCheck = ({
            timestamp: r
        }) => {
            r !== this.lastUpdated && (this.prev = this.current, this.events.velocityChange && this.events.velocityChange.notify(this.getVelocity()))
        }, this.hasAnimated = !1, this.prev = this.current = t, this.canTrackVelocity = Cw(this.current), this.owner = n.owner
    }
    onChange(t) {
        return this.on("change", t)
    }
    on(t, n) {
        return this.events[t] || (this.events[t] = new Uu), this.events[t].add(n)
    }
    clearListeners() {
        for (const t in this.events) this.events[t].clear()
    }
    attach(t) {
        this.passiveEffect = t
    }
    set(t, n = !0) {
        !n || !this.passiveEffect ? this.updateAndNotify(t, n) : this.passiveEffect(t, this.updateAndNotify)
    }
    setWithVelocity(t, n, r) {
        this.set(n), this.prev = t, this.timeDelta = r
    }
    get() {
        return this.current
    }
    getPrevious() {
        return this.prev
    }
    getVelocity() {
        return this.canTrackVelocity ? $u(parseFloat(this.current) - parseFloat(this.prev), this.timeDelta) : 0
    }
    start(t) {
        return this.stop(), new Promise(n => {
            this.hasAnimated = !0, this.stopAnimation = t(n), this.events.animationStart && this.events.animationStart.notify()
        }).then(() => {
            this.events.animationComplete && this.events.animationComplete.notify(), this.clearAnimation()
        })
    }
    stop() {
        this.stopAnimation && (this.stopAnimation(), this.events.animationCancel && this.events.animationCancel.notify()), this.clearAnimation()
    }
    isAnimating() {
        return !!this.stopAnimation
    }
    clearAnimation() {
        this.stopAnimation = null
    }
    destroy() {
        this.clearListeners(), this.stop()
    }
}

function hr(e, t) {
    return new kw(e, t)
}
const bu = (e, t) => n => Boolean(Ni(n) && y1.test(n) && n.startsWith(e) || t && Object.prototype.hasOwnProperty.call(n, t)),
    wm = (e, t, n) => r => {
        if (!Ni(r)) return r;
        const [i, o, s, l] = r.match(gi);
        return {
            [e]: parseFloat(i),
            [t]: parseFloat(o),
            [n]: parseFloat(s),
            alpha: l !== void 0 ? parseFloat(l) : 1
        }
    },
    Pw = e => pr(0, 255, e),
    il = {
        ...On,
        transform: e => Math.round(Pw(e))
    },
    xn = {
        test: bu("rgb", "red"),
        parse: wm("red", "green", "blue"),
        transform: ({
            red: e,
            green: t,
            blue: n,
            alpha: r = 1
        }) => "rgba(" + il.transform(e) + ", " + il.transform(t) + ", " + il.transform(n) + ", " + Qr(Kr.transform(r)) + ")"
    };

function Ew(e) {
    let t = "",
        n = "",
        r = "",
        i = "";
    return e.length > 5 ? (t = e.substring(1, 3), n = e.substring(3, 5), r = e.substring(5, 7), i = e.substring(7, 9)) : (t = e.substring(1, 2), n = e.substring(2, 3), r = e.substring(3, 4), i = e.substring(4, 5), t += t, n += n, r += r, i += i), {
        red: parseInt(t, 16),
        green: parseInt(n, 16),
        blue: parseInt(r, 16),
        alpha: i ? parseInt(i, 16) / 255 : 1
    }
}
const ga = {
        test: bu("#"),
        parse: Ew,
        transform: xn.transform
    },
    Zn = {
        test: bu("hsl", "hue"),
        parse: wm("hue", "saturation", "lightness"),
        transform: ({
            hue: e,
            saturation: t,
            lightness: n,
            alpha: r = 1
        }) => "hsla(" + Math.round(e) + ", " + mt.transform(Qr(t)) + ", " + mt.transform(Qr(n)) + ", " + Qr(Kr.transform(r)) + ")"
    },
    Te = {
        test: e => xn.test(e) || ga.test(e) || Zn.test(e),
        parse: e => xn.test(e) ? xn.parse(e) : Zn.test(e) ? Zn.parse(e) : ga.parse(e),
        transform: e => Ni(e) ? e : e.hasOwnProperty("red") ? xn.transform(e) : Zn.transform(e)
    },
    xm = "${c}",
    Sm = "${n}";

function Nw(e) {
    var t, n;
    return isNaN(e) && Ni(e) && (((t = e.match(gi)) === null || t === void 0 ? void 0 : t.length) || 0) + (((n = e.match(da)) === null || n === void 0 ? void 0 : n.length) || 0) > 0
}

function Ho(e) {
    typeof e == "number" && (e = `${e}`);
    const t = [];
    let n = 0,
        r = 0;
    const i = e.match(da);
    i && (n = i.length, e = e.replace(da, xm), t.push(...i.map(Te.parse)));
    const o = e.match(gi);
    return o && (r = o.length, e = e.replace(gi, Sm), t.push(...o.map(On.parse))), {
        values: t,
        numColors: n,
        numNumbers: r,
        tokenised: e
    }
}

function Cm(e) {
    return Ho(e).values
}

function km(e) {
    const {
        values: t,
        numColors: n,
        tokenised: r
    } = Ho(e), i = t.length;
    return o => {
        let s = r;
        for (let l = 0; l < i; l++) s = s.replace(l < n ? xm : Sm, l < n ? Te.transform(o[l]) : Qr(o[l]));
        return s
    }
}
const Tw = e => typeof e == "number" ? 0 : e;

function Lw(e) {
    const t = Cm(e);
    return km(e)(t.map(Tw))
}
const sn = {
        test: Nw,
        parse: Cm,
        createTransformer: km,
        getAnimatableNone: Lw
    },
    Rw = new Set(["brightness", "contrast", "saturate", "opacity"]);

function _w(e) {
    const [t, n] = e.slice(0, -1).split("(");
    if (t === "drop-shadow") return e;
    const [r] = n.match(gi) || [];
    if (!r) return e;
    const i = n.replace(r, "");
    let o = Rw.has(t) ? 1 : 0;
    return r !== n && (o *= 100), t + "(" + o + i + ")"
}
const Dw = /([a-z-]*)\(.*?\)/g,
    ya = {
        ...sn,
        getAnimatableNone: e => {
            const t = e.match(Dw);
            return t ? t.map(_w).join(" ") : e
        }
    },
    Vw = {
        ...Xh,
        color: Te,
        backgroundColor: Te,
        outlineColor: Te,
        fill: Te,
        stroke: Te,
        borderColor: Te,
        borderTopColor: Te,
        borderRightColor: Te,
        borderBottomColor: Te,
        borderLeftColor: Te,
        filter: ya,
        WebkitFilter: ya
    },
    Hu = e => Vw[e];

function Wu(e, t) {
    var n;
    let r = Hu(e);
    return r !== ya && (r = sn), (n = r.getAnimatableNone) === null || n === void 0 ? void 0 : n.call(r, t)
}
const Pm = e => t => t.test(e),
    Aw = {
        test: e => e === "auto",
        parse: e => e
    },
    Em = [On, z, mt, Ft, x1, w1, Aw],
    Rr = e => Em.find(Pm(e)),
    Mw = [...Em, Te, sn],
    Ow = e => Mw.find(Pm(e));

function Iw(e) {
    const t = {};
    return e.values.forEach((n, r) => t[r] = n.get()), t
}

function Fw(e) {
    const t = {};
    return e.values.forEach((n, r) => t[r] = n.getVelocity()), t
}

function Es(e, t, n) {
    const r = e.getProps();
    return Fu(r, t, n !== void 0 ? n : r.custom, Iw(e), Fw(e))
}

function jw(e, t, n) {
    e.hasValue(t) ? e.getValue(t).set(n) : e.addValue(t, hr(n))
}

function zw(e, t) {
    const n = Es(e, t);
    let {
        transitionEnd: r = {},
        transition: i = {},
        ...o
    } = n ? e.makeTargetAnimatable(n, !1) : {};
    o = {
        ...o,
        ...r
    };
    for (const s in o) {
        const l = j1(o[s]);
        jw(e, s, l)
    }
}

function Bw(e, t, n) {
    var r, i;
    const o = Object.keys(t).filter(l => !e.hasValue(l)),
        s = o.length;
    if (!!s)
        for (let l = 0; l < s; l++) {
            const a = o[l],
                u = t[a];
            let c = null;
            Array.isArray(u) && (c = u[0]), c === null && (c = (i = (r = n[a]) !== null && r !== void 0 ? r : e.readValue(a)) !== null && i !== void 0 ? i : t[a]), c != null && (typeof c == "string" && (mw(c) || vw(c)) ? c = parseFloat(c) : !Ow(c) && sn.test(u) && (c = Wu(a, u)), e.addValue(a, hr(c, {
                owner: e
            })), n[a] === void 0 && (n[a] = c), c !== null && e.setBaseTarget(a, c))
        }
}

function Uw(e, t) {
    return t ? (t[e] || t.default || t).from : void 0
}

function $w(e, t, n) {
    var r;
    const i = {};
    for (const o in e) {
        const s = Uw(o, t);
        i[o] = s !== void 0 ? s : (r = n.getValue(o)) === null || r === void 0 ? void 0 : r.get()
    }
    return i
}

function Wo(e) {
    return Boolean(gt(e) && e.add)
}
const bw = (e, t) => `${e}: ${t}`;

function Hw(e, t) {
    const {
        MotionAppearAnimations: n
    } = window, r = bw(e, Mn.has(t) ? "transform" : t), i = n && n.get(r);
    return i ? (Ue.render(() => {
        try {
            i.cancel(), n.delete(r)
        } catch {}
    }), i.currentTime || 0) : 0
}
const Ww = "framerAppearId",
    Kw = "data-" + Ou(Ww);
var Qw = function() {},
    Ko = function() {};
const fo = e => e * 1e3,
    Gw = {
        current: !1
    },
    Ku = e => t => t <= .5 ? e(2 * t) / 2 : (2 - e(2 * (1 - t))) / 2,
    Qu = e => t => 1 - e(1 - t),
    Gu = e => e * e,
    Yw = Qu(Gu),
    Yu = Ku(Gu),
    se = (e, t, n) => -n * e + n * t + e;

function ol(e, t, n) {
    return n < 0 && (n += 1), n > 1 && (n -= 1), n < 1 / 6 ? e + (t - e) * 6 * n : n < 1 / 2 ? t : n < 2 / 3 ? e + (t - e) * (2 / 3 - n) * 6 : e
}

function Xw({
    hue: e,
    saturation: t,
    lightness: n,
    alpha: r
}) {
    e /= 360, t /= 100, n /= 100;
    let i = 0,
        o = 0,
        s = 0;
    if (!t) i = o = s = n;
    else {
        const l = n < .5 ? n * (1 + t) : n + t - n * t,
            a = 2 * n - l;
        i = ol(a, l, e + 1 / 3), o = ol(a, l, e), s = ol(a, l, e - 1 / 3)
    }
    return {
        red: Math.round(i * 255),
        green: Math.round(o * 255),
        blue: Math.round(s * 255),
        alpha: r
    }
}
const sl = (e, t, n) => {
        const r = e * e;
        return Math.sqrt(Math.max(0, n * (t * t - r) + r))
    },
    Zw = [ga, xn, Zn],
    Jw = e => Zw.find(t => t.test(e));

function Tf(e) {
    const t = Jw(e);
    let n = t.parse(e);
    return t === Zn && (n = Xw(n)), n
}
const Nm = (e, t) => {
    const n = Tf(e),
        r = Tf(t),
        i = {
            ...n
        };
    return o => (i.red = sl(n.red, r.red, o), i.green = sl(n.green, r.green, o), i.blue = sl(n.blue, r.blue, o), i.alpha = se(n.alpha, r.alpha, o), xn.transform(i))
};

function Tm(e, t) {
    return typeof e == "number" ? n => se(e, t, n) : Te.test(e) ? Nm(e, t) : Rm(e, t)
}
const Lm = (e, t) => {
        const n = [...e],
            r = n.length,
            i = e.map((o, s) => Tm(o, t[s]));
        return o => {
            for (let s = 0; s < r; s++) n[s] = i[s](o);
            return n
        }
    },
    qw = (e, t) => {
        const n = {
                ...e,
                ...t
            },
            r = {};
        for (const i in n) e[i] !== void 0 && t[i] !== void 0 && (r[i] = Tm(e[i], t[i]));
        return i => {
            for (const o in r) n[o] = r[o](i);
            return n
        }
    },
    Rm = (e, t) => {
        const n = sn.createTransformer(t),
            r = Ho(e),
            i = Ho(t);
        return r.numColors === i.numColors && r.numNumbers >= i.numNumbers ? ks(Lm(r.values, i.values), n) : s => `${s>0?t:e}`
    },
    Qo = (e, t, n) => {
        const r = t - e;
        return r === 0 ? 1 : (n - e) / r
    },
    Lf = (e, t) => n => se(e, t, n);

function ex(e) {
    return typeof e == "number" ? Lf : typeof e == "string" ? Te.test(e) ? Nm : Rm : Array.isArray(e) ? Lm : typeof e == "object" ? qw : Lf
}

function tx(e, t, n) {
    const r = [],
        i = n || ex(e[0]),
        o = e.length - 1;
    for (let s = 0; s < o; s++) {
        let l = i(e[s], e[s + 1]);
        if (t) {
            const a = Array.isArray(t) ? t[s] : t;
            l = ks(a, l)
        }
        r.push(l)
    }
    return r
}

function _m(e, t, {
    clamp: n = !0,
    ease: r,
    mixer: i
} = {}) {
    const o = e.length;
    Ko(o === t.length), Ko(!r || !Array.isArray(r) || r.length === o - 1), e[0] > e[o - 1] && (e = [...e].reverse(), t = [...t].reverse());
    const s = tx(t, r, i),
        l = s.length,
        a = u => {
            let c = 0;
            if (l > 1)
                for (; c < e.length - 2 && !(u < e[c + 1]); c++);
            const f = Qo(e[c], e[c + 1], u);
            return s[c](f)
        };
    return n ? u => a(pr(e[0], e[o - 1], u)) : a
}
const Xu = e => e,
    Dm = (e, t, n) => (((1 - 3 * n + 3 * t) * e + (3 * n - 6 * t)) * e + 3 * t) * e,
    nx = 1e-7,
    rx = 12;

function ix(e, t, n, r, i) {
    let o, s, l = 0;
    do s = t + (n - t) / 2, o = Dm(s, r, i) - e, o > 0 ? n = s : t = s; while (Math.abs(o) > nx && ++l < rx);
    return s
}

function Vm(e, t, n, r) {
    if (e === t && n === r) return Xu;
    const i = o => ix(o, 0, 1, e, n);
    return o => o === 0 || o === 1 ? o : Dm(i(o), t, r)
}
const Am = e => 1 - Math.sin(Math.acos(e)),
    Zu = Qu(Am),
    ox = Ku(Zu),
    Mm = Vm(.33, 1.53, .69, .99),
    Ju = Qu(Mm),
    sx = Ku(Ju),
    lx = e => (e *= 2) < 1 ? .5 * Ju(e) : .5 * (2 - Math.pow(2, -10 * (e - 1))),
    ax = {
        linear: Xu,
        easeIn: Gu,
        easeInOut: Yu,
        easeOut: Yw,
        circIn: Am,
        circInOut: ox,
        circOut: Zu,
        backIn: Ju,
        backInOut: sx,
        backOut: Mm,
        anticipate: lx
    },
    Rf = e => {
        if (Array.isArray(e)) {
            Ko(e.length === 4);
            const [t, n, r, i] = e;
            return Vm(t, n, r, i)
        } else if (typeof e == "string") return ax[e];
        return e
    },
    ux = e => Array.isArray(e) && typeof e[0] != "number";

function cx(e, t) {
    return e.map(() => t || Yu).splice(0, e.length - 1)
}

function fx(e) {
    const t = e.length;
    return e.map((n, r) => r !== 0 ? r / (t - 1) : 0)
}

function dx(e, t) {
    return e.map(n => n * t)
}

function Go({
    keyframes: e,
    ease: t = Yu,
    times: n,
    duration: r = 300
}) {
    e = [...e];
    const i = Go[0],
        o = ux(t) ? t.map(Rf) : Rf(t),
        s = {
            done: !1,
            value: i
        },
        l = dx(n && n.length === Go.length ? n : fx(e), r);

    function a() {
        return _m(l, e, {
            ease: Array.isArray(o) ? o : cx(e, o)
        })
    }
    let u = a();
    return {
        next: c => (s.value = u(c), s.done = c >= r, s),
        flipTarget: () => {
            e.reverse(), u = a()
        }
    }
}
const ll = .001,
    px = .01,
    _f = 10,
    hx = .05,
    mx = 1;

function vx({
    duration: e = 800,
    bounce: t = .25,
    velocity: n = 0,
    mass: r = 1
}) {
    let i, o;
    Qw(e <= _f * 1e3);
    let s = 1 - t;
    s = pr(hx, mx, s), e = pr(px, _f, e / 1e3), s < 1 ? (i = u => {
        const c = u * s,
            f = c * e,
            d = c - n,
            m = wa(u, s),
            g = Math.exp(-f);
        return ll - d / m * g
    }, o = u => {
        const f = u * s * e,
            d = f * n + n,
            m = Math.pow(s, 2) * Math.pow(u, 2) * e,
            g = Math.exp(-f),
            w = wa(Math.pow(u, 2), s);
        return (-i(u) + ll > 0 ? -1 : 1) * ((d - m) * g) / w
    }) : (i = u => {
        const c = Math.exp(-u * e),
            f = (u - n) * e + 1;
        return -ll + c * f
    }, o = u => {
        const c = Math.exp(-u * e),
            f = (n - u) * (e * e);
        return c * f
    });
    const l = 5 / e,
        a = yx(i, o, l);
    if (e = e * 1e3, isNaN(a)) return {
        stiffness: 100,
        damping: 10,
        duration: e
    }; {
        const u = Math.pow(a, 2) * r;
        return {
            stiffness: u,
            damping: s * 2 * Math.sqrt(r * u),
            duration: e
        }
    }
}
const gx = 12;

function yx(e, t, n) {
    let r = n;
    for (let i = 1; i < gx; i++) r = r - e(r) / t(r);
    return r
}

function wa(e, t) {
    return e * Math.sqrt(1 - t * t)
}
const wx = ["duration", "bounce"],
    xx = ["stiffness", "damping", "mass"];

function Df(e, t) {
    return t.some(n => e[n] !== void 0)
}

function Sx(e) {
    let t = {
        velocity: 0,
        stiffness: 100,
        damping: 10,
        mass: 1,
        isResolvedFromDuration: !1,
        ...e
    };
    if (!Df(e, xx) && Df(e, wx)) {
        const n = vx(e);
        t = {
            ...t,
            ...n,
            velocity: 0,
            mass: 1
        }, t.isResolvedFromDuration = !0
    }
    return t
}
const Cx = 5;

function Om({
    keyframes: e,
    restSpeed: t = 2,
    restDelta: n = .01,
    ...r
}) {
    let i = e[0],
        o = e[e.length - 1];
    const s = {
            done: !1,
            value: i
        },
        {
            stiffness: l,
            damping: a,
            mass: u,
            velocity: c,
            duration: f,
            isResolvedFromDuration: d
        } = Sx(r);
    let m = kx,
        g = c ? -(c / 1e3) : 0;
    const w = a / (2 * Math.sqrt(l * u));

    function k() {
        const h = o - i,
            p = Math.sqrt(l / u) / 1e3;
        if (n === void 0 && (n = Math.min(Math.abs(o - i) / 100, .4)), w < 1) {
            const v = wa(p, w);
            m = x => {
                const P = Math.exp(-w * p * x);
                return o - P * ((g + w * p * h) / v * Math.sin(v * x) + h * Math.cos(v * x))
            }
        } else if (w === 1) m = v => o - Math.exp(-p * v) * (h + (g + p * h) * v);
        else {
            const v = p * Math.sqrt(w * w - 1);
            m = x => {
                const P = Math.exp(-w * p * x),
                    T = Math.min(v * x, 300);
                return o - P * ((g + w * p * h) * Math.sinh(T) + v * h * Math.cosh(T)) / v
            }
        }
    }
    return k(), {
        next: h => {
            const p = m(h);
            if (d) s.done = h >= f;
            else {
                let v = g;
                if (h !== 0)
                    if (w < 1) {
                        const T = Math.max(0, h - Cx);
                        v = $u(p - m(T), h - T)
                    } else v = 0;
                const x = Math.abs(v) <= t,
                    P = Math.abs(o - p) <= n;
                s.done = x && P
            }
            return s.value = s.done ? o : p, s
        },
        flipTarget: () => {
            g = -g, [i, o] = [o, i], k()
        }
    }
}
Om.needsInterpolation = (e, t) => typeof e == "string" || typeof t == "string";
const kx = e => 0;

function Px({
    keyframes: e = [0],
    velocity: t = 0,
    power: n = .8,
    timeConstant: r = 350,
    restDelta: i = .5,
    modifyTarget: o
}) {
    const s = e[0],
        l = {
            done: !1,
            value: s
        };
    let a = n * t;
    const u = s + a,
        c = o === void 0 ? u : o(u);
    return c !== u && (a = c - s), {
        next: f => {
            const d = -a * Math.exp(-f / r);
            return l.done = !(d > i || d < -i), l.value = l.done ? c : c + d, l
        },
        flipTarget: () => {}
    }
}
const Ex = {
    decay: Px,
    keyframes: Go,
    tween: Go,
    spring: Om
};

function Im(e, t, n = 0) {
    return e - t - n
}

function Nx(e, t = 0, n = 0, r = !0) {
    return r ? Im(t + -e, t, n) : t - (e - t) + n
}

function Tx(e, t, n, r) {
    return r ? e >= t + n : e <= -n
}
const Lx = e => {
    const t = ({
        delta: n
    }) => e(n);
    return {
        start: () => Ue.update(t, !0),
        stop: () => on.update(t)
    }
};

function Yo({
    duration: e,
    driver: t = Lx,
    elapsed: n = 0,
    repeat: r = 0,
    repeatType: i = "loop",
    repeatDelay: o = 0,
    keyframes: s,
    autoplay: l = !0,
    onPlay: a,
    onStop: u,
    onComplete: c,
    onRepeat: f,
    onUpdate: d,
    type: m = "keyframes",
    ...g
}) {
    var w, k;
    let h, p = 0,
        v = e,
        x, P = !1,
        T = !0,
        L;
    const D = Ex[s.length > 2 ? "keyframes" : m],
        B = s[0],
        I = s[s.length - 1];
    !((k = (w = D).needsInterpolation) === null || k === void 0) && k.call(w, B, I) && (L = _m([0, 100], [B, I], {
        clamp: !1
    }), s = [0, 100]);
    const ee = D({
        ...g,
        duration: e,
        keyframes: s
    });

    function M() {
        p++, i === "reverse" ? (T = p % 2 === 0, n = Nx(n, v, o, T)) : (n = Im(n, v, o), i === "mirror" && ee.flipTarget()), P = !1, f && f()
    }

    function O() {
        h.stop(), c && c()
    }

    function $(Z) {
        if (T || (Z = -Z), n += Z, !P) {
            const ve = ee.next(Math.max(0, n));
            x = ve.value, L && (x = L(x)), P = T ? ve.done : n <= 0
        }
        d && d(x), P && (p === 0 && (v = v !== void 0 ? v : n), p < r ? Tx(n, v, o, T) && M() : O())
    }

    function j() {
        a && a(), h = t($), h.start()
    }
    return l && j(), {
        stop: () => {
            u && u(), h.stop()
        },
        sample: Z => ee.next(Math.max(0, Z))
    }
}

function Rx(e) {
    return !e || Array.isArray(e) || typeof e == "string" && Fm[e]
}
const Or = ([e, t, n, r]) => `cubic-bezier(${e}, ${t}, ${n}, ${r})`,
    Fm = {
        linear: "linear",
        ease: "ease",
        easeIn: "ease-in",
        easeOut: "ease-out",
        easeInOut: "ease-in-out",
        circIn: Or([0, .65, .55, 1]),
        circOut: Or([.55, 0, 1, .45]),
        backIn: Or([.31, .01, .66, -.59]),
        backOut: Or([.33, 1.53, .69, .99])
    };

function _x(e) {
    if (!!e) return Array.isArray(e) ? Or(e) : Fm[e]
}

function Dx(e, t, n, {
    delay: r = 0,
    duration: i,
    repeat: o = 0,
    repeatType: s = "loop",
    ease: l,
    times: a
} = {}) {
    return e.animate({
        [t]: n,
        offset: a
    }, {
        delay: r,
        duration: i,
        easing: _x(l),
        fill: "both",
        iterations: o + 1,
        direction: s === "reverse" ? "alternate" : "normal"
    })
}
const Gi = 10;

function Vx(e, t, {
    onUpdate: n,
    onComplete: r,
    ...i
}) {
    let {
        keyframes: o,
        duration: s = .3,
        elapsed: l = 0,
        ease: a
    } = i;
    if (i.type === "spring" || !Rx(i.ease)) {
        const c = Yo(i);
        let f = {
            done: !1,
            value: o[0]
        };
        const d = [];
        let m = 0;
        for (; !f.done;) f = c.sample(m), d.push(f.value), m += Gi;
        o = d, s = m - Gi, a = "linear"
    }
    const u = Dx(e.owner.current, t, o, {
        ...i,
        delay: -l,
        duration: s,
        ease: a
    });
    return u.onfinish = () => {
        e.set(o[o.length - 1]), r && r()
    }, () => {
        const {
            currentTime: c
        } = u;
        if (c) {
            const f = Yo(i);
            e.setWithVelocity(f.sample(c - Gi).value, f.sample(c).value, Gi)
        }
        Ue.update(() => u.cancel())
    }
}

function jm(e, t) {
    const n = performance.now(),
        r = ({
            timestamp: i
        }) => {
            const o = i - n;
            o >= t && (on.read(r), e(o - t))
        };
    return Ue.read(r, !0), () => on.read(r)
}

function Ax({
    keyframes: e,
    elapsed: t,
    onUpdate: n,
    onComplete: r
}) {
    const i = () => (n && n(e[e.length - 1]), r && r(), () => {});
    return t ? jm(i, -t) : i()
}

function Mx({
    keyframes: e,
    velocity: t = 0,
    min: n,
    max: r,
    power: i = .8,
    timeConstant: o = 750,
    bounceStiffness: s = 500,
    bounceDamping: l = 10,
    restDelta: a = 1,
    modifyTarget: u,
    driver: c,
    onUpdate: f,
    onComplete: d,
    onStop: m
}) {
    const g = e[0];
    let w;

    function k(x) {
        return n !== void 0 && x < n || r !== void 0 && x > r
    }

    function h(x) {
        return n === void 0 ? r : r === void 0 || Math.abs(n - x) < Math.abs(r - x) ? n : r
    }

    function p(x) {
        w == null || w.stop(), w = Yo({
            keyframes: [0, 1],
            velocity: 0,
            ...x,
            driver: c,
            onUpdate: P => {
                var T;
                f == null || f(P), (T = x.onUpdate) === null || T === void 0 || T.call(x, P)
            },
            onComplete: d,
            onStop: m
        })
    }

    function v(x) {
        p({
            type: "spring",
            stiffness: s,
            damping: l,
            restDelta: a,
            ...x
        })
    }
    if (k(g)) v({
        velocity: t,
        keyframes: [g, h(g)]
    });
    else {
        let x = i * t + g;
        typeof u != "undefined" && (x = u(x));
        const P = h(x),
            T = P === n ? -1 : 1;
        let L, D;
        const B = I => {
            L = D, D = I, t = $u(I - L, Nt.delta), (T === 1 && I > P || T === -1 && I < P) && v({
                keyframes: [I, P],
                velocity: t
            })
        };
        p({
            type: "decay",
            keyframes: [g, 0],
            velocity: t,
            timeConstant: o,
            power: i,
            restDelta: a,
            modifyTarget: u,
            onUpdate: k(x) ? B : void 0
        })
    }
    return {
        stop: () => w == null ? void 0 : w.stop()
    }
}
const dn = () => ({
        type: "spring",
        stiffness: 500,
        damping: 25,
        restSpeed: 10
    }),
    Yi = e => ({
        type: "spring",
        stiffness: 550,
        damping: e === 0 ? 2 * Math.sqrt(550) : 30,
        restSpeed: 10
    }),
    al = () => ({
        type: "keyframes",
        ease: "linear",
        duration: .3
    }),
    Ox = {
        type: "keyframes",
        duration: .8
    },
    Vf = {
        x: dn,
        y: dn,
        z: dn,
        rotate: dn,
        rotateX: dn,
        rotateY: dn,
        rotateZ: dn,
        scaleX: Yi,
        scaleY: Yi,
        scale: Yi,
        opacity: al,
        backgroundColor: al,
        color: al,
        default: Yi
    },
    Ix = (e, {
        keyframes: t
    }) => t.length > 2 ? Ox : (Vf[e] || Vf.default)(t[1]),
    xa = (e, t) => e === "zIndex" ? !1 : !!(typeof t == "number" || Array.isArray(t) || typeof t == "string" && sn.test(t) && !t.startsWith("url("));

function Fx({
    when: e,
    delay: t,
    delayChildren: n,
    staggerChildren: r,
    staggerDirection: i,
    repeat: o,
    repeatType: s,
    repeatDelay: l,
    from: a,
    ...u
}) {
    return !!Object.keys(u).length
}

function Af(e) {
    return e === 0 || typeof e == "string" && parseFloat(e) === 0 && e.indexOf(" ") === -1
}

function Mf(e) {
    return typeof e == "number" ? 0 : Wu("", e)
}

function zm(e, t) {
    return e[t] || e.default || e
}

function jx(e, t, n, r) {
    const i = xa(t, n);
    let o = r.from !== void 0 ? r.from : e.get();
    return o === "none" && i && typeof n == "string" ? o = Wu(t, n) : Af(o) && typeof n == "string" ? o = Mf(n) : !Array.isArray(n) && Af(n) && typeof o == "string" && (n = Mf(o)), Array.isArray(n) ? (n[0] === null && (n[0] = o), n) : [o, n]
}
const Of = {
        waapi: () => Object.hasOwnProperty.call(Element.prototype, "animate")
    },
    ul = {},
    Bm = {};
for (const e in Of) Bm[e] = () => (ul[e] === void 0 && (ul[e] = Of[e]()), ul[e]);
const zx = new Set(["opacity"]),
    qu = (e, t, n, r = {}) => i => {
        const o = zm(r, e) || {},
            s = o.delay || r.delay || 0;
        let {
            elapsed: l = 0
        } = r;
        l = l - fo(s);
        const a = jx(t, e, n, o),
            u = a[0],
            c = a[a.length - 1],
            f = xa(e, u),
            d = xa(e, c);
        let m = {
            keyframes: a,
            velocity: t.getVelocity(),
            ...o,
            elapsed: l,
            onUpdate: h => {
                t.set(h), o.onUpdate && o.onUpdate(h)
            },
            onComplete: () => {
                i(), o.onComplete && o.onComplete()
            }
        };
        if (!f || !d || Gw.current || o.type === !1) return Ax(m);
        if (o.type === "inertia") {
            const h = Mx(m);
            return () => h.stop()
        }
        Fx(o) || (m = {
            ...m,
            ...Ix(e, m)
        }), m.duration && (m.duration = fo(m.duration)), m.repeatDelay && (m.repeatDelay = fo(m.repeatDelay));
        const g = t.owner,
            w = g && g.current;
        if (Bm.waapi() && zx.has(e) && !m.repeatDelay && m.repeatType !== "mirror" && m.damping !== 0 && g && w instanceof HTMLElement && !g.getProps().onUpdate) return Vx(t, e, m); {
            const h = Yo(m);
            return () => h.stop()
        }
    };

function Bx(e, t, n = {}) {
    e.notify("AnimationStart", t);
    let r;
    if (Array.isArray(t)) {
        const i = t.map(o => Sa(e, o, n));
        r = Promise.all(i)
    } else if (typeof t == "string") r = Sa(e, t, n);
    else {
        const i = typeof t == "function" ? Es(e, t, n.custom) : t;
        r = Um(e, i, n)
    }
    return r.then(() => e.notify("AnimationComplete", t))
}

function Sa(e, t, n = {}) {
    var r;
    const i = Es(e, t, n.custom);
    let {
        transition: o = e.getDefaultTransition() || {}
    } = i || {};
    n.transitionOverride && (o = n.transitionOverride);
    const s = i ? () => Um(e, i, n) : () => Promise.resolve(),
        l = !((r = e.variantChildren) === null || r === void 0) && r.size ? (u = 0) => {
            const {
                delayChildren: c = 0,
                staggerChildren: f,
                staggerDirection: d
            } = o;
            return Ux(e, t, c + u, f, d, n)
        } : () => Promise.resolve(),
        {
            when: a
        } = o;
    if (a) {
        const [u, c] = a === "beforeChildren" ? [s, l] : [l, s];
        return u().then(c)
    } else return Promise.all([s(), l(n.delay)])
}

function Um(e, t, {
    delay: n = 0,
    transitionOverride: r,
    type: i
} = {}) {
    var o;
    let {
        transition: s = e.getDefaultTransition(),
        transitionEnd: l,
        ...a
    } = e.makeTargetAnimatable(t);
    const u = e.getValue("willChange");
    r && (s = r);
    const c = [],
        f = i && ((o = e.animationState) === null || o === void 0 ? void 0 : o.getState()[i]);
    for (const d in a) {
        const m = e.getValue(d),
            g = a[d];
        if (!m || g === void 0 || f && bx(f, d)) continue;
        let w = {
            delay: n,
            elapsed: 0,
            ...s
        };
        if (e.shouldReduceMotion && Mn.has(d) && (w = {
                ...w,
                type: !1,
                delay: 0
            }), !m.hasAnimated) {
            const h = e.getProps()[Kw];
            h && (w.elapsed = Hw(h, d))
        }
        let k = m.start(qu(d, m, g, w));
        Wo(u) && (u.add(d), k = k.then(() => u.remove(d))), c.push(k)
    }
    return Promise.all(c).then(() => {
        l && zw(e, l)
    })
}

function Ux(e, t, n = 0, r = 0, i = 1, o) {
    const s = [],
        l = (e.variantChildren.size - 1) * r,
        a = i === 1 ? (u = 0) => u * r : (u = 0) => l - u * r;
    return Array.from(e.variantChildren).sort($x).forEach((u, c) => {
        s.push(Sa(u, t, {
            ...o,
            delay: n + a(c)
        }).then(() => u.notify("AnimationComplete", t)))
    }), Promise.all(s)
}

function $x(e, t) {
    return e.sortNodePosition(t)
}

function bx({
    protectedKeys: e,
    needsAnimating: t
}, n) {
    const r = e.hasOwnProperty(n) && t[n] !== !0;
    return t[n] = !1, r
}
const ec = [Q.Animate, Q.InView, Q.Focus, Q.Hover, Q.Tap, Q.Drag, Q.Exit],
    Hx = [...ec].reverse(),
    Wx = ec.length;

function Kx(e) {
    return t => Promise.all(t.map(({
        animation: n,
        options: r
    }) => Bx(e, n, r)))
}

function Qx(e) {
    let t = Kx(e);
    const n = Yx();
    let r = !0;
    const i = (a, u) => {
        const c = Es(e, u);
        if (c) {
            const {
                transition: f,
                transitionEnd: d,
                ...m
            } = c;
            a = {
                ...a,
                ...m,
                ...d
            }
        }
        return a
    };

    function o(a) {
        t = a(e)
    }

    function s(a, u) {
        const c = e.getProps(),
            f = e.getVariantContext(!0) || {},
            d = [],
            m = new Set;
        let g = {},
            w = 1 / 0;
        for (let h = 0; h < Wx; h++) {
            const p = Hx[h],
                v = n[p],
                x = c[p] !== void 0 ? c[p] : f[p],
                P = mi(x),
                T = p === u ? v.isActive : null;
            T === !1 && (w = h);
            let L = x === f[p] && x !== c[p] && P;
            if (L && r && e.manuallyAnimateOnMount && (L = !1), v.protectedKeys = {
                    ...g
                }, !v.isActive && T === null || !x && !v.prevProp || xs(x) || typeof x == "boolean") continue;
            const D = Gx(v.prevProp, x);
            let B = D || p === u && v.isActive && !L && P || h > w && P;
            const I = Array.isArray(x) ? x : [x];
            let ee = I.reduce(i, {});
            T === !1 && (ee = {});
            const {
                prevResolvedValues: M = {}
            } = v, O = {
                ...M,
                ...ee
            }, $ = j => {
                B = !0, m.delete(j), v.needsAnimating[j] = !0
            };
            for (const j in O) {
                const Z = ee[j],
                    ve = M[j];
                g.hasOwnProperty(j) || (Z !== ve ? $o(Z) && $o(ve) ? !mm(Z, ve) || D ? $(j) : v.protectedKeys[j] = !0 : Z !== void 0 ? $(j) : m.add(j) : Z !== void 0 && m.has(j) ? $(j) : v.protectedKeys[j] = !0)
            }
            v.prevProp = x, v.prevResolvedValues = ee, v.isActive && (g = {
                ...g,
                ...ee
            }), r && e.blockInitialAnimation && (B = !1), B && !L && d.push(...I.map(j => ({
                animation: j,
                options: {
                    type: p,
                    ...a
                }
            })))
        }
        if (m.size) {
            const h = {};
            m.forEach(p => {
                const v = e.getBaseTarget(p);
                v !== void 0 && (h[p] = v)
            }), d.push({
                animation: h
            })
        }
        let k = Boolean(d.length);
        return r && c.initial === !1 && !e.manuallyAnimateOnMount && (k = !1), r = !1, k ? t(d) : Promise.resolve()
    }

    function l(a, u, c) {
        var f;
        if (n[a].isActive === u) return Promise.resolve();
        (f = e.variantChildren) === null || f === void 0 || f.forEach(m => {
            var g;
            return (g = m.animationState) === null || g === void 0 ? void 0 : g.setActive(a, u)
        }), n[a].isActive = u;
        const d = s(c, a);
        for (const m in n) n[m].protectedKeys = {};
        return d
    }
    return {
        animateChanges: s,
        setActive: l,
        setAnimateFunction: o,
        getState: () => n
    }
}

function Gx(e, t) {
    return typeof t == "string" ? t !== e : Array.isArray(t) ? !mm(t, e) : !1
}

function pn(e = !1) {
    return {
        isActive: e,
        protectedKeys: {},
        needsAnimating: {},
        prevResolvedValues: {}
    }
}

function Yx() {
    return {
        [Q.Animate]: pn(!0),
        [Q.InView]: pn(),
        [Q.Hover]: pn(),
        [Q.Tap]: pn(),
        [Q.Drag]: pn(),
        [Q.Focus]: pn(),
        [Q.Exit]: pn()
    }
}
const Xx = {
        animation: Kt(({
            visualElement: e,
            animate: t
        }) => {
            e.animationState || (e.animationState = Qx(e)), xs(t) && S.exports.useEffect(() => t.subscribe(e), [t])
        }),
        exit: Kt(e => {
            const {
                custom: t,
                visualElement: n
            } = e, [r, i] = hm(), o = S.exports.useContext(ws);
            S.exports.useEffect(() => {
                n.isPresent = r;
                const s = n.animationState && n.animationState.setActive(Q.Exit, !r, {
                    custom: o && o.custom || t
                });
                s && !r && s.then(i)
            }, [r])
        })
    },
    If = (e, t) => Math.abs(e - t);

function Zx(e, t) {
    const n = If(e.x, t.x),
        r = If(e.y, t.y);
    return Math.sqrt(n ** 2 + r ** 2)
}
class $m {
    constructor(t, n, {
        transformPagePoint: r
    } = {}) {
        if (this.startEvent = null, this.lastMoveEvent = null, this.lastMoveEventInfo = null, this.handlers = {}, this.updatePoint = () => {
                if (!(this.lastMoveEvent && this.lastMoveEventInfo)) return;
                const u = fl(this.lastMoveEventInfo, this.history),
                    c = this.startEvent !== null,
                    f = Zx(u.offset, {
                        x: 0,
                        y: 0
                    }) >= 3;
                if (!c && !f) return;
                const {
                    point: d
                } = u, {
                    timestamp: m
                } = Nt;
                this.history.push({
                    ...d,
                    timestamp: m
                });
                const {
                    onStart: g,
                    onMove: w
                } = this.handlers;
                c || (g && g(this.lastMoveEvent, u), this.startEvent = this.lastMoveEvent), w && w(this.lastMoveEvent, u)
            }, this.handlePointerMove = (u, c) => {
                if (this.lastMoveEvent = u, this.lastMoveEventInfo = cl(c, this.transformPagePoint), om(u) && u.buttons === 0) {
                    this.handlePointerUp(u, c);
                    return
                }
                Ue.update(this.updatePoint, !0)
            }, this.handlePointerUp = (u, c) => {
                this.end();
                const {
                    onEnd: f,
                    onSessionEnd: d
                } = this.handlers, m = fl(cl(c, this.transformPagePoint), this.history);
                this.startEvent && f && f(u, m), d && d(u, m)
            }, sm(t) && t.touches.length > 1) return;
        this.handlers = n, this.transformPagePoint = r;
        const i = ju(t),
            o = cl(i, this.transformPagePoint),
            {
                point: s
            } = o,
            {
                timestamp: l
            } = Nt;
        this.history = [{
            ...s,
            timestamp: l
        }];
        const {
            onSessionStart: a
        } = n;
        a && a(t, fl(o, this.history)), this.removeListeners = ks(or(window, "pointermove", this.handlePointerMove), or(window, "pointerup", this.handlePointerUp), or(window, "pointercancel", this.handlePointerUp))
    }
    updateHandlers(t) {
        this.handlers = t
    }
    end() {
        this.removeListeners && this.removeListeners(), on.update(this.updatePoint)
    }
}

function cl(e, t) {
    return t ? {
        point: t(e.point)
    } : e
}

function Ff(e, t) {
    return {
        x: e.x - t.x,
        y: e.y - t.y
    }
}

function fl({
    point: e
}, t) {
    return {
        point: e,
        delta: Ff(e, bm(t)),
        offset: Ff(e, Jx(t)),
        velocity: qx(t, .1)
    }
}

function Jx(e) {
    return e[0]
}

function bm(e) {
    return e[e.length - 1]
}

function qx(e, t) {
    if (e.length < 2) return {
        x: 0,
        y: 0
    };
    let n = e.length - 1,
        r = null;
    const i = bm(e);
    for (; n >= 0 && (r = e[n], !(i.timestamp - r.timestamp > fo(t)));) n--;
    if (!r) return {
        x: 0,
        y: 0
    };
    const o = (i.timestamp - r.timestamp) / 1e3;
    if (o === 0) return {
        x: 0,
        y: 0
    };
    const s = {
        x: (i.x - r.x) / o,
        y: (i.y - r.y) / o
    };
    return s.x === 1 / 0 && (s.x = 0), s.y === 1 / 0 && (s.y = 0), s
}

function be(e) {
    return e.max - e.min
}

function Ca(e, t = 0, n = .01) {
    return Math.abs(e - t) <= n
}

function jf(e, t, n, r = .5) {
    e.origin = r, e.originPoint = se(t.min, t.max, e.origin), e.scale = be(n) / be(t), (Ca(e.scale, 1, 1e-4) || isNaN(e.scale)) && (e.scale = 1), e.translate = se(n.min, n.max, e.origin) - e.originPoint, (Ca(e.translate) || isNaN(e.translate)) && (e.translate = 0)
}

function Gr(e, t, n, r) {
    jf(e.x, t.x, n.x, r == null ? void 0 : r.originX), jf(e.y, t.y, n.y, r == null ? void 0 : r.originY)
}

function zf(e, t, n) {
    e.min = n.min + t.min, e.max = e.min + be(t)
}

function eS(e, t, n) {
    zf(e.x, t.x, n.x), zf(e.y, t.y, n.y)
}

function Bf(e, t, n) {
    e.min = t.min - n.min, e.max = e.min + be(t)
}

function Yr(e, t, n) {
    Bf(e.x, t.x, n.x), Bf(e.y, t.y, n.y)
}

function tS(e, {
    min: t,
    max: n
}, r) {
    return t !== void 0 && e < t ? e = r ? se(t, e, r.min) : Math.max(e, t) : n !== void 0 && e > n && (e = r ? se(n, e, r.max) : Math.min(e, n)), e
}

function Uf(e, t, n) {
    return {
        min: t !== void 0 ? e.min + t : void 0,
        max: n !== void 0 ? e.max + n - (e.max - e.min) : void 0
    }
}

function nS(e, {
    top: t,
    left: n,
    bottom: r,
    right: i
}) {
    return {
        x: Uf(e.x, n, i),
        y: Uf(e.y, t, r)
    }
}

function $f(e, t) {
    let n = t.min - e.min,
        r = t.max - e.max;
    return t.max - t.min < e.max - e.min && ([n, r] = [r, n]), {
        min: n,
        max: r
    }
}

function rS(e, t) {
    return {
        x: $f(e.x, t.x),
        y: $f(e.y, t.y)
    }
}

function iS(e, t) {
    let n = .5;
    const r = be(e),
        i = be(t);
    return i > r ? n = Qo(t.min, t.max - r, e.min) : r > i && (n = Qo(e.min, e.max - i, t.min)), pr(0, 1, n)
}

function oS(e, t) {
    const n = {};
    return t.min !== void 0 && (n.min = t.min - e.min), t.max !== void 0 && (n.max = t.max - e.min), n
}
const ka = .35;

function sS(e = ka) {
    return e === !1 ? e = 0 : e === !0 && (e = ka), {
        x: bf(e, "left", "right"),
        y: bf(e, "top", "bottom")
    }
}

function bf(e, t, n) {
    return {
        min: Hf(e, t),
        max: Hf(e, n)
    }
}

function Hf(e, t) {
    return typeof e == "number" ? e : e[t] || 0
}
const Wf = () => ({
        translate: 0,
        scale: 1,
        origin: 0,
        originPoint: 0
    }),
    Xr = () => ({
        x: Wf(),
        y: Wf()
    }),
    Kf = () => ({
        min: 0,
        max: 0
    }),
    fe = () => ({
        x: Kf(),
        y: Kf()
    });

function ft(e) {
    return [e("x"), e("y")]
}

function Hm({
    top: e,
    left: t,
    right: n,
    bottom: r
}) {
    return {
        x: {
            min: t,
            max: n
        },
        y: {
            min: e,
            max: r
        }
    }
}

function lS({
    x: e,
    y: t
}) {
    return {
        top: t.min,
        right: e.max,
        bottom: t.max,
        left: e.min
    }
}

function aS(e, t) {
    if (!t) return e;
    const n = t({
            x: e.left,
            y: e.top
        }),
        r = t({
            x: e.right,
            y: e.bottom
        });
    return {
        top: n.y,
        left: n.x,
        bottom: r.y,
        right: r.x
    }
}

function dl(e) {
    return e === void 0 || e === 1
}

function Pa({
    scale: e,
    scaleX: t,
    scaleY: n
}) {
    return !dl(e) || !dl(t) || !dl(n)
}

function vn(e) {
    return Pa(e) || Wm(e) || e.z || e.rotate || e.rotateX || e.rotateY
}

function Wm(e) {
    return Qf(e.x) || Qf(e.y)
}

function Qf(e) {
    return e && e !== "0%"
}

function Xo(e, t, n) {
    const r = e - n,
        i = t * r;
    return n + i
}

function Gf(e, t, n, r, i) {
    return i !== void 0 && (e = Xo(e, i, r)), Xo(e, n, r) + t
}

function Ea(e, t = 0, n = 1, r, i) {
    e.min = Gf(e.min, t, n, r, i), e.max = Gf(e.max, t, n, r, i)
}

function Km(e, {
    x: t,
    y: n
}) {
    Ea(e.x, t.translate, t.scale, t.originPoint), Ea(e.y, n.translate, n.scale, n.originPoint)
}

function uS(e, t, n, r = !1) {
    var i, o;
    const s = n.length;
    if (!s) return;
    t.x = t.y = 1;
    let l, a;
    for (let u = 0; u < s; u++) l = n[u], a = l.projectionDelta, ((o = (i = l.instance) === null || i === void 0 ? void 0 : i.style) === null || o === void 0 ? void 0 : o.display) !== "contents" && (r && l.options.layoutScroll && l.scroll && l !== l.root && Jn(e, {
        x: -l.scroll.offset.x,
        y: -l.scroll.offset.y
    }), a && (t.x *= a.x.scale, t.y *= a.y.scale, Km(e, a)), r && vn(l.latestValues) && Jn(e, l.latestValues));
    t.x = Yf(t.x), t.y = Yf(t.y)
}

function Yf(e) {
    return Number.isInteger(e) || e > 1.0000000000001 || e < .999999999999 ? e : 1
}

function Bt(e, t) {
    e.min = e.min + t, e.max = e.max + t
}

function Xf(e, t, [n, r, i]) {
    const o = t[i] !== void 0 ? t[i] : .5,
        s = se(e.min, e.max, o);
    Ea(e, t[n], t[r], s, t.scale)
}
const cS = ["x", "scaleX", "originX"],
    fS = ["y", "scaleY", "originY"];

function Jn(e, t) {
    Xf(e.x, t, cS), Xf(e.y, t, fS)
}

function Qm(e, t) {
    return Hm(aS(e.getBoundingClientRect(), t))
}

function dS(e, t, n) {
    const r = Qm(e, n),
        {
            scroll: i
        } = t;
    return i && (Bt(r.x, i.offset.x), Bt(r.y, i.offset.y)), r
}
const pS = new WeakMap;
class hS {
    constructor(t) {
        this.openGlobalLock = null, this.isDragging = !1, this.currentDirection = null, this.originPoint = {
            x: 0,
            y: 0
        }, this.constraints = !1, this.hasMutatedConstraints = !1, this.elastic = fe(), this.visualElement = t
    }
    start(t, {
        snapToCursor: n = !1
    } = {}) {
        if (this.visualElement.isPresent === !1) return;
        const r = l => {
                this.stopAnimation(), n && this.snapToCursor(ju(l, "page").point)
            },
            i = (l, a) => {
                var u;
                const {
                    drag: c,
                    dragPropagation: f,
                    onDragStart: d
                } = this.getProps();
                c && !f && (this.openGlobalLock && this.openGlobalLock(), this.openGlobalLock = cm(c), !this.openGlobalLock) || (this.isDragging = !0, this.currentDirection = null, this.resolveConstraints(), this.visualElement.projection && (this.visualElement.projection.isAnimationBlocked = !0, this.visualElement.projection.target = void 0), ft(m => {
                    var g, w;
                    let k = this.getAxisMotionValue(m).get() || 0;
                    if (mt.test(k)) {
                        const h = (w = (g = this.visualElement.projection) === null || g === void 0 ? void 0 : g.layout) === null || w === void 0 ? void 0 : w.layoutBox[m];
                        h && (k = be(h) * (parseFloat(k) / 100))
                    }
                    this.originPoint[m] = k
                }), d == null || d(l, a), (u = this.visualElement.animationState) === null || u === void 0 || u.setActive(Q.Drag, !0))
            },
            o = (l, a) => {
                const {
                    dragPropagation: u,
                    dragDirectionLock: c,
                    onDirectionLock: f,
                    onDrag: d
                } = this.getProps();
                if (!u && !this.openGlobalLock) return;
                const {
                    offset: m
                } = a;
                if (c && this.currentDirection === null) {
                    this.currentDirection = mS(m), this.currentDirection !== null && (f == null || f(this.currentDirection));
                    return
                }
                this.updateAxis("x", a.point, m), this.updateAxis("y", a.point, m), this.visualElement.render(), d == null || d(l, a)
            },
            s = (l, a) => this.stop(l, a);
        this.panSession = new $m(t, {
            onSessionStart: r,
            onStart: i,
            onMove: o,
            onSessionEnd: s
        }, {
            transformPagePoint: this.visualElement.getTransformPagePoint()
        })
    }
    stop(t, n) {
        const r = this.isDragging;
        if (this.cancel(), !r) return;
        const {
            velocity: i
        } = n;
        this.startAnimation(i);
        const {
            onDragEnd: o
        } = this.getProps();
        o == null || o(t, n)
    }
    cancel() {
        var t, n;
        this.isDragging = !1, this.visualElement.projection && (this.visualElement.projection.isAnimationBlocked = !1), (t = this.panSession) === null || t === void 0 || t.end(), this.panSession = void 0;
        const {
            dragPropagation: r
        } = this.getProps();
        !r && this.openGlobalLock && (this.openGlobalLock(), this.openGlobalLock = null), (n = this.visualElement.animationState) === null || n === void 0 || n.setActive(Q.Drag, !1)
    }
    updateAxis(t, n, r) {
        const {
            drag: i
        } = this.getProps();
        if (!r || !Xi(t, i, this.currentDirection)) return;
        const o = this.getAxisMotionValue(t);
        let s = this.originPoint[t] + r[t];
        this.constraints && this.constraints[t] && (s = tS(s, this.constraints[t], this.elastic[t])), o.set(s)
    }
    resolveConstraints() {
        const {
            dragConstraints: t,
            dragElastic: n
        } = this.getProps(), {
            layout: r
        } = this.visualElement.projection || {}, i = this.constraints;
        t && Xn(t) ? this.constraints || (this.constraints = this.resolveRefConstraints()) : t && r ? this.constraints = nS(r.layoutBox, t) : this.constraints = !1, this.elastic = sS(n), i !== this.constraints && r && this.constraints && !this.hasMutatedConstraints && ft(o => {
            this.getAxisMotionValue(o) && (this.constraints[o] = oS(r.layoutBox[o], this.constraints[o]))
        })
    }
    resolveRefConstraints() {
        const {
            dragConstraints: t,
            onMeasureDragConstraints: n
        } = this.getProps();
        if (!t || !Xn(t)) return !1;
        const r = t.current,
            {
                projection: i
            } = this.visualElement;
        if (!i || !i.layout) return !1;
        const o = dS(r, i.root, this.visualElement.getTransformPagePoint());
        let s = rS(i.layout.layoutBox, o);
        if (n) {
            const l = n(lS(s));
            this.hasMutatedConstraints = !!l, l && (s = Hm(l))
        }
        return s
    }
    startAnimation(t) {
        const {
            drag: n,
            dragMomentum: r,
            dragElastic: i,
            dragTransition: o,
            dragSnapToOrigin: s,
            onDragTransitionEnd: l
        } = this.getProps(), a = this.constraints || {}, u = ft(c => {
            if (!Xi(c, n, this.currentDirection)) return;
            let f = (a == null ? void 0 : a[c]) || {};
            s && (f = {
                min: 0,
                max: 0
            });
            const d = i ? 200 : 1e6,
                m = i ? 40 : 1e7,
                g = {
                    type: "inertia",
                    velocity: r ? t[c] : 0,
                    bounceStiffness: d,
                    bounceDamping: m,
                    timeConstant: 750,
                    restDelta: 1,
                    restSpeed: 10,
                    ...o,
                    ...f
                };
            return this.startAxisValueAnimation(c, g)
        });
        return Promise.all(u).then(l)
    }
    startAxisValueAnimation(t, n) {
        const r = this.getAxisMotionValue(t);
        return r.start(qu(t, r, 0, n))
    }
    stopAnimation() {
        ft(t => this.getAxisMotionValue(t).stop())
    }
    getAxisMotionValue(t) {
        var n;
        const r = "_drag" + t.toUpperCase(),
            i = this.visualElement.getProps()[r];
        return i || this.visualElement.getValue(t, ((n = this.visualElement.getProps().initial) === null || n === void 0 ? void 0 : n[t]) || 0)
    }
    snapToCursor(t) {
        ft(n => {
            const {
                drag: r
            } = this.getProps();
            if (!Xi(n, r, this.currentDirection)) return;
            const {
                projection: i
            } = this.visualElement, o = this.getAxisMotionValue(n);
            if (i && i.layout) {
                const {
                    min: s,
                    max: l
                } = i.layout.layoutBox[n];
                o.set(t[n] - se(s, l, .5))
            }
        })
    }
    scalePositionWithinConstraints() {
        var t;
        if (!this.visualElement.current) return;
        const {
            drag: n,
            dragConstraints: r
        } = this.getProps(), {
            projection: i
        } = this.visualElement;
        if (!Xn(r) || !i || !this.constraints) return;
        this.stopAnimation();
        const o = {
            x: 0,
            y: 0
        };
        ft(l => {
            const a = this.getAxisMotionValue(l);
            if (a) {
                const u = a.get();
                o[l] = iS({
                    min: u,
                    max: u
                }, this.constraints[l])
            }
        });
        const {
            transformTemplate: s
        } = this.visualElement.getProps();
        this.visualElement.current.style.transform = s ? s({}, "") : "none", (t = i.root) === null || t === void 0 || t.updateScroll(), i.updateLayout(), this.resolveConstraints(), ft(l => {
            if (!Xi(l, n, null)) return;
            const a = this.getAxisMotionValue(l),
                {
                    min: u,
                    max: c
                } = this.constraints[l];
            a.set(se(u, c, o[l]))
        })
    }
    addListeners() {
        var t;
        if (!this.visualElement.current) return;
        pS.set(this.visualElement, this);
        const n = this.visualElement.current,
            r = or(n, "pointerdown", u => {
                const {
                    drag: c,
                    dragListener: f = !0
                } = this.getProps();
                c && f && this.start(u)
            }),
            i = () => {
                const {
                    dragConstraints: u
                } = this.getProps();
                Xn(u) && (this.constraints = this.resolveRefConstraints())
            },
            {
                projection: o
            } = this.visualElement,
            s = o.addEventListener("measure", i);
        o && !o.layout && ((t = o.root) === null || t === void 0 || t.updateScroll(), o.updateLayout()), i();
        const l = Cs(window, "resize", () => this.scalePositionWithinConstraints()),
            a = o.addEventListener("didUpdate", ({
                delta: u,
                hasLayoutChanged: c
            }) => {
                this.isDragging && c && (ft(f => {
                    const d = this.getAxisMotionValue(f);
                    !d || (this.originPoint[f] += u[f].translate, d.set(d.get() + u[f].translate))
                }), this.visualElement.render())
            });
        return () => {
            l(), r(), s(), a == null || a()
        }
    }
    getProps() {
        const t = this.visualElement.getProps(),
            {
                drag: n = !1,
                dragDirectionLock: r = !1,
                dragPropagation: i = !1,
                dragConstraints: o = !1,
                dragElastic: s = ka,
                dragMomentum: l = !0
            } = t;
        return {
            ...t,
            drag: n,
            dragDirectionLock: r,
            dragPropagation: i,
            dragConstraints: o,
            dragElastic: s,
            dragMomentum: l
        }
    }
}

function Xi(e, t, n) {
    return (t === !0 || t === e) && (n === null || n === e)
}

function mS(e, t = 10) {
    let n = null;
    return Math.abs(e.y) > t ? n = "y" : Math.abs(e.x) > t && (n = "x"), n
}

function vS(e) {
    const {
        dragControls: t,
        visualElement: n
    } = e, r = Ru(() => new hS(n));
    S.exports.useEffect(() => t && t.subscribe(r), [r, t]), S.exports.useEffect(() => r.addListeners(), [r])
}

function gS({
    onPan: e,
    onPanStart: t,
    onPanEnd: n,
    onPanSessionStart: r,
    visualElement: i
}) {
    const o = e || t || n || r,
        s = S.exports.useRef(null),
        {
            transformPagePoint: l
        } = S.exports.useContext(Lu),
        a = {
            onSessionStart: r,
            onStart: t,
            onMove: e,
            onEnd: (c, f) => {
                s.current = null, n && n(c, f)
            }
        };
    S.exports.useEffect(() => {
        s.current !== null && s.current.updateHandlers(a)
    });

    function u(c) {
        s.current = new $m(c, a, {
            transformPagePoint: l
        })
    }
    bo(i, "pointerdown", o && u), pm(() => s.current && s.current.end())
}
const yS = {
    pan: Kt(gS),
    drag: Kt(vS)
};

function Na(e) {
    return typeof e == "string" && e.startsWith("var(--")
}
const Gm = /var\((--[a-zA-Z0-9-_]+),? ?([a-zA-Z0-9 ()%#.,-]+)?\)/;

function wS(e) {
    const t = Gm.exec(e);
    if (!t) return [, ];
    const [, n, r] = t;
    return [n, r]
}

function Ta(e, t, n = 1) {
    const [r, i] = wS(e);
    if (!r) return;
    const o = window.getComputedStyle(t).getPropertyValue(r);
    return o ? o.trim() : Na(i) ? Ta(i, t, n + 1) : i
}

function xS(e, {
    ...t
}, n) {
    const r = e.current;
    if (!(r instanceof Element)) return {
        target: t,
        transitionEnd: n
    };
    n && (n = {
        ...n
    }), e.values.forEach(i => {
        const o = i.get();
        if (!Na(o)) return;
        const s = Ta(o, r);
        s && i.set(s)
    });
    for (const i in t) {
        const o = t[i];
        if (!Na(o)) continue;
        const s = Ta(o, r);
        !s || (t[i] = s, n && n[i] === void 0 && (n[i] = o))
    }
    return {
        target: t,
        transitionEnd: n
    }
}
const SS = new Set(["width", "height", "top", "left", "right", "bottom", "x", "y"]),
    Ym = e => SS.has(e),
    CS = e => Object.keys(e).some(Ym),
    Xm = (e, t) => {
        e.set(t, !1), e.set(t)
    },
    Zf = e => e === On || e === z;
var Jf;
(function(e) {
    e.width = "width", e.height = "height", e.left = "left", e.right = "right", e.top = "top", e.bottom = "bottom"
})(Jf || (Jf = {}));
const qf = (e, t) => parseFloat(e.split(", ")[t]),
    ed = (e, t) => (n, {
        transform: r
    }) => {
        if (r === "none" || !r) return 0;
        const i = r.match(/^matrix3d\((.+)\)$/);
        if (i) return qf(i[1], t); {
            const o = r.match(/^matrix\((.+)\)$/);
            return o ? qf(o[1], e) : 0
        }
    },
    kS = new Set(["x", "y", "z"]),
    PS = Bo.filter(e => !kS.has(e));

function ES(e) {
    const t = [];
    return PS.forEach(n => {
        const r = e.getValue(n);
        r !== void 0 && (t.push([n, r.get()]), r.set(n.startsWith("scale") ? 1 : 0))
    }), t.length && e.render(), t
}
const td = {
        width: ({
            x: e
        }, {
            paddingLeft: t = "0",
            paddingRight: n = "0"
        }) => e.max - e.min - parseFloat(t) - parseFloat(n),
        height: ({
            y: e
        }, {
            paddingTop: t = "0",
            paddingBottom: n = "0"
        }) => e.max - e.min - parseFloat(t) - parseFloat(n),
        top: (e, {
            top: t
        }) => parseFloat(t),
        left: (e, {
            left: t
        }) => parseFloat(t),
        bottom: ({
            y: e
        }, {
            top: t
        }) => parseFloat(t) + (e.max - e.min),
        right: ({
            x: e
        }, {
            left: t
        }) => parseFloat(t) + (e.max - e.min),
        x: ed(4, 13),
        y: ed(5, 14)
    },
    NS = (e, t, n) => {
        const r = t.measureViewportBox(),
            i = t.current,
            o = getComputedStyle(i),
            {
                display: s
            } = o,
            l = {};
        s === "none" && t.setStaticValue("display", e.display || "block"), n.forEach(u => {
            l[u] = td[u](r, o)
        }), t.render();
        const a = t.measureViewportBox();
        return n.forEach(u => {
            const c = t.getValue(u);
            Xm(c, l[u]), e[u] = td[u](a, o)
        }), e
    },
    TS = (e, t, n = {}, r = {}) => {
        t = {
            ...t
        }, r = {
            ...r
        };
        const i = Object.keys(t).filter(Ym);
        let o = [],
            s = !1;
        const l = [];
        if (i.forEach(a => {
                const u = e.getValue(a);
                if (!e.hasValue(a)) return;
                let c = n[a],
                    f = Rr(c);
                const d = t[a];
                let m;
                if ($o(d)) {
                    const g = d.length,
                        w = d[0] === null ? 1 : 0;
                    c = d[w], f = Rr(c);
                    for (let k = w; k < g; k++) m ? Ko(Rr(d[k]) === m) : m = Rr(d[k])
                } else m = Rr(d);
                if (f !== m)
                    if (Zf(f) && Zf(m)) {
                        const g = u.get();
                        typeof g == "string" && u.set(parseFloat(g)), typeof d == "string" ? t[a] = parseFloat(d) : Array.isArray(d) && m === z && (t[a] = d.map(parseFloat))
                    } else(f == null ? void 0 : f.transform) && (m == null ? void 0 : m.transform) && (c === 0 || d === 0) ? c === 0 ? u.set(m.transform(c)) : t[a] = f.transform(d) : (s || (o = ES(e), s = !0), l.push(a), r[a] = r[a] !== void 0 ? r[a] : t[a], Xm(u, d))
            }), l.length) {
            const a = l.indexOf("height") >= 0 ? window.pageYOffset : null,
                u = NS(t, e, l);
            return o.length && o.forEach(([c, f]) => {
                e.getValue(c).set(f)
            }), e.render(), An && a !== null && window.scrollTo({
                top: a
            }), {
                target: u,
                transitionEnd: r
            }
        } else return {
            target: t,
            transitionEnd: r
        }
    };

function LS(e, t, n, r) {
    return CS(t) ? TS(e, t, n, r) : {
        target: t,
        transitionEnd: r
    }
}
const RS = (e, t, n, r) => {
        const i = xS(e, t, r);
        return t = i.target, r = i.transitionEnd, LS(e, t, n, r)
    },
    La = {
        current: null
    },
    Zm = {
        current: !1
    };

function _S() {
    if (Zm.current = !0, !!An)
        if (window.matchMedia) {
            const e = window.matchMedia("(prefers-reduced-motion)"),
                t = () => La.current = e.matches;
            e.addListener(t), t()
        } else La.current = !1
}

function DS(e, t, n) {
    const {
        willChange: r
    } = t;
    for (const i in t) {
        const o = t[i],
            s = n[i];
        if (gt(o)) e.addValue(i, o), Wo(r) && r.add(i);
        else if (gt(s)) e.addValue(i, hr(o, {
            owner: e
        })), Wo(r) && r.remove(i);
        else if (s !== o)
            if (e.hasValue(i)) {
                const l = e.getValue(i);
                !l.hasAnimated && l.set(o)
            } else {
                const l = e.getStaticValue(i);
                e.addValue(i, hr(l !== void 0 ? l : o))
            }
    }
    for (const i in n) t[i] === void 0 && e.removeValue(i);
    return t
}
const Jm = Object.keys(vi),
    VS = Jm.length,
    nd = ["AnimationStart", "AnimationComplete", "Update", "Unmount", "BeforeLayoutMeasure", "LayoutMeasure", "LayoutAnimationStart", "LayoutAnimationComplete"];
class AS {
    constructor({
        parent: t,
        props: n,
        reducedMotionConfig: r,
        visualState: i
    }, o = {}) {
        this.current = null, this.children = new Set, this.isVariantNode = !1, this.isControllingVariants = !1, this.shouldReduceMotion = null, this.values = new Map, this.isPresent = !0, this.valueSubscriptions = new Map, this.prevMotionValues = {}, this.events = {}, this.propEventSubscriptions = {}, this.notifyUpdate = () => this.notify("Update", this.latestValues), this.render = () => {
            !this.current || (this.triggerBuild(), this.renderInstance(this.current, this.renderState, this.props.style, this.projection))
        }, this.scheduleRender = () => Ue.render(this.render, !1, !0);
        const {
            latestValues: s,
            renderState: l
        } = i;
        this.latestValues = s, this.baseTarget = {
            ...s
        }, this.initialValues = n.initial ? {
            ...s
        } : {}, this.renderState = l, this.parent = t, this.props = n, this.depth = t ? t.depth + 1 : 0, this.reducedMotionConfig = r, this.options = o, this.isControllingVariants = Ss(n), this.isVariantNode = Wh(n), this.isVariantNode && (this.variantChildren = new Set), this.manuallyAnimateOnMount = Boolean(t && t.current);
        const {
            willChange: a,
            ...u
        } = this.scrapeMotionValuesFromProps(n);
        for (const c in u) {
            const f = u[c];
            s[c] !== void 0 && gt(f) && (f.set(s[c], !1), Wo(a) && a.add(c))
        }
    }
    scrapeMotionValuesFromProps(t) {
        return {}
    }
    mount(t) {
        var n;
        this.current = t, this.projection && this.projection.mount(t), this.parent && this.isVariantNode && !this.isControllingVariants && (this.removeFromVariantTree = (n = this.parent) === null || n === void 0 ? void 0 : n.addVariantChild(this)), this.values.forEach((r, i) => this.bindToMotionValue(i, r)), Zm.current || _S(), this.shouldReduceMotion = this.reducedMotionConfig === "never" ? !1 : this.reducedMotionConfig === "always" ? !0 : La.current, this.parent && this.parent.children.add(this), this.setProps(this.props)
    }
    unmount() {
        var t, n, r;
        (t = this.projection) === null || t === void 0 || t.unmount(), on.update(this.notifyUpdate), on.render(this.render), this.valueSubscriptions.forEach(i => i()), (n = this.removeFromVariantTree) === null || n === void 0 || n.call(this), (r = this.parent) === null || r === void 0 || r.children.delete(this);
        for (const i in this.events) this.events[i].clear();
        this.current = null
    }
    bindToMotionValue(t, n) {
        const r = Mn.has(t),
            i = n.on("change", s => {
                this.latestValues[t] = s, this.props.onUpdate && Ue.update(this.notifyUpdate, !1, !0), r && this.projection && (this.projection.isTransformDirty = !0)
            }),
            o = n.on("renderRequest", this.scheduleRender);
        this.valueSubscriptions.set(t, () => {
            i(), o()
        })
    }
    sortNodePosition(t) {
        return !this.current || !this.sortInstanceNodePosition || this.type !== t.type ? 0 : this.sortInstanceNodePosition(this.current, t.current)
    }
    loadFeatures(t, n, r, i, o, s) {
        const l = [];
        for (let a = 0; a < VS; a++) {
            const u = Jm[a],
                {
                    isEnabled: c,
                    Component: f
                } = vi[u];
            c(t) && f && l.push(S.exports.createElement(f, {
                key: u,
                ...t,
                visualElement: this
            }))
        }
        if (!this.projection && o) {
            this.projection = new o(i, this.latestValues, this.parent && this.parent.projection);
            const {
                layoutId: a,
                layout: u,
                drag: c,
                dragConstraints: f,
                layoutScroll: d
            } = t;
            this.projection.setOptions({
                layoutId: a,
                layout: u,
                alwaysMeasureLayout: Boolean(c) || f && Xn(f),
                visualElement: this,
                scheduleRender: () => this.scheduleRender(),
                animationType: typeof u == "string" ? u : "both",
                initialPromotionConfig: s,
                layoutScroll: d
            })
        }
        return l
    }
    triggerBuild() {
        this.build(this.renderState, this.latestValues, this.options, this.props)
    }
    measureViewportBox() {
        return this.current ? this.measureInstanceViewportBox(this.current, this.props) : fe()
    }
    getStaticValue(t) {
        return this.latestValues[t]
    }
    setStaticValue(t, n) {
        this.latestValues[t] = n
    }
    makeTargetAnimatable(t, n = !0) {
        return this.makeTargetAnimatableFromInstance(t, this.props, n)
    }
    setProps(t) {
        (t.transformTemplate || this.props.transformTemplate) && this.scheduleRender(), this.props = t;
        for (let n = 0; n < nd.length; n++) {
            const r = nd[n];
            this.propEventSubscriptions[r] && (this.propEventSubscriptions[r](), delete this.propEventSubscriptions[r]);
            const i = t["on" + r];
            i && (this.propEventSubscriptions[r] = this.on(r, i))
        }
        this.prevMotionValues = DS(this, this.scrapeMotionValuesFromProps(t), this.prevMotionValues)
    }
    getProps() {
        return this.props
    }
    getVariant(t) {
        var n;
        return (n = this.props.variants) === null || n === void 0 ? void 0 : n[t]
    }
    getDefaultTransition() {
        return this.props.transition
    }
    getTransformPagePoint() {
        return this.props.transformPagePoint
    }
    getClosestVariantNode() {
        var t;
        return this.isVariantNode ? this : (t = this.parent) === null || t === void 0 ? void 0 : t.getClosestVariantNode()
    }
    getVariantContext(t = !1) {
        var n, r;
        if (t) return (n = this.parent) === null || n === void 0 ? void 0 : n.getVariantContext();
        if (!this.isControllingVariants) {
            const o = ((r = this.parent) === null || r === void 0 ? void 0 : r.getVariantContext()) || {};
            return this.props.initial !== void 0 && (o.initial = this.props.initial), o
        }
        const i = {};
        for (let o = 0; o < MS; o++) {
            const s = qm[o],
                l = this.props[s];
            (mi(l) || l === !1) && (i[s] = l)
        }
        return i
    }
    addVariantChild(t) {
        var n;
        const r = this.getClosestVariantNode();
        if (r) return (n = r.variantChildren) === null || n === void 0 || n.add(t), () => r.variantChildren.delete(t)
    }
    addValue(t, n) {
        this.hasValue(t) && this.removeValue(t), this.values.set(t, n), this.latestValues[t] = n.get(), this.bindToMotionValue(t, n)
    }
    removeValue(t) {
        var n;
        this.values.delete(t), (n = this.valueSubscriptions.get(t)) === null || n === void 0 || n(), this.valueSubscriptions.delete(t), delete this.latestValues[t], this.removeValueFromRenderState(t, this.renderState)
    }
    hasValue(t) {
        return this.values.has(t)
    }
    getValue(t, n) {
        if (this.props.values && this.props.values[t]) return this.props.values[t];
        let r = this.values.get(t);
        return r === void 0 && n !== void 0 && (r = hr(n, {
            owner: this
        }), this.addValue(t, r)), r
    }
    readValue(t) {
        return this.latestValues[t] !== void 0 || !this.current ? this.latestValues[t] : this.readValueFromInstance(this.current, t, this.options)
    }
    setBaseTarget(t, n) {
        this.baseTarget[t] = n
    }
    getBaseTarget(t) {
        var n;
        const {
            initial: r
        } = this.props, i = typeof r == "string" || typeof r == "object" ? (n = Fu(this.props, r)) === null || n === void 0 ? void 0 : n[t] : void 0;
        if (r && i !== void 0) return i;
        const o = this.getBaseTargetFromProps(this.props, t);
        return o !== void 0 && !gt(o) ? o : this.initialValues[t] !== void 0 && i === void 0 ? void 0 : this.baseTarget[t]
    }
    on(t, n) {
        return this.events[t] || (this.events[t] = new Uu), this.events[t].add(n)
    }
    notify(t, ...n) {
        var r;
        (r = this.events[t]) === null || r === void 0 || r.notify(...n)
    }
}
const qm = ["initial", ...ec],
    MS = qm.length;
class ev extends AS {
    sortInstanceNodePosition(t, n) {
        return t.compareDocumentPosition(n) & 2 ? 1 : -1
    }
    getBaseTargetFromProps(t, n) {
        var r;
        return (r = t.style) === null || r === void 0 ? void 0 : r[n]
    }
    removeValueFromRenderState(t, {
        vars: n,
        style: r
    }) {
        delete n[t], delete r[t]
    }
    makeTargetAnimatableFromInstance({
        transition: t,
        transitionEnd: n,
        ...r
    }, {
        transformValues: i
    }, o) {
        let s = $w(r, t || {}, this);
        if (i && (n && (n = i(n)), r && (r = i(r)), s && (s = i(s))), o) {
            Bw(this, r, s);
            const l = RS(this, r, s, n);
            n = l.transitionEnd, r = l.target
        }
        return {
            transition: t,
            transitionEnd: n,
            ...r
        }
    }
}

function OS(e) {
    return window.getComputedStyle(e)
}
class IS extends ev {
    readValueFromInstance(t, n) {
        if (Mn.has(n)) {
            const r = Hu(n);
            return r && r.default || 0
        } else {
            const r = OS(t),
                i = (Yh(n) ? r.getPropertyValue(n) : r[n]) || 0;
            return typeof i == "string" ? i.trim() : i
        }
    }
    measureInstanceViewportBox(t, {
        transformPagePoint: n
    }) {
        return Qm(t, n)
    }
    build(t, n, r, i) {
        Du(t, n, r, i.transformTemplate)
    }
    scrapeMotionValuesFromProps(t) {
        return Iu(t)
    }
    renderInstance(t, n, r, i) {
        em(t, n, r, i)
    }
}
class FS extends ev {
    constructor() {
        super(...arguments), this.isSVGTag = !1
    }
    getBaseTargetFromProps(t, n) {
        return t[n]
    }
    readValueFromInstance(t, n) {
        var r;
        return Mn.has(n) ? ((r = Hu(n)) === null || r === void 0 ? void 0 : r.default) || 0 : (n = tm.has(n) ? n : Ou(n), t.getAttribute(n))
    }
    measureInstanceViewportBox() {
        return fe()
    }
    scrapeMotionValuesFromProps(t) {
        return rm(t)
    }
    build(t, n, r, i) {
        Au(t, n, r, this.isSVGTag, i.transformTemplate)
    }
    renderInstance(t, n, r, i) {
        nm(t, n, r, i)
    }
    mount(t) {
        this.isSVGTag = Mu(t.tagName), super.mount(t)
    }
}
const jS = (e, t) => _u(e) ? new FS(t, {
    enableHardwareAcceleration: !1
}) : new IS(t, {
    enableHardwareAcceleration: !0
});

function rd(e, t) {
    return t.max === t.min ? 0 : e / (t.max - t.min) * 100
}
const _r = {
        correct: (e, t) => {
            if (!t.target) return e;
            if (typeof e == "string")
                if (z.test(e)) e = parseFloat(e);
                else return e;
            const n = rd(e, t.target.x),
                r = rd(e, t.target.y);
            return `${n}% ${r}%`
        }
    },
    id = "_$css",
    zS = {
        correct: (e, {
            treeScale: t,
            projectionDelta: n
        }) => {
            const r = e,
                i = e.includes("var("),
                o = [];
            i && (e = e.replace(Gm, m => (o.push(m), id)));
            const s = sn.parse(e);
            if (s.length > 5) return r;
            const l = sn.createTransformer(e),
                a = typeof s[0] != "number" ? 1 : 0,
                u = n.x.scale * t.x,
                c = n.y.scale * t.y;
            s[0 + a] /= u, s[1 + a] /= c;
            const f = se(u, c, .5);
            typeof s[2 + a] == "number" && (s[2 + a] /= f), typeof s[3 + a] == "number" && (s[3 + a] /= f);
            let d = l(s);
            if (i) {
                let m = 0;
                d = d.replace(id, () => {
                    const g = o[m];
                    return m++, g
                })
            }
            return d
        }
    };
class BS extends Jo.Component {
    componentDidMount() {
        const {
            visualElement: t,
            layoutGroup: n,
            switchLayoutGroup: r,
            layoutId: i
        } = this.props, {
            projection: o
        } = t;
        p1($S), o && (n.group && n.group.add(o), r && r.register && i && r.register(o), o.root.didUpdate(), o.addEventListener("animationComplete", () => {
            this.safeToRemove()
        }), o.setOptions({
            ...o.options,
            onExitComplete: () => this.safeToRemove()
        })), Wr.hasEverUpdated = !0
    }
    getSnapshotBeforeUpdate(t) {
        const {
            layoutDependency: n,
            visualElement: r,
            drag: i,
            isPresent: o
        } = this.props, s = r.projection;
        return s && (s.isPresent = o, i || t.layoutDependency !== n || n === void 0 ? s.willUpdate() : this.safeToRemove(), t.isPresent !== o && (o ? s.promote() : s.relegate() || Ue.postRender(() => {
            var l;
            !((l = s.getStack()) === null || l === void 0) && l.members.length || this.safeToRemove()
        }))), null
    }
    componentDidUpdate() {
        const {
            projection: t
        } = this.props.visualElement;
        t && (t.root.didUpdate(), !t.currentAnimation && t.isLead() && this.safeToRemove())
    }
    componentWillUnmount() {
        const {
            visualElement: t,
            layoutGroup: n,
            switchLayoutGroup: r
        } = this.props, {
            projection: i
        } = t;
        i && (i.scheduleCheckAfterUnmount(), n != null && n.group && n.group.remove(i), r != null && r.deregister && r.deregister(i))
    }
    safeToRemove() {
        const {
            safeToRemove: t
        } = this.props;
        t == null || t()
    }
    render() {
        return null
    }
}

function US(e) {
    const [t, n] = hm(), r = S.exports.useContext(Kh);
    return y(BS, {
        ...e,
        layoutGroup: r,
        switchLayoutGroup: S.exports.useContext(Qh),
        isPresent: t,
        safeToRemove: n
    })
}
const $S = {
        borderRadius: {
            ..._r,
            applyTo: ["borderTopLeftRadius", "borderTopRightRadius", "borderBottomLeftRadius", "borderBottomRightRadius"]
        },
        borderTopLeftRadius: _r,
        borderTopRightRadius: _r,
        borderBottomLeftRadius: _r,
        borderBottomRightRadius: _r,
        boxShadow: zS
    },
    bS = {
        measureLayout: US
    };

function HS(e, t, n = {}) {
    const r = gt(e) ? e : hr(e);
    return r.start(qu("", r, t, n)), {
        stop: () => r.stop(),
        isAnimating: () => r.isAnimating()
    }
}
const tv = ["TopLeft", "TopRight", "BottomLeft", "BottomRight"],
    WS = tv.length,
    od = e => typeof e == "string" ? parseFloat(e) : e,
    sd = e => typeof e == "number" || z.test(e);

function KS(e, t, n, r, i, o) {
    i ? (e.opacity = se(0, n.opacity !== void 0 ? n.opacity : 1, QS(r)), e.opacityExit = se(t.opacity !== void 0 ? t.opacity : 1, 0, GS(r))) : o && (e.opacity = se(t.opacity !== void 0 ? t.opacity : 1, n.opacity !== void 0 ? n.opacity : 1, r));
    for (let s = 0; s < WS; s++) {
        const l = `border${tv[s]}Radius`;
        let a = ld(t, l),
            u = ld(n, l);
        if (a === void 0 && u === void 0) continue;
        a || (a = 0), u || (u = 0), a === 0 || u === 0 || sd(a) === sd(u) ? (e[l] = Math.max(se(od(a), od(u), r), 0), (mt.test(u) || mt.test(a)) && (e[l] += "%")) : e[l] = u
    }(t.rotate || n.rotate) && (e.rotate = se(t.rotate || 0, n.rotate || 0, r))
}

function ld(e, t) {
    return e[t] !== void 0 ? e[t] : e.borderRadius
}
const QS = nv(0, .5, Zu),
    GS = nv(.5, .95, Xu);

function nv(e, t, n) {
    return r => r < e ? 0 : r > t ? 1 : n(Qo(e, t, r))
}

function ad(e, t) {
    e.min = t.min, e.max = t.max
}

function tt(e, t) {
    ad(e.x, t.x), ad(e.y, t.y)
}

function ud(e, t, n, r, i) {
    return e -= t, e = Xo(e, 1 / n, r), i !== void 0 && (e = Xo(e, 1 / i, r)), e
}

function YS(e, t = 0, n = 1, r = .5, i, o = e, s = e) {
    if (mt.test(t) && (t = parseFloat(t), t = se(s.min, s.max, t / 100) - s.min), typeof t != "number") return;
    let l = se(o.min, o.max, r);
    e === o && (l -= t), e.min = ud(e.min, t, n, l, i), e.max = ud(e.max, t, n, l, i)
}

function cd(e, t, [n, r, i], o, s) {
    YS(e, t[n], t[r], t[i], t.scale, o, s)
}
const XS = ["x", "scaleX", "originX"],
    ZS = ["y", "scaleY", "originY"];

function fd(e, t, n, r) {
    cd(e.x, t, XS, n == null ? void 0 : n.x, r == null ? void 0 : r.x), cd(e.y, t, ZS, n == null ? void 0 : n.y, r == null ? void 0 : r.y)
}

function dd(e) {
    return e.translate === 0 && e.scale === 1
}

function rv(e) {
    return dd(e.x) && dd(e.y)
}

function iv(e, t) {
    return e.x.min === t.x.min && e.x.max === t.x.max && e.y.min === t.y.min && e.y.max === t.y.max
}

function pd(e) {
    return be(e.x) / be(e.y)
}
class JS {
    constructor() {
        this.members = []
    }
    add(t) {
        zu(this.members, t), t.scheduleRender()
    }
    remove(t) {
        if (Bu(this.members, t), t === this.prevLead && (this.prevLead = void 0), t === this.lead) {
            const n = this.members[this.members.length - 1];
            n && this.promote(n)
        }
    }
    relegate(t) {
        const n = this.members.findIndex(i => t === i);
        if (n === 0) return !1;
        let r;
        for (let i = n; i >= 0; i--) {
            const o = this.members[i];
            if (o.isPresent !== !1) {
                r = o;
                break
            }
        }
        return r ? (this.promote(r), !0) : !1
    }
    promote(t, n) {
        var r;
        const i = this.lead;
        if (t !== i && (this.prevLead = i, this.lead = t, t.show(), i)) {
            i.instance && i.scheduleRender(), t.scheduleRender(), t.resumeFrom = i, n && (t.resumeFrom.preserveOpacity = !0), i.snapshot && (t.snapshot = i.snapshot, t.snapshot.latestValues = i.animationValues || i.latestValues), !((r = t.root) === null || r === void 0) && r.isUpdating && (t.isLayoutDirty = !0);
            const {
                crossfade: o
            } = t.options;
            o === !1 && i.hide()
        }
    }
    exitAnimationComplete() {
        this.members.forEach(t => {
            var n, r, i, o, s;
            (r = (n = t.options).onExitComplete) === null || r === void 0 || r.call(n), (s = (i = t.resumingFrom) === null || i === void 0 ? void 0 : (o = i.options).onExitComplete) === null || s === void 0 || s.call(o)
        })
    }
    scheduleRender() {
        this.members.forEach(t => {
            t.instance && t.scheduleRender(!1)
        })
    }
    removeLeadSnapshot() {
        this.lead && this.lead.snapshot && (this.lead.snapshot = void 0)
    }
}

function hd(e, t, n) {
    let r = "";
    const i = e.x.translate / t.x,
        o = e.y.translate / t.y;
    if ((i || o) && (r = `translate3d(${i}px, ${o}px, 0) `), (t.x !== 1 || t.y !== 1) && (r += `scale(${1/t.x}, ${1/t.y}) `), n) {
        const {
            rotate: a,
            rotateX: u,
            rotateY: c
        } = n;
        a && (r += `rotate(${a}deg) `), u && (r += `rotateX(${u}deg) `), c && (r += `rotateY(${c}deg) `)
    }
    const s = e.x.scale * t.x,
        l = e.y.scale * t.y;
    return (s !== 1 || l !== 1) && (r += `scale(${s}, ${l})`), r || "none"
}
const qS = (e, t) => e.depth - t.depth;
class eC {
    constructor() {
        this.children = [], this.isDirty = !1
    }
    add(t) {
        zu(this.children, t), this.isDirty = !0
    }
    remove(t) {
        Bu(this.children, t), this.isDirty = !0
    }
    forEach(t) {
        this.isDirty && this.children.sort(qS), this.isDirty = !1, this.children.forEach(t)
    }
}
const md = ["", "X", "Y", "Z"],
    vd = 1e3;
let tC = 0;

function ov({
    attachResizeListener: e,
    defaultParent: t,
    measureScroll: n,
    checkIsScrollRoot: r,
    resetTransform: i
}) {
    return class {
        constructor(s, l = {}, a = t == null ? void 0 : t()) {
            this.id = tC++, this.animationId = 0, this.children = new Set, this.options = {}, this.isTreeAnimating = !1, this.isAnimationBlocked = !1, this.isLayoutDirty = !1, this.isTransformDirty = !1, this.isProjectionDirty = !1, this.updateManuallyBlocked = !1, this.updateBlockedByResize = !1, this.isUpdating = !1, this.isSVG = !1, this.needsReset = !1, this.shouldResetTransform = !1, this.treeScale = {
                x: 1,
                y: 1
            }, this.eventHandlers = new Map, this.potentialNodes = new Map, this.checkUpdateFailed = () => {
                this.isUpdating && (this.isUpdating = !1, this.clearAllSnapshots())
            }, this.updateProjection = () => {
                this.nodes.forEach(iC), this.nodes.forEach(lC), this.nodes.forEach(aC)
            }, this.hasProjected = !1, this.isVisible = !0, this.animationProgress = 0, this.sharedNodes = new Map, this.elementId = s, this.latestValues = l, this.root = a ? a.root || a : this, this.path = a ? [...a.path, a] : [], this.parent = a, this.depth = a ? a.depth + 1 : 0, s && this.root.registerPotentialNode(s, this);
            for (let u = 0; u < this.path.length; u++) this.path[u].shouldResetTransform = !0;
            this.root === this && (this.nodes = new eC)
        }
        addEventListener(s, l) {
            return this.eventHandlers.has(s) || this.eventHandlers.set(s, new Uu), this.eventHandlers.get(s).add(l)
        }
        notifyListeners(s, ...l) {
            const a = this.eventHandlers.get(s);
            a == null || a.notify(...l)
        }
        hasListeners(s) {
            return this.eventHandlers.has(s)
        }
        registerPotentialNode(s, l) {
            this.potentialNodes.set(s, l)
        }
        mount(s, l = !1) {
            var a;
            if (this.instance) return;
            this.isSVG = s instanceof SVGElement && s.tagName !== "svg", this.instance = s;
            const {
                layoutId: u,
                layout: c,
                visualElement: f
            } = this.options;
            if (f && !f.current && f.mount(s), this.root.nodes.add(this), (a = this.parent) === null || a === void 0 || a.children.add(this), this.elementId && this.root.potentialNodes.delete(this.elementId), l && (c || u) && (this.isLayoutDirty = !0), e) {
                let d;
                const m = () => this.root.updateBlockedByResize = !1;
                e(s, () => {
                    this.root.updateBlockedByResize = !0, d && d(), d = jm(m, 250), Wr.hasAnimatedSinceResize && (Wr.hasAnimatedSinceResize = !1, this.nodes.forEach(yd))
                })
            }
            u && this.root.registerSharedNode(u, this), this.options.animate !== !1 && f && (u || c) && this.addEventListener("didUpdate", ({
                delta: d,
                hasLayoutChanged: m,
                hasRelativeTargetChanged: g,
                layout: w
            }) => {
                var k, h, p, v, x;
                if (this.isTreeAnimationBlocked()) {
                    this.target = void 0, this.relativeTarget = void 0;
                    return
                }
                const P = (h = (k = this.options.transition) !== null && k !== void 0 ? k : f.getDefaultTransition()) !== null && h !== void 0 ? h : pC,
                    {
                        onLayoutAnimationStart: T,
                        onLayoutAnimationComplete: L
                    } = f.getProps(),
                    D = !this.targetLayout || !iv(this.targetLayout, w) || g,
                    B = !m && g;
                if (((p = this.resumeFrom) === null || p === void 0 ? void 0 : p.instance) || B || m && (D || !this.currentAnimation)) {
                    this.resumeFrom && (this.resumingFrom = this.resumeFrom, this.resumingFrom.resumingFrom = void 0), this.setAnimationOrigin(d, B);
                    const I = {
                        ...zm(P, "layout"),
                        onPlay: T,
                        onComplete: L
                    };
                    f.shouldReduceMotion && (I.delay = 0, I.type = !1), this.startAnimation(I)
                } else !m && this.animationProgress === 0 && yd(this), this.isLead() && ((x = (v = this.options).onExitComplete) === null || x === void 0 || x.call(v));
                this.targetLayout = w
            })
        }
        unmount() {
            var s, l;
            this.options.layoutId && this.willUpdate(), this.root.nodes.remove(this), (s = this.getStack()) === null || s === void 0 || s.remove(this), (l = this.parent) === null || l === void 0 || l.children.delete(this), this.instance = void 0, on.preRender(this.updateProjection)
        }
        blockUpdate() {
            this.updateManuallyBlocked = !0
        }
        unblockUpdate() {
            this.updateManuallyBlocked = !1
        }
        isUpdateBlocked() {
            return this.updateManuallyBlocked || this.updateBlockedByResize
        }
        isTreeAnimationBlocked() {
            var s;
            return this.isAnimationBlocked || ((s = this.parent) === null || s === void 0 ? void 0 : s.isTreeAnimationBlocked()) || !1
        }
        startUpdate() {
            var s;
            this.isUpdateBlocked() || (this.isUpdating = !0, (s = this.nodes) === null || s === void 0 || s.forEach(uC), this.animationId++)
        }
        willUpdate(s = !0) {
            var l, a, u;
            if (this.root.isUpdateBlocked()) {
                (a = (l = this.options).onExitComplete) === null || a === void 0 || a.call(l);
                return
            }
            if (!this.root.isUpdating && this.root.startUpdate(), this.isLayoutDirty) return;
            this.isLayoutDirty = !0;
            for (let m = 0; m < this.path.length; m++) {
                const g = this.path[m];
                g.shouldResetTransform = !0, g.updateScroll("snapshot")
            }
            const {
                layoutId: c,
                layout: f
            } = this.options;
            if (c === void 0 && !f) return;
            const d = (u = this.options.visualElement) === null || u === void 0 ? void 0 : u.getProps().transformTemplate;
            this.prevTransformTemplateValue = d == null ? void 0 : d(this.latestValues, ""), this.updateSnapshot(), s && this.notifyListeners("willUpdate")
        }
        didUpdate() {
            if (this.isUpdateBlocked()) {
                this.unblockUpdate(), this.clearAllSnapshots(), this.nodes.forEach(gd);
                return
            }!this.isUpdating || (this.isUpdating = !1, this.potentialNodes.size && (this.potentialNodes.forEach(hC), this.potentialNodes.clear()), this.nodes.forEach(sC), this.nodes.forEach(nC), this.nodes.forEach(rC), this.clearAllSnapshots(), rl.update(), rl.preRender(), rl.render())
        }
        clearAllSnapshots() {
            this.nodes.forEach(oC), this.sharedNodes.forEach(cC)
        }
        scheduleUpdateProjection() {
            Ue.preRender(this.updateProjection, !1, !0)
        }
        scheduleCheckAfterUnmount() {
            Ue.postRender(() => {
                this.isLayoutDirty ? this.root.didUpdate() : this.root.checkUpdateFailed()
            })
        }
        updateSnapshot() {
            this.snapshot || !this.instance || (this.snapshot = this.measure())
        }
        updateLayout() {
            var s;
            if (!this.instance || (this.updateScroll(), !(this.options.alwaysMeasureLayout && this.isLead()) && !this.isLayoutDirty)) return;
            if (this.resumeFrom && !this.resumeFrom.instance)
                for (let a = 0; a < this.path.length; a++) this.path[a].updateScroll();
            const l = this.layout;
            this.layout = this.measure(!1), this.layoutCorrected = fe(), this.isLayoutDirty = !1, this.projectionDelta = void 0, this.notifyListeners("measure", this.layout.layoutBox), (s = this.options.visualElement) === null || s === void 0 || s.notify("LayoutMeasure", this.layout.layoutBox, l == null ? void 0 : l.layoutBox)
        }
        updateScroll(s = "measure") {
            let l = Boolean(this.options.layoutScroll && this.instance);
            this.scroll && this.scroll.animationId === this.root.animationId && this.scroll.phase === s && (l = !1), l && (this.scroll = {
                animationId: this.root.animationId,
                phase: s,
                isRoot: r(this.instance),
                offset: n(this.instance)
            })
        }
        resetTransform() {
            var s;
            if (!i) return;
            const l = this.isLayoutDirty || this.shouldResetTransform,
                a = this.projectionDelta && !rv(this.projectionDelta),
                u = (s = this.options.visualElement) === null || s === void 0 ? void 0 : s.getProps().transformTemplate,
                c = u == null ? void 0 : u(this.latestValues, ""),
                f = c !== this.prevTransformTemplateValue;
            l && (a || vn(this.latestValues) || f) && (i(this.instance, c), this.shouldResetTransform = !1, this.scheduleRender())
        }
        measure(s = !0) {
            const l = this.measurePageBox();
            let a = this.removeElementScroll(l);
            return s && (a = this.removeTransform(a)), mC(a), {
                animationId: this.root.animationId,
                measuredBox: l,
                layoutBox: a,
                latestValues: {},
                source: this.id
            }
        }
        measurePageBox() {
            const {
                visualElement: s
            } = this.options;
            if (!s) return fe();
            const l = s.measureViewportBox(),
                {
                    scroll: a
                } = this.root;
            return a && (Bt(l.x, a.offset.x), Bt(l.y, a.offset.y)), l
        }
        removeElementScroll(s) {
            const l = fe();
            tt(l, s);
            for (let a = 0; a < this.path.length; a++) {
                const u = this.path[a],
                    {
                        scroll: c,
                        options: f
                    } = u;
                if (u !== this.root && c && f.layoutScroll) {
                    if (c.isRoot) {
                        tt(l, s);
                        const {
                            scroll: d
                        } = this.root;
                        d && (Bt(l.x, -d.offset.x), Bt(l.y, -d.offset.y))
                    }
                    Bt(l.x, c.offset.x), Bt(l.y, c.offset.y)
                }
            }
            return l
        }
        applyTransform(s, l = !1) {
            const a = fe();
            tt(a, s);
            for (let u = 0; u < this.path.length; u++) {
                const c = this.path[u];
                !l && c.options.layoutScroll && c.scroll && c !== c.root && Jn(a, {
                    x: -c.scroll.offset.x,
                    y: -c.scroll.offset.y
                }), vn(c.latestValues) && Jn(a, c.latestValues)
            }
            return vn(this.latestValues) && Jn(a, this.latestValues), a
        }
        removeTransform(s) {
            var l;
            const a = fe();
            tt(a, s);
            for (let u = 0; u < this.path.length; u++) {
                const c = this.path[u];
                if (!c.instance || !vn(c.latestValues)) continue;
                Pa(c.latestValues) && c.updateSnapshot();
                const f = fe(),
                    d = c.measurePageBox();
                tt(f, d), fd(a, c.latestValues, (l = c.snapshot) === null || l === void 0 ? void 0 : l.layoutBox, f)
            }
            return vn(this.latestValues) && fd(a, this.latestValues), a
        }
        setTargetDelta(s) {
            this.targetDelta = s, this.isProjectionDirty = !0, this.root.scheduleUpdateProjection()
        }
        setOptions(s) {
            this.options = {
                ...this.options,
                ...s,
                crossfade: s.crossfade !== void 0 ? s.crossfade : !0
            }
        }
        clearMeasurements() {
            this.scroll = void 0, this.layout = void 0, this.snapshot = void 0, this.prevTransformTemplateValue = void 0, this.targetDelta = void 0, this.target = void 0, this.isLayoutDirty = !1
        }
        resolveTargetDelta() {
            var s;
            const l = this.getLead();
            if (this.isProjectionDirty || (this.isProjectionDirty = l.isProjectionDirty), this.isTransformDirty || (this.isTransformDirty = l.isTransformDirty), !this.isProjectionDirty && !this.attemptToResolveRelativeTarget) return;
            const {
                layout: a,
                layoutId: u
            } = this.options;
            if (!(!this.layout || !(a || u))) {
                if (!this.targetDelta && !this.relativeTarget) {
                    const c = this.getClosestProjectingParent();
                    c && c.layout ? (this.relativeParent = c, this.relativeTarget = fe(), this.relativeTargetOrigin = fe(), Yr(this.relativeTargetOrigin, this.layout.layoutBox, c.layout.layoutBox), tt(this.relativeTarget, this.relativeTargetOrigin)) : this.relativeParent = this.relativeTarget = void 0
                }
                if (!(!this.relativeTarget && !this.targetDelta) && (this.target || (this.target = fe(), this.targetWithTransforms = fe()), this.relativeTarget && this.relativeTargetOrigin && ((s = this.relativeParent) === null || s === void 0 ? void 0 : s.target) ? eS(this.target, this.relativeTarget, this.relativeParent.target) : this.targetDelta ? (Boolean(this.resumingFrom) ? this.target = this.applyTransform(this.layout.layoutBox) : tt(this.target, this.layout.layoutBox), Km(this.target, this.targetDelta)) : tt(this.target, this.layout.layoutBox), this.attemptToResolveRelativeTarget)) {
                    this.attemptToResolveRelativeTarget = !1;
                    const c = this.getClosestProjectingParent();
                    c && Boolean(c.resumingFrom) === Boolean(this.resumingFrom) && !c.options.layoutScroll && c.target ? (this.relativeParent = c, this.relativeTarget = fe(), this.relativeTargetOrigin = fe(), Yr(this.relativeTargetOrigin, this.target, c.target), tt(this.relativeTarget, this.relativeTargetOrigin)) : this.relativeParent = this.relativeTarget = void 0
                }
            }
        }
        getClosestProjectingParent() {
            if (!(!this.parent || Pa(this.parent.latestValues) || Wm(this.parent.latestValues))) return (this.parent.relativeTarget || this.parent.targetDelta) && this.parent.layout ? this.parent : this.parent.getClosestProjectingParent()
        }
        calcProjection() {
            var s;
            const {
                isProjectionDirty: l,
                isTransformDirty: a
            } = this;
            this.isProjectionDirty = this.isTransformDirty = !1;
            const u = this.getLead(),
                c = Boolean(this.resumingFrom) || this !== u;
            let f = !0;
            if (l && (f = !1), c && a && (f = !1), f) return;
            const {
                layout: d,
                layoutId: m
            } = this.options;
            if (this.isTreeAnimating = Boolean(((s = this.parent) === null || s === void 0 ? void 0 : s.isTreeAnimating) || this.currentAnimation || this.pendingAnimation), this.isTreeAnimating || (this.targetDelta = this.relativeTarget = void 0), !this.layout || !(d || m)) return;
            tt(this.layoutCorrected, this.layout.layoutBox), uS(this.layoutCorrected, this.treeScale, this.path, c);
            const {
                target: g
            } = u;
            if (!g) return;
            this.projectionDelta || (this.projectionDelta = Xr(), this.projectionDeltaWithTransform = Xr());
            const w = this.treeScale.x,
                k = this.treeScale.y,
                h = this.projectionTransform;
            Gr(this.projectionDelta, this.layoutCorrected, g, this.latestValues), this.projectionTransform = hd(this.projectionDelta, this.treeScale), (this.projectionTransform !== h || this.treeScale.x !== w || this.treeScale.y !== k) && (this.hasProjected = !0, this.scheduleRender(), this.notifyListeners("projectionUpdate", g))
        }
        hide() {
            this.isVisible = !1
        }
        show() {
            this.isVisible = !0
        }
        scheduleRender(s = !0) {
            var l, a, u;
            (a = (l = this.options).scheduleRender) === null || a === void 0 || a.call(l), s && ((u = this.getStack()) === null || u === void 0 || u.scheduleRender()), this.resumingFrom && !this.resumingFrom.instance && (this.resumingFrom = void 0)
        }
        setAnimationOrigin(s, l = !1) {
            var a, u;
            const c = this.snapshot,
                f = (c == null ? void 0 : c.latestValues) || {},
                d = {
                    ...this.latestValues
                },
                m = Xr();
            this.relativeTarget = this.relativeTargetOrigin = void 0, this.attemptToResolveRelativeTarget = !l;
            const g = fe(),
                w = (c == null ? void 0 : c.source) !== ((a = this.layout) === null || a === void 0 ? void 0 : a.source),
                k = (((u = this.getStack()) === null || u === void 0 ? void 0 : u.members.length) || 0) <= 1,
                h = Boolean(w && !k && this.options.crossfade === !0 && !this.path.some(dC));
            this.animationProgress = 0, this.mixTargetDelta = p => {
                var v;
                const x = p / 1e3;
                wd(m.x, s.x, x), wd(m.y, s.y, x), this.setTargetDelta(m), this.relativeTarget && this.relativeTargetOrigin && this.layout && ((v = this.relativeParent) === null || v === void 0 ? void 0 : v.layout) && (Yr(g, this.layout.layoutBox, this.relativeParent.layout.layoutBox), fC(this.relativeTarget, this.relativeTargetOrigin, g, x)), w && (this.animationValues = d, KS(d, f, this.latestValues, x, h, k)), this.root.scheduleUpdateProjection(), this.scheduleRender(), this.animationProgress = x
            }, this.mixTargetDelta(0)
        }
        startAnimation(s) {
            var l, a;
            this.notifyListeners("animationStart"), (l = this.currentAnimation) === null || l === void 0 || l.stop(), this.resumingFrom && ((a = this.resumingFrom.currentAnimation) === null || a === void 0 || a.stop()), this.pendingAnimation && (on.update(this.pendingAnimation), this.pendingAnimation = void 0), this.pendingAnimation = Ue.update(() => {
                Wr.hasAnimatedSinceResize = !0, this.currentAnimation = HS(0, vd, {
                    ...s,
                    onUpdate: u => {
                        var c;
                        this.mixTargetDelta(u), (c = s.onUpdate) === null || c === void 0 || c.call(s, u)
                    },
                    onComplete: () => {
                        var u;
                        (u = s.onComplete) === null || u === void 0 || u.call(s), this.completeAnimation()
                    }
                }), this.resumingFrom && (this.resumingFrom.currentAnimation = this.currentAnimation), this.pendingAnimation = void 0
            })
        }
        completeAnimation() {
            var s;
            this.resumingFrom && (this.resumingFrom.currentAnimation = void 0, this.resumingFrom.preserveOpacity = void 0), (s = this.getStack()) === null || s === void 0 || s.exitAnimationComplete(), this.resumingFrom = this.currentAnimation = this.animationValues = void 0, this.notifyListeners("animationComplete")
        }
        finishAnimation() {
            var s;
            this.currentAnimation && ((s = this.mixTargetDelta) === null || s === void 0 || s.call(this, vd), this.currentAnimation.stop()), this.completeAnimation()
        }
        applyTransformsToTarget() {
            const s = this.getLead();
            let {
                targetWithTransforms: l,
                target: a,
                layout: u,
                latestValues: c
            } = s;
            if (!(!l || !a || !u)) {
                if (this !== s && this.layout && u && sv(this.options.animationType, this.layout.layoutBox, u.layoutBox)) {
                    a = this.target || fe();
                    const f = be(this.layout.layoutBox.x);
                    a.x.min = s.target.x.min, a.x.max = a.x.min + f;
                    const d = be(this.layout.layoutBox.y);
                    a.y.min = s.target.y.min, a.y.max = a.y.min + d
                }
                tt(l, a), Jn(l, c), Gr(this.projectionDeltaWithTransform, this.layoutCorrected, l, c)
            }
        }
        registerSharedNode(s, l) {
            var a, u, c;
            this.sharedNodes.has(s) || this.sharedNodes.set(s, new JS), this.sharedNodes.get(s).add(l), l.promote({
                transition: (a = l.options.initialPromotionConfig) === null || a === void 0 ? void 0 : a.transition,
                preserveFollowOpacity: (c = (u = l.options.initialPromotionConfig) === null || u === void 0 ? void 0 : u.shouldPreserveFollowOpacity) === null || c === void 0 ? void 0 : c.call(u, l)
            })
        }
        isLead() {
            const s = this.getStack();
            return s ? s.lead === this : !0
        }
        getLead() {
            var s;
            const {
                layoutId: l
            } = this.options;
            return l ? ((s = this.getStack()) === null || s === void 0 ? void 0 : s.lead) || this : this
        }
        getPrevLead() {
            var s;
            const {
                layoutId: l
            } = this.options;
            return l ? (s = this.getStack()) === null || s === void 0 ? void 0 : s.prevLead : void 0
        }
        getStack() {
            const {
                layoutId: s
            } = this.options;
            if (s) return this.root.sharedNodes.get(s)
        }
        promote({
            needsReset: s,
            transition: l,
            preserveFollowOpacity: a
        } = {}) {
            const u = this.getStack();
            u && u.promote(this, a), s && (this.projectionDelta = void 0, this.needsReset = !0), l && this.setOptions({
                transition: l
            })
        }
        relegate() {
            const s = this.getStack();
            return s ? s.relegate(this) : !1
        }
        resetRotation() {
            const {
                visualElement: s
            } = this.options;
            if (!s) return;
            let l = !1;
            const {
                latestValues: a
            } = s;
            if ((a.rotate || a.rotateX || a.rotateY || a.rotateZ) && (l = !0), !l) return;
            const u = {};
            for (let c = 0; c < md.length; c++) {
                const f = "rotate" + md[c];
                a[f] && (u[f] = a[f], s.setStaticValue(f, 0))
            }
            s == null || s.render();
            for (const c in u) s.setStaticValue(c, u[c]);
            s.scheduleRender()
        }
        getProjectionStyles(s = {}) {
            var l, a, u;
            const c = {};
            if (!this.instance || this.isSVG) return c;
            if (this.isVisible) c.visibility = "";
            else return {
                visibility: "hidden"
            };
            const f = (l = this.options.visualElement) === null || l === void 0 ? void 0 : l.getProps().transformTemplate;
            if (this.needsReset) return this.needsReset = !1, c.opacity = "", c.pointerEvents = co(s.pointerEvents) || "", c.transform = f ? f(this.latestValues, "") : "none", c;
            const d = this.getLead();
            if (!this.projectionDelta || !this.layout || !d.target) {
                const k = {};
                return this.options.layoutId && (k.opacity = this.latestValues.opacity !== void 0 ? this.latestValues.opacity : 1, k.pointerEvents = co(s.pointerEvents) || ""), this.hasProjected && !vn(this.latestValues) && (k.transform = f ? f({}, "") : "none", this.hasProjected = !1), k
            }
            const m = d.animationValues || d.latestValues;
            this.applyTransformsToTarget(), c.transform = hd(this.projectionDeltaWithTransform, this.treeScale, m), f && (c.transform = f(m, c.transform));
            const {
                x: g,
                y: w
            } = this.projectionDelta;
            c.transformOrigin = `${g.origin*100}% ${w.origin*100}% 0`, d.animationValues ? c.opacity = d === this ? (u = (a = m.opacity) !== null && a !== void 0 ? a : this.latestValues.opacity) !== null && u !== void 0 ? u : 1 : this.preserveOpacity ? this.latestValues.opacity : m.opacityExit : c.opacity = d === this ? m.opacity !== void 0 ? m.opacity : "" : m.opacityExit !== void 0 ? m.opacityExit : 0;
            for (const k in zo) {
                if (m[k] === void 0) continue;
                const {
                    correct: h,
                    applyTo: p
                } = zo[k], v = h(m[k], d);
                if (p) {
                    const x = p.length;
                    for (let P = 0; P < x; P++) c[p[P]] = v
                } else c[k] = v
            }
            return this.options.layoutId && (c.pointerEvents = d === this ? co(s.pointerEvents) || "" : "none"), c
        }
        clearSnapshot() {
            this.resumeFrom = this.snapshot = void 0
        }
        resetTree() {
            this.root.nodes.forEach(s => {
                var l;
                return (l = s.currentAnimation) === null || l === void 0 ? void 0 : l.stop()
            }), this.root.nodes.forEach(gd), this.root.sharedNodes.clear()
        }
    }
}

function nC(e) {
    e.updateLayout()
}

function rC(e) {
    var t, n, r;
    const i = ((t = e.resumeFrom) === null || t === void 0 ? void 0 : t.snapshot) || e.snapshot;
    if (e.isLead() && e.layout && i && e.hasListeners("didUpdate")) {
        const {
            layoutBox: o,
            measuredBox: s
        } = e.layout, {
            animationType: l
        } = e.options, a = i.source !== e.layout.source;
        l === "size" ? ft(m => {
            const g = a ? i.measuredBox[m] : i.layoutBox[m],
                w = be(g);
            g.min = o[m].min, g.max = g.min + w
        }) : sv(l, i.layoutBox, o) && ft(m => {
            const g = a ? i.measuredBox[m] : i.layoutBox[m],
                w = be(o[m]);
            g.max = g.min + w
        });
        const u = Xr();
        Gr(u, o, i.layoutBox);
        const c = Xr();
        a ? Gr(c, e.applyTransform(s, !0), i.measuredBox) : Gr(c, o, i.layoutBox);
        const f = !rv(u);
        let d = !1;
        if (!e.resumeFrom) {
            const m = e.getClosestProjectingParent();
            if (m && !m.resumeFrom) {
                const {
                    snapshot: g,
                    layout: w
                } = m;
                if (g && w) {
                    const k = fe();
                    Yr(k, i.layoutBox, g.layoutBox);
                    const h = fe();
                    Yr(h, o, w.layoutBox), iv(k, h) || (d = !0)
                }
            }
        }
        e.notifyListeners("didUpdate", {
            layout: o,
            snapshot: i,
            delta: c,
            layoutDelta: u,
            hasLayoutChanged: f,
            hasRelativeTargetChanged: d
        })
    } else e.isLead() && ((r = (n = e.options).onExitComplete) === null || r === void 0 || r.call(n));
    e.options.transition = void 0
}

function iC(e) {
    e.isProjectionDirty || (e.isProjectionDirty = Boolean(e.parent && e.parent.isProjectionDirty)), e.isTransformDirty || (e.isTransformDirty = Boolean(e.parent && e.parent.isTransformDirty))
}

function oC(e) {
    e.clearSnapshot()
}

function gd(e) {
    e.clearMeasurements()
}

function sC(e) {
    const {
        visualElement: t
    } = e.options;
    t != null && t.getProps().onBeforeLayoutMeasure && t.notify("BeforeLayoutMeasure"), e.resetTransform()
}

function yd(e) {
    e.finishAnimation(), e.targetDelta = e.relativeTarget = e.target = void 0
}

function lC(e) {
    e.resolveTargetDelta()
}

function aC(e) {
    e.calcProjection()
}

function uC(e) {
    e.resetRotation()
}

function cC(e) {
    e.removeLeadSnapshot()
}

function wd(e, t, n) {
    e.translate = se(t.translate, 0, n), e.scale = se(t.scale, 1, n), e.origin = t.origin, e.originPoint = t.originPoint
}

function xd(e, t, n, r) {
    e.min = se(t.min, n.min, r), e.max = se(t.max, n.max, r)
}

function fC(e, t, n, r) {
    xd(e.x, t.x, n.x, r), xd(e.y, t.y, n.y, r)
}

function dC(e) {
    return e.animationValues && e.animationValues.opacityExit !== void 0
}
const pC = {
    duration: .45,
    ease: [.4, 0, .1, 1]
};

function hC(e, t) {
    let n = e.root;
    for (let o = e.path.length - 1; o >= 0; o--)
        if (Boolean(e.path[o].instance)) {
            n = e.path[o];
            break
        }
    const i = (n && n !== e.root ? n.instance : document).querySelector(`[data-projection-id="${t}"]`);
    i && e.mount(i, !0)
}

function Sd(e) {
    e.min = Math.round(e.min), e.max = Math.round(e.max)
}

function mC(e) {
    Sd(e.x), Sd(e.y)
}

function sv(e, t, n) {
    return e === "position" || e === "preserve-aspect" && !Ca(pd(t), pd(n), .2)
}
const vC = ov({
        attachResizeListener: (e, t) => Cs(e, "resize", t),
        measureScroll: () => ({
            x: document.documentElement.scrollLeft || document.body.scrollLeft,
            y: document.documentElement.scrollTop || document.body.scrollTop
        }),
        checkIsScrollRoot: () => !0
    }),
    pl = {
        current: void 0
    },
    gC = ov({
        measureScroll: e => ({
            x: e.scrollLeft,
            y: e.scrollTop
        }),
        defaultParent: () => {
            if (!pl.current) {
                const e = new vC(0, {});
                e.mount(window), e.setOptions({
                    layoutScroll: !0
                }), pl.current = e
            }
            return pl.current
        },
        resetTransform: (e, t) => {
            e.style.transform = t !== void 0 ? t : "none"
        },
        checkIsScrollRoot: e => Boolean(window.getComputedStyle(e).position === "fixed")
    }),
    yC = {
        ...Xx,
        ...hw,
        ...yS,
        ...bS
    },
    vt = f1((e, t) => b1(e, t, yC, jS, gC));

function Zo(e) {
    const {
        help: t,
        setHelp: n
    } = wr(), r = Vn();

    function i() {
        const o = {
            ...t
        };
        o.callType = e.type, n(o), r("/newCall")
    }
    return y("button", {
        onClick: i,
        className: "button",
        children: e.text
    })
}
const wC = () => {
    const {
        help: e
    } = wr(), [t, n] = S.exports.useState(""), [r, i] = S.exports.useState();
    S.exports.useEffect(() => {
        e.items && i(e.items)
    }, []);

    function o() {
        e.items && (i(e.items.filter(l => l.title.toLowerCase().includes(t.toLowerCase()))), n(""))
    }

    function s(l) {
        e.items && (i(e.items.filter(a => a.title.toLowerCase().includes(l.toLowerCase()))), n(l))
    }
    return y(ye, {
        children: y(vt.div, {
            initial: {
                opacity: 0
            },
            animate: {
                opacity: 1
            },
            exit: {
                opacity: 0
            },
            children: V(Nu, {
                className: "w-[32.083vw] h-[36.927vw]",
                children: [V("div", {
                    className: "flex mt-[1.875vw] mb-[1.146vw] items-center",
                    children: [y("h1", {
                        className: "flex-1 text-[1.25vw] text-white font-bold",
                        children: "COMO PODEMOS AJUDAR?"
                    }), y(Tu, {})]
                }), V("div", {
                    className: "bg-default/[.2] border border-default w-full h-[2.552vw] rounded-[0.208vw] flex",
                    children: [y("input", {
                        onChange: l => s(l.target.value),
                        type: "text",
                        value: t,
                        className: "px-[1.042vw] flex-1",
                        placeholder: "Fa\xE7a uma pergunta..."
                    }), y("button", {
                        className: "bg-default/[.2] medium px-[1.25vw]",
                        onClick: o,
                        children: "Pesquisar"
                    })]
                }), y("div", {
                    className: "relative mt-[1.146vw] w-full flex flex-col gap-[.469vw] max-h-[22vw] overflow-auto",
                    children: r && r.map((l, a) => y(Zy, {
                        data: l
                    }, a))
                }), y("div", {
                    className: "w-full h-[0.052vw] mt-[1.406vw] bg-white/[.13]"
                }), V("div", {
                    className: "flex gap-[1.875vw] mt-[1.719vw]",
                    children: [y(Zo, {
                        text: "Denunciar",
                        type: "denounce"
                    }), y(Zo, {
                        text: "Chamar Staff",
                        type: "staff"
                    })]
                })]
            })
        })
    })
};
var xC = "./assets/arrow.237c51e6.svg";
const SC = () => {
        const {
            help: e
        } = wr(), t = Vn();
        return y(ye, {
            children: y(vt.div, {
                initial: {
                    opacity: 0
                },
                animate: {
                    opacity: 1
                },
                exit: {
                    opacity: 0
                },
                children: V(Nu, {
                    className: "w-[32.083vw] h-[36.927vw]",
                    children: [V("div", {
                        className: "w-full h-auto mt-[1.875vw] flex justify-between",
                        children: [V("div", {
                            className: "flex items-center gap-[0.417vw] cursor-pointer hover:opacity-[.7] transition-opacity",
                            children: [y("img", {
                                className: "h-[.5vw]",
                                src: xC
                            }), y("p", {
                                className: "text-[rgba(255,255,255,0.3)] text-[0.729vw] font-[400]",
                                onClick: () => t("/help"),
                                children: "Voltar"
                            })]
                        }), y(Tu, {})]
                    }), V("div", {
                        className: "w-full h-[25.625vw] mt-[1.146vw] desc-container p-[1.302vw] flex flex-col",
                        children: [y("p", {
                            className: "container-title",
                            children: e.selected.title
                        }), y("div", {
                            className: "w-full h-full mt-[0.781vw] font-[400] text-[0.625vw] text-[rgba(255,255,255,0.5)] overflow-auto",
                            dangerouslySetInnerHTML: {
                                __html: e.selected.description
                            }
                        })]
                    }), y("div", {
                        className: "w-full h-px bg-[rgba(255,255,255,0.13)] mt-[1.406vw]"
                    }), V("div", {
                        className: "w-full mt-[1.719vw] flex justify-center gap-[1.875vw]",
                        children: [y(Zo, {
                            text: "Denunciar",
                            type: "denounce"
                        }), y(Zo, {
                            text: "Chamar staff",
                            type: "staff"
                        })]
                    })]
                })
            })
        })
    },
    CC = () => {
        const {
            help: e,
            setHelp: t
        } = wr();
        Pi();
        const n = Vn(),
            [r, i] = S.exports.useState("");

        function o() {
            n("/help")
        }

        function s() {
            !ku() && r.length <= 0 || (Re("sendCall", {
                text: r,
                type: e.callType
            }, {}), t({}), n("/call"))
        }
        return y(vt.div, {
            initial: {
                opacity: 0
            },
            animate: {
                opacity: 1
            },
            exit: {
                opacity: 0
            },
            children: V(Nu, {
                className: "w-[29.792vw] h-[28.542vw]",
                children: [V("div", {
                    className: "w-full h-full flex flex-col justify-center items-center",
                    children: [y("p", {
                        className: "font-[700] text-white text-[1.667vw] leading-[2.083vw]",
                        children: "NOVO CHAMADO"
                    }), y("p", {
                        className: "w-[23.438vw] mt-[0.729vw] font-[500] text-[rgba(255,255,255,0.5)] text-[0.729vw] leading-[0.99vw] text-center",
                        children: "Os staffs est\xE3o aqui para melhor te atender. Digite abaixo um breve descri\xE7\xE3o do seu pedido. E pode deixar com a gente!"
                    }), y("div", {
                        className: "w-full h-[11.875vw] bg-textArea border-[0.052vw] border-default rounded-[0.208vw] mt-[1.667vw] flex flex-col",
                        children: y("textarea", {
                            value: r,
                            onChange: l => i(l.target.value),
                            className: "resize-none area-message w-full w-min-full h-full h-min-full outline-none bg-transparent text-white text-[0.833vw] font-[400] leading-[1.25vw] px-[1.094vw] py-[0.573vw]",
                            placeholder: "Clique aqui para detalhar seu pedido."
                        })
                    }), y("button", {
                        onClick: s,
                        className: "mt-[1.198vw] button-newcall",
                        children: "ENVIAR PEDIDO"
                    }), y("p", {
                        onClick: o,
                        className: "mt-[1.302vw] font-[400] text-[rgba(255,255,255,0.5)] text-[0.833vw] leading-[1.25vw] underline cursor-pointer hover:opacity-[.7] transition-opacity",
                        children: "Cancelar pedido de ajuda"
                    })]
                }), y(Tu, {})]
            })
        })
    };
var kC = "./assets/logo.png";
const PC = ({
    icon: e,
    selected: t,
    path: n
}) => y(Qy, {
    to: n,
    className: `w-full h-[3.594vw] flex justify-center items-center ${t&&"bg-[rgba(0,0,0,0.09)]"} cursor-pointer`,
    children: y("img", {
        className: "w-[1.563vw]",
        src: e
    })
});
var EC = "./assets/call.c05e8d0b.svg",
    NC = "./assets/trophy.2057c518.svg",
    Cd = "./assets/close-icon.7e4ff5fb.svg";
const lv = S.exports.createContext(null),
    TC = ({
        children: e
    }) => {
        const [t, n] = S.exports.useState({});
        return y(lv.Provider, {
            value: {
                dashboard: t,
                setDashboard: n
            },
            children: e
        })
    },
    Ns = () => S.exports.useContext(lv),
    LC = () => {
        const e = Ei(),
            {
                dashboard: t
            } = Ns(),
            {
                setVisible: n
            } = Pi(),
            [r, i] = S.exports.useState(!1),
            o = [{
                icon: EC,
                path: "calls"
            }, {
                icon: NC,
                path: "ranking"
            }];

        function s() {
            Re("close", {}, !0), n(!1)
        }
        return y(ye, {
            children: y(vt.div, {
                initial: {
                    opacity: 0
                },
                animate: {
                    opacity: 1
                },
                exit: {
                    opacity: 0
                },
                children: V("div", {
                    className: "w-[65.313vw] h-[41.667vw] bg-dashboard flex p-[0.104vw]",
                    children: [V("div", {
                        className: "w-[6.979vw] h-full flex flex-col items-center pt-[3.333vw] pb-[3.333vw] bg-[rgba(0,0,0,0.2)] rounded-tl-[0.729vw] rounded-bl-[0.729vw]",
                        children: [y("img", {
                            className: "w-[2.292vw] h-[2.708vw]",
                            src: kC
                        }), y("div", {
                            className: "w-full h-ful mt-[3.49vw]",
                            children: o.map((l, a) => y("div", {
                                onClick: () => {
                                    l.path === "partners" ? i(!0) : i(!1)
                                },
                                children: y(PC, {
                                    selected: e.pathname.split("/")[2] === l.path,
                                    icon: l.icon,
                                    path: l.path
                                }, a)
                            }))
                        })]
                    }), y("div", {
                        className: "flex-1 h-full flex flex-col",
                        children: y(jy, {})
                    }), r ? y("div", {
                        className: "w-[16.354vw] h-full bg-[rgba(0,0,0,0.2)] flex flex-col rounded-tr-[0.729vw] rounded-br-[0.729vw] pl-[2.604vw] pr-[1.979vw] pt-[1.563vw] pb-[1.563vw]",
                        children: V("div", {
                            className: "w-full h-full flex flex-col relative",
                            children: [y("div", {
                                className: "w-full flex justify-end items-center",
                                children: y("div", {
                                    onClick: s,
                                    className: "w-[1.667vw] h-[1.667vw] bg-closeFrame rounded-[0.156vw] flex justify-center items-center cursor-pointer hover:opacity-[.7] transition-opacity",
                                    children: y("img", {
                                        className: "h-[0.625vw]",
                                        src: Cd
                                    })
                                })
                            }), V("div", {
                                className: "w-full h-full mt-[1.979vw] flex flex-col",
                                children: [y("p", {
                                    className: "font-[400] text-[0.729vw] text-default/[.5] leading-[2.083vw]",
                                    children: "TUTORIAL"
                                }), y("div", {
                                    className: "w-45 h-10 bg-[#D9D9D90F] text-[#D9D9D9] rounded-[0.156vw] mt-[1.563vw] flex justify-center items-center cursor-pointer hover:opacity-[.7] transition-opacity",
                                    children: "Vizualizar tutorial"
                                })]
                            })]
                        })
                    }) : y("div", {
                        className: "w-[16.354vw] h-full bg-[rgba(0,0,0,0.2)] flex flex-col rounded-tr-[0.729vw] rounded-br-[0.729vw] pl-[2.604vw] pr-[1.979vw] pt-[1.563vw] pb-[1.563vw]",
                        children: V("div", {
                            className: "w-full h-full flex flex-col relative",
                            children: [V("div", {
                                className: "w-full flex justify-between items-center",
                                children: [y("p", {
                                    className: "font-[600] text-white text-[0.729vw] leading-[2.083vw]",
                                    children: "ESTAT\xCDSTICAS"
                                }), y("div", {
                                    onClick: s,
                                    className: "w-[1.667vw] h-[1.667vw] bg-closeFrame rounded-[0.156vw] flex justify-center items-center cursor-pointer hover:opacity-[.7] transition-opacity",
                                    children: y("img", {
                                        className: "h-[0.625vw]",
                                        src: Cd
                                    })
                                })]
                            }), V("div", {
                                className: "w-full h-full mt-[1.979vw] flex flex-col",
                                children: [y("p", {
                                    className: "font-[400] text-[0.729vw] text-default/[.5] leading-[2.083vw]",
                                    children: "VIS\xC3O GERAL"
                                }), V("div", {
                                    className: "w-full h-full mt-[0.938vw] flex flex-col gap-[1.458vw]",
                                    children: [V("div", {
                                        className: "w-full flex flex-col gap-[0.469vw]",
                                        children: [y("p", {
                                            className: "font-[400] text-[0.729vw] text-[rgba(255,255,255,0.5)] leading-[1.146vw]",
                                            children: "Atendidos hoje"
                                        }), y("span", {
                                            className: "font-[400] text-[1.667vw] text-white leading-[1.146vw]",
                                            children: t.statistics.attendedToday
                                        })]
                                    }), V("div", {
                                        className: "w-full flex flex-col gap-[0.469vw]",
                                        children: [y("p", {
                                            className: "font-[400] text-[0.729vw] text-[rgba(255,255,255,0.5)] leading-[1.146vw]",
                                            children: "Chamados pendentes"
                                        }), y("span", {
                                            className: "font-[400] text-[1.667vw] text-white leading-[1.146vw]",
                                            children: t.callsList.length
                                        })]
                                    }), V("div", {
                                        className: "w-full flex flex-col gap-[0.469vw]",
                                        children: [y("p", {
                                            className: "font-[400] text-[0.729vw] text-[rgba(255,255,255,0.5)] leading-[1.146vw]",
                                            children: "Finalizados"
                                        }), y("span", {
                                            className: "font-[400] text-[1.667vw] text-white leading-[1.146vw]",
                                            children: t.statistics.finalizedCalls
                                        })]
                                    }), V("div", {
                                        className: "w-full flex flex-col gap-[0.469vw]",
                                        children: [y("p", {
                                            className: "font-[400] text-[0.729vw] text-[rgba(255,255,255,0.5)] leading-[1.146vw]",
                                            children: "Cancelados"
                                        }), y("span", {
                                            className: "font-[400] text-[1.667vw] text-white leading-[1.146vw]",
                                            children: t.statistics.canceledCalls
                                        })]
                                    })]
                                })]
                            })]
                        })
                    })]
                })
            })
        })
    };
var RC = "./assets/arrow.23dc4300.svg";

function _C(e) {
    const [t, n] = S.exports.useState(!1), {
        dashboard: r,
        setDashboard: i
    } = Ns(), [o, s] = S.exports.useState(!1);

    function l() {
        Re("callInProgress", {
            id: e.data.id
        }, !0).then(u => {
            u && (e.data.Status = 1)
        })
    }

    function a() {
        Re("callConcluded", {
            id: e.data.id
        }, !0).then(u => {
            if (u) {
                const c = {
                    ...r
                };
                c.callsList = c.callsList.filter(f => f.id !== e.data.id), i(c)
            }
        })
    }
    return V("tr", {
        className: "relative grid-cols-[.3fr_.6fr_.5fr_.5fr]",
        children: [y("td", {
            className: "pl-[1vw]",
            children: e.data.Time
        }), V("td", {
            className: "playerName",
            onMouseEnter: () => s(!0),
            onMouseLeave: () => s(!1),
            children: [y("div", {
                className: `${!o&&"hidden"} p-[0.5vw] block z-10 left-[15vw] top-[6vw] absolute w-[15vw] translate-x-[-50%] translate-y-[-50%] text-white/[.5]p-[0.521vw] bg-[rgba(0,0,0,0.85)] rounded-[0.365vw]`,
                children: e.data.Description
            }), e.data.Player]
        }), y("td", {
            children: e.data.Type === 1 ? y("span", {
                className: "text-[rgba(222,86,86)]",
                children: "Den\xFAncia"
            }) : "D\xFAvida"
        }), y("td", {
            children: V("div", {
                onClick: () => n(!t),
                className: "cursor-pointer status-frame-table active-frame-table w-[7.917vw] h-[1.458vw] relative flex items-center pl-[0.938vw] font-[400] text-[0.729vw]",
                children: [y("p", {
                    children: e.data.Status === 0 ? "Pendente" : e.data.Status === 1 ? "Em Andamento" : e.data.Status === 2 ? "Conclu\xEDdo" : ""
                }), y("img", {
                    className: "w-[0.351vw] h-[0.156vw] absolute right-[0.538vw]",
                    src: RC
                }), y("div", {
                    className: `z-[2] w-[7.917vw] h-[2.917vw] absolute left-[100.19%] bottom-0 translate-x-[-100%] translate-y-[100%] ${t?"visible":"hidden"}`,
                    children: e.data.Status === 0 ? y(ye, {
                        children: y("div", {
                            onClick: l,
                            className: "w-full h-[1.458vw] trend-frame-table flex items-center pl-[0.938vw]",
                            children: "Em andamento"
                        })
                    }) : e.data.Status === 1 ? y("div", {
                        onClick: a,
                        className: "w-full h-[1.458vw] completed-frame-table flex items-center pl-[0.938vw]",
                        children: "Conclu\xEDdo"
                    }) : y(ye, {
                        children: y("div", {
                            className: "w-full h-[1.458vw] trend-frame-table flex items-center pl-[0.938vw]",
                            children: "Em andamento"
                        })
                    })
                })]
            })
        })]
    })
}
const DC = () => {
        const {
            dashboard: e
        } = Ns();
        return y(ye, {
            children: y(vt.div, {
                initial: {
                    opacity: 0
                },
                animate: {
                    opacity: 1
                },
                exit: {
                    opacity: 0
                },
                className: "h-full flex flex-col",
                children: V("div", {
                    className: "w-full h-full mt-[3.125vw] pl-[3.333vw] pr-[1.719vw] pb-[3.333vw] flex flex-col",
                    children: [y("p", {
                        className: "text-white text-[1.667vw] font-[600] leading-[2.083vw]",
                        children: "Chamados"
                    }), y("p", {
                        className: "text-default text-[0.729vw] font-[400] leading-[2.083vw] opacity-50 mt-[1.042vw]",
                        children: "ATIVOS AGORA"
                    }), y("div", {
                        className: "w-full h-full",
                        children: V("table", {
                            className: "table",
                            children: [y("thead", {
                                children: V("tr", {
                                    className: "grid-cols-[.3fr_.6fr_.5fr_.5fr]",
                                    children: [y("th", {
                                        className: "pl-[1vw]",
                                        children: "Hora"
                                    }), y("th", {
                                        children: "Jogador"
                                    }), y("th", {
                                        children: "Prioridade"
                                    }), y("th", {
                                        children: "Status"
                                    })]
                                })
                            }), y("tbody", {
                                children: e.callsList && e.callsList.map((t, n) => y(_C, {
                                    data: t
                                }, n))
                            })]
                        })
                    })]
                })
            })
        })
    },
    VC = () => {
        const [e, t] = S.exports.useState({});
        return S.exports.useEffect(() => {
            Re("getRanking", {}, {
                ranking: [{
                    Name: "Droyen",
                    Rating: 15,
                    TotalTicket: 150
                }],
                statistics: {
                    Answered: "100%",
                    Cancelled: "100%",
                    Finished: "100%"
                }
            }).then(n => {
                t(n)
            })
        }, []), y(ye, {
            children: y(vt.div, {
                initial: {
                    opacity: 0
                },
                animate: {
                    opacity: 1
                },
                exit: {
                    opacity: 0
                },
                className: "h-full flex flex-col",
                children: V("div", {
                    className: "w-full h-full mt-[3.125vw] pl-[3.333vw] pr-[1.719vw] pb-[3.333vw] flex flex-col",
                    children: [y("p", {
                        className: "text-white text-[1.667vw] font-[600] leading-[2.083vw]",
                        children: "Ranking"
                    }), y("p", {
                        className: "text-default text-[0.729vw] font-[400] leading-[2.083vw] opacity-50 mt-[1.042vw]",
                        children: "RANKING SEMANAL | Reiniciado toda segunda"
                    }), V("div", {
                        className: "w-full h-full relative flex flex-col",
                        children: [y("div", {
                            className: "w-[23.177vw] h-full",
                            children: V("table", {
                                className: "table",
                                children: [y("thead", {
                                    children: V("tr", {
                                        className: "grid grid-cols-[.6fr_.3fr_.3fr]",
                                        children: [y("th", {
                                            children: "Nome"
                                        }), y("th", {
                                            children: "Chamados"
                                        }), y("th", {
                                            children: "Pontos"
                                        })]
                                    })
                                }), y("tbody", {
                                    children: e.ranking && e.ranking.map((n, r) => V("tr", {
                                        className: "grid items-center grid-cols-[.6fr_.3fr_.3fr]",
                                        children: [y("td", {
                                            children: n.Name
                                        }), y("td", {
                                            children: n.TotalTicket
                                        }), y("td", {
                                            children: n.Rating
                                        })]
                                    }))
                                })]
                            })
                        }), V("div", {
                            className: "w-[12.552vw] h-[29.948vw] absolute right-0 bottom-0 bg-[rgba(0,0,0,0.2)] rounded-[0.208vw] p-[1.823vw] flex flex-col gap-[1.458vw]",
                            children: [V("div", {
                                className: "w-full flex flex-col gap-[0.469vw]",
                                children: [y("p", {
                                    className: "font-[400] text-[0.729vw] text-[rgba(255,255,255,0.5)] leading-[1.146vw]",
                                    children: "Chamados aceitos"
                                }), y("span", {
                                    className: "font-[400] text-[1.667vw] text-white leading-[1.146vw]",
                                    children: e.statistics && e.statistics.Answered
                                })]
                            }), V("div", {
                                className: "w-full flex flex-col gap-[0.469vw]",
                                children: [y("p", {
                                    className: "font-[400] text-[0.729vw] text-[rgba(255,255,255,0.5)] leading-[1.146vw]",
                                    children: "Chamados finalizados"
                                }), y("span", {
                                    className: "font-[400] text-[1.667vw] text-white leading-[1.146vw]",
                                    children: e.statistics && e.statistics.Finished
                                })]
                            }), V("div", {
                                className: "w-full flex flex-col gap-[0.469vw]",
                                children: [y("p", {
                                    className: "font-[400] text-[0.729vw] text-[rgba(255,255,255,0.5)] leading-[1.146vw]",
                                    children: "Chamados cancelados"
                                }), y("span", {
                                    className: "font-[400] text-[1.667vw] text-white leading-[1.146vw]",
                                    children: e.statistics && e.statistics.Cancelled
                                })]
                            })]
                        })]
                    })]
                })
            })
        })
    },
    AC = () => {
        const [e, t] = S.exports.useState(!1), [n, r] = S.exports.useState(!1), [i, o] = S.exports.useState(!1), [s, l] = S.exports.useState(!1), [a, u] = S.exports.useState(!0), [c, f] = S.exports.useState({}), [d, m] = S.exports.useState({}), {
            setVisible: g
        } = Pi();
        Ct("callAccepted", k => {
            f(k), o(!1), t(!1), console.log(" callAccepted ", k)
        }), Ct("CallRevert", function(k) {
            console.log(k), f({}), o(!0), t(!1)
        }), Ct("callFinished", k => {
            k && r(!0)
        }), Ct("openCallModal", k => {
            k ? (l(!s), u(!0)) : t(!0)
        }), Ct("openFinishModal", k => {
            u(!1)
        });
        const w = k => {
            if (k.code === "KeyU") {
                if (e || i) {
                    t(!1), Re("closeCallModal", !0, !0);
                    return
                }
                if (s) {
                    Re("callFeedback", {
                        id: d.id,
                        isCallResolved: !1
                    }, {}), u(!1), g(!1);
                    return
                }
                if (n && !i) {
                    Re("callFeedback", {
                        id: d.id,
                        isCallResolved: !1
                    }, {}), g(!1), l(!1);
                    return
                }
            } else if (k.code === "KeyY") {
                if (console.log(e, i), e || i) {
                    Re("cancelCall", {
                        id: d.id
                    }, !0).then(h => {
                        console.log(h), h && g(!1)
                    });
                    return
                }
                if (s) {
                    Re("callFeedback", {
                        id: d.id,
                        isCallResolved: !0
                    }, {}), g(!1), l(!1);
                    return
                }
                if (n && !i) {
                    Re("callFeedback", {
                        id: d.id,
                        isCallResolved: !0
                    }, {}), g(!1), l(!1);
                    return
                }
            }
        };
        return S.exports.useEffect(() => {
            Re("getCallData", {}, {
                time: "00:15",
                id: 1
            }).then(k => {
                m(k)
            })
        }, []), S.exports.useEffect(() => (window.addEventListener("keyup", w), () => {
            window.removeEventListener("keyup", w)
        }), [e, i, n, s]), V(vt.div, {
            className: "call-bg w-[13.594vw] h-[15.365vw] absolute right-[6.51vw] pl-[1.25vw] pr-[1.25vw] pt-[1vw] flex flex-col",
            initial: {
                opacity: 0,
                x: 150
            },
            animate: {
                opacity: 1,
                x: 0
            },
            exit: {
                opacity: 0,
                x: 150
            },
            transition: {
                ease: "easeInOut",
                duration: .25
            },
            children: [s === !1 ? y("p", {
                className: "font-[700] text-[0.938vw] text-white leading-[2.083vw]",
                children: c.staff_id ? "SEU CHAMADO" : "SEU PEDIDO"
            }) : "", y("div", {
                className: "w-full h-[0.052vw] bg-[rgba(255,255,255,0.13)] mt-[0.625vw]"
            }), s === !1 ? y(ye, {
                children: c.staff_id ? V(ye, {
                    children: [y("p", {
                        className: `${n&&"opacity-[.25]"} text-default font-[600] text-[0.833vw] mt-[0.938vw]`,
                        children: c.staff_name
                    }), V("p", {
                        className: `${n&&"opacity-[.25]"} text-white/[.5] font-[400] text-[0.625vw] mb-[0.625vw]`,
                        children: ["ID: ", c.staff_id]
                    }), !n && V("p", {
                        className: "text-white/[.5] font-[400] text-[0.625vw] mb-[2.448vw]",
                        children: ["N\xE3o esque\xE7a de avaliar esse chamado na ", y("span", {
                            className: "font-[600]",
                            children: "prefeitura"
                        }), " do ", y("span", {
                            className: "font-[600]",
                            children: "Pier."
                        })]
                    })]
                }) : V(ye, {
                    children: [y("p", {
                        className: `${e&&"opacity-[.25]"} transition-opacity font-[600] text-[0.833vw] loading-[2.083vw] text-white mt-[0.938vw]`,
                        children: "Um staff j\xE1 est\xE1 vindo!"
                    }), y("p", {
                        className: `${e&&"opacity-[.25]"} transition-opacity w-[9.115vw] text-left font-[400]
                            text-[0.625vw] leading-[0.99vw] text-[rgba(255,255,255,0.5)] mt-[0.26vw]`,
                        children: "Tente procurar um lugar longe de outras pessoas para ser atendido."
                    })]
                })
            }) : "", s === !1 ? y(ye, {
                children: e ? e && V(vt.div, {
                    className: "w-full flex flex-col",
                    initial: {
                        opacity: 0,
                        y: 30
                    },
                    animate: {
                        opacity: 1,
                        y: 0
                    },
                    exit: {
                        opacity: 0,
                        y: 30
                    },
                    children: [y("p", {
                        className: "mt-[0.26vw] self-center text-center text-white text-[0.729vw] font-[500]",
                        children: "Voc\xEA realmente deseja cancelar esse chamado"
                    }), V("div", {
                        className: "self-center flex gap-[0.26vw] items-center mt-[1.094vw]",
                        children: [V("button", {
                            className: "button-call w-[4.896vw] h-[1.771vw]",
                            children: [y("span", {
                                className: "text-white",
                                children: "(Y)"
                            }), " Sim"]
                        }), V("button", {
                            className: "button-call w-[4.896vw] h-[1.771vw]",
                            children: [y("span", {
                                className: "text-white",
                                children: "(U)"
                            }), " N\xE3o"]
                        })]
                    })]
                }) : y(ye, {
                    children: c.staff_id ? c.staff_id && !n && y(ye, {
                        children: V("button", {
                            disabled: !0,
                            className: "absolute bottom-[1.51vw] button-call mt-[1.563vw] w-[10.052vw] h-[1.771vw] self-center",
                            children: [y("span", {
                                className: "text-white",
                                children: "F7"
                            }), " CANCELAR PEDIDO"]
                        })
                    }) : V(ye, {
                        children: [V("p", {
                            className: "mt-[1.042vw] font-[400] text-[0.625vw] leading-[0.99vw]\r text-[rgba(255,255,255,0.5)]",
                            children: ["Tempo m\xE9dio de espera: ", y("span", {
                                className: "text-white",
                                children: d.time
                            })]
                        }), V("button", {
                            className: "absolute bottom-[1.51vw] button-call mt-[1.563vw] w-[10.052vw] h-[1.771vw] self-center",
                            children: [y("span", {
                                className: "text-white",
                                children: "F7"
                            }), " CANCELAR PEDIDO"]
                        })]
                    })
                })
            }) : "", s && V(vt.div, {
                className: "w-full flex flex-col",
                initial: {
                    opacity: 0,
                    y: 30
                },
                animate: {
                    opacity: 1,
                    y: 0
                },
                exit: {
                    opacity: 0,
                    y: 30
                },
                children: [y("p", {
                    className: "mt-[0.26vw] self-center text-center text-white text-[0.829vw] font-[700]",
                    children: "Esse chamado resolveu o seu problema?"
                }), y("div", {
                    className: "self-center justify-center flex gap-[0.26vw] items-center mt-[1.094vw]",
                    children: a === !0 ? V("button", {
                        style: {
                            fontSize: ".8rem"
                        },
                        className: "absolute bottom-[2vw] button-call mt-[1.563vw] w-[10.052vw] h-[1.771vw] self-center",
                        children: [y("span", {
                            className: "text-white",
                            children: "F7"
                        }), " RESOLVEU SEU PROBLEMA"]
                    }) : V(ye, {
                        children: [V("button", {
                            className: "button-call w-[4.896vw] h-[1.771vw] mt-[6.563vw]",
                            children: [y("span", {
                                className: "text-white",
                                children: "(Y)"
                            }), " Sim"]
                        }), V("button", {
                            className: "button-call w-[4.896vw] h-[1.771vw] mt-[6.563vw]",
                            children: [y("span", {
                                className: "text-white",
                                children: "(U)"
                            }), " N\xE3o"]
                        })]
                    })
                })]
            })]
        })
    };

function MC() {
    return y("svg", {
        xmlns: "http://www.w3.org/2000/svg",
        width: "16",
        height: "14",
        fill: "none",
        viewBox: "0 0 16 14",
        style: {
            position: "absolute",
            top: "10%",
            left: "35%"
        },
        children: y("path", {
            stroke: "#fff",
            strokeLinecap: "round",
            strokeLinejoin: "round",
            d: "M1.666 5h12.667M6.666 1L5.333 5 8 12.667 10.666 5 9.333 1m-.924 11.508l5.973-7.167c.101-.121.152-.182.171-.25a.332.332 0 000-.182c-.02-.068-.07-.129-.171-.25l-2.89-3.467a.715.715 0 00-.123-.131.333.333 0 00-.105-.05C11.22 1 11.175 1 11.084 1H4.915c-.092 0-.138 0-.18.011a.333.333 0 00-.105.05.72.72 0 00-.125.13L1.618 4.66c-.102.121-.152.182-.172.25a.333.333 0 000 .182c.02.068.07.129.172.25l5.972 7.167c.14.17.211.254.295.284a.333.333 0 00.23 0c.083-.03.154-.115.294-.284z"
        })
    })
}
var av = {
    exports: {}
};
(function(e, t) {
    (function(n, r) {
        e.exports = r(S.exports)
    })(mv, n => (() => {
        var r = {
                703: (l, a, u) => {
                    var c = u(414);

                    function f() {}

                    function d() {}
                    d.resetWarningCache = f, l.exports = function() {
                        function m(k, h, p, v, x, P) {
                            if (P !== c) {
                                var T = new Error("Calling PropTypes validators directly is not supported by the `prop-types` package. Use PropTypes.checkPropTypes() to call them. Read more at http://fb.me/use-check-prop-types");
                                throw T.name = "Invariant Violation", T
                            }
                        }

                        function g() {
                            return m
                        }
                        m.isRequired = m;
                        var w = {
                            array: m,
                            bigint: m,
                            bool: m,
                            func: m,
                            number: m,
                            object: m,
                            string: m,
                            symbol: m,
                            any: m,
                            arrayOf: g,
                            element: m,
                            elementType: m,
                            instanceOf: g,
                            node: m,
                            objectOf: g,
                            oneOf: g,
                            oneOfType: g,
                            shape: g,
                            exact: g,
                            checkPropTypes: d,
                            resetWarningCache: f
                        };
                        return w.PropTypes = w, w
                    }
                },
                697: (l, a, u) => {
                    l.exports = u(703)()
                },
                414: l => {
                    l.exports = "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED"
                },
                98: l => {
                    l.exports = n
                }
            },
            i = {};

        function o(l) {
            var a = i[l];
            if (a !== void 0) return a.exports;
            var u = i[l] = {
                exports: {}
            };
            return r[l](u, u.exports, o), u.exports
        }
        o.n = l => {
            var a = l && l.__esModule ? () => l.default : () => l;
            return o.d(a, {
                a
            }), a
        }, o.d = (l, a) => {
            for (var u in a) o.o(a, u) && !o.o(l, u) && Object.defineProperty(l, u, {
                enumerable: !0,
                get: a[u]
            })
        }, o.o = (l, a) => Object.prototype.hasOwnProperty.call(l, a), o.r = l => {
            typeof Symbol != "undefined" && Symbol.toStringTag && Object.defineProperty(l, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(l, "__esModule", {
                value: !0
            })
        };
        var s = {};
        return (() => {
            o.r(s), o.d(s, {
                default: () => ee
            });
            var l = o(98),
                a = o.n(l),
                u = o(697),
                c = o.n(u);

            function f() {
                return f = Object.assign ? Object.assign.bind() : function(M) {
                    for (var O = 1; O < arguments.length; O++) {
                        var $ = arguments[O];
                        for (var j in $) Object.prototype.hasOwnProperty.call($, j) && (M[j] = $[j])
                    }
                    return M
                }, f.apply(this, arguments)
            }
            var d = function(M) {
                var O = M.pageClassName,
                    $ = M.pageLinkClassName,
                    j = M.page,
                    Z = M.selected,
                    ve = M.activeClassName,
                    R = M.activeLinkClassName,
                    E = M.getEventListener,
                    C = M.pageSelectedHandler,
                    F = M.href,
                    _ = M.extraAriaContext,
                    U = M.pageLabelBuilder,
                    b = M.rel,
                    J = M.ariaLabel || "Page " + j + (_ ? " " + _ : ""),
                    te = null;
                return Z && (te = "page", J = M.ariaLabel || "Page " + j + " is your current page", O = O !== void 0 ? O + " " + ve : ve, $ !== void 0 ? R !== void 0 && ($ = $ + " " + R) : $ = R), a().createElement("li", {
                    className: O
                }, a().createElement("a", f({
                    rel: b,
                    role: F ? void 0 : "button",
                    className: $,
                    href: F,
                    tabIndex: Z ? "-1" : "0",
                    "aria-label": J,
                    "aria-current": te,
                    onKeyPress: C
                }, E(C)), U(j)))
            };
            d.propTypes = {
                pageSelectedHandler: c().func.isRequired,
                selected: c().bool.isRequired,
                pageClassName: c().string,
                pageLinkClassName: c().string,
                activeClassName: c().string,
                activeLinkClassName: c().string,
                extraAriaContext: c().string,
                href: c().string,
                ariaLabel: c().string,
                page: c().number.isRequired,
                getEventListener: c().func.isRequired,
                pageLabelBuilder: c().func.isRequired,
                rel: c().string
            };
            const m = d;

            function g() {
                return g = Object.assign ? Object.assign.bind() : function(M) {
                    for (var O = 1; O < arguments.length; O++) {
                        var $ = arguments[O];
                        for (var j in $) Object.prototype.hasOwnProperty.call($, j) && (M[j] = $[j])
                    }
                    return M
                }, g.apply(this, arguments)
            }
            var w = function(M) {
                var O = M.breakLabel,
                    $ = M.breakClassName,
                    j = M.breakLinkClassName,
                    Z = M.breakHandler,
                    ve = M.getEventListener,
                    R = $ || "break";
                return a().createElement("li", {
                    className: R
                }, a().createElement("a", g({
                    className: j,
                    role: "button",
                    tabIndex: "0",
                    onKeyPress: Z
                }, ve(Z)), O))
            };
            w.propTypes = {
                breakLabel: c().oneOfType([c().string, c().node]),
                breakClassName: c().string,
                breakLinkClassName: c().string,
                breakHandler: c().func.isRequired,
                getEventListener: c().func.isRequired
            };
            const k = w;

            function h(M) {
                var O = arguments.length > 1 && arguments[1] !== void 0 ? arguments[1] : "";
                return M != null ? M : O
            }

            function p(M) {
                return p = typeof Symbol == "function" && typeof Symbol.iterator == "symbol" ? function(O) {
                    return typeof O
                } : function(O) {
                    return O && typeof Symbol == "function" && O.constructor === Symbol && O !== Symbol.prototype ? "symbol" : typeof O
                }, p(M)
            }

            function v() {
                return v = Object.assign ? Object.assign.bind() : function(M) {
                    for (var O = 1; O < arguments.length; O++) {
                        var $ = arguments[O];
                        for (var j in $) Object.prototype.hasOwnProperty.call($, j) && (M[j] = $[j])
                    }
                    return M
                }, v.apply(this, arguments)
            }

            function x(M, O) {
                for (var $ = 0; $ < O.length; $++) {
                    var j = O[$];
                    j.enumerable = j.enumerable || !1, j.configurable = !0, "value" in j && (j.writable = !0), Object.defineProperty(M, j.key, j)
                }
            }

            function P(M, O) {
                return P = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function($, j) {
                    return $.__proto__ = j, $
                }, P(M, O)
            }

            function T(M, O) {
                if (O && (p(O) === "object" || typeof O == "function")) return O;
                if (O !== void 0) throw new TypeError("Derived constructors may only return object or undefined");
                return L(M)
            }

            function L(M) {
                if (M === void 0) throw new ReferenceError("this hasn't been initialised - super() hasn't been called");
                return M
            }

            function D(M) {
                return D = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function(O) {
                    return O.__proto__ || Object.getPrototypeOf(O)
                }, D(M)
            }

            function B(M, O, $) {
                return O in M ? Object.defineProperty(M, O, {
                    value: $,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : M[O] = $, M
            }
            var I = function(M) {
                (function(E, C) {
                    if (typeof C != "function" && C !== null) throw new TypeError("Super expression must either be null or a function");
                    E.prototype = Object.create(C && C.prototype, {
                        constructor: {
                            value: E,
                            writable: !0,
                            configurable: !0
                        }
                    }), Object.defineProperty(E, "prototype", {
                        writable: !1
                    }), C && P(E, C)
                })(R, M);
                var O, $, j, Z, ve = (j = R, Z = function() {
                    if (typeof Reflect == "undefined" || !Reflect.construct || Reflect.construct.sham) return !1;
                    if (typeof Proxy == "function") return !0;
                    try {
                        return Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {})), !0
                    } catch {
                        return !1
                    }
                }(), function() {
                    var E, C = D(j);
                    if (Z) {
                        var F = D(this).constructor;
                        E = Reflect.construct(C, arguments, F)
                    } else E = C.apply(this, arguments);
                    return T(this, E)
                });

                function R(E) {
                    var C, F;
                    return function(_, U) {
                        if (!(_ instanceof U)) throw new TypeError("Cannot call a class as a function")
                    }(this, R), B(L(C = ve.call(this, E)), "handlePreviousPage", function(_) {
                        var U = C.state.selected;
                        C.handleClick(_, null, U > 0 ? U - 1 : void 0, {
                            isPrevious: !0
                        })
                    }), B(L(C), "handleNextPage", function(_) {
                        var U = C.state.selected,
                            b = C.props.pageCount;
                        C.handleClick(_, null, U < b - 1 ? U + 1 : void 0, {
                            isNext: !0
                        })
                    }), B(L(C), "handlePageSelected", function(_, U) {
                        if (C.state.selected === _) return C.callActiveCallback(_), void C.handleClick(U, null, void 0, {
                            isActive: !0
                        });
                        C.handleClick(U, null, _)
                    }), B(L(C), "handlePageChange", function(_) {
                        C.state.selected !== _ && (C.setState({
                            selected: _
                        }), C.callCallback(_))
                    }), B(L(C), "getEventListener", function(_) {
                        return B({}, C.props.eventListener, _)
                    }), B(L(C), "handleClick", function(_, U, b) {
                        var J = arguments.length > 3 && arguments[3] !== void 0 ? arguments[3] : {},
                            te = J.isPrevious,
                            Ee = te !== void 0 && te,
                            In = J.isNext,
                            xr = In !== void 0 && In,
                            Ke = J.isBreak,
                            cn = Ke !== void 0 && Ke,
                            yt = J.isActive,
                            Vt = yt !== void 0 && yt;
                        _.preventDefault ? _.preventDefault() : _.returnValue = !1;
                        var Ne = C.state.selected,
                            At = C.props.onClick,
                            qe = b;
                        if (At) {
                            var le = At({
                                index: U,
                                selected: Ne,
                                nextSelectedPage: b,
                                event: _,
                                isPrevious: Ee,
                                isNext: xr,
                                isBreak: cn,
                                isActive: Vt
                            });
                            if (le === !1) return;
                            Number.isInteger(le) && (qe = le)
                        }
                        qe !== void 0 && C.handlePageChange(qe)
                    }), B(L(C), "handleBreakClick", function(_, U) {
                        var b = C.state.selected;
                        C.handleClick(U, _, b < _ ? C.getForwardJump() : C.getBackwardJump(), {
                            isBreak: !0
                        })
                    }), B(L(C), "callCallback", function(_) {
                        C.props.onPageChange !== void 0 && typeof C.props.onPageChange == "function" && C.props.onPageChange({
                            selected: _
                        })
                    }), B(L(C), "callActiveCallback", function(_) {
                        C.props.onPageActive !== void 0 && typeof C.props.onPageActive == "function" && C.props.onPageActive({
                            selected: _
                        })
                    }), B(L(C), "getElementPageRel", function(_) {
                        var U = C.state.selected,
                            b = C.props,
                            J = b.nextPageRel,
                            te = b.prevPageRel,
                            Ee = b.selectedPageRel;
                        return U - 1 === _ ? te : U === _ ? Ee : U + 1 === _ ? J : void 0
                    }), B(L(C), "pagination", function() {
                        var _ = [],
                            U = C.props,
                            b = U.pageRangeDisplayed,
                            J = U.pageCount,
                            te = U.marginPagesDisplayed,
                            Ee = U.breakLabel,
                            In = U.breakClassName,
                            xr = U.breakLinkClassName,
                            Ke = C.state.selected;
                        if (J <= b)
                            for (var cn = 0; cn < J; cn++) _.push(C.getPageElement(cn));
                        else {
                            var yt = b / 2,
                                Vt = b - yt;
                            Ke > J - b / 2 ? yt = b - (Vt = J - Ke) : Ke < b / 2 && (Vt = b - (yt = Ke));
                            var Ne, At, qe = function(Mt) {
                                    return C.getPageElement(Mt)
                                },
                                le = [];
                            for (Ne = 0; Ne < J; Ne++) {
                                var fn = Ne + 1;
                                fn <= te || fn > J - te || Ne >= Ke - yt && Ne <= Ke + (Ke === 0 && b > 1 ? Vt - 1 : Vt) ? le.push({
                                    type: "page",
                                    index: Ne,
                                    display: qe(Ne)
                                }) : Ee && le.length > 0 && le[le.length - 1].display !== At && (b > 0 || te > 0) && (At = a().createElement(k, {
                                    key: Ne,
                                    breakLabel: Ee,
                                    breakClassName: In,
                                    breakLinkClassName: xr,
                                    breakHandler: C.handleBreakClick.bind(null, Ne),
                                    getEventListener: C.getEventListener
                                }), le.push({
                                    type: "break",
                                    index: Ne,
                                    display: At
                                }))
                            }
                            le.forEach(function(Mt, Ot) {
                                var Ri = Mt;
                                Mt.type === "break" && le[Ot - 1] && le[Ot - 1].type === "page" && le[Ot + 1] && le[Ot + 1].type === "page" && le[Ot + 1].index - le[Ot - 1].index <= 2 && (Ri = {
                                    type: "page",
                                    index: Mt.index,
                                    display: qe(Mt.index)
                                }), _.push(Ri.display)
                            })
                        }
                        return _
                    }), E.initialPage !== void 0 && E.forcePage !== void 0 && console.warn("(react-paginate): Both initialPage (".concat(E.initialPage, ") and forcePage (").concat(E.forcePage, ") props are provided, which is discouraged.") + ` Use exclusively forcePage prop for a controlled component.
See https://reactjs.org/docs/forms.html#controlled-components`), F = E.initialPage ? E.initialPage : E.forcePage ? E.forcePage : 0, C.state = {
                        selected: F
                    }, C
                }
                return O = R, ($ = [{
                    key: "componentDidMount",
                    value: function() {
                        var E = this.props,
                            C = E.initialPage,
                            F = E.disableInitialCallback,
                            _ = E.extraAriaContext,
                            U = E.pageCount,
                            b = E.forcePage;
                        C === void 0 || F || this.callCallback(C), _ && console.warn("DEPRECATED (react-paginate): The extraAriaContext prop is deprecated. You should now use the ariaLabelBuilder instead."), Number.isInteger(U) || console.warn("(react-paginate): The pageCount prop value provided is not an integer (".concat(U, "). Did you forget a Math.ceil()?")), C !== void 0 && C > U - 1 && console.warn("(react-paginate): The initialPage prop provided is greater than the maximum page index from pageCount prop (".concat(C, " > ").concat(U - 1, ").")), b !== void 0 && b > U - 1 && console.warn("(react-paginate): The forcePage prop provided is greater than the maximum page index from pageCount prop (".concat(b, " > ").concat(U - 1, ")."))
                    }
                }, {
                    key: "componentDidUpdate",
                    value: function(E) {
                        this.props.forcePage !== void 0 && this.props.forcePage !== E.forcePage && (this.props.forcePage > this.props.pageCount - 1 && console.warn("(react-paginate): The forcePage prop provided is greater than the maximum page index from pageCount prop (".concat(this.props.forcePage, " > ").concat(this.props.pageCount - 1, ").")), this.setState({
                            selected: this.props.forcePage
                        })), Number.isInteger(E.pageCount) && !Number.isInteger(this.props.pageCount) && console.warn("(react-paginate): The pageCount prop value provided is not an integer (".concat(this.props.pageCount, "). Did you forget a Math.ceil()?"))
                    }
                }, {
                    key: "getForwardJump",
                    value: function() {
                        var E = this.state.selected,
                            C = this.props,
                            F = C.pageCount,
                            _ = E + C.pageRangeDisplayed;
                        return _ >= F ? F - 1 : _
                    }
                }, {
                    key: "getBackwardJump",
                    value: function() {
                        var E = this.state.selected - this.props.pageRangeDisplayed;
                        return E < 0 ? 0 : E
                    }
                }, {
                    key: "getElementHref",
                    value: function(E) {
                        var C = this.props,
                            F = C.hrefBuilder,
                            _ = C.pageCount,
                            U = C.hrefAllControls;
                        if (F) return U || E >= 0 && E < _ ? F(E + 1, _, this.state.selected) : void 0
                    }
                }, {
                    key: "ariaLabelBuilder",
                    value: function(E) {
                        var C = E === this.state.selected;
                        if (this.props.ariaLabelBuilder && E >= 0 && E < this.props.pageCount) {
                            var F = this.props.ariaLabelBuilder(E + 1, C);
                            return this.props.extraAriaContext && !C && (F = F + " " + this.props.extraAriaContext), F
                        }
                    }
                }, {
                    key: "getPageElement",
                    value: function(E) {
                        var C = this.state.selected,
                            F = this.props,
                            _ = F.pageClassName,
                            U = F.pageLinkClassName,
                            b = F.activeClassName,
                            J = F.activeLinkClassName,
                            te = F.extraAriaContext,
                            Ee = F.pageLabelBuilder;
                        return a().createElement(m, {
                            key: E,
                            pageSelectedHandler: this.handlePageSelected.bind(null, E),
                            selected: C === E,
                            rel: this.getElementPageRel(E),
                            pageClassName: _,
                            pageLinkClassName: U,
                            activeClassName: b,
                            activeLinkClassName: J,
                            extraAriaContext: te,
                            href: this.getElementHref(E),
                            ariaLabel: this.ariaLabelBuilder(E),
                            page: E + 1,
                            pageLabelBuilder: Ee,
                            getEventListener: this.getEventListener
                        })
                    }
                }, {
                    key: "render",
                    value: function() {
                        var E = this.props.renderOnZeroPageCount;
                        if (this.props.pageCount === 0 && E !== void 0) return E && E(this.props);
                        var C = this.props,
                            F = C.disabledClassName,
                            _ = C.disabledLinkClassName,
                            U = C.pageCount,
                            b = C.className,
                            J = C.containerClassName,
                            te = C.previousLabel,
                            Ee = C.previousClassName,
                            In = C.previousLinkClassName,
                            xr = C.previousAriaLabel,
                            Ke = C.prevRel,
                            cn = C.nextLabel,
                            yt = C.nextClassName,
                            Vt = C.nextLinkClassName,
                            Ne = C.nextAriaLabel,
                            At = C.nextRel,
                            qe = this.state.selected,
                            le = qe === 0,
                            fn = qe === U - 1,
                            Mt = "".concat(h(Ee)).concat(le ? " ".concat(h(F)) : ""),
                            Ot = "".concat(h(yt)).concat(fn ? " ".concat(h(F)) : ""),
                            Ri = "".concat(h(In)).concat(le ? " ".concat(h(_)) : ""),
                            cv = "".concat(h(Vt)).concat(fn ? " ".concat(h(_)) : ""),
                            fv = le ? "true" : "false",
                            dv = fn ? "true" : "false";
                        return a().createElement("ul", {
                            className: b || J,
                            role: "navigation",
                            "aria-label": "Pagination"
                        }, a().createElement("li", {
                            className: Mt
                        }, a().createElement("a", v({
                            className: Ri,
                            href: this.getElementHref(qe - 1),
                            tabIndex: le ? "-1" : "0",
                            role: "button",
                            onKeyPress: this.handlePreviousPage,
                            "aria-disabled": fv,
                            "aria-label": xr,
                            rel: Ke
                        }, this.getEventListener(this.handlePreviousPage)), te)), this.pagination(), a().createElement("li", {
                            className: Ot
                        }, a().createElement("a", v({
                            className: cv,
                            href: this.getElementHref(qe + 1),
                            tabIndex: fn ? "-1" : "0",
                            role: "button",
                            onKeyPress: this.handleNextPage,
                            "aria-disabled": dv,
                            "aria-label": Ne,
                            rel: At
                        }, this.getEventListener(this.handleNextPage)), cn)))
                    }
                }]) && x(O.prototype, $), Object.defineProperty(O, "prototype", {
                    writable: !1
                }), R
            }(l.Component);
            B(I, "propTypes", {
                pageCount: c().number.isRequired,
                pageRangeDisplayed: c().number,
                marginPagesDisplayed: c().number,
                previousLabel: c().node,
                previousAriaLabel: c().string,
                prevPageRel: c().string,
                prevRel: c().string,
                nextLabel: c().node,
                nextAriaLabel: c().string,
                nextPageRel: c().string,
                nextRel: c().string,
                breakLabel: c().oneOfType([c().string, c().node]),
                hrefBuilder: c().func,
                hrefAllControls: c().bool,
                onPageChange: c().func,
                onPageActive: c().func,
                onClick: c().func,
                initialPage: c().number,
                forcePage: c().number,
                disableInitialCallback: c().bool,
                containerClassName: c().string,
                className: c().string,
                pageClassName: c().string,
                pageLinkClassName: c().string,
                pageLabelBuilder: c().func,
                activeClassName: c().string,
                activeLinkClassName: c().string,
                previousClassName: c().string,
                nextClassName: c().string,
                previousLinkClassName: c().string,
                nextLinkClassName: c().string,
                disabledClassName: c().string,
                disabledLinkClassName: c().string,
                breakClassName: c().string,
                breakLinkClassName: c().string,
                extraAriaContext: c().string,
                ariaLabelBuilder: c().func,
                eventListener: c().string,
                renderOnZeroPageCount: c().func,
                selectedPageRel: c().string
            }), B(I, "defaultProps", {
                pageRangeDisplayed: 2,
                marginPagesDisplayed: 3,
                activeClassName: "selected",
                previousLabel: "Previous",
                previousClassName: "previous",
                previousAriaLabel: "Previous page",
                prevPageRel: "prev",
                prevRel: "prev",
                nextLabel: "Next",
                nextClassName: "next",
                nextAriaLabel: "Next page",
                nextPageRel: "next",
                nextRel: "next",
                breakLabel: "...",
                disabledClassName: "disabled",
                disableInitialCallback: !1,
                pageLabelBuilder: function(M) {
                    return M
                },
                eventListener: "onClick",
                renderOnZeroPageCount: void 0,
                selectedPageRel: "canonical",
                hrefAllControls: !1
            });
            const ee = I
        })(), s
    })())
})(av);
var OC = vv(av.exports);

function uv() {
    return y("svg", {
        width: "8",
        height: "10",
        viewBox: "0 0 8 10",
        fill: "none",
        xmlns: "http://www.w3.org/2000/svg",
        children: y("path", {
            d: "M3.06305 9.32L7.66305 4.78L3.06305 0.24H0.183046L4.80305 4.78L0.183046 9.32H3.06305Z",
            fill: "white"
        })
    })
}

function IC() {
    return y("div", {
        className: "rotate-180",
        children: y(uv, {})
    })
}

function Zi() {
    return `
        bg-[#FFB81D50] 
        rounded-md 
        w-10 h-10
        text-white 
        flex 
        justify-center 
        items-center 
        cursor-pointer 
        border-solid 
        border-[1px] 
        border-[#FFB81D]
    `
}

function FC({
    pageCount: e,
    onPageChange: t
}) {
    return y(OC, {
        onPageChange: t,
        pageCount: e,
        className: "w-full\r flex\r justify-center\r items-center\r gap-[.4vw]\r ",
        pageRangeDisplayed: 2,
        marginPagesDisplayed: 1,
        activeLinkClassName: "bg-[#FFB81D25]",
        pageLinkClassName: Zi(),
        breakLinkClassName: Zi(),
        previousLinkClassName: Zi(),
        previousLabel: y(IC, {}),
        nextLinkClassName: Zi(),
        nextLabel: y(uv, {})
    })
}
const jC = () => {
        const [e, t] = S.exports.useState({}), [n, r] = S.exports.useState(3), i = o => {
            Re("getRanking", {
                page: o.selected + 1
            }, {
                ranking: [{
                    Name: "Barnaby Marmaduke",
                    LastLogin: "10/20/22 | 12:20",
                    TimePlayed: "500 horas",
                    Rating: 500,
                    Discord: "Droyen#0001"
                }]
            }).then(s => {
                r(s.Pages), t(s.Ranking)
            })
        };
        return y(ye, {
            children: y(vt.div, {
                initial: {
                    opacity: 0
                },
                animate: {
                    opacity: 1
                },
                exit: {
                    opacity: 0
                },
                className: "h-full flex flex-col",
                children: V("div", {
                    className: "w-full h-full mt-[3.125vw] pl-[3.333vw] pr-[1.719vw] pb-[3.333vw] flex flex-col",
                    children: [y("div", {
                        children: V("div", {
                            className: "w-full h-[3.125vw] flex flex-row justify-between items-center mb-6",
                            children: [y("p", {
                                className: "text-white text-[1.667vw] font-[600] leading-[2.083vw] mb-6",
                                children: "Afiliados"
                            }), V("div", {
                                children: [y("p", {
                                    className: "text-[#FFB81D80] text-[.9vw] font-[600] leading-[1.667vw] mb-1 mr-4 cursor-pointer",
                                    children: "CONVIDAR"
                                }), V("div", {
                                    className: "flex flex-row relative",
                                    children: [y("input", {
                                        type: "text",
                                        className: "w-[5vw] h-[2.125vw] bg-[#D9D9D90F] border-[#1F1F1F] text-[#FFFFFF40] text-[.8vw] font-[600] leading-[1.667vw] px-4 rounded-md",
                                        placeholder: "ID"
                                    }), y("button", {
                                        className: "w-[6.25vw] h-[2.125vw] bg-[#D9D9D90F] text-white text-[.8vw] font-[600] leading-[1.667vw] rounded-md",
                                        children: "Convidar"
                                    })]
                                })]
                            })]
                        })
                    }), y("div", {
                        className: "w-full h-full",
                        children: V("table", {
                            className: "table",
                            children: [y("thead", {
                                children: V("tr", {
                                    className: "grid-cols-[.6fr_.6fr_.5fr_.5fr_.5fr]",
                                    children: [y("th", {
                                        children: "Jogador"
                                    }), y("th", {
                                        children: "\xDAltimo login"
                                    }), y("th", {
                                        children: "Tempo jogado"
                                    }), y("th", {
                                        children: "Pontos"
                                    }), y("th", {
                                        children: "Discord"
                                    })]
                                })
                            }), y("tbody", {
                                children: e.ranking && e.ranking.map((o, s) => V("tr", {
                                    className: "grid items-center grid-cols-[.6fr_.6fr_.5fr_.5fr_.5fr]",
                                    children: [y("td", {
                                        children: o.Name
                                    }), y("td", {
                                        children: o.LastLogin
                                    }), y("td", {
                                        children: o.TimePlayed
                                    }), y("td", {
                                        children: V("div", {
                                            style: {
                                                position: "relative"
                                            },
                                            children: [o.Rating, y(MC, {})]
                                        })
                                    }), y("td", {
                                        children: o.Discord
                                    })]
                                }))
                            })]
                        })
                    }), y(FC, {
                        pageCount: n,
                        onPageChange: i
                    })]
                })
            })
        })
    },
    zC = () => V(By, {
        children: [y(ut, {
            path: "/",
            element: y(Fy, {
                to: "/help"
            })
        }), y(ut, {
            path: "help",
            element: y(wC, {})
        }), y(ut, {
            path: "denounce",
            element: y(SC, {})
        }), y(ut, {
            path: "newcall",
            element: y(CC, {})
        }), y(ut, {
            path: "call",
            element: y(AC, {})
        }), V(ut, {
            path: "dashboard",
            element: y(LC, {}),
            children: [y(ut, {
                path: "partners",
                element: y(jC, {})
            }), y(ut, {
                path: "calls",
                element: y(DC, {})
            }), y(ut, {
                path: "ranking",
                element: y(VC, {})
            })]
        })]
    }),
    BC = () => {
        const {
            visible: e,
            setVisible: t
        } = Pi(), {
            dashboard: n,
            setDashboard: r
        } = Ns(), {
            setHelp: i
        } = wr(), o = Vn();
        return Ct("getHelpItems", function(s) {
            i(s), o("/help"), t(!0)
        }), Ct("openDashboard", function(s) {
            o("/dashboard/calls"), r(s), t(!0)
        }), Ct("updateList", function(s) {
            const l = {
                ...n
            };
            l.callsList = s, r(l)
        }), y(ye, {
            children: e && y("div", {
                className: "w-full h-full absolute flex justify-center items-center",
                children: y(zC, {})
            })
        })
    };
ml.createRoot(document.getElementById("root")).render(y(Jo.StrictMode, {
    children: y(U0, {
        children: y(Xy, {
            children: y(TC, {
                children: y(Wy, {
                    children: y(BC, {})
                })
            })
        })
    })
}));
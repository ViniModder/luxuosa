(function() {
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
})();

function Bu(e) {
    return e && e.__esModule && Object.prototype.hasOwnProperty.call(e, "default") ? e.default : e
}
var P = {},
    v2 = {
        get exports() {
            return P
        },
        set exports(e) {
            P = e
        }
    },
    Y = {};
/**
 * @license React
 * react.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
var Ui = Symbol.for("react.element"),
    g2 = Symbol.for("react.portal"),
    C2 = Symbol.for("react.fragment"),
    w2 = Symbol.for("react.strict_mode"),
    S2 = Symbol.for("react.profiler"),
    x2 = Symbol.for("react.provider"),
    P2 = Symbol.for("react.context"),
    k2 = Symbol.for("react.forward_ref"),
    E2 = Symbol.for("react.suspense"),
    T2 = Symbol.for("react.memo"),
    R2 = Symbol.for("react.lazy"),
    gf = Symbol.iterator;

function A2(e) {
    return e === null || typeof e != "object" ? null : (e = gf && e[gf] || e["@@iterator"], typeof e == "function" ? e : null)
}
var u1 = {
        isMounted: function() {
            return !1
        },
        enqueueForceUpdate: function() {},
        enqueueReplaceState: function() {},
        enqueueSetState: function() {}
    },
    c1 = Object.assign,
    f1 = {};

function $r(e, t, n) {
    this.props = e, this.context = t, this.refs = f1, this.updater = n || u1
}
$r.prototype.isReactComponent = {};
$r.prototype.setState = function(e, t) {
    if (typeof e != "object" && typeof e != "function" && e != null) throw Error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.");
    this.updater.enqueueSetState(this, e, t, "setState")
};
$r.prototype.forceUpdate = function(e) {
    this.updater.enqueueForceUpdate(this, e, "forceUpdate")
};

function d1() {}
d1.prototype = $r.prototype;

function Uu(e, t, n) {
    this.props = e, this.context = t, this.refs = f1, this.updater = n || u1
}
var Qu = Uu.prototype = new d1;
Qu.constructor = Uu;
c1(Qu, $r.prototype);
Qu.isPureReactComponent = !0;
var Cf = Array.isArray,
    h1 = Object.prototype.hasOwnProperty,
    Hu = {
        current: null
    },
    p1 = {
        key: !0,
        ref: !0,
        __self: !0,
        __source: !0
    };

function m1(e, t, n) {
    var r, i = {},
        o = null,
        s = null;
    if (t != null)
        for (r in t.ref !== void 0 && (s = t.ref), t.key !== void 0 && (o = "" + t.key), t) h1.call(t, r) && !p1.hasOwnProperty(r) && (i[r] = t[r]);
    var a = arguments.length - 2;
    if (a === 1) i.children = n;
    else if (1 < a) {
        for (var l = Array(a), u = 0; u < a; u++) l[u] = arguments[u + 2];
        i.children = l
    }
    if (e && e.defaultProps)
        for (r in a = e.defaultProps, a) i[r] === void 0 && (i[r] = a[r]);
    return {
        $$typeof: Ui,
        type: e,
        key: o,
        ref: s,
        props: i,
        _owner: Hu.current
    }
}

function M2(e, t) {
    return {
        $$typeof: Ui,
        type: e.type,
        key: t,
        ref: e.ref,
        props: e.props,
        _owner: e._owner
    }
}

function Wu(e) {
    return typeof e == "object" && e !== null && e.$$typeof === Ui
}

function O2(e) {
    var t = {
        "=": "=0",
        ":": "=2"
    };
    return "$" + e.replace(/[=:]/g, function(n) {
        return t[n]
    })
}
var wf = /\/+/g;

function Fa(e, t) {
    return typeof e == "object" && e !== null && e.key != null ? O2("" + e.key) : t.toString(36)
}

function Ao(e, t, n, r, i) {
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
                case Ui:
                case g2:
                    s = !0
            }
    }
    if (s) return s = e, i = i(s), e = r === "" ? "." + Fa(s, 0) : r, Cf(i) ? (n = "", e != null && (n = e.replace(wf, "$&/") + "/"), Ao(i, t, n, "", function(u) {
        return u
    })) : i != null && (Wu(i) && (i = M2(i, n + (!i.key || s && s.key === i.key ? "" : ("" + i.key).replace(wf, "$&/") + "/") + e)), t.push(i)), 1;
    if (s = 0, r = r === "" ? "." : r + ":", Cf(e))
        for (var a = 0; a < e.length; a++) {
            o = e[a];
            var l = r + Fa(o, a);
            s += Ao(o, t, n, l, i)
        } else if (l = A2(e), typeof l == "function")
            for (e = l.call(e), a = 0; !(o = e.next()).done;) o = o.value, l = r + Fa(o, a++), s += Ao(o, t, n, l, i);
        else if (o === "object") throw t = String(e), Error("Objects are not valid as a React child (found: " + (t === "[object Object]" ? "object with keys {" + Object.keys(e).join(", ") + "}" : t) + "). If you meant to render a collection of children, use an array instead.");
    return s
}

function no(e, t, n) {
    if (e == null) return e;
    var r = [],
        i = 0;
    return Ao(e, r, "", "", function(o) {
        return t.call(n, o, i++)
    }), r
}

function F2(e) {
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
var Ge = {
        current: null
    },
    Mo = {
        transition: null
    },
    L2 = {
        ReactCurrentDispatcher: Ge,
        ReactCurrentBatchConfig: Mo,
        ReactCurrentOwner: Hu
    };
Y.Children = {
    map: no,
    forEach: function(e, t, n) {
        no(e, function() {
            t.apply(this, arguments)
        }, n)
    },
    count: function(e) {
        var t = 0;
        return no(e, function() {
            t++
        }), t
    },
    toArray: function(e) {
        return no(e, function(t) {
            return t
        }) || []
    },
    only: function(e) {
        if (!Wu(e)) throw Error("React.Children.only expected to receive a single React element child.");
        return e
    }
};
Y.Component = $r;
Y.Fragment = C2;
Y.Profiler = S2;
Y.PureComponent = Uu;
Y.StrictMode = w2;
Y.Suspense = E2;
Y.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = L2;
Y.cloneElement = function(e, t, n) {
    if (e == null) throw Error("React.cloneElement(...): The argument must be a React element, but you passed " + e + ".");
    var r = c1({}, e.props),
        i = e.key,
        o = e.ref,
        s = e._owner;
    if (t != null) {
        if (t.ref !== void 0 && (o = t.ref, s = Hu.current), t.key !== void 0 && (i = "" + t.key), e.type && e.type.defaultProps) var a = e.type.defaultProps;
        for (l in t) h1.call(t, l) && !p1.hasOwnProperty(l) && (r[l] = t[l] === void 0 && a !== void 0 ? a[l] : t[l])
    }
    var l = arguments.length - 2;
    if (l === 1) r.children = n;
    else if (1 < l) {
        a = Array(l);
        for (var u = 0; u < l; u++) a[u] = arguments[u + 2];
        r.children = a
    }
    return {
        $$typeof: Ui,
        type: e.type,
        key: i,
        ref: o,
        props: r,
        _owner: s
    }
};
Y.createContext = function(e) {
    return e = {
        $$typeof: P2,
        _currentValue: e,
        _currentValue2: e,
        _threadCount: 0,
        Provider: null,
        Consumer: null,
        _defaultValue: null,
        _globalName: null
    }, e.Provider = {
        $$typeof: x2,
        _context: e
    }, e.Consumer = e
};
Y.createElement = m1;
Y.createFactory = function(e) {
    var t = m1.bind(null, e);
    return t.type = e, t
};
Y.createRef = function() {
    return {
        current: null
    }
};
Y.forwardRef = function(e) {
    return {
        $$typeof: k2,
        render: e
    }
};
Y.isValidElement = Wu;
Y.lazy = function(e) {
    return {
        $$typeof: R2,
        _payload: {
            _status: -1,
            _result: e
        },
        _init: F2
    }
};
Y.memo = function(e, t) {
    return {
        $$typeof: T2,
        type: e,
        compare: t === void 0 ? null : t
    }
};
Y.startTransition = function(e) {
    var t = Mo.transition;
    Mo.transition = {};
    try {
        e()
    } finally {
        Mo.transition = t
    }
};
Y.unstable_act = function() {
    throw Error("act(...) is not supported in production builds of React.")
};
Y.useCallback = function(e, t) {
    return Ge.current.useCallback(e, t)
};
Y.useContext = function(e) {
    return Ge.current.useContext(e)
};
Y.useDebugValue = function() {};
Y.useDeferredValue = function(e) {
    return Ge.current.useDeferredValue(e)
};
Y.useEffect = function(e, t) {
    return Ge.current.useEffect(e, t)
};
Y.useId = function() {
    return Ge.current.useId()
};
Y.useImperativeHandle = function(e, t, n) {
    return Ge.current.useImperativeHandle(e, t, n)
};
Y.useInsertionEffect = function(e, t) {
    return Ge.current.useInsertionEffect(e, t)
};
Y.useLayoutEffect = function(e, t) {
    return Ge.current.useLayoutEffect(e, t)
};
Y.useMemo = function(e, t) {
    return Ge.current.useMemo(e, t)
};
Y.useReducer = function(e, t, n) {
    return Ge.current.useReducer(e, t, n)
};
Y.useRef = function(e) {
    return Ge.current.useRef(e)
};
Y.useState = function(e) {
    return Ge.current.useState(e)
};
Y.useSyncExternalStore = function(e, t, n) {
    return Ge.current.useSyncExternalStore(e, t, n)
};
Y.useTransition = function() {
    return Ge.current.useTransition()
};
Y.version = "18.2.0";
(function(e) {
    e.exports = Y
})(v2);
const ce = Bu(P);
var xl = {},
    Ko = {},
    b2 = {
        get exports() {
            return Ko
        },
        set exports(e) {
            Ko = e
        }
    },
    ut = {},
    Pl = {},
    D2 = {
        get exports() {
            return Pl
        },
        set exports(e) {
            Pl = e
        }
    },
    y1 = {};
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
    function t(A, I) {
        var N = A.length;
        A.push(I);
        e: for (; 0 < N;) {
            var $ = N - 1 >>> 1,
                M = A[$];
            if (0 < i(M, I)) A[$] = I, A[N] = M, N = $;
            else break e
        }
    }

    function n(A) {
        return A.length === 0 ? null : A[0]
    }

    function r(A) {
        if (A.length === 0) return null;
        var I = A[0],
            N = A.pop();
        if (N !== I) {
            A[0] = N;
            e: for (var $ = 0, M = A.length, L = M >>> 1; $ < L;) {
                var b = 2 * ($ + 1) - 1,
                    z = A[b],
                    w = b + 1,
                    K = A[w];
                if (0 > i(z, N)) w < M && 0 > i(K, z) ? (A[$] = K, A[w] = N, $ = w) : (A[$] = z, A[b] = N, $ = b);
                else if (w < M && 0 > i(K, N)) A[$] = K, A[w] = N, $ = w;
                else break e
            }
        }
        return I
    }

    function i(A, I) {
        var N = A.sortIndex - I.sortIndex;
        return N !== 0 ? N : A.id - I.id
    }
    if (typeof performance == "object" && typeof performance.now == "function") {
        var o = performance;
        e.unstable_now = function() {
            return o.now()
        }
    } else {
        var s = Date,
            a = s.now();
        e.unstable_now = function() {
            return s.now() - a
        }
    }
    var l = [],
        u = [],
        c = 1,
        f = null,
        d = 3,
        p = !1,
        y = !1,
        g = !1,
        x = typeof setTimeout == "function" ? setTimeout : null,
        v = typeof clearTimeout == "function" ? clearTimeout : null,
        h = typeof setImmediate < "u" ? setImmediate : null;
    typeof navigator < "u" && navigator.scheduling !== void 0 && navigator.scheduling.isInputPending !== void 0 && navigator.scheduling.isInputPending.bind(navigator.scheduling);

    function m(A) {
        for (var I = n(u); I !== null;) {
            if (I.callback === null) r(u);
            else if (I.startTime <= A) r(u), I.sortIndex = I.expirationTime, t(l, I);
            else break;
            I = n(u)
        }
    }

    function C(A) {
        if (g = !1, m(A), !y)
            if (n(l) !== null) y = !0, ie(S);
            else {
                var I = n(u);
                I !== null && ue(C, I.startTime - A)
            }
    }

    function S(A, I) {
        y = !1, g && (g = !1, v(E), E = -1), p = !0;
        var N = d;
        try {
            for (m(I), f = n(l); f !== null && (!(f.expirationTime > I) || A && !ee());) {
                var $ = f.callback;
                if (typeof $ == "function") {
                    f.callback = null, d = f.priorityLevel;
                    var M = $(f.expirationTime <= I);
                    I = e.unstable_now(), typeof M == "function" ? f.callback = M : f === n(l) && r(l), m(I)
                } else r(l);
                f = n(l)
            }
            if (f !== null) var L = !0;
            else {
                var b = n(u);
                b !== null && ue(C, b.startTime - I), L = !1
            }
            return L
        } finally {
            f = null, d = N, p = !1
        }
    }
    var k = !1,
        T = null,
        E = -1,
        _ = 5,
        D = -1;

    function ee() {
        return !(e.unstable_now() - D < _)
    }

    function Z() {
        if (T !== null) {
            var A = e.unstable_now();
            D = A;
            var I = !0;
            try {
                I = T(!0, A)
            } finally {
                I ? J() : (k = !1, T = null)
            }
        } else k = !1
    }
    var J;
    if (typeof h == "function") J = function() {
        h(Z)
    };
    else if (typeof MessageChannel < "u") {
        var H = new MessageChannel,
            Q = H.port2;
        H.port1.onmessage = Z, J = function() {
            Q.postMessage(null)
        }
    } else J = function() {
        x(Z, 0)
    };

    function ie(A) {
        T = A, k || (k = !0, J())
    }

    function ue(A, I) {
        E = x(function() {
            A(e.unstable_now())
        }, I)
    }
    e.unstable_IdlePriority = 5, e.unstable_ImmediatePriority = 1, e.unstable_LowPriority = 4, e.unstable_NormalPriority = 3, e.unstable_Profiling = null, e.unstable_UserBlockingPriority = 2, e.unstable_cancelCallback = function(A) {
        A.callback = null
    }, e.unstable_continueExecution = function() {
        y || p || (y = !0, ie(S))
    }, e.unstable_forceFrameRate = function(A) {
        0 > A || 125 < A ? console.error("forceFrameRate takes a positive int between 0 and 125, forcing frame rates higher than 125 fps is not supported") : _ = 0 < A ? Math.floor(1e3 / A) : 5
    }, e.unstable_getCurrentPriorityLevel = function() {
        return d
    }, e.unstable_getFirstCallbackNode = function() {
        return n(l)
    }, e.unstable_next = function(A) {
        switch (d) {
            case 1:
            case 2:
            case 3:
                var I = 3;
                break;
            default:
                I = d
        }
        var N = d;
        d = I;
        try {
            return A()
        } finally {
            d = N
        }
    }, e.unstable_pauseExecution = function() {}, e.unstable_requestPaint = function() {}, e.unstable_runWithPriority = function(A, I) {
        switch (A) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
                break;
            default:
                A = 3
        }
        var N = d;
        d = A;
        try {
            return I()
        } finally {
            d = N
        }
    }, e.unstable_scheduleCallback = function(A, I, N) {
        var $ = e.unstable_now();
        switch (typeof N == "object" && N !== null ? (N = N.delay, N = typeof N == "number" && 0 < N ? $ + N : $) : N = $, A) {
            case 1:
                var M = -1;
                break;
            case 2:
                M = 250;
                break;
            case 5:
                M = 1073741823;
                break;
            case 4:
                M = 1e4;
                break;
            default:
                M = 5e3
        }
        return M = N + M, A = {
            id: c++,
            callback: I,
            priorityLevel: A,
            startTime: N,
            expirationTime: M,
            sortIndex: -1
        }, N > $ ? (A.sortIndex = N, t(u, A), n(l) === null && A === n(u) && (g ? (v(E), E = -1) : g = !0, ue(C, N - $))) : (A.sortIndex = M, t(l, A), y || p || (y = !0, ie(S))), A
    }, e.unstable_shouldYield = ee, e.unstable_wrapCallback = function(A) {
        var I = d;
        return function() {
            var N = d;
            d = I;
            try {
                return A.apply(this, arguments)
            } finally {
                d = N
            }
        }
    }
})(y1);
(function(e) {
    e.exports = y1
})(D2);
/**
 * @license React
 * react-dom.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
var v1 = P,
    at = Pl;

function R(e) {
    for (var t = "https://reactjs.org/docs/error-decoder.html?invariant=" + e, n = 1; n < arguments.length; n++) t += "&args[]=" + encodeURIComponent(arguments[n]);
    return "Minified React error #" + e + "; visit " + t + " for the full message or use the non-minified dev environment for full errors and additional helpful warnings."
}
var g1 = new Set,
    Si = {};

function Wn(e, t) {
    Er(e, t), Er(e + "Capture", t)
}

function Er(e, t) {
    for (Si[e] = t, e = 0; e < t.length; e++) g1.add(t[e])
}
var Qt = !(typeof window > "u" || typeof window.document > "u" || typeof window.document.createElement > "u"),
    kl = Object.prototype.hasOwnProperty,
    V2 = /^[:A-Z_a-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02FF\u0370-\u037D\u037F-\u1FFF\u200C-\u200D\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD][:A-Z_a-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02FF\u0370-\u037D\u037F-\u1FFF\u200C-\u200D\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD\-.0-9\u00B7\u0300-\u036F\u203F-\u2040]*$/,
    Sf = {},
    xf = {};

function _2(e) {
    return kl.call(xf, e) ? !0 : kl.call(Sf, e) ? !1 : V2.test(e) ? xf[e] = !0 : (Sf[e] = !0, !1)
}

function I2(e, t, n, r) {
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

function $2(e, t, n, r) {
    if (t === null || typeof t > "u" || I2(e, t, n, r)) return !0;
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

function Ze(e, t, n, r, i, o, s) {
    this.acceptsBooleans = t === 2 || t === 3 || t === 4, this.attributeName = r, this.attributeNamespace = i, this.mustUseProperty = n, this.propertyName = e, this.type = t, this.sanitizeURL = o, this.removeEmptyString = s
}
var je = {};
"children dangerouslySetInnerHTML defaultValue defaultChecked innerHTML suppressContentEditableWarning suppressHydrationWarning style".split(" ").forEach(function(e) {
    je[e] = new Ze(e, 0, !1, e, null, !1, !1)
});
[
    ["acceptCharset", "accept-charset"],
    ["className", "class"],
    ["htmlFor", "for"],
    ["httpEquiv", "http-equiv"]
].forEach(function(e) {
    var t = e[0];
    je[t] = new Ze(t, 1, !1, e[1], null, !1, !1)
});
["contentEditable", "draggable", "spellCheck", "value"].forEach(function(e) {
    je[e] = new Ze(e, 2, !1, e.toLowerCase(), null, !1, !1)
});
["autoReverse", "externalResourcesRequired", "focusable", "preserveAlpha"].forEach(function(e) {
    je[e] = new Ze(e, 2, !1, e, null, !1, !1)
});
"allowFullScreen async autoFocus autoPlay controls default defer disabled disablePictureInPicture disableRemotePlayback formNoValidate hidden loop noModule noValidate open playsInline readOnly required reversed scoped seamless itemScope".split(" ").forEach(function(e) {
    je[e] = new Ze(e, 3, !1, e.toLowerCase(), null, !1, !1)
});
["checked", "multiple", "muted", "selected"].forEach(function(e) {
    je[e] = new Ze(e, 3, !0, e, null, !1, !1)
});
["capture", "download"].forEach(function(e) {
    je[e] = new Ze(e, 4, !1, e, null, !1, !1)
});
["cols", "rows", "size", "span"].forEach(function(e) {
    je[e] = new Ze(e, 6, !1, e, null, !1, !1)
});
["rowSpan", "start"].forEach(function(e) {
    je[e] = new Ze(e, 5, !1, e.toLowerCase(), null, !1, !1)
});
var Ku = /[\-:]([a-z])/g;

function qu(e) {
    return e[1].toUpperCase()
}
"accent-height alignment-baseline arabic-form baseline-shift cap-height clip-path clip-rule color-interpolation color-interpolation-filters color-profile color-rendering dominant-baseline enable-background fill-opacity fill-rule flood-color flood-opacity font-family font-size font-size-adjust font-stretch font-style font-variant font-weight glyph-name glyph-orientation-horizontal glyph-orientation-vertical horiz-adv-x horiz-origin-x image-rendering letter-spacing lighting-color marker-end marker-mid marker-start overline-position overline-thickness paint-order panose-1 pointer-events rendering-intent shape-rendering stop-color stop-opacity strikethrough-position strikethrough-thickness stroke-dasharray stroke-dashoffset stroke-linecap stroke-linejoin stroke-miterlimit stroke-opacity stroke-width text-anchor text-decoration text-rendering underline-position underline-thickness unicode-bidi unicode-range units-per-em v-alphabetic v-hanging v-ideographic v-mathematical vector-effect vert-adv-y vert-origin-x vert-origin-y word-spacing writing-mode xmlns:xlink x-height".split(" ").forEach(function(e) {
    var t = e.replace(Ku, qu);
    je[t] = new Ze(t, 1, !1, e, null, !1, !1)
});
"xlink:actuate xlink:arcrole xlink:role xlink:show xlink:title xlink:type".split(" ").forEach(function(e) {
    var t = e.replace(Ku, qu);
    je[t] = new Ze(t, 1, !1, e, "http://www.w3.org/1999/xlink", !1, !1)
});
["xml:base", "xml:lang", "xml:space"].forEach(function(e) {
    var t = e.replace(Ku, qu);
    je[t] = new Ze(t, 1, !1, e, "http://www.w3.org/XML/1998/namespace", !1, !1)
});
["tabIndex", "crossOrigin"].forEach(function(e) {
    je[e] = new Ze(e, 1, !1, e.toLowerCase(), null, !1, !1)
});
je.xlinkHref = new Ze("xlinkHref", 1, !1, "xlink:href", "http://www.w3.org/1999/xlink", !0, !1);
["src", "href", "action", "formAction"].forEach(function(e) {
    je[e] = new Ze(e, 1, !1, e.toLowerCase(), null, !0, !0)
});

function Gu(e, t, n, r) {
    var i = je.hasOwnProperty(t) ? je[t] : null;
    (i !== null ? i.type !== 0 : r || !(2 < t.length) || t[0] !== "o" && t[0] !== "O" || t[1] !== "n" && t[1] !== "N") && ($2(t, n, i, r) && (n = null), r || i === null ? _2(t) && (n === null ? e.removeAttribute(t) : e.setAttribute(t, "" + n)) : i.mustUseProperty ? e[i.propertyName] = n === null ? i.type === 3 ? !1 : "" : n : (t = i.attributeName, r = i.attributeNamespace, n === null ? e.removeAttribute(t) : (i = i.type, n = i === 3 || i === 4 && n === !0 ? "" : "" + n, r ? e.setAttributeNS(r, t, n) : e.setAttribute(t, n))))
}
var Gt = v1.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED,
    ro = Symbol.for("react.element"),
    er = Symbol.for("react.portal"),
    tr = Symbol.for("react.fragment"),
    Zu = Symbol.for("react.strict_mode"),
    El = Symbol.for("react.profiler"),
    C1 = Symbol.for("react.provider"),
    w1 = Symbol.for("react.context"),
    Yu = Symbol.for("react.forward_ref"),
    Tl = Symbol.for("react.suspense"),
    Rl = Symbol.for("react.suspense_list"),
    Xu = Symbol.for("react.memo"),
    Jt = Symbol.for("react.lazy"),
    S1 = Symbol.for("react.offscreen"),
    Pf = Symbol.iterator;

function Qr(e) {
    return e === null || typeof e != "object" ? null : (e = Pf && e[Pf] || e["@@iterator"], typeof e == "function" ? e : null)
}
var Se = Object.assign,
    La;

function ti(e) {
    if (La === void 0) try {
        throw Error()
    } catch (n) {
        var t = n.stack.trim().match(/\n( *(at )?)/);
        La = t && t[1] || ""
    }
    return `
` + La + e
}
var ba = !1;

function Da(e, t) {
    if (!e || ba) return "";
    ba = !0;
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
`), s = i.length - 1, a = o.length - 1; 1 <= s && 0 <= a && i[s] !== o[a];) a--;
            for (; 1 <= s && 0 <= a; s--, a--)
                if (i[s] !== o[a]) {
                    if (s !== 1 || a !== 1)
                        do
                            if (s--, a--, 0 > a || i[s] !== o[a]) {
                                var l = `
` + i[s].replace(" at new ", " at ");
                                return e.displayName && l.includes("<anonymous>") && (l = l.replace("<anonymous>", e.displayName)), l
                            } while (1 <= s && 0 <= a);
                    break
                }
        }
    } finally {
        ba = !1, Error.prepareStackTrace = n
    }
    return (e = e ? e.displayName || e.name : "") ? ti(e) : ""
}

function N2(e) {
    switch (e.tag) {
        case 5:
            return ti(e.type);
        case 16:
            return ti("Lazy");
        case 13:
            return ti("Suspense");
        case 19:
            return ti("SuspenseList");
        case 0:
        case 2:
        case 15:
            return e = Da(e.type, !1), e;
        case 11:
            return e = Da(e.type.render, !1), e;
        case 1:
            return e = Da(e.type, !0), e;
        default:
            return ""
    }
}

function Al(e) {
    if (e == null) return null;
    if (typeof e == "function") return e.displayName || e.name || null;
    if (typeof e == "string") return e;
    switch (e) {
        case tr:
            return "Fragment";
        case er:
            return "Portal";
        case El:
            return "Profiler";
        case Zu:
            return "StrictMode";
        case Tl:
            return "Suspense";
        case Rl:
            return "SuspenseList"
    }
    if (typeof e == "object") switch (e.$$typeof) {
        case w1:
            return (e.displayName || "Context") + ".Consumer";
        case C1:
            return (e._context.displayName || "Context") + ".Provider";
        case Yu:
            var t = e.render;
            return e = e.displayName, e || (e = t.displayName || t.name || "", e = e !== "" ? "ForwardRef(" + e + ")" : "ForwardRef"), e;
        case Xu:
            return t = e.displayName || null, t !== null ? t : Al(e.type) || "Memo";
        case Jt:
            t = e._payload, e = e._init;
            try {
                return Al(e(t))
            } catch {}
    }
    return null
}

function j2(e) {
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
            return Al(t);
        case 8:
            return t === Zu ? "StrictMode" : "Mode";
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

function Cn(e) {
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

function x1(e) {
    var t = e.type;
    return (e = e.nodeName) && e.toLowerCase() === "input" && (t === "checkbox" || t === "radio")
}

function z2(e) {
    var t = x1(e) ? "checked" : "value",
        n = Object.getOwnPropertyDescriptor(e.constructor.prototype, t),
        r = "" + e[t];
    if (!e.hasOwnProperty(t) && typeof n < "u" && typeof n.get == "function" && typeof n.set == "function") {
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

function io(e) {
    e._valueTracker || (e._valueTracker = z2(e))
}

function P1(e) {
    if (!e) return !1;
    var t = e._valueTracker;
    if (!t) return !0;
    var n = t.getValue(),
        r = "";
    return e && (r = x1(e) ? e.checked ? "true" : "false" : e.value), e = r, e !== n ? (t.setValue(e), !0) : !1
}

function qo(e) {
    if (e = e || (typeof document < "u" ? document : void 0), typeof e > "u") return null;
    try {
        return e.activeElement || e.body
    } catch {
        return e.body
    }
}

function Ml(e, t) {
    var n = t.checked;
    return Se({}, t, {
        defaultChecked: void 0,
        defaultValue: void 0,
        value: void 0,
        checked: n ?? e._wrapperState.initialChecked
    })
}

function kf(e, t) {
    var n = t.defaultValue == null ? "" : t.defaultValue,
        r = t.checked != null ? t.checked : t.defaultChecked;
    n = Cn(t.value != null ? t.value : n), e._wrapperState = {
        initialChecked: r,
        initialValue: n,
        controlled: t.type === "checkbox" || t.type === "radio" ? t.checked != null : t.value != null
    }
}

function k1(e, t) {
    t = t.checked, t != null && Gu(e, "checked", t, !1)
}

function Ol(e, t) {
    k1(e, t);
    var n = Cn(t.value),
        r = t.type;
    if (n != null) r === "number" ? (n === 0 && e.value === "" || e.value != n) && (e.value = "" + n) : e.value !== "" + n && (e.value = "" + n);
    else if (r === "submit" || r === "reset") {
        e.removeAttribute("value");
        return
    }
    t.hasOwnProperty("value") ? Fl(e, t.type, n) : t.hasOwnProperty("defaultValue") && Fl(e, t.type, Cn(t.defaultValue)), t.checked == null && t.defaultChecked != null && (e.defaultChecked = !!t.defaultChecked)
}

function Ef(e, t, n) {
    if (t.hasOwnProperty("value") || t.hasOwnProperty("defaultValue")) {
        var r = t.type;
        if (!(r !== "submit" && r !== "reset" || t.value !== void 0 && t.value !== null)) return;
        t = "" + e._wrapperState.initialValue, n || t === e.value || (e.value = t), e.defaultValue = t
    }
    n = e.name, n !== "" && (e.name = ""), e.defaultChecked = !!e._wrapperState.initialChecked, n !== "" && (e.name = n)
}

function Fl(e, t, n) {
    (t !== "number" || qo(e.ownerDocument) !== e) && (n == null ? e.defaultValue = "" + e._wrapperState.initialValue : e.defaultValue !== "" + n && (e.defaultValue = "" + n))
}
var ni = Array.isArray;

function gr(e, t, n, r) {
    if (e = e.options, t) {
        t = {};
        for (var i = 0; i < n.length; i++) t["$" + n[i]] = !0;
        for (n = 0; n < e.length; n++) i = t.hasOwnProperty("$" + e[n].value), e[n].selected !== i && (e[n].selected = i), i && r && (e[n].defaultSelected = !0)
    } else {
        for (n = "" + Cn(n), t = null, i = 0; i < e.length; i++) {
            if (e[i].value === n) {
                e[i].selected = !0, r && (e[i].defaultSelected = !0);
                return
            }
            t !== null || e[i].disabled || (t = e[i])
        }
        t !== null && (t.selected = !0)
    }
}

function Ll(e, t) {
    if (t.dangerouslySetInnerHTML != null) throw Error(R(91));
    return Se({}, t, {
        value: void 0,
        defaultValue: void 0,
        children: "" + e._wrapperState.initialValue
    })
}

function Tf(e, t) {
    var n = t.value;
    if (n == null) {
        if (n = t.children, t = t.defaultValue, n != null) {
            if (t != null) throw Error(R(92));
            if (ni(n)) {
                if (1 < n.length) throw Error(R(93));
                n = n[0]
            }
            t = n
        }
        t == null && (t = ""), n = t
    }
    e._wrapperState = {
        initialValue: Cn(n)
    }
}

function E1(e, t) {
    var n = Cn(t.value),
        r = Cn(t.defaultValue);
    n != null && (n = "" + n, n !== e.value && (e.value = n), t.defaultValue == null && e.defaultValue !== n && (e.defaultValue = n)), r != null && (e.defaultValue = "" + r)
}

function Rf(e) {
    var t = e.textContent;
    t === e._wrapperState.initialValue && t !== "" && t !== null && (e.value = t)
}

function T1(e) {
    switch (e) {
        case "svg":
            return "http://www.w3.org/2000/svg";
        case "math":
            return "http://www.w3.org/1998/Math/MathML";
        default:
            return "http://www.w3.org/1999/xhtml"
    }
}

function bl(e, t) {
    return e == null || e === "http://www.w3.org/1999/xhtml" ? T1(t) : e === "http://www.w3.org/2000/svg" && t === "foreignObject" ? "http://www.w3.org/1999/xhtml" : e
}
var oo, R1 = function(e) {
    return typeof MSApp < "u" && MSApp.execUnsafeLocalFunction ? function(t, n, r, i) {
        MSApp.execUnsafeLocalFunction(function() {
            return e(t, n, r, i)
        })
    } : e
}(function(e, t) {
    if (e.namespaceURI !== "http://www.w3.org/2000/svg" || "innerHTML" in e) e.innerHTML = t;
    else {
        for (oo = oo || document.createElement("div"), oo.innerHTML = "<svg>" + t.valueOf().toString() + "</svg>", t = oo.firstChild; e.firstChild;) e.removeChild(e.firstChild);
        for (; t.firstChild;) e.appendChild(t.firstChild)
    }
});

function xi(e, t) {
    if (t) {
        var n = e.firstChild;
        if (n && n === e.lastChild && n.nodeType === 3) {
            n.nodeValue = t;
            return
        }
    }
    e.textContent = t
}
var si = {
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
    B2 = ["Webkit", "ms", "Moz", "O"];
Object.keys(si).forEach(function(e) {
    B2.forEach(function(t) {
        t = t + e.charAt(0).toUpperCase() + e.substring(1), si[t] = si[e]
    })
});

function A1(e, t, n) {
    return t == null || typeof t == "boolean" || t === "" ? "" : n || typeof t != "number" || t === 0 || si.hasOwnProperty(e) && si[e] ? ("" + t).trim() : t + "px"
}

function M1(e, t) {
    e = e.style;
    for (var n in t)
        if (t.hasOwnProperty(n)) {
            var r = n.indexOf("--") === 0,
                i = A1(n, t[n], r);
            n === "float" && (n = "cssFloat"), r ? e.setProperty(n, i) : e[n] = i
        }
}
var U2 = Se({
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

function Dl(e, t) {
    if (t) {
        if (U2[e] && (t.children != null || t.dangerouslySetInnerHTML != null)) throw Error(R(137, e));
        if (t.dangerouslySetInnerHTML != null) {
            if (t.children != null) throw Error(R(60));
            if (typeof t.dangerouslySetInnerHTML != "object" || !("__html" in t.dangerouslySetInnerHTML)) throw Error(R(61))
        }
        if (t.style != null && typeof t.style != "object") throw Error(R(62))
    }
}

function Vl(e, t) {
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
var _l = null;

function Ju(e) {
    return e = e.target || e.srcElement || window, e.correspondingUseElement && (e = e.correspondingUseElement), e.nodeType === 3 ? e.parentNode : e
}
var Il = null,
    Cr = null,
    wr = null;

function Af(e) {
    if (e = Wi(e)) {
        if (typeof Il != "function") throw Error(R(280));
        var t = e.stateNode;
        t && (t = js(t), Il(e.stateNode, e.type, t))
    }
}

function O1(e) {
    Cr ? wr ? wr.push(e) : wr = [e] : Cr = e
}

function F1() {
    if (Cr) {
        var e = Cr,
            t = wr;
        if (wr = Cr = null, Af(e), t)
            for (e = 0; e < t.length; e++) Af(t[e])
    }
}

function L1(e, t) {
    return e(t)
}

function b1() {}
var Va = !1;

function D1(e, t, n) {
    if (Va) return e(t, n);
    Va = !0;
    try {
        return L1(e, t, n)
    } finally {
        Va = !1, (Cr !== null || wr !== null) && (b1(), F1())
    }
}

function Pi(e, t) {
    var n = e.stateNode;
    if (n === null) return null;
    var r = js(n);
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
    if (n && typeof n != "function") throw Error(R(231, t, typeof n));
    return n
}
var $l = !1;
if (Qt) try {
    var Hr = {};
    Object.defineProperty(Hr, "passive", {
        get: function() {
            $l = !0
        }
    }), window.addEventListener("test", Hr, Hr), window.removeEventListener("test", Hr, Hr)
} catch {
    $l = !1
}

function Q2(e, t, n, r, i, o, s, a, l) {
    var u = Array.prototype.slice.call(arguments, 3);
    try {
        t.apply(n, u)
    } catch (c) {
        this.onError(c)
    }
}
var ai = !1,
    Go = null,
    Zo = !1,
    Nl = null,
    H2 = {
        onError: function(e) {
            ai = !0, Go = e
        }
    };

function W2(e, t, n, r, i, o, s, a, l) {
    ai = !1, Go = null, Q2.apply(H2, arguments)
}

function K2(e, t, n, r, i, o, s, a, l) {
    if (W2.apply(this, arguments), ai) {
        if (ai) {
            var u = Go;
            ai = !1, Go = null
        } else throw Error(R(198));
        Zo || (Zo = !0, Nl = u)
    }
}

function Kn(e) {
    var t = e,
        n = e;
    if (e.alternate)
        for (; t.return;) t = t.return;
    else {
        e = t;
        do t = e, t.flags & 4098 && (n = t.return), e = t.return; while (e)
    }
    return t.tag === 3 ? n : null
}

function V1(e) {
    if (e.tag === 13) {
        var t = e.memoizedState;
        if (t === null && (e = e.alternate, e !== null && (t = e.memoizedState)), t !== null) return t.dehydrated
    }
    return null
}

function Mf(e) {
    if (Kn(e) !== e) throw Error(R(188))
}

function q2(e) {
    var t = e.alternate;
    if (!t) {
        if (t = Kn(e), t === null) throw Error(R(188));
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
                if (o === n) return Mf(i), e;
                if (o === r) return Mf(i), t;
                o = o.sibling
            }
            throw Error(R(188))
        }
        if (n.return !== r.return) n = i, r = o;
        else {
            for (var s = !1, a = i.child; a;) {
                if (a === n) {
                    s = !0, n = i, r = o;
                    break
                }
                if (a === r) {
                    s = !0, r = i, n = o;
                    break
                }
                a = a.sibling
            }
            if (!s) {
                for (a = o.child; a;) {
                    if (a === n) {
                        s = !0, n = o, r = i;
                        break
                    }
                    if (a === r) {
                        s = !0, r = o, n = i;
                        break
                    }
                    a = a.sibling
                }
                if (!s) throw Error(R(189))
            }
        }
        if (n.alternate !== r) throw Error(R(190))
    }
    if (n.tag !== 3) throw Error(R(188));
    return n.stateNode.current === n ? e : t
}

function _1(e) {
    return e = q2(e), e !== null ? I1(e) : null
}

function I1(e) {
    if (e.tag === 5 || e.tag === 6) return e;
    for (e = e.child; e !== null;) {
        var t = I1(e);
        if (t !== null) return t;
        e = e.sibling
    }
    return null
}
var $1 = at.unstable_scheduleCallback,
    Of = at.unstable_cancelCallback,
    G2 = at.unstable_shouldYield,
    Z2 = at.unstable_requestPaint,
    Ee = at.unstable_now,
    Y2 = at.unstable_getCurrentPriorityLevel,
    ec = at.unstable_ImmediatePriority,
    N1 = at.unstable_UserBlockingPriority,
    Yo = at.unstable_NormalPriority,
    X2 = at.unstable_LowPriority,
    j1 = at.unstable_IdlePriority,
    _s = null,
    bt = null;

function J2(e) {
    if (bt && typeof bt.onCommitFiberRoot == "function") try {
        bt.onCommitFiberRoot(_s, e, void 0, (e.current.flags & 128) === 128)
    } catch {}
}
var Tt = Math.clz32 ? Math.clz32 : n3,
    e3 = Math.log,
    t3 = Math.LN2;

function n3(e) {
    return e >>>= 0, e === 0 ? 32 : 31 - (e3(e) / t3 | 0) | 0
}
var so = 64,
    ao = 4194304;

function ri(e) {
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

function Xo(e, t) {
    var n = e.pendingLanes;
    if (n === 0) return 0;
    var r = 0,
        i = e.suspendedLanes,
        o = e.pingedLanes,
        s = n & 268435455;
    if (s !== 0) {
        var a = s & ~i;
        a !== 0 ? r = ri(a) : (o &= s, o !== 0 && (r = ri(o)))
    } else s = n & ~i, s !== 0 ? r = ri(s) : o !== 0 && (r = ri(o));
    if (r === 0) return 0;
    if (t !== 0 && t !== r && !(t & i) && (i = r & -r, o = t & -t, i >= o || i === 16 && (o & 4194240) !== 0)) return t;
    if (r & 4 && (r |= n & 16), t = e.entangledLanes, t !== 0)
        for (e = e.entanglements, t &= r; 0 < t;) n = 31 - Tt(t), i = 1 << n, r |= e[n], t &= ~i;
    return r
}

function r3(e, t) {
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

function i3(e, t) {
    for (var n = e.suspendedLanes, r = e.pingedLanes, i = e.expirationTimes, o = e.pendingLanes; 0 < o;) {
        var s = 31 - Tt(o),
            a = 1 << s,
            l = i[s];
        l === -1 ? (!(a & n) || a & r) && (i[s] = r3(a, t)) : l <= t && (e.expiredLanes |= a), o &= ~a
    }
}

function jl(e) {
    return e = e.pendingLanes & -1073741825, e !== 0 ? e : e & 1073741824 ? 1073741824 : 0
}

function z1() {
    var e = so;
    return so <<= 1, !(so & 4194240) && (so = 64), e
}

function _a(e) {
    for (var t = [], n = 0; 31 > n; n++) t.push(e);
    return t
}

function Qi(e, t, n) {
    e.pendingLanes |= t, t !== 536870912 && (e.suspendedLanes = 0, e.pingedLanes = 0), e = e.eventTimes, t = 31 - Tt(t), e[t] = n
}

function o3(e, t) {
    var n = e.pendingLanes & ~t;
    e.pendingLanes = t, e.suspendedLanes = 0, e.pingedLanes = 0, e.expiredLanes &= t, e.mutableReadLanes &= t, e.entangledLanes &= t, t = e.entanglements;
    var r = e.eventTimes;
    for (e = e.expirationTimes; 0 < n;) {
        var i = 31 - Tt(n),
            o = 1 << i;
        t[i] = 0, r[i] = -1, e[i] = -1, n &= ~o
    }
}

function tc(e, t) {
    var n = e.entangledLanes |= t;
    for (e = e.entanglements; n;) {
        var r = 31 - Tt(n),
            i = 1 << r;
        i & t | e[r] & t && (e[r] |= t), n &= ~i
    }
}
var se = 0;

function B1(e) {
    return e &= -e, 1 < e ? 4 < e ? e & 268435455 ? 16 : 536870912 : 4 : 1
}
var U1, nc, Q1, H1, W1, zl = !1,
    lo = [],
    ln = null,
    un = null,
    cn = null,
    ki = new Map,
    Ei = new Map,
    rn = [],
    s3 = "mousedown mouseup touchcancel touchend touchstart auxclick dblclick pointercancel pointerdown pointerup dragend dragstart drop compositionend compositionstart keydown keypress keyup input textInput copy cut paste click change contextmenu reset submit".split(" ");

function Ff(e, t) {
    switch (e) {
        case "focusin":
        case "focusout":
            ln = null;
            break;
        case "dragenter":
        case "dragleave":
            un = null;
            break;
        case "mouseover":
        case "mouseout":
            cn = null;
            break;
        case "pointerover":
        case "pointerout":
            ki.delete(t.pointerId);
            break;
        case "gotpointercapture":
        case "lostpointercapture":
            Ei.delete(t.pointerId)
    }
}

function Wr(e, t, n, r, i, o) {
    return e === null || e.nativeEvent !== o ? (e = {
        blockedOn: t,
        domEventName: n,
        eventSystemFlags: r,
        nativeEvent: o,
        targetContainers: [i]
    }, t !== null && (t = Wi(t), t !== null && nc(t)), e) : (e.eventSystemFlags |= r, t = e.targetContainers, i !== null && t.indexOf(i) === -1 && t.push(i), e)
}

function a3(e, t, n, r, i) {
    switch (t) {
        case "focusin":
            return ln = Wr(ln, e, t, n, r, i), !0;
        case "dragenter":
            return un = Wr(un, e, t, n, r, i), !0;
        case "mouseover":
            return cn = Wr(cn, e, t, n, r, i), !0;
        case "pointerover":
            var o = i.pointerId;
            return ki.set(o, Wr(ki.get(o) || null, e, t, n, r, i)), !0;
        case "gotpointercapture":
            return o = i.pointerId, Ei.set(o, Wr(Ei.get(o) || null, e, t, n, r, i)), !0
    }
    return !1
}

function K1(e) {
    var t = Ln(e.target);
    if (t !== null) {
        var n = Kn(t);
        if (n !== null) {
            if (t = n.tag, t === 13) {
                if (t = V1(n), t !== null) {
                    e.blockedOn = t, W1(e.priority, function() {
                        Q1(n)
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

function Oo(e) {
    if (e.blockedOn !== null) return !1;
    for (var t = e.targetContainers; 0 < t.length;) {
        var n = Bl(e.domEventName, e.eventSystemFlags, t[0], e.nativeEvent);
        if (n === null) {
            n = e.nativeEvent;
            var r = new n.constructor(n.type, n);
            _l = r, n.target.dispatchEvent(r), _l = null
        } else return t = Wi(n), t !== null && nc(t), e.blockedOn = n, !1;
        t.shift()
    }
    return !0
}

function Lf(e, t, n) {
    Oo(e) && n.delete(t)
}

function l3() {
    zl = !1, ln !== null && Oo(ln) && (ln = null), un !== null && Oo(un) && (un = null), cn !== null && Oo(cn) && (cn = null), ki.forEach(Lf), Ei.forEach(Lf)
}

function Kr(e, t) {
    e.blockedOn === t && (e.blockedOn = null, zl || (zl = !0, at.unstable_scheduleCallback(at.unstable_NormalPriority, l3)))
}

function Ti(e) {
    function t(i) {
        return Kr(i, e)
    }
    if (0 < lo.length) {
        Kr(lo[0], e);
        for (var n = 1; n < lo.length; n++) {
            var r = lo[n];
            r.blockedOn === e && (r.blockedOn = null)
        }
    }
    for (ln !== null && Kr(ln, e), un !== null && Kr(un, e), cn !== null && Kr(cn, e), ki.forEach(t), Ei.forEach(t), n = 0; n < rn.length; n++) r = rn[n], r.blockedOn === e && (r.blockedOn = null);
    for (; 0 < rn.length && (n = rn[0], n.blockedOn === null);) K1(n), n.blockedOn === null && rn.shift()
}
var Sr = Gt.ReactCurrentBatchConfig,
    Jo = !0;

function u3(e, t, n, r) {
    var i = se,
        o = Sr.transition;
    Sr.transition = null;
    try {
        se = 1, rc(e, t, n, r)
    } finally {
        se = i, Sr.transition = o
    }
}

function c3(e, t, n, r) {
    var i = se,
        o = Sr.transition;
    Sr.transition = null;
    try {
        se = 4, rc(e, t, n, r)
    } finally {
        se = i, Sr.transition = o
    }
}

function rc(e, t, n, r) {
    if (Jo) {
        var i = Bl(e, t, n, r);
        if (i === null) Wa(e, t, r, es, n), Ff(e, r);
        else if (a3(i, e, t, n, r)) r.stopPropagation();
        else if (Ff(e, r), t & 4 && -1 < s3.indexOf(e)) {
            for (; i !== null;) {
                var o = Wi(i);
                if (o !== null && U1(o), o = Bl(e, t, n, r), o === null && Wa(e, t, r, es, n), o === i) break;
                i = o
            }
            i !== null && r.stopPropagation()
        } else Wa(e, t, r, null, n)
    }
}
var es = null;

function Bl(e, t, n, r) {
    if (es = null, e = Ju(r), e = Ln(e), e !== null)
        if (t = Kn(e), t === null) e = null;
        else if (n = t.tag, n === 13) {
        if (e = V1(t), e !== null) return e;
        e = null
    } else if (n === 3) {
        if (t.stateNode.current.memoizedState.isDehydrated) return t.tag === 3 ? t.stateNode.containerInfo : null;
        e = null
    } else t !== e && (e = null);
    return es = e, null
}

function q1(e) {
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
            switch (Y2()) {
                case ec:
                    return 1;
                case N1:
                    return 4;
                case Yo:
                case X2:
                    return 16;
                case j1:
                    return 536870912;
                default:
                    return 16
            }
        default:
            return 16
    }
}
var sn = null,
    ic = null,
    Fo = null;

function G1() {
    if (Fo) return Fo;
    var e, t = ic,
        n = t.length,
        r, i = "value" in sn ? sn.value : sn.textContent,
        o = i.length;
    for (e = 0; e < n && t[e] === i[e]; e++);
    var s = n - e;
    for (r = 1; r <= s && t[n - r] === i[o - r]; r++);
    return Fo = i.slice(e, 1 < r ? 1 - r : void 0)
}

function Lo(e) {
    var t = e.keyCode;
    return "charCode" in e ? (e = e.charCode, e === 0 && t === 13 && (e = 13)) : e = t, e === 10 && (e = 13), 32 <= e || e === 13 ? e : 0
}

function uo() {
    return !0
}

function bf() {
    return !1
}

function ct(e) {
    function t(n, r, i, o, s) {
        this._reactName = n, this._targetInst = i, this.type = r, this.nativeEvent = o, this.target = s, this.currentTarget = null;
        for (var a in e) e.hasOwnProperty(a) && (n = e[a], this[a] = n ? n(o) : o[a]);
        return this.isDefaultPrevented = (o.defaultPrevented != null ? o.defaultPrevented : o.returnValue === !1) ? uo : bf, this.isPropagationStopped = bf, this
    }
    return Se(t.prototype, {
        preventDefault: function() {
            this.defaultPrevented = !0;
            var n = this.nativeEvent;
            n && (n.preventDefault ? n.preventDefault() : typeof n.returnValue != "unknown" && (n.returnValue = !1), this.isDefaultPrevented = uo)
        },
        stopPropagation: function() {
            var n = this.nativeEvent;
            n && (n.stopPropagation ? n.stopPropagation() : typeof n.cancelBubble != "unknown" && (n.cancelBubble = !0), this.isPropagationStopped = uo)
        },
        persist: function() {},
        isPersistent: uo
    }), t
}
var Nr = {
        eventPhase: 0,
        bubbles: 0,
        cancelable: 0,
        timeStamp: function(e) {
            return e.timeStamp || Date.now()
        },
        defaultPrevented: 0,
        isTrusted: 0
    },
    oc = ct(Nr),
    Hi = Se({}, Nr, {
        view: 0,
        detail: 0
    }),
    f3 = ct(Hi),
    Ia, $a, qr, Is = Se({}, Hi, {
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
        getModifierState: sc,
        button: 0,
        buttons: 0,
        relatedTarget: function(e) {
            return e.relatedTarget === void 0 ? e.fromElement === e.srcElement ? e.toElement : e.fromElement : e.relatedTarget
        },
        movementX: function(e) {
            return "movementX" in e ? e.movementX : (e !== qr && (qr && e.type === "mousemove" ? (Ia = e.screenX - qr.screenX, $a = e.screenY - qr.screenY) : $a = Ia = 0, qr = e), Ia)
        },
        movementY: function(e) {
            return "movementY" in e ? e.movementY : $a
        }
    }),
    Df = ct(Is),
    d3 = Se({}, Is, {
        dataTransfer: 0
    }),
    h3 = ct(d3),
    p3 = Se({}, Hi, {
        relatedTarget: 0
    }),
    Na = ct(p3),
    m3 = Se({}, Nr, {
        animationName: 0,
        elapsedTime: 0,
        pseudoElement: 0
    }),
    y3 = ct(m3),
    v3 = Se({}, Nr, {
        clipboardData: function(e) {
            return "clipboardData" in e ? e.clipboardData : window.clipboardData
        }
    }),
    g3 = ct(v3),
    C3 = Se({}, Nr, {
        data: 0
    }),
    Vf = ct(C3),
    w3 = {
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
    S3 = {
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
    x3 = {
        Alt: "altKey",
        Control: "ctrlKey",
        Meta: "metaKey",
        Shift: "shiftKey"
    };

function P3(e) {
    var t = this.nativeEvent;
    return t.getModifierState ? t.getModifierState(e) : (e = x3[e]) ? !!t[e] : !1
}

function sc() {
    return P3
}
var k3 = Se({}, Hi, {
        key: function(e) {
            if (e.key) {
                var t = w3[e.key] || e.key;
                if (t !== "Unidentified") return t
            }
            return e.type === "keypress" ? (e = Lo(e), e === 13 ? "Enter" : String.fromCharCode(e)) : e.type === "keydown" || e.type === "keyup" ? S3[e.keyCode] || "Unidentified" : ""
        },
        code: 0,
        location: 0,
        ctrlKey: 0,
        shiftKey: 0,
        altKey: 0,
        metaKey: 0,
        repeat: 0,
        locale: 0,
        getModifierState: sc,
        charCode: function(e) {
            return e.type === "keypress" ? Lo(e) : 0
        },
        keyCode: function(e) {
            return e.type === "keydown" || e.type === "keyup" ? e.keyCode : 0
        },
        which: function(e) {
            return e.type === "keypress" ? Lo(e) : e.type === "keydown" || e.type === "keyup" ? e.keyCode : 0
        }
    }),
    E3 = ct(k3),
    T3 = Se({}, Is, {
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
    _f = ct(T3),
    R3 = Se({}, Hi, {
        touches: 0,
        targetTouches: 0,
        changedTouches: 0,
        altKey: 0,
        metaKey: 0,
        ctrlKey: 0,
        shiftKey: 0,
        getModifierState: sc
    }),
    A3 = ct(R3),
    M3 = Se({}, Nr, {
        propertyName: 0,
        elapsedTime: 0,
        pseudoElement: 0
    }),
    O3 = ct(M3),
    F3 = Se({}, Is, {
        deltaX: function(e) {
            return "deltaX" in e ? e.deltaX : "wheelDeltaX" in e ? -e.wheelDeltaX : 0
        },
        deltaY: function(e) {
            return "deltaY" in e ? e.deltaY : "wheelDeltaY" in e ? -e.wheelDeltaY : "wheelDelta" in e ? -e.wheelDelta : 0
        },
        deltaZ: 0,
        deltaMode: 0
    }),
    L3 = ct(F3),
    b3 = [9, 13, 27, 32],
    ac = Qt && "CompositionEvent" in window,
    li = null;
Qt && "documentMode" in document && (li = document.documentMode);
var D3 = Qt && "TextEvent" in window && !li,
    Z1 = Qt && (!ac || li && 8 < li && 11 >= li),
    If = String.fromCharCode(32),
    $f = !1;

function Y1(e, t) {
    switch (e) {
        case "keyup":
            return b3.indexOf(t.keyCode) !== -1;
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

function X1(e) {
    return e = e.detail, typeof e == "object" && "data" in e ? e.data : null
}
var nr = !1;

function V3(e, t) {
    switch (e) {
        case "compositionend":
            return X1(t);
        case "keypress":
            return t.which !== 32 ? null : ($f = !0, If);
        case "textInput":
            return e = t.data, e === If && $f ? null : e;
        default:
            return null
    }
}

function _3(e, t) {
    if (nr) return e === "compositionend" || !ac && Y1(e, t) ? (e = G1(), Fo = ic = sn = null, nr = !1, e) : null;
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
            return Z1 && t.locale !== "ko" ? null : t.data;
        default:
            return null
    }
}
var I3 = {
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

function Nf(e) {
    var t = e && e.nodeName && e.nodeName.toLowerCase();
    return t === "input" ? !!I3[e.type] : t === "textarea"
}

function J1(e, t, n, r) {
    O1(r), t = ts(t, "onChange"), 0 < t.length && (n = new oc("onChange", "change", null, n, r), e.push({
        event: n,
        listeners: t
    }))
}
var ui = null,
    Ri = null;

function $3(e) {
    cp(e, 0)
}

function $s(e) {
    var t = or(e);
    if (P1(t)) return e
}

function N3(e, t) {
    if (e === "change") return t
}
var ep = !1;
if (Qt) {
    var ja;
    if (Qt) {
        var za = "oninput" in document;
        if (!za) {
            var jf = document.createElement("div");
            jf.setAttribute("oninput", "return;"), za = typeof jf.oninput == "function"
        }
        ja = za
    } else ja = !1;
    ep = ja && (!document.documentMode || 9 < document.documentMode)
}

function zf() {
    ui && (ui.detachEvent("onpropertychange", tp), Ri = ui = null)
}

function tp(e) {
    if (e.propertyName === "value" && $s(Ri)) {
        var t = [];
        J1(t, Ri, e, Ju(e)), D1($3, t)
    }
}

function j3(e, t, n) {
    e === "focusin" ? (zf(), ui = t, Ri = n, ui.attachEvent("onpropertychange", tp)) : e === "focusout" && zf()
}

function z3(e) {
    if (e === "selectionchange" || e === "keyup" || e === "keydown") return $s(Ri)
}

function B3(e, t) {
    if (e === "click") return $s(t)
}

function U3(e, t) {
    if (e === "input" || e === "change") return $s(t)
}

function Q3(e, t) {
    return e === t && (e !== 0 || 1 / e === 1 / t) || e !== e && t !== t
}
var At = typeof Object.is == "function" ? Object.is : Q3;

function Ai(e, t) {
    if (At(e, t)) return !0;
    if (typeof e != "object" || e === null || typeof t != "object" || t === null) return !1;
    var n = Object.keys(e),
        r = Object.keys(t);
    if (n.length !== r.length) return !1;
    for (r = 0; r < n.length; r++) {
        var i = n[r];
        if (!kl.call(t, i) || !At(e[i], t[i])) return !1
    }
    return !0
}

function Bf(e) {
    for (; e && e.firstChild;) e = e.firstChild;
    return e
}

function Uf(e, t) {
    var n = Bf(e);
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
        n = Bf(n)
    }
}

function np(e, t) {
    return e && t ? e === t ? !0 : e && e.nodeType === 3 ? !1 : t && t.nodeType === 3 ? np(e, t.parentNode) : "contains" in e ? e.contains(t) : e.compareDocumentPosition ? !!(e.compareDocumentPosition(t) & 16) : !1 : !1
}

function rp() {
    for (var e = window, t = qo(); t instanceof e.HTMLIFrameElement;) {
        try {
            var n = typeof t.contentWindow.location.href == "string"
        } catch {
            n = !1
        }
        if (n) e = t.contentWindow;
        else break;
        t = qo(e.document)
    }
    return t
}

function lc(e) {
    var t = e && e.nodeName && e.nodeName.toLowerCase();
    return t && (t === "input" && (e.type === "text" || e.type === "search" || e.type === "tel" || e.type === "url" || e.type === "password") || t === "textarea" || e.contentEditable === "true")
}

function H3(e) {
    var t = rp(),
        n = e.focusedElem,
        r = e.selectionRange;
    if (t !== n && n && n.ownerDocument && np(n.ownerDocument.documentElement, n)) {
        if (r !== null && lc(n)) {
            if (t = r.start, e = r.end, e === void 0 && (e = t), "selectionStart" in n) n.selectionStart = t, n.selectionEnd = Math.min(e, n.value.length);
            else if (e = (t = n.ownerDocument || document) && t.defaultView || window, e.getSelection) {
                e = e.getSelection();
                var i = n.textContent.length,
                    o = Math.min(r.start, i);
                r = r.end === void 0 ? o : Math.min(r.end, i), !e.extend && o > r && (i = r, r = o, o = i), i = Uf(n, o);
                var s = Uf(n, r);
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
var W3 = Qt && "documentMode" in document && 11 >= document.documentMode,
    rr = null,
    Ul = null,
    ci = null,
    Ql = !1;

function Qf(e, t, n) {
    var r = n.window === n ? n.document : n.nodeType === 9 ? n : n.ownerDocument;
    Ql || rr == null || rr !== qo(r) || (r = rr, "selectionStart" in r && lc(r) ? r = {
        start: r.selectionStart,
        end: r.selectionEnd
    } : (r = (r.ownerDocument && r.ownerDocument.defaultView || window).getSelection(), r = {
        anchorNode: r.anchorNode,
        anchorOffset: r.anchorOffset,
        focusNode: r.focusNode,
        focusOffset: r.focusOffset
    }), ci && Ai(ci, r) || (ci = r, r = ts(Ul, "onSelect"), 0 < r.length && (t = new oc("onSelect", "select", null, t, n), e.push({
        event: t,
        listeners: r
    }), t.target = rr)))
}

function co(e, t) {
    var n = {};
    return n[e.toLowerCase()] = t.toLowerCase(), n["Webkit" + e] = "webkit" + t, n["Moz" + e] = "moz" + t, n
}
var ir = {
        animationend: co("Animation", "AnimationEnd"),
        animationiteration: co("Animation", "AnimationIteration"),
        animationstart: co("Animation", "AnimationStart"),
        transitionend: co("Transition", "TransitionEnd")
    },
    Ba = {},
    ip = {};
Qt && (ip = document.createElement("div").style, "AnimationEvent" in window || (delete ir.animationend.animation, delete ir.animationiteration.animation, delete ir.animationstart.animation), "TransitionEvent" in window || delete ir.transitionend.transition);

function Ns(e) {
    if (Ba[e]) return Ba[e];
    if (!ir[e]) return e;
    var t = ir[e],
        n;
    for (n in t)
        if (t.hasOwnProperty(n) && n in ip) return Ba[e] = t[n];
    return e
}
var op = Ns("animationend"),
    sp = Ns("animationiteration"),
    ap = Ns("animationstart"),
    lp = Ns("transitionend"),
    up = new Map,
    Hf = "abort auxClick cancel canPlay canPlayThrough click close contextMenu copy cut drag dragEnd dragEnter dragExit dragLeave dragOver dragStart drop durationChange emptied encrypted ended error gotPointerCapture input invalid keyDown keyPress keyUp load loadedData loadedMetadata loadStart lostPointerCapture mouseDown mouseMove mouseOut mouseOver mouseUp paste pause play playing pointerCancel pointerDown pointerMove pointerOut pointerOver pointerUp progress rateChange reset resize seeked seeking stalled submit suspend timeUpdate touchCancel touchEnd touchStart volumeChange scroll toggle touchMove waiting wheel".split(" ");

function Pn(e, t) {
    up.set(e, t), Wn(t, [e])
}
for (var Ua = 0; Ua < Hf.length; Ua++) {
    var Qa = Hf[Ua],
        K3 = Qa.toLowerCase(),
        q3 = Qa[0].toUpperCase() + Qa.slice(1);
    Pn(K3, "on" + q3)
}
Pn(op, "onAnimationEnd");
Pn(sp, "onAnimationIteration");
Pn(ap, "onAnimationStart");
Pn("dblclick", "onDoubleClick");
Pn("focusin", "onFocus");
Pn("focusout", "onBlur");
Pn(lp, "onTransitionEnd");
Er("onMouseEnter", ["mouseout", "mouseover"]);
Er("onMouseLeave", ["mouseout", "mouseover"]);
Er("onPointerEnter", ["pointerout", "pointerover"]);
Er("onPointerLeave", ["pointerout", "pointerover"]);
Wn("onChange", "change click focusin focusout input keydown keyup selectionchange".split(" "));
Wn("onSelect", "focusout contextmenu dragend focusin keydown keyup mousedown mouseup selectionchange".split(" "));
Wn("onBeforeInput", ["compositionend", "keypress", "textInput", "paste"]);
Wn("onCompositionEnd", "compositionend focusout keydown keypress keyup mousedown".split(" "));
Wn("onCompositionStart", "compositionstart focusout keydown keypress keyup mousedown".split(" "));
Wn("onCompositionUpdate", "compositionupdate focusout keydown keypress keyup mousedown".split(" "));
var ii = "abort canplay canplaythrough durationchange emptied encrypted ended error loadeddata loadedmetadata loadstart pause play playing progress ratechange resize seeked seeking stalled suspend timeupdate volumechange waiting".split(" "),
    G3 = new Set("cancel close invalid load scroll toggle".split(" ").concat(ii));

function Wf(e, t, n) {
    var r = e.type || "unknown-event";
    e.currentTarget = n, K2(r, t, void 0, e), e.currentTarget = null
}

function cp(e, t) {
    t = (t & 4) !== 0;
    for (var n = 0; n < e.length; n++) {
        var r = e[n],
            i = r.event;
        r = r.listeners;
        e: {
            var o = void 0;
            if (t)
                for (var s = r.length - 1; 0 <= s; s--) {
                    var a = r[s],
                        l = a.instance,
                        u = a.currentTarget;
                    if (a = a.listener, l !== o && i.isPropagationStopped()) break e;
                    Wf(i, a, u), o = l
                } else
                    for (s = 0; s < r.length; s++) {
                        if (a = r[s], l = a.instance, u = a.currentTarget, a = a.listener, l !== o && i.isPropagationStopped()) break e;
                        Wf(i, a, u), o = l
                    }
        }
    }
    if (Zo) throw e = Nl, Zo = !1, Nl = null, e
}

function pe(e, t) {
    var n = t[Gl];
    n === void 0 && (n = t[Gl] = new Set);
    var r = e + "__bubble";
    n.has(r) || (fp(t, e, 2, !1), n.add(r))
}

function Ha(e, t, n) {
    var r = 0;
    t && (r |= 4), fp(n, e, r, t)
}
var fo = "_reactListening" + Math.random().toString(36).slice(2);

function Mi(e) {
    if (!e[fo]) {
        e[fo] = !0, g1.forEach(function(n) {
            n !== "selectionchange" && (G3.has(n) || Ha(n, !1, e), Ha(n, !0, e))
        });
        var t = e.nodeType === 9 ? e : e.ownerDocument;
        t === null || t[fo] || (t[fo] = !0, Ha("selectionchange", !1, t))
    }
}

function fp(e, t, n, r) {
    switch (q1(t)) {
        case 1:
            var i = u3;
            break;
        case 4:
            i = c3;
            break;
        default:
            i = rc
    }
    n = i.bind(null, t, n, e), i = void 0, !$l || t !== "touchstart" && t !== "touchmove" && t !== "wheel" || (i = !0), r ? i !== void 0 ? e.addEventListener(t, n, {
        capture: !0,
        passive: i
    }) : e.addEventListener(t, n, !0) : i !== void 0 ? e.addEventListener(t, n, {
        passive: i
    }) : e.addEventListener(t, n, !1)
}

function Wa(e, t, n, r, i) {
    var o = r;
    if (!(t & 1) && !(t & 2) && r !== null) e: for (;;) {
        if (r === null) return;
        var s = r.tag;
        if (s === 3 || s === 4) {
            var a = r.stateNode.containerInfo;
            if (a === i || a.nodeType === 8 && a.parentNode === i) break;
            if (s === 4)
                for (s = r.return; s !== null;) {
                    var l = s.tag;
                    if ((l === 3 || l === 4) && (l = s.stateNode.containerInfo, l === i || l.nodeType === 8 && l.parentNode === i)) return;
                    s = s.return
                }
            for (; a !== null;) {
                if (s = Ln(a), s === null) return;
                if (l = s.tag, l === 5 || l === 6) {
                    r = o = s;
                    continue e
                }
                a = a.parentNode
            }
        }
        r = r.return
    }
    D1(function() {
        var u = o,
            c = Ju(n),
            f = [];
        e: {
            var d = up.get(e);
            if (d !== void 0) {
                var p = oc,
                    y = e;
                switch (e) {
                    case "keypress":
                        if (Lo(n) === 0) break e;
                    case "keydown":
                    case "keyup":
                        p = E3;
                        break;
                    case "focusin":
                        y = "focus", p = Na;
                        break;
                    case "focusout":
                        y = "blur", p = Na;
                        break;
                    case "beforeblur":
                    case "afterblur":
                        p = Na;
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
                        p = Df;
                        break;
                    case "drag":
                    case "dragend":
                    case "dragenter":
                    case "dragexit":
                    case "dragleave":
                    case "dragover":
                    case "dragstart":
                    case "drop":
                        p = h3;
                        break;
                    case "touchcancel":
                    case "touchend":
                    case "touchmove":
                    case "touchstart":
                        p = A3;
                        break;
                    case op:
                    case sp:
                    case ap:
                        p = y3;
                        break;
                    case lp:
                        p = O3;
                        break;
                    case "scroll":
                        p = f3;
                        break;
                    case "wheel":
                        p = L3;
                        break;
                    case "copy":
                    case "cut":
                    case "paste":
                        p = g3;
                        break;
                    case "gotpointercapture":
                    case "lostpointercapture":
                    case "pointercancel":
                    case "pointerdown":
                    case "pointermove":
                    case "pointerout":
                    case "pointerover":
                    case "pointerup":
                        p = _f
                }
                var g = (t & 4) !== 0,
                    x = !g && e === "scroll",
                    v = g ? d !== null ? d + "Capture" : null : d;
                g = [];
                for (var h = u, m; h !== null;) {
                    m = h;
                    var C = m.stateNode;
                    if (m.tag === 5 && C !== null && (m = C, v !== null && (C = Pi(h, v), C != null && g.push(Oi(h, C, m)))), x) break;
                    h = h.return
                }
                0 < g.length && (d = new p(d, y, null, n, c), f.push({
                    event: d,
                    listeners: g
                }))
            }
        }
        if (!(t & 7)) {
            e: {
                if (d = e === "mouseover" || e === "pointerover", p = e === "mouseout" || e === "pointerout", d && n !== _l && (y = n.relatedTarget || n.fromElement) && (Ln(y) || y[Ht])) break e;
                if ((p || d) && (d = c.window === c ? c : (d = c.ownerDocument) ? d.defaultView || d.parentWindow : window, p ? (y = n.relatedTarget || n.toElement, p = u, y = y ? Ln(y) : null, y !== null && (x = Kn(y), y !== x || y.tag !== 5 && y.tag !== 6) && (y = null)) : (p = null, y = u), p !== y)) {
                    if (g = Df, C = "onMouseLeave", v = "onMouseEnter", h = "mouse", (e === "pointerout" || e === "pointerover") && (g = _f, C = "onPointerLeave", v = "onPointerEnter", h = "pointer"), x = p == null ? d : or(p), m = y == null ? d : or(y), d = new g(C, h + "leave", p, n, c), d.target = x, d.relatedTarget = m, C = null, Ln(c) === u && (g = new g(v, h + "enter", y, n, c), g.target = m, g.relatedTarget = x, C = g), x = C, p && y) t: {
                        for (g = p, v = y, h = 0, m = g; m; m = Yn(m)) h++;
                        for (m = 0, C = v; C; C = Yn(C)) m++;
                        for (; 0 < h - m;) g = Yn(g),
                        h--;
                        for (; 0 < m - h;) v = Yn(v),
                        m--;
                        for (; h--;) {
                            if (g === v || v !== null && g === v.alternate) break t;
                            g = Yn(g), v = Yn(v)
                        }
                        g = null
                    }
                    else g = null;
                    p !== null && Kf(f, d, p, g, !1), y !== null && x !== null && Kf(f, x, y, g, !0)
                }
            }
            e: {
                if (d = u ? or(u) : window, p = d.nodeName && d.nodeName.toLowerCase(), p === "select" || p === "input" && d.type === "file") var S = N3;
                else if (Nf(d))
                    if (ep) S = U3;
                    else {
                        S = z3;
                        var k = j3
                    }
                else(p = d.nodeName) && p.toLowerCase() === "input" && (d.type === "checkbox" || d.type === "radio") && (S = B3);
                if (S && (S = S(e, u))) {
                    J1(f, S, n, c);
                    break e
                }
                k && k(e, d, u),
                e === "focusout" && (k = d._wrapperState) && k.controlled && d.type === "number" && Fl(d, "number", d.value)
            }
            switch (k = u ? or(u) : window, e) {
                case "focusin":
                    (Nf(k) || k.contentEditable === "true") && (rr = k, Ul = u, ci = null);
                    break;
                case "focusout":
                    ci = Ul = rr = null;
                    break;
                case "mousedown":
                    Ql = !0;
                    break;
                case "contextmenu":
                case "mouseup":
                case "dragend":
                    Ql = !1, Qf(f, n, c);
                    break;
                case "selectionchange":
                    if (W3) break;
                case "keydown":
                case "keyup":
                    Qf(f, n, c)
            }
            var T;
            if (ac) e: {
                switch (e) {
                    case "compositionstart":
                        var E = "onCompositionStart";
                        break e;
                    case "compositionend":
                        E = "onCompositionEnd";
                        break e;
                    case "compositionupdate":
                        E = "onCompositionUpdate";
                        break e
                }
                E = void 0
            }
            else nr ? Y1(e, n) && (E = "onCompositionEnd") : e === "keydown" && n.keyCode === 229 && (E = "onCompositionStart");E && (Z1 && n.locale !== "ko" && (nr || E !== "onCompositionStart" ? E === "onCompositionEnd" && nr && (T = G1()) : (sn = c, ic = "value" in sn ? sn.value : sn.textContent, nr = !0)), k = ts(u, E), 0 < k.length && (E = new Vf(E, e, null, n, c), f.push({
                event: E,
                listeners: k
            }), T ? E.data = T : (T = X1(n), T !== null && (E.data = T)))),
            (T = D3 ? V3(e, n) : _3(e, n)) && (u = ts(u, "onBeforeInput"), 0 < u.length && (c = new Vf("onBeforeInput", "beforeinput", null, n, c), f.push({
                event: c,
                listeners: u
            }), c.data = T))
        }
        cp(f, t)
    })
}

function Oi(e, t, n) {
    return {
        instance: e,
        listener: t,
        currentTarget: n
    }
}

function ts(e, t) {
    for (var n = t + "Capture", r = []; e !== null;) {
        var i = e,
            o = i.stateNode;
        i.tag === 5 && o !== null && (i = o, o = Pi(e, n), o != null && r.unshift(Oi(e, o, i)), o = Pi(e, t), o != null && r.push(Oi(e, o, i))), e = e.return
    }
    return r
}

function Yn(e) {
    if (e === null) return null;
    do e = e.return; while (e && e.tag !== 5);
    return e || null
}

function Kf(e, t, n, r, i) {
    for (var o = t._reactName, s = []; n !== null && n !== r;) {
        var a = n,
            l = a.alternate,
            u = a.stateNode;
        if (l !== null && l === r) break;
        a.tag === 5 && u !== null && (a = u, i ? (l = Pi(n, o), l != null && s.unshift(Oi(n, l, a))) : i || (l = Pi(n, o), l != null && s.push(Oi(n, l, a)))), n = n.return
    }
    s.length !== 0 && e.push({
        event: t,
        listeners: s
    })
}
var Z3 = /\r\n?/g,
    Y3 = /\u0000|\uFFFD/g;

function qf(e) {
    return (typeof e == "string" ? e : "" + e).replace(Z3, `
`).replace(Y3, "")
}

function ho(e, t, n) {
    if (t = qf(t), qf(e) !== t && n) throw Error(R(425))
}

function ns() {}
var Hl = null,
    Wl = null;

function Kl(e, t) {
    return e === "textarea" || e === "noscript" || typeof t.children == "string" || typeof t.children == "number" || typeof t.dangerouslySetInnerHTML == "object" && t.dangerouslySetInnerHTML !== null && t.dangerouslySetInnerHTML.__html != null
}
var ql = typeof setTimeout == "function" ? setTimeout : void 0,
    X3 = typeof clearTimeout == "function" ? clearTimeout : void 0,
    Gf = typeof Promise == "function" ? Promise : void 0,
    J3 = typeof queueMicrotask == "function" ? queueMicrotask : typeof Gf < "u" ? function(e) {
        return Gf.resolve(null).then(e).catch(ey)
    } : ql;

function ey(e) {
    setTimeout(function() {
        throw e
    })
}

function Ka(e, t) {
    var n = t,
        r = 0;
    do {
        var i = n.nextSibling;
        if (e.removeChild(n), i && i.nodeType === 8)
            if (n = i.data, n === "/$") {
                if (r === 0) {
                    e.removeChild(i), Ti(t);
                    return
                }
                r--
            } else n !== "$" && n !== "$?" && n !== "$!" || r++;
        n = i
    } while (n);
    Ti(t)
}

function fn(e) {
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

function Zf(e) {
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
var jr = Math.random().toString(36).slice(2),
    Lt = "__reactFiber$" + jr,
    Fi = "__reactProps$" + jr,
    Ht = "__reactContainer$" + jr,
    Gl = "__reactEvents$" + jr,
    ty = "__reactListeners$" + jr,
    ny = "__reactHandles$" + jr;

function Ln(e) {
    var t = e[Lt];
    if (t) return t;
    for (var n = e.parentNode; n;) {
        if (t = n[Ht] || n[Lt]) {
            if (n = t.alternate, t.child !== null || n !== null && n.child !== null)
                for (e = Zf(e); e !== null;) {
                    if (n = e[Lt]) return n;
                    e = Zf(e)
                }
            return t
        }
        e = n, n = e.parentNode
    }
    return null
}

function Wi(e) {
    return e = e[Lt] || e[Ht], !e || e.tag !== 5 && e.tag !== 6 && e.tag !== 13 && e.tag !== 3 ? null : e
}

function or(e) {
    if (e.tag === 5 || e.tag === 6) return e.stateNode;
    throw Error(R(33))
}

function js(e) {
    return e[Fi] || null
}
var Zl = [],
    sr = -1;

function kn(e) {
    return {
        current: e
    }
}

function me(e) {
    0 > sr || (e.current = Zl[sr], Zl[sr] = null, sr--)
}

function de(e, t) {
    sr++, Zl[sr] = e.current, e.current = t
}
var wn = {},
    He = kn(wn),
    et = kn(!1),
    Nn = wn;

function Tr(e, t) {
    var n = e.type.contextTypes;
    if (!n) return wn;
    var r = e.stateNode;
    if (r && r.__reactInternalMemoizedUnmaskedChildContext === t) return r.__reactInternalMemoizedMaskedChildContext;
    var i = {},
        o;
    for (o in n) i[o] = t[o];
    return r && (e = e.stateNode, e.__reactInternalMemoizedUnmaskedChildContext = t, e.__reactInternalMemoizedMaskedChildContext = i), i
}

function tt(e) {
    return e = e.childContextTypes, e != null
}

function rs() {
    me(et), me(He)
}

function Yf(e, t, n) {
    if (He.current !== wn) throw Error(R(168));
    de(He, t), de(et, n)
}

function dp(e, t, n) {
    var r = e.stateNode;
    if (t = t.childContextTypes, typeof r.getChildContext != "function") return n;
    r = r.getChildContext();
    for (var i in r)
        if (!(i in t)) throw Error(R(108, j2(e) || "Unknown", i));
    return Se({}, n, r)
}

function is(e) {
    return e = (e = e.stateNode) && e.__reactInternalMemoizedMergedChildContext || wn, Nn = He.current, de(He, e), de(et, et.current), !0
}

function Xf(e, t, n) {
    var r = e.stateNode;
    if (!r) throw Error(R(169));
    n ? (e = dp(e, t, Nn), r.__reactInternalMemoizedMergedChildContext = e, me(et), me(He), de(He, e)) : me(et), de(et, n)
}
var It = null,
    zs = !1,
    qa = !1;

function hp(e) {
    It === null ? It = [e] : It.push(e)
}

function ry(e) {
    zs = !0, hp(e)
}

function En() {
    if (!qa && It !== null) {
        qa = !0;
        var e = 0,
            t = se;
        try {
            var n = It;
            for (se = 1; e < n.length; e++) {
                var r = n[e];
                do r = r(!0); while (r !== null)
            }
            It = null, zs = !1
        } catch (i) {
            throw It !== null && (It = It.slice(e + 1)), $1(ec, En), i
        } finally {
            se = t, qa = !1
        }
    }
    return null
}
var ar = [],
    lr = 0,
    os = null,
    ss = 0,
    ht = [],
    pt = 0,
    jn = null,
    $t = 1,
    Nt = "";

function An(e, t) {
    ar[lr++] = ss, ar[lr++] = os, os = e, ss = t
}

function pp(e, t, n) {
    ht[pt++] = $t, ht[pt++] = Nt, ht[pt++] = jn, jn = e;
    var r = $t;
    e = Nt;
    var i = 32 - Tt(r) - 1;
    r &= ~(1 << i), n += 1;
    var o = 32 - Tt(t) + i;
    if (30 < o) {
        var s = i - i % 5;
        o = (r & (1 << s) - 1).toString(32), r >>= s, i -= s, $t = 1 << 32 - Tt(t) + i | n << i | r, Nt = o + e
    } else $t = 1 << o | n << i | r, Nt = e
}

function uc(e) {
    e.return !== null && (An(e, 1), pp(e, 1, 0))
}

function cc(e) {
    for (; e === os;) os = ar[--lr], ar[lr] = null, ss = ar[--lr], ar[lr] = null;
    for (; e === jn;) jn = ht[--pt], ht[pt] = null, Nt = ht[--pt], ht[pt] = null, $t = ht[--pt], ht[pt] = null
}
var st = null,
    ot = null,
    ve = !1,
    kt = null;

function mp(e, t) {
    var n = mt(5, null, null, 0);
    n.elementType = "DELETED", n.stateNode = t, n.return = e, t = e.deletions, t === null ? (e.deletions = [n], e.flags |= 16) : t.push(n)
}

function Jf(e, t) {
    switch (e.tag) {
        case 5:
            var n = e.type;
            return t = t.nodeType !== 1 || n.toLowerCase() !== t.nodeName.toLowerCase() ? null : t, t !== null ? (e.stateNode = t, st = e, ot = fn(t.firstChild), !0) : !1;
        case 6:
            return t = e.pendingProps === "" || t.nodeType !== 3 ? null : t, t !== null ? (e.stateNode = t, st = e, ot = null, !0) : !1;
        case 13:
            return t = t.nodeType !== 8 ? null : t, t !== null ? (n = jn !== null ? {
                id: $t,
                overflow: Nt
            } : null, e.memoizedState = {
                dehydrated: t,
                treeContext: n,
                retryLane: 1073741824
            }, n = mt(18, null, null, 0), n.stateNode = t, n.return = e, e.child = n, st = e, ot = null, !0) : !1;
        default:
            return !1
    }
}

function Yl(e) {
    return (e.mode & 1) !== 0 && (e.flags & 128) === 0
}

function Xl(e) {
    if (ve) {
        var t = ot;
        if (t) {
            var n = t;
            if (!Jf(e, t)) {
                if (Yl(e)) throw Error(R(418));
                t = fn(n.nextSibling);
                var r = st;
                t && Jf(e, t) ? mp(r, n) : (e.flags = e.flags & -4097 | 2, ve = !1, st = e)
            }
        } else {
            if (Yl(e)) throw Error(R(418));
            e.flags = e.flags & -4097 | 2, ve = !1, st = e
        }
    }
}

function ed(e) {
    for (e = e.return; e !== null && e.tag !== 5 && e.tag !== 3 && e.tag !== 13;) e = e.return;
    st = e
}

function po(e) {
    if (e !== st) return !1;
    if (!ve) return ed(e), ve = !0, !1;
    var t;
    if ((t = e.tag !== 3) && !(t = e.tag !== 5) && (t = e.type, t = t !== "head" && t !== "body" && !Kl(e.type, e.memoizedProps)), t && (t = ot)) {
        if (Yl(e)) throw yp(), Error(R(418));
        for (; t;) mp(e, t), t = fn(t.nextSibling)
    }
    if (ed(e), e.tag === 13) {
        if (e = e.memoizedState, e = e !== null ? e.dehydrated : null, !e) throw Error(R(317));
        e: {
            for (e = e.nextSibling, t = 0; e;) {
                if (e.nodeType === 8) {
                    var n = e.data;
                    if (n === "/$") {
                        if (t === 0) {
                            ot = fn(e.nextSibling);
                            break e
                        }
                        t--
                    } else n !== "$" && n !== "$!" && n !== "$?" || t++
                }
                e = e.nextSibling
            }
            ot = null
        }
    } else ot = st ? fn(e.stateNode.nextSibling) : null;
    return !0
}

function yp() {
    for (var e = ot; e;) e = fn(e.nextSibling)
}

function Rr() {
    ot = st = null, ve = !1
}

function fc(e) {
    kt === null ? kt = [e] : kt.push(e)
}
var iy = Gt.ReactCurrentBatchConfig;

function xt(e, t) {
    if (e && e.defaultProps) {
        t = Se({}, t), e = e.defaultProps;
        for (var n in e) t[n] === void 0 && (t[n] = e[n]);
        return t
    }
    return t
}
var as = kn(null),
    ls = null,
    ur = null,
    dc = null;

function hc() {
    dc = ur = ls = null
}

function pc(e) {
    var t = as.current;
    me(as), e._currentValue = t
}

function Jl(e, t, n) {
    for (; e !== null;) {
        var r = e.alternate;
        if ((e.childLanes & t) !== t ? (e.childLanes |= t, r !== null && (r.childLanes |= t)) : r !== null && (r.childLanes & t) !== t && (r.childLanes |= t), e === n) break;
        e = e.return
    }
}

function xr(e, t) {
    ls = e, dc = ur = null, e = e.dependencies, e !== null && e.firstContext !== null && (e.lanes & t && (Je = !0), e.firstContext = null)
}

function vt(e) {
    var t = e._currentValue;
    if (dc !== e)
        if (e = {
                context: e,
                memoizedValue: t,
                next: null
            }, ur === null) {
            if (ls === null) throw Error(R(308));
            ur = e, ls.dependencies = {
                lanes: 0,
                firstContext: e
            }
        } else ur = ur.next = e;
    return t
}
var bn = null;

function mc(e) {
    bn === null ? bn = [e] : bn.push(e)
}

function vp(e, t, n, r) {
    var i = t.interleaved;
    return i === null ? (n.next = n, mc(t)) : (n.next = i.next, i.next = n), t.interleaved = n, Wt(e, r)
}

function Wt(e, t) {
    e.lanes |= t;
    var n = e.alternate;
    for (n !== null && (n.lanes |= t), n = e, e = e.return; e !== null;) e.childLanes |= t, n = e.alternate, n !== null && (n.childLanes |= t), n = e, e = e.return;
    return n.tag === 3 ? n.stateNode : null
}
var en = !1;

function yc(e) {
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

function gp(e, t) {
    e = e.updateQueue, t.updateQueue === e && (t.updateQueue = {
        baseState: e.baseState,
        firstBaseUpdate: e.firstBaseUpdate,
        lastBaseUpdate: e.lastBaseUpdate,
        shared: e.shared,
        effects: e.effects
    })
}

function zt(e, t) {
    return {
        eventTime: e,
        lane: t,
        tag: 0,
        payload: null,
        callback: null,
        next: null
    }
}

function dn(e, t, n) {
    var r = e.updateQueue;
    if (r === null) return null;
    if (r = r.shared, te & 2) {
        var i = r.pending;
        return i === null ? t.next = t : (t.next = i.next, i.next = t), r.pending = t, Wt(e, n)
    }
    return i = r.interleaved, i === null ? (t.next = t, mc(r)) : (t.next = i.next, i.next = t), r.interleaved = t, Wt(e, n)
}

function bo(e, t, n) {
    if (t = t.updateQueue, t !== null && (t = t.shared, (n & 4194240) !== 0)) {
        var r = t.lanes;
        r &= e.pendingLanes, n |= r, t.lanes = n, tc(e, n)
    }
}

function td(e, t) {
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

function us(e, t, n, r) {
    var i = e.updateQueue;
    en = !1;
    var o = i.firstBaseUpdate,
        s = i.lastBaseUpdate,
        a = i.shared.pending;
    if (a !== null) {
        i.shared.pending = null;
        var l = a,
            u = l.next;
        l.next = null, s === null ? o = u : s.next = u, s = l;
        var c = e.alternate;
        c !== null && (c = c.updateQueue, a = c.lastBaseUpdate, a !== s && (a === null ? c.firstBaseUpdate = u : a.next = u, c.lastBaseUpdate = l))
    }
    if (o !== null) {
        var f = i.baseState;
        s = 0, c = u = l = null, a = o;
        do {
            var d = a.lane,
                p = a.eventTime;
            if ((r & d) === d) {
                c !== null && (c = c.next = {
                    eventTime: p,
                    lane: 0,
                    tag: a.tag,
                    payload: a.payload,
                    callback: a.callback,
                    next: null
                });
                e: {
                    var y = e,
                        g = a;
                    switch (d = t, p = n, g.tag) {
                        case 1:
                            if (y = g.payload, typeof y == "function") {
                                f = y.call(p, f, d);
                                break e
                            }
                            f = y;
                            break e;
                        case 3:
                            y.flags = y.flags & -65537 | 128;
                        case 0:
                            if (y = g.payload, d = typeof y == "function" ? y.call(p, f, d) : y, d == null) break e;
                            f = Se({}, f, d);
                            break e;
                        case 2:
                            en = !0
                    }
                }
                a.callback !== null && a.lane !== 0 && (e.flags |= 64, d = i.effects, d === null ? i.effects = [a] : d.push(a))
            } else p = {
                eventTime: p,
                lane: d,
                tag: a.tag,
                payload: a.payload,
                callback: a.callback,
                next: null
            }, c === null ? (u = c = p, l = f) : c = c.next = p, s |= d;
            if (a = a.next, a === null) {
                if (a = i.shared.pending, a === null) break;
                d = a, a = d.next, d.next = null, i.lastBaseUpdate = d, i.shared.pending = null
            }
        } while (1);
        if (c === null && (l = f), i.baseState = l, i.firstBaseUpdate = u, i.lastBaseUpdate = c, t = i.shared.interleaved, t !== null) {
            i = t;
            do s |= i.lane, i = i.next; while (i !== t)
        } else o === null && (i.shared.lanes = 0);
        Bn |= s, e.lanes = s, e.memoizedState = f
    }
}

function nd(e, t, n) {
    if (e = t.effects, t.effects = null, e !== null)
        for (t = 0; t < e.length; t++) {
            var r = e[t],
                i = r.callback;
            if (i !== null) {
                if (r.callback = null, r = n, typeof i != "function") throw Error(R(191, i));
                i.call(r)
            }
        }
}
var Cp = new v1.Component().refs;

function eu(e, t, n, r) {
    t = e.memoizedState, n = n(r, t), n = n == null ? t : Se({}, t, n), e.memoizedState = n, e.lanes === 0 && (e.updateQueue.baseState = n)
}
var Bs = {
    isMounted: function(e) {
        return (e = e._reactInternals) ? Kn(e) === e : !1
    },
    enqueueSetState: function(e, t, n) {
        e = e._reactInternals;
        var r = qe(),
            i = pn(e),
            o = zt(r, i);
        o.payload = t, n != null && (o.callback = n), t = dn(e, o, i), t !== null && (Rt(t, e, i, r), bo(t, e, i))
    },
    enqueueReplaceState: function(e, t, n) {
        e = e._reactInternals;
        var r = qe(),
            i = pn(e),
            o = zt(r, i);
        o.tag = 1, o.payload = t, n != null && (o.callback = n), t = dn(e, o, i), t !== null && (Rt(t, e, i, r), bo(t, e, i))
    },
    enqueueForceUpdate: function(e, t) {
        e = e._reactInternals;
        var n = qe(),
            r = pn(e),
            i = zt(n, r);
        i.tag = 2, t != null && (i.callback = t), t = dn(e, i, r), t !== null && (Rt(t, e, r, n), bo(t, e, r))
    }
};

function rd(e, t, n, r, i, o, s) {
    return e = e.stateNode, typeof e.shouldComponentUpdate == "function" ? e.shouldComponentUpdate(r, o, s) : t.prototype && t.prototype.isPureReactComponent ? !Ai(n, r) || !Ai(i, o) : !0
}

function wp(e, t, n) {
    var r = !1,
        i = wn,
        o = t.contextType;
    return typeof o == "object" && o !== null ? o = vt(o) : (i = tt(t) ? Nn : He.current, r = t.contextTypes, o = (r = r != null) ? Tr(e, i) : wn), t = new t(n, o), e.memoizedState = t.state !== null && t.state !== void 0 ? t.state : null, t.updater = Bs, e.stateNode = t, t._reactInternals = e, r && (e = e.stateNode, e.__reactInternalMemoizedUnmaskedChildContext = i, e.__reactInternalMemoizedMaskedChildContext = o), t
}

function id(e, t, n, r) {
    e = t.state, typeof t.componentWillReceiveProps == "function" && t.componentWillReceiveProps(n, r), typeof t.UNSAFE_componentWillReceiveProps == "function" && t.UNSAFE_componentWillReceiveProps(n, r), t.state !== e && Bs.enqueueReplaceState(t, t.state, null)
}

function tu(e, t, n, r) {
    var i = e.stateNode;
    i.props = n, i.state = e.memoizedState, i.refs = Cp, yc(e);
    var o = t.contextType;
    typeof o == "object" && o !== null ? i.context = vt(o) : (o = tt(t) ? Nn : He.current, i.context = Tr(e, o)), i.state = e.memoizedState, o = t.getDerivedStateFromProps, typeof o == "function" && (eu(e, t, o, n), i.state = e.memoizedState), typeof t.getDerivedStateFromProps == "function" || typeof i.getSnapshotBeforeUpdate == "function" || typeof i.UNSAFE_componentWillMount != "function" && typeof i.componentWillMount != "function" || (t = i.state, typeof i.componentWillMount == "function" && i.componentWillMount(), typeof i.UNSAFE_componentWillMount == "function" && i.UNSAFE_componentWillMount(), t !== i.state && Bs.enqueueReplaceState(i, i.state, null), us(e, n, i, r), i.state = e.memoizedState), typeof i.componentDidMount == "function" && (e.flags |= 4194308)
}

function Gr(e, t, n) {
    if (e = n.ref, e !== null && typeof e != "function" && typeof e != "object") {
        if (n._owner) {
            if (n = n._owner, n) {
                if (n.tag !== 1) throw Error(R(309));
                var r = n.stateNode
            }
            if (!r) throw Error(R(147, e));
            var i = r,
                o = "" + e;
            return t !== null && t.ref !== null && typeof t.ref == "function" && t.ref._stringRef === o ? t.ref : (t = function(s) {
                var a = i.refs;
                a === Cp && (a = i.refs = {}), s === null ? delete a[o] : a[o] = s
            }, t._stringRef = o, t)
        }
        if (typeof e != "string") throw Error(R(284));
        if (!n._owner) throw Error(R(290, e))
    }
    return e
}

function mo(e, t) {
    throw e = Object.prototype.toString.call(t), Error(R(31, e === "[object Object]" ? "object with keys {" + Object.keys(t).join(", ") + "}" : e))
}

function od(e) {
    var t = e._init;
    return t(e._payload)
}

function Sp(e) {
    function t(v, h) {
        if (e) {
            var m = v.deletions;
            m === null ? (v.deletions = [h], v.flags |= 16) : m.push(h)
        }
    }

    function n(v, h) {
        if (!e) return null;
        for (; h !== null;) t(v, h), h = h.sibling;
        return null
    }

    function r(v, h) {
        for (v = new Map; h !== null;) h.key !== null ? v.set(h.key, h) : v.set(h.index, h), h = h.sibling;
        return v
    }

    function i(v, h) {
        return v = mn(v, h), v.index = 0, v.sibling = null, v
    }

    function o(v, h, m) {
        return v.index = m, e ? (m = v.alternate, m !== null ? (m = m.index, m < h ? (v.flags |= 2, h) : m) : (v.flags |= 2, h)) : (v.flags |= 1048576, h)
    }

    function s(v) {
        return e && v.alternate === null && (v.flags |= 2), v
    }

    function a(v, h, m, C) {
        return h === null || h.tag !== 6 ? (h = tl(m, v.mode, C), h.return = v, h) : (h = i(h, m), h.return = v, h)
    }

    function l(v, h, m, C) {
        var S = m.type;
        return S === tr ? c(v, h, m.props.children, C, m.key) : h !== null && (h.elementType === S || typeof S == "object" && S !== null && S.$$typeof === Jt && od(S) === h.type) ? (C = i(h, m.props), C.ref = Gr(v, h, m), C.return = v, C) : (C = No(m.type, m.key, m.props, null, v.mode, C), C.ref = Gr(v, h, m), C.return = v, C)
    }

    function u(v, h, m, C) {
        return h === null || h.tag !== 4 || h.stateNode.containerInfo !== m.containerInfo || h.stateNode.implementation !== m.implementation ? (h = nl(m, v.mode, C), h.return = v, h) : (h = i(h, m.children || []), h.return = v, h)
    }

    function c(v, h, m, C, S) {
        return h === null || h.tag !== 7 ? (h = $n(m, v.mode, C, S), h.return = v, h) : (h = i(h, m), h.return = v, h)
    }

    function f(v, h, m) {
        if (typeof h == "string" && h !== "" || typeof h == "number") return h = tl("" + h, v.mode, m), h.return = v, h;
        if (typeof h == "object" && h !== null) {
            switch (h.$$typeof) {
                case ro:
                    return m = No(h.type, h.key, h.props, null, v.mode, m), m.ref = Gr(v, null, h), m.return = v, m;
                case er:
                    return h = nl(h, v.mode, m), h.return = v, h;
                case Jt:
                    var C = h._init;
                    return f(v, C(h._payload), m)
            }
            if (ni(h) || Qr(h)) return h = $n(h, v.mode, m, null), h.return = v, h;
            mo(v, h)
        }
        return null
    }

    function d(v, h, m, C) {
        var S = h !== null ? h.key : null;
        if (typeof m == "string" && m !== "" || typeof m == "number") return S !== null ? null : a(v, h, "" + m, C);
        if (typeof m == "object" && m !== null) {
            switch (m.$$typeof) {
                case ro:
                    return m.key === S ? l(v, h, m, C) : null;
                case er:
                    return m.key === S ? u(v, h, m, C) : null;
                case Jt:
                    return S = m._init, d(v, h, S(m._payload), C)
            }
            if (ni(m) || Qr(m)) return S !== null ? null : c(v, h, m, C, null);
            mo(v, m)
        }
        return null
    }

    function p(v, h, m, C, S) {
        if (typeof C == "string" && C !== "" || typeof C == "number") return v = v.get(m) || null, a(h, v, "" + C, S);
        if (typeof C == "object" && C !== null) {
            switch (C.$$typeof) {
                case ro:
                    return v = v.get(C.key === null ? m : C.key) || null, l(h, v, C, S);
                case er:
                    return v = v.get(C.key === null ? m : C.key) || null, u(h, v, C, S);
                case Jt:
                    var k = C._init;
                    return p(v, h, m, k(C._payload), S)
            }
            if (ni(C) || Qr(C)) return v = v.get(m) || null, c(h, v, C, S, null);
            mo(h, C)
        }
        return null
    }

    function y(v, h, m, C) {
        for (var S = null, k = null, T = h, E = h = 0, _ = null; T !== null && E < m.length; E++) {
            T.index > E ? (_ = T, T = null) : _ = T.sibling;
            var D = d(v, T, m[E], C);
            if (D === null) {
                T === null && (T = _);
                break
            }
            e && T && D.alternate === null && t(v, T), h = o(D, h, E), k === null ? S = D : k.sibling = D, k = D, T = _
        }
        if (E === m.length) return n(v, T), ve && An(v, E), S;
        if (T === null) {
            for (; E < m.length; E++) T = f(v, m[E], C), T !== null && (h = o(T, h, E), k === null ? S = T : k.sibling = T, k = T);
            return ve && An(v, E), S
        }
        for (T = r(v, T); E < m.length; E++) _ = p(T, v, E, m[E], C), _ !== null && (e && _.alternate !== null && T.delete(_.key === null ? E : _.key), h = o(_, h, E), k === null ? S = _ : k.sibling = _, k = _);
        return e && T.forEach(function(ee) {
            return t(v, ee)
        }), ve && An(v, E), S
    }

    function g(v, h, m, C) {
        var S = Qr(m);
        if (typeof S != "function") throw Error(R(150));
        if (m = S.call(m), m == null) throw Error(R(151));
        for (var k = S = null, T = h, E = h = 0, _ = null, D = m.next(); T !== null && !D.done; E++, D = m.next()) {
            T.index > E ? (_ = T, T = null) : _ = T.sibling;
            var ee = d(v, T, D.value, C);
            if (ee === null) {
                T === null && (T = _);
                break
            }
            e && T && ee.alternate === null && t(v, T), h = o(ee, h, E), k === null ? S = ee : k.sibling = ee, k = ee, T = _
        }
        if (D.done) return n(v, T), ve && An(v, E), S;
        if (T === null) {
            for (; !D.done; E++, D = m.next()) D = f(v, D.value, C), D !== null && (h = o(D, h, E), k === null ? S = D : k.sibling = D, k = D);
            return ve && An(v, E), S
        }
        for (T = r(v, T); !D.done; E++, D = m.next()) D = p(T, v, E, D.value, C), D !== null && (e && D.alternate !== null && T.delete(D.key === null ? E : D.key), h = o(D, h, E), k === null ? S = D : k.sibling = D, k = D);
        return e && T.forEach(function(Z) {
            return t(v, Z)
        }), ve && An(v, E), S
    }

    function x(v, h, m, C) {
        if (typeof m == "object" && m !== null && m.type === tr && m.key === null && (m = m.props.children), typeof m == "object" && m !== null) {
            switch (m.$$typeof) {
                case ro:
                    e: {
                        for (var S = m.key, k = h; k !== null;) {
                            if (k.key === S) {
                                if (S = m.type, S === tr) {
                                    if (k.tag === 7) {
                                        n(v, k.sibling), h = i(k, m.props.children), h.return = v, v = h;
                                        break e
                                    }
                                } else if (k.elementType === S || typeof S == "object" && S !== null && S.$$typeof === Jt && od(S) === k.type) {
                                    n(v, k.sibling), h = i(k, m.props), h.ref = Gr(v, k, m), h.return = v, v = h;
                                    break e
                                }
                                n(v, k);
                                break
                            } else t(v, k);
                            k = k.sibling
                        }
                        m.type === tr ? (h = $n(m.props.children, v.mode, C, m.key), h.return = v, v = h) : (C = No(m.type, m.key, m.props, null, v.mode, C), C.ref = Gr(v, h, m), C.return = v, v = C)
                    }
                    return s(v);
                case er:
                    e: {
                        for (k = m.key; h !== null;) {
                            if (h.key === k)
                                if (h.tag === 4 && h.stateNode.containerInfo === m.containerInfo && h.stateNode.implementation === m.implementation) {
                                    n(v, h.sibling), h = i(h, m.children || []), h.return = v, v = h;
                                    break e
                                } else {
                                    n(v, h);
                                    break
                                }
                            else t(v, h);
                            h = h.sibling
                        }
                        h = nl(m, v.mode, C),
                        h.return = v,
                        v = h
                    }
                    return s(v);
                case Jt:
                    return k = m._init, x(v, h, k(m._payload), C)
            }
            if (ni(m)) return y(v, h, m, C);
            if (Qr(m)) return g(v, h, m, C);
            mo(v, m)
        }
        return typeof m == "string" && m !== "" || typeof m == "number" ? (m = "" + m, h !== null && h.tag === 6 ? (n(v, h.sibling), h = i(h, m), h.return = v, v = h) : (n(v, h), h = tl(m, v.mode, C), h.return = v, v = h), s(v)) : n(v, h)
    }
    return x
}
var Ar = Sp(!0),
    xp = Sp(!1),
    Ki = {},
    Dt = kn(Ki),
    Li = kn(Ki),
    bi = kn(Ki);

function Dn(e) {
    if (e === Ki) throw Error(R(174));
    return e
}

function vc(e, t) {
    switch (de(bi, t), de(Li, e), de(Dt, Ki), e = t.nodeType, e) {
        case 9:
        case 11:
            t = (t = t.documentElement) ? t.namespaceURI : bl(null, "");
            break;
        default:
            e = e === 8 ? t.parentNode : t, t = e.namespaceURI || null, e = e.tagName, t = bl(t, e)
    }
    me(Dt), de(Dt, t)
}

function Mr() {
    me(Dt), me(Li), me(bi)
}

function Pp(e) {
    Dn(bi.current);
    var t = Dn(Dt.current),
        n = bl(t, e.type);
    t !== n && (de(Li, e), de(Dt, n))
}

function gc(e) {
    Li.current === e && (me(Dt), me(Li))
}
var ge = kn(0);

function cs(e) {
    for (var t = e; t !== null;) {
        if (t.tag === 13) {
            var n = t.memoizedState;
            if (n !== null && (n = n.dehydrated, n === null || n.data === "$?" || n.data === "$!")) return t
        } else if (t.tag === 19 && t.memoizedProps.revealOrder !== void 0) {
            if (t.flags & 128) return t
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
var Ga = [];

function Cc() {
    for (var e = 0; e < Ga.length; e++) Ga[e]._workInProgressVersionPrimary = null;
    Ga.length = 0
}
var Do = Gt.ReactCurrentDispatcher,
    Za = Gt.ReactCurrentBatchConfig,
    zn = 0,
    we = null,
    Me = null,
    Le = null,
    fs = !1,
    fi = !1,
    Di = 0,
    oy = 0;

function Be() {
    throw Error(R(321))
}

function wc(e, t) {
    if (t === null) return !1;
    for (var n = 0; n < t.length && n < e.length; n++)
        if (!At(e[n], t[n])) return !1;
    return !0
}

function Sc(e, t, n, r, i, o) {
    if (zn = o, we = t, t.memoizedState = null, t.updateQueue = null, t.lanes = 0, Do.current = e === null || e.memoizedState === null ? uy : cy, e = n(r, i), fi) {
        o = 0;
        do {
            if (fi = !1, Di = 0, 25 <= o) throw Error(R(301));
            o += 1, Le = Me = null, t.updateQueue = null, Do.current = fy, e = n(r, i)
        } while (fi)
    }
    if (Do.current = ds, t = Me !== null && Me.next !== null, zn = 0, Le = Me = we = null, fs = !1, t) throw Error(R(300));
    return e
}

function xc() {
    var e = Di !== 0;
    return Di = 0, e
}

function Ot() {
    var e = {
        memoizedState: null,
        baseState: null,
        baseQueue: null,
        queue: null,
        next: null
    };
    return Le === null ? we.memoizedState = Le = e : Le = Le.next = e, Le
}

function gt() {
    if (Me === null) {
        var e = we.alternate;
        e = e !== null ? e.memoizedState : null
    } else e = Me.next;
    var t = Le === null ? we.memoizedState : Le.next;
    if (t !== null) Le = t, Me = e;
    else {
        if (e === null) throw Error(R(310));
        Me = e, e = {
            memoizedState: Me.memoizedState,
            baseState: Me.baseState,
            baseQueue: Me.baseQueue,
            queue: Me.queue,
            next: null
        }, Le === null ? we.memoizedState = Le = e : Le = Le.next = e
    }
    return Le
}

function Vi(e, t) {
    return typeof t == "function" ? t(e) : t
}

function Ya(e) {
    var t = gt(),
        n = t.queue;
    if (n === null) throw Error(R(311));
    n.lastRenderedReducer = e;
    var r = Me,
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
        var a = s = null,
            l = null,
            u = o;
        do {
            var c = u.lane;
            if ((zn & c) === c) l !== null && (l = l.next = {
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
                l === null ? (a = l = f, s = r) : l = l.next = f, we.lanes |= c, Bn |= c
            }
            u = u.next
        } while (u !== null && u !== o);
        l === null ? s = r : l.next = a, At(r, t.memoizedState) || (Je = !0), t.memoizedState = r, t.baseState = s, t.baseQueue = l, n.lastRenderedState = r
    }
    if (e = n.interleaved, e !== null) {
        i = e;
        do o = i.lane, we.lanes |= o, Bn |= o, i = i.next; while (i !== e)
    } else i === null && (n.lanes = 0);
    return [t.memoizedState, n.dispatch]
}

function Xa(e) {
    var t = gt(),
        n = t.queue;
    if (n === null) throw Error(R(311));
    n.lastRenderedReducer = e;
    var r = n.dispatch,
        i = n.pending,
        o = t.memoizedState;
    if (i !== null) {
        n.pending = null;
        var s = i = i.next;
        do o = e(o, s.action), s = s.next; while (s !== i);
        At(o, t.memoizedState) || (Je = !0), t.memoizedState = o, t.baseQueue === null && (t.baseState = o), n.lastRenderedState = o
    }
    return [o, r]
}

function kp() {}

function Ep(e, t) {
    var n = we,
        r = gt(),
        i = t(),
        o = !At(r.memoizedState, i);
    if (o && (r.memoizedState = i, Je = !0), r = r.queue, Pc(Ap.bind(null, n, r, e), [e]), r.getSnapshot !== t || o || Le !== null && Le.memoizedState.tag & 1) {
        if (n.flags |= 2048, _i(9, Rp.bind(null, n, r, i, t), void 0, null), be === null) throw Error(R(349));
        zn & 30 || Tp(n, t, i)
    }
    return i
}

function Tp(e, t, n) {
    e.flags |= 16384, e = {
        getSnapshot: t,
        value: n
    }, t = we.updateQueue, t === null ? (t = {
        lastEffect: null,
        stores: null
    }, we.updateQueue = t, t.stores = [e]) : (n = t.stores, n === null ? t.stores = [e] : n.push(e))
}

function Rp(e, t, n, r) {
    t.value = n, t.getSnapshot = r, Mp(t) && Op(e)
}

function Ap(e, t, n) {
    return n(function() {
        Mp(t) && Op(e)
    })
}

function Mp(e) {
    var t = e.getSnapshot;
    e = e.value;
    try {
        var n = t();
        return !At(e, n)
    } catch {
        return !0
    }
}

function Op(e) {
    var t = Wt(e, 1);
    t !== null && Rt(t, e, 1, -1)
}

function sd(e) {
    var t = Ot();
    return typeof e == "function" && (e = e()), t.memoizedState = t.baseState = e, e = {
        pending: null,
        interleaved: null,
        lanes: 0,
        dispatch: null,
        lastRenderedReducer: Vi,
        lastRenderedState: e
    }, t.queue = e, e = e.dispatch = ly.bind(null, we, e), [t.memoizedState, e]
}

function _i(e, t, n, r) {
    return e = {
        tag: e,
        create: t,
        destroy: n,
        deps: r,
        next: null
    }, t = we.updateQueue, t === null ? (t = {
        lastEffect: null,
        stores: null
    }, we.updateQueue = t, t.lastEffect = e.next = e) : (n = t.lastEffect, n === null ? t.lastEffect = e.next = e : (r = n.next, n.next = e, e.next = r, t.lastEffect = e)), e
}

function Fp() {
    return gt().memoizedState
}

function Vo(e, t, n, r) {
    var i = Ot();
    we.flags |= e, i.memoizedState = _i(1 | t, n, void 0, r === void 0 ? null : r)
}

function Us(e, t, n, r) {
    var i = gt();
    r = r === void 0 ? null : r;
    var o = void 0;
    if (Me !== null) {
        var s = Me.memoizedState;
        if (o = s.destroy, r !== null && wc(r, s.deps)) {
            i.memoizedState = _i(t, n, o, r);
            return
        }
    }
    we.flags |= e, i.memoizedState = _i(1 | t, n, o, r)
}

function ad(e, t) {
    return Vo(8390656, 8, e, t)
}

function Pc(e, t) {
    return Us(2048, 8, e, t)
}

function Lp(e, t) {
    return Us(4, 2, e, t)
}

function bp(e, t) {
    return Us(4, 4, e, t)
}

function Dp(e, t) {
    if (typeof t == "function") return e = e(), t(e),
        function() {
            t(null)
        };
    if (t != null) return e = e(), t.current = e,
        function() {
            t.current = null
        }
}

function Vp(e, t, n) {
    return n = n != null ? n.concat([e]) : null, Us(4, 4, Dp.bind(null, t, e), n)
}

function kc() {}

function _p(e, t) {
    var n = gt();
    t = t === void 0 ? null : t;
    var r = n.memoizedState;
    return r !== null && t !== null && wc(t, r[1]) ? r[0] : (n.memoizedState = [e, t], e)
}

function Ip(e, t) {
    var n = gt();
    t = t === void 0 ? null : t;
    var r = n.memoizedState;
    return r !== null && t !== null && wc(t, r[1]) ? r[0] : (e = e(), n.memoizedState = [e, t], e)
}

function $p(e, t, n) {
    return zn & 21 ? (At(n, t) || (n = z1(), we.lanes |= n, Bn |= n, e.baseState = !0), t) : (e.baseState && (e.baseState = !1, Je = !0), e.memoizedState = n)
}

function sy(e, t) {
    var n = se;
    se = n !== 0 && 4 > n ? n : 4, e(!0);
    var r = Za.transition;
    Za.transition = {};
    try {
        e(!1), t()
    } finally {
        se = n, Za.transition = r
    }
}

function Np() {
    return gt().memoizedState
}

function ay(e, t, n) {
    var r = pn(e);
    if (n = {
            lane: r,
            action: n,
            hasEagerState: !1,
            eagerState: null,
            next: null
        }, jp(e)) zp(t, n);
    else if (n = vp(e, t, n, r), n !== null) {
        var i = qe();
        Rt(n, e, r, i), Bp(n, t, r)
    }
}

function ly(e, t, n) {
    var r = pn(e),
        i = {
            lane: r,
            action: n,
            hasEagerState: !1,
            eagerState: null,
            next: null
        };
    if (jp(e)) zp(t, i);
    else {
        var o = e.alternate;
        if (e.lanes === 0 && (o === null || o.lanes === 0) && (o = t.lastRenderedReducer, o !== null)) try {
            var s = t.lastRenderedState,
                a = o(s, n);
            if (i.hasEagerState = !0, i.eagerState = a, At(a, s)) {
                var l = t.interleaved;
                l === null ? (i.next = i, mc(t)) : (i.next = l.next, l.next = i), t.interleaved = i;
                return
            }
        } catch {} finally {}
        n = vp(e, t, i, r), n !== null && (i = qe(), Rt(n, e, r, i), Bp(n, t, r))
    }
}

function jp(e) {
    var t = e.alternate;
    return e === we || t !== null && t === we
}

function zp(e, t) {
    fi = fs = !0;
    var n = e.pending;
    n === null ? t.next = t : (t.next = n.next, n.next = t), e.pending = t
}

function Bp(e, t, n) {
    if (n & 4194240) {
        var r = t.lanes;
        r &= e.pendingLanes, n |= r, t.lanes = n, tc(e, n)
    }
}
var ds = {
        readContext: vt,
        useCallback: Be,
        useContext: Be,
        useEffect: Be,
        useImperativeHandle: Be,
        useInsertionEffect: Be,
        useLayoutEffect: Be,
        useMemo: Be,
        useReducer: Be,
        useRef: Be,
        useState: Be,
        useDebugValue: Be,
        useDeferredValue: Be,
        useTransition: Be,
        useMutableSource: Be,
        useSyncExternalStore: Be,
        useId: Be,
        unstable_isNewReconciler: !1
    },
    uy = {
        readContext: vt,
        useCallback: function(e, t) {
            return Ot().memoizedState = [e, t === void 0 ? null : t], e
        },
        useContext: vt,
        useEffect: ad,
        useImperativeHandle: function(e, t, n) {
            return n = n != null ? n.concat([e]) : null, Vo(4194308, 4, Dp.bind(null, t, e), n)
        },
        useLayoutEffect: function(e, t) {
            return Vo(4194308, 4, e, t)
        },
        useInsertionEffect: function(e, t) {
            return Vo(4, 2, e, t)
        },
        useMemo: function(e, t) {
            var n = Ot();
            return t = t === void 0 ? null : t, e = e(), n.memoizedState = [e, t], e
        },
        useReducer: function(e, t, n) {
            var r = Ot();
            return t = n !== void 0 ? n(t) : t, r.memoizedState = r.baseState = t, e = {
                pending: null,
                interleaved: null,
                lanes: 0,
                dispatch: null,
                lastRenderedReducer: e,
                lastRenderedState: t
            }, r.queue = e, e = e.dispatch = ay.bind(null, we, e), [r.memoizedState, e]
        },
        useRef: function(e) {
            var t = Ot();
            return e = {
                current: e
            }, t.memoizedState = e
        },
        useState: sd,
        useDebugValue: kc,
        useDeferredValue: function(e) {
            return Ot().memoizedState = e
        },
        useTransition: function() {
            var e = sd(!1),
                t = e[0];
            return e = sy.bind(null, e[1]), Ot().memoizedState = e, [t, e]
        },
        useMutableSource: function() {},
        useSyncExternalStore: function(e, t, n) {
            var r = we,
                i = Ot();
            if (ve) {
                if (n === void 0) throw Error(R(407));
                n = n()
            } else {
                if (n = t(), be === null) throw Error(R(349));
                zn & 30 || Tp(r, t, n)
            }
            i.memoizedState = n;
            var o = {
                value: n,
                getSnapshot: t
            };
            return i.queue = o, ad(Ap.bind(null, r, o, e), [e]), r.flags |= 2048, _i(9, Rp.bind(null, r, o, n, t), void 0, null), n
        },
        useId: function() {
            var e = Ot(),
                t = be.identifierPrefix;
            if (ve) {
                var n = Nt,
                    r = $t;
                n = (r & ~(1 << 32 - Tt(r) - 1)).toString(32) + n, t = ":" + t + "R" + n, n = Di++, 0 < n && (t += "H" + n.toString(32)), t += ":"
            } else n = oy++, t = ":" + t + "r" + n.toString(32) + ":";
            return e.memoizedState = t
        },
        unstable_isNewReconciler: !1
    },
    cy = {
        readContext: vt,
        useCallback: _p,
        useContext: vt,
        useEffect: Pc,
        useImperativeHandle: Vp,
        useInsertionEffect: Lp,
        useLayoutEffect: bp,
        useMemo: Ip,
        useReducer: Ya,
        useRef: Fp,
        useState: function() {
            return Ya(Vi)
        },
        useDebugValue: kc,
        useDeferredValue: function(e) {
            var t = gt();
            return $p(t, Me.memoizedState, e)
        },
        useTransition: function() {
            var e = Ya(Vi)[0],
                t = gt().memoizedState;
            return [e, t]
        },
        useMutableSource: kp,
        useSyncExternalStore: Ep,
        useId: Np,
        unstable_isNewReconciler: !1
    },
    fy = {
        readContext: vt,
        useCallback: _p,
        useContext: vt,
        useEffect: Pc,
        useImperativeHandle: Vp,
        useInsertionEffect: Lp,
        useLayoutEffect: bp,
        useMemo: Ip,
        useReducer: Xa,
        useRef: Fp,
        useState: function() {
            return Xa(Vi)
        },
        useDebugValue: kc,
        useDeferredValue: function(e) {
            var t = gt();
            return Me === null ? t.memoizedState = e : $p(t, Me.memoizedState, e)
        },
        useTransition: function() {
            var e = Xa(Vi)[0],
                t = gt().memoizedState;
            return [e, t]
        },
        useMutableSource: kp,
        useSyncExternalStore: Ep,
        useId: Np,
        unstable_isNewReconciler: !1
    };

function Or(e, t) {
    try {
        var n = "",
            r = t;
        do n += N2(r), r = r.return; while (r);
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

function Ja(e, t, n) {
    return {
        value: e,
        source: null,
        stack: n ?? null,
        digest: t ?? null
    }
}

function nu(e, t) {
    try {
        console.error(t.value)
    } catch (n) {
        setTimeout(function() {
            throw n
        })
    }
}
var dy = typeof WeakMap == "function" ? WeakMap : Map;

function Up(e, t, n) {
    n = zt(-1, n), n.tag = 3, n.payload = {
        element: null
    };
    var r = t.value;
    return n.callback = function() {
        ps || (ps = !0, du = r), nu(e, t)
    }, n
}

function Qp(e, t, n) {
    n = zt(-1, n), n.tag = 3;
    var r = e.type.getDerivedStateFromError;
    if (typeof r == "function") {
        var i = t.value;
        n.payload = function() {
            return r(i)
        }, n.callback = function() {
            nu(e, t)
        }
    }
    var o = e.stateNode;
    return o !== null && typeof o.componentDidCatch == "function" && (n.callback = function() {
        nu(e, t), typeof r != "function" && (hn === null ? hn = new Set([this]) : hn.add(this));
        var s = t.stack;
        this.componentDidCatch(t.value, {
            componentStack: s !== null ? s : ""
        })
    }), n
}

function ld(e, t, n) {
    var r = e.pingCache;
    if (r === null) {
        r = e.pingCache = new dy;
        var i = new Set;
        r.set(t, i)
    } else i = r.get(t), i === void 0 && (i = new Set, r.set(t, i));
    i.has(n) || (i.add(n), e = Ty.bind(null, e, t, n), t.then(e, e))
}

function ud(e) {
    do {
        var t;
        if ((t = e.tag === 13) && (t = e.memoizedState, t = t !== null ? t.dehydrated !== null : !0), t) return e;
        e = e.return
    } while (e !== null);
    return null
}

function cd(e, t, n, r, i) {
    return e.mode & 1 ? (e.flags |= 65536, e.lanes = i, e) : (e === t ? e.flags |= 65536 : (e.flags |= 128, n.flags |= 131072, n.flags &= -52805, n.tag === 1 && (n.alternate === null ? n.tag = 17 : (t = zt(-1, 1), t.tag = 2, dn(n, t, 1))), n.lanes |= 1), e)
}
var hy = Gt.ReactCurrentOwner,
    Je = !1;

function Ke(e, t, n, r) {
    t.child = e === null ? xp(t, null, n, r) : Ar(t, e.child, n, r)
}

function fd(e, t, n, r, i) {
    n = n.render;
    var o = t.ref;
    return xr(t, i), r = Sc(e, t, n, r, o, i), n = xc(), e !== null && !Je ? (t.updateQueue = e.updateQueue, t.flags &= -2053, e.lanes &= ~i, Kt(e, t, i)) : (ve && n && uc(t), t.flags |= 1, Ke(e, t, r, i), t.child)
}

function dd(e, t, n, r, i) {
    if (e === null) {
        var o = n.type;
        return typeof o == "function" && !Lc(o) && o.defaultProps === void 0 && n.compare === null && n.defaultProps === void 0 ? (t.tag = 15, t.type = o, Hp(e, t, o, r, i)) : (e = No(n.type, null, r, t, t.mode, i), e.ref = t.ref, e.return = t, t.child = e)
    }
    if (o = e.child, !(e.lanes & i)) {
        var s = o.memoizedProps;
        if (n = n.compare, n = n !== null ? n : Ai, n(s, r) && e.ref === t.ref) return Kt(e, t, i)
    }
    return t.flags |= 1, e = mn(o, r), e.ref = t.ref, e.return = t, t.child = e
}

function Hp(e, t, n, r, i) {
    if (e !== null) {
        var o = e.memoizedProps;
        if (Ai(o, r) && e.ref === t.ref)
            if (Je = !1, t.pendingProps = r = o, (e.lanes & i) !== 0) e.flags & 131072 && (Je = !0);
            else return t.lanes = e.lanes, Kt(e, t, i)
    }
    return ru(e, t, n, r, i)
}

function Wp(e, t, n) {
    var r = t.pendingProps,
        i = r.children,
        o = e !== null ? e.memoizedState : null;
    if (r.mode === "hidden")
        if (!(t.mode & 1)) t.memoizedState = {
            baseLanes: 0,
            cachePool: null,
            transitions: null
        }, de(fr, it), it |= n;
        else {
            if (!(n & 1073741824)) return e = o !== null ? o.baseLanes | n : n, t.lanes = t.childLanes = 1073741824, t.memoizedState = {
                baseLanes: e,
                cachePool: null,
                transitions: null
            }, t.updateQueue = null, de(fr, it), it |= e, null;
            t.memoizedState = {
                baseLanes: 0,
                cachePool: null,
                transitions: null
            }, r = o !== null ? o.baseLanes : n, de(fr, it), it |= r
        }
    else o !== null ? (r = o.baseLanes | n, t.memoizedState = null) : r = n, de(fr, it), it |= r;
    return Ke(e, t, i, n), t.child
}

function Kp(e, t) {
    var n = t.ref;
    (e === null && n !== null || e !== null && e.ref !== n) && (t.flags |= 512, t.flags |= 2097152)
}

function ru(e, t, n, r, i) {
    var o = tt(n) ? Nn : He.current;
    return o = Tr(t, o), xr(t, i), n = Sc(e, t, n, r, o, i), r = xc(), e !== null && !Je ? (t.updateQueue = e.updateQueue, t.flags &= -2053, e.lanes &= ~i, Kt(e, t, i)) : (ve && r && uc(t), t.flags |= 1, Ke(e, t, n, i), t.child)
}

function hd(e, t, n, r, i) {
    if (tt(n)) {
        var o = !0;
        is(t)
    } else o = !1;
    if (xr(t, i), t.stateNode === null) _o(e, t), wp(t, n, r), tu(t, n, r, i), r = !0;
    else if (e === null) {
        var s = t.stateNode,
            a = t.memoizedProps;
        s.props = a;
        var l = s.context,
            u = n.contextType;
        typeof u == "object" && u !== null ? u = vt(u) : (u = tt(n) ? Nn : He.current, u = Tr(t, u));
        var c = n.getDerivedStateFromProps,
            f = typeof c == "function" || typeof s.getSnapshotBeforeUpdate == "function";
        f || typeof s.UNSAFE_componentWillReceiveProps != "function" && typeof s.componentWillReceiveProps != "function" || (a !== r || l !== u) && id(t, s, r, u), en = !1;
        var d = t.memoizedState;
        s.state = d, us(t, r, s, i), l = t.memoizedState, a !== r || d !== l || et.current || en ? (typeof c == "function" && (eu(t, n, c, r), l = t.memoizedState), (a = en || rd(t, n, a, r, d, l, u)) ? (f || typeof s.UNSAFE_componentWillMount != "function" && typeof s.componentWillMount != "function" || (typeof s.componentWillMount == "function" && s.componentWillMount(), typeof s.UNSAFE_componentWillMount == "function" && s.UNSAFE_componentWillMount()), typeof s.componentDidMount == "function" && (t.flags |= 4194308)) : (typeof s.componentDidMount == "function" && (t.flags |= 4194308), t.memoizedProps = r, t.memoizedState = l), s.props = r, s.state = l, s.context = u, r = a) : (typeof s.componentDidMount == "function" && (t.flags |= 4194308), r = !1)
    } else {
        s = t.stateNode, gp(e, t), a = t.memoizedProps, u = t.type === t.elementType ? a : xt(t.type, a), s.props = u, f = t.pendingProps, d = s.context, l = n.contextType, typeof l == "object" && l !== null ? l = vt(l) : (l = tt(n) ? Nn : He.current, l = Tr(t, l));
        var p = n.getDerivedStateFromProps;
        (c = typeof p == "function" || typeof s.getSnapshotBeforeUpdate == "function") || typeof s.UNSAFE_componentWillReceiveProps != "function" && typeof s.componentWillReceiveProps != "function" || (a !== f || d !== l) && id(t, s, r, l), en = !1, d = t.memoizedState, s.state = d, us(t, r, s, i);
        var y = t.memoizedState;
        a !== f || d !== y || et.current || en ? (typeof p == "function" && (eu(t, n, p, r), y = t.memoizedState), (u = en || rd(t, n, u, r, d, y, l) || !1) ? (c || typeof s.UNSAFE_componentWillUpdate != "function" && typeof s.componentWillUpdate != "function" || (typeof s.componentWillUpdate == "function" && s.componentWillUpdate(r, y, l), typeof s.UNSAFE_componentWillUpdate == "function" && s.UNSAFE_componentWillUpdate(r, y, l)), typeof s.componentDidUpdate == "function" && (t.flags |= 4), typeof s.getSnapshotBeforeUpdate == "function" && (t.flags |= 1024)) : (typeof s.componentDidUpdate != "function" || a === e.memoizedProps && d === e.memoizedState || (t.flags |= 4), typeof s.getSnapshotBeforeUpdate != "function" || a === e.memoizedProps && d === e.memoizedState || (t.flags |= 1024), t.memoizedProps = r, t.memoizedState = y), s.props = r, s.state = y, s.context = l, r = u) : (typeof s.componentDidUpdate != "function" || a === e.memoizedProps && d === e.memoizedState || (t.flags |= 4), typeof s.getSnapshotBeforeUpdate != "function" || a === e.memoizedProps && d === e.memoizedState || (t.flags |= 1024), r = !1)
    }
    return iu(e, t, n, r, o, i)
}

function iu(e, t, n, r, i, o) {
    Kp(e, t);
    var s = (t.flags & 128) !== 0;
    if (!r && !s) return i && Xf(t, n, !1), Kt(e, t, o);
    r = t.stateNode, hy.current = t;
    var a = s && typeof n.getDerivedStateFromError != "function" ? null : r.render();
    return t.flags |= 1, e !== null && s ? (t.child = Ar(t, e.child, null, o), t.child = Ar(t, null, a, o)) : Ke(e, t, a, o), t.memoizedState = r.state, i && Xf(t, n, !0), t.child
}

function qp(e) {
    var t = e.stateNode;
    t.pendingContext ? Yf(e, t.pendingContext, t.pendingContext !== t.context) : t.context && Yf(e, t.context, !1), vc(e, t.containerInfo)
}

function pd(e, t, n, r, i) {
    return Rr(), fc(i), t.flags |= 256, Ke(e, t, n, r), t.child
}
var ou = {
    dehydrated: null,
    treeContext: null,
    retryLane: 0
};

function su(e) {
    return {
        baseLanes: e,
        cachePool: null,
        transitions: null
    }
}

function Gp(e, t, n) {
    var r = t.pendingProps,
        i = ge.current,
        o = !1,
        s = (t.flags & 128) !== 0,
        a;
    if ((a = s) || (a = e !== null && e.memoizedState === null ? !1 : (i & 2) !== 0), a ? (o = !0, t.flags &= -129) : (e === null || e.memoizedState !== null) && (i |= 1), de(ge, i & 1), e === null) return Xl(t), e = t.memoizedState, e !== null && (e = e.dehydrated, e !== null) ? (t.mode & 1 ? e.data === "$!" ? t.lanes = 8 : t.lanes = 1073741824 : t.lanes = 1, null) : (s = r.children, e = r.fallback, o ? (r = t.mode, o = t.child, s = {
        mode: "hidden",
        children: s
    }, !(r & 1) && o !== null ? (o.childLanes = 0, o.pendingProps = s) : o = Ws(s, r, 0, null), e = $n(e, r, n, null), o.return = t, e.return = t, o.sibling = e, t.child = o, t.child.memoizedState = su(n), t.memoizedState = ou, e) : Ec(t, s));
    if (i = e.memoizedState, i !== null && (a = i.dehydrated, a !== null)) return py(e, t, s, r, a, i, n);
    if (o) {
        o = r.fallback, s = t.mode, i = e.child, a = i.sibling;
        var l = {
            mode: "hidden",
            children: r.children
        };
        return !(s & 1) && t.child !== i ? (r = t.child, r.childLanes = 0, r.pendingProps = l, t.deletions = null) : (r = mn(i, l), r.subtreeFlags = i.subtreeFlags & 14680064), a !== null ? o = mn(a, o) : (o = $n(o, s, n, null), o.flags |= 2), o.return = t, r.return = t, r.sibling = o, t.child = r, r = o, o = t.child, s = e.child.memoizedState, s = s === null ? su(n) : {
            baseLanes: s.baseLanes | n,
            cachePool: null,
            transitions: s.transitions
        }, o.memoizedState = s, o.childLanes = e.childLanes & ~n, t.memoizedState = ou, r
    }
    return o = e.child, e = o.sibling, r = mn(o, {
        mode: "visible",
        children: r.children
    }), !(t.mode & 1) && (r.lanes = n), r.return = t, r.sibling = null, e !== null && (n = t.deletions, n === null ? (t.deletions = [e], t.flags |= 16) : n.push(e)), t.child = r, t.memoizedState = null, r
}

function Ec(e, t) {
    return t = Ws({
        mode: "visible",
        children: t
    }, e.mode, 0, null), t.return = e, e.child = t
}

function yo(e, t, n, r) {
    return r !== null && fc(r), Ar(t, e.child, null, n), e = Ec(t, t.pendingProps.children), e.flags |= 2, t.memoizedState = null, e
}

function py(e, t, n, r, i, o, s) {
    if (n) return t.flags & 256 ? (t.flags &= -257, r = Ja(Error(R(422))), yo(e, t, s, r)) : t.memoizedState !== null ? (t.child = e.child, t.flags |= 128, null) : (o = r.fallback, i = t.mode, r = Ws({
        mode: "visible",
        children: r.children
    }, i, 0, null), o = $n(o, i, s, null), o.flags |= 2, r.return = t, o.return = t, r.sibling = o, t.child = r, t.mode & 1 && Ar(t, e.child, null, s), t.child.memoizedState = su(s), t.memoizedState = ou, o);
    if (!(t.mode & 1)) return yo(e, t, s, null);
    if (i.data === "$!") {
        if (r = i.nextSibling && i.nextSibling.dataset, r) var a = r.dgst;
        return r = a, o = Error(R(419)), r = Ja(o, r, void 0), yo(e, t, s, r)
    }
    if (a = (s & e.childLanes) !== 0, Je || a) {
        if (r = be, r !== null) {
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
            i = i & (r.suspendedLanes | s) ? 0 : i, i !== 0 && i !== o.retryLane && (o.retryLane = i, Wt(e, i), Rt(r, e, i, -1))
        }
        return Fc(), r = Ja(Error(R(421))), yo(e, t, s, r)
    }
    return i.data === "$?" ? (t.flags |= 128, t.child = e.child, t = Ry.bind(null, e), i._reactRetry = t, null) : (e = o.treeContext, ot = fn(i.nextSibling), st = t, ve = !0, kt = null, e !== null && (ht[pt++] = $t, ht[pt++] = Nt, ht[pt++] = jn, $t = e.id, Nt = e.overflow, jn = t), t = Ec(t, r.children), t.flags |= 4096, t)
}

function md(e, t, n) {
    e.lanes |= t;
    var r = e.alternate;
    r !== null && (r.lanes |= t), Jl(e.return, t, n)
}

function el(e, t, n, r, i) {
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

function Zp(e, t, n) {
    var r = t.pendingProps,
        i = r.revealOrder,
        o = r.tail;
    if (Ke(e, t, r.children, n), r = ge.current, r & 2) r = r & 1 | 2, t.flags |= 128;
    else {
        if (e !== null && e.flags & 128) e: for (e = t.child; e !== null;) {
            if (e.tag === 13) e.memoizedState !== null && md(e, n, t);
            else if (e.tag === 19) md(e, n, t);
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
    if (de(ge, r), !(t.mode & 1)) t.memoizedState = null;
    else switch (i) {
        case "forwards":
            for (n = t.child, i = null; n !== null;) e = n.alternate, e !== null && cs(e) === null && (i = n), n = n.sibling;
            n = i, n === null ? (i = t.child, t.child = null) : (i = n.sibling, n.sibling = null), el(t, !1, i, n, o);
            break;
        case "backwards":
            for (n = null, i = t.child, t.child = null; i !== null;) {
                if (e = i.alternate, e !== null && cs(e) === null) {
                    t.child = i;
                    break
                }
                e = i.sibling, i.sibling = n, n = i, i = e
            }
            el(t, !0, n, null, o);
            break;
        case "together":
            el(t, !1, null, null, void 0);
            break;
        default:
            t.memoizedState = null
    }
    return t.child
}

function _o(e, t) {
    !(t.mode & 1) && e !== null && (e.alternate = null, t.alternate = null, t.flags |= 2)
}

function Kt(e, t, n) {
    if (e !== null && (t.dependencies = e.dependencies), Bn |= t.lanes, !(n & t.childLanes)) return null;
    if (e !== null && t.child !== e.child) throw Error(R(153));
    if (t.child !== null) {
        for (e = t.child, n = mn(e, e.pendingProps), t.child = n, n.return = t; e.sibling !== null;) e = e.sibling, n = n.sibling = mn(e, e.pendingProps), n.return = t;
        n.sibling = null
    }
    return t.child
}

function my(e, t, n) {
    switch (t.tag) {
        case 3:
            qp(t), Rr();
            break;
        case 5:
            Pp(t);
            break;
        case 1:
            tt(t.type) && is(t);
            break;
        case 4:
            vc(t, t.stateNode.containerInfo);
            break;
        case 10:
            var r = t.type._context,
                i = t.memoizedProps.value;
            de(as, r._currentValue), r._currentValue = i;
            break;
        case 13:
            if (r = t.memoizedState, r !== null) return r.dehydrated !== null ? (de(ge, ge.current & 1), t.flags |= 128, null) : n & t.child.childLanes ? Gp(e, t, n) : (de(ge, ge.current & 1), e = Kt(e, t, n), e !== null ? e.sibling : null);
            de(ge, ge.current & 1);
            break;
        case 19:
            if (r = (n & t.childLanes) !== 0, e.flags & 128) {
                if (r) return Zp(e, t, n);
                t.flags |= 128
            }
            if (i = t.memoizedState, i !== null && (i.rendering = null, i.tail = null, i.lastEffect = null), de(ge, ge.current), r) break;
            return null;
        case 22:
        case 23:
            return t.lanes = 0, Wp(e, t, n)
    }
    return Kt(e, t, n)
}
var Yp, au, Xp, Jp;
Yp = function(e, t) {
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
au = function() {};
Xp = function(e, t, n, r) {
    var i = e.memoizedProps;
    if (i !== r) {
        e = t.stateNode, Dn(Dt.current);
        var o = null;
        switch (n) {
            case "input":
                i = Ml(e, i), r = Ml(e, r), o = [];
                break;
            case "select":
                i = Se({}, i, {
                    value: void 0
                }), r = Se({}, r, {
                    value: void 0
                }), o = [];
                break;
            case "textarea":
                i = Ll(e, i), r = Ll(e, r), o = [];
                break;
            default:
                typeof i.onClick != "function" && typeof r.onClick == "function" && (e.onclick = ns)
        }
        Dl(n, r);
        var s;
        n = null;
        for (u in i)
            if (!r.hasOwnProperty(u) && i.hasOwnProperty(u) && i[u] != null)
                if (u === "style") {
                    var a = i[u];
                    for (s in a) a.hasOwnProperty(s) && (n || (n = {}), n[s] = "")
                } else u !== "dangerouslySetInnerHTML" && u !== "children" && u !== "suppressContentEditableWarning" && u !== "suppressHydrationWarning" && u !== "autoFocus" && (Si.hasOwnProperty(u) ? o || (o = []) : (o = o || []).push(u, null));
        for (u in r) {
            var l = r[u];
            if (a = i != null ? i[u] : void 0, r.hasOwnProperty(u) && l !== a && (l != null || a != null))
                if (u === "style")
                    if (a) {
                        for (s in a) !a.hasOwnProperty(s) || l && l.hasOwnProperty(s) || (n || (n = {}), n[s] = "");
                        for (s in l) l.hasOwnProperty(s) && a[s] !== l[s] && (n || (n = {}), n[s] = l[s])
                    } else n || (o || (o = []), o.push(u, n)), n = l;
            else u === "dangerouslySetInnerHTML" ? (l = l ? l.__html : void 0, a = a ? a.__html : void 0, l != null && a !== l && (o = o || []).push(u, l)) : u === "children" ? typeof l != "string" && typeof l != "number" || (o = o || []).push(u, "" + l) : u !== "suppressContentEditableWarning" && u !== "suppressHydrationWarning" && (Si.hasOwnProperty(u) ? (l != null && u === "onScroll" && pe("scroll", e), o || a === l || (o = [])) : (o = o || []).push(u, l))
        }
        n && (o = o || []).push("style", n);
        var u = o;
        (t.updateQueue = u) && (t.flags |= 4)
    }
};
Jp = function(e, t, n, r) {
    n !== r && (t.flags |= 4)
};

function Zr(e, t) {
    if (!ve) switch (e.tailMode) {
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

function Ue(e) {
    var t = e.alternate !== null && e.alternate.child === e.child,
        n = 0,
        r = 0;
    if (t)
        for (var i = e.child; i !== null;) n |= i.lanes | i.childLanes, r |= i.subtreeFlags & 14680064, r |= i.flags & 14680064, i.return = e, i = i.sibling;
    else
        for (i = e.child; i !== null;) n |= i.lanes | i.childLanes, r |= i.subtreeFlags, r |= i.flags, i.return = e, i = i.sibling;
    return e.subtreeFlags |= r, e.childLanes = n, t
}

function yy(e, t, n) {
    var r = t.pendingProps;
    switch (cc(t), t.tag) {
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
            return Ue(t), null;
        case 1:
            return tt(t.type) && rs(), Ue(t), null;
        case 3:
            return r = t.stateNode, Mr(), me(et), me(He), Cc(), r.pendingContext && (r.context = r.pendingContext, r.pendingContext = null), (e === null || e.child === null) && (po(t) ? t.flags |= 4 : e === null || e.memoizedState.isDehydrated && !(t.flags & 256) || (t.flags |= 1024, kt !== null && (mu(kt), kt = null))), au(e, t), Ue(t), null;
        case 5:
            gc(t);
            var i = Dn(bi.current);
            if (n = t.type, e !== null && t.stateNode != null) Xp(e, t, n, r, i), e.ref !== t.ref && (t.flags |= 512, t.flags |= 2097152);
            else {
                if (!r) {
                    if (t.stateNode === null) throw Error(R(166));
                    return Ue(t), null
                }
                if (e = Dn(Dt.current), po(t)) {
                    r = t.stateNode, n = t.type;
                    var o = t.memoizedProps;
                    switch (r[Lt] = t, r[Fi] = o, e = (t.mode & 1) !== 0, n) {
                        case "dialog":
                            pe("cancel", r), pe("close", r);
                            break;
                        case "iframe":
                        case "object":
                        case "embed":
                            pe("load", r);
                            break;
                        case "video":
                        case "audio":
                            for (i = 0; i < ii.length; i++) pe(ii[i], r);
                            break;
                        case "source":
                            pe("error", r);
                            break;
                        case "img":
                        case "image":
                        case "link":
                            pe("error", r), pe("load", r);
                            break;
                        case "details":
                            pe("toggle", r);
                            break;
                        case "input":
                            kf(r, o), pe("invalid", r);
                            break;
                        case "select":
                            r._wrapperState = {
                                wasMultiple: !!o.multiple
                            }, pe("invalid", r);
                            break;
                        case "textarea":
                            Tf(r, o), pe("invalid", r)
                    }
                    Dl(n, o), i = null;
                    for (var s in o)
                        if (o.hasOwnProperty(s)) {
                            var a = o[s];
                            s === "children" ? typeof a == "string" ? r.textContent !== a && (o.suppressHydrationWarning !== !0 && ho(r.textContent, a, e), i = ["children", a]) : typeof a == "number" && r.textContent !== "" + a && (o.suppressHydrationWarning !== !0 && ho(r.textContent, a, e), i = ["children", "" + a]) : Si.hasOwnProperty(s) && a != null && s === "onScroll" && pe("scroll", r)
                        } switch (n) {
                        case "input":
                            io(r), Ef(r, o, !0);
                            break;
                        case "textarea":
                            io(r), Rf(r);
                            break;
                        case "select":
                        case "option":
                            break;
                        default:
                            typeof o.onClick == "function" && (r.onclick = ns)
                    }
                    r = i, t.updateQueue = r, r !== null && (t.flags |= 4)
                } else {
                    s = i.nodeType === 9 ? i : i.ownerDocument, e === "http://www.w3.org/1999/xhtml" && (e = T1(n)), e === "http://www.w3.org/1999/xhtml" ? n === "script" ? (e = s.createElement("div"), e.innerHTML = "<script><\/script>", e = e.removeChild(e.firstChild)) : typeof r.is == "string" ? e = s.createElement(n, {
                        is: r.is
                    }) : (e = s.createElement(n), n === "select" && (s = e, r.multiple ? s.multiple = !0 : r.size && (s.size = r.size))) : e = s.createElementNS(e, n), e[Lt] = t, e[Fi] = r, Yp(e, t, !1, !1), t.stateNode = e;
                    e: {
                        switch (s = Vl(n, r), n) {
                            case "dialog":
                                pe("cancel", e), pe("close", e), i = r;
                                break;
                            case "iframe":
                            case "object":
                            case "embed":
                                pe("load", e), i = r;
                                break;
                            case "video":
                            case "audio":
                                for (i = 0; i < ii.length; i++) pe(ii[i], e);
                                i = r;
                                break;
                            case "source":
                                pe("error", e), i = r;
                                break;
                            case "img":
                            case "image":
                            case "link":
                                pe("error", e), pe("load", e), i = r;
                                break;
                            case "details":
                                pe("toggle", e), i = r;
                                break;
                            case "input":
                                kf(e, r), i = Ml(e, r), pe("invalid", e);
                                break;
                            case "option":
                                i = r;
                                break;
                            case "select":
                                e._wrapperState = {
                                    wasMultiple: !!r.multiple
                                }, i = Se({}, r, {
                                    value: void 0
                                }), pe("invalid", e);
                                break;
                            case "textarea":
                                Tf(e, r), i = Ll(e, r), pe("invalid", e);
                                break;
                            default:
                                i = r
                        }
                        Dl(n, i),
                        a = i;
                        for (o in a)
                            if (a.hasOwnProperty(o)) {
                                var l = a[o];
                                o === "style" ? M1(e, l) : o === "dangerouslySetInnerHTML" ? (l = l ? l.__html : void 0, l != null && R1(e, l)) : o === "children" ? typeof l == "string" ? (n !== "textarea" || l !== "") && xi(e, l) : typeof l == "number" && xi(e, "" + l) : o !== "suppressContentEditableWarning" && o !== "suppressHydrationWarning" && o !== "autoFocus" && (Si.hasOwnProperty(o) ? l != null && o === "onScroll" && pe("scroll", e) : l != null && Gu(e, o, l, s))
                            } switch (n) {
                            case "input":
                                io(e), Ef(e, r, !1);
                                break;
                            case "textarea":
                                io(e), Rf(e);
                                break;
                            case "option":
                                r.value != null && e.setAttribute("value", "" + Cn(r.value));
                                break;
                            case "select":
                                e.multiple = !!r.multiple, o = r.value, o != null ? gr(e, !!r.multiple, o, !1) : r.defaultValue != null && gr(e, !!r.multiple, r.defaultValue, !0);
                                break;
                            default:
                                typeof i.onClick == "function" && (e.onclick = ns)
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
            return Ue(t), null;
        case 6:
            if (e && t.stateNode != null) Jp(e, t, e.memoizedProps, r);
            else {
                if (typeof r != "string" && t.stateNode === null) throw Error(R(166));
                if (n = Dn(bi.current), Dn(Dt.current), po(t)) {
                    if (r = t.stateNode, n = t.memoizedProps, r[Lt] = t, (o = r.nodeValue !== n) && (e = st, e !== null)) switch (e.tag) {
                        case 3:
                            ho(r.nodeValue, n, (e.mode & 1) !== 0);
                            break;
                        case 5:
                            e.memoizedProps.suppressHydrationWarning !== !0 && ho(r.nodeValue, n, (e.mode & 1) !== 0)
                    }
                    o && (t.flags |= 4)
                } else r = (n.nodeType === 9 ? n : n.ownerDocument).createTextNode(r), r[Lt] = t, t.stateNode = r
            }
            return Ue(t), null;
        case 13:
            if (me(ge), r = t.memoizedState, e === null || e.memoizedState !== null && e.memoizedState.dehydrated !== null) {
                if (ve && ot !== null && t.mode & 1 && !(t.flags & 128)) yp(), Rr(), t.flags |= 98560, o = !1;
                else if (o = po(t), r !== null && r.dehydrated !== null) {
                    if (e === null) {
                        if (!o) throw Error(R(318));
                        if (o = t.memoizedState, o = o !== null ? o.dehydrated : null, !o) throw Error(R(317));
                        o[Lt] = t
                    } else Rr(), !(t.flags & 128) && (t.memoizedState = null), t.flags |= 4;
                    Ue(t), o = !1
                } else kt !== null && (mu(kt), kt = null), o = !0;
                if (!o) return t.flags & 65536 ? t : null
            }
            return t.flags & 128 ? (t.lanes = n, t) : (r = r !== null, r !== (e !== null && e.memoizedState !== null) && r && (t.child.flags |= 8192, t.mode & 1 && (e === null || ge.current & 1 ? Oe === 0 && (Oe = 3) : Fc())), t.updateQueue !== null && (t.flags |= 4), Ue(t), null);
        case 4:
            return Mr(), au(e, t), e === null && Mi(t.stateNode.containerInfo), Ue(t), null;
        case 10:
            return pc(t.type._context), Ue(t), null;
        case 17:
            return tt(t.type) && rs(), Ue(t), null;
        case 19:
            if (me(ge), o = t.memoizedState, o === null) return Ue(t), null;
            if (r = (t.flags & 128) !== 0, s = o.rendering, s === null)
                if (r) Zr(o, !1);
                else {
                    if (Oe !== 0 || e !== null && e.flags & 128)
                        for (e = t.child; e !== null;) {
                            if (s = cs(e), s !== null) {
                                for (t.flags |= 128, Zr(o, !1), r = s.updateQueue, r !== null && (t.updateQueue = r, t.flags |= 4), t.subtreeFlags = 0, r = n, n = t.child; n !== null;) o = n, e = r, o.flags &= 14680066, s = o.alternate, s === null ? (o.childLanes = 0, o.lanes = e, o.child = null, o.subtreeFlags = 0, o.memoizedProps = null, o.memoizedState = null, o.updateQueue = null, o.dependencies = null, o.stateNode = null) : (o.childLanes = s.childLanes, o.lanes = s.lanes, o.child = s.child, o.subtreeFlags = 0, o.deletions = null, o.memoizedProps = s.memoizedProps, o.memoizedState = s.memoizedState, o.updateQueue = s.updateQueue, o.type = s.type, e = s.dependencies, o.dependencies = e === null ? null : {
                                    lanes: e.lanes,
                                    firstContext: e.firstContext
                                }), n = n.sibling;
                                return de(ge, ge.current & 1 | 2), t.child
                            }
                            e = e.sibling
                        }
                    o.tail !== null && Ee() > Fr && (t.flags |= 128, r = !0, Zr(o, !1), t.lanes = 4194304)
                }
            else {
                if (!r)
                    if (e = cs(s), e !== null) {
                        if (t.flags |= 128, r = !0, n = e.updateQueue, n !== null && (t.updateQueue = n, t.flags |= 4), Zr(o, !0), o.tail === null && o.tailMode === "hidden" && !s.alternate && !ve) return Ue(t), null
                    } else 2 * Ee() - o.renderingStartTime > Fr && n !== 1073741824 && (t.flags |= 128, r = !0, Zr(o, !1), t.lanes = 4194304);
                o.isBackwards ? (s.sibling = t.child, t.child = s) : (n = o.last, n !== null ? n.sibling = s : t.child = s, o.last = s)
            }
            return o.tail !== null ? (t = o.tail, o.rendering = t, o.tail = t.sibling, o.renderingStartTime = Ee(), t.sibling = null, n = ge.current, de(ge, r ? n & 1 | 2 : n & 1), t) : (Ue(t), null);
        case 22:
        case 23:
            return Oc(), r = t.memoizedState !== null, e !== null && e.memoizedState !== null !== r && (t.flags |= 8192), r && t.mode & 1 ? it & 1073741824 && (Ue(t), t.subtreeFlags & 6 && (t.flags |= 8192)) : Ue(t), null;
        case 24:
            return null;
        case 25:
            return null
    }
    throw Error(R(156, t.tag))
}

function vy(e, t) {
    switch (cc(t), t.tag) {
        case 1:
            return tt(t.type) && rs(), e = t.flags, e & 65536 ? (t.flags = e & -65537 | 128, t) : null;
        case 3:
            return Mr(), me(et), me(He), Cc(), e = t.flags, e & 65536 && !(e & 128) ? (t.flags = e & -65537 | 128, t) : null;
        case 5:
            return gc(t), null;
        case 13:
            if (me(ge), e = t.memoizedState, e !== null && e.dehydrated !== null) {
                if (t.alternate === null) throw Error(R(340));
                Rr()
            }
            return e = t.flags, e & 65536 ? (t.flags = e & -65537 | 128, t) : null;
        case 19:
            return me(ge), null;
        case 4:
            return Mr(), null;
        case 10:
            return pc(t.type._context), null;
        case 22:
        case 23:
            return Oc(), null;
        case 24:
            return null;
        default:
            return null
    }
}
var vo = !1,
    Qe = !1,
    gy = typeof WeakSet == "function" ? WeakSet : Set,
    V = null;

function cr(e, t) {
    var n = e.ref;
    if (n !== null)
        if (typeof n == "function") try {
            n(null)
        } catch (r) {
            xe(e, t, r)
        } else n.current = null
}

function lu(e, t, n) {
    try {
        n()
    } catch (r) {
        xe(e, t, r)
    }
}
var yd = !1;

function Cy(e, t) {
    if (Hl = Jo, e = rp(), lc(e)) {
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
                    a = -1,
                    l = -1,
                    u = 0,
                    c = 0,
                    f = e,
                    d = null;
                t: for (;;) {
                    for (var p; f !== n || i !== 0 && f.nodeType !== 3 || (a = s + i), f !== o || r !== 0 && f.nodeType !== 3 || (l = s + r), f.nodeType === 3 && (s += f.nodeValue.length), (p = f.firstChild) !== null;) d = f, f = p;
                    for (;;) {
                        if (f === e) break t;
                        if (d === n && ++u === i && (a = s), d === o && ++c === r && (l = s), (p = f.nextSibling) !== null) break;
                        f = d, d = f.parentNode
                    }
                    f = p
                }
                n = a === -1 || l === -1 ? null : {
                    start: a,
                    end: l
                }
            } else n = null
        }
        n = n || {
            start: 0,
            end: 0
        }
    } else n = null;
    for (Wl = {
            focusedElem: e,
            selectionRange: n
        }, Jo = !1, V = t; V !== null;)
        if (t = V, e = t.child, (t.subtreeFlags & 1028) !== 0 && e !== null) e.return = t, V = e;
        else
            for (; V !== null;) {
                t = V;
                try {
                    var y = t.alternate;
                    if (t.flags & 1024) switch (t.tag) {
                        case 0:
                        case 11:
                        case 15:
                            break;
                        case 1:
                            if (y !== null) {
                                var g = y.memoizedProps,
                                    x = y.memoizedState,
                                    v = t.stateNode,
                                    h = v.getSnapshotBeforeUpdate(t.elementType === t.type ? g : xt(t.type, g), x);
                                v.__reactInternalSnapshotBeforeUpdate = h
                            }
                            break;
                        case 3:
                            var m = t.stateNode.containerInfo;
                            m.nodeType === 1 ? m.textContent = "" : m.nodeType === 9 && m.documentElement && m.removeChild(m.documentElement);
                            break;
                        case 5:
                        case 6:
                        case 4:
                        case 17:
                            break;
                        default:
                            throw Error(R(163))
                    }
                } catch (C) {
                    xe(t, t.return, C)
                }
                if (e = t.sibling, e !== null) {
                    e.return = t.return, V = e;
                    break
                }
                V = t.return
            }
    return y = yd, yd = !1, y
}

function di(e, t, n) {
    var r = t.updateQueue;
    if (r = r !== null ? r.lastEffect : null, r !== null) {
        var i = r = r.next;
        do {
            if ((i.tag & e) === e) {
                var o = i.destroy;
                i.destroy = void 0, o !== void 0 && lu(t, n, o)
            }
            i = i.next
        } while (i !== r)
    }
}

function Qs(e, t) {
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

function uu(e) {
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

function e0(e) {
    var t = e.alternate;
    t !== null && (e.alternate = null, e0(t)), e.child = null, e.deletions = null, e.sibling = null, e.tag === 5 && (t = e.stateNode, t !== null && (delete t[Lt], delete t[Fi], delete t[Gl], delete t[ty], delete t[ny])), e.stateNode = null, e.return = null, e.dependencies = null, e.memoizedProps = null, e.memoizedState = null, e.pendingProps = null, e.stateNode = null, e.updateQueue = null
}

function t0(e) {
    return e.tag === 5 || e.tag === 3 || e.tag === 4
}

function vd(e) {
    e: for (;;) {
        for (; e.sibling === null;) {
            if (e.return === null || t0(e.return)) return null;
            e = e.return
        }
        for (e.sibling.return = e.return, e = e.sibling; e.tag !== 5 && e.tag !== 6 && e.tag !== 18;) {
            if (e.flags & 2 || e.child === null || e.tag === 4) continue e;
            e.child.return = e, e = e.child
        }
        if (!(e.flags & 2)) return e.stateNode
    }
}

function cu(e, t, n) {
    var r = e.tag;
    if (r === 5 || r === 6) e = e.stateNode, t ? n.nodeType === 8 ? n.parentNode.insertBefore(e, t) : n.insertBefore(e, t) : (n.nodeType === 8 ? (t = n.parentNode, t.insertBefore(e, n)) : (t = n, t.appendChild(e)), n = n._reactRootContainer, n != null || t.onclick !== null || (t.onclick = ns));
    else if (r !== 4 && (e = e.child, e !== null))
        for (cu(e, t, n), e = e.sibling; e !== null;) cu(e, t, n), e = e.sibling
}

function fu(e, t, n) {
    var r = e.tag;
    if (r === 5 || r === 6) e = e.stateNode, t ? n.insertBefore(e, t) : n.appendChild(e);
    else if (r !== 4 && (e = e.child, e !== null))
        for (fu(e, t, n), e = e.sibling; e !== null;) fu(e, t, n), e = e.sibling
}
var Ie = null,
    Pt = !1;

function Yt(e, t, n) {
    for (n = n.child; n !== null;) n0(e, t, n), n = n.sibling
}

function n0(e, t, n) {
    if (bt && typeof bt.onCommitFiberUnmount == "function") try {
        bt.onCommitFiberUnmount(_s, n)
    } catch {}
    switch (n.tag) {
        case 5:
            Qe || cr(n, t);
        case 6:
            var r = Ie,
                i = Pt;
            Ie = null, Yt(e, t, n), Ie = r, Pt = i, Ie !== null && (Pt ? (e = Ie, n = n.stateNode, e.nodeType === 8 ? e.parentNode.removeChild(n) : e.removeChild(n)) : Ie.removeChild(n.stateNode));
            break;
        case 18:
            Ie !== null && (Pt ? (e = Ie, n = n.stateNode, e.nodeType === 8 ? Ka(e.parentNode, n) : e.nodeType === 1 && Ka(e, n), Ti(e)) : Ka(Ie, n.stateNode));
            break;
        case 4:
            r = Ie, i = Pt, Ie = n.stateNode.containerInfo, Pt = !0, Yt(e, t, n), Ie = r, Pt = i;
            break;
        case 0:
        case 11:
        case 14:
        case 15:
            if (!Qe && (r = n.updateQueue, r !== null && (r = r.lastEffect, r !== null))) {
                i = r = r.next;
                do {
                    var o = i,
                        s = o.destroy;
                    o = o.tag, s !== void 0 && (o & 2 || o & 4) && lu(n, t, s), i = i.next
                } while (i !== r)
            }
            Yt(e, t, n);
            break;
        case 1:
            if (!Qe && (cr(n, t), r = n.stateNode, typeof r.componentWillUnmount == "function")) try {
                r.props = n.memoizedProps, r.state = n.memoizedState, r.componentWillUnmount()
            } catch (a) {
                xe(n, t, a)
            }
            Yt(e, t, n);
            break;
        case 21:
            Yt(e, t, n);
            break;
        case 22:
            n.mode & 1 ? (Qe = (r = Qe) || n.memoizedState !== null, Yt(e, t, n), Qe = r) : Yt(e, t, n);
            break;
        default:
            Yt(e, t, n)
    }
}

function gd(e) {
    var t = e.updateQueue;
    if (t !== null) {
        e.updateQueue = null;
        var n = e.stateNode;
        n === null && (n = e.stateNode = new gy), t.forEach(function(r) {
            var i = Ay.bind(null, e, r);
            n.has(r) || (n.add(r), r.then(i, i))
        })
    }
}

function St(e, t) {
    var n = t.deletions;
    if (n !== null)
        for (var r = 0; r < n.length; r++) {
            var i = n[r];
            try {
                var o = e,
                    s = t,
                    a = s;
                e: for (; a !== null;) {
                    switch (a.tag) {
                        case 5:
                            Ie = a.stateNode, Pt = !1;
                            break e;
                        case 3:
                            Ie = a.stateNode.containerInfo, Pt = !0;
                            break e;
                        case 4:
                            Ie = a.stateNode.containerInfo, Pt = !0;
                            break e
                    }
                    a = a.return
                }
                if (Ie === null) throw Error(R(160));
                n0(o, s, i), Ie = null, Pt = !1;
                var l = i.alternate;
                l !== null && (l.return = null), i.return = null
            } catch (u) {
                xe(i, t, u)
            }
        }
    if (t.subtreeFlags & 12854)
        for (t = t.child; t !== null;) r0(t, e), t = t.sibling
}

function r0(e, t) {
    var n = e.alternate,
        r = e.flags;
    switch (e.tag) {
        case 0:
        case 11:
        case 14:
        case 15:
            if (St(t, e), Mt(e), r & 4) {
                try {
                    di(3, e, e.return), Qs(3, e)
                } catch (g) {
                    xe(e, e.return, g)
                }
                try {
                    di(5, e, e.return)
                } catch (g) {
                    xe(e, e.return, g)
                }
            }
            break;
        case 1:
            St(t, e), Mt(e), r & 512 && n !== null && cr(n, n.return);
            break;
        case 5:
            if (St(t, e), Mt(e), r & 512 && n !== null && cr(n, n.return), e.flags & 32) {
                var i = e.stateNode;
                try {
                    xi(i, "")
                } catch (g) {
                    xe(e, e.return, g)
                }
            }
            if (r & 4 && (i = e.stateNode, i != null)) {
                var o = e.memoizedProps,
                    s = n !== null ? n.memoizedProps : o,
                    a = e.type,
                    l = e.updateQueue;
                if (e.updateQueue = null, l !== null) try {
                    a === "input" && o.type === "radio" && o.name != null && k1(i, o), Vl(a, s);
                    var u = Vl(a, o);
                    for (s = 0; s < l.length; s += 2) {
                        var c = l[s],
                            f = l[s + 1];
                        c === "style" ? M1(i, f) : c === "dangerouslySetInnerHTML" ? R1(i, f) : c === "children" ? xi(i, f) : Gu(i, c, f, u)
                    }
                    switch (a) {
                        case "input":
                            Ol(i, o);
                            break;
                        case "textarea":
                            E1(i, o);
                            break;
                        case "select":
                            var d = i._wrapperState.wasMultiple;
                            i._wrapperState.wasMultiple = !!o.multiple;
                            var p = o.value;
                            p != null ? gr(i, !!o.multiple, p, !1) : d !== !!o.multiple && (o.defaultValue != null ? gr(i, !!o.multiple, o.defaultValue, !0) : gr(i, !!o.multiple, o.multiple ? [] : "", !1))
                    }
                    i[Fi] = o
                } catch (g) {
                    xe(e, e.return, g)
                }
            }
            break;
        case 6:
            if (St(t, e), Mt(e), r & 4) {
                if (e.stateNode === null) throw Error(R(162));
                i = e.stateNode, o = e.memoizedProps;
                try {
                    i.nodeValue = o
                } catch (g) {
                    xe(e, e.return, g)
                }
            }
            break;
        case 3:
            if (St(t, e), Mt(e), r & 4 && n !== null && n.memoizedState.isDehydrated) try {
                Ti(t.containerInfo)
            } catch (g) {
                xe(e, e.return, g)
            }
            break;
        case 4:
            St(t, e), Mt(e);
            break;
        case 13:
            St(t, e), Mt(e), i = e.child, i.flags & 8192 && (o = i.memoizedState !== null, i.stateNode.isHidden = o, !o || i.alternate !== null && i.alternate.memoizedState !== null || (Ac = Ee())), r & 4 && gd(e);
            break;
        case 22:
            if (c = n !== null && n.memoizedState !== null, e.mode & 1 ? (Qe = (u = Qe) || c, St(t, e), Qe = u) : St(t, e), Mt(e), r & 8192) {
                if (u = e.memoizedState !== null, (e.stateNode.isHidden = u) && !c && e.mode & 1)
                    for (V = e, c = e.child; c !== null;) {
                        for (f = V = c; V !== null;) {
                            switch (d = V, p = d.child, d.tag) {
                                case 0:
                                case 11:
                                case 14:
                                case 15:
                                    di(4, d, d.return);
                                    break;
                                case 1:
                                    cr(d, d.return);
                                    var y = d.stateNode;
                                    if (typeof y.componentWillUnmount == "function") {
                                        r = d, n = d.return;
                                        try {
                                            t = r, y.props = t.memoizedProps, y.state = t.memoizedState, y.componentWillUnmount()
                                        } catch (g) {
                                            xe(r, n, g)
                                        }
                                    }
                                    break;
                                case 5:
                                    cr(d, d.return);
                                    break;
                                case 22:
                                    if (d.memoizedState !== null) {
                                        wd(f);
                                        continue
                                    }
                            }
                            p !== null ? (p.return = d, V = p) : wd(f)
                        }
                        c = c.sibling
                    }
                e: for (c = null, f = e;;) {
                    if (f.tag === 5) {
                        if (c === null) {
                            c = f;
                            try {
                                i = f.stateNode, u ? (o = i.style, typeof o.setProperty == "function" ? o.setProperty("display", "none", "important") : o.display = "none") : (a = f.stateNode, l = f.memoizedProps.style, s = l != null && l.hasOwnProperty("display") ? l.display : null, a.style.display = A1("display", s))
                            } catch (g) {
                                xe(e, e.return, g)
                            }
                        }
                    } else if (f.tag === 6) {
                        if (c === null) try {
                            f.stateNode.nodeValue = u ? "" : f.memoizedProps
                        } catch (g) {
                            xe(e, e.return, g)
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
            St(t, e), Mt(e), r & 4 && gd(e);
            break;
        case 21:
            break;
        default:
            St(t, e), Mt(e)
    }
}

function Mt(e) {
    var t = e.flags;
    if (t & 2) {
        try {
            e: {
                for (var n = e.return; n !== null;) {
                    if (t0(n)) {
                        var r = n;
                        break e
                    }
                    n = n.return
                }
                throw Error(R(160))
            }
            switch (r.tag) {
                case 5:
                    var i = r.stateNode;
                    r.flags & 32 && (xi(i, ""), r.flags &= -33);
                    var o = vd(e);
                    fu(e, o, i);
                    break;
                case 3:
                case 4:
                    var s = r.stateNode.containerInfo,
                        a = vd(e);
                    cu(e, a, s);
                    break;
                default:
                    throw Error(R(161))
            }
        }
        catch (l) {
            xe(e, e.return, l)
        }
        e.flags &= -3
    }
    t & 4096 && (e.flags &= -4097)
}

function wy(e, t, n) {
    V = e, i0(e)
}

function i0(e, t, n) {
    for (var r = (e.mode & 1) !== 0; V !== null;) {
        var i = V,
            o = i.child;
        if (i.tag === 22 && r) {
            var s = i.memoizedState !== null || vo;
            if (!s) {
                var a = i.alternate,
                    l = a !== null && a.memoizedState !== null || Qe;
                a = vo;
                var u = Qe;
                if (vo = s, (Qe = l) && !u)
                    for (V = i; V !== null;) s = V, l = s.child, s.tag === 22 && s.memoizedState !== null ? Sd(i) : l !== null ? (l.return = s, V = l) : Sd(i);
                for (; o !== null;) V = o, i0(o), o = o.sibling;
                V = i, vo = a, Qe = u
            }
            Cd(e)
        } else i.subtreeFlags & 8772 && o !== null ? (o.return = i, V = o) : Cd(e)
    }
}

function Cd(e) {
    for (; V !== null;) {
        var t = V;
        if (t.flags & 8772) {
            var n = t.alternate;
            try {
                if (t.flags & 8772) switch (t.tag) {
                    case 0:
                    case 11:
                    case 15:
                        Qe || Qs(5, t);
                        break;
                    case 1:
                        var r = t.stateNode;
                        if (t.flags & 4 && !Qe)
                            if (n === null) r.componentDidMount();
                            else {
                                var i = t.elementType === t.type ? n.memoizedProps : xt(t.type, n.memoizedProps);
                                r.componentDidUpdate(i, n.memoizedState, r.__reactInternalSnapshotBeforeUpdate)
                            } var o = t.updateQueue;
                        o !== null && nd(t, o, r);
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
                            nd(t, s, n)
                        }
                        break;
                    case 5:
                        var a = t.stateNode;
                        if (n === null && t.flags & 4) {
                            n = a;
                            var l = t.memoizedProps;
                            switch (t.type) {
                                case "button":
                                case "input":
                                case "select":
                                case "textarea":
                                    l.autoFocus && n.focus();
                                    break;
                                case "img":
                                    l.src && (n.src = l.src)
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
                                    f !== null && Ti(f)
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
                        throw Error(R(163))
                }
                Qe || t.flags & 512 && uu(t)
            } catch (d) {
                xe(t, t.return, d)
            }
        }
        if (t === e) {
            V = null;
            break
        }
        if (n = t.sibling, n !== null) {
            n.return = t.return, V = n;
            break
        }
        V = t.return
    }
}

function wd(e) {
    for (; V !== null;) {
        var t = V;
        if (t === e) {
            V = null;
            break
        }
        var n = t.sibling;
        if (n !== null) {
            n.return = t.return, V = n;
            break
        }
        V = t.return
    }
}

function Sd(e) {
    for (; V !== null;) {
        var t = V;
        try {
            switch (t.tag) {
                case 0:
                case 11:
                case 15:
                    var n = t.return;
                    try {
                        Qs(4, t)
                    } catch (l) {
                        xe(t, n, l)
                    }
                    break;
                case 1:
                    var r = t.stateNode;
                    if (typeof r.componentDidMount == "function") {
                        var i = t.return;
                        try {
                            r.componentDidMount()
                        } catch (l) {
                            xe(t, i, l)
                        }
                    }
                    var o = t.return;
                    try {
                        uu(t)
                    } catch (l) {
                        xe(t, o, l)
                    }
                    break;
                case 5:
                    var s = t.return;
                    try {
                        uu(t)
                    } catch (l) {
                        xe(t, s, l)
                    }
            }
        } catch (l) {
            xe(t, t.return, l)
        }
        if (t === e) {
            V = null;
            break
        }
        var a = t.sibling;
        if (a !== null) {
            a.return = t.return, V = a;
            break
        }
        V = t.return
    }
}
var Sy = Math.ceil,
    hs = Gt.ReactCurrentDispatcher,
    Tc = Gt.ReactCurrentOwner,
    yt = Gt.ReactCurrentBatchConfig,
    te = 0,
    be = null,
    Ae = null,
    Ne = 0,
    it = 0,
    fr = kn(0),
    Oe = 0,
    Ii = null,
    Bn = 0,
    Hs = 0,
    Rc = 0,
    hi = null,
    Xe = null,
    Ac = 0,
    Fr = 1 / 0,
    _t = null,
    ps = !1,
    du = null,
    hn = null,
    go = !1,
    an = null,
    ms = 0,
    pi = 0,
    hu = null,
    Io = -1,
    $o = 0;

function qe() {
    return te & 6 ? Ee() : Io !== -1 ? Io : Io = Ee()
}

function pn(e) {
    return e.mode & 1 ? te & 2 && Ne !== 0 ? Ne & -Ne : iy.transition !== null ? ($o === 0 && ($o = z1()), $o) : (e = se, e !== 0 || (e = window.event, e = e === void 0 ? 16 : q1(e.type)), e) : 1
}

function Rt(e, t, n, r) {
    if (50 < pi) throw pi = 0, hu = null, Error(R(185));
    Qi(e, n, r), (!(te & 2) || e !== be) && (e === be && (!(te & 2) && (Hs |= n), Oe === 4 && on(e, Ne)), nt(e, r), n === 1 && te === 0 && !(t.mode & 1) && (Fr = Ee() + 500, zs && En()))
}

function nt(e, t) {
    var n = e.callbackNode;
    i3(e, t);
    var r = Xo(e, e === be ? Ne : 0);
    if (r === 0) n !== null && Of(n), e.callbackNode = null, e.callbackPriority = 0;
    else if (t = r & -r, e.callbackPriority !== t) {
        if (n != null && Of(n), t === 1) e.tag === 0 ? ry(xd.bind(null, e)) : hp(xd.bind(null, e)), J3(function() {
            !(te & 6) && En()
        }), n = null;
        else {
            switch (B1(r)) {
                case 1:
                    n = ec;
                    break;
                case 4:
                    n = N1;
                    break;
                case 16:
                    n = Yo;
                    break;
                case 536870912:
                    n = j1;
                    break;
                default:
                    n = Yo
            }
            n = d0(n, o0.bind(null, e))
        }
        e.callbackPriority = t, e.callbackNode = n
    }
}

function o0(e, t) {
    if (Io = -1, $o = 0, te & 6) throw Error(R(327));
    var n = e.callbackNode;
    if (Pr() && e.callbackNode !== n) return null;
    var r = Xo(e, e === be ? Ne : 0);
    if (r === 0) return null;
    if (r & 30 || r & e.expiredLanes || t) t = ys(e, r);
    else {
        t = r;
        var i = te;
        te |= 2;
        var o = a0();
        (be !== e || Ne !== t) && (_t = null, Fr = Ee() + 500, In(e, t));
        do try {
            ky();
            break
        } catch (a) {
            s0(e, a)
        }
        while (1);
        hc(), hs.current = o, te = i, Ae !== null ? t = 0 : (be = null, Ne = 0, t = Oe)
    }
    if (t !== 0) {
        if (t === 2 && (i = jl(e), i !== 0 && (r = i, t = pu(e, i))), t === 1) throw n = Ii, In(e, 0), on(e, r), nt(e, Ee()), n;
        if (t === 6) on(e, r);
        else {
            if (i = e.current.alternate, !(r & 30) && !xy(i) && (t = ys(e, r), t === 2 && (o = jl(e), o !== 0 && (r = o, t = pu(e, o))), t === 1)) throw n = Ii, In(e, 0), on(e, r), nt(e, Ee()), n;
            switch (e.finishedWork = i, e.finishedLanes = r, t) {
                case 0:
                case 1:
                    throw Error(R(345));
                case 2:
                    Mn(e, Xe, _t);
                    break;
                case 3:
                    if (on(e, r), (r & 130023424) === r && (t = Ac + 500 - Ee(), 10 < t)) {
                        if (Xo(e, 0) !== 0) break;
                        if (i = e.suspendedLanes, (i & r) !== r) {
                            qe(), e.pingedLanes |= e.suspendedLanes & i;
                            break
                        }
                        e.timeoutHandle = ql(Mn.bind(null, e, Xe, _t), t);
                        break
                    }
                    Mn(e, Xe, _t);
                    break;
                case 4:
                    if (on(e, r), (r & 4194240) === r) break;
                    for (t = e.eventTimes, i = -1; 0 < r;) {
                        var s = 31 - Tt(r);
                        o = 1 << s, s = t[s], s > i && (i = s), r &= ~o
                    }
                    if (r = i, r = Ee() - r, r = (120 > r ? 120 : 480 > r ? 480 : 1080 > r ? 1080 : 1920 > r ? 1920 : 3e3 > r ? 3e3 : 4320 > r ? 4320 : 1960 * Sy(r / 1960)) - r, 10 < r) {
                        e.timeoutHandle = ql(Mn.bind(null, e, Xe, _t), r);
                        break
                    }
                    Mn(e, Xe, _t);
                    break;
                case 5:
                    Mn(e, Xe, _t);
                    break;
                default:
                    throw Error(R(329))
            }
        }
    }
    return nt(e, Ee()), e.callbackNode === n ? o0.bind(null, e) : null
}

function pu(e, t) {
    var n = hi;
    return e.current.memoizedState.isDehydrated && (In(e, t).flags |= 256), e = ys(e, t), e !== 2 && (t = Xe, Xe = n, t !== null && mu(t)), e
}

function mu(e) {
    Xe === null ? Xe = e : Xe.push.apply(Xe, e)
}

function xy(e) {
    for (var t = e;;) {
        if (t.flags & 16384) {
            var n = t.updateQueue;
            if (n !== null && (n = n.stores, n !== null))
                for (var r = 0; r < n.length; r++) {
                    var i = n[r],
                        o = i.getSnapshot;
                    i = i.value;
                    try {
                        if (!At(o(), i)) return !1
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

function on(e, t) {
    for (t &= ~Rc, t &= ~Hs, e.suspendedLanes |= t, e.pingedLanes &= ~t, e = e.expirationTimes; 0 < t;) {
        var n = 31 - Tt(t),
            r = 1 << n;
        e[n] = -1, t &= ~r
    }
}

function xd(e) {
    if (te & 6) throw Error(R(327));
    Pr();
    var t = Xo(e, 0);
    if (!(t & 1)) return nt(e, Ee()), null;
    var n = ys(e, t);
    if (e.tag !== 0 && n === 2) {
        var r = jl(e);
        r !== 0 && (t = r, n = pu(e, r))
    }
    if (n === 1) throw n = Ii, In(e, 0), on(e, t), nt(e, Ee()), n;
    if (n === 6) throw Error(R(345));
    return e.finishedWork = e.current.alternate, e.finishedLanes = t, Mn(e, Xe, _t), nt(e, Ee()), null
}

function Mc(e, t) {
    var n = te;
    te |= 1;
    try {
        return e(t)
    } finally {
        te = n, te === 0 && (Fr = Ee() + 500, zs && En())
    }
}

function Un(e) {
    an !== null && an.tag === 0 && !(te & 6) && Pr();
    var t = te;
    te |= 1;
    var n = yt.transition,
        r = se;
    try {
        if (yt.transition = null, se = 1, e) return e()
    } finally {
        se = r, yt.transition = n, te = t, !(te & 6) && En()
    }
}

function Oc() {
    it = fr.current, me(fr)
}

function In(e, t) {
    e.finishedWork = null, e.finishedLanes = 0;
    var n = e.timeoutHandle;
    if (n !== -1 && (e.timeoutHandle = -1, X3(n)), Ae !== null)
        for (n = Ae.return; n !== null;) {
            var r = n;
            switch (cc(r), r.tag) {
                case 1:
                    r = r.type.childContextTypes, r != null && rs();
                    break;
                case 3:
                    Mr(), me(et), me(He), Cc();
                    break;
                case 5:
                    gc(r);
                    break;
                case 4:
                    Mr();
                    break;
                case 13:
                    me(ge);
                    break;
                case 19:
                    me(ge);
                    break;
                case 10:
                    pc(r.type._context);
                    break;
                case 22:
                case 23:
                    Oc()
            }
            n = n.return
        }
    if (be = e, Ae = e = mn(e.current, null), Ne = it = t, Oe = 0, Ii = null, Rc = Hs = Bn = 0, Xe = hi = null, bn !== null) {
        for (t = 0; t < bn.length; t++)
            if (n = bn[t], r = n.interleaved, r !== null) {
                n.interleaved = null;
                var i = r.next,
                    o = n.pending;
                if (o !== null) {
                    var s = o.next;
                    o.next = i, r.next = s
                }
                n.pending = r
            } bn = null
    }
    return e
}

function s0(e, t) {
    do {
        var n = Ae;
        try {
            if (hc(), Do.current = ds, fs) {
                for (var r = we.memoizedState; r !== null;) {
                    var i = r.queue;
                    i !== null && (i.pending = null), r = r.next
                }
                fs = !1
            }
            if (zn = 0, Le = Me = we = null, fi = !1, Di = 0, Tc.current = null, n === null || n.return === null) {
                Oe = 1, Ii = t, Ae = null;
                break
            }
            e: {
                var o = e,
                    s = n.return,
                    a = n,
                    l = t;
                if (t = Ne, a.flags |= 32768, l !== null && typeof l == "object" && typeof l.then == "function") {
                    var u = l,
                        c = a,
                        f = c.tag;
                    if (!(c.mode & 1) && (f === 0 || f === 11 || f === 15)) {
                        var d = c.alternate;
                        d ? (c.updateQueue = d.updateQueue, c.memoizedState = d.memoizedState, c.lanes = d.lanes) : (c.updateQueue = null, c.memoizedState = null)
                    }
                    var p = ud(s);
                    if (p !== null) {
                        p.flags &= -257, cd(p, s, a, o, t), p.mode & 1 && ld(o, u, t), t = p, l = u;
                        var y = t.updateQueue;
                        if (y === null) {
                            var g = new Set;
                            g.add(l), t.updateQueue = g
                        } else y.add(l);
                        break e
                    } else {
                        if (!(t & 1)) {
                            ld(o, u, t), Fc();
                            break e
                        }
                        l = Error(R(426))
                    }
                } else if (ve && a.mode & 1) {
                    var x = ud(s);
                    if (x !== null) {
                        !(x.flags & 65536) && (x.flags |= 256), cd(x, s, a, o, t), fc(Or(l, a));
                        break e
                    }
                }
                o = l = Or(l, a),
                Oe !== 4 && (Oe = 2),
                hi === null ? hi = [o] : hi.push(o),
                o = s;do {
                    switch (o.tag) {
                        case 3:
                            o.flags |= 65536, t &= -t, o.lanes |= t;
                            var v = Up(o, l, t);
                            td(o, v);
                            break e;
                        case 1:
                            a = l;
                            var h = o.type,
                                m = o.stateNode;
                            if (!(o.flags & 128) && (typeof h.getDerivedStateFromError == "function" || m !== null && typeof m.componentDidCatch == "function" && (hn === null || !hn.has(m)))) {
                                o.flags |= 65536, t &= -t, o.lanes |= t;
                                var C = Qp(o, a, t);
                                td(o, C);
                                break e
                            }
                    }
                    o = o.return
                } while (o !== null)
            }
            u0(n)
        } catch (S) {
            t = S, Ae === n && n !== null && (Ae = n = n.return);
            continue
        }
        break
    } while (1)
}

function a0() {
    var e = hs.current;
    return hs.current = ds, e === null ? ds : e
}

function Fc() {
    (Oe === 0 || Oe === 3 || Oe === 2) && (Oe = 4), be === null || !(Bn & 268435455) && !(Hs & 268435455) || on(be, Ne)
}

function ys(e, t) {
    var n = te;
    te |= 2;
    var r = a0();
    (be !== e || Ne !== t) && (_t = null, In(e, t));
    do try {
        Py();
        break
    } catch (i) {
        s0(e, i)
    }
    while (1);
    if (hc(), te = n, hs.current = r, Ae !== null) throw Error(R(261));
    return be = null, Ne = 0, Oe
}

function Py() {
    for (; Ae !== null;) l0(Ae)
}

function ky() {
    for (; Ae !== null && !G2();) l0(Ae)
}

function l0(e) {
    var t = f0(e.alternate, e, it);
    e.memoizedProps = e.pendingProps, t === null ? u0(e) : Ae = t, Tc.current = null
}

function u0(e) {
    var t = e;
    do {
        var n = t.alternate;
        if (e = t.return, t.flags & 32768) {
            if (n = vy(n, t), n !== null) {
                n.flags &= 32767, Ae = n;
                return
            }
            if (e !== null) e.flags |= 32768, e.subtreeFlags = 0, e.deletions = null;
            else {
                Oe = 6, Ae = null;
                return
            }
        } else if (n = yy(n, t, it), n !== null) {
            Ae = n;
            return
        }
        if (t = t.sibling, t !== null) {
            Ae = t;
            return
        }
        Ae = t = e
    } while (t !== null);
    Oe === 0 && (Oe = 5)
}

function Mn(e, t, n) {
    var r = se,
        i = yt.transition;
    try {
        yt.transition = null, se = 1, Ey(e, t, n, r)
    } finally {
        yt.transition = i, se = r
    }
    return null
}

function Ey(e, t, n, r) {
    do Pr(); while (an !== null);
    if (te & 6) throw Error(R(327));
    n = e.finishedWork;
    var i = e.finishedLanes;
    if (n === null) return null;
    if (e.finishedWork = null, e.finishedLanes = 0, n === e.current) throw Error(R(177));
    e.callbackNode = null, e.callbackPriority = 0;
    var o = n.lanes | n.childLanes;
    if (o3(e, o), e === be && (Ae = be = null, Ne = 0), !(n.subtreeFlags & 2064) && !(n.flags & 2064) || go || (go = !0, d0(Yo, function() {
            return Pr(), null
        })), o = (n.flags & 15990) !== 0, n.subtreeFlags & 15990 || o) {
        o = yt.transition, yt.transition = null;
        var s = se;
        se = 1;
        var a = te;
        te |= 4, Tc.current = null, Cy(e, n), r0(n, e), H3(Wl), Jo = !!Hl, Wl = Hl = null, e.current = n, wy(n), Z2(), te = a, se = s, yt.transition = o
    } else e.current = n;
    if (go && (go = !1, an = e, ms = i), o = e.pendingLanes, o === 0 && (hn = null), J2(n.stateNode), nt(e, Ee()), t !== null)
        for (r = e.onRecoverableError, n = 0; n < t.length; n++) i = t[n], r(i.value, {
            componentStack: i.stack,
            digest: i.digest
        });
    if (ps) throw ps = !1, e = du, du = null, e;
    return ms & 1 && e.tag !== 0 && Pr(), o = e.pendingLanes, o & 1 ? e === hu ? pi++ : (pi = 0, hu = e) : pi = 0, En(), null
}

function Pr() {
    if (an !== null) {
        var e = B1(ms),
            t = yt.transition,
            n = se;
        try {
            if (yt.transition = null, se = 16 > e ? 16 : e, an === null) var r = !1;
            else {
                if (e = an, an = null, ms = 0, te & 6) throw Error(R(331));
                var i = te;
                for (te |= 4, V = e.current; V !== null;) {
                    var o = V,
                        s = o.child;
                    if (V.flags & 16) {
                        var a = o.deletions;
                        if (a !== null) {
                            for (var l = 0; l < a.length; l++) {
                                var u = a[l];
                                for (V = u; V !== null;) {
                                    var c = V;
                                    switch (c.tag) {
                                        case 0:
                                        case 11:
                                        case 15:
                                            di(8, c, o)
                                    }
                                    var f = c.child;
                                    if (f !== null) f.return = c, V = f;
                                    else
                                        for (; V !== null;) {
                                            c = V;
                                            var d = c.sibling,
                                                p = c.return;
                                            if (e0(c), c === u) {
                                                V = null;
                                                break
                                            }
                                            if (d !== null) {
                                                d.return = p, V = d;
                                                break
                                            }
                                            V = p
                                        }
                                }
                            }
                            var y = o.alternate;
                            if (y !== null) {
                                var g = y.child;
                                if (g !== null) {
                                    y.child = null;
                                    do {
                                        var x = g.sibling;
                                        g.sibling = null, g = x
                                    } while (g !== null)
                                }
                            }
                            V = o
                        }
                    }
                    if (o.subtreeFlags & 2064 && s !== null) s.return = o, V = s;
                    else e: for (; V !== null;) {
                        if (o = V, o.flags & 2048) switch (o.tag) {
                            case 0:
                            case 11:
                            case 15:
                                di(9, o, o.return)
                        }
                        var v = o.sibling;
                        if (v !== null) {
                            v.return = o.return, V = v;
                            break e
                        }
                        V = o.return
                    }
                }
                var h = e.current;
                for (V = h; V !== null;) {
                    s = V;
                    var m = s.child;
                    if (s.subtreeFlags & 2064 && m !== null) m.return = s, V = m;
                    else e: for (s = h; V !== null;) {
                        if (a = V, a.flags & 2048) try {
                            switch (a.tag) {
                                case 0:
                                case 11:
                                case 15:
                                    Qs(9, a)
                            }
                        } catch (S) {
                            xe(a, a.return, S)
                        }
                        if (a === s) {
                            V = null;
                            break e
                        }
                        var C = a.sibling;
                        if (C !== null) {
                            C.return = a.return, V = C;
                            break e
                        }
                        V = a.return
                    }
                }
                if (te = i, En(), bt && typeof bt.onPostCommitFiberRoot == "function") try {
                    bt.onPostCommitFiberRoot(_s, e)
                } catch {}
                r = !0
            }
            return r
        } finally {
            se = n, yt.transition = t
        }
    }
    return !1
}

function Pd(e, t, n) {
    t = Or(n, t), t = Up(e, t, 1), e = dn(e, t, 1), t = qe(), e !== null && (Qi(e, 1, t), nt(e, t))
}

function xe(e, t, n) {
    if (e.tag === 3) Pd(e, e, n);
    else
        for (; t !== null;) {
            if (t.tag === 3) {
                Pd(t, e, n);
                break
            } else if (t.tag === 1) {
                var r = t.stateNode;
                if (typeof t.type.getDerivedStateFromError == "function" || typeof r.componentDidCatch == "function" && (hn === null || !hn.has(r))) {
                    e = Or(n, e), e = Qp(t, e, 1), t = dn(t, e, 1), e = qe(), t !== null && (Qi(t, 1, e), nt(t, e));
                    break
                }
            }
            t = t.return
        }
}

function Ty(e, t, n) {
    var r = e.pingCache;
    r !== null && r.delete(t), t = qe(), e.pingedLanes |= e.suspendedLanes & n, be === e && (Ne & n) === n && (Oe === 4 || Oe === 3 && (Ne & 130023424) === Ne && 500 > Ee() - Ac ? In(e, 0) : Rc |= n), nt(e, t)
}

function c0(e, t) {
    t === 0 && (e.mode & 1 ? (t = ao, ao <<= 1, !(ao & 130023424) && (ao = 4194304)) : t = 1);
    var n = qe();
    e = Wt(e, t), e !== null && (Qi(e, t, n), nt(e, n))
}

function Ry(e) {
    var t = e.memoizedState,
        n = 0;
    t !== null && (n = t.retryLane), c0(e, n)
}

function Ay(e, t) {
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
            throw Error(R(314))
    }
    r !== null && r.delete(t), c0(e, n)
}
var f0;
f0 = function(e, t, n) {
    if (e !== null)
        if (e.memoizedProps !== t.pendingProps || et.current) Je = !0;
        else {
            if (!(e.lanes & n) && !(t.flags & 128)) return Je = !1, my(e, t, n);
            Je = !!(e.flags & 131072)
        }
    else Je = !1, ve && t.flags & 1048576 && pp(t, ss, t.index);
    switch (t.lanes = 0, t.tag) {
        case 2:
            var r = t.type;
            _o(e, t), e = t.pendingProps;
            var i = Tr(t, He.current);
            xr(t, n), i = Sc(null, t, r, e, i, n);
            var o = xc();
            return t.flags |= 1, typeof i == "object" && i !== null && typeof i.render == "function" && i.$$typeof === void 0 ? (t.tag = 1, t.memoizedState = null, t.updateQueue = null, tt(r) ? (o = !0, is(t)) : o = !1, t.memoizedState = i.state !== null && i.state !== void 0 ? i.state : null, yc(t), i.updater = Bs, t.stateNode = i, i._reactInternals = t, tu(t, r, e, n), t = iu(null, t, r, !0, o, n)) : (t.tag = 0, ve && o && uc(t), Ke(null, t, i, n), t = t.child), t;
        case 16:
            r = t.elementType;
            e: {
                switch (_o(e, t), e = t.pendingProps, i = r._init, r = i(r._payload), t.type = r, i = t.tag = Oy(r), e = xt(r, e), i) {
                    case 0:
                        t = ru(null, t, r, e, n);
                        break e;
                    case 1:
                        t = hd(null, t, r, e, n);
                        break e;
                    case 11:
                        t = fd(null, t, r, e, n);
                        break e;
                    case 14:
                        t = dd(null, t, r, xt(r.type, e), n);
                        break e
                }
                throw Error(R(306, r, ""))
            }
            return t;
        case 0:
            return r = t.type, i = t.pendingProps, i = t.elementType === r ? i : xt(r, i), ru(e, t, r, i, n);
        case 1:
            return r = t.type, i = t.pendingProps, i = t.elementType === r ? i : xt(r, i), hd(e, t, r, i, n);
        case 3:
            e: {
                if (qp(t), e === null) throw Error(R(387));r = t.pendingProps,
                o = t.memoizedState,
                i = o.element,
                gp(e, t),
                us(t, r, null, n);
                var s = t.memoizedState;
                if (r = s.element, o.isDehydrated)
                    if (o = {
                            element: r,
                            isDehydrated: !1,
                            cache: s.cache,
                            pendingSuspenseBoundaries: s.pendingSuspenseBoundaries,
                            transitions: s.transitions
                        }, t.updateQueue.baseState = o, t.memoizedState = o, t.flags & 256) {
                        i = Or(Error(R(423)), t), t = pd(e, t, r, n, i);
                        break e
                    } else if (r !== i) {
                    i = Or(Error(R(424)), t), t = pd(e, t, r, n, i);
                    break e
                } else
                    for (ot = fn(t.stateNode.containerInfo.firstChild), st = t, ve = !0, kt = null, n = xp(t, null, r, n), t.child = n; n;) n.flags = n.flags & -3 | 4096, n = n.sibling;
                else {
                    if (Rr(), r === i) {
                        t = Kt(e, t, n);
                        break e
                    }
                    Ke(e, t, r, n)
                }
                t = t.child
            }
            return t;
        case 5:
            return Pp(t), e === null && Xl(t), r = t.type, i = t.pendingProps, o = e !== null ? e.memoizedProps : null, s = i.children, Kl(r, i) ? s = null : o !== null && Kl(r, o) && (t.flags |= 32), Kp(e, t), Ke(e, t, s, n), t.child;
        case 6:
            return e === null && Xl(t), null;
        case 13:
            return Gp(e, t, n);
        case 4:
            return vc(t, t.stateNode.containerInfo), r = t.pendingProps, e === null ? t.child = Ar(t, null, r, n) : Ke(e, t, r, n), t.child;
        case 11:
            return r = t.type, i = t.pendingProps, i = t.elementType === r ? i : xt(r, i), fd(e, t, r, i, n);
        case 7:
            return Ke(e, t, t.pendingProps, n), t.child;
        case 8:
            return Ke(e, t, t.pendingProps.children, n), t.child;
        case 12:
            return Ke(e, t, t.pendingProps.children, n), t.child;
        case 10:
            e: {
                if (r = t.type._context, i = t.pendingProps, o = t.memoizedProps, s = i.value, de(as, r._currentValue), r._currentValue = s, o !== null)
                    if (At(o.value, s)) {
                        if (o.children === i.children && !et.current) {
                            t = Kt(e, t, n);
                            break e
                        }
                    } else
                        for (o = t.child, o !== null && (o.return = t); o !== null;) {
                            var a = o.dependencies;
                            if (a !== null) {
                                s = o.child;
                                for (var l = a.firstContext; l !== null;) {
                                    if (l.context === r) {
                                        if (o.tag === 1) {
                                            l = zt(-1, n & -n), l.tag = 2;
                                            var u = o.updateQueue;
                                            if (u !== null) {
                                                u = u.shared;
                                                var c = u.pending;
                                                c === null ? l.next = l : (l.next = c.next, c.next = l), u.pending = l
                                            }
                                        }
                                        o.lanes |= n, l = o.alternate, l !== null && (l.lanes |= n), Jl(o.return, n, t), a.lanes |= n;
                                        break
                                    }
                                    l = l.next
                                }
                            } else if (o.tag === 10) s = o.type === t.type ? null : o.child;
                            else if (o.tag === 18) {
                                if (s = o.return, s === null) throw Error(R(341));
                                s.lanes |= n, a = s.alternate, a !== null && (a.lanes |= n), Jl(s, n, t), s = o.sibling
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
                Ke(e, t, i.children, n),
                t = t.child
            }
            return t;
        case 9:
            return i = t.type, r = t.pendingProps.children, xr(t, n), i = vt(i), r = r(i), t.flags |= 1, Ke(e, t, r, n), t.child;
        case 14:
            return r = t.type, i = xt(r, t.pendingProps), i = xt(r.type, i), dd(e, t, r, i, n);
        case 15:
            return Hp(e, t, t.type, t.pendingProps, n);
        case 17:
            return r = t.type, i = t.pendingProps, i = t.elementType === r ? i : xt(r, i), _o(e, t), t.tag = 1, tt(r) ? (e = !0, is(t)) : e = !1, xr(t, n), wp(t, r, i), tu(t, r, i, n), iu(null, t, r, !0, e, n);
        case 19:
            return Zp(e, t, n);
        case 22:
            return Wp(e, t, n)
    }
    throw Error(R(156, t.tag))
};

function d0(e, t) {
    return $1(e, t)
}

function My(e, t, n, r) {
    this.tag = e, this.key = n, this.sibling = this.child = this.return = this.stateNode = this.type = this.elementType = null, this.index = 0, this.ref = null, this.pendingProps = t, this.dependencies = this.memoizedState = this.updateQueue = this.memoizedProps = null, this.mode = r, this.subtreeFlags = this.flags = 0, this.deletions = null, this.childLanes = this.lanes = 0, this.alternate = null
}

function mt(e, t, n, r) {
    return new My(e, t, n, r)
}

function Lc(e) {
    return e = e.prototype, !(!e || !e.isReactComponent)
}

function Oy(e) {
    if (typeof e == "function") return Lc(e) ? 1 : 0;
    if (e != null) {
        if (e = e.$$typeof, e === Yu) return 11;
        if (e === Xu) return 14
    }
    return 2
}

function mn(e, t) {
    var n = e.alternate;
    return n === null ? (n = mt(e.tag, t, e.key, e.mode), n.elementType = e.elementType, n.type = e.type, n.stateNode = e.stateNode, n.alternate = e, e.alternate = n) : (n.pendingProps = t, n.type = e.type, n.flags = 0, n.subtreeFlags = 0, n.deletions = null), n.flags = e.flags & 14680064, n.childLanes = e.childLanes, n.lanes = e.lanes, n.child = e.child, n.memoizedProps = e.memoizedProps, n.memoizedState = e.memoizedState, n.updateQueue = e.updateQueue, t = e.dependencies, n.dependencies = t === null ? null : {
        lanes: t.lanes,
        firstContext: t.firstContext
    }, n.sibling = e.sibling, n.index = e.index, n.ref = e.ref, n
}

function No(e, t, n, r, i, o) {
    var s = 2;
    if (r = e, typeof e == "function") Lc(e) && (s = 1);
    else if (typeof e == "string") s = 5;
    else e: switch (e) {
        case tr:
            return $n(n.children, i, o, t);
        case Zu:
            s = 8, i |= 8;
            break;
        case El:
            return e = mt(12, n, t, i | 2), e.elementType = El, e.lanes = o, e;
        case Tl:
            return e = mt(13, n, t, i), e.elementType = Tl, e.lanes = o, e;
        case Rl:
            return e = mt(19, n, t, i), e.elementType = Rl, e.lanes = o, e;
        case S1:
            return Ws(n, i, o, t);
        default:
            if (typeof e == "object" && e !== null) switch (e.$$typeof) {
                case C1:
                    s = 10;
                    break e;
                case w1:
                    s = 9;
                    break e;
                case Yu:
                    s = 11;
                    break e;
                case Xu:
                    s = 14;
                    break e;
                case Jt:
                    s = 16, r = null;
                    break e
            }
            throw Error(R(130, e == null ? e : typeof e, ""))
    }
    return t = mt(s, n, t, i), t.elementType = e, t.type = r, t.lanes = o, t
}

function $n(e, t, n, r) {
    return e = mt(7, e, r, t), e.lanes = n, e
}

function Ws(e, t, n, r) {
    return e = mt(22, e, r, t), e.elementType = S1, e.lanes = n, e.stateNode = {
        isHidden: !1
    }, e
}

function tl(e, t, n) {
    return e = mt(6, e, null, t), e.lanes = n, e
}

function nl(e, t, n) {
    return t = mt(4, e.children !== null ? e.children : [], e.key, t), t.lanes = n, t.stateNode = {
        containerInfo: e.containerInfo,
        pendingChildren: null,
        implementation: e.implementation
    }, t
}

function Fy(e, t, n, r, i) {
    this.tag = t, this.containerInfo = e, this.finishedWork = this.pingCache = this.current = this.pendingChildren = null, this.timeoutHandle = -1, this.callbackNode = this.pendingContext = this.context = null, this.callbackPriority = 0, this.eventTimes = _a(0), this.expirationTimes = _a(-1), this.entangledLanes = this.finishedLanes = this.mutableReadLanes = this.expiredLanes = this.pingedLanes = this.suspendedLanes = this.pendingLanes = 0, this.entanglements = _a(0), this.identifierPrefix = r, this.onRecoverableError = i, this.mutableSourceEagerHydrationData = null
}

function bc(e, t, n, r, i, o, s, a, l) {
    return e = new Fy(e, t, n, a, l), t === 1 ? (t = 1, o === !0 && (t |= 8)) : t = 0, o = mt(3, null, null, t), e.current = o, o.stateNode = e, o.memoizedState = {
        element: r,
        isDehydrated: n,
        cache: null,
        transitions: null,
        pendingSuspenseBoundaries: null
    }, yc(o), e
}

function Ly(e, t, n) {
    var r = 3 < arguments.length && arguments[3] !== void 0 ? arguments[3] : null;
    return {
        $$typeof: er,
        key: r == null ? null : "" + r,
        children: e,
        containerInfo: t,
        implementation: n
    }
}

function h0(e) {
    if (!e) return wn;
    e = e._reactInternals;
    e: {
        if (Kn(e) !== e || e.tag !== 1) throw Error(R(170));
        var t = e;do {
            switch (t.tag) {
                case 3:
                    t = t.stateNode.context;
                    break e;
                case 1:
                    if (tt(t.type)) {
                        t = t.stateNode.__reactInternalMemoizedMergedChildContext;
                        break e
                    }
            }
            t = t.return
        } while (t !== null);
        throw Error(R(171))
    }
    if (e.tag === 1) {
        var n = e.type;
        if (tt(n)) return dp(e, n, t)
    }
    return t
}

function p0(e, t, n, r, i, o, s, a, l) {
    return e = bc(n, r, !0, e, i, o, s, a, l), e.context = h0(null), n = e.current, r = qe(), i = pn(n), o = zt(r, i), o.callback = t ?? null, dn(n, o, i), e.current.lanes = i, Qi(e, i, r), nt(e, r), e
}

function Ks(e, t, n, r) {
    var i = t.current,
        o = qe(),
        s = pn(i);
    return n = h0(n), t.context === null ? t.context = n : t.pendingContext = n, t = zt(o, s), t.payload = {
        element: e
    }, r = r === void 0 ? null : r, r !== null && (t.callback = r), e = dn(i, t, s), e !== null && (Rt(e, i, s, o), bo(e, i, s)), s
}

function vs(e) {
    if (e = e.current, !e.child) return null;
    switch (e.child.tag) {
        case 5:
            return e.child.stateNode;
        default:
            return e.child.stateNode
    }
}

function kd(e, t) {
    if (e = e.memoizedState, e !== null && e.dehydrated !== null) {
        var n = e.retryLane;
        e.retryLane = n !== 0 && n < t ? n : t
    }
}

function Dc(e, t) {
    kd(e, t), (e = e.alternate) && kd(e, t)
}

function by() {
    return null
}
var m0 = typeof reportError == "function" ? reportError : function(e) {
    console.error(e)
};

function Vc(e) {
    this._internalRoot = e
}
qs.prototype.render = Vc.prototype.render = function(e) {
    var t = this._internalRoot;
    if (t === null) throw Error(R(409));
    Ks(e, t, null, null)
};
qs.prototype.unmount = Vc.prototype.unmount = function() {
    var e = this._internalRoot;
    if (e !== null) {
        this._internalRoot = null;
        var t = e.containerInfo;
        Un(function() {
            Ks(null, e, null, null)
        }), t[Ht] = null
    }
};

function qs(e) {
    this._internalRoot = e
}
qs.prototype.unstable_scheduleHydration = function(e) {
    if (e) {
        var t = H1();
        e = {
            blockedOn: null,
            target: e,
            priority: t
        };
        for (var n = 0; n < rn.length && t !== 0 && t < rn[n].priority; n++);
        rn.splice(n, 0, e), n === 0 && K1(e)
    }
};

function _c(e) {
    return !(!e || e.nodeType !== 1 && e.nodeType !== 9 && e.nodeType !== 11)
}

function Gs(e) {
    return !(!e || e.nodeType !== 1 && e.nodeType !== 9 && e.nodeType !== 11 && (e.nodeType !== 8 || e.nodeValue !== " react-mount-point-unstable "))
}

function Ed() {}

function Dy(e, t, n, r, i) {
    if (i) {
        if (typeof r == "function") {
            var o = r;
            r = function() {
                var u = vs(s);
                o.call(u)
            }
        }
        var s = p0(t, r, e, 0, null, !1, !1, "", Ed);
        return e._reactRootContainer = s, e[Ht] = s.current, Mi(e.nodeType === 8 ? e.parentNode : e), Un(), s
    }
    for (; i = e.lastChild;) e.removeChild(i);
    if (typeof r == "function") {
        var a = r;
        r = function() {
            var u = vs(l);
            a.call(u)
        }
    }
    var l = bc(e, 0, !1, null, null, !1, !1, "", Ed);
    return e._reactRootContainer = l, e[Ht] = l.current, Mi(e.nodeType === 8 ? e.parentNode : e), Un(function() {
        Ks(t, l, n, r)
    }), l
}

function Zs(e, t, n, r, i) {
    var o = n._reactRootContainer;
    if (o) {
        var s = o;
        if (typeof i == "function") {
            var a = i;
            i = function() {
                var l = vs(s);
                a.call(l)
            }
        }
        Ks(t, s, e, i)
    } else s = Dy(n, t, e, i, r);
    return vs(s)
}
U1 = function(e) {
    switch (e.tag) {
        case 3:
            var t = e.stateNode;
            if (t.current.memoizedState.isDehydrated) {
                var n = ri(t.pendingLanes);
                n !== 0 && (tc(t, n | 1), nt(t, Ee()), !(te & 6) && (Fr = Ee() + 500, En()))
            }
            break;
        case 13:
            Un(function() {
                var r = Wt(e, 1);
                if (r !== null) {
                    var i = qe();
                    Rt(r, e, 1, i)
                }
            }), Dc(e, 1)
    }
};
nc = function(e) {
    if (e.tag === 13) {
        var t = Wt(e, 134217728);
        if (t !== null) {
            var n = qe();
            Rt(t, e, 134217728, n)
        }
        Dc(e, 134217728)
    }
};
Q1 = function(e) {
    if (e.tag === 13) {
        var t = pn(e),
            n = Wt(e, t);
        if (n !== null) {
            var r = qe();
            Rt(n, e, t, r)
        }
        Dc(e, t)
    }
};
H1 = function() {
    return se
};
W1 = function(e, t) {
    var n = se;
    try {
        return se = e, t()
    } finally {
        se = n
    }
};
Il = function(e, t, n) {
    switch (t) {
        case "input":
            if (Ol(e, n), t = n.name, n.type === "radio" && t != null) {
                for (n = e; n.parentNode;) n = n.parentNode;
                for (n = n.querySelectorAll("input[name=" + JSON.stringify("" + t) + '][type="radio"]'), t = 0; t < n.length; t++) {
                    var r = n[t];
                    if (r !== e && r.form === e.form) {
                        var i = js(r);
                        if (!i) throw Error(R(90));
                        P1(r), Ol(r, i)
                    }
                }
            }
            break;
        case "textarea":
            E1(e, n);
            break;
        case "select":
            t = n.value, t != null && gr(e, !!n.multiple, t, !1)
    }
};
L1 = Mc;
b1 = Un;
var Vy = {
        usingClientEntryPoint: !1,
        Events: [Wi, or, js, O1, F1, Mc]
    },
    Yr = {
        findFiberByHostInstance: Ln,
        bundleType: 0,
        version: "18.2.0",
        rendererPackageName: "react-dom"
    },
    _y = {
        bundleType: Yr.bundleType,
        version: Yr.version,
        rendererPackageName: Yr.rendererPackageName,
        rendererConfig: Yr.rendererConfig,
        overrideHookState: null,
        overrideHookStateDeletePath: null,
        overrideHookStateRenamePath: null,
        overrideProps: null,
        overridePropsDeletePath: null,
        overridePropsRenamePath: null,
        setErrorHandler: null,
        setSuspenseHandler: null,
        scheduleUpdate: null,
        currentDispatcherRef: Gt.ReactCurrentDispatcher,
        findHostInstanceByFiber: function(e) {
            return e = _1(e), e === null ? null : e.stateNode
        },
        findFiberByHostInstance: Yr.findFiberByHostInstance || by,
        findHostInstancesForRefresh: null,
        scheduleRefresh: null,
        scheduleRoot: null,
        setRefreshHandler: null,
        getCurrentFiber: null,
        reconcilerVersion: "18.2.0-next-9e3b772b8-20220608"
    };
if (typeof __REACT_DEVTOOLS_GLOBAL_HOOK__ < "u") {
    var Co = __REACT_DEVTOOLS_GLOBAL_HOOK__;
    if (!Co.isDisabled && Co.supportsFiber) try {
        _s = Co.inject(_y), bt = Co
    } catch {}
}
ut.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = Vy;
ut.createPortal = function(e, t) {
    var n = 2 < arguments.length && arguments[2] !== void 0 ? arguments[2] : null;
    if (!_c(t)) throw Error(R(200));
    return Ly(e, t, null, n)
};
ut.createRoot = function(e, t) {
    if (!_c(e)) throw Error(R(299));
    var n = !1,
        r = "",
        i = m0;
    return t != null && (t.unstable_strictMode === !0 && (n = !0), t.identifierPrefix !== void 0 && (r = t.identifierPrefix), t.onRecoverableError !== void 0 && (i = t.onRecoverableError)), t = bc(e, 1, !1, null, null, n, !1, r, i), e[Ht] = t.current, Mi(e.nodeType === 8 ? e.parentNode : e), new Vc(t)
};
ut.findDOMNode = function(e) {
    if (e == null) return null;
    if (e.nodeType === 1) return e;
    var t = e._reactInternals;
    if (t === void 0) throw typeof e.render == "function" ? Error(R(188)) : (e = Object.keys(e).join(","), Error(R(268, e)));
    return e = _1(t), e = e === null ? null : e.stateNode, e
};
ut.flushSync = function(e) {
    return Un(e)
};
ut.hydrate = function(e, t, n) {
    if (!Gs(t)) throw Error(R(200));
    return Zs(null, e, t, !0, n)
};
ut.hydrateRoot = function(e, t, n) {
    if (!_c(e)) throw Error(R(405));
    var r = n != null && n.hydratedSources || null,
        i = !1,
        o = "",
        s = m0;
    if (n != null && (n.unstable_strictMode === !0 && (i = !0), n.identifierPrefix !== void 0 && (o = n.identifierPrefix), n.onRecoverableError !== void 0 && (s = n.onRecoverableError)), t = p0(t, null, e, 1, n ?? null, i, !1, o, s), e[Ht] = t.current, Mi(e), r)
        for (e = 0; e < r.length; e++) n = r[e], i = n._getVersion, i = i(n._source), t.mutableSourceEagerHydrationData == null ? t.mutableSourceEagerHydrationData = [n, i] : t.mutableSourceEagerHydrationData.push(n, i);
    return new qs(t)
};
ut.render = function(e, t, n) {
    if (!Gs(t)) throw Error(R(200));
    return Zs(null, e, t, !1, n)
};
ut.unmountComponentAtNode = function(e) {
    if (!Gs(e)) throw Error(R(40));
    return e._reactRootContainer ? (Un(function() {
        Zs(null, null, e, !1, function() {
            e._reactRootContainer = null, e[Ht] = null
        })
    }), !0) : !1
};
ut.unstable_batchedUpdates = Mc;
ut.unstable_renderSubtreeIntoContainer = function(e, t, n, r) {
    if (!Gs(n)) throw Error(R(200));
    if (e == null || e._reactInternals === void 0) throw Error(R(38));
    return Zs(e, t, n, !1, r)
};
ut.version = "18.2.0-next-9e3b772b8-20220608";
(function(e) {
    function t() {
        if (!(typeof __REACT_DEVTOOLS_GLOBAL_HOOK__ > "u" || typeof __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE != "function")) try {
            __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE(t)
        } catch (n) {
            console.error(n)
        }
    }
    t(), e.exports = ut
})(b2);
const y0 = Bu(Ko);
var Td = Ko;
xl.createRoot = Td.createRoot, xl.hydrateRoot = Td.hydrateRoot;
const v0 = P.createContext({
        transformPagePoint: e => e,
        isStatic: !1,
        reducedMotion: "never"
    }),
    Ys = P.createContext({}),
    Xs = P.createContext(null),
    Js = typeof document < "u",
    Ic = Js ? P.useLayoutEffect : P.useEffect,
    g0 = P.createContext({
        strict: !1
    });

function Iy(e, t, n, r) {
    const {
        visualElement: i
    } = P.useContext(Ys), o = P.useContext(g0), s = P.useContext(Xs), a = P.useContext(v0).reducedMotion, l = P.useRef();
    r = r || o.renderer, !l.current && r && (l.current = r(e, {
        visualState: t,
        parent: i,
        props: n,
        presenceContext: s,
        blockInitialAnimation: s ? s.initial === !1 : !1,
        reducedMotionConfig: a
    }));
    const u = l.current;
    P.useInsertionEffect(() => {
        u && u.update(n, s)
    });
    const c = P.useRef(Boolean(window.HandoffAppearAnimations));
    return Ic(() => {
        u && (u.render(), c.current && u.animationState && u.animationState.animateChanges())
    }), P.useEffect(() => {
        u && (u.updateFeatures(), !c.current && u.animationState && u.animationState.animateChanges(), window.HandoffAppearAnimations = void 0, c.current = !1)
    }), u
}

function dr(e) {
    return typeof e == "object" && Object.prototype.hasOwnProperty.call(e, "current")
}

function $y(e, t, n) {
    return P.useCallback(r => {
        r && e.mount && e.mount(r), t && (r ? t.mount(r) : t.unmount()), n && (typeof n == "function" ? n(r) : dr(n) && (n.current = r))
    }, [t])
}

function $i(e) {
    return typeof e == "string" || Array.isArray(e)
}

function ea(e) {
    return typeof e == "object" && typeof e.start == "function"
}
const $c = ["animate", "whileInView", "whileFocus", "whileHover", "whileTap", "whileDrag", "exit"],
    Nc = ["initial", ...$c];

function ta(e) {
    return ea(e.animate) || Nc.some(t => $i(e[t]))
}

function C0(e) {
    return Boolean(ta(e) || e.variants)
}

function Ny(e, t) {
    if (ta(e)) {
        const {
            initial: n,
            animate: r
        } = e;
        return {
            initial: n === !1 || $i(n) ? n : void 0,
            animate: $i(r) ? r : void 0
        }
    }
    return e.inherit !== !1 ? t : {}
}

function jy(e) {
    const {
        initial: t,
        animate: n
    } = Ny(e, P.useContext(Ys));
    return P.useMemo(() => ({
        initial: t,
        animate: n
    }), [Rd(t), Rd(n)])
}

function Rd(e) {
    return Array.isArray(e) ? e.join(" ") : e
}
const Ad = {
        animation: ["animate", "variants", "whileHover", "whileTap", "exit", "whileInView", "whileFocus", "whileDrag"],
        exit: ["exit"],
        drag: ["drag", "dragControls"],
        focus: ["whileFocus"],
        hover: ["whileHover", "onHoverStart", "onHoverEnd"],
        tap: ["whileTap", "onTap", "onTapStart", "onTapCancel"],
        pan: ["onPan", "onPanStart", "onPanSessionStart", "onPanEnd"],
        inView: ["whileInView", "onViewportEnter", "onViewportLeave"],
        layout: ["layout", "layoutId"]
    },
    Ni = {};
for (const e in Ad) Ni[e] = {
    isEnabled: t => Ad[e].some(n => !!t[n])
};

function zy(e) {
    for (const t in e) Ni[t] = {
        ...Ni[t],
        ...e[t]
    }
}
const jc = P.createContext({}),
    w0 = P.createContext({}),
    By = Symbol.for("motionComponentSymbol");

function Uy({
    preloadedFeatures: e,
    createVisualElement: t,
    useRender: n,
    useVisualState: r,
    Component: i
}) {
    e && zy(e);

    function o(a, l) {
        let u;
        const c = {
                ...P.useContext(v0),
                ...a,
                layoutId: Qy(a)
            },
            {
                isStatic: f
            } = c,
            d = jy(a),
            p = r(a, f);
        if (!f && Js) {
            d.visualElement = Iy(i, p, c, t);
            const y = P.useContext(w0),
                g = P.useContext(g0).strict;
            d.visualElement && (u = d.visualElement.loadFeatures(c, g, e, y))
        }
        return P.createElement(Ys.Provider, {
            value: d
        }, u && d.visualElement ? P.createElement(u, {
            visualElement: d.visualElement,
            ...c
        }) : null, n(i, a, $y(p, d.visualElement, l), p, f, d.visualElement))
    }
    const s = P.forwardRef(o);
    return s[By] = i, s
}

function Qy({
    layoutId: e
}) {
    const t = P.useContext(jc).id;
    return t && e !== void 0 ? t + "-" + e : e
}

function Hy(e) {
    function t(r, i = {}) {
        return Uy(e(r, i))
    }
    if (typeof Proxy > "u") return t;
    const n = new Map;
    return new Proxy(t, {
        get: (r, i) => (n.has(i) || n.set(i, t(i)), n.get(i))
    })
}
const Wy = ["animate", "circle", "defs", "desc", "ellipse", "g", "image", "line", "filter", "marker", "mask", "metadata", "path", "pattern", "polygon", "polyline", "rect", "stop", "switch", "symbol", "svg", "text", "tspan", "use", "view"];

function zc(e) {
    return typeof e != "string" || e.includes("-") ? !1 : !!(Wy.indexOf(e) > -1 || /[A-Z]/.test(e))
}
const gs = {};

function Ky(e) {
    Object.assign(gs, e)
}
const qi = ["transformPerspective", "x", "y", "z", "translateX", "translateY", "translateZ", "scale", "scaleX", "scaleY", "rotate", "rotateX", "rotateY", "rotateZ", "skew", "skewX", "skewY"],
    qn = new Set(qi);

function S0(e, {
    layout: t,
    layoutId: n
}) {
    return qn.has(e) || e.startsWith("origin") || (t || n !== void 0) && (!!gs[e] || e === "opacity")
}
const rt = e => Boolean(e && e.getVelocity),
    qy = {
        x: "translateX",
        y: "translateY",
        z: "translateZ",
        transformPerspective: "perspective"
    },
    Gy = qi.length;

function Zy(e, {
    enableHardwareAcceleration: t = !0,
    allowTransformNone: n = !0
}, r, i) {
    let o = "";
    for (let s = 0; s < Gy; s++) {
        const a = qi[s];
        if (e[a] !== void 0) {
            const l = qy[a] || a;
            o += `${l}(${e[a]}) `
        }
    }
    return t && !e.z && (o += "translateZ(0)"), o = o.trim(), i ? o = i(e, r ? "" : o) : n && r && (o = "none"), o
}
const x0 = e => t => typeof t == "string" && t.startsWith(e),
    P0 = x0("--"),
    yu = x0("var(--"),
    Yy = /var\s*\(\s*--[\w-]+(\s*,\s*(?:(?:[^)(]|\((?:[^)(]+|\([^)(]*\))*\))*)+)?\s*\)/g,
    Xy = (e, t) => t && typeof e == "number" ? t.transform(e) : e,
    Sn = (e, t, n) => Math.min(Math.max(n, e), t),
    Gn = {
        test: e => typeof e == "number",
        parse: parseFloat,
        transform: e => e
    },
    mi = {
        ...Gn,
        transform: e => Sn(0, 1, e)
    },
    wo = {
        ...Gn,
        default: 1
    },
    yi = e => Math.round(e * 1e5) / 1e5,
    na = /(-)?([\d]*\.?[\d])+/g,
    k0 = /(#[0-9a-f]{3,8}|(rgb|hsl)a?\((-?[\d\.]+%?[,\s]+){2}(-?[\d\.]+%?)\s*[\,\/]?\s*[\d\.]*%?\))/gi,
    Jy = /^(#[0-9a-f]{3,8}|(rgb|hsl)a?\((-?[\d\.]+%?[,\s]+){2}(-?[\d\.]+%?)\s*[\,\/]?\s*[\d\.]*%?\))$/i;

function Gi(e) {
    return typeof e == "string"
}
const Zi = e => ({
        test: t => Gi(t) && t.endsWith(e) && t.split(" ").length === 1,
        parse: parseFloat,
        transform: t => `${t}${e}`
    }),
    Xt = Zi("deg"),
    Vt = Zi("%"),
    j = Zi("px"),
    ev = Zi("vh"),
    tv = Zi("vw"),
    Md = {
        ...Vt,
        parse: e => Vt.parse(e) / 100,
        transform: e => Vt.transform(e * 100)
    },
    Od = {
        ...Gn,
        transform: Math.round
    },
    E0 = {
        borderWidth: j,
        borderTopWidth: j,
        borderRightWidth: j,
        borderBottomWidth: j,
        borderLeftWidth: j,
        borderRadius: j,
        radius: j,
        borderTopLeftRadius: j,
        borderTopRightRadius: j,
        borderBottomRightRadius: j,
        borderBottomLeftRadius: j,
        width: j,
        maxWidth: j,
        height: j,
        maxHeight: j,
        size: j,
        top: j,
        right: j,
        bottom: j,
        left: j,
        padding: j,
        paddingTop: j,
        paddingRight: j,
        paddingBottom: j,
        paddingLeft: j,
        margin: j,
        marginTop: j,
        marginRight: j,
        marginBottom: j,
        marginLeft: j,
        rotate: Xt,
        rotateX: Xt,
        rotateY: Xt,
        rotateZ: Xt,
        scale: wo,
        scaleX: wo,
        scaleY: wo,
        scaleZ: wo,
        skew: Xt,
        skewX: Xt,
        skewY: Xt,
        distance: j,
        translateX: j,
        translateY: j,
        translateZ: j,
        x: j,
        y: j,
        z: j,
        perspective: j,
        transformPerspective: j,
        opacity: mi,
        originX: Md,
        originY: Md,
        originZ: j,
        zIndex: Od,
        fillOpacity: mi,
        strokeOpacity: mi,
        numOctaves: Od
    };

function Bc(e, t, n, r) {
    const {
        style: i,
        vars: o,
        transform: s,
        transformOrigin: a
    } = e;
    let l = !1,
        u = !1,
        c = !0;
    for (const f in t) {
        const d = t[f];
        if (P0(f)) {
            o[f] = d;
            continue
        }
        const p = E0[f],
            y = Xy(d, p);
        if (qn.has(f)) {
            if (l = !0, s[f] = y, !c) continue;
            d !== (p.default || 0) && (c = !1)
        } else f.startsWith("origin") ? (u = !0, a[f] = y) : i[f] = y
    }
    if (t.transform || (l || r ? i.transform = Zy(e.transform, n, c, r) : i.transform && (i.transform = "none")), u) {
        const {
            originX: f = "50%",
            originY: d = "50%",
            originZ: p = 0
        } = a;
        i.transformOrigin = `${f} ${d} ${p}`
    }
}
const Uc = () => ({
    style: {},
    transform: {},
    transformOrigin: {},
    vars: {}
});

function T0(e, t, n) {
    for (const r in t) !rt(t[r]) && !S0(r, n) && (e[r] = t[r])
}

function nv({
    transformTemplate: e
}, t, n) {
    return P.useMemo(() => {
        const r = Uc();
        return Bc(r, t, {
            enableHardwareAcceleration: !n
        }, e), Object.assign({}, r.vars, r.style)
    }, [t])
}

function rv(e, t, n) {
    const r = e.style || {},
        i = {};
    return T0(i, r, e), Object.assign(i, nv(e, t, n)), e.transformValues ? e.transformValues(i) : i
}

function iv(e, t, n) {
    const r = {},
        i = rv(e, t, n);
    return e.drag && e.dragListener !== !1 && (r.draggable = !1, i.userSelect = i.WebkitUserSelect = i.WebkitTouchCallout = "none", i.touchAction = e.drag === !0 ? "none" : `pan-${e.drag==="x"?"y":"x"}`), e.tabIndex === void 0 && (e.onTap || e.onTapStart || e.whileTap) && (r.tabIndex = 0), r.style = i, r
}
const ov = new Set(["animate", "exit", "variants", "initial", "style", "values", "variants", "transition", "transformTemplate", "transformValues", "custom", "inherit", "onLayoutAnimationStart", "onLayoutAnimationComplete", "onLayoutMeasure", "onBeforeLayoutMeasure", "onAnimationStart", "onAnimationComplete", "onUpdate", "onDragStart", "onDrag", "onDragEnd", "onMeasureDragConstraints", "onDirectionLock", "onDragTransitionEnd", "_dragX", "_dragY", "onHoverStart", "onHoverEnd", "onViewportEnter", "onViewportLeave", "ignoreStrict", "viewport"]);

function Cs(e) {
    return e.startsWith("while") || e.startsWith("drag") && e !== "draggable" || e.startsWith("layout") || e.startsWith("onTap") || e.startsWith("onPan") || ov.has(e)
}
let R0 = e => !Cs(e);

function sv(e) {
    e && (R0 = t => t.startsWith("on") ? !Cs(t) : e(t))
}
try {
    sv(require("@emotion/is-prop-valid").default)
} catch {}

function av(e, t, n) {
    const r = {};
    for (const i in e) i === "values" && typeof e.values == "object" || (R0(i) || n === !0 && Cs(i) || !t && !Cs(i) || e.draggable && i.startsWith("onDrag")) && (r[i] = e[i]);
    return r
}

function Fd(e, t, n) {
    return typeof e == "string" ? e : j.transform(t + n * e)
}

function lv(e, t, n) {
    const r = Fd(t, e.x, e.width),
        i = Fd(n, e.y, e.height);
    return `${r} ${i}`
}
const uv = {
        offset: "stroke-dashoffset",
        array: "stroke-dasharray"
    },
    cv = {
        offset: "strokeDashoffset",
        array: "strokeDasharray"
    };

function fv(e, t, n = 1, r = 0, i = !0) {
    e.pathLength = 1;
    const o = i ? uv : cv;
    e[o.offset] = j.transform(-r);
    const s = j.transform(t),
        a = j.transform(n);
    e[o.array] = `${s} ${a}`
}

function Qc(e, {
    attrX: t,
    attrY: n,
    attrScale: r,
    originX: i,
    originY: o,
    pathLength: s,
    pathSpacing: a = 1,
    pathOffset: l = 0,
    ...u
}, c, f, d) {
    if (Bc(e, u, c, d), f) {
        e.style.viewBox && (e.attrs.viewBox = e.style.viewBox);
        return
    }
    e.attrs = e.style, e.style = {};
    const {
        attrs: p,
        style: y,
        dimensions: g
    } = e;
    p.transform && (g && (y.transform = p.transform), delete p.transform), g && (i !== void 0 || o !== void 0 || y.transform) && (y.transformOrigin = lv(g, i !== void 0 ? i : .5, o !== void 0 ? o : .5)), t !== void 0 && (p.x = t), n !== void 0 && (p.y = n), r !== void 0 && (p.scale = r), s !== void 0 && fv(p, s, a, l, !1)
}
const A0 = () => ({
        ...Uc(),
        attrs: {}
    }),
    Hc = e => typeof e == "string" && e.toLowerCase() === "svg";

function dv(e, t, n, r) {
    const i = P.useMemo(() => {
        const o = A0();
        return Qc(o, t, {
            enableHardwareAcceleration: !1
        }, Hc(r), e.transformTemplate), {
            ...o.attrs,
            style: {
                ...o.style
            }
        }
    }, [t]);
    if (e.style) {
        const o = {};
        T0(o, e.style, e), i.style = {
            ...o,
            ...i.style
        }
    }
    return i
}

function hv(e = !1) {
    return (n, r, i, {
        latestValues: o
    }, s) => {
        const l = (zc(n) ? dv : iv)(r, o, s, n),
            c = {
                ...av(r, typeof n == "string", e),
                ...l,
                ref: i
            },
            {
                children: f
            } = r,
            d = P.useMemo(() => rt(f) ? f.get() : f, [f]);
        return P.createElement(n, {
            ...c,
            children: d
        })
    }
}
const Wc = e => e.replace(/([a-z])([A-Z])/g, "$1-$2").toLowerCase();

function M0(e, {
    style: t,
    vars: n
}, r, i) {
    Object.assign(e.style, t, i && i.getProjectionStyles(r));
    for (const o in n) e.style.setProperty(o, n[o])
}
const O0 = new Set(["baseFrequency", "diffuseConstant", "kernelMatrix", "kernelUnitLength", "keySplines", "keyTimes", "limitingConeAngle", "markerHeight", "markerWidth", "numOctaves", "targetX", "targetY", "surfaceScale", "specularConstant", "specularExponent", "stdDeviation", "tableValues", "viewBox", "gradientTransform", "pathLength", "startOffset", "textLength", "lengthAdjust"]);

function F0(e, t, n, r) {
    M0(e, t, void 0, r);
    for (const i in t.attrs) e.setAttribute(O0.has(i) ? i : Wc(i), t.attrs[i])
}

function Kc(e, t) {
    const {
        style: n
    } = e, r = {};
    for (const i in n)(rt(n[i]) || t.style && rt(t.style[i]) || S0(i, e)) && (r[i] = n[i]);
    return r
}

function L0(e, t) {
    const n = Kc(e, t);
    for (const r in e)
        if (rt(e[r]) || rt(t[r])) {
            const i = qi.indexOf(r) !== -1 ? "attr" + r.charAt(0).toUpperCase() + r.substring(1) : r;
            n[i] = e[r]
        } return n
}

function qc(e, t, n, r = {}, i = {}) {
    return typeof t == "function" && (t = t(n !== void 0 ? n : e.custom, r, i)), typeof t == "string" && (t = e.variants && e.variants[t]), typeof t == "function" && (t = t(n !== void 0 ? n : e.custom, r, i)), t
}

function b0(e) {
    const t = P.useRef(null);
    return t.current === null && (t.current = e()), t.current
}
const ws = e => Array.isArray(e),
    pv = e => Boolean(e && typeof e == "object" && e.mix && e.toValue),
    mv = e => ws(e) ? e[e.length - 1] || 0 : e;

function jo(e) {
    const t = rt(e) ? e.get() : e;
    return pv(t) ? t.toValue() : t
}

function yv({
    scrapeMotionValuesFromProps: e,
    createRenderState: t,
    onMount: n
}, r, i, o) {
    const s = {
        latestValues: vv(r, i, o, e),
        renderState: t()
    };
    return n && (s.mount = a => n(r, a, s)), s
}
const D0 = e => (t, n) => {
    const r = P.useContext(Ys),
        i = P.useContext(Xs),
        o = () => yv(e, t, r, i);
    return n ? o() : b0(o)
};

function vv(e, t, n, r) {
    const i = {},
        o = r(e, {});
    for (const d in o) i[d] = jo(o[d]);
    let {
        initial: s,
        animate: a
    } = e;
    const l = ta(e),
        u = C0(e);
    t && u && !l && e.inherit !== !1 && (s === void 0 && (s = t.initial), a === void 0 && (a = t.animate));
    let c = n ? n.initial === !1 : !1;
    c = c || s === !1;
    const f = c ? a : s;
    return f && typeof f != "boolean" && !ea(f) && (Array.isArray(f) ? f : [f]).forEach(p => {
        const y = qc(e, p);
        if (!y) return;
        const {
            transitionEnd: g,
            transition: x,
            ...v
        } = y;
        for (const h in v) {
            let m = v[h];
            if (Array.isArray(m)) {
                const C = c ? m.length - 1 : 0;
                m = m[C]
            }
            m !== null && (i[h] = m)
        }
        for (const h in g) i[h] = g[h]
    }), i
}
const Pe = e => e;
class Ld {
    constructor() {
        this.order = [], this.scheduled = new Set
    }
    add(t) {
        if (!this.scheduled.has(t)) return this.scheduled.add(t), this.order.push(t), !0
    }
    remove(t) {
        const n = this.order.indexOf(t);
        n !== -1 && (this.order.splice(n, 1), this.scheduled.delete(t))
    }
    clear() {
        this.order.length = 0, this.scheduled.clear()
    }
}

function gv(e) {
    let t = new Ld,
        n = new Ld,
        r = 0,
        i = !1,
        o = !1;
    const s = new WeakSet,
        a = {
            schedule: (l, u = !1, c = !1) => {
                const f = c && i,
                    d = f ? t : n;
                return u && s.add(l), d.add(l) && f && i && (r = t.order.length), l
            },
            cancel: l => {
                n.remove(l), s.delete(l)
            },
            process: l => {
                if (i) {
                    o = !0;
                    return
                }
                if (i = !0, [t, n] = [n, t], n.clear(), r = t.order.length, r)
                    for (let u = 0; u < r; u++) {
                        const c = t.order[u];
                        c(l), s.has(c) && (a.schedule(c), e())
                    }
                i = !1, o && (o = !1, a.process(l))
            }
        };
    return a
}
const So = ["prepare", "read", "update", "preRender", "render", "postRender"],
    Cv = 40;

function wv(e, t) {
    let n = !1,
        r = !0;
    const i = {
            delta: 0,
            timestamp: 0,
            isProcessing: !1
        },
        o = So.reduce((f, d) => (f[d] = gv(() => n = !0), f), {}),
        s = f => o[f].process(i),
        a = () => {
            const f = performance.now();
            n = !1, i.delta = r ? 1e3 / 60 : Math.max(Math.min(f - i.timestamp, Cv), 1), i.timestamp = f, i.isProcessing = !0, So.forEach(s), i.isProcessing = !1, n && t && (r = !1, e(a))
        },
        l = () => {
            n = !0, r = !0, i.isProcessing || e(a)
        };
    return {
        schedule: So.reduce((f, d) => {
            const p = o[d];
            return f[d] = (y, g = !1, x = !1) => (n || l(), p.schedule(y, g, x)), f
        }, {}),
        cancel: f => So.forEach(d => o[d].cancel(f)),
        state: i,
        steps: o
    }
}
const {
    schedule: he,
    cancel: qt,
    state: Fe,
    steps: rl
} = wv(typeof requestAnimationFrame < "u" ? requestAnimationFrame : Pe, !0), Sv = {
    useVisualState: D0({
        scrapeMotionValuesFromProps: L0,
        createRenderState: A0,
        onMount: (e, t, {
            renderState: n,
            latestValues: r
        }) => {
            he.read(() => {
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
            }), he.render(() => {
                Qc(n, r, {
                    enableHardwareAcceleration: !1
                }, Hc(t.tagName), e.transformTemplate), F0(t, n)
            })
        }
    })
}, xv = {
    useVisualState: D0({
        scrapeMotionValuesFromProps: Kc,
        createRenderState: Uc
    })
};

function Pv(e, {
    forwardMotionProps: t = !1
}, n, r) {
    return {
        ...zc(e) ? Sv : xv,
        preloadedFeatures: n,
        useRender: hv(t),
        createVisualElement: r,
        Component: e
    }
}

function jt(e, t, n, r = {
    passive: !0
}) {
    return e.addEventListener(t, n, r), () => e.removeEventListener(t, n)
}
const V0 = e => e.pointerType === "mouse" ? typeof e.button != "number" || e.button <= 0 : e.isPrimary !== !1;

function ra(e, t = "page") {
    return {
        point: {
            x: e[t + "X"],
            y: e[t + "Y"]
        }
    }
}
const kv = e => t => V0(t) && e(t, ra(t));

function Bt(e, t, n, r) {
    return jt(e, t, kv(n), r)
}
const Ev = (e, t) => n => t(e(n)),
    yn = (...e) => e.reduce(Ev);

function _0(e) {
    let t = null;
    return () => {
        const n = () => {
            t = null
        };
        return t === null ? (t = e, n) : !1
    }
}
const bd = _0("dragHorizontal"),
    Dd = _0("dragVertical");

function I0(e) {
    let t = !1;
    if (e === "y") t = Dd();
    else if (e === "x") t = bd();
    else {
        const n = bd(),
            r = Dd();
        n && r ? t = () => {
            n(), r()
        } : (n && n(), r && r())
    }
    return t
}

function $0() {
    const e = I0(!0);
    return e ? (e(), !1) : !0
}
class Tn {
    constructor(t) {
        this.isMounted = !1, this.node = t
    }
    update() {}
}

function Vd(e, t) {
    const n = "pointer" + (t ? "enter" : "leave"),
        r = "onHover" + (t ? "Start" : "End"),
        i = (o, s) => {
            if (o.type === "touch" || $0()) return;
            const a = e.getProps();
            e.animationState && a.whileHover && e.animationState.setActive("whileHover", t), a[r] && he.update(() => a[r](o, s))
        };
    return Bt(e.current, n, i, {
        passive: !e.getProps()[r]
    })
}
class Tv extends Tn {
    mount() {
        this.unmount = yn(Vd(this.node, !0), Vd(this.node, !1))
    }
    unmount() {}
}
class Rv extends Tn {
    constructor() {
        super(...arguments), this.isActive = !1
    }
    onFocus() {
        let t = !1;
        try {
            t = this.node.current.matches(":focus-visible")
        } catch {
            t = !0
        }!t || !this.node.animationState || (this.node.animationState.setActive("whileFocus", !0), this.isActive = !0)
    }
    onBlur() {
        !this.isActive || !this.node.animationState || (this.node.animationState.setActive("whileFocus", !1), this.isActive = !1)
    }
    mount() {
        this.unmount = yn(jt(this.node.current, "focus", () => this.onFocus()), jt(this.node.current, "blur", () => this.onBlur()))
    }
    unmount() {}
}
const N0 = (e, t) => t ? e === t ? !0 : N0(e, t.parentElement) : !1;

function il(e, t) {
    if (!t) return;
    const n = new PointerEvent("pointer" + e);
    t(n, ra(n))
}
class Av extends Tn {
    constructor() {
        super(...arguments), this.removeStartListeners = Pe, this.removeEndListeners = Pe, this.removeAccessibleListeners = Pe, this.startPointerPress = (t, n) => {
            if (this.removeEndListeners(), this.isPressing) return;
            const r = this.node.getProps(),
                o = Bt(window, "pointerup", (a, l) => {
                    if (!this.checkPressEnd()) return;
                    const {
                        onTap: u,
                        onTapCancel: c
                    } = this.node.getProps();
                    he.update(() => {
                        N0(this.node.current, a.target) ? u && u(a, l) : c && c(a, l)
                    })
                }, {
                    passive: !(r.onTap || r.onPointerUp)
                }),
                s = Bt(window, "pointercancel", (a, l) => this.cancelPress(a, l), {
                    passive: !(r.onTapCancel || r.onPointerCancel)
                });
            this.removeEndListeners = yn(o, s), this.startPress(t, n)
        }, this.startAccessiblePress = () => {
            const t = o => {
                    if (o.key !== "Enter" || this.isPressing) return;
                    const s = a => {
                        a.key !== "Enter" || !this.checkPressEnd() || il("up", (l, u) => {
                            const {
                                onTap: c
                            } = this.node.getProps();
                            c && he.update(() => c(l, u))
                        })
                    };
                    this.removeEndListeners(), this.removeEndListeners = jt(this.node.current, "keyup", s), il("down", (a, l) => {
                        this.startPress(a, l)
                    })
                },
                n = jt(this.node.current, "keydown", t),
                r = () => {
                    this.isPressing && il("cancel", (o, s) => this.cancelPress(o, s))
                },
                i = jt(this.node.current, "blur", r);
            this.removeAccessibleListeners = yn(n, i)
        }
    }
    startPress(t, n) {
        this.isPressing = !0;
        const {
            onTapStart: r,
            whileTap: i
        } = this.node.getProps();
        i && this.node.animationState && this.node.animationState.setActive("whileTap", !0), r && he.update(() => r(t, n))
    }
    checkPressEnd() {
        return this.removeEndListeners(), this.isPressing = !1, this.node.getProps().whileTap && this.node.animationState && this.node.animationState.setActive("whileTap", !1), !$0()
    }
    cancelPress(t, n) {
        if (!this.checkPressEnd()) return;
        const {
            onTapCancel: r
        } = this.node.getProps();
        r && he.update(() => r(t, n))
    }
    mount() {
        const t = this.node.getProps(),
            n = Bt(this.node.current, "pointerdown", this.startPointerPress, {
                passive: !(t.onTapStart || t.onPointerStart)
            }),
            r = jt(this.node.current, "focus", this.startAccessiblePress);
        this.removeStartListeners = yn(n, r)
    }
    unmount() {
        this.removeStartListeners(), this.removeEndListeners(), this.removeAccessibleListeners()
    }
}
const vu = new WeakMap,
    ol = new WeakMap,
    Mv = e => {
        const t = vu.get(e.target);
        t && t(e)
    },
    Ov = e => {
        e.forEach(Mv)
    };

function Fv({
    root: e,
    ...t
}) {
    const n = e || document;
    ol.has(n) || ol.set(n, {});
    const r = ol.get(n),
        i = JSON.stringify(t);
    return r[i] || (r[i] = new IntersectionObserver(Ov, {
        root: e,
        ...t
    })), r[i]
}

function Lv(e, t, n) {
    const r = Fv(t);
    return vu.set(e, n), r.observe(e), () => {
        vu.delete(e), r.unobserve(e)
    }
}
const bv = {
    some: 0,
    all: 1
};
class Dv extends Tn {
    constructor() {
        super(...arguments), this.hasEnteredView = !1, this.isInView = !1
    }
    startObserver() {
        this.unmount();
        const {
            viewport: t = {}
        } = this.node.getProps(), {
            root: n,
            margin: r,
            amount: i = "some",
            once: o
        } = t, s = {
            root: n ? n.current : void 0,
            rootMargin: r,
            threshold: typeof i == "number" ? i : bv[i]
        }, a = l => {
            const {
                isIntersecting: u
            } = l;
            if (this.isInView === u || (this.isInView = u, o && !u && this.hasEnteredView)) return;
            u && (this.hasEnteredView = !0), this.node.animationState && this.node.animationState.setActive("whileInView", u);
            const {
                onViewportEnter: c,
                onViewportLeave: f
            } = this.node.getProps(), d = u ? c : f;
            d && d(l)
        };
        return Lv(this.node.current, s, a)
    }
    mount() {
        this.startObserver()
    }
    update() {
        if (typeof IntersectionObserver > "u") return;
        const {
            props: t,
            prevProps: n
        } = this.node;
        ["amount", "margin", "root"].some(Vv(t, n)) && this.startObserver()
    }
    unmount() {}
}

function Vv({
    viewport: e = {}
}, {
    viewport: t = {}
} = {}) {
    return n => e[n] !== t[n]
}
const _v = {
    inView: {
        Feature: Dv
    },
    tap: {
        Feature: Av
    },
    focus: {
        Feature: Rv
    },
    hover: {
        Feature: Tv
    }
};

function j0(e, t) {
    if (!Array.isArray(t)) return !1;
    const n = t.length;
    if (n !== e.length) return !1;
    for (let r = 0; r < n; r++)
        if (t[r] !== e[r]) return !1;
    return !0
}

function Iv(e) {
    const t = {};
    return e.values.forEach((n, r) => t[r] = n.get()), t
}

function $v(e) {
    const t = {};
    return e.values.forEach((n, r) => t[r] = n.getVelocity()), t
}

function ia(e, t, n) {
    const r = e.getProps();
    return qc(r, t, n !== void 0 ? n : r.custom, Iv(e), $v(e))
}
const Nv = "framerAppearId",
    jv = "data-" + Wc(Nv);
let Gc = Pe,
    oa = Pe;
const vn = e => e * 1e3,
    Ut = e => e / 1e3,
    _d = {
        current: !1
    },
    z0 = e => Array.isArray(e) && typeof e[0] == "number";

function B0(e) {
    return Boolean(!e || typeof e == "string" && U0[e] || z0(e) || Array.isArray(e) && e.every(B0))
}
const oi = ([e, t, n, r]) => `cubic-bezier(${e}, ${t}, ${n}, ${r})`,
    U0 = {
        linear: "linear",
        ease: "ease",
        easeIn: "ease-in",
        easeOut: "ease-out",
        easeInOut: "ease-in-out",
        circIn: oi([0, .65, .55, 1]),
        circOut: oi([.55, 0, 1, .45]),
        backIn: oi([.31, .01, .66, -.59]),
        backOut: oi([.33, 1.53, .69, .99])
    };

function Q0(e) {
    if (e) return z0(e) ? oi(e) : Array.isArray(e) ? e.map(Q0) : U0[e]
}

function zv(e, t, n, {
    delay: r = 0,
    duration: i,
    repeat: o = 0,
    repeatType: s = "loop",
    ease: a,
    times: l
} = {}) {
    const u = {
        [t]: n
    };
    l && (u.offset = l);
    const c = Q0(a);
    return Array.isArray(c) && (u.easing = c), e.animate(u, {
        delay: r,
        duration: i,
        easing: Array.isArray(c) ? "linear" : c,
        fill: "both",
        iterations: o + 1,
        direction: s === "reverse" ? "alternate" : "normal"
    })
}

function Bv(e, {
    repeat: t,
    repeatType: n = "loop"
}) {
    const r = t && n !== "loop" && t % 2 === 1 ? 0 : e.length - 1;
    return e[r]
}
const H0 = (e, t, n) => (((1 - 3 * n + 3 * t) * e + (3 * n - 6 * t)) * e + 3 * t) * e,
    Uv = 1e-7,
    Qv = 12;

function Hv(e, t, n, r, i) {
    let o, s, a = 0;
    do s = t + (n - t) / 2, o = H0(s, r, i) - e, o > 0 ? n = s : t = s; while (Math.abs(o) > Uv && ++a < Qv);
    return s
}

function Yi(e, t, n, r) {
    if (e === t && n === r) return Pe;
    const i = o => Hv(o, 0, 1, e, n);
    return o => o === 0 || o === 1 ? o : H0(i(o), t, r)
}
const Wv = Yi(.42, 0, 1, 1),
    Kv = Yi(0, 0, .58, 1),
    W0 = Yi(.42, 0, .58, 1),
    qv = e => Array.isArray(e) && typeof e[0] != "number",
    K0 = e => t => t <= .5 ? e(2 * t) / 2 : (2 - e(2 * (1 - t))) / 2,
    q0 = e => t => 1 - e(1 - t),
    G0 = e => 1 - Math.sin(Math.acos(e)),
    Zc = q0(G0),
    Gv = K0(Zc),
    Z0 = Yi(.33, 1.53, .69, .99),
    Yc = q0(Z0),
    Zv = K0(Yc),
    Yv = e => (e *= 2) < 1 ? .5 * Yc(e) : .5 * (2 - Math.pow(2, -10 * (e - 1))),
    Xv = {
        linear: Pe,
        easeIn: Wv,
        easeInOut: W0,
        easeOut: Kv,
        circIn: G0,
        circInOut: Gv,
        circOut: Zc,
        backIn: Yc,
        backInOut: Zv,
        backOut: Z0,
        anticipate: Yv
    },
    Id = e => {
        if (Array.isArray(e)) {
            oa(e.length === 4);
            const [t, n, r, i] = e;
            return Yi(t, n, r, i)
        } else if (typeof e == "string") return Xv[e];
        return e
    },
    Xc = (e, t) => n => Boolean(Gi(n) && Jy.test(n) && n.startsWith(e) || t && Object.prototype.hasOwnProperty.call(n, t)),
    Y0 = (e, t, n) => r => {
        if (!Gi(r)) return r;
        const [i, o, s, a] = r.match(na);
        return {
            [e]: parseFloat(i),
            [t]: parseFloat(o),
            [n]: parseFloat(s),
            alpha: a !== void 0 ? parseFloat(a) : 1
        }
    },
    Jv = e => Sn(0, 255, e),
    sl = {
        ...Gn,
        transform: e => Math.round(Jv(e))
    },
    Vn = {
        test: Xc("rgb", "red"),
        parse: Y0("red", "green", "blue"),
        transform: ({
            red: e,
            green: t,
            blue: n,
            alpha: r = 1
        }) => "rgba(" + sl.transform(e) + ", " + sl.transform(t) + ", " + sl.transform(n) + ", " + yi(mi.transform(r)) + ")"
    };

function eg(e) {
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
const gu = {
        test: Xc("#"),
        parse: eg,
        transform: Vn.transform
    },
    hr = {
        test: Xc("hsl", "hue"),
        parse: Y0("hue", "saturation", "lightness"),
        transform: ({
            hue: e,
            saturation: t,
            lightness: n,
            alpha: r = 1
        }) => "hsla(" + Math.round(e) + ", " + Vt.transform(yi(t)) + ", " + Vt.transform(yi(n)) + ", " + yi(mi.transform(r)) + ")"
    },
    We = {
        test: e => Vn.test(e) || gu.test(e) || hr.test(e),
        parse: e => Vn.test(e) ? Vn.parse(e) : hr.test(e) ? hr.parse(e) : gu.parse(e),
        transform: e => Gi(e) ? e : e.hasOwnProperty("red") ? Vn.transform(e) : hr.transform(e)
    },
    Ce = (e, t, n) => -n * e + n * t + e;

function al(e, t, n) {
    return n < 0 && (n += 1), n > 1 && (n -= 1), n < 1 / 6 ? e + (t - e) * 6 * n : n < 1 / 2 ? t : n < 2 / 3 ? e + (t - e) * (2 / 3 - n) * 6 : e
}

function tg({
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
        const a = n < .5 ? n * (1 + t) : n + t - n * t,
            l = 2 * n - a;
        i = al(l, a, e + 1 / 3), o = al(l, a, e), s = al(l, a, e - 1 / 3)
    }
    return {
        red: Math.round(i * 255),
        green: Math.round(o * 255),
        blue: Math.round(s * 255),
        alpha: r
    }
}
const ll = (e, t, n) => {
        const r = e * e;
        return Math.sqrt(Math.max(0, n * (t * t - r) + r))
    },
    ng = [gu, Vn, hr],
    rg = e => ng.find(t => t.test(e));

function $d(e) {
    const t = rg(e);
    let n = t.parse(e);
    return t === hr && (n = tg(n)), n
}
const X0 = (e, t) => {
    const n = $d(e),
        r = $d(t),
        i = {
            ...n
        };
    return o => (i.red = ll(n.red, r.red, o), i.green = ll(n.green, r.green, o), i.blue = ll(n.blue, r.blue, o), i.alpha = Ce(n.alpha, r.alpha, o), Vn.transform(i))
};

function ig(e) {
    var t, n;
    return isNaN(e) && Gi(e) && (((t = e.match(na)) === null || t === void 0 ? void 0 : t.length) || 0) + (((n = e.match(k0)) === null || n === void 0 ? void 0 : n.length) || 0) > 0
}
const J0 = {
        regex: Yy,
        countKey: "Vars",
        token: "${v}",
        parse: Pe
    },
    em = {
        regex: k0,
        countKey: "Colors",
        token: "${c}",
        parse: We.parse
    },
    tm = {
        regex: na,
        countKey: "Numbers",
        token: "${n}",
        parse: Gn.parse
    };

function ul(e, {
    regex: t,
    countKey: n,
    token: r,
    parse: i
}) {
    const o = e.tokenised.match(t);
    o && (e["num" + n] = o.length, e.tokenised = e.tokenised.replace(t, r), e.values.push(...o.map(i)))
}

function Ss(e) {
    const t = e.toString(),
        n = {
            value: t,
            tokenised: t,
            values: [],
            numVars: 0,
            numColors: 0,
            numNumbers: 0
        };
    return n.value.includes("var(--") && ul(n, J0), ul(n, em), ul(n, tm), n
}

function nm(e) {
    return Ss(e).values
}

function rm(e) {
    const {
        values: t,
        numColors: n,
        numVars: r,
        tokenised: i
    } = Ss(e), o = t.length;
    return s => {
        let a = i;
        for (let l = 0; l < o; l++) l < r ? a = a.replace(J0.token, s[l]) : l < r + n ? a = a.replace(em.token, We.transform(s[l])) : a = a.replace(tm.token, yi(s[l]));
        return a
    }
}
const og = e => typeof e == "number" ? 0 : e;

function sg(e) {
    const t = nm(e);
    return rm(e)(t.map(og))
}
const xn = {
        test: ig,
        parse: nm,
        createTransformer: rm,
        getAnimatableNone: sg
    },
    im = (e, t) => n => `${n>0?t:e}`;

function om(e, t) {
    return typeof e == "number" ? n => Ce(e, t, n) : We.test(e) ? X0(e, t) : e.startsWith("var(") ? im(e, t) : am(e, t)
}
const sm = (e, t) => {
        const n = [...e],
            r = n.length,
            i = e.map((o, s) => om(o, t[s]));
        return o => {
            for (let s = 0; s < r; s++) n[s] = i[s](o);
            return n
        }
    },
    ag = (e, t) => {
        const n = {
                ...e,
                ...t
            },
            r = {};
        for (const i in n) e[i] !== void 0 && t[i] !== void 0 && (r[i] = om(e[i], t[i]));
        return i => {
            for (const o in r) n[o] = r[o](i);
            return n
        }
    },
    am = (e, t) => {
        const n = xn.createTransformer(t),
            r = Ss(e),
            i = Ss(t);
        return r.numVars === i.numVars && r.numColors === i.numColors && r.numNumbers >= i.numNumbers ? yn(sm(r.values, i.values), n) : (Gc(!0), im(e, t))
    },
    ji = (e, t, n) => {
        const r = t - e;
        return r === 0 ? 1 : (n - e) / r
    },
    Nd = (e, t) => n => Ce(e, t, n);

function lg(e) {
    return typeof e == "number" ? Nd : typeof e == "string" ? We.test(e) ? X0 : am : Array.isArray(e) ? sm : typeof e == "object" ? ag : Nd
}

function ug(e, t, n) {
    const r = [],
        i = n || lg(e[0]),
        o = e.length - 1;
    for (let s = 0; s < o; s++) {
        let a = i(e[s], e[s + 1]);
        if (t) {
            const l = Array.isArray(t) ? t[s] || Pe : t;
            a = yn(l, a)
        }
        r.push(a)
    }
    return r
}

function lm(e, t, {
    clamp: n = !0,
    ease: r,
    mixer: i
} = {}) {
    const o = e.length;
    if (oa(o === t.length), o === 1) return () => t[0];
    e[0] > e[o - 1] && (e = [...e].reverse(), t = [...t].reverse());
    const s = ug(t, r, i),
        a = s.length,
        l = u => {
            let c = 0;
            if (a > 1)
                for (; c < e.length - 2 && !(u < e[c + 1]); c++);
            const f = ji(e[c], e[c + 1], u);
            return s[c](f)
        };
    return n ? u => l(Sn(e[0], e[o - 1], u)) : l
}

function cg(e, t) {
    const n = e[e.length - 1];
    for (let r = 1; r <= t; r++) {
        const i = ji(0, t, r);
        e.push(Ce(n, 1, i))
    }
}

function fg(e) {
    const t = [0];
    return cg(t, e.length - 1), t
}

function dg(e, t) {
    return e.map(n => n * t)
}

function hg(e, t) {
    return e.map(() => t || W0).splice(0, e.length - 1)
}

function xs({
    duration: e = 300,
    keyframes: t,
    times: n,
    ease: r = "easeInOut"
}) {
    const i = qv(r) ? r.map(Id) : Id(r),
        o = {
            done: !1,
            value: t[0]
        },
        s = dg(n && n.length === t.length ? n : fg(t), e),
        a = lm(s, t, {
            ease: Array.isArray(i) ? i : hg(t, i)
        });
    return {
        calculatedDuration: e,
        next: l => (o.value = a(l), o.done = l >= e, o)
    }
}

function um(e, t) {
    return t ? e * (1e3 / t) : 0
}
const pg = 5;

function cm(e, t, n) {
    const r = Math.max(t - pg, 0);
    return um(n - e(r), t - r)
}
const cl = .001,
    mg = .01,
    jd = 10,
    yg = .05,
    vg = 1;

function gg({
    duration: e = 800,
    bounce: t = .25,
    velocity: n = 0,
    mass: r = 1
}) {
    let i, o;
    Gc(e <= vn(jd));
    let s = 1 - t;
    s = Sn(yg, vg, s), e = Sn(mg, jd, Ut(e)), s < 1 ? (i = u => {
        const c = u * s,
            f = c * e,
            d = c - n,
            p = Cu(u, s),
            y = Math.exp(-f);
        return cl - d / p * y
    }, o = u => {
        const f = u * s * e,
            d = f * n + n,
            p = Math.pow(s, 2) * Math.pow(u, 2) * e,
            y = Math.exp(-f),
            g = Cu(Math.pow(u, 2), s);
        return (-i(u) + cl > 0 ? -1 : 1) * ((d - p) * y) / g
    }) : (i = u => {
        const c = Math.exp(-u * e),
            f = (u - n) * e + 1;
        return -cl + c * f
    }, o = u => {
        const c = Math.exp(-u * e),
            f = (n - u) * (e * e);
        return c * f
    });
    const a = 5 / e,
        l = wg(i, o, a);
    if (e = vn(e), isNaN(l)) return {
        stiffness: 100,
        damping: 10,
        duration: e
    };
    {
        const u = Math.pow(l, 2) * r;
        return {
            stiffness: u,
            damping: s * 2 * Math.sqrt(r * u),
            duration: e
        }
    }
}
const Cg = 12;

function wg(e, t, n) {
    let r = n;
    for (let i = 1; i < Cg; i++) r = r - e(r) / t(r);
    return r
}

function Cu(e, t) {
    return e * Math.sqrt(1 - t * t)
}
const Sg = ["duration", "bounce"],
    xg = ["stiffness", "damping", "mass"];

function zd(e, t) {
    return t.some(n => e[n] !== void 0)
}

function Pg(e) {
    let t = {
        velocity: 0,
        stiffness: 100,
        damping: 10,
        mass: 1,
        isResolvedFromDuration: !1,
        ...e
    };
    if (!zd(e, xg) && zd(e, Sg)) {
        const n = gg(e);
        t = {
            ...t,
            ...n,
            velocity: 0,
            mass: 1
        }, t.isResolvedFromDuration = !0
    }
    return t
}

function fm({
    keyframes: e,
    restDelta: t,
    restSpeed: n,
    ...r
}) {
    const i = e[0],
        o = e[e.length - 1],
        s = {
            done: !1,
            value: i
        },
        {
            stiffness: a,
            damping: l,
            mass: u,
            velocity: c,
            duration: f,
            isResolvedFromDuration: d
        } = Pg(r),
        p = c ? -Ut(c) : 0,
        y = l / (2 * Math.sqrt(a * u)),
        g = o - i,
        x = Ut(Math.sqrt(a / u)),
        v = Math.abs(g) < 5;
    n || (n = v ? .01 : 2), t || (t = v ? .005 : .5);
    let h;
    if (y < 1) {
        const m = Cu(x, y);
        h = C => {
            const S = Math.exp(-y * x * C);
            return o - S * ((p + y * x * g) / m * Math.sin(m * C) + g * Math.cos(m * C))
        }
    } else if (y === 1) h = m => o - Math.exp(-x * m) * (g + (p + x * g) * m);
    else {
        const m = x * Math.sqrt(y * y - 1);
        h = C => {
            const S = Math.exp(-y * x * C),
                k = Math.min(m * C, 300);
            return o - S * ((p + y * x * g) * Math.sinh(k) + m * g * Math.cosh(k)) / m
        }
    }
    return {
        calculatedDuration: d && f || null,
        next: m => {
            const C = h(m);
            if (d) s.done = m >= f;
            else {
                let S = p;
                m !== 0 && (y < 1 ? S = cm(h, m, C) : S = 0);
                const k = Math.abs(S) <= n,
                    T = Math.abs(o - C) <= t;
                s.done = k && T
            }
            return s.value = s.done ? o : C, s
        }
    }
}

function Bd({
    keyframes: e,
    velocity: t = 0,
    power: n = .8,
    timeConstant: r = 325,
    bounceDamping: i = 10,
    bounceStiffness: o = 500,
    modifyTarget: s,
    min: a,
    max: l,
    restDelta: u = .5,
    restSpeed: c
}) {
    const f = e[0],
        d = {
            done: !1,
            value: f
        },
        p = E => a !== void 0 && E < a || l !== void 0 && E > l,
        y = E => a === void 0 ? l : l === void 0 || Math.abs(a - E) < Math.abs(l - E) ? a : l;
    let g = n * t;
    const x = f + g,
        v = s === void 0 ? x : s(x);
    v !== x && (g = v - f);
    const h = E => -g * Math.exp(-E / r),
        m = E => v + h(E),
        C = E => {
            const _ = h(E),
                D = m(E);
            d.done = Math.abs(_) <= u, d.value = d.done ? v : D
        };
    let S, k;
    const T = E => {
        p(d.value) && (S = E, k = fm({
            keyframes: [d.value, y(d.value)],
            velocity: cm(m, E, d.value),
            damping: i,
            stiffness: o,
            restDelta: u,
            restSpeed: c
        }))
    };
    return T(0), {
        calculatedDuration: null,
        next: E => {
            let _ = !1;
            return !k && S === void 0 && (_ = !0, C(E), T(E)), S !== void 0 && E > S ? k.next(E - S) : (!_ && C(E), d)
        }
    }
}
const kg = e => {
        const t = ({
            timestamp: n
        }) => e(n);
        return {
            start: () => he.update(t, !0),
            stop: () => qt(t),
            now: () => Fe.isProcessing ? Fe.timestamp : performance.now()
        }
    },
    Ud = 2e4;

function Qd(e) {
    let t = 0;
    const n = 50;
    let r = e.next(t);
    for (; !r.done && t < Ud;) t += n, r = e.next(t);
    return t >= Ud ? 1 / 0 : t
}
const Eg = {
    decay: Bd,
    inertia: Bd,
    tween: xs,
    keyframes: xs,
    spring: fm
};

function Ps({
    autoplay: e = !0,
    delay: t = 0,
    driver: n = kg,
    keyframes: r,
    type: i = "keyframes",
    repeat: o = 0,
    repeatDelay: s = 0,
    repeatType: a = "loop",
    onPlay: l,
    onStop: u,
    onComplete: c,
    onUpdate: f,
    ...d
}) {
    let p = 1,
        y = !1,
        g, x;
    const v = () => {
        x = new Promise($ => {
            g = $
        })
    };
    v();
    let h;
    const m = Eg[i] || xs;
    let C;
    m !== xs && typeof r[0] != "number" && (C = lm([0, 100], r, {
        clamp: !1
    }), r = [0, 100]);
    const S = m({
        ...d,
        keyframes: r
    });
    let k;
    a === "mirror" && (k = m({
        ...d,
        keyframes: [...r].reverse(),
        velocity: -(d.velocity || 0)
    }));
    let T = "idle",
        E = null,
        _ = null,
        D = null;
    S.calculatedDuration === null && o && (S.calculatedDuration = Qd(S));
    const {
        calculatedDuration: ee
    } = S;
    let Z = 1 / 0,
        J = 1 / 0;
    ee !== null && (Z = ee + s, J = Z * (o + 1) - s);
    let H = 0;
    const Q = $ => {
            if (_ === null) return;
            p > 0 && (_ = Math.min(_, $)), p < 0 && (_ = Math.min($ - J / p, _)), E !== null ? H = E : H = Math.round($ - _) * p;
            const M = H - t * (p >= 0 ? 1 : -1),
                L = p >= 0 ? M < 0 : M > J;
            H = Math.max(M, 0), T === "finished" && E === null && (H = J);
            let b = H,
                z = S;
            if (o) {
                const fe = H / Z;
                let X = Math.floor(fe),
                    G = fe % 1;
                !G && fe >= 1 && (G = 1), G === 1 && X--, X = Math.min(X, o + 1);
                const B = Boolean(X % 2);
                B && (a === "reverse" ? (G = 1 - G, s && (G -= s / Z)) : a === "mirror" && (z = k));
                let Te = Sn(0, 1, G);
                H > J && (Te = a === "reverse" && B ? 1 : 0), b = Te * Z
            }
            const w = L ? {
                done: !1,
                value: r[0]
            } : z.next(b);
            C && (w.value = C(w.value));
            let {
                done: K
            } = w;
            !L && ee !== null && (K = p >= 0 ? H >= J : H <= 0);
            const F = E === null && (T === "finished" || T === "running" && K);
            return f && f(w.value), F && A(), w
        },
        ie = () => {
            h && h.stop(), h = void 0
        },
        ue = () => {
            T = "idle", ie(), g(), v(), _ = D = null
        },
        A = () => {
            T = "finished", c && c(), ie(), g()
        },
        I = () => {
            if (y) return;
            h || (h = n(Q));
            const $ = h.now();
            l && l(), E !== null ? _ = $ - E : (!_ || T === "finished") && (_ = $), T === "finished" && v(), D = _, E = null, T = "running", h.start()
        };
    e && I();
    const N = {
        then($, M) {
            return x.then($, M)
        },
        get time() {
            return Ut(H)
        },
        set time($) {
            $ = vn($), H = $, E !== null || !h || p === 0 ? E = $ : _ = h.now() - $ / p
        },
        get duration() {
            const $ = S.calculatedDuration === null ? Qd(S) : S.calculatedDuration;
            return Ut($)
        },
        get speed() {
            return p
        },
        set speed($) {
            $ === p || !h || (p = $, N.time = Ut(H))
        },
        get state() {
            return T
        },
        play: I,
        pause: () => {
            T = "paused", E = H
        },
        stop: () => {
            y = !0, T !== "idle" && (T = "idle", u && u(), ue())
        },
        cancel: () => {
            D !== null && Q(D), ue()
        },
        complete: () => {
            T = "finished"
        },
        sample: $ => (_ = 0, Q($))
    };
    return N
}

function Tg(e) {
    let t;
    return () => (t === void 0 && (t = e()), t)
}
const Rg = Tg(() => Object.hasOwnProperty.call(Element.prototype, "animate")),
    Ag = new Set(["opacity", "clipPath", "filter", "transform", "backgroundColor"]),
    xo = 10,
    Mg = 2e4,
    Og = (e, t) => t.type === "spring" || e === "backgroundColor" || !B0(t.ease);

function Fg(e, t, {
    onUpdate: n,
    onComplete: r,
    ...i
}) {
    if (!(Rg() && Ag.has(t) && !i.repeatDelay && i.repeatType !== "mirror" && i.damping !== 0 && i.type !== "inertia")) return !1;
    let s = !1,
        a, l;
    const u = () => {
        l = new Promise(h => {
            a = h
        })
    };
    u();
    let {
        keyframes: c,
        duration: f = 300,
        ease: d,
        times: p
    } = i;
    if (Og(t, i)) {
        const h = Ps({
            ...i,
            repeat: 0,
            delay: 0
        });
        let m = {
            done: !1,
            value: c[0]
        };
        const C = [];
        let S = 0;
        for (; !m.done && S < Mg;) m = h.sample(S), C.push(m.value), S += xo;
        p = void 0, c = C, f = S - xo, d = "linear"
    }
    const y = zv(e.owner.current, t, c, {
        ...i,
        duration: f,
        ease: d,
        times: p
    });
    i.syncStart && (y.startTime = Fe.isProcessing ? Fe.timestamp : document.timeline ? document.timeline.currentTime : performance.now());
    const g = () => y.cancel(),
        x = () => {
            he.update(g), a(), u()
        };
    return y.onfinish = () => {
        e.set(Bv(c, i)), r && r(), x()
    }, {
        then(h, m) {
            return l.then(h, m)
        },
        attachTimeline(h) {
            return y.timeline = h, y.onfinish = null, Pe
        },
        get time() {
            return Ut(y.currentTime || 0)
        },
        set time(h) {
            y.currentTime = vn(h)
        },
        get speed() {
            return y.playbackRate
        },
        set speed(h) {
            y.playbackRate = h
        },
        get duration() {
            return Ut(f)
        },
        play: () => {
            s || (y.play(), qt(g))
        },
        pause: () => y.pause(),
        stop: () => {
            if (s = !0, y.playState === "idle") return;
            const {
                currentTime: h
            } = y;
            if (h) {
                const m = Ps({
                    ...i,
                    autoplay: !1
                });
                e.setWithVelocity(m.sample(h - xo).value, m.sample(h).value, xo)
            }
            x()
        },
        complete: () => y.finish(),
        cancel: x
    }
}

function Lg({
    keyframes: e,
    delay: t,
    onUpdate: n,
    onComplete: r
}) {
    const i = () => (n && n(e[e.length - 1]), r && r(), {
        time: 0,
        speed: 1,
        duration: 0,
        play: Pe,
        pause: Pe,
        stop: Pe,
        then: o => (o(), Promise.resolve()),
        cancel: Pe,
        complete: Pe
    });
    return t ? Ps({
        keyframes: [0, 1],
        duration: 0,
        delay: t,
        onComplete: i
    }) : i()
}
const bg = {
        type: "spring",
        stiffness: 500,
        damping: 25,
        restSpeed: 10
    },
    Dg = e => ({
        type: "spring",
        stiffness: 550,
        damping: e === 0 ? 2 * Math.sqrt(550) : 30,
        restSpeed: 10
    }),
    Vg = {
        type: "keyframes",
        duration: .8
    },
    _g = {
        type: "keyframes",
        ease: [.25, .1, .35, 1],
        duration: .3
    },
    Ig = (e, {
        keyframes: t
    }) => t.length > 2 ? Vg : qn.has(e) ? e.startsWith("scale") ? Dg(t[1]) : bg : _g,
    wu = (e, t) => e === "zIndex" ? !1 : !!(typeof t == "number" || Array.isArray(t) || typeof t == "string" && (xn.test(t) || t === "0") && !t.startsWith("url(")),
    $g = new Set(["brightness", "contrast", "saturate", "opacity"]);

function Ng(e) {
    const [t, n] = e.slice(0, -1).split("(");
    if (t === "drop-shadow") return e;
    const [r] = n.match(na) || [];
    if (!r) return e;
    const i = n.replace(r, "");
    let o = $g.has(t) ? 1 : 0;
    return r !== n && (o *= 100), t + "(" + o + i + ")"
}
const jg = /([a-z-]*)\(.*?\)/g,
    Su = {
        ...xn,
        getAnimatableNone: e => {
            const t = e.match(jg);
            return t ? t.map(Ng).join(" ") : e
        }
    },
    zg = {
        ...E0,
        color: We,
        backgroundColor: We,
        outlineColor: We,
        fill: We,
        stroke: We,
        borderColor: We,
        borderTopColor: We,
        borderRightColor: We,
        borderBottomColor: We,
        borderLeftColor: We,
        filter: Su,
        WebkitFilter: Su
    },
    Jc = e => zg[e];

function dm(e, t) {
    let n = Jc(e);
    return n !== Su && (n = xn), n.getAnimatableNone ? n.getAnimatableNone(t) : void 0
}
const hm = e => /^0[^.\s]+$/.test(e);

function Bg(e) {
    if (typeof e == "number") return e === 0;
    if (e !== null) return e === "none" || e === "0" || hm(e)
}

function Ug(e, t, n, r) {
    const i = wu(t, n);
    let o;
    Array.isArray(n) ? o = [...n] : o = [null, n];
    const s = r.from !== void 0 ? r.from : e.get();
    let a;
    const l = [];
    for (let u = 0; u < o.length; u++) o[u] === null && (o[u] = u === 0 ? s : o[u - 1]), Bg(o[u]) && l.push(u), typeof o[u] == "string" && o[u] !== "none" && o[u] !== "0" && (a = o[u]);
    if (i && l.length && a)
        for (let u = 0; u < l.length; u++) {
            const c = l[u];
            o[c] = dm(t, a)
        }
    return o
}

function Qg({
    when: e,
    delay: t,
    delayChildren: n,
    staggerChildren: r,
    staggerDirection: i,
    repeat: o,
    repeatType: s,
    repeatDelay: a,
    from: l,
    elapsed: u,
    ...c
}) {
    return !!Object.keys(c).length
}

function pm(e, t) {
    return e[t] || e.default || e
}
const ef = (e, t, n, r = {}) => i => {
    const o = pm(r, e) || {},
        s = o.delay || r.delay || 0;
    let {
        elapsed: a = 0
    } = r;
    a = a - vn(s);
    const l = Ug(t, e, n, o),
        u = l[0],
        c = l[l.length - 1],
        f = wu(e, u),
        d = wu(e, c);
    Gc(f === d);
    let p = {
        keyframes: l,
        velocity: t.getVelocity(),
        ease: "easeOut",
        ...o,
        delay: -a,
        onUpdate: y => {
            t.set(y), o.onUpdate && o.onUpdate(y)
        },
        onComplete: () => {
            i(), o.onComplete && o.onComplete()
        }
    };
    if (Qg(o) || (p = {
            ...p,
            ...Ig(e, p)
        }), p.duration && (p.duration = vn(p.duration)), p.repeatDelay && (p.repeatDelay = vn(p.repeatDelay)), !f || !d || _d.current || o.type === !1) return Lg(_d.current ? {
        ...p,
        delay: 0
    } : p);
    if (t.owner && t.owner.current instanceof HTMLElement && !t.owner.getProps().onUpdate) {
        const y = Fg(t, e, p);
        if (y) return y
    }
    return Ps(p)
};

function ks(e) {
    return Boolean(rt(e) && e.add)
}
const mm = e => /^\-?\d*\.?\d+$/.test(e);

function tf(e, t) {
    e.indexOf(t) === -1 && e.push(t)
}

function nf(e, t) {
    const n = e.indexOf(t);
    n > -1 && e.splice(n, 1)
}
class rf {
    constructor() {
        this.subscriptions = []
    }
    add(t) {
        return tf(this.subscriptions, t), () => nf(this.subscriptions, t)
    }
    notify(t, n, r) {
        const i = this.subscriptions.length;
        if (i)
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
const Hg = e => !isNaN(parseFloat(e));
class Wg {
    constructor(t, n = {}) {
        this.version = "10.16.4", this.timeDelta = 0, this.lastUpdated = 0, this.canTrackVelocity = !1, this.events = {}, this.updateAndNotify = (r, i = !0) => {
            this.prev = this.current, this.current = r;
            const {
                delta: o,
                timestamp: s
            } = Fe;
            this.lastUpdated !== s && (this.timeDelta = o, this.lastUpdated = s, he.postRender(this.scheduleVelocityCheck)), this.prev !== this.current && this.events.change && this.events.change.notify(this.current), this.events.velocityChange && this.events.velocityChange.notify(this.getVelocity()), i && this.events.renderRequest && this.events.renderRequest.notify(this.current)
        }, this.scheduleVelocityCheck = () => he.postRender(this.velocityCheck), this.velocityCheck = ({
            timestamp: r
        }) => {
            r !== this.lastUpdated && (this.prev = this.current, this.events.velocityChange && this.events.velocityChange.notify(this.getVelocity()))
        }, this.hasAnimated = !1, this.prev = this.current = t, this.canTrackVelocity = Hg(this.current), this.owner = n.owner
    }
    onChange(t) {
        return this.on("change", t)
    }
    on(t, n) {
        this.events[t] || (this.events[t] = new rf);
        const r = this.events[t].add(n);
        return t === "change" ? () => {
            r(), he.read(() => {
                this.events.change.getSize() || this.stop()
            })
        } : r
    }
    clearListeners() {
        for (const t in this.events) this.events[t].clear()
    }
    attach(t, n) {
        this.passiveEffect = t, this.stopPassiveEffect = n
    }
    set(t, n = !0) {
        !n || !this.passiveEffect ? this.updateAndNotify(t, n) : this.passiveEffect(t, this.updateAndNotify)
    }
    setWithVelocity(t, n, r) {
        this.set(n), this.prev = t, this.timeDelta = r
    }
    jump(t) {
        this.updateAndNotify(t), this.prev = t, this.stop(), this.stopPassiveEffect && this.stopPassiveEffect()
    }
    get() {
        return this.current
    }
    getPrevious() {
        return this.prev
    }
    getVelocity() {
        return this.canTrackVelocity ? um(parseFloat(this.current) - parseFloat(this.prev), this.timeDelta) : 0
    }
    start(t) {
        return this.stop(), new Promise(n => {
            this.hasAnimated = !0, this.animation = t(n), this.events.animationStart && this.events.animationStart.notify()
        }).then(() => {
            this.events.animationComplete && this.events.animationComplete.notify(), this.clearAnimation()
        })
    }
    stop() {
        this.animation && (this.animation.stop(), this.events.animationCancel && this.events.animationCancel.notify()), this.clearAnimation()
    }
    isAnimating() {
        return !!this.animation
    }
    clearAnimation() {
        delete this.animation
    }
    destroy() {
        this.clearListeners(), this.stop(), this.stopPassiveEffect && this.stopPassiveEffect()
    }
}

function Lr(e, t) {
    return new Wg(e, t)
}
const ym = e => t => t.test(e),
    Kg = {
        test: e => e === "auto",
        parse: e => e
    },
    vm = [Gn, j, Vt, Xt, tv, ev, Kg],
    Xr = e => vm.find(ym(e)),
    qg = [...vm, We, xn],
    Gg = e => qg.find(ym(e));

function Zg(e, t, n) {
    e.hasValue(t) ? e.getValue(t).set(n) : e.addValue(t, Lr(n))
}

function Yg(e, t) {
    const n = ia(e, t);
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
        const a = mv(o[s]);
        Zg(e, s, a)
    }
}

function Xg(e, t, n) {
    var r, i;
    const o = Object.keys(t).filter(a => !e.hasValue(a)),
        s = o.length;
    if (s)
        for (let a = 0; a < s; a++) {
            const l = o[a],
                u = t[l];
            let c = null;
            Array.isArray(u) && (c = u[0]), c === null && (c = (i = (r = n[l]) !== null && r !== void 0 ? r : e.readValue(l)) !== null && i !== void 0 ? i : t[l]), c != null && (typeof c == "string" && (mm(c) || hm(c)) ? c = parseFloat(c) : !Gg(c) && xn.test(u) && (c = dm(l, u)), e.addValue(l, Lr(c, {
                owner: e
            })), n[l] === void 0 && (n[l] = c), c !== null && e.setBaseTarget(l, c))
        }
}

function Jg(e, t) {
    return t ? (t[e] || t.default || t).from : void 0
}

function e4(e, t, n) {
    const r = {};
    for (const i in e) {
        const o = Jg(i, t);
        if (o !== void 0) r[i] = o;
        else {
            const s = n.getValue(i);
            s && (r[i] = s.get())
        }
    }
    return r
}

function t4({
    protectedKeys: e,
    needsAnimating: t
}, n) {
    const r = e.hasOwnProperty(n) && t[n] !== !0;
    return t[n] = !1, r
}

function gm(e, t, {
    delay: n = 0,
    transitionOverride: r,
    type: i
} = {}) {
    let {
        transition: o = e.getDefaultTransition(),
        transitionEnd: s,
        ...a
    } = e.makeTargetAnimatable(t);
    const l = e.getValue("willChange");
    r && (o = r);
    const u = [],
        c = i && e.animationState && e.animationState.getState()[i];
    for (const f in a) {
        const d = e.getValue(f),
            p = a[f];
        if (!d || p === void 0 || c && t4(c, f)) continue;
        const y = {
            delay: n,
            elapsed: 0,
            ...o
        };
        if (window.HandoffAppearAnimations && !d.hasAnimated) {
            const x = e.getProps()[jv];
            x && (y.elapsed = window.HandoffAppearAnimations(x, f, d, he), y.syncStart = !0)
        }
        d.start(ef(f, d, p, e.shouldReduceMotion && qn.has(f) ? {
            type: !1
        } : y));
        const g = d.animation;
        ks(l) && (l.add(f), g.then(() => l.remove(f))), u.push(g)
    }
    return s && Promise.all(u).then(() => {
        s && Yg(e, s)
    }), u
}

function xu(e, t, n = {}) {
    const r = ia(e, t, n.custom);
    let {
        transition: i = e.getDefaultTransition() || {}
    } = r || {};
    n.transitionOverride && (i = n.transitionOverride);
    const o = r ? () => Promise.all(gm(e, r, n)) : () => Promise.resolve(),
        s = e.variantChildren && e.variantChildren.size ? (l = 0) => {
            const {
                delayChildren: u = 0,
                staggerChildren: c,
                staggerDirection: f
            } = i;
            return n4(e, t, u + l, c, f, n)
        } : () => Promise.resolve(),
        {
            when: a
        } = i;
    if (a) {
        const [l, u] = a === "beforeChildren" ? [o, s] : [s, o];
        return l().then(() => u())
    } else return Promise.all([o(), s(n.delay)])
}

function n4(e, t, n = 0, r = 0, i = 1, o) {
    const s = [],
        a = (e.variantChildren.size - 1) * r,
        l = i === 1 ? (u = 0) => u * r : (u = 0) => a - u * r;
    return Array.from(e.variantChildren).sort(r4).forEach((u, c) => {
        u.notify("AnimationStart", t), s.push(xu(u, t, {
            ...o,
            delay: n + l(c)
        }).then(() => u.notify("AnimationComplete", t)))
    }), Promise.all(s)
}

function r4(e, t) {
    return e.sortNodePosition(t)
}

function i4(e, t, n = {}) {
    e.notify("AnimationStart", t);
    let r;
    if (Array.isArray(t)) {
        const i = t.map(o => xu(e, o, n));
        r = Promise.all(i)
    } else if (typeof t == "string") r = xu(e, t, n);
    else {
        const i = typeof t == "function" ? ia(e, t, n.custom) : t;
        r = Promise.all(gm(e, i, n))
    }
    return r.then(() => e.notify("AnimationComplete", t))
}
const o4 = [...$c].reverse(),
    s4 = $c.length;

function a4(e) {
    return t => Promise.all(t.map(({
        animation: n,
        options: r
    }) => i4(e, n, r)))
}

function l4(e) {
    let t = a4(e);
    const n = c4();
    let r = !0;
    const i = (l, u) => {
        const c = ia(e, u);
        if (c) {
            const {
                transition: f,
                transitionEnd: d,
                ...p
            } = c;
            l = {
                ...l,
                ...p,
                ...d
            }
        }
        return l
    };

    function o(l) {
        t = l(e)
    }

    function s(l, u) {
        const c = e.getProps(),
            f = e.getVariantContext(!0) || {},
            d = [],
            p = new Set;
        let y = {},
            g = 1 / 0;
        for (let v = 0; v < s4; v++) {
            const h = o4[v],
                m = n[h],
                C = c[h] !== void 0 ? c[h] : f[h],
                S = $i(C),
                k = h === u ? m.isActive : null;
            k === !1 && (g = v);
            let T = C === f[h] && C !== c[h] && S;
            if (T && r && e.manuallyAnimateOnMount && (T = !1), m.protectedKeys = {
                    ...y
                }, !m.isActive && k === null || !C && !m.prevProp || ea(C) || typeof C == "boolean") continue;
            const E = u4(m.prevProp, C);
            let _ = E || h === u && m.isActive && !T && S || v > g && S;
            const D = Array.isArray(C) ? C : [C];
            let ee = D.reduce(i, {});
            k === !1 && (ee = {});
            const {
                prevResolvedValues: Z = {}
            } = m, J = {
                ...Z,
                ...ee
            }, H = Q => {
                _ = !0, p.delete(Q), m.needsAnimating[Q] = !0
            };
            for (const Q in J) {
                const ie = ee[Q],
                    ue = Z[Q];
                y.hasOwnProperty(Q) || (ie !== ue ? ws(ie) && ws(ue) ? !j0(ie, ue) || E ? H(Q) : m.protectedKeys[Q] = !0 : ie !== void 0 ? H(Q) : p.add(Q) : ie !== void 0 && p.has(Q) ? H(Q) : m.protectedKeys[Q] = !0)
            }
            m.prevProp = C, m.prevResolvedValues = ee, m.isActive && (y = {
                ...y,
                ...ee
            }), r && e.blockInitialAnimation && (_ = !1), _ && !T && d.push(...D.map(Q => ({
                animation: Q,
                options: {
                    type: h,
                    ...l
                }
            })))
        }
        if (p.size) {
            const v = {};
            p.forEach(h => {
                const m = e.getBaseTarget(h);
                m !== void 0 && (v[h] = m)
            }), d.push({
                animation: v
            })
        }
        let x = Boolean(d.length);
        return r && c.initial === !1 && !e.manuallyAnimateOnMount && (x = !1), r = !1, x ? t(d) : Promise.resolve()
    }

    function a(l, u, c) {
        var f;
        if (n[l].isActive === u) return Promise.resolve();
        (f = e.variantChildren) === null || f === void 0 || f.forEach(p => {
            var y;
            return (y = p.animationState) === null || y === void 0 ? void 0 : y.setActive(l, u)
        }), n[l].isActive = u;
        const d = s(c, l);
        for (const p in n) n[p].protectedKeys = {};
        return d
    }
    return {
        animateChanges: s,
        setActive: a,
        setAnimateFunction: o,
        getState: () => n
    }
}

function u4(e, t) {
    return typeof t == "string" ? t !== e : Array.isArray(t) ? !j0(t, e) : !1
}

function Rn(e = !1) {
    return {
        isActive: e,
        protectedKeys: {},
        needsAnimating: {},
        prevResolvedValues: {}
    }
}

function c4() {
    return {
        animate: Rn(!0),
        whileInView: Rn(),
        whileHover: Rn(),
        whileTap: Rn(),
        whileDrag: Rn(),
        whileFocus: Rn(),
        exit: Rn()
    }
}
class f4 extends Tn {
    constructor(t) {
        super(t), t.animationState || (t.animationState = l4(t))
    }
    updateAnimationControlsSubscription() {
        const {
            animate: t
        } = this.node.getProps();
        this.unmount(), ea(t) && (this.unmount = t.subscribe(this.node))
    }
    mount() {
        this.updateAnimationControlsSubscription()
    }
    update() {
        const {
            animate: t
        } = this.node.getProps(), {
            animate: n
        } = this.node.prevProps || {};
        t !== n && this.updateAnimationControlsSubscription()
    }
    unmount() {}
}
let d4 = 0;
class h4 extends Tn {
    constructor() {
        super(...arguments), this.id = d4++
    }
    update() {
        if (!this.node.presenceContext) return;
        const {
            isPresent: t,
            onExitComplete: n,
            custom: r
        } = this.node.presenceContext, {
            isPresent: i
        } = this.node.prevPresenceContext || {};
        if (!this.node.animationState || t === i) return;
        const o = this.node.animationState.setActive("exit", !t, {
            custom: r ?? this.node.getProps().custom
        });
        n && !t && o.then(() => n(this.id))
    }
    mount() {
        const {
            register: t
        } = this.node.presenceContext || {};
        t && (this.unmount = t(this.id))
    }
    unmount() {}
}
const p4 = {
        animation: {
            Feature: f4
        },
        exit: {
            Feature: h4
        }
    },
    Hd = (e, t) => Math.abs(e - t);

function m4(e, t) {
    const n = Hd(e.x, t.x),
        r = Hd(e.y, t.y);
    return Math.sqrt(n ** 2 + r ** 2)
}
class Cm {
    constructor(t, n, {
        transformPagePoint: r
    } = {}) {
        if (this.startEvent = null, this.lastMoveEvent = null, this.lastMoveEventInfo = null, this.handlers = {}, this.updatePoint = () => {
                if (!(this.lastMoveEvent && this.lastMoveEventInfo)) return;
                const u = dl(this.lastMoveEventInfo, this.history),
                    c = this.startEvent !== null,
                    f = m4(u.offset, {
                        x: 0,
                        y: 0
                    }) >= 3;
                if (!c && !f) return;
                const {
                    point: d
                } = u, {
                    timestamp: p
                } = Fe;
                this.history.push({
                    ...d,
                    timestamp: p
                });
                const {
                    onStart: y,
                    onMove: g
                } = this.handlers;
                c || (y && y(this.lastMoveEvent, u), this.startEvent = this.lastMoveEvent), g && g(this.lastMoveEvent, u)
            }, this.handlePointerMove = (u, c) => {
                this.lastMoveEvent = u, this.lastMoveEventInfo = fl(c, this.transformPagePoint), he.update(this.updatePoint, !0)
            }, this.handlePointerUp = (u, c) => {
                if (this.end(), !(this.lastMoveEvent && this.lastMoveEventInfo)) return;
                const {
                    onEnd: f,
                    onSessionEnd: d
                } = this.handlers, p = dl(u.type === "pointercancel" ? this.lastMoveEventInfo : fl(c, this.transformPagePoint), this.history);
                this.startEvent && f && f(u, p), d && d(u, p)
            }, !V0(t)) return;
        this.handlers = n, this.transformPagePoint = r;
        const i = ra(t),
            o = fl(i, this.transformPagePoint),
            {
                point: s
            } = o,
            {
                timestamp: a
            } = Fe;
        this.history = [{
            ...s,
            timestamp: a
        }];
        const {
            onSessionStart: l
        } = n;
        l && l(t, dl(o, this.history)), this.removeListeners = yn(Bt(window, "pointermove", this.handlePointerMove), Bt(window, "pointerup", this.handlePointerUp), Bt(window, "pointercancel", this.handlePointerUp))
    }
    updateHandlers(t) {
        this.handlers = t
    }
    end() {
        this.removeListeners && this.removeListeners(), qt(this.updatePoint)
    }
}

function fl(e, t) {
    return t ? {
        point: t(e.point)
    } : e
}

function Wd(e, t) {
    return {
        x: e.x - t.x,
        y: e.y - t.y
    }
}

function dl({
    point: e
}, t) {
    return {
        point: e,
        delta: Wd(e, wm(t)),
        offset: Wd(e, y4(t)),
        velocity: v4(t, .1)
    }
}

function y4(e) {
    return e[0]
}

function wm(e) {
    return e[e.length - 1]
}

function v4(e, t) {
    if (e.length < 2) return {
        x: 0,
        y: 0
    };
    let n = e.length - 1,
        r = null;
    const i = wm(e);
    for (; n >= 0 && (r = e[n], !(i.timestamp - r.timestamp > vn(t)));) n--;
    if (!r) return {
        x: 0,
        y: 0
    };
    const o = Ut(i.timestamp - r.timestamp);
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

function lt(e) {
    return e.max - e.min
}

function Pu(e, t = 0, n = .01) {
    return Math.abs(e - t) <= n
}

function Kd(e, t, n, r = .5) {
    e.origin = r, e.originPoint = Ce(t.min, t.max, e.origin), e.scale = lt(n) / lt(t), (Pu(e.scale, 1, 1e-4) || isNaN(e.scale)) && (e.scale = 1), e.translate = Ce(n.min, n.max, e.origin) - e.originPoint, (Pu(e.translate) || isNaN(e.translate)) && (e.translate = 0)
}

function vi(e, t, n, r) {
    Kd(e.x, t.x, n.x, r ? r.originX : void 0), Kd(e.y, t.y, n.y, r ? r.originY : void 0)
}

function qd(e, t, n) {
    e.min = n.min + t.min, e.max = e.min + lt(t)
}

function g4(e, t, n) {
    qd(e.x, t.x, n.x), qd(e.y, t.y, n.y)
}

function Gd(e, t, n) {
    e.min = t.min - n.min, e.max = e.min + lt(t)
}

function gi(e, t, n) {
    Gd(e.x, t.x, n.x), Gd(e.y, t.y, n.y)
}

function C4(e, {
    min: t,
    max: n
}, r) {
    return t !== void 0 && e < t ? e = r ? Ce(t, e, r.min) : Math.max(e, t) : n !== void 0 && e > n && (e = r ? Ce(n, e, r.max) : Math.min(e, n)), e
}

function Zd(e, t, n) {
    return {
        min: t !== void 0 ? e.min + t : void 0,
        max: n !== void 0 ? e.max + n - (e.max - e.min) : void 0
    }
}

function w4(e, {
    top: t,
    left: n,
    bottom: r,
    right: i
}) {
    return {
        x: Zd(e.x, n, i),
        y: Zd(e.y, t, r)
    }
}

function Yd(e, t) {
    let n = t.min - e.min,
        r = t.max - e.max;
    return t.max - t.min < e.max - e.min && ([n, r] = [r, n]), {
        min: n,
        max: r
    }
}

function S4(e, t) {
    return {
        x: Yd(e.x, t.x),
        y: Yd(e.y, t.y)
    }
}

function x4(e, t) {
    let n = .5;
    const r = lt(e),
        i = lt(t);
    return i > r ? n = ji(t.min, t.max - r, e.min) : r > i && (n = ji(e.min, e.max - i, t.min)), Sn(0, 1, n)
}

function P4(e, t) {
    const n = {};
    return t.min !== void 0 && (n.min = t.min - e.min), t.max !== void 0 && (n.max = t.max - e.min), n
}
const ku = .35;

function k4(e = ku) {
    return e === !1 ? e = 0 : e === !0 && (e = ku), {
        x: Xd(e, "left", "right"),
        y: Xd(e, "top", "bottom")
    }
}

function Xd(e, t, n) {
    return {
        min: Jd(e, t),
        max: Jd(e, n)
    }
}

function Jd(e, t) {
    return typeof e == "number" ? e : e[t] || 0
}
const eh = () => ({
        translate: 0,
        scale: 1,
        origin: 0,
        originPoint: 0
    }),
    pr = () => ({
        x: eh(),
        y: eh()
    }),
    th = () => ({
        min: 0,
        max: 0
    }),
    Re = () => ({
        x: th(),
        y: th()
    });

function Ft(e) {
    return [e("x"), e("y")]
}

function Sm({
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

function E4({
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

function T4(e, t) {
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

function hl(e) {
    return e === void 0 || e === 1
}

function Eu({
    scale: e,
    scaleX: t,
    scaleY: n
}) {
    return !hl(e) || !hl(t) || !hl(n)
}

function On(e) {
    return Eu(e) || xm(e) || e.z || e.rotate || e.rotateX || e.rotateY
}

function xm(e) {
    return nh(e.x) || nh(e.y)
}

function nh(e) {
    return e && e !== "0%"
}

function Es(e, t, n) {
    const r = e - n,
        i = t * r;
    return n + i
}

function rh(e, t, n, r, i) {
    return i !== void 0 && (e = Es(e, i, r)), Es(e, n, r) + t
}

function Tu(e, t = 0, n = 1, r, i) {
    e.min = rh(e.min, t, n, r, i), e.max = rh(e.max, t, n, r, i)
}

function Pm(e, {
    x: t,
    y: n
}) {
    Tu(e.x, t.translate, t.scale, t.originPoint), Tu(e.y, n.translate, n.scale, n.originPoint)
}

function R4(e, t, n, r = !1) {
    const i = n.length;
    if (!i) return;
    t.x = t.y = 1;
    let o, s;
    for (let a = 0; a < i; a++) {
        o = n[a], s = o.projectionDelta;
        const l = o.instance;
        l && l.style && l.style.display === "contents" || (r && o.options.layoutScroll && o.scroll && o !== o.root && mr(e, {
            x: -o.scroll.offset.x,
            y: -o.scroll.offset.y
        }), s && (t.x *= s.x.scale, t.y *= s.y.scale, Pm(e, s)), r && On(o.latestValues) && mr(e, o.latestValues))
    }
    t.x = ih(t.x), t.y = ih(t.y)
}

function ih(e) {
    return Number.isInteger(e) || e > 1.0000000000001 || e < .999999999999 ? e : 1
}

function tn(e, t) {
    e.min = e.min + t, e.max = e.max + t
}

function oh(e, t, [n, r, i]) {
    const o = t[i] !== void 0 ? t[i] : .5,
        s = Ce(e.min, e.max, o);
    Tu(e, t[n], t[r], s, t.scale)
}
const A4 = ["x", "scaleX", "originX"],
    M4 = ["y", "scaleY", "originY"];

function mr(e, t) {
    oh(e.x, t, A4), oh(e.y, t, M4)
}

function km(e, t) {
    return Sm(T4(e.getBoundingClientRect(), t))
}

function O4(e, t, n) {
    const r = km(e, n),
        {
            scroll: i
        } = t;
    return i && (tn(r.x, i.offset.x), tn(r.y, i.offset.y)), r
}
const F4 = new WeakMap;
class L4 {
    constructor(t) {
        this.openGlobalLock = null, this.isDragging = !1, this.currentDirection = null, this.originPoint = {
            x: 0,
            y: 0
        }, this.constraints = !1, this.hasMutatedConstraints = !1, this.elastic = Re(), this.visualElement = t
    }
    start(t, {
        snapToCursor: n = !1
    } = {}) {
        const {
            presenceContext: r
        } = this.visualElement;
        if (r && r.isPresent === !1) return;
        const i = l => {
                this.stopAnimation(), n && this.snapToCursor(ra(l, "page").point)
            },
            o = (l, u) => {
                const {
                    drag: c,
                    dragPropagation: f,
                    onDragStart: d
                } = this.getProps();
                if (c && !f && (this.openGlobalLock && this.openGlobalLock(), this.openGlobalLock = I0(c), !this.openGlobalLock)) return;
                this.isDragging = !0, this.currentDirection = null, this.resolveConstraints(), this.visualElement.projection && (this.visualElement.projection.isAnimationBlocked = !0, this.visualElement.projection.target = void 0), Ft(y => {
                    let g = this.getAxisMotionValue(y).get() || 0;
                    if (Vt.test(g)) {
                        const {
                            projection: x
                        } = this.visualElement;
                        if (x && x.layout) {
                            const v = x.layout.layoutBox[y];
                            v && (g = lt(v) * (parseFloat(g) / 100))
                        }
                    }
                    this.originPoint[y] = g
                }), d && he.update(() => d(l, u), !1, !0);
                const {
                    animationState: p
                } = this.visualElement;
                p && p.setActive("whileDrag", !0)
            },
            s = (l, u) => {
                const {
                    dragPropagation: c,
                    dragDirectionLock: f,
                    onDirectionLock: d,
                    onDrag: p
                } = this.getProps();
                if (!c && !this.openGlobalLock) return;
                const {
                    offset: y
                } = u;
                if (f && this.currentDirection === null) {
                    this.currentDirection = b4(y), this.currentDirection !== null && d && d(this.currentDirection);
                    return
                }
                this.updateAxis("x", u.point, y), this.updateAxis("y", u.point, y), this.visualElement.render(), p && p(l, u)
            },
            a = (l, u) => this.stop(l, u);
        this.panSession = new Cm(t, {
            onSessionStart: i,
            onStart: o,
            onMove: s,
            onSessionEnd: a
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
        o && he.update(() => o(t, n))
    }
    cancel() {
        this.isDragging = !1;
        const {
            projection: t,
            animationState: n
        } = this.visualElement;
        t && (t.isAnimationBlocked = !1), this.panSession && this.panSession.end(), this.panSession = void 0;
        const {
            dragPropagation: r
        } = this.getProps();
        !r && this.openGlobalLock && (this.openGlobalLock(), this.openGlobalLock = null), n && n.setActive("whileDrag", !1)
    }
    updateAxis(t, n, r) {
        const {
            drag: i
        } = this.getProps();
        if (!r || !Po(t, i, this.currentDirection)) return;
        const o = this.getAxisMotionValue(t);
        let s = this.originPoint[t] + r[t];
        this.constraints && this.constraints[t] && (s = C4(s, this.constraints[t], this.elastic[t])), o.set(s)
    }
    resolveConstraints() {
        const {
            dragConstraints: t,
            dragElastic: n
        } = this.getProps(), {
            layout: r
        } = this.visualElement.projection || {}, i = this.constraints;
        t && dr(t) ? this.constraints || (this.constraints = this.resolveRefConstraints()) : t && r ? this.constraints = w4(r.layoutBox, t) : this.constraints = !1, this.elastic = k4(n), i !== this.constraints && r && this.constraints && !this.hasMutatedConstraints && Ft(o => {
            this.getAxisMotionValue(o) && (this.constraints[o] = P4(r.layoutBox[o], this.constraints[o]))
        })
    }
    resolveRefConstraints() {
        const {
            dragConstraints: t,
            onMeasureDragConstraints: n
        } = this.getProps();
        if (!t || !dr(t)) return !1;
        const r = t.current,
            {
                projection: i
            } = this.visualElement;
        if (!i || !i.layout) return !1;
        const o = O4(r, i.root, this.visualElement.getTransformPagePoint());
        let s = S4(i.layout.layoutBox, o);
        if (n) {
            const a = n(E4(s));
            this.hasMutatedConstraints = !!a, a && (s = Sm(a))
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
            onDragTransitionEnd: a
        } = this.getProps(), l = this.constraints || {}, u = Ft(c => {
            if (!Po(c, n, this.currentDirection)) return;
            let f = l && l[c] || {};
            s && (f = {
                min: 0,
                max: 0
            });
            const d = i ? 200 : 1e6,
                p = i ? 40 : 1e7,
                y = {
                    type: "inertia",
                    velocity: r ? t[c] : 0,
                    bounceStiffness: d,
                    bounceDamping: p,
                    timeConstant: 750,
                    restDelta: 1,
                    restSpeed: 10,
                    ...o,
                    ...f
                };
            return this.startAxisValueAnimation(c, y)
        });
        return Promise.all(u).then(a)
    }
    startAxisValueAnimation(t, n) {
        const r = this.getAxisMotionValue(t);
        return r.start(ef(t, r, 0, n))
    }
    stopAnimation() {
        Ft(t => this.getAxisMotionValue(t).stop())
    }
    getAxisMotionValue(t) {
        const n = "_drag" + t.toUpperCase(),
            r = this.visualElement.getProps(),
            i = r[n];
        return i || this.visualElement.getValue(t, (r.initial ? r.initial[t] : void 0) || 0)
    }
    snapToCursor(t) {
        Ft(n => {
            const {
                drag: r
            } = this.getProps();
            if (!Po(n, r, this.currentDirection)) return;
            const {
                projection: i
            } = this.visualElement, o = this.getAxisMotionValue(n);
            if (i && i.layout) {
                const {
                    min: s,
                    max: a
                } = i.layout.layoutBox[n];
                o.set(t[n] - Ce(s, a, .5))
            }
        })
    }
    scalePositionWithinConstraints() {
        if (!this.visualElement.current) return;
        const {
            drag: t,
            dragConstraints: n
        } = this.getProps(), {
            projection: r
        } = this.visualElement;
        if (!dr(n) || !r || !this.constraints) return;
        this.stopAnimation();
        const i = {
            x: 0,
            y: 0
        };
        Ft(s => {
            const a = this.getAxisMotionValue(s);
            if (a) {
                const l = a.get();
                i[s] = x4({
                    min: l,
                    max: l
                }, this.constraints[s])
            }
        });
        const {
            transformTemplate: o
        } = this.visualElement.getProps();
        this.visualElement.current.style.transform = o ? o({}, "") : "none", r.root && r.root.updateScroll(), r.updateLayout(), this.resolveConstraints(), Ft(s => {
            if (!Po(s, t, null)) return;
            const a = this.getAxisMotionValue(s),
                {
                    min: l,
                    max: u
                } = this.constraints[s];
            a.set(Ce(l, u, i[s]))
        })
    }
    addListeners() {
        if (!this.visualElement.current) return;
        F4.set(this.visualElement, this);
        const t = this.visualElement.current,
            n = Bt(t, "pointerdown", l => {
                const {
                    drag: u,
                    dragListener: c = !0
                } = this.getProps();
                u && c && this.start(l)
            }),
            r = () => {
                const {
                    dragConstraints: l
                } = this.getProps();
                dr(l) && (this.constraints = this.resolveRefConstraints())
            },
            {
                projection: i
            } = this.visualElement,
            o = i.addEventListener("measure", r);
        i && !i.layout && (i.root && i.root.updateScroll(), i.updateLayout()), r();
        const s = jt(window, "resize", () => this.scalePositionWithinConstraints()),
            a = i.addEventListener("didUpdate", ({
                delta: l,
                hasLayoutChanged: u
            }) => {
                this.isDragging && u && (Ft(c => {
                    const f = this.getAxisMotionValue(c);
                    f && (this.originPoint[c] += l[c].translate, f.set(f.get() + l[c].translate))
                }), this.visualElement.render())
            });
        return () => {
            s(), n(), o(), a && a()
        }
    }
    getProps() {
        const t = this.visualElement.getProps(),
            {
                drag: n = !1,
                dragDirectionLock: r = !1,
                dragPropagation: i = !1,
                dragConstraints: o = !1,
                dragElastic: s = ku,
                dragMomentum: a = !0
            } = t;
        return {
            ...t,
            drag: n,
            dragDirectionLock: r,
            dragPropagation: i,
            dragConstraints: o,
            dragElastic: s,
            dragMomentum: a
        }
    }
}

function Po(e, t, n) {
    return (t === !0 || t === e) && (n === null || n === e)
}

function b4(e, t = 10) {
    let n = null;
    return Math.abs(e.y) > t ? n = "y" : Math.abs(e.x) > t && (n = "x"), n
}
class D4 extends Tn {
    constructor(t) {
        super(t), this.removeGroupControls = Pe, this.removeListeners = Pe, this.controls = new L4(t)
    }
    mount() {
        const {
            dragControls: t
        } = this.node.getProps();
        t && (this.removeGroupControls = t.subscribe(this.controls)), this.removeListeners = this.controls.addListeners() || Pe
    }
    unmount() {
        this.removeGroupControls(), this.removeListeners()
    }
}
const sh = e => (t, n) => {
    e && he.update(() => e(t, n))
};
class V4 extends Tn {
    constructor() {
        super(...arguments), this.removePointerDownListener = Pe
    }
    onPointerDown(t) {
        this.session = new Cm(t, this.createPanHandlers(), {
            transformPagePoint: this.node.getTransformPagePoint()
        })
    }
    createPanHandlers() {
        const {
            onPanSessionStart: t,
            onPanStart: n,
            onPan: r,
            onPanEnd: i
        } = this.node.getProps();
        return {
            onSessionStart: sh(t),
            onStart: sh(n),
            onMove: r,
            onEnd: (o, s) => {
                delete this.session, i && he.update(() => i(o, s))
            }
        }
    }
    mount() {
        this.removePointerDownListener = Bt(this.node.current, "pointerdown", t => this.onPointerDown(t))
    }
    update() {
        this.session && this.session.updateHandlers(this.createPanHandlers())
    }
    unmount() {
        this.removePointerDownListener(), this.session && this.session.end()
    }
}

function _4() {
    const e = P.useContext(Xs);
    if (e === null) return [!0, null];
    const {
        isPresent: t,
        onExitComplete: n,
        register: r
    } = e, i = P.useId();
    return P.useEffect(() => r(i), []), !t && n ? [!1, () => n && n(i)] : [!0]
}
const zo = {
    hasAnimatedSinceResize: !0,
    hasEverUpdated: !1
};

function ah(e, t) {
    return t.max === t.min ? 0 : e / (t.max - t.min) * 100
}
const Jr = {
        correct: (e, t) => {
            if (!t.target) return e;
            if (typeof e == "string")
                if (j.test(e)) e = parseFloat(e);
                else return e;
            const n = ah(e, t.target.x),
                r = ah(e, t.target.y);
            return `${n}% ${r}%`
        }
    },
    I4 = {
        correct: (e, {
            treeScale: t,
            projectionDelta: n
        }) => {
            const r = e,
                i = xn.parse(e);
            if (i.length > 5) return r;
            const o = xn.createTransformer(e),
                s = typeof i[0] != "number" ? 1 : 0,
                a = n.x.scale * t.x,
                l = n.y.scale * t.y;
            i[0 + s] /= a, i[1 + s] /= l;
            const u = Ce(a, l, .5);
            return typeof i[2 + s] == "number" && (i[2 + s] /= u), typeof i[3 + s] == "number" && (i[3 + s] /= u), o(i)
        }
    };
var zi = {},
    $4 = {
        get exports() {
            return zi
        },
        set exports(e) {
            zi = e
        }
    },
    sa = {};
/**
 * @license React
 * react-jsx-runtime.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
var N4 = P,
    j4 = Symbol.for("react.element"),
    z4 = Symbol.for("react.fragment"),
    B4 = Object.prototype.hasOwnProperty,
    U4 = N4.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED.ReactCurrentOwner,
    Q4 = {
        key: !0,
        ref: !0,
        __self: !0,
        __source: !0
    };

function Em(e, t, n) {
    var r, i = {},
        o = null,
        s = null;
    n !== void 0 && (o = "" + n), t.key !== void 0 && (o = "" + t.key), t.ref !== void 0 && (s = t.ref);
    for (r in t) B4.call(t, r) && !Q4.hasOwnProperty(r) && (i[r] = t[r]);
    if (e && e.defaultProps)
        for (r in t = e.defaultProps, t) i[r] === void 0 && (i[r] = t[r]);
    return {
        $$typeof: j4,
        type: e,
        key: o,
        ref: s,
        props: i,
        _owner: U4.current
    }
}
sa.Fragment = z4;
sa.jsx = Em;
sa.jsxs = Em;
(function(e) {
    e.exports = sa
})($4);
const O = zi.jsx,
    oe = zi.jsxs,
    H4 = zi.Fragment;
class W4 extends ce.Component {
    componentDidMount() {
        const {
            visualElement: t,
            layoutGroup: n,
            switchLayoutGroup: r,
            layoutId: i
        } = this.props, {
            projection: o
        } = t;
        Ky(K4), o && (n.group && n.group.add(o), r && r.register && i && r.register(o), o.root.didUpdate(), o.addEventListener("animationComplete", () => {
            this.safeToRemove()
        }), o.setOptions({
            ...o.options,
            onExitComplete: () => this.safeToRemove()
        })), zo.hasEverUpdated = !0
    }
    getSnapshotBeforeUpdate(t) {
        const {
            layoutDependency: n,
            visualElement: r,
            drag: i,
            isPresent: o
        } = this.props, s = r.projection;
        return s && (s.isPresent = o, i || t.layoutDependency !== n || n === void 0 ? s.willUpdate() : this.safeToRemove(), t.isPresent !== o && (o ? s.promote() : s.relegate() || he.postRender(() => {
            const a = s.getStack();
            (!a || !a.members.length) && this.safeToRemove()
        }))), null
    }
    componentDidUpdate() {
        const {
            projection: t
        } = this.props.visualElement;
        t && (t.root.didUpdate(), queueMicrotask(() => {
            !t.currentAnimation && t.isLead() && this.safeToRemove()
        }))
    }
    componentWillUnmount() {
        const {
            visualElement: t,
            layoutGroup: n,
            switchLayoutGroup: r
        } = this.props, {
            projection: i
        } = t;
        i && (i.scheduleCheckAfterUnmount(), n && n.group && n.group.remove(i), r && r.deregister && r.deregister(i))
    }
    safeToRemove() {
        const {
            safeToRemove: t
        } = this.props;
        t && t()
    }
    render() {
        return null
    }
}

function Tm(e) {
    const [t, n] = _4(), r = P.useContext(jc);
    return O(W4, {
        ...e,
        layoutGroup: r,
        switchLayoutGroup: P.useContext(w0),
        isPresent: t,
        safeToRemove: n
    })
}
const K4 = {
        borderRadius: {
            ...Jr,
            applyTo: ["borderTopLeftRadius", "borderTopRightRadius", "borderBottomLeftRadius", "borderBottomRightRadius"]
        },
        borderTopLeftRadius: Jr,
        borderTopRightRadius: Jr,
        borderBottomLeftRadius: Jr,
        borderBottomRightRadius: Jr,
        boxShadow: I4
    },
    Rm = ["TopLeft", "TopRight", "BottomLeft", "BottomRight"],
    q4 = Rm.length,
    lh = e => typeof e == "string" ? parseFloat(e) : e,
    uh = e => typeof e == "number" || j.test(e);

function G4(e, t, n, r, i, o) {
    i ? (e.opacity = Ce(0, n.opacity !== void 0 ? n.opacity : 1, Z4(r)), e.opacityExit = Ce(t.opacity !== void 0 ? t.opacity : 1, 0, Y4(r))) : o && (e.opacity = Ce(t.opacity !== void 0 ? t.opacity : 1, n.opacity !== void 0 ? n.opacity : 1, r));
    for (let s = 0; s < q4; s++) {
        const a = `border${Rm[s]}Radius`;
        let l = ch(t, a),
            u = ch(n, a);
        if (l === void 0 && u === void 0) continue;
        l || (l = 0), u || (u = 0), l === 0 || u === 0 || uh(l) === uh(u) ? (e[a] = Math.max(Ce(lh(l), lh(u), r), 0), (Vt.test(u) || Vt.test(l)) && (e[a] += "%")) : e[a] = u
    }(t.rotate || n.rotate) && (e.rotate = Ce(t.rotate || 0, n.rotate || 0, r))
}

function ch(e, t) {
    return e[t] !== void 0 ? e[t] : e.borderRadius
}
const Z4 = Am(0, .5, Zc),
    Y4 = Am(.5, .95, Pe);

function Am(e, t, n) {
    return r => r < e ? 0 : r > t ? 1 : n(ji(e, t, r))
}

function fh(e, t) {
    e.min = t.min, e.max = t.max
}

function dt(e, t) {
    fh(e.x, t.x), fh(e.y, t.y)
}

function dh(e, t, n, r, i) {
    return e -= t, e = Es(e, 1 / n, r), i !== void 0 && (e = Es(e, 1 / i, r)), e
}

function X4(e, t = 0, n = 1, r = .5, i, o = e, s = e) {
    if (Vt.test(t) && (t = parseFloat(t), t = Ce(s.min, s.max, t / 100) - s.min), typeof t != "number") return;
    let a = Ce(o.min, o.max, r);
    e === o && (a -= t), e.min = dh(e.min, t, n, a, i), e.max = dh(e.max, t, n, a, i)
}

function hh(e, t, [n, r, i], o, s) {
    X4(e, t[n], t[r], t[i], t.scale, o, s)
}
const J4 = ["x", "scaleX", "originX"],
    e5 = ["y", "scaleY", "originY"];

function ph(e, t, n, r) {
    hh(e.x, t, J4, n ? n.x : void 0, r ? r.x : void 0), hh(e.y, t, e5, n ? n.y : void 0, r ? r.y : void 0)
}

function mh(e) {
    return e.translate === 0 && e.scale === 1
}

function Mm(e) {
    return mh(e.x) && mh(e.y)
}

function t5(e, t) {
    return e.x.min === t.x.min && e.x.max === t.x.max && e.y.min === t.y.min && e.y.max === t.y.max
}

function Om(e, t) {
    return Math.round(e.x.min) === Math.round(t.x.min) && Math.round(e.x.max) === Math.round(t.x.max) && Math.round(e.y.min) === Math.round(t.y.min) && Math.round(e.y.max) === Math.round(t.y.max)
}

function yh(e) {
    return lt(e.x) / lt(e.y)
}
class n5 {
    constructor() {
        this.members = []
    }
    add(t) {
        tf(this.members, t), t.scheduleRender()
    }
    remove(t) {
        if (nf(this.members, t), t === this.prevLead && (this.prevLead = void 0), t === this.lead) {
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
        const r = this.lead;
        if (t !== r && (this.prevLead = r, this.lead = t, t.show(), r)) {
            r.instance && r.scheduleRender(), t.scheduleRender(), t.resumeFrom = r, n && (t.resumeFrom.preserveOpacity = !0), r.snapshot && (t.snapshot = r.snapshot, t.snapshot.latestValues = r.animationValues || r.latestValues), t.root && t.root.isUpdating && (t.isLayoutDirty = !0);
            const {
                crossfade: i
            } = t.options;
            i === !1 && r.hide()
        }
    }
    exitAnimationComplete() {
        this.members.forEach(t => {
            const {
                options: n,
                resumingFrom: r
            } = t;
            n.onExitComplete && n.onExitComplete(), r && r.options.onExitComplete && r.options.onExitComplete()
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

function vh(e, t, n) {
    let r = "";
    const i = e.x.translate / t.x,
        o = e.y.translate / t.y;
    if ((i || o) && (r = `translate3d(${i}px, ${o}px, 0) `), (t.x !== 1 || t.y !== 1) && (r += `scale(${1/t.x}, ${1/t.y}) `), n) {
        const {
            rotate: l,
            rotateX: u,
            rotateY: c
        } = n;
        l && (r += `rotate(${l}deg) `), u && (r += `rotateX(${u}deg) `), c && (r += `rotateY(${c}deg) `)
    }
    const s = e.x.scale * t.x,
        a = e.y.scale * t.y;
    return (s !== 1 || a !== 1) && (r += `scale(${s}, ${a})`), r || "none"
}
const r5 = (e, t) => e.depth - t.depth;
class i5 {
    constructor() {
        this.children = [], this.isDirty = !1
    }
    add(t) {
        tf(this.children, t), this.isDirty = !0
    }
    remove(t) {
        nf(this.children, t), this.isDirty = !0
    }
    forEach(t) {
        this.isDirty && this.children.sort(r5), this.isDirty = !1, this.children.forEach(t)
    }
}

function o5(e, t) {
    const n = performance.now(),
        r = ({
            timestamp: i
        }) => {
            const o = i - n;
            o >= t && (qt(r), e(o - t))
        };
    return he.read(r, !0), () => qt(r)
}

function s5(e) {
    window.MotionDebug && window.MotionDebug.record(e)
}

function a5(e) {
    return e instanceof SVGElement && e.tagName !== "svg"
}

function l5(e, t, n) {
    const r = rt(e) ? e : Lr(e);
    return r.start(ef("", r, t, n)), r.animation
}
const gh = ["", "X", "Y", "Z"],
    Ch = 1e3;
let u5 = 0;
const Fn = {
    type: "projectionFrame",
    totalNodes: 0,
    resolvedTargetDeltas: 0,
    recalculatedProjection: 0
};

function Fm({
    attachResizeListener: e,
    defaultParent: t,
    measureScroll: n,
    checkIsScrollRoot: r,
    resetTransform: i
}) {
    return class {
        constructor(s = {}, a = t == null ? void 0 : t()) {
            this.id = u5++, this.animationId = 0, this.children = new Set, this.options = {}, this.isTreeAnimating = !1, this.isAnimationBlocked = !1, this.isLayoutDirty = !1, this.isProjectionDirty = !1, this.isSharedProjectionDirty = !1, this.isTransformDirty = !1, this.updateManuallyBlocked = !1, this.updateBlockedByResize = !1, this.isUpdating = !1, this.isSVG = !1, this.needsReset = !1, this.shouldResetTransform = !1, this.treeScale = {
                x: 1,
                y: 1
            }, this.eventHandlers = new Map, this.hasTreeAnimated = !1, this.updateScheduled = !1, this.checkUpdateFailed = () => {
                this.isUpdating && (this.isUpdating = !1, this.clearAllSnapshots())
            }, this.updateProjection = () => {
                Fn.totalNodes = Fn.resolvedTargetDeltas = Fn.recalculatedProjection = 0, this.nodes.forEach(d5), this.nodes.forEach(v5), this.nodes.forEach(g5), this.nodes.forEach(h5), s5(Fn)
            }, this.hasProjected = !1, this.isVisible = !0, this.animationProgress = 0, this.sharedNodes = new Map, this.latestValues = s, this.root = a ? a.root || a : this, this.path = a ? [...a.path, a] : [], this.parent = a, this.depth = a ? a.depth + 1 : 0;
            for (let l = 0; l < this.path.length; l++) this.path[l].shouldResetTransform = !0;
            this.root === this && (this.nodes = new i5)
        }
        addEventListener(s, a) {
            return this.eventHandlers.has(s) || this.eventHandlers.set(s, new rf), this.eventHandlers.get(s).add(a)
        }
        notifyListeners(s, ...a) {
            const l = this.eventHandlers.get(s);
            l && l.notify(...a)
        }
        hasListeners(s) {
            return this.eventHandlers.has(s)
        }
        mount(s, a = this.root.hasTreeAnimated) {
            if (this.instance) return;
            this.isSVG = a5(s), this.instance = s;
            const {
                layoutId: l,
                layout: u,
                visualElement: c
            } = this.options;
            if (c && !c.current && c.mount(s), this.root.nodes.add(this), this.parent && this.parent.children.add(this), a && (u || l) && (this.isLayoutDirty = !0), e) {
                let f;
                const d = () => this.root.updateBlockedByResize = !1;
                e(s, () => {
                    this.root.updateBlockedByResize = !0, f && f(), f = o5(d, 250), zo.hasAnimatedSinceResize && (zo.hasAnimatedSinceResize = !1, this.nodes.forEach(Sh))
                })
            }
            l && this.root.registerSharedNode(l, this), this.options.animate !== !1 && c && (l || u) && this.addEventListener("didUpdate", ({
                delta: f,
                hasLayoutChanged: d,
                hasRelativeTargetChanged: p,
                layout: y
            }) => {
                if (this.isTreeAnimationBlocked()) {
                    this.target = void 0, this.relativeTarget = void 0;
                    return
                }
                const g = this.options.transition || c.getDefaultTransition() || P5,
                    {
                        onLayoutAnimationStart: x,
                        onLayoutAnimationComplete: v
                    } = c.getProps(),
                    h = !this.targetLayout || !Om(this.targetLayout, y) || p,
                    m = !d && p;
                if (this.options.layoutRoot || this.resumeFrom && this.resumeFrom.instance || m || d && (h || !this.currentAnimation)) {
                    this.resumeFrom && (this.resumingFrom = this.resumeFrom, this.resumingFrom.resumingFrom = void 0), this.setAnimationOrigin(f, m);
                    const C = {
                        ...pm(g, "layout"),
                        onPlay: x,
                        onComplete: v
                    };
                    (c.shouldReduceMotion || this.options.layoutRoot) && (C.delay = 0, C.type = !1), this.startAnimation(C)
                } else d || Sh(this), this.isLead() && this.options.onExitComplete && this.options.onExitComplete();
                this.targetLayout = y
            })
        }
        unmount() {
            this.options.layoutId && this.willUpdate(), this.root.nodes.remove(this);
            const s = this.getStack();
            s && s.remove(this), this.parent && this.parent.children.delete(this), this.instance = void 0, qt(this.updateProjection)
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
            return this.isAnimationBlocked || this.parent && this.parent.isTreeAnimationBlocked() || !1
        }
        startUpdate() {
            this.isUpdateBlocked() || (this.isUpdating = !0, this.nodes && this.nodes.forEach(C5), this.animationId++)
        }
        getTransformTemplate() {
            const {
                visualElement: s
            } = this.options;
            return s && s.getProps().transformTemplate
        }
        willUpdate(s = !0) {
            if (this.root.hasTreeAnimated = !0, this.root.isUpdateBlocked()) {
                this.options.onExitComplete && this.options.onExitComplete();
                return
            }
            if (!this.root.isUpdating && this.root.startUpdate(), this.isLayoutDirty) return;
            this.isLayoutDirty = !0;
            for (let c = 0; c < this.path.length; c++) {
                const f = this.path[c];
                f.shouldResetTransform = !0, f.updateScroll("snapshot"), f.options.layoutRoot && f.willUpdate(!1)
            }
            const {
                layoutId: a,
                layout: l
            } = this.options;
            if (a === void 0 && !l) return;
            const u = this.getTransformTemplate();
            this.prevTransformTemplateValue = u ? u(this.latestValues, "") : void 0, this.updateSnapshot(), s && this.notifyListeners("willUpdate")
        }
        update() {
            if (this.updateScheduled = !1, this.isUpdateBlocked()) {
                this.unblockUpdate(), this.clearAllSnapshots(), this.nodes.forEach(wh);
                return
            }
            this.isUpdating || this.nodes.forEach(m5), this.isUpdating = !1, this.nodes.forEach(y5), this.nodes.forEach(c5), this.nodes.forEach(f5), this.clearAllSnapshots();
            const a = performance.now();
            Fe.delta = Sn(0, 1e3 / 60, a - Fe.timestamp), Fe.timestamp = a, Fe.isProcessing = !0, rl.update.process(Fe), rl.preRender.process(Fe), rl.render.process(Fe), Fe.isProcessing = !1
        }
        didUpdate() {
            this.updateScheduled || (this.updateScheduled = !0, queueMicrotask(() => this.update()))
        }
        clearAllSnapshots() {
            this.nodes.forEach(p5), this.sharedNodes.forEach(w5)
        }
        scheduleUpdateProjection() {
            he.preRender(this.updateProjection, !1, !0)
        }
        scheduleCheckAfterUnmount() {
            he.postRender(() => {
                this.isLayoutDirty ? this.root.didUpdate() : this.root.checkUpdateFailed()
            })
        }
        updateSnapshot() {
            this.snapshot || !this.instance || (this.snapshot = this.measure())
        }
        updateLayout() {
            if (!this.instance || (this.updateScroll(), !(this.options.alwaysMeasureLayout && this.isLead()) && !this.isLayoutDirty)) return;
            if (this.resumeFrom && !this.resumeFrom.instance)
                for (let l = 0; l < this.path.length; l++) this.path[l].updateScroll();
            const s = this.layout;
            this.layout = this.measure(!1), this.layoutCorrected = Re(), this.isLayoutDirty = !1, this.projectionDelta = void 0, this.notifyListeners("measure", this.layout.layoutBox);
            const {
                visualElement: a
            } = this.options;
            a && a.notify("LayoutMeasure", this.layout.layoutBox, s ? s.layoutBox : void 0)
        }
        updateScroll(s = "measure") {
            let a = Boolean(this.options.layoutScroll && this.instance);
            this.scroll && this.scroll.animationId === this.root.animationId && this.scroll.phase === s && (a = !1), a && (this.scroll = {
                animationId: this.root.animationId,
                phase: s,
                isRoot: r(this.instance),
                offset: n(this.instance)
            })
        }
        resetTransform() {
            if (!i) return;
            const s = this.isLayoutDirty || this.shouldResetTransform,
                a = this.projectionDelta && !Mm(this.projectionDelta),
                l = this.getTransformTemplate(),
                u = l ? l(this.latestValues, "") : void 0,
                c = u !== this.prevTransformTemplateValue;
            s && (a || On(this.latestValues) || c) && (i(this.instance, u), this.shouldResetTransform = !1, this.scheduleRender())
        }
        measure(s = !0) {
            const a = this.measurePageBox();
            let l = this.removeElementScroll(a);
            return s && (l = this.removeTransform(l)), k5(l), {
                animationId: this.root.animationId,
                measuredBox: a,
                layoutBox: l,
                latestValues: {},
                source: this.id
            }
        }
        measurePageBox() {
            const {
                visualElement: s
            } = this.options;
            if (!s) return Re();
            const a = s.measureViewportBox(),
                {
                    scroll: l
                } = this.root;
            return l && (tn(a.x, l.offset.x), tn(a.y, l.offset.y)), a
        }
        removeElementScroll(s) {
            const a = Re();
            dt(a, s);
            for (let l = 0; l < this.path.length; l++) {
                const u = this.path[l],
                    {
                        scroll: c,
                        options: f
                    } = u;
                if (u !== this.root && c && f.layoutScroll) {
                    if (c.isRoot) {
                        dt(a, s);
                        const {
                            scroll: d
                        } = this.root;
                        d && (tn(a.x, -d.offset.x), tn(a.y, -d.offset.y))
                    }
                    tn(a.x, c.offset.x), tn(a.y, c.offset.y)
                }
            }
            return a
        }
        applyTransform(s, a = !1) {
            const l = Re();
            dt(l, s);
            for (let u = 0; u < this.path.length; u++) {
                const c = this.path[u];
                !a && c.options.layoutScroll && c.scroll && c !== c.root && mr(l, {
                    x: -c.scroll.offset.x,
                    y: -c.scroll.offset.y
                }), On(c.latestValues) && mr(l, c.latestValues)
            }
            return On(this.latestValues) && mr(l, this.latestValues), l
        }
        removeTransform(s) {
            const a = Re();
            dt(a, s);
            for (let l = 0; l < this.path.length; l++) {
                const u = this.path[l];
                if (!u.instance || !On(u.latestValues)) continue;
                Eu(u.latestValues) && u.updateSnapshot();
                const c = Re(),
                    f = u.measurePageBox();
                dt(c, f), ph(a, u.latestValues, u.snapshot ? u.snapshot.layoutBox : void 0, c)
            }
            return On(this.latestValues) && ph(a, this.latestValues), a
        }
        setTargetDelta(s) {
            this.targetDelta = s, this.root.scheduleUpdateProjection(), this.isProjectionDirty = !0
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
        forceRelativeParentToResolveTarget() {
            this.relativeParent && this.relativeParent.resolvedRelativeTargetAt !== Fe.timestamp && this.relativeParent.resolveTargetDelta(!0)
        }
        resolveTargetDelta(s = !1) {
            var a;
            const l = this.getLead();
            this.isProjectionDirty || (this.isProjectionDirty = l.isProjectionDirty), this.isTransformDirty || (this.isTransformDirty = l.isTransformDirty), this.isSharedProjectionDirty || (this.isSharedProjectionDirty = l.isSharedProjectionDirty);
            const u = Boolean(this.resumingFrom) || this !== l;
            if (!(s || u && this.isSharedProjectionDirty || this.isProjectionDirty || !((a = this.parent) === null || a === void 0) && a.isProjectionDirty || this.attemptToResolveRelativeTarget)) return;
            const {
                layout: f,
                layoutId: d
            } = this.options;
            if (!(!this.layout || !(f || d))) {
                if (this.resolvedRelativeTargetAt = Fe.timestamp, !this.targetDelta && !this.relativeTarget) {
                    const p = this.getClosestProjectingParent();
                    p && p.layout && this.animationProgress !== 1 ? (this.relativeParent = p, this.forceRelativeParentToResolveTarget(), this.relativeTarget = Re(), this.relativeTargetOrigin = Re(), gi(this.relativeTargetOrigin, this.layout.layoutBox, p.layout.layoutBox), dt(this.relativeTarget, this.relativeTargetOrigin)) : this.relativeParent = this.relativeTarget = void 0
                }
                if (!(!this.relativeTarget && !this.targetDelta)) {
                    if (this.target || (this.target = Re(), this.targetWithTransforms = Re()), this.relativeTarget && this.relativeTargetOrigin && this.relativeParent && this.relativeParent.target ? (this.forceRelativeParentToResolveTarget(), g4(this.target, this.relativeTarget, this.relativeParent.target)) : this.targetDelta ? (Boolean(this.resumingFrom) ? this.target = this.applyTransform(this.layout.layoutBox) : dt(this.target, this.layout.layoutBox), Pm(this.target, this.targetDelta)) : dt(this.target, this.layout.layoutBox), this.attemptToResolveRelativeTarget) {
                        this.attemptToResolveRelativeTarget = !1;
                        const p = this.getClosestProjectingParent();
                        p && Boolean(p.resumingFrom) === Boolean(this.resumingFrom) && !p.options.layoutScroll && p.target && this.animationProgress !== 1 ? (this.relativeParent = p, this.forceRelativeParentToResolveTarget(), this.relativeTarget = Re(), this.relativeTargetOrigin = Re(), gi(this.relativeTargetOrigin, this.target, p.target), dt(this.relativeTarget, this.relativeTargetOrigin)) : this.relativeParent = this.relativeTarget = void 0
                    }
                    Fn.resolvedTargetDeltas++
                }
            }
        }
        getClosestProjectingParent() {
            if (!(!this.parent || Eu(this.parent.latestValues) || xm(this.parent.latestValues))) return this.parent.isProjecting() ? this.parent : this.parent.getClosestProjectingParent()
        }
        isProjecting() {
            return Boolean((this.relativeTarget || this.targetDelta || this.options.layoutRoot) && this.layout)
        }
        calcProjection() {
            var s;
            const a = this.getLead(),
                l = Boolean(this.resumingFrom) || this !== a;
            let u = !0;
            if ((this.isProjectionDirty || !((s = this.parent) === null || s === void 0) && s.isProjectionDirty) && (u = !1), l && (this.isSharedProjectionDirty || this.isTransformDirty) && (u = !1), this.resolvedRelativeTargetAt === Fe.timestamp && (u = !1), u) return;
            const {
                layout: c,
                layoutId: f
            } = this.options;
            if (this.isTreeAnimating = Boolean(this.parent && this.parent.isTreeAnimating || this.currentAnimation || this.pendingAnimation), this.isTreeAnimating || (this.targetDelta = this.relativeTarget = void 0), !this.layout || !(c || f)) return;
            dt(this.layoutCorrected, this.layout.layoutBox);
            const d = this.treeScale.x,
                p = this.treeScale.y;
            R4(this.layoutCorrected, this.treeScale, this.path, l), a.layout && !a.target && (this.treeScale.x !== 1 || this.treeScale.y !== 1) && (a.target = a.layout.layoutBox);
            const {
                target: y
            } = a;
            if (!y) {
                this.projectionTransform && (this.projectionDelta = pr(), this.projectionTransform = "none", this.scheduleRender());
                return
            }
            this.projectionDelta || (this.projectionDelta = pr(), this.projectionDeltaWithTransform = pr());
            const g = this.projectionTransform;
            vi(this.projectionDelta, this.layoutCorrected, y, this.latestValues), this.projectionTransform = vh(this.projectionDelta, this.treeScale), (this.projectionTransform !== g || this.treeScale.x !== d || this.treeScale.y !== p) && (this.hasProjected = !0, this.scheduleRender(), this.notifyListeners("projectionUpdate", y)), Fn.recalculatedProjection++
        }
        hide() {
            this.isVisible = !1
        }
        show() {
            this.isVisible = !0
        }
        scheduleRender(s = !0) {
            if (this.options.scheduleRender && this.options.scheduleRender(), s) {
                const a = this.getStack();
                a && a.scheduleRender()
            }
            this.resumingFrom && !this.resumingFrom.instance && (this.resumingFrom = void 0)
        }
        setAnimationOrigin(s, a = !1) {
            const l = this.snapshot,
                u = l ? l.latestValues : {},
                c = {
                    ...this.latestValues
                },
                f = pr();
            (!this.relativeParent || !this.relativeParent.options.layoutRoot) && (this.relativeTarget = this.relativeTargetOrigin = void 0), this.attemptToResolveRelativeTarget = !a;
            const d = Re(),
                p = l ? l.source : void 0,
                y = this.layout ? this.layout.source : void 0,
                g = p !== y,
                x = this.getStack(),
                v = !x || x.members.length <= 1,
                h = Boolean(g && !v && this.options.crossfade === !0 && !this.path.some(x5));
            this.animationProgress = 0;
            let m;
            this.mixTargetDelta = C => {
                const S = C / 1e3;
                xh(f.x, s.x, S), xh(f.y, s.y, S), this.setTargetDelta(f), this.relativeTarget && this.relativeTargetOrigin && this.layout && this.relativeParent && this.relativeParent.layout && (gi(d, this.layout.layoutBox, this.relativeParent.layout.layoutBox), S5(this.relativeTarget, this.relativeTargetOrigin, d, S), m && t5(this.relativeTarget, m) && (this.isProjectionDirty = !1), m || (m = Re()), dt(m, this.relativeTarget)), g && (this.animationValues = c, G4(c, u, this.latestValues, S, h, v)), this.root.scheduleUpdateProjection(), this.scheduleRender(), this.animationProgress = S
            }, this.mixTargetDelta(this.options.layoutRoot ? 1e3 : 0)
        }
        startAnimation(s) {
            this.notifyListeners("animationStart"), this.currentAnimation && this.currentAnimation.stop(), this.resumingFrom && this.resumingFrom.currentAnimation && this.resumingFrom.currentAnimation.stop(), this.pendingAnimation && (qt(this.pendingAnimation), this.pendingAnimation = void 0), this.pendingAnimation = he.update(() => {
                zo.hasAnimatedSinceResize = !0, this.currentAnimation = l5(0, Ch, {
                    ...s,
                    onUpdate: a => {
                        this.mixTargetDelta(a), s.onUpdate && s.onUpdate(a)
                    },
                    onComplete: () => {
                        s.onComplete && s.onComplete(), this.completeAnimation()
                    }
                }), this.resumingFrom && (this.resumingFrom.currentAnimation = this.currentAnimation), this.pendingAnimation = void 0
            })
        }
        completeAnimation() {
            this.resumingFrom && (this.resumingFrom.currentAnimation = void 0, this.resumingFrom.preserveOpacity = void 0);
            const s = this.getStack();
            s && s.exitAnimationComplete(), this.resumingFrom = this.currentAnimation = this.animationValues = void 0, this.notifyListeners("animationComplete")
        }
        finishAnimation() {
            this.currentAnimation && (this.mixTargetDelta && this.mixTargetDelta(Ch), this.currentAnimation.stop()), this.completeAnimation()
        }
        applyTransformsToTarget() {
            const s = this.getLead();
            let {
                targetWithTransforms: a,
                target: l,
                layout: u,
                latestValues: c
            } = s;
            if (!(!a || !l || !u)) {
                if (this !== s && this.layout && u && Lm(this.options.animationType, this.layout.layoutBox, u.layoutBox)) {
                    l = this.target || Re();
                    const f = lt(this.layout.layoutBox.x);
                    l.x.min = s.target.x.min, l.x.max = l.x.min + f;
                    const d = lt(this.layout.layoutBox.y);
                    l.y.min = s.target.y.min, l.y.max = l.y.min + d
                }
                dt(a, l), mr(a, c), vi(this.projectionDeltaWithTransform, this.layoutCorrected, a, c)
            }
        }
        registerSharedNode(s, a) {
            this.sharedNodes.has(s) || this.sharedNodes.set(s, new n5), this.sharedNodes.get(s).add(a);
            const u = a.options.initialPromotionConfig;
            a.promote({
                transition: u ? u.transition : void 0,
                preserveFollowOpacity: u && u.shouldPreserveFollowOpacity ? u.shouldPreserveFollowOpacity(a) : void 0
            })
        }
        isLead() {
            const s = this.getStack();
            return s ? s.lead === this : !0
        }
        getLead() {
            var s;
            const {
                layoutId: a
            } = this.options;
            return a ? ((s = this.getStack()) === null || s === void 0 ? void 0 : s.lead) || this : this
        }
        getPrevLead() {
            var s;
            const {
                layoutId: a
            } = this.options;
            return a ? (s = this.getStack()) === null || s === void 0 ? void 0 : s.prevLead : void 0
        }
        getStack() {
            const {
                layoutId: s
            } = this.options;
            if (s) return this.root.sharedNodes.get(s)
        }
        promote({
            needsReset: s,
            transition: a,
            preserveFollowOpacity: l
        } = {}) {
            const u = this.getStack();
            u && u.promote(this, l), s && (this.projectionDelta = void 0, this.needsReset = !0), a && this.setOptions({
                transition: a
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
            let a = !1;
            const {
                latestValues: l
            } = s;
            if ((l.rotate || l.rotateX || l.rotateY || l.rotateZ) && (a = !0), !a) return;
            const u = {};
            for (let c = 0; c < gh.length; c++) {
                const f = "rotate" + gh[c];
                l[f] && (u[f] = l[f], s.setStaticValue(f, 0))
            }
            s.render();
            for (const c in u) s.setStaticValue(c, u[c]);
            s.scheduleRender()
        }
        getProjectionStyles(s = {}) {
            var a, l;
            const u = {};
            if (!this.instance || this.isSVG) return u;
            if (this.isVisible) u.visibility = "";
            else return {
                visibility: "hidden"
            };
            const c = this.getTransformTemplate();
            if (this.needsReset) return this.needsReset = !1, u.opacity = "", u.pointerEvents = jo(s.pointerEvents) || "", u.transform = c ? c(this.latestValues, "") : "none", u;
            const f = this.getLead();
            if (!this.projectionDelta || !this.layout || !f.target) {
                const g = {};
                return this.options.layoutId && (g.opacity = this.latestValues.opacity !== void 0 ? this.latestValues.opacity : 1, g.pointerEvents = jo(s.pointerEvents) || ""), this.hasProjected && !On(this.latestValues) && (g.transform = c ? c({}, "") : "none", this.hasProjected = !1), g
            }
            const d = f.animationValues || f.latestValues;
            this.applyTransformsToTarget(), u.transform = vh(this.projectionDeltaWithTransform, this.treeScale, d), c && (u.transform = c(d, u.transform));
            const {
                x: p,
                y
            } = this.projectionDelta;
            u.transformOrigin = `${p.origin*100}% ${y.origin*100}% 0`, f.animationValues ? u.opacity = f === this ? (l = (a = d.opacity) !== null && a !== void 0 ? a : this.latestValues.opacity) !== null && l !== void 0 ? l : 1 : this.preserveOpacity ? this.latestValues.opacity : d.opacityExit : u.opacity = f === this ? d.opacity !== void 0 ? d.opacity : "" : d.opacityExit !== void 0 ? d.opacityExit : 0;
            for (const g in gs) {
                if (d[g] === void 0) continue;
                const {
                    correct: x,
                    applyTo: v
                } = gs[g], h = u.transform === "none" ? d[g] : x(d[g], f);
                if (v) {
                    const m = v.length;
                    for (let C = 0; C < m; C++) u[v[C]] = h
                } else u[g] = h
            }
            return this.options.layoutId && (u.pointerEvents = f === this ? jo(s.pointerEvents) || "" : "none"), u
        }
        clearSnapshot() {
            this.resumeFrom = this.snapshot = void 0
        }
        resetTree() {
            this.root.nodes.forEach(s => {
                var a;
                return (a = s.currentAnimation) === null || a === void 0 ? void 0 : a.stop()
            }), this.root.nodes.forEach(wh), this.root.sharedNodes.clear()
        }
    }
}

function c5(e) {
    e.updateLayout()
}

function f5(e) {
    var t;
    const n = ((t = e.resumeFrom) === null || t === void 0 ? void 0 : t.snapshot) || e.snapshot;
    if (e.isLead() && e.layout && n && e.hasListeners("didUpdate")) {
        const {
            layoutBox: r,
            measuredBox: i
        } = e.layout, {
            animationType: o
        } = e.options, s = n.source !== e.layout.source;
        o === "size" ? Ft(f => {
            const d = s ? n.measuredBox[f] : n.layoutBox[f],
                p = lt(d);
            d.min = r[f].min, d.max = d.min + p
        }) : Lm(o, n.layoutBox, r) && Ft(f => {
            const d = s ? n.measuredBox[f] : n.layoutBox[f],
                p = lt(r[f]);
            d.max = d.min + p, e.relativeTarget && !e.currentAnimation && (e.isProjectionDirty = !0, e.relativeTarget[f].max = e.relativeTarget[f].min + p)
        });
        const a = pr();
        vi(a, r, n.layoutBox);
        const l = pr();
        s ? vi(l, e.applyTransform(i, !0), n.measuredBox) : vi(l, r, n.layoutBox);
        const u = !Mm(a);
        let c = !1;
        if (!e.resumeFrom) {
            const f = e.getClosestProjectingParent();
            if (f && !f.resumeFrom) {
                const {
                    snapshot: d,
                    layout: p
                } = f;
                if (d && p) {
                    const y = Re();
                    gi(y, n.layoutBox, d.layoutBox);
                    const g = Re();
                    gi(g, r, p.layoutBox), Om(y, g) || (c = !0), f.options.layoutRoot && (e.relativeTarget = g, e.relativeTargetOrigin = y, e.relativeParent = f)
                }
            }
        }
        e.notifyListeners("didUpdate", {
            layout: r,
            snapshot: n,
            delta: l,
            layoutDelta: a,
            hasLayoutChanged: u,
            hasRelativeTargetChanged: c
        })
    } else if (e.isLead()) {
        const {
            onExitComplete: r
        } = e.options;
        r && r()
    }
    e.options.transition = void 0
}

function d5(e) {
    Fn.totalNodes++, e.parent && (e.isProjecting() || (e.isProjectionDirty = e.parent.isProjectionDirty), e.isSharedProjectionDirty || (e.isSharedProjectionDirty = Boolean(e.isProjectionDirty || e.parent.isProjectionDirty || e.parent.isSharedProjectionDirty)), e.isTransformDirty || (e.isTransformDirty = e.parent.isTransformDirty))
}

function h5(e) {
    e.isProjectionDirty = e.isSharedProjectionDirty = e.isTransformDirty = !1
}

function p5(e) {
    e.clearSnapshot()
}

function wh(e) {
    e.clearMeasurements()
}

function m5(e) {
    e.isLayoutDirty = !1
}

function y5(e) {
    const {
        visualElement: t
    } = e.options;
    t && t.getProps().onBeforeLayoutMeasure && t.notify("BeforeLayoutMeasure"), e.resetTransform()
}

function Sh(e) {
    e.finishAnimation(), e.targetDelta = e.relativeTarget = e.target = void 0, e.isProjectionDirty = !0
}

function v5(e) {
    e.resolveTargetDelta()
}

function g5(e) {
    e.calcProjection()
}

function C5(e) {
    e.resetRotation()
}

function w5(e) {
    e.removeLeadSnapshot()
}

function xh(e, t, n) {
    e.translate = Ce(t.translate, 0, n), e.scale = Ce(t.scale, 1, n), e.origin = t.origin, e.originPoint = t.originPoint
}

function Ph(e, t, n, r) {
    e.min = Ce(t.min, n.min, r), e.max = Ce(t.max, n.max, r)
}

function S5(e, t, n, r) {
    Ph(e.x, t.x, n.x, r), Ph(e.y, t.y, n.y, r)
}

function x5(e) {
    return e.animationValues && e.animationValues.opacityExit !== void 0
}
const P5 = {
        duration: .45,
        ease: [.4, 0, .1, 1]
    },
    kh = e => typeof navigator < "u" && navigator.userAgent.toLowerCase().includes(e),
    Eh = kh("applewebkit/") && !kh("chrome/") ? Math.round : Pe;

function Th(e) {
    e.min = Eh(e.min), e.max = Eh(e.max)
}

function k5(e) {
    Th(e.x), Th(e.y)
}

function Lm(e, t, n) {
    return e === "position" || e === "preserve-aspect" && !Pu(yh(t), yh(n), .2)
}
const E5 = Fm({
        attachResizeListener: (e, t) => jt(e, "resize", t),
        measureScroll: () => ({
            x: document.documentElement.scrollLeft || document.body.scrollLeft,
            y: document.documentElement.scrollTop || document.body.scrollTop
        }),
        checkIsScrollRoot: () => !0
    }),
    pl = {
        current: void 0
    },
    bm = Fm({
        measureScroll: e => ({
            x: e.scrollLeft,
            y: e.scrollTop
        }),
        defaultParent: () => {
            if (!pl.current) {
                const e = new E5({});
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
    T5 = {
        pan: {
            Feature: V4
        },
        drag: {
            Feature: D4,
            ProjectionNode: bm,
            MeasureLayout: Tm
        }
    },
    R5 = /var\((--[a-zA-Z0-9-_]+),? ?([a-zA-Z0-9 ()%#.,-]+)?\)/;

function A5(e) {
    const t = R5.exec(e);
    if (!t) return [, ];
    const [, n, r] = t;
    return [n, r]
}

function Ru(e, t, n = 1) {
    const [r, i] = A5(e);
    if (!r) return;
    const o = window.getComputedStyle(t).getPropertyValue(r);
    if (o) {
        const s = o.trim();
        return mm(s) ? parseFloat(s) : s
    } else return yu(i) ? Ru(i, t, n + 1) : i
}

function M5(e, {
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
        if (!yu(o)) return;
        const s = Ru(o, r);
        s && i.set(s)
    });
    for (const i in t) {
        const o = t[i];
        if (!yu(o)) continue;
        const s = Ru(o, r);
        s && (t[i] = s, n || (n = {}), n[i] === void 0 && (n[i] = o))
    }
    return {
        target: t,
        transitionEnd: n
    }
}
const O5 = new Set(["width", "height", "top", "left", "right", "bottom", "x", "y", "translateX", "translateY"]),
    Dm = e => O5.has(e),
    F5 = e => Object.keys(e).some(Dm),
    Rh = e => e === Gn || e === j,
    Ah = (e, t) => parseFloat(e.split(", ")[t]),
    Mh = (e, t) => (n, {
        transform: r
    }) => {
        if (r === "none" || !r) return 0;
        const i = r.match(/^matrix3d\((.+)\)$/);
        if (i) return Ah(i[1], t);
        {
            const o = r.match(/^matrix\((.+)\)$/);
            return o ? Ah(o[1], e) : 0
        }
    },
    L5 = new Set(["x", "y", "z"]),
    b5 = qi.filter(e => !L5.has(e));

function D5(e) {
    const t = [];
    return b5.forEach(n => {
        const r = e.getValue(n);
        r !== void 0 && (t.push([n, r.get()]), r.set(n.startsWith("scale") ? 1 : 0))
    }), t.length && e.render(), t
}
const br = {
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
    x: Mh(4, 13),
    y: Mh(5, 14)
};
br.translateX = br.x;
br.translateY = br.y;
const V5 = (e, t, n) => {
        const r = t.measureViewportBox(),
            i = t.current,
            o = getComputedStyle(i),
            {
                display: s
            } = o,
            a = {};
        s === "none" && t.setStaticValue("display", e.display || "block"), n.forEach(u => {
            a[u] = br[u](r, o)
        }), t.render();
        const l = t.measureViewportBox();
        return n.forEach(u => {
            const c = t.getValue(u);
            c && c.jump(a[u]), e[u] = br[u](l, o)
        }), e
    },
    _5 = (e, t, n = {}, r = {}) => {
        t = {
            ...t
        }, r = {
            ...r
        };
        const i = Object.keys(t).filter(Dm);
        let o = [],
            s = !1;
        const a = [];
        if (i.forEach(l => {
                const u = e.getValue(l);
                if (!e.hasValue(l)) return;
                let c = n[l],
                    f = Xr(c);
                const d = t[l];
                let p;
                if (ws(d)) {
                    const y = d.length,
                        g = d[0] === null ? 1 : 0;
                    c = d[g], f = Xr(c);
                    for (let x = g; x < y && d[x] !== null; x++) p ? oa(Xr(d[x]) === p) : p = Xr(d[x])
                } else p = Xr(d);
                if (f !== p)
                    if (Rh(f) && Rh(p)) {
                        const y = u.get();
                        typeof y == "string" && u.set(parseFloat(y)), typeof d == "string" ? t[l] = parseFloat(d) : Array.isArray(d) && p === j && (t[l] = d.map(parseFloat))
                    } else f != null && f.transform && (p != null && p.transform) && (c === 0 || d === 0) ? c === 0 ? u.set(p.transform(c)) : t[l] = f.transform(d) : (s || (o = D5(e), s = !0), a.push(l), r[l] = r[l] !== void 0 ? r[l] : t[l], u.jump(d))
            }), a.length) {
            const l = a.indexOf("height") >= 0 ? window.pageYOffset : null,
                u = V5(t, e, a);
            return o.length && o.forEach(([c, f]) => {
                e.getValue(c).set(f)
            }), e.render(), Js && l !== null && window.scrollTo({
                top: l
            }), {
                target: u,
                transitionEnd: r
            }
        } else return {
            target: t,
            transitionEnd: r
        }
    };

function I5(e, t, n, r) {
    return F5(t) ? _5(e, t, n, r) : {
        target: t,
        transitionEnd: r
    }
}
const $5 = (e, t, n, r) => {
        const i = M5(e, t, r);
        return t = i.target, r = i.transitionEnd, I5(e, t, n, r)
    },
    Au = {
        current: null
    },
    Vm = {
        current: !1
    };

function N5() {
    if (Vm.current = !0, !!Js)
        if (window.matchMedia) {
            const e = window.matchMedia("(prefers-reduced-motion)"),
                t = () => Au.current = e.matches;
            e.addListener(t), t()
        } else Au.current = !1
}

function j5(e, t, n) {
    const {
        willChange: r
    } = t;
    for (const i in t) {
        const o = t[i],
            s = n[i];
        if (rt(o)) e.addValue(i, o), ks(r) && r.add(i);
        else if (rt(s)) e.addValue(i, Lr(o, {
            owner: e
        })), ks(r) && r.remove(i);
        else if (s !== o)
            if (e.hasValue(i)) {
                const a = e.getValue(i);
                !a.hasAnimated && a.set(o)
            } else {
                const a = e.getStaticValue(i);
                e.addValue(i, Lr(a !== void 0 ? a : o, {
                    owner: e
                }))
            }
    }
    for (const i in n) t[i] === void 0 && e.removeValue(i);
    return t
}
const Oh = new WeakMap,
    _m = Object.keys(Ni),
    z5 = _m.length,
    Fh = ["AnimationStart", "AnimationComplete", "Update", "BeforeLayoutMeasure", "LayoutMeasure", "LayoutAnimationStart", "LayoutAnimationComplete"],
    B5 = Nc.length;
class U5 {
    constructor({
        parent: t,
        props: n,
        presenceContext: r,
        reducedMotionConfig: i,
        visualState: o
    }, s = {}) {
        this.current = null, this.children = new Set, this.isVariantNode = !1, this.isControllingVariants = !1, this.shouldReduceMotion = null, this.values = new Map, this.features = {}, this.valueSubscriptions = new Map, this.prevMotionValues = {}, this.events = {}, this.propEventSubscriptions = {}, this.notifyUpdate = () => this.notify("Update", this.latestValues), this.render = () => {
            this.current && (this.triggerBuild(), this.renderInstance(this.current, this.renderState, this.props.style, this.projection))
        }, this.scheduleRender = () => he.render(this.render, !1, !0);
        const {
            latestValues: a,
            renderState: l
        } = o;
        this.latestValues = a, this.baseTarget = {
            ...a
        }, this.initialValues = n.initial ? {
            ...a
        } : {}, this.renderState = l, this.parent = t, this.props = n, this.presenceContext = r, this.depth = t ? t.depth + 1 : 0, this.reducedMotionConfig = i, this.options = s, this.isControllingVariants = ta(n), this.isVariantNode = C0(n), this.isVariantNode && (this.variantChildren = new Set), this.manuallyAnimateOnMount = Boolean(t && t.current);
        const {
            willChange: u,
            ...c
        } = this.scrapeMotionValuesFromProps(n, {});
        for (const f in c) {
            const d = c[f];
            a[f] !== void 0 && rt(d) && (d.set(a[f], !1), ks(u) && u.add(f))
        }
    }
    scrapeMotionValuesFromProps(t, n) {
        return {}
    }
    mount(t) {
        this.current = t, Oh.set(t, this), this.projection && !this.projection.instance && this.projection.mount(t), this.parent && this.isVariantNode && !this.isControllingVariants && (this.removeFromVariantTree = this.parent.addVariantChild(this)), this.values.forEach((n, r) => this.bindToMotionValue(r, n)), Vm.current || N5(), this.shouldReduceMotion = this.reducedMotionConfig === "never" ? !1 : this.reducedMotionConfig === "always" ? !0 : Au.current, this.parent && this.parent.children.add(this), this.update(this.props, this.presenceContext)
    }
    unmount() {
        Oh.delete(this.current), this.projection && this.projection.unmount(), qt(this.notifyUpdate), qt(this.render), this.valueSubscriptions.forEach(t => t()), this.removeFromVariantTree && this.removeFromVariantTree(), this.parent && this.parent.children.delete(this);
        for (const t in this.events) this.events[t].clear();
        for (const t in this.features) this.features[t].unmount();
        this.current = null
    }
    bindToMotionValue(t, n) {
        const r = qn.has(t),
            i = n.on("change", s => {
                this.latestValues[t] = s, this.props.onUpdate && he.update(this.notifyUpdate, !1, !0), r && this.projection && (this.projection.isTransformDirty = !0)
            }),
            o = n.on("renderRequest", this.scheduleRender);
        this.valueSubscriptions.set(t, () => {
            i(), o()
        })
    }
    sortNodePosition(t) {
        return !this.current || !this.sortInstanceNodePosition || this.type !== t.type ? 0 : this.sortInstanceNodePosition(this.current, t.current)
    }
    loadFeatures({
        children: t,
        ...n
    }, r, i, o) {
        let s, a;
        for (let l = 0; l < z5; l++) {
            const u = _m[l],
                {
                    isEnabled: c,
                    Feature: f,
                    ProjectionNode: d,
                    MeasureLayout: p
                } = Ni[u];
            d && (s = d), c(n) && (!this.features[u] && f && (this.features[u] = new f(this)), p && (a = p))
        }
        if (!this.projection && s) {
            this.projection = new s(this.latestValues, this.parent && this.parent.projection);
            const {
                layoutId: l,
                layout: u,
                drag: c,
                dragConstraints: f,
                layoutScroll: d,
                layoutRoot: p
            } = n;
            this.projection.setOptions({
                layoutId: l,
                layout: u,
                alwaysMeasureLayout: Boolean(c) || f && dr(f),
                visualElement: this,
                scheduleRender: () => this.scheduleRender(),
                animationType: typeof u == "string" ? u : "both",
                initialPromotionConfig: o,
                layoutScroll: d,
                layoutRoot: p
            })
        }
        return a
    }
    updateFeatures() {
        for (const t in this.features) {
            const n = this.features[t];
            n.isMounted ? n.update() : (n.mount(), n.isMounted = !0)
        }
    }
    triggerBuild() {
        this.build(this.renderState, this.latestValues, this.options, this.props)
    }
    measureViewportBox() {
        return this.current ? this.measureInstanceViewportBox(this.current, this.props) : Re()
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
    update(t, n) {
        (t.transformTemplate || this.props.transformTemplate) && this.scheduleRender(), this.prevProps = this.props, this.props = t, this.prevPresenceContext = this.presenceContext, this.presenceContext = n;
        for (let r = 0; r < Fh.length; r++) {
            const i = Fh[r];
            this.propEventSubscriptions[i] && (this.propEventSubscriptions[i](), delete this.propEventSubscriptions[i]);
            const o = t["on" + i];
            o && (this.propEventSubscriptions[i] = this.on(i, o))
        }
        this.prevMotionValues = j5(this, this.scrapeMotionValuesFromProps(t, this.prevProps), this.prevMotionValues), this.handleChildMotionValue && this.handleChildMotionValue()
    }
    getProps() {
        return this.props
    }
    getVariant(t) {
        return this.props.variants ? this.props.variants[t] : void 0
    }
    getDefaultTransition() {
        return this.props.transition
    }
    getTransformPagePoint() {
        return this.props.transformPagePoint
    }
    getClosestVariantNode() {
        return this.isVariantNode ? this : this.parent ? this.parent.getClosestVariantNode() : void 0
    }
    getVariantContext(t = !1) {
        if (t) return this.parent ? this.parent.getVariantContext() : void 0;
        if (!this.isControllingVariants) {
            const r = this.parent ? this.parent.getVariantContext() || {} : {};
            return this.props.initial !== void 0 && (r.initial = this.props.initial), r
        }
        const n = {};
        for (let r = 0; r < B5; r++) {
            const i = Nc[r],
                o = this.props[i];
            ($i(o) || o === !1) && (n[i] = o)
        }
        return n
    }
    addVariantChild(t) {
        const n = this.getClosestVariantNode();
        if (n) return n.variantChildren && n.variantChildren.add(t), () => n.variantChildren.delete(t)
    }
    addValue(t, n) {
        n !== this.values.get(t) && (this.removeValue(t), this.bindToMotionValue(t, n)), this.values.set(t, n), this.latestValues[t] = n.get()
    }
    removeValue(t) {
        this.values.delete(t);
        const n = this.valueSubscriptions.get(t);
        n && (n(), this.valueSubscriptions.delete(t)), delete this.latestValues[t], this.removeValueFromRenderState(t, this.renderState)
    }
    hasValue(t) {
        return this.values.has(t)
    }
    getValue(t, n) {
        if (this.props.values && this.props.values[t]) return this.props.values[t];
        let r = this.values.get(t);
        return r === void 0 && n !== void 0 && (r = Lr(n, {
            owner: this
        }), this.addValue(t, r)), r
    }
    readValue(t) {
        var n;
        return this.latestValues[t] !== void 0 || !this.current ? this.latestValues[t] : (n = this.getBaseTargetFromProps(this.props, t)) !== null && n !== void 0 ? n : this.readValueFromInstance(this.current, t, this.options)
    }
    setBaseTarget(t, n) {
        this.baseTarget[t] = n
    }
    getBaseTarget(t) {
        var n;
        const {
            initial: r
        } = this.props, i = typeof r == "string" || typeof r == "object" ? (n = qc(this.props, r)) === null || n === void 0 ? void 0 : n[t] : void 0;
        if (r && i !== void 0) return i;
        const o = this.getBaseTargetFromProps(this.props, t);
        return o !== void 0 && !rt(o) ? o : this.initialValues[t] !== void 0 && i === void 0 ? void 0 : this.baseTarget[t]
    }
    on(t, n) {
        return this.events[t] || (this.events[t] = new rf), this.events[t].add(n)
    }
    notify(t, ...n) {
        this.events[t] && this.events[t].notify(...n)
    }
}
class Im extends U5 {
    sortInstanceNodePosition(t, n) {
        return t.compareDocumentPosition(n) & 2 ? 1 : -1
    }
    getBaseTargetFromProps(t, n) {
        return t.style ? t.style[n] : void 0
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
        let s = e4(r, t || {}, this);
        if (i && (n && (n = i(n)), r && (r = i(r)), s && (s = i(s))), o) {
            Xg(this, r, s);
            const a = $5(this, r, s, n);
            n = a.transitionEnd, r = a.target
        }
        return {
            transition: t,
            transitionEnd: n,
            ...r
        }
    }
}

function Q5(e) {
    return window.getComputedStyle(e)
}
class H5 extends Im {
    readValueFromInstance(t, n) {
        if (qn.has(n)) {
            const r = Jc(n);
            return r && r.default || 0
        } else {
            const r = Q5(t),
                i = (P0(n) ? r.getPropertyValue(n) : r[n]) || 0;
            return typeof i == "string" ? i.trim() : i
        }
    }
    measureInstanceViewportBox(t, {
        transformPagePoint: n
    }) {
        return km(t, n)
    }
    build(t, n, r, i) {
        Bc(t, n, r, i.transformTemplate)
    }
    scrapeMotionValuesFromProps(t, n) {
        return Kc(t, n)
    }
    handleChildMotionValue() {
        this.childSubscription && (this.childSubscription(), delete this.childSubscription);
        const {
            children: t
        } = this.props;
        rt(t) && (this.childSubscription = t.on("change", n => {
            this.current && (this.current.textContent = `${n}`)
        }))
    }
    renderInstance(t, n, r, i) {
        M0(t, n, r, i)
    }
}
class W5 extends Im {
    constructor() {
        super(...arguments), this.isSVGTag = !1
    }
    getBaseTargetFromProps(t, n) {
        return t[n]
    }
    readValueFromInstance(t, n) {
        if (qn.has(n)) {
            const r = Jc(n);
            return r && r.default || 0
        }
        return n = O0.has(n) ? n : Wc(n), t.getAttribute(n)
    }
    measureInstanceViewportBox() {
        return Re()
    }
    scrapeMotionValuesFromProps(t, n) {
        return L0(t, n)
    }
    build(t, n, r, i) {
        Qc(t, n, r, this.isSVGTag, i.transformTemplate)
    }
    renderInstance(t, n, r, i) {
        F0(t, n, r, i)
    }
    mount(t) {
        this.isSVGTag = Hc(t.tagName), super.mount(t)
    }
}
const K5 = (e, t) => zc(e) ? new W5(t, {
        enableHardwareAcceleration: !1
    }) : new H5(t, {
        enableHardwareAcceleration: !0
    }),
    q5 = {
        layout: {
            ProjectionNode: bm,
            MeasureLayout: Tm
        }
    },
    G5 = {
        ...p4,
        ..._v,
        ...T5,
        ...q5
    },
    of = Hy((e, t) => Pv(e, t, G5, K5));

function $m() {
    const e = P.useRef(!1);
    return Ic(() => (e.current = !0, () => {
        e.current = !1
    }), []), e
}

function Z5() {
    const e = $m(),
        [t, n] = P.useState(0),
        r = P.useCallback(() => {
            e.current && n(t + 1)
        }, [t]);
    return [P.useCallback(() => he.postRender(r), [r]), t]
}
class Y5 extends P.Component {
    getSnapshotBeforeUpdate(t) {
        const n = this.props.childRef.current;
        if (n && t.isPresent && !this.props.isPresent) {
            const r = this.props.sizeRef.current;
            r.height = n.offsetHeight || 0, r.width = n.offsetWidth || 0, r.top = n.offsetTop, r.left = n.offsetLeft
        }
        return null
    }
    componentDidUpdate() {}
    render() {
        return this.props.children
    }
}

function X5({
    children: e,
    isPresent: t
}) {
    const n = P.useId(),
        r = P.useRef(null),
        i = P.useRef({
            width: 0,
            height: 0,
            top: 0,
            left: 0
        });
    return P.useInsertionEffect(() => {
        const {
            width: o,
            height: s,
            top: a,
            left: l
        } = i.current;
        if (t || !r.current || !o || !s) return;
        r.current.dataset.motionPopId = n;
        const u = document.createElement("style");
        return document.head.appendChild(u), u.sheet && u.sheet.insertRule(`
          [data-motion-pop-id="${n}"] {
            position: absolute !important;
            width: ${o}px !important;
            height: ${s}px !important;
            top: ${a}px !important;
            left: ${l}px !important;
          }
        `), () => {
            document.head.removeChild(u)
        }
    }, [t]), P.createElement(Y5, {
        isPresent: t,
        childRef: r,
        sizeRef: i
    }, P.cloneElement(e, {
        ref: r
    }))
}
const ml = ({
    children: e,
    initial: t,
    isPresent: n,
    onExitComplete: r,
    custom: i,
    presenceAffectsLayout: o,
    mode: s
}) => {
    const a = b0(J5),
        l = P.useId(),
        u = P.useMemo(() => ({
            id: l,
            initial: t,
            isPresent: n,
            custom: i,
            onExitComplete: c => {
                a.set(c, !0);
                for (const f of a.values())
                    if (!f) return;
                r && r()
            },
            register: c => (a.set(c, !1), () => a.delete(c))
        }), o ? void 0 : [n]);
    return P.useMemo(() => {
        a.forEach((c, f) => a.set(f, !1))
    }, [n]), P.useEffect(() => {
        !n && !a.size && r && r()
    }, [n]), s === "popLayout" && (e = P.createElement(X5, {
        isPresent: n
    }, e)), P.createElement(Xs.Provider, {
        value: u
    }, e)
};

function J5() {
    return new Map
}

function e8(e) {
    return P.useEffect(() => () => e(), [])
}
const Jn = e => e.key || "";

function t8(e, t) {
    e.forEach(n => {
        const r = Jn(n);
        t.set(r, n)
    })
}

function n8(e) {
    const t = [];
    return P.Children.forEach(e, n => {
        P.isValidElement(n) && t.push(n)
    }), t
}
const r8 = ({
    children: e,
    custom: t,
    initial: n = !0,
    onExitComplete: r,
    exitBeforeEnter: i,
    presenceAffectsLayout: o = !0,
    mode: s = "sync"
}) => {
    oa(!i);
    const a = P.useContext(jc).forceRender || Z5()[0],
        l = $m(),
        u = n8(e);
    let c = u;
    const f = P.useRef(new Map).current,
        d = P.useRef(c),
        p = P.useRef(new Map).current,
        y = P.useRef(!0);
    if (Ic(() => {
            y.current = !1, t8(u, p), d.current = c
        }), e8(() => {
            y.current = !0, p.clear(), f.clear()
        }), y.current) return P.createElement(P.Fragment, null, c.map(h => P.createElement(ml, {
        key: Jn(h),
        isPresent: !0,
        initial: n ? void 0 : !1,
        presenceAffectsLayout: o,
        mode: s
    }, h)));
    c = [...c];
    const g = d.current.map(Jn),
        x = u.map(Jn),
        v = g.length;
    for (let h = 0; h < v; h++) {
        const m = g[h];
        x.indexOf(m) === -1 && !f.has(m) && f.set(m, void 0)
    }
    return s === "wait" && f.size && (c = []), f.forEach((h, m) => {
        if (x.indexOf(m) !== -1) return;
        const C = p.get(m);
        if (!C) return;
        const S = g.indexOf(m);
        let k = h;
        if (!k) {
            const T = () => {
                p.delete(m), f.delete(m);
                const E = d.current.findIndex(_ => _.key === m);
                if (d.current.splice(E, 1), !f.size) {
                    if (d.current = u, l.current === !1) return;
                    a(), r && r()
                }
            };
            k = P.createElement(ml, {
                key: Jn(C),
                isPresent: !1,
                onExitComplete: T,
                custom: t,
                presenceAffectsLayout: o,
                mode: s
            }, C), f.set(m, k)
        }
        c.splice(S, 0, k)
    }), c = c.map(h => {
        const m = h.key;
        return f.has(m) ? h : P.createElement(ml, {
            key: Jn(h),
            isPresent: !0,
            presenceAffectsLayout: o,
            mode: s
        }, h)
    }), P.createElement(P.Fragment, null, f.size ? c : c.map(h => P.cloneElement(h)))
};
var Ts = {},
    i8 = {
        get exports() {
            return Ts
        },
        set exports(e) {
            Ts = e
        }
    },
    ae = {};
/**
 * @license React
 * react-is.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
var sf = Symbol.for("react.element"),
    af = Symbol.for("react.portal"),
    aa = Symbol.for("react.fragment"),
    la = Symbol.for("react.strict_mode"),
    ua = Symbol.for("react.profiler"),
    ca = Symbol.for("react.provider"),
    fa = Symbol.for("react.context"),
    o8 = Symbol.for("react.server_context"),
    da = Symbol.for("react.forward_ref"),
    ha = Symbol.for("react.suspense"),
    pa = Symbol.for("react.suspense_list"),
    ma = Symbol.for("react.memo"),
    ya = Symbol.for("react.lazy"),
    s8 = Symbol.for("react.offscreen"),
    Nm;
Nm = Symbol.for("react.module.reference");

function Ct(e) {
    if (typeof e == "object" && e !== null) {
        var t = e.$$typeof;
        switch (t) {
            case sf:
                switch (e = e.type, e) {
                    case aa:
                    case ua:
                    case la:
                    case ha:
                    case pa:
                        return e;
                    default:
                        switch (e = e && e.$$typeof, e) {
                            case o8:
                            case fa:
                            case da:
                            case ya:
                            case ma:
                            case ca:
                                return e;
                            default:
                                return t
                        }
                }
            case af:
                return t
        }
    }
}
ae.ContextConsumer = fa;
ae.ContextProvider = ca;
ae.Element = sf;
ae.ForwardRef = da;
ae.Fragment = aa;
ae.Lazy = ya;
ae.Memo = ma;
ae.Portal = af;
ae.Profiler = ua;
ae.StrictMode = la;
ae.Suspense = ha;
ae.SuspenseList = pa;
ae.isAsyncMode = function() {
    return !1
};
ae.isConcurrentMode = function() {
    return !1
};
ae.isContextConsumer = function(e) {
    return Ct(e) === fa
};
ae.isContextProvider = function(e) {
    return Ct(e) === ca
};
ae.isElement = function(e) {
    return typeof e == "object" && e !== null && e.$$typeof === sf
};
ae.isForwardRef = function(e) {
    return Ct(e) === da
};
ae.isFragment = function(e) {
    return Ct(e) === aa
};
ae.isLazy = function(e) {
    return Ct(e) === ya
};
ae.isMemo = function(e) {
    return Ct(e) === ma
};
ae.isPortal = function(e) {
    return Ct(e) === af
};
ae.isProfiler = function(e) {
    return Ct(e) === ua
};
ae.isStrictMode = function(e) {
    return Ct(e) === la
};
ae.isSuspense = function(e) {
    return Ct(e) === ha
};
ae.isSuspenseList = function(e) {
    return Ct(e) === pa
};
ae.isValidElementType = function(e) {
    return typeof e == "string" || typeof e == "function" || e === aa || e === ua || e === la || e === ha || e === pa || e === s8 || typeof e == "object" && e !== null && (e.$$typeof === ya || e.$$typeof === ma || e.$$typeof === ca || e.$$typeof === fa || e.$$typeof === da || e.$$typeof === Nm || e.getModuleId !== void 0)
};
ae.typeOf = Ct;
(function(e) {
    e.exports = ae
})(i8);

function a8(e) {
    function t(M, L, b, z, w) {
        for (var K = 0, F = 0, fe = 0, X = 0, G, B, Te = 0, Ye = 0, ne, ze = ne = G = 0, re = 0, Ve = 0, Br = 0, _e = 0, to = b.length, Ur = to - 1, wt, U = "", ke = "", Ma = "", Oa = "", Zt; re < to;) {
            if (B = b.charCodeAt(re), re === Ur && F + X + fe + K !== 0 && (F !== 0 && (B = F === 47 ? 10 : 47), X = fe = K = 0, to++, Ur++), F + X + fe + K === 0) {
                if (re === Ur && (0 < Ve && (U = U.replace(d, "")), 0 < U.trim().length)) {
                    switch (B) {
                        case 32:
                        case 9:
                        case 59:
                        case 13:
                        case 10:
                            break;
                        default:
                            U += b.charAt(re)
                    }
                    B = 59
                }
                switch (B) {
                    case 123:
                        for (U = U.trim(), G = U.charCodeAt(0), ne = 1, _e = ++re; re < to;) {
                            switch (B = b.charCodeAt(re)) {
                                case 123:
                                    ne++;
                                    break;
                                case 125:
                                    ne--;
                                    break;
                                case 47:
                                    switch (B = b.charCodeAt(re + 1)) {
                                        case 42:
                                        case 47:
                                            e: {
                                                for (ze = re + 1; ze < Ur; ++ze) switch (b.charCodeAt(ze)) {
                                                    case 47:
                                                        if (B === 42 && b.charCodeAt(ze - 1) === 42 && re + 2 !== ze) {
                                                            re = ze + 1;
                                                            break e
                                                        }
                                                        break;
                                                    case 10:
                                                        if (B === 47) {
                                                            re = ze + 1;
                                                            break e
                                                        }
                                                }
                                                re = ze
                                            }
                                    }
                                    break;
                                case 91:
                                    B++;
                                case 40:
                                    B++;
                                case 34:
                                case 39:
                                    for (; re++ < Ur && b.charCodeAt(re) !== B;);
                            }
                            if (ne === 0) break;
                            re++
                        }
                        switch (ne = b.substring(_e, re), G === 0 && (G = (U = U.replace(f, "").trim()).charCodeAt(0)), G) {
                            case 64:
                                switch (0 < Ve && (U = U.replace(d, "")), B = U.charCodeAt(1), B) {
                                    case 100:
                                    case 109:
                                    case 115:
                                    case 45:
                                        Ve = L;
                                        break;
                                    default:
                                        Ve = ie
                                }
                                if (ne = t(L, Ve, ne, B, w + 1), _e = ne.length, 0 < A && (Ve = n(ie, U, Br), Zt = a(3, ne, Ve, L, J, Z, _e, B, w, z), U = Ve.join(""), Zt !== void 0 && (_e = (ne = Zt.trim()).length) === 0 && (B = 0, ne = "")), 0 < _e) switch (B) {
                                    case 115:
                                        U = U.replace(k, s);
                                    case 100:
                                    case 109:
                                    case 45:
                                        ne = U + "{" + ne + "}";
                                        break;
                                    case 107:
                                        U = U.replace(h, "$1 $2"), ne = U + "{" + ne + "}", ne = Q === 1 || Q === 2 && o("@" + ne, 3) ? "@-webkit-" + ne + "@" + ne : "@" + ne;
                                        break;
                                    default:
                                        ne = U + ne, z === 112 && (ne = (ke += ne, ""))
                                } else ne = "";
                                break;
                            default:
                                ne = t(L, n(L, U, Br), ne, z, w + 1)
                        }
                        Ma += ne, ne = Br = Ve = ze = G = 0, U = "", B = b.charCodeAt(++re);
                        break;
                    case 125:
                    case 59:
                        if (U = (0 < Ve ? U.replace(d, "") : U).trim(), 1 < (_e = U.length)) switch (ze === 0 && (G = U.charCodeAt(0), G === 45 || 96 < G && 123 > G) && (_e = (U = U.replace(" ", ":")).length), 0 < A && (Zt = a(1, U, L, M, J, Z, ke.length, z, w, z)) !== void 0 && (_e = (U = Zt.trim()).length) === 0 && (U = "\0\0"), G = U.charCodeAt(0), B = U.charCodeAt(1), G) {
                            case 0:
                                break;
                            case 64:
                                if (B === 105 || B === 99) {
                                    Oa += U + b.charAt(re);
                                    break
                                }
                            default:
                                U.charCodeAt(_e - 1) !== 58 && (ke += i(U, G, B, U.charCodeAt(2)))
                        }
                        Br = Ve = ze = G = 0, U = "", B = b.charCodeAt(++re)
                }
            }
            switch (B) {
                case 13:
                case 10:
                    F === 47 ? F = 0 : 1 + G === 0 && z !== 107 && 0 < U.length && (Ve = 1, U += "\0"), 0 < A * N && a(0, U, L, M, J, Z, ke.length, z, w, z), Z = 1, J++;
                    break;
                case 59:
                case 125:
                    if (F + X + fe + K === 0) {
                        Z++;
                        break
                    }
                default:
                    switch (Z++, wt = b.charAt(re), B) {
                        case 9:
                        case 32:
                            if (X + K + F === 0) switch (Te) {
                                case 44:
                                case 58:
                                case 9:
                                case 32:
                                    wt = "";
                                    break;
                                default:
                                    B !== 32 && (wt = " ")
                            }
                            break;
                        case 0:
                            wt = "\\0";
                            break;
                        case 12:
                            wt = "\\f";
                            break;
                        case 11:
                            wt = "\\v";
                            break;
                        case 38:
                            X + F + K === 0 && (Ve = Br = 1, wt = "\f" + wt);
                            break;
                        case 108:
                            if (X + F + K + H === 0 && 0 < ze) switch (re - ze) {
                                case 2:
                                    Te === 112 && b.charCodeAt(re - 3) === 58 && (H = Te);
                                case 8:
                                    Ye === 111 && (H = Ye)
                            }
                            break;
                        case 58:
                            X + F + K === 0 && (ze = re);
                            break;
                        case 44:
                            F + fe + X + K === 0 && (Ve = 1, wt += "\r");
                            break;
                        case 34:
                        case 39:
                            F === 0 && (X = X === B ? 0 : X === 0 ? B : X);
                            break;
                        case 91:
                            X + F + fe === 0 && K++;
                            break;
                        case 93:
                            X + F + fe === 0 && K--;
                            break;
                        case 41:
                            X + F + K === 0 && fe--;
                            break;
                        case 40:
                            if (X + F + K === 0) {
                                if (G === 0) switch (2 * Te + 3 * Ye) {
                                    case 533:
                                        break;
                                    default:
                                        G = 1
                                }
                                fe++
                            }
                            break;
                        case 64:
                            F + fe + X + K + ze + ne === 0 && (ne = 1);
                            break;
                        case 42:
                        case 47:
                            if (!(0 < X + K + fe)) switch (F) {
                                case 0:
                                    switch (2 * B + 3 * b.charCodeAt(re + 1)) {
                                        case 235:
                                            F = 47;
                                            break;
                                        case 220:
                                            _e = re, F = 42
                                    }
                                    break;
                                case 42:
                                    B === 47 && Te === 42 && _e + 2 !== re && (b.charCodeAt(_e + 2) === 33 && (ke += b.substring(_e, re + 1)), wt = "", F = 0)
                            }
                    }
                    F === 0 && (U += wt)
            }
            Ye = Te, Te = B, re++
        }
        if (_e = ke.length, 0 < _e) {
            if (Ve = L, 0 < A && (Zt = a(2, ke, Ve, M, J, Z, _e, z, w, z), Zt !== void 0 && (ke = Zt).length === 0)) return Oa + ke + Ma;
            if (ke = Ve.join(",") + "{" + ke + "}", Q * H !== 0) {
                switch (Q !== 2 || o(ke, 2) || (H = 0), H) {
                    case 111:
                        ke = ke.replace(C, ":-moz-$1") + ke;
                        break;
                    case 112:
                        ke = ke.replace(m, "::-webkit-input-$1") + ke.replace(m, "::-moz-$1") + ke.replace(m, ":-ms-input-$1") + ke
                }
                H = 0
            }
        }
        return Oa + ke + Ma
    }

    function n(M, L, b) {
        var z = L.trim().split(x);
        L = z;
        var w = z.length,
            K = M.length;
        switch (K) {
            case 0:
            case 1:
                var F = 0;
                for (M = K === 0 ? "" : M[0] + " "; F < w; ++F) L[F] = r(M, L[F], b).trim();
                break;
            default:
                var fe = F = 0;
                for (L = []; F < w; ++F)
                    for (var X = 0; X < K; ++X) L[fe++] = r(M[X] + " ", z[F], b).trim()
        }
        return L
    }

    function r(M, L, b) {
        var z = L.charCodeAt(0);
        switch (33 > z && (z = (L = L.trim()).charCodeAt(0)), z) {
            case 38:
                return L.replace(v, "$1" + M.trim());
            case 58:
                return M.trim() + L.replace(v, "$1" + M.trim());
            default:
                if (0 < 1 * b && 0 < L.indexOf("\f")) return L.replace(v, (M.charCodeAt(0) === 58 ? "" : "$1") + M.trim())
        }
        return M + L
    }

    function i(M, L, b, z) {
        var w = M + ";",
            K = 2 * L + 3 * b + 4 * z;
        if (K === 944) {
            M = w.indexOf(":", 9) + 1;
            var F = w.substring(M, w.length - 1).trim();
            return F = w.substring(0, M).trim() + F + ";", Q === 1 || Q === 2 && o(F, 1) ? "-webkit-" + F + F : F
        }
        if (Q === 0 || Q === 2 && !o(w, 1)) return w;
        switch (K) {
            case 1015:
                return w.charCodeAt(10) === 97 ? "-webkit-" + w + w : w;
            case 951:
                return w.charCodeAt(3) === 116 ? "-webkit-" + w + w : w;
            case 963:
                return w.charCodeAt(5) === 110 ? "-webkit-" + w + w : w;
            case 1009:
                if (w.charCodeAt(4) !== 100) break;
            case 969:
            case 942:
                return "-webkit-" + w + w;
            case 978:
                return "-webkit-" + w + "-moz-" + w + w;
            case 1019:
            case 983:
                return "-webkit-" + w + "-moz-" + w + "-ms-" + w + w;
            case 883:
                if (w.charCodeAt(8) === 45) return "-webkit-" + w + w;
                if (0 < w.indexOf("image-set(", 11)) return w.replace(ee, "$1-webkit-$2") + w;
                break;
            case 932:
                if (w.charCodeAt(4) === 45) switch (w.charCodeAt(5)) {
                    case 103:
                        return "-webkit-box-" + w.replace("-grow", "") + "-webkit-" + w + "-ms-" + w.replace("grow", "positive") + w;
                    case 115:
                        return "-webkit-" + w + "-ms-" + w.replace("shrink", "negative") + w;
                    case 98:
                        return "-webkit-" + w + "-ms-" + w.replace("basis", "preferred-size") + w
                }
                return "-webkit-" + w + "-ms-" + w + w;
            case 964:
                return "-webkit-" + w + "-ms-flex-" + w + w;
            case 1023:
                if (w.charCodeAt(8) !== 99) break;
                return F = w.substring(w.indexOf(":", 15)).replace("flex-", "").replace("space-between", "justify"), "-webkit-box-pack" + F + "-webkit-" + w + "-ms-flex-pack" + F + w;
            case 1005:
                return y.test(w) ? w.replace(p, ":-webkit-") + w.replace(p, ":-moz-") + w : w;
            case 1e3:
                switch (F = w.substring(13).trim(), L = F.indexOf("-") + 1, F.charCodeAt(0) + F.charCodeAt(L)) {
                    case 226:
                        F = w.replace(S, "tb");
                        break;
                    case 232:
                        F = w.replace(S, "tb-rl");
                        break;
                    case 220:
                        F = w.replace(S, "lr");
                        break;
                    default:
                        return w
                }
                return "-webkit-" + w + "-ms-" + F + w;
            case 1017:
                if (w.indexOf("sticky", 9) === -1) break;
            case 975:
                switch (L = (w = M).length - 10, F = (w.charCodeAt(L) === 33 ? w.substring(0, L) : w).substring(M.indexOf(":", 7) + 1).trim(), K = F.charCodeAt(0) + (F.charCodeAt(7) | 0)) {
                    case 203:
                        if (111 > F.charCodeAt(8)) break;
                    case 115:
                        w = w.replace(F, "-webkit-" + F) + ";" + w;
                        break;
                    case 207:
                    case 102:
                        w = w.replace(F, "-webkit-" + (102 < K ? "inline-" : "") + "box") + ";" + w.replace(F, "-webkit-" + F) + ";" + w.replace(F, "-ms-" + F + "box") + ";" + w
                }
                return w + ";";
            case 938:
                if (w.charCodeAt(5) === 45) switch (w.charCodeAt(6)) {
                    case 105:
                        return F = w.replace("-items", ""), "-webkit-" + w + "-webkit-box-" + F + "-ms-flex-" + F + w;
                    case 115:
                        return "-webkit-" + w + "-ms-flex-item-" + w.replace(E, "") + w;
                    default:
                        return "-webkit-" + w + "-ms-flex-line-pack" + w.replace("align-content", "").replace(E, "") + w
                }
                break;
            case 973:
            case 989:
                if (w.charCodeAt(3) !== 45 || w.charCodeAt(4) === 122) break;
            case 931:
            case 953:
                if (D.test(M) === !0) return (F = M.substring(M.indexOf(":") + 1)).charCodeAt(0) === 115 ? i(M.replace("stretch", "fill-available"), L, b, z).replace(":fill-available", ":stretch") : w.replace(F, "-webkit-" + F) + w.replace(F, "-moz-" + F.replace("fill-", "")) + w;
                break;
            case 962:
                if (w = "-webkit-" + w + (w.charCodeAt(5) === 102 ? "-ms-" + w : "") + w, b + z === 211 && w.charCodeAt(13) === 105 && 0 < w.indexOf("transform", 10)) return w.substring(0, w.indexOf(";", 27) + 1).replace(g, "$1-webkit-$2") + w
        }
        return w
    }

    function o(M, L) {
        var b = M.indexOf(L === 1 ? ":" : "{"),
            z = M.substring(0, L !== 3 ? b : 10);
        return b = M.substring(b + 1, M.length - 1), I(L !== 2 ? z : z.replace(_, "$1"), b, L)
    }

    function s(M, L) {
        var b = i(L, L.charCodeAt(0), L.charCodeAt(1), L.charCodeAt(2));
        return b !== L + ";" ? b.replace(T, " or ($1)").substring(4) : "(" + L + ")"
    }

    function a(M, L, b, z, w, K, F, fe, X, G) {
        for (var B = 0, Te = L, Ye; B < A; ++B) switch (Ye = ue[B].call(c, M, Te, b, z, w, K, F, fe, X, G)) {
            case void 0:
            case !1:
            case !0:
            case null:
                break;
            default:
                Te = Ye
        }
        if (Te !== L) return Te
    }

    function l(M) {
        switch (M) {
            case void 0:
            case null:
                A = ue.length = 0;
                break;
            default:
                if (typeof M == "function") ue[A++] = M;
                else if (typeof M == "object")
                    for (var L = 0, b = M.length; L < b; ++L) l(M[L]);
                else N = !!M | 0
        }
        return l
    }

    function u(M) {
        return M = M.prefix, M !== void 0 && (I = null, M ? typeof M != "function" ? Q = 1 : (Q = 2, I = M) : Q = 0), u
    }

    function c(M, L) {
        var b = M;
        if (33 > b.charCodeAt(0) && (b = b.trim()), $ = b, b = [$], 0 < A) {
            var z = a(-1, L, b, b, J, Z, 0, 0, 0, 0);
            z !== void 0 && typeof z == "string" && (L = z)
        }
        var w = t(ie, b, L, 0, 0);
        return 0 < A && (z = a(-2, w, b, b, J, Z, w.length, 0, 0, 0), z !== void 0 && (w = z)), $ = "", H = 0, Z = J = 1, w
    }
    var f = /^\0+/g,
        d = /[\0\r\f]/g,
        p = /: */g,
        y = /zoo|gra/,
        g = /([,: ])(transform)/g,
        x = /,\r+?/g,
        v = /([\t\r\n ])*\f?&/g,
        h = /@(k\w+)\s*(\S*)\s*/,
        m = /::(place)/g,
        C = /:(read-only)/g,
        S = /[svh]\w+-[tblr]{2}/,
        k = /\(\s*(.*)\s*\)/g,
        T = /([\s\S]*?);/g,
        E = /-self|flex-/g,
        _ = /[^]*?(:[rp][el]a[\w-]+)[^]*/,
        D = /stretch|:\s*\w+\-(?:conte|avail)/,
        ee = /([^-])(image-set\()/,
        Z = 1,
        J = 1,
        H = 0,
        Q = 1,
        ie = [],
        ue = [],
        A = 0,
        I = null,
        N = 0,
        $ = "";
    return c.use = l, c.set = u, e !== void 0 && u(e), c
}
var l8 = {
    animationIterationCount: 1,
    borderImageOutset: 1,
    borderImageSlice: 1,
    borderImageWidth: 1,
    boxFlex: 1,
    boxFlexGroup: 1,
    boxOrdinalGroup: 1,
    columnCount: 1,
    columns: 1,
    flex: 1,
    flexGrow: 1,
    flexPositive: 1,
    flexShrink: 1,
    flexNegative: 1,
    flexOrder: 1,
    gridRow: 1,
    gridRowEnd: 1,
    gridRowSpan: 1,
    gridRowStart: 1,
    gridColumn: 1,
    gridColumnEnd: 1,
    gridColumnSpan: 1,
    gridColumnStart: 1,
    msGridRow: 1,
    msGridRowSpan: 1,
    msGridColumn: 1,
    msGridColumnSpan: 1,
    fontWeight: 1,
    lineHeight: 1,
    opacity: 1,
    order: 1,
    orphans: 1,
    tabSize: 1,
    widows: 1,
    zIndex: 1,
    zoom: 1,
    WebkitLineClamp: 1,
    fillOpacity: 1,
    floodOpacity: 1,
    stopOpacity: 1,
    strokeDasharray: 1,
    strokeDashoffset: 1,
    strokeMiterlimit: 1,
    strokeOpacity: 1,
    strokeWidth: 1
};

function u8(e) {
    var t = Object.create(null);
    return function(n) {
        return t[n] === void 0 && (t[n] = e(n)), t[n]
    }
}
var c8 = /^((children|dangerouslySetInnerHTML|key|ref|autoFocus|defaultValue|defaultChecked|innerHTML|suppressContentEditableWarning|suppressHydrationWarning|valueLink|abbr|accept|acceptCharset|accessKey|action|allow|allowUserMedia|allowPaymentRequest|allowFullScreen|allowTransparency|alt|async|autoComplete|autoPlay|capture|cellPadding|cellSpacing|challenge|charSet|checked|cite|classID|className|cols|colSpan|content|contentEditable|contextMenu|controls|controlsList|coords|crossOrigin|data|dateTime|decoding|default|defer|dir|disabled|disablePictureInPicture|download|draggable|encType|enterKeyHint|form|formAction|formEncType|formMethod|formNoValidate|formTarget|frameBorder|headers|height|hidden|high|href|hrefLang|htmlFor|httpEquiv|id|inputMode|integrity|is|keyParams|keyType|kind|label|lang|list|loading|loop|low|marginHeight|marginWidth|max|maxLength|media|mediaGroup|method|min|minLength|multiple|muted|name|nonce|noValidate|open|optimum|pattern|placeholder|playsInline|poster|preload|profile|radioGroup|readOnly|referrerPolicy|rel|required|reversed|role|rows|rowSpan|sandbox|scope|scoped|scrolling|seamless|selected|shape|size|sizes|slot|span|spellCheck|src|srcDoc|srcLang|srcSet|start|step|style|summary|tabIndex|target|title|translate|type|useMap|value|width|wmode|wrap|about|datatype|inlist|prefix|property|resource|typeof|vocab|autoCapitalize|autoCorrect|autoSave|color|incremental|fallback|inert|itemProp|itemScope|itemType|itemID|itemRef|on|option|results|security|unselectable|accentHeight|accumulate|additive|alignmentBaseline|allowReorder|alphabetic|amplitude|arabicForm|ascent|attributeName|attributeType|autoReverse|azimuth|baseFrequency|baselineShift|baseProfile|bbox|begin|bias|by|calcMode|capHeight|clip|clipPathUnits|clipPath|clipRule|colorInterpolation|colorInterpolationFilters|colorProfile|colorRendering|contentScriptType|contentStyleType|cursor|cx|cy|d|decelerate|descent|diffuseConstant|direction|display|divisor|dominantBaseline|dur|dx|dy|edgeMode|elevation|enableBackground|end|exponent|externalResourcesRequired|fill|fillOpacity|fillRule|filter|filterRes|filterUnits|floodColor|floodOpacity|focusable|fontFamily|fontSize|fontSizeAdjust|fontStretch|fontStyle|fontVariant|fontWeight|format|from|fr|fx|fy|g1|g2|glyphName|glyphOrientationHorizontal|glyphOrientationVertical|glyphRef|gradientTransform|gradientUnits|hanging|horizAdvX|horizOriginX|ideographic|imageRendering|in|in2|intercept|k|k1|k2|k3|k4|kernelMatrix|kernelUnitLength|kerning|keyPoints|keySplines|keyTimes|lengthAdjust|letterSpacing|lightingColor|limitingConeAngle|local|markerEnd|markerMid|markerStart|markerHeight|markerUnits|markerWidth|mask|maskContentUnits|maskUnits|mathematical|mode|numOctaves|offset|opacity|operator|order|orient|orientation|origin|overflow|overlinePosition|overlineThickness|panose1|paintOrder|pathLength|patternContentUnits|patternTransform|patternUnits|pointerEvents|points|pointsAtX|pointsAtY|pointsAtZ|preserveAlpha|preserveAspectRatio|primitiveUnits|r|radius|refX|refY|renderingIntent|repeatCount|repeatDur|requiredExtensions|requiredFeatures|restart|result|rotate|rx|ry|scale|seed|shapeRendering|slope|spacing|specularConstant|specularExponent|speed|spreadMethod|startOffset|stdDeviation|stemh|stemv|stitchTiles|stopColor|stopOpacity|strikethroughPosition|strikethroughThickness|string|stroke|strokeDasharray|strokeDashoffset|strokeLinecap|strokeLinejoin|strokeMiterlimit|strokeOpacity|strokeWidth|surfaceScale|systemLanguage|tableValues|targetX|targetY|textAnchor|textDecoration|textRendering|textLength|to|transform|u1|u2|underlinePosition|underlineThickness|unicode|unicodeBidi|unicodeRange|unitsPerEm|vAlphabetic|vHanging|vIdeographic|vMathematical|values|vectorEffect|version|vertAdvY|vertOriginX|vertOriginY|viewBox|viewTarget|visibility|widths|wordSpacing|writingMode|x|xHeight|x1|x2|xChannelSelector|xlinkActuate|xlinkArcrole|xlinkHref|xlinkRole|xlinkShow|xlinkTitle|xlinkType|xmlBase|xmlns|xmlnsXlink|xmlLang|xmlSpace|y|y1|y2|yChannelSelector|z|zoomAndPan|for|class|autofocus)|(([Dd][Aa][Tt][Aa]|[Aa][Rr][Ii][Aa]|x)-.*))$/,
    Lh = u8(function(e) {
        return c8.test(e) || e.charCodeAt(0) === 111 && e.charCodeAt(1) === 110 && e.charCodeAt(2) < 91
    }),
    Mu = {},
    f8 = {
        get exports() {
            return Mu
        },
        set exports(e) {
            Mu = e
        }
    },
    le = {};
/** @license React v16.13.1
 * react-is.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
var De = typeof Symbol == "function" && Symbol.for,
    lf = De ? Symbol.for("react.element") : 60103,
    uf = De ? Symbol.for("react.portal") : 60106,
    va = De ? Symbol.for("react.fragment") : 60107,
    ga = De ? Symbol.for("react.strict_mode") : 60108,
    Ca = De ? Symbol.for("react.profiler") : 60114,
    wa = De ? Symbol.for("react.provider") : 60109,
    Sa = De ? Symbol.for("react.context") : 60110,
    cf = De ? Symbol.for("react.async_mode") : 60111,
    xa = De ? Symbol.for("react.concurrent_mode") : 60111,
    Pa = De ? Symbol.for("react.forward_ref") : 60112,
    ka = De ? Symbol.for("react.suspense") : 60113,
    d8 = De ? Symbol.for("react.suspense_list") : 60120,
    Ea = De ? Symbol.for("react.memo") : 60115,
    Ta = De ? Symbol.for("react.lazy") : 60116,
    h8 = De ? Symbol.for("react.block") : 60121,
    p8 = De ? Symbol.for("react.fundamental") : 60117,
    m8 = De ? Symbol.for("react.responder") : 60118,
    y8 = De ? Symbol.for("react.scope") : 60119;

function ft(e) {
    if (typeof e == "object" && e !== null) {
        var t = e.$$typeof;
        switch (t) {
            case lf:
                switch (e = e.type, e) {
                    case cf:
                    case xa:
                    case va:
                    case Ca:
                    case ga:
                    case ka:
                        return e;
                    default:
                        switch (e = e && e.$$typeof, e) {
                            case Sa:
                            case Pa:
                            case Ta:
                            case Ea:
                            case wa:
                                return e;
                            default:
                                return t
                        }
                }
            case uf:
                return t
        }
    }
}

function jm(e) {
    return ft(e) === xa
}
le.AsyncMode = cf;
le.ConcurrentMode = xa;
le.ContextConsumer = Sa;
le.ContextProvider = wa;
le.Element = lf;
le.ForwardRef = Pa;
le.Fragment = va;
le.Lazy = Ta;
le.Memo = Ea;
le.Portal = uf;
le.Profiler = Ca;
le.StrictMode = ga;
le.Suspense = ka;
le.isAsyncMode = function(e) {
    return jm(e) || ft(e) === cf
};
le.isConcurrentMode = jm;
le.isContextConsumer = function(e) {
    return ft(e) === Sa
};
le.isContextProvider = function(e) {
    return ft(e) === wa
};
le.isElement = function(e) {
    return typeof e == "object" && e !== null && e.$$typeof === lf
};
le.isForwardRef = function(e) {
    return ft(e) === Pa
};
le.isFragment = function(e) {
    return ft(e) === va
};
le.isLazy = function(e) {
    return ft(e) === Ta
};
le.isMemo = function(e) {
    return ft(e) === Ea
};
le.isPortal = function(e) {
    return ft(e) === uf
};
le.isProfiler = function(e) {
    return ft(e) === Ca
};
le.isStrictMode = function(e) {
    return ft(e) === ga
};
le.isSuspense = function(e) {
    return ft(e) === ka
};
le.isValidElementType = function(e) {
    return typeof e == "string" || typeof e == "function" || e === va || e === xa || e === Ca || e === ga || e === ka || e === d8 || typeof e == "object" && e !== null && (e.$$typeof === Ta || e.$$typeof === Ea || e.$$typeof === wa || e.$$typeof === Sa || e.$$typeof === Pa || e.$$typeof === p8 || e.$$typeof === m8 || e.$$typeof === y8 || e.$$typeof === h8)
};
le.typeOf = ft;
(function(e) {
    e.exports = le
})(f8);
var ff = Mu,
    v8 = {
        childContextTypes: !0,
        contextType: !0,
        contextTypes: !0,
        defaultProps: !0,
        displayName: !0,
        getDefaultProps: !0,
        getDerivedStateFromError: !0,
        getDerivedStateFromProps: !0,
        mixins: !0,
        propTypes: !0,
        type: !0
    },
    g8 = {
        name: !0,
        length: !0,
        prototype: !0,
        caller: !0,
        callee: !0,
        arguments: !0,
        arity: !0
    },
    C8 = {
        $$typeof: !0,
        render: !0,
        defaultProps: !0,
        displayName: !0,
        propTypes: !0
    },
    zm = {
        $$typeof: !0,
        compare: !0,
        defaultProps: !0,
        displayName: !0,
        propTypes: !0,
        type: !0
    },
    df = {};
df[ff.ForwardRef] = C8;
df[ff.Memo] = zm;

function bh(e) {
    return ff.isMemo(e) ? zm : df[e.$$typeof] || v8
}
var w8 = Object.defineProperty,
    S8 = Object.getOwnPropertyNames,
    Dh = Object.getOwnPropertySymbols,
    x8 = Object.getOwnPropertyDescriptor,
    P8 = Object.getPrototypeOf,
    Vh = Object.prototype;

function Bm(e, t, n) {
    if (typeof t != "string") {
        if (Vh) {
            var r = P8(t);
            r && r !== Vh && Bm(e, r, n)
        }
        var i = S8(t);
        Dh && (i = i.concat(Dh(t)));
        for (var o = bh(e), s = bh(t), a = 0; a < i.length; ++a) {
            var l = i[a];
            if (!g8[l] && !(n && n[l]) && !(s && s[l]) && !(o && o[l])) {
                var u = x8(t, l);
                try {
                    w8(e, l, u)
                } catch {}
            }
        }
    }
    return e
}
var k8 = Bm;

function Et() {
    return (Et = Object.assign || function(e) {
        for (var t = 1; t < arguments.length; t++) {
            var n = arguments[t];
            for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (e[r] = n[r])
        }
        return e
    }).apply(this, arguments)
}
var _h = function(e, t) {
        for (var n = [e[0]], r = 0, i = t.length; r < i; r += 1) n.push(t[r], e[r + 1]);
        return n
    },
    Ou = function(e) {
        return e !== null && typeof e == "object" && (e.toString ? e.toString() : Object.prototype.toString.call(e)) === "[object Object]" && !Ts.typeOf(e)
    },
    Rs = Object.freeze([]),
    gn = Object.freeze({});

function Dr(e) {
    return typeof e == "function"
}

function Ih(e) {
    return e.displayName || e.name || "Component"
}

function hf(e) {
    return e && typeof e.styledComponentId == "string"
}
var Vr = typeof process < "u" && ({}.REACT_APP_SC_ATTR || {}.SC_ATTR) || "data-styled",
    pf = typeof window < "u" && "HTMLElement" in window,
    E8 = Boolean(typeof SC_DISABLE_SPEEDY == "boolean" ? SC_DISABLE_SPEEDY : typeof process < "u" && {}.REACT_APP_SC_DISABLE_SPEEDY !== void 0 && {}.REACT_APP_SC_DISABLE_SPEEDY !== "" ? {}.REACT_APP_SC_DISABLE_SPEEDY !== "false" && {}.REACT_APP_SC_DISABLE_SPEEDY : typeof process < "u" && {}.SC_DISABLE_SPEEDY !== void 0 && {}.SC_DISABLE_SPEEDY !== "" ? {}.SC_DISABLE_SPEEDY !== "false" && {}.SC_DISABLE_SPEEDY : !1),
    T8 = {};

function Qn(e) {
    for (var t = arguments.length, n = new Array(t > 1 ? t - 1 : 0), r = 1; r < t; r++) n[r - 1] = arguments[r];
    throw new Error("An error occurred. See https://git.io/JUIaE#" + e + " for more information." + (n.length > 0 ? " Args: " + n.join(", ") : ""))
}
var R8 = function() {
        function e(n) {
            this.groupSizes = new Uint32Array(512), this.length = 512, this.tag = n
        }
        var t = e.prototype;
        return t.indexOfGroup = function(n) {
            for (var r = 0, i = 0; i < n; i++) r += this.groupSizes[i];
            return r
        }, t.insertRules = function(n, r) {
            if (n >= this.groupSizes.length) {
                for (var i = this.groupSizes, o = i.length, s = o; n >= s;)(s <<= 1) < 0 && Qn(16, "" + n);
                this.groupSizes = new Uint32Array(s), this.groupSizes.set(i), this.length = s;
                for (var a = o; a < s; a++) this.groupSizes[a] = 0
            }
            for (var l = this.indexOfGroup(n + 1), u = 0, c = r.length; u < c; u++) this.tag.insertRule(l, r[u]) && (this.groupSizes[n]++, l++)
        }, t.clearGroup = function(n) {
            if (n < this.length) {
                var r = this.groupSizes[n],
                    i = this.indexOfGroup(n),
                    o = i + r;
                this.groupSizes[n] = 0;
                for (var s = i; s < o; s++) this.tag.deleteRule(i)
            }
        }, t.getGroup = function(n) {
            var r = "";
            if (n >= this.length || this.groupSizes[n] === 0) return r;
            for (var i = this.groupSizes[n], o = this.indexOfGroup(n), s = o + i, a = o; a < s; a++) r += this.tag.getRule(a) + `/*!sc*/
`;
            return r
        }, e
    }(),
    Bo = new Map,
    As = new Map,
    Ci = 1,
    ko = function(e) {
        if (Bo.has(e)) return Bo.get(e);
        for (; As.has(Ci);) Ci++;
        var t = Ci++;
        return Bo.set(e, t), As.set(t, e), t
    },
    A8 = function(e) {
        return As.get(e)
    },
    M8 = function(e, t) {
        t >= Ci && (Ci = t + 1), Bo.set(e, t), As.set(t, e)
    },
    O8 = "style[" + Vr + '][data-styled-version="5.3.6"]',
    F8 = new RegExp("^" + Vr + '\\.g(\\d+)\\[id="([\\w\\d-]+)"\\].*?"([^"]*)'),
    L8 = function(e, t, n) {
        for (var r, i = n.split(","), o = 0, s = i.length; o < s; o++)(r = i[o]) && e.registerName(t, r)
    },
    b8 = function(e, t) {
        for (var n = (t.textContent || "").split(`/*!sc*/
`), r = [], i = 0, o = n.length; i < o; i++) {
            var s = n[i].trim();
            if (s) {
                var a = s.match(F8);
                if (a) {
                    var l = 0 | parseInt(a[1], 10),
                        u = a[2];
                    l !== 0 && (M8(u, l), L8(e, u, a[3]), e.getTag().insertRules(l, r)), r.length = 0
                } else r.push(s)
            }
        }
    },
    D8 = function() {
        return typeof __webpack_nonce__ < "u" ? __webpack_nonce__ : null
    },
    Um = function(e) {
        var t = document.head,
            n = e || t,
            r = document.createElement("style"),
            i = function(a) {
                for (var l = a.childNodes, u = l.length; u >= 0; u--) {
                    var c = l[u];
                    if (c && c.nodeType === 1 && c.hasAttribute(Vr)) return c
                }
            }(n),
            o = i !== void 0 ? i.nextSibling : null;
        r.setAttribute(Vr, "active"), r.setAttribute("data-styled-version", "5.3.6");
        var s = D8();
        return s && r.setAttribute("nonce", s), n.insertBefore(r, o), r
    },
    V8 = function() {
        function e(n) {
            var r = this.element = Um(n);
            r.appendChild(document.createTextNode("")), this.sheet = function(i) {
                if (i.sheet) return i.sheet;
                for (var o = document.styleSheets, s = 0, a = o.length; s < a; s++) {
                    var l = o[s];
                    if (l.ownerNode === i) return l
                }
                Qn(17)
            }(r), this.length = 0
        }
        var t = e.prototype;
        return t.insertRule = function(n, r) {
            try {
                return this.sheet.insertRule(r, n), this.length++, !0
            } catch {
                return !1
            }
        }, t.deleteRule = function(n) {
            this.sheet.deleteRule(n), this.length--
        }, t.getRule = function(n) {
            var r = this.sheet.cssRules[n];
            return r !== void 0 && typeof r.cssText == "string" ? r.cssText : ""
        }, e
    }(),
    _8 = function() {
        function e(n) {
            var r = this.element = Um(n);
            this.nodes = r.childNodes, this.length = 0
        }
        var t = e.prototype;
        return t.insertRule = function(n, r) {
            if (n <= this.length && n >= 0) {
                var i = document.createTextNode(r),
                    o = this.nodes[n];
                return this.element.insertBefore(i, o || null), this.length++, !0
            }
            return !1
        }, t.deleteRule = function(n) {
            this.element.removeChild(this.nodes[n]), this.length--
        }, t.getRule = function(n) {
            return n < this.length ? this.nodes[n].textContent : ""
        }, e
    }(),
    I8 = function() {
        function e(n) {
            this.rules = [], this.length = 0
        }
        var t = e.prototype;
        return t.insertRule = function(n, r) {
            return n <= this.length && (this.rules.splice(n, 0, r), this.length++, !0)
        }, t.deleteRule = function(n) {
            this.rules.splice(n, 1), this.length--
        }, t.getRule = function(n) {
            return n < this.length ? this.rules[n] : ""
        }, e
    }(),
    $h = pf,
    $8 = {
        isServer: !pf,
        useCSSOMInjection: !E8
    },
    Ms = function() {
        function e(n, r, i) {
            n === void 0 && (n = gn), r === void 0 && (r = {}), this.options = Et({}, $8, {}, n), this.gs = r, this.names = new Map(i), this.server = !!n.isServer, !this.server && pf && $h && ($h = !1, function(o) {
                for (var s = document.querySelectorAll(O8), a = 0, l = s.length; a < l; a++) {
                    var u = s[a];
                    u && u.getAttribute(Vr) !== "active" && (b8(o, u), u.parentNode && u.parentNode.removeChild(u))
                }
            }(this))
        }
        e.registerId = function(n) {
            return ko(n)
        };
        var t = e.prototype;
        return t.reconstructWithOptions = function(n, r) {
            return r === void 0 && (r = !0), new e(Et({}, this.options, {}, n), this.gs, r && this.names || void 0)
        }, t.allocateGSInstance = function(n) {
            return this.gs[n] = (this.gs[n] || 0) + 1
        }, t.getTag = function() {
            return this.tag || (this.tag = (i = (r = this.options).isServer, o = r.useCSSOMInjection, s = r.target, n = i ? new I8(s) : o ? new V8(s) : new _8(s), new R8(n)));
            var n, r, i, o, s
        }, t.hasNameForId = function(n, r) {
            return this.names.has(n) && this.names.get(n).has(r)
        }, t.registerName = function(n, r) {
            if (ko(n), this.names.has(n)) this.names.get(n).add(r);
            else {
                var i = new Set;
                i.add(r), this.names.set(n, i)
            }
        }, t.insertRules = function(n, r, i) {
            this.registerName(n, r), this.getTag().insertRules(ko(n), i)
        }, t.clearNames = function(n) {
            this.names.has(n) && this.names.get(n).clear()
        }, t.clearRules = function(n) {
            this.getTag().clearGroup(ko(n)), this.clearNames(n)
        }, t.clearTag = function() {
            this.tag = void 0
        }, t.toString = function() {
            return function(n) {
                for (var r = n.getTag(), i = r.length, o = "", s = 0; s < i; s++) {
                    var a = A8(s);
                    if (a !== void 0) {
                        var l = n.names.get(a),
                            u = r.getGroup(s);
                        if (l && u && l.size) {
                            var c = Vr + ".g" + s + '[id="' + a + '"]',
                                f = "";
                            l !== void 0 && l.forEach(function(d) {
                                d.length > 0 && (f += d + ",")
                            }), o += "" + u + c + '{content:"' + f + `"}/*!sc*/
`
                        }
                    }
                }
                return o
            }(this)
        }, e
    }(),
    N8 = /(a)(d)/gi,
    Nh = function(e) {
        return String.fromCharCode(e + (e > 25 ? 39 : 97))
    };

function Fu(e) {
    var t, n = "";
    for (t = Math.abs(e); t > 52; t = t / 52 | 0) n = Nh(t % 52) + n;
    return (Nh(t % 52) + n).replace(N8, "$1-$2")
}
var yr = function(e, t) {
        for (var n = t.length; n;) e = 33 * e ^ t.charCodeAt(--n);
        return e
    },
    Qm = function(e) {
        return yr(5381, e)
    };

function Hm(e) {
    for (var t = 0; t < e.length; t += 1) {
        var n = e[t];
        if (Dr(n) && !hf(n)) return !1
    }
    return !0
}
var j8 = Qm("5.3.6"),
    z8 = function() {
        function e(t, n, r) {
            this.rules = t, this.staticRulesId = "", this.isStatic = (r === void 0 || r.isStatic) && Hm(t), this.componentId = n, this.baseHash = yr(j8, n), this.baseStyle = r, Ms.registerId(n)
        }
        return e.prototype.generateAndInjectStyles = function(t, n, r) {
            var i = this.componentId,
                o = [];
            if (this.baseStyle && o.push(this.baseStyle.generateAndInjectStyles(t, n, r)), this.isStatic && !r.hash)
                if (this.staticRulesId && n.hasNameForId(i, this.staticRulesId)) o.push(this.staticRulesId);
                else {
                    var s = Hn(this.rules, t, n, r).join(""),
                        a = Fu(yr(this.baseHash, s) >>> 0);
                    if (!n.hasNameForId(i, a)) {
                        var l = r(s, "." + a, void 0, i);
                        n.insertRules(i, a, l)
                    }
                    o.push(a), this.staticRulesId = a
                }
            else {
                for (var u = this.rules.length, c = yr(this.baseHash, r.hash), f = "", d = 0; d < u; d++) {
                    var p = this.rules[d];
                    if (typeof p == "string") f += p;
                    else if (p) {
                        var y = Hn(p, t, n, r),
                            g = Array.isArray(y) ? y.join("") : y;
                        c = yr(c, g + d), f += g
                    }
                }
                if (f) {
                    var x = Fu(c >>> 0);
                    if (!n.hasNameForId(i, x)) {
                        var v = r(f, "." + x, void 0, i);
                        n.insertRules(i, x, v)
                    }
                    o.push(x)
                }
            }
            return o.join(" ")
        }, e
    }(),
    B8 = /^\s*\/\/.*$/gm,
    U8 = [":", "[", ".", "#"];

function Q8(e) {
    var t, n, r, i, o = e === void 0 ? gn : e,
        s = o.options,
        a = s === void 0 ? gn : s,
        l = o.plugins,
        u = l === void 0 ? Rs : l,
        c = new a8(a),
        f = [],
        d = function(g) {
            function x(v) {
                if (v) try {
                    g(v + "}")
                } catch {}
            }
            return function(v, h, m, C, S, k, T, E, _, D) {
                switch (v) {
                    case 1:
                        if (_ === 0 && h.charCodeAt(0) === 64) return g(h + ";"), "";
                        break;
                    case 2:
                        if (E === 0) return h + "/*|*/";
                        break;
                    case 3:
                        switch (E) {
                            case 102:
                            case 112:
                                return g(m[0] + h), "";
                            default:
                                return h + (D === 0 ? "/*|*/" : "")
                        }
                    case -2:
                        h.split("/*|*/}").forEach(x)
                }
            }
        }(function(g) {
            f.push(g)
        }),
        p = function(g, x, v) {
            return x === 0 && U8.indexOf(v[n.length]) !== -1 || v.match(i) ? g : "." + t
        };

    function y(g, x, v, h) {
        h === void 0 && (h = "&");
        var m = g.replace(B8, ""),
            C = x && v ? v + " " + x + " { " + m + " }" : m;
        return t = h, n = x, r = new RegExp("\\" + n + "\\b", "g"), i = new RegExp("(\\" + n + "\\b){2,}"), c(v || !x ? "" : x, C)
    }
    return c.use([].concat(u, [function(g, x, v) {
        g === 2 && v.length && v[0].lastIndexOf(n) > 0 && (v[0] = v[0].replace(r, p))
    }, d, function(g) {
        if (g === -2) {
            var x = f;
            return f = [], x
        }
    }])), y.hash = u.length ? u.reduce(function(g, x) {
        return x.name || Qn(15), yr(g, x.name)
    }, 5381).toString() : "", y
}
var Wm = ce.createContext();
Wm.Consumer;
var Km = ce.createContext(),
    H8 = (Km.Consumer, new Ms),
    Lu = Q8();

function qm() {
    return P.useContext(Wm) || H8
}

function Gm() {
    return P.useContext(Km) || Lu
}
var W8 = function() {
        function e(t, n) {
            var r = this;
            this.inject = function(i, o) {
                o === void 0 && (o = Lu);
                var s = r.name + o.hash;
                i.hasNameForId(r.id, s) || i.insertRules(r.id, s, o(r.rules, s, "@keyframes"))
            }, this.toString = function() {
                return Qn(12, String(r.name))
            }, this.name = t, this.id = "sc-keyframes-" + t, this.rules = n
        }
        return e.prototype.getName = function(t) {
            return t === void 0 && (t = Lu), this.name + t.hash
        }, e
    }(),
    K8 = /([A-Z])/,
    q8 = /([A-Z])/g,
    G8 = /^ms-/,
    Z8 = function(e) {
        return "-" + e.toLowerCase()
    };

function jh(e) {
    return K8.test(e) ? e.replace(q8, Z8).replace(G8, "-ms-") : e
}
var zh = function(e) {
    return e == null || e === !1 || e === ""
};

function Hn(e, t, n, r) {
    if (Array.isArray(e)) {
        for (var i, o = [], s = 0, a = e.length; s < a; s += 1)(i = Hn(e[s], t, n, r)) !== "" && (Array.isArray(i) ? o.push.apply(o, i) : o.push(i));
        return o
    }
    if (zh(e)) return "";
    if (hf(e)) return "." + e.styledComponentId;
    if (Dr(e)) {
        if (typeof(u = e) != "function" || u.prototype && u.prototype.isReactComponent || !t) return e;
        var l = e(t);
        return Hn(l, t, n, r)
    }
    var u;
    return e instanceof W8 ? n ? (e.inject(n, r), e.getName(r)) : e : Ou(e) ? function c(f, d) {
        var p, y, g = [];
        for (var x in f) f.hasOwnProperty(x) && !zh(f[x]) && (Array.isArray(f[x]) && f[x].isCss || Dr(f[x]) ? g.push(jh(x) + ":", f[x], ";") : Ou(f[x]) ? g.push.apply(g, c(f[x], x)) : g.push(jh(x) + ": " + (p = x, (y = f[x]) == null || typeof y == "boolean" || y === "" ? "" : typeof y != "number" || y === 0 || p in l8 ? String(y).trim() : y + "px") + ";"));
        return d ? [d + " {"].concat(g, ["}"]) : g
    }(e) : e.toString()
}
var Bh = function(e) {
    return Array.isArray(e) && (e.isCss = !0), e
};

function Xi(e) {
    for (var t = arguments.length, n = new Array(t > 1 ? t - 1 : 0), r = 1; r < t; r++) n[r - 1] = arguments[r];
    return Dr(e) || Ou(e) ? Bh(Hn(_h(Rs, [e].concat(n)))) : n.length === 0 && e.length === 1 && typeof e[0] == "string" ? e : Bh(Hn(_h(e, n)))
}
var Zm = function(e, t, n) {
        return n === void 0 && (n = gn), e.theme !== n.theme && e.theme || t || n.theme
    },
    Y8 = /[!"#$%&'()*+,./:;<=>?@[\\\]^`{|}~-]+/g,
    X8 = /(^-|-$)/g;

function yl(e) {
    return e.replace(Y8, "-").replace(X8, "")
}
var Ym = function(e) {
    return Fu(Qm(e) >>> 0)
};

function Eo(e) {
    return typeof e == "string" && !0
}
var bu = function(e) {
        return typeof e == "function" || typeof e == "object" && e !== null && !Array.isArray(e)
    },
    J8 = function(e) {
        return e !== "__proto__" && e !== "constructor" && e !== "prototype"
    };

function e6(e, t, n) {
    var r = e[n];
    bu(t) && bu(r) ? Xm(r, t) : e[n] = t
}

function Xm(e) {
    for (var t = arguments.length, n = new Array(t > 1 ? t - 1 : 0), r = 1; r < t; r++) n[r - 1] = arguments[r];
    for (var i = 0, o = n; i < o.length; i++) {
        var s = o[i];
        if (bu(s))
            for (var a in s) J8(a) && e6(e, s[a], a)
    }
    return e
}
var _r = ce.createContext();
_r.Consumer;

function t6(e) {
    var t = P.useContext(_r),
        n = P.useMemo(function() {
            return function(r, i) {
                if (!r) return Qn(14);
                if (Dr(r)) {
                    var o = r(i);
                    return o
                }
                return Array.isArray(r) || typeof r != "object" ? Qn(8) : i ? Et({}, i, {}, r) : r
            }(e.theme, t)
        }, [e.theme, t]);
    return e.children ? ce.createElement(_r.Provider, {
        value: n
    }, e.children) : null
}
var vl = {};

function Jm(e, t, n) {
    var r = hf(e),
        i = !Eo(e),
        o = t.attrs,
        s = o === void 0 ? Rs : o,
        a = t.componentId,
        l = a === void 0 ? function(h, m) {
            var C = typeof h != "string" ? "sc" : yl(h);
            vl[C] = (vl[C] || 0) + 1;
            var S = C + "-" + Ym("5.3.6" + C + vl[C]);
            return m ? m + "-" + S : S
        }(t.displayName, t.parentComponentId) : a,
        u = t.displayName,
        c = u === void 0 ? function(h) {
            return Eo(h) ? "styled." + h : "Styled(" + Ih(h) + ")"
        }(e) : u,
        f = t.displayName && t.componentId ? yl(t.displayName) + "-" + t.componentId : t.componentId || l,
        d = r && e.attrs ? Array.prototype.concat(e.attrs, s).filter(Boolean) : s,
        p = t.shouldForwardProp;
    r && e.shouldForwardProp && (p = t.shouldForwardProp ? function(h, m, C) {
        return e.shouldForwardProp(h, m, C) && t.shouldForwardProp(h, m, C)
    } : e.shouldForwardProp);
    var y, g = new z8(n, f, r ? e.componentStyle : void 0),
        x = g.isStatic && s.length === 0,
        v = function(h, m) {
            return function(C, S, k, T) {
                var E = C.attrs,
                    _ = C.componentStyle,
                    D = C.defaultProps,
                    ee = C.foldedComponentIds,
                    Z = C.shouldForwardProp,
                    J = C.styledComponentId,
                    H = C.target,
                    Q = function(z, w, K) {
                        z === void 0 && (z = gn);
                        var F = Et({}, w, {
                                theme: z
                            }),
                            fe = {};
                        return K.forEach(function(X) {
                            var G, B, Te, Ye = X;
                            for (G in Dr(Ye) && (Ye = Ye(F)), Ye) F[G] = fe[G] = G === "className" ? (B = fe[G], Te = Ye[G], B && Te ? B + " " + Te : B || Te) : Ye[G]
                        }), [F, fe]
                    }(Zm(S, P.useContext(_r), D) || gn, S, E),
                    ie = Q[0],
                    ue = Q[1],
                    A = function(z, w, K, F) {
                        var fe = qm(),
                            X = Gm(),
                            G = w ? z.generateAndInjectStyles(gn, fe, X) : z.generateAndInjectStyles(K, fe, X);
                        return G
                    }(_, T, ie),
                    I = k,
                    N = ue.$as || S.$as || ue.as || S.as || H,
                    $ = Eo(N),
                    M = ue !== S ? Et({}, S, {}, ue) : S,
                    L = {};
                for (var b in M) b[0] !== "$" && b !== "as" && (b === "forwardedAs" ? L.as = M[b] : (Z ? Z(b, Lh, N) : !$ || Lh(b)) && (L[b] = M[b]));
                return S.style && ue.style !== S.style && (L.style = Et({}, S.style, {}, ue.style)), L.className = Array.prototype.concat(ee, J, A !== J ? A : null, S.className, ue.className).filter(Boolean).join(" "), L.ref = I, P.createElement(N, L)
            }(y, h, m, x)
        };
    return v.displayName = c, (y = ce.forwardRef(v)).attrs = d, y.componentStyle = g, y.displayName = c, y.shouldForwardProp = p, y.foldedComponentIds = r ? Array.prototype.concat(e.foldedComponentIds, e.styledComponentId) : Rs, y.styledComponentId = f, y.target = r ? e.target : e, y.withComponent = function(h) {
        var m = t.componentId,
            C = function(k, T) {
                if (k == null) return {};
                var E, _, D = {},
                    ee = Object.keys(k);
                for (_ = 0; _ < ee.length; _++) E = ee[_], T.indexOf(E) >= 0 || (D[E] = k[E]);
                return D
            }(t, ["componentId"]),
            S = m && m + "-" + (Eo(h) ? h : yl(Ih(h)));
        return Jm(h, Et({}, C, {
            attrs: d,
            componentId: S
        }), n)
    }, Object.defineProperty(y, "defaultProps", {
        get: function() {
            return this._foldedDefaultProps
        },
        set: function(h) {
            this._foldedDefaultProps = r ? Xm({}, e.defaultProps, h) : h
        }
    }), y.toString = function() {
        return "." + y.styledComponentId
    }, i && k8(y, e, {
        attrs: !0,
        componentStyle: !0,
        displayName: !0,
        foldedComponentIds: !0,
        shouldForwardProp: !0,
        styledComponentId: !0,
        target: !0,
        withComponent: !0
    }), y
}
var Du = function(e) {
    return function t(n, r, i) {
        if (i === void 0 && (i = gn), !Ts.isValidElementType(r)) return Qn(1, String(r));
        var o = function() {
            return n(r, i, Xi.apply(void 0, arguments))
        };
        return o.withConfig = function(s) {
            return t(n, r, Et({}, i, {}, s))
        }, o.attrs = function(s) {
            return t(n, r, Et({}, i, {
                attrs: Array.prototype.concat(i.attrs, s).filter(Boolean)
            }))
        }, o
    }(Jm, e)
};
["a", "abbr", "address", "area", "article", "aside", "audio", "b", "base", "bdi", "bdo", "big", "blockquote", "body", "br", "button", "canvas", "caption", "cite", "code", "col", "colgroup", "data", "datalist", "dd", "del", "details", "dfn", "dialog", "div", "dl", "dt", "em", "embed", "fieldset", "figcaption", "figure", "footer", "form", "h1", "h2", "h3", "h4", "h5", "h6", "head", "header", "hgroup", "hr", "html", "i", "iframe", "img", "input", "ins", "kbd", "keygen", "label", "legend", "li", "link", "main", "map", "mark", "marquee", "menu", "menuitem", "meta", "meter", "nav", "noscript", "object", "ol", "optgroup", "option", "output", "p", "param", "picture", "pre", "progress", "q", "rp", "rt", "ruby", "s", "samp", "script", "section", "select", "small", "source", "span", "strong", "style", "sub", "summary", "sup", "table", "tbody", "td", "textarea", "tfoot", "th", "thead", "time", "title", "tr", "track", "u", "ul", "var", "video", "wbr", "circle", "clipPath", "defs", "ellipse", "foreignObject", "g", "image", "line", "linearGradient", "marker", "mask", "path", "pattern", "polygon", "polyline", "radialGradient", "rect", "stop", "svg", "text", "textPath", "tspan"].forEach(function(e) {
    Du[e] = Du(e)
});
var n6 = function() {
    function e(n, r) {
        this.rules = n, this.componentId = r, this.isStatic = Hm(n), Ms.registerId(this.componentId + 1)
    }
    var t = e.prototype;
    return t.createStyles = function(n, r, i, o) {
        var s = o(Hn(this.rules, r, i, o).join(""), ""),
            a = this.componentId + n;
        i.insertRules(a, a, s)
    }, t.removeStyles = function(n, r) {
        r.clearRules(this.componentId + n)
    }, t.renderStyles = function(n, r, i, o) {
        n > 2 && Ms.registerId(this.componentId + n), this.removeStyles(n, i), this.createStyles(n, r, i, o)
    }, e
}();

function r6(e) {
    for (var t = arguments.length, n = new Array(t > 1 ? t - 1 : 0), r = 1; r < t; r++) n[r - 1] = arguments[r];
    var i = Xi.apply(void 0, [e].concat(n)),
        o = "sc-global-" + Ym(JSON.stringify(i)),
        s = new n6(i, o);

    function a(u) {
        var c = qm(),
            f = Gm(),
            d = P.useContext(_r),
            p = P.useRef(c.allocateGSInstance(o)).current;
        return c.server && l(p, u, c, d, f), P.useLayoutEffect(function() {
            if (!c.server) return l(p, u, c, d, f),
                function() {
                    return s.removeStyles(p, c)
                }
        }, [p, u, c, d, f]), null
    }

    function l(u, c, f, d, p) {
        if (s.isStatic) s.renderStyles(u, T8, f, p);
        else {
            var y = Et({}, c, {
                theme: Zm(c, d, a.defaultProps)
            });
            s.renderStyles(u, y, f, p)
        }
    }
    return ce.memo(a)
}
var i6 = function() {
    return P.useContext(_r)
};
const q = Du,
    o6 = q(of.div)`
    width: 100vw;
    height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background: rgba(0, 0, 0, 0.75);
`,
    s6 = q.main`
    padding: 2rem;
    border-radius: 2rem;
    background: #111;
    display: flex;
    flex-direction: column;
    align-items: center;
`,
    a6 = q.div`
    width: 90%;
    height: 0.1rem;
    background: #292929;
    margin: 3rem 0;
`,
    l6 = q.section`
    width: 100%;
    height: 35.3rem;
    display: grid;
    grid-template-columns: repeat(auto-fit, 16.3rem);
    gap: 1rem;
    overflow-y: scroll;
    padding: .2rem;
    align-content: flex-start;
`,
    u6 = () => !window.invokeNative,
    c6 = () => {},
    f6 = (e, t) => {
        const n = P.useRef(c6);
        P.useEffect(() => {
            n.current = t
        }, [t]), P.useEffect(() => {
            const r = i => {
                const {
                    action: o,
                    data: s
                } = i.data;
                n.current && o === e && n.current(s)
            };
            return window.addEventListener("message", r), () => window.removeEventListener("message", r)
        }, [e])
    },
    Uh = e => {
        let t;
        const n = new Set,
            r = (c, f) => {
                const d = typeof c == "function" ? c(t) : c;
                if (!Object.is(d, t)) {
                    const p = t;
                    t = f ?? (typeof d != "object" || d === null) ? d : Object.assign({}, t, d), n.forEach(y => y(t, p))
                }
            },
            i = () => t,
            l = {
                setState: r,
                getState: i,
                getInitialState: () => u,
                subscribe: c => (n.add(c), () => n.delete(c)),
                destroy: () => {
                    n.clear()
                }
            },
            u = t = e(r, i, l);
        return l
    },
    d6 = e => e ? Uh(e) : Uh;
var Vu = {},
    h6 = {
        get exports() {
            return Vu
        },
        set exports(e) {
            Vu = e
        }
    },
    e2 = {},
    _u = {},
    p6 = {
        get exports() {
            return _u
        },
        set exports(e) {
            _u = e
        }
    },
    t2 = {};
/**
 * @license React
 * use-sync-external-store-shim.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
var Ir = P;

function m6(e, t) {
    return e === t && (e !== 0 || 1 / e === 1 / t) || e !== e && t !== t
}
var y6 = typeof Object.is == "function" ? Object.is : m6,
    v6 = Ir.useState,
    g6 = Ir.useEffect,
    C6 = Ir.useLayoutEffect,
    w6 = Ir.useDebugValue;

function S6(e, t) {
    var n = t(),
        r = v6({
            inst: {
                value: n,
                getSnapshot: t
            }
        }),
        i = r[0].inst,
        o = r[1];
    return C6(function() {
        i.value = n, i.getSnapshot = t, gl(i) && o({
            inst: i
        })
    }, [e, n, t]), g6(function() {
        return gl(i) && o({
            inst: i
        }), e(function() {
            gl(i) && o({
                inst: i
            })
        })
    }, [e]), w6(n), n
}

function gl(e) {
    var t = e.getSnapshot;
    e = e.value;
    try {
        var n = t();
        return !y6(e, n)
    } catch {
        return !0
    }
}

function x6(e, t) {
    return t()
}
var P6 = typeof window > "u" || typeof window.document > "u" || typeof window.document.createElement > "u" ? x6 : S6;
t2.useSyncExternalStore = Ir.useSyncExternalStore !== void 0 ? Ir.useSyncExternalStore : P6;
(function(e) {
    e.exports = t2
})(p6);
/**
 * @license React
 * use-sync-external-store-shim/with-selector.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
var Ra = P,
    k6 = _u;

function E6(e, t) {
    return e === t && (e !== 0 || 1 / e === 1 / t) || e !== e && t !== t
}
var T6 = typeof Object.is == "function" ? Object.is : E6,
    R6 = k6.useSyncExternalStore,
    A6 = Ra.useRef,
    M6 = Ra.useEffect,
    O6 = Ra.useMemo,
    F6 = Ra.useDebugValue;
e2.useSyncExternalStoreWithSelector = function(e, t, n, r, i) {
    var o = A6(null);
    if (o.current === null) {
        var s = {
            hasValue: !1,
            value: null
        };
        o.current = s
    } else s = o.current;
    o = O6(function() {
        function l(p) {
            if (!u) {
                if (u = !0, c = p, p = r(p), i !== void 0 && s.hasValue) {
                    var y = s.value;
                    if (i(y, p)) return f = y
                }
                return f = p
            }
            if (y = f, T6(c, p)) return y;
            var g = r(p);
            return i !== void 0 && i(y, g) ? y : (c = p, f = g)
        }
        var u = !1,
            c, f, d = n === void 0 ? null : n;
        return [function() {
            return l(t())
        }, d === null ? void 0 : function() {
            return l(d())
        }]
    }, [t, n, r, i]);
    var a = R6(e, o[0], o[1]);
    return M6(function() {
        s.hasValue = !0, s.value = a
    }, [a]), F6(a), a
};
(function(e) {
    e.exports = e2
})(h6);
const L6 = Bu(Vu),
    {
        useDebugValue: b6
    } = ce,
    {
        useSyncExternalStoreWithSelector: D6
    } = L6;
const V6 = e => e;

function _6(e, t = V6, n) {
    const r = D6(e.subscribe, e.getState, e.getServerState || e.getInitialState, t, n);
    return b6(r), r
}
const Qh = e => {
        const t = typeof e == "function" ? d6(e) : e,
            n = (r, i) => _6(t, r, i);
        return Object.assign(n, t), n
    },
    mf = e => e ? Qh(e) : Qh,
    I6 = mf(e => ({
        isVisible: !1,
        setVisible: t => e({
            isVisible: t
        })
    })),
    kr = async (e, t, n) => {
        const r = {
            method: "post",
            headers: {
                "Content-Type": "application/json; charset=UTF-8"
            },
            body: JSON.stringify(t)
        };
        if (u6() && n) return n;
        const i = window.GetParentResourceName ? window.GetParentResourceName() : "codelab-app";
        return await (await fetch(`https://${i}/${e}`, r)).json()
    }, $6 = {
        acceleration: 0,
        agility: 0,
        braking: 0,
        class: "N/A",
        classType: "N/A",
        estoque: 0,
        maxspeed: 0,
        model: "N/A",
        name: "N/A",
        portamalas: 0,
        preco: 0
    }, Aa = mf(e => ({
        selectedVehicle: $6,
        setSelectedVehicle: t => e({
            selectedVehicle: t
        })
    })), N6 = {
        acceleration: 0,
        agility: 0,
        braking: 0,
        class: "N/A",
        classType: "N/A",
        estoque: 0,
        maxspeed: 0,
        model: "N/A",
        name: "N/A",
        portamalas: 0,
        preco: 0
    }, n2 = () => {
        const {
            isVisible: e,
            setVisible: t
        } = I6(), {
            setSelectedVehicle: n
        } = Aa(i => ({
            setSelectedVehicle: i.setSelectedVehicle
        }));
        f6("setVisible", i => t(i));
        const r = () => {
            t(!1), kr("close"), n(N6)
        };
        return P.useEffect(() => {
            if (!e) return;
            const i = o => {
                ["Escape"].includes(o.code) && r()
            };
            return window.addEventListener("keydown", i), () => window.removeEventListener("keydown", i)
        }, [e]), {
            isVisible: e,
            setVisible: t,
            closeNUI: r
        }
    };

function Bi(e, t) {
    return Bi = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function(r, i) {
        return r.__proto__ = i, r
    }, Bi(e, t)
}

function Zn(e, t) {
    e.prototype = Object.create(t.prototype), e.prototype.constructor = e, Bi(e, t)
}
var zr = function() {
    function e() {
        this.listeners = []
    }
    var t = e.prototype;
    return t.subscribe = function(r) {
        var i = this,
            o = r || function() {};
        return this.listeners.push(o), this.onSubscribe(),
            function() {
                i.listeners = i.listeners.filter(function(s) {
                    return s !== o
                }), i.onUnsubscribe()
            }
    }, t.hasListeners = function() {
        return this.listeners.length > 0
    }, t.onSubscribe = function() {}, t.onUnsubscribe = function() {}, e
}();

function W() {
    return W = Object.assign ? Object.assign.bind() : function(e) {
        for (var t = 1; t < arguments.length; t++) {
            var n = arguments[t];
            for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (e[r] = n[r])
        }
        return e
    }, W.apply(this, arguments)
}
var Os = typeof window > "u";

function $e() {}

function j6(e, t) {
    return typeof e == "function" ? e(t) : e
}

function Iu(e) {
    return typeof e == "number" && e >= 0 && e !== 1 / 0
}

function Fs(e) {
    return Array.isArray(e) ? e : [e]
}

function r2(e, t) {
    return Math.max(e + (t || 0) - Date.now(), 0)
}

function Uo(e, t, n) {
    return Ji(e) ? typeof t == "function" ? W({}, n, {
        queryKey: e,
        queryFn: t
    }) : W({}, t, {
        queryKey: e
    }) : e
}

function z6(e, t, n) {
    return Ji(e) ? typeof t == "function" ? W({}, n, {
        mutationKey: e,
        mutationFn: t
    }) : W({}, t, {
        mutationKey: e
    }) : typeof e == "function" ? W({}, t, {
        mutationFn: e
    }) : W({}, e)
}

function nn(e, t, n) {
    return Ji(e) ? [W({}, t, {
        queryKey: e
    }), n] : [e || {}, t]
}

function B6(e, t) {
    if (e === !0 && t === !0 || e == null && t == null) return "all";
    if (e === !1 && t === !1) return "none";
    var n = e ?? !t;
    return n ? "active" : "inactive"
}

function Hh(e, t) {
    var n = e.active,
        r = e.exact,
        i = e.fetching,
        o = e.inactive,
        s = e.predicate,
        a = e.queryKey,
        l = e.stale;
    if (Ji(a)) {
        if (r) {
            if (t.queryHash !== yf(a, t.options)) return !1
        } else if (!Ls(t.queryKey, a)) return !1
    }
    var u = B6(n, o);
    if (u === "none") return !1;
    if (u !== "all") {
        var c = t.isActive();
        if (u === "active" && !c || u === "inactive" && c) return !1
    }
    return !(typeof l == "boolean" && t.isStale() !== l || typeof i == "boolean" && t.isFetching() !== i || s && !s(t))
}

function Wh(e, t) {
    var n = e.exact,
        r = e.fetching,
        i = e.predicate,
        o = e.mutationKey;
    if (Ji(o)) {
        if (!t.options.mutationKey) return !1;
        if (n) {
            if (_n(t.options.mutationKey) !== _n(o)) return !1
        } else if (!Ls(t.options.mutationKey, o)) return !1
    }
    return !(typeof r == "boolean" && t.state.status === "loading" !== r || i && !i(t))
}

function yf(e, t) {
    var n = (t == null ? void 0 : t.queryKeyHashFn) || _n;
    return n(e)
}

function _n(e) {
    var t = Fs(e);
    return U6(t)
}

function U6(e) {
    return JSON.stringify(e, function(t, n) {
        return $u(n) ? Object.keys(n).sort().reduce(function(r, i) {
            return r[i] = n[i], r
        }, {}) : n
    })
}

function Ls(e, t) {
    return i2(Fs(e), Fs(t))
}

function i2(e, t) {
    return e === t ? !0 : typeof e != typeof t ? !1 : e && t && typeof e == "object" && typeof t == "object" ? !Object.keys(t).some(function(n) {
        return !i2(e[n], t[n])
    }) : !1
}

function bs(e, t) {
    if (e === t) return e;
    var n = Array.isArray(e) && Array.isArray(t);
    if (n || $u(e) && $u(t)) {
        for (var r = n ? e.length : Object.keys(e).length, i = n ? t : Object.keys(t), o = i.length, s = n ? [] : {}, a = 0, l = 0; l < o; l++) {
            var u = n ? l : i[l];
            s[u] = bs(e[u], t[u]), s[u] === e[u] && a++
        }
        return r === o && a === r ? e : s
    }
    return t
}

function Q6(e, t) {
    if (e && !t || t && !e) return !1;
    for (var n in e)
        if (e[n] !== t[n]) return !1;
    return !0
}

function $u(e) {
    if (!Kh(e)) return !1;
    var t = e.constructor;
    if (typeof t > "u") return !0;
    var n = t.prototype;
    return !(!Kh(n) || !n.hasOwnProperty("isPrototypeOf"))
}

function Kh(e) {
    return Object.prototype.toString.call(e) === "[object Object]"
}

function Ji(e) {
    return typeof e == "string" || Array.isArray(e)
}

function H6(e) {
    return new Promise(function(t) {
        setTimeout(t, e)
    })
}

function qh(e) {
    Promise.resolve().then(e).catch(function(t) {
        return setTimeout(function() {
            throw t
        })
    })
}

function o2() {
    if (typeof AbortController == "function") return new AbortController
}
var W6 = function(e) {
        Zn(t, e);

        function t() {
            var r;
            return r = e.call(this) || this, r.setup = function(i) {
                var o;
                if (!Os && ((o = window) != null && o.addEventListener)) {
                    var s = function() {
                        return i()
                    };
                    return window.addEventListener("visibilitychange", s, !1), window.addEventListener("focus", s, !1),
                        function() {
                            window.removeEventListener("visibilitychange", s), window.removeEventListener("focus", s)
                        }
                }
            }, r
        }
        var n = t.prototype;
        return n.onSubscribe = function() {
            this.cleanup || this.setEventListener(this.setup)
        }, n.onUnsubscribe = function() {
            if (!this.hasListeners()) {
                var i;
                (i = this.cleanup) == null || i.call(this), this.cleanup = void 0
            }
        }, n.setEventListener = function(i) {
            var o, s = this;
            this.setup = i, (o = this.cleanup) == null || o.call(this), this.cleanup = i(function(a) {
                typeof a == "boolean" ? s.setFocused(a) : s.onFocus()
            })
        }, n.setFocused = function(i) {
            this.focused = i, i && this.onFocus()
        }, n.onFocus = function() {
            this.listeners.forEach(function(i) {
                i()
            })
        }, n.isFocused = function() {
            return typeof this.focused == "boolean" ? this.focused : typeof document > "u" ? !0 : [void 0, "visible", "prerender"].includes(document.visibilityState)
        }, t
    }(zr),
    wi = new W6,
    K6 = function(e) {
        Zn(t, e);

        function t() {
            var r;
            return r = e.call(this) || this, r.setup = function(i) {
                var o;
                if (!Os && ((o = window) != null && o.addEventListener)) {
                    var s = function() {
                        return i()
                    };
                    return window.addEventListener("online", s, !1), window.addEventListener("offline", s, !1),
                        function() {
                            window.removeEventListener("online", s), window.removeEventListener("offline", s)
                        }
                }
            }, r
        }
        var n = t.prototype;
        return n.onSubscribe = function() {
            this.cleanup || this.setEventListener(this.setup)
        }, n.onUnsubscribe = function() {
            if (!this.hasListeners()) {
                var i;
                (i = this.cleanup) == null || i.call(this), this.cleanup = void 0
            }
        }, n.setEventListener = function(i) {
            var o, s = this;
            this.setup = i, (o = this.cleanup) == null || o.call(this), this.cleanup = i(function(a) {
                typeof a == "boolean" ? s.setOnline(a) : s.onOnline()
            })
        }, n.setOnline = function(i) {
            this.online = i, i && this.onOnline()
        }, n.onOnline = function() {
            this.listeners.forEach(function(i) {
                i()
            })
        }, n.isOnline = function() {
            return typeof this.online == "boolean" ? this.online : typeof navigator > "u" || typeof navigator.onLine > "u" ? !0 : navigator.onLine
        }, t
    }(zr),
    Qo = new K6;

function q6(e) {
    return Math.min(1e3 * Math.pow(2, e), 3e4)
}

function Ds(e) {
    return typeof(e == null ? void 0 : e.cancel) == "function"
}
var s2 = function(t) {
    this.revert = t == null ? void 0 : t.revert, this.silent = t == null ? void 0 : t.silent
};

function Ho(e) {
    return e instanceof s2
}
var a2 = function(t) {
        var n = this,
            r = !1,
            i, o, s, a;
        this.abort = t.abort, this.cancel = function(d) {
            return i == null ? void 0 : i(d)
        }, this.cancelRetry = function() {
            r = !0
        }, this.continueRetry = function() {
            r = !1
        }, this.continue = function() {
            return o == null ? void 0 : o()
        }, this.failureCount = 0, this.isPaused = !1, this.isResolved = !1, this.isTransportCancelable = !1, this.promise = new Promise(function(d, p) {
            s = d, a = p
        });
        var l = function(p) {
                n.isResolved || (n.isResolved = !0, t.onSuccess == null || t.onSuccess(p), o == null || o(), s(p))
            },
            u = function(p) {
                n.isResolved || (n.isResolved = !0, t.onError == null || t.onError(p), o == null || o(), a(p))
            },
            c = function() {
                return new Promise(function(p) {
                    o = p, n.isPaused = !0, t.onPause == null || t.onPause()
                }).then(function() {
                    o = void 0, n.isPaused = !1, t.onContinue == null || t.onContinue()
                })
            },
            f = function d() {
                if (!n.isResolved) {
                    var p;
                    try {
                        p = t.fn()
                    } catch (y) {
                        p = Promise.reject(y)
                    }
                    i = function(g) {
                        if (!n.isResolved && (u(new s2(g)), n.abort == null || n.abort(), Ds(p))) try {
                            p.cancel()
                        } catch {}
                    }, n.isTransportCancelable = Ds(p), Promise.resolve(p).then(l).catch(function(y) {
                        var g, x;
                        if (!n.isResolved) {
                            var v = (g = t.retry) != null ? g : 3,
                                h = (x = t.retryDelay) != null ? x : q6,
                                m = typeof h == "function" ? h(n.failureCount, y) : h,
                                C = v === !0 || typeof v == "number" && n.failureCount < v || typeof v == "function" && v(n.failureCount, y);
                            if (r || !C) {
                                u(y);
                                return
                            }
                            n.failureCount++, t.onFail == null || t.onFail(n.failureCount, y), H6(m).then(function() {
                                if (!wi.isFocused() || !Qo.isOnline()) return c()
                            }).then(function() {
                                r ? u(y) : d()
                            })
                        }
                    })
                }
            };
        f()
    },
    G6 = function() {
        function e() {
            this.queue = [], this.transactions = 0, this.notifyFn = function(n) {
                n()
            }, this.batchNotifyFn = function(n) {
                n()
            }
        }
        var t = e.prototype;
        return t.batch = function(r) {
            var i;
            this.transactions++;
            try {
                i = r()
            } finally {
                this.transactions--, this.transactions || this.flush()
            }
            return i
        }, t.schedule = function(r) {
            var i = this;
            this.transactions ? this.queue.push(r) : qh(function() {
                i.notifyFn(r)
            })
        }, t.batchCalls = function(r) {
            var i = this;
            return function() {
                for (var o = arguments.length, s = new Array(o), a = 0; a < o; a++) s[a] = arguments[a];
                i.schedule(function() {
                    r.apply(void 0, s)
                })
            }
        }, t.flush = function() {
            var r = this,
                i = this.queue;
            this.queue = [], i.length && qh(function() {
                r.batchNotifyFn(function() {
                    i.forEach(function(o) {
                        r.notifyFn(o)
                    })
                })
            })
        }, t.setNotifyFunction = function(r) {
            this.notifyFn = r
        }, t.setBatchNotifyFunction = function(r) {
            this.batchNotifyFn = r
        }, e
    }(),
    ye = new G6,
    l2 = console;

function Vs() {
    return l2
}

function Z6(e) {
    l2 = e
}
var Y6 = function() {
        function e(n) {
            this.abortSignalConsumed = !1, this.hadObservers = !1, this.defaultOptions = n.defaultOptions, this.setOptions(n.options), this.observers = [], this.cache = n.cache, this.queryKey = n.queryKey, this.queryHash = n.queryHash, this.initialState = n.state || this.getDefaultState(this.options), this.state = this.initialState, this.meta = n.meta, this.scheduleGc()
        }
        var t = e.prototype;
        return t.setOptions = function(r) {
            var i;
            this.options = W({}, this.defaultOptions, r), this.meta = r == null ? void 0 : r.meta, this.cacheTime = Math.max(this.cacheTime || 0, (i = this.options.cacheTime) != null ? i : 5 * 60 * 1e3)
        }, t.setDefaultOptions = function(r) {
            this.defaultOptions = r
        }, t.scheduleGc = function() {
            var r = this;
            this.clearGcTimeout(), Iu(this.cacheTime) && (this.gcTimeout = setTimeout(function() {
                r.optionalRemove()
            }, this.cacheTime))
        }, t.clearGcTimeout = function() {
            this.gcTimeout && (clearTimeout(this.gcTimeout), this.gcTimeout = void 0)
        }, t.optionalRemove = function() {
            this.observers.length || (this.state.isFetching ? this.hadObservers && this.scheduleGc() : this.cache.remove(this))
        }, t.setData = function(r, i) {
            var o, s, a = this.state.data,
                l = j6(r, a);
            return (o = (s = this.options).isDataEqual) != null && o.call(s, a, l) ? l = a : this.options.structuralSharing !== !1 && (l = bs(a, l)), this.dispatch({
                data: l,
                type: "success",
                dataUpdatedAt: i == null ? void 0 : i.updatedAt
            }), l
        }, t.setState = function(r, i) {
            this.dispatch({
                type: "setState",
                state: r,
                setStateOptions: i
            })
        }, t.cancel = function(r) {
            var i, o = this.promise;
            return (i = this.retryer) == null || i.cancel(r), o ? o.then($e).catch($e) : Promise.resolve()
        }, t.destroy = function() {
            this.clearGcTimeout(), this.cancel({
                silent: !0
            })
        }, t.reset = function() {
            this.destroy(), this.setState(this.initialState)
        }, t.isActive = function() {
            return this.observers.some(function(r) {
                return r.options.enabled !== !1
            })
        }, t.isFetching = function() {
            return this.state.isFetching
        }, t.isStale = function() {
            return this.state.isInvalidated || !this.state.dataUpdatedAt || this.observers.some(function(r) {
                return r.getCurrentResult().isStale
            })
        }, t.isStaleByTime = function(r) {
            return r === void 0 && (r = 0), this.state.isInvalidated || !this.state.dataUpdatedAt || !r2(this.state.dataUpdatedAt, r)
        }, t.onFocus = function() {
            var r, i = this.observers.find(function(o) {
                return o.shouldFetchOnWindowFocus()
            });
            i && i.refetch(), (r = this.retryer) == null || r.continue()
        }, t.onOnline = function() {
            var r, i = this.observers.find(function(o) {
                return o.shouldFetchOnReconnect()
            });
            i && i.refetch(), (r = this.retryer) == null || r.continue()
        }, t.addObserver = function(r) {
            this.observers.indexOf(r) === -1 && (this.observers.push(r), this.hadObservers = !0, this.clearGcTimeout(), this.cache.notify({
                type: "observerAdded",
                query: this,
                observer: r
            }))
        }, t.removeObserver = function(r) {
            this.observers.indexOf(r) !== -1 && (this.observers = this.observers.filter(function(i) {
                return i !== r
            }), this.observers.length || (this.retryer && (this.retryer.isTransportCancelable || this.abortSignalConsumed ? this.retryer.cancel({
                revert: !0
            }) : this.retryer.cancelRetry()), this.cacheTime ? this.scheduleGc() : this.cache.remove(this)), this.cache.notify({
                type: "observerRemoved",
                query: this,
                observer: r
            }))
        }, t.getObserversCount = function() {
            return this.observers.length
        }, t.invalidate = function() {
            this.state.isInvalidated || this.dispatch({
                type: "invalidate"
            })
        }, t.fetch = function(r, i) {
            var o = this,
                s, a, l;
            if (this.state.isFetching) {
                if (this.state.dataUpdatedAt && (i != null && i.cancelRefetch)) this.cancel({
                    silent: !0
                });
                else if (this.promise) {
                    var u;
                    return (u = this.retryer) == null || u.continueRetry(), this.promise
                }
            }
            if (r && this.setOptions(r), !this.options.queryFn) {
                var c = this.observers.find(function(h) {
                    return h.options.queryFn
                });
                c && this.setOptions(c.options)
            }
            var f = Fs(this.queryKey),
                d = o2(),
                p = {
                    queryKey: f,
                    pageParam: void 0,
                    meta: this.meta
                };
            Object.defineProperty(p, "signal", {
                enumerable: !0,
                get: function() {
                    if (d) return o.abortSignalConsumed = !0, d.signal
                }
            });
            var y = function() {
                    return o.options.queryFn ? (o.abortSignalConsumed = !1, o.options.queryFn(p)) : Promise.reject("Missing queryFn")
                },
                g = {
                    fetchOptions: i,
                    options: this.options,
                    queryKey: f,
                    state: this.state,
                    fetchFn: y,
                    meta: this.meta
                };
            if ((s = this.options.behavior) != null && s.onFetch) {
                var x;
                (x = this.options.behavior) == null || x.onFetch(g)
            }
            if (this.revertState = this.state, !this.state.isFetching || this.state.fetchMeta !== ((a = g.fetchOptions) == null ? void 0 : a.meta)) {
                var v;
                this.dispatch({
                    type: "fetch",
                    meta: (v = g.fetchOptions) == null ? void 0 : v.meta
                })
            }
            return this.retryer = new a2({
                fn: g.fetchFn,
                abort: d == null || (l = d.abort) == null ? void 0 : l.bind(d),
                onSuccess: function(m) {
                    o.setData(m), o.cache.config.onSuccess == null || o.cache.config.onSuccess(m, o), o.cacheTime === 0 && o.optionalRemove()
                },
                onError: function(m) {
                    Ho(m) && m.silent || o.dispatch({
                        type: "error",
                        error: m
                    }), Ho(m) || (o.cache.config.onError == null || o.cache.config.onError(m, o), Vs().error(m)), o.cacheTime === 0 && o.optionalRemove()
                },
                onFail: function() {
                    o.dispatch({
                        type: "failed"
                    })
                },
                onPause: function() {
                    o.dispatch({
                        type: "pause"
                    })
                },
                onContinue: function() {
                    o.dispatch({
                        type: "continue"
                    })
                },
                retry: g.options.retry,
                retryDelay: g.options.retryDelay
            }), this.promise = this.retryer.promise, this.promise
        }, t.dispatch = function(r) {
            var i = this;
            this.state = this.reducer(this.state, r), ye.batch(function() {
                i.observers.forEach(function(o) {
                    o.onQueryUpdate(r)
                }), i.cache.notify({
                    query: i,
                    type: "queryUpdated",
                    action: r
                })
            })
        }, t.getDefaultState = function(r) {
            var i = typeof r.initialData == "function" ? r.initialData() : r.initialData,
                o = typeof r.initialData < "u",
                s = o ? typeof r.initialDataUpdatedAt == "function" ? r.initialDataUpdatedAt() : r.initialDataUpdatedAt : 0,
                a = typeof i < "u";
            return {
                data: i,
                dataUpdateCount: 0,
                dataUpdatedAt: a ? s ?? Date.now() : 0,
                error: null,
                errorUpdateCount: 0,
                errorUpdatedAt: 0,
                fetchFailureCount: 0,
                fetchMeta: null,
                isFetching: !1,
                isInvalidated: !1,
                isPaused: !1,
                status: a ? "success" : "idle"
            }
        }, t.reducer = function(r, i) {
            var o, s;
            switch (i.type) {
                case "failed":
                    return W({}, r, {
                        fetchFailureCount: r.fetchFailureCount + 1
                    });
                case "pause":
                    return W({}, r, {
                        isPaused: !0
                    });
                case "continue":
                    return W({}, r, {
                        isPaused: !1
                    });
                case "fetch":
                    return W({}, r, {
                        fetchFailureCount: 0,
                        fetchMeta: (o = i.meta) != null ? o : null,
                        isFetching: !0,
                        isPaused: !1
                    }, !r.dataUpdatedAt && {
                        error: null,
                        status: "loading"
                    });
                case "success":
                    return W({}, r, {
                        data: i.data,
                        dataUpdateCount: r.dataUpdateCount + 1,
                        dataUpdatedAt: (s = i.dataUpdatedAt) != null ? s : Date.now(),
                        error: null,
                        fetchFailureCount: 0,
                        isFetching: !1,
                        isInvalidated: !1,
                        isPaused: !1,
                        status: "success"
                    });
                case "error":
                    var a = i.error;
                    return Ho(a) && a.revert && this.revertState ? W({}, this.revertState) : W({}, r, {
                        error: a,
                        errorUpdateCount: r.errorUpdateCount + 1,
                        errorUpdatedAt: Date.now(),
                        fetchFailureCount: r.fetchFailureCount + 1,
                        isFetching: !1,
                        isPaused: !1,
                        status: "error"
                    });
                case "invalidate":
                    return W({}, r, {
                        isInvalidated: !0
                    });
                case "setState":
                    return W({}, r, i.state);
                default:
                    return r
            }
        }, e
    }(),
    X6 = function(e) {
        Zn(t, e);

        function t(r) {
            var i;
            return i = e.call(this) || this, i.config = r || {}, i.queries = [], i.queriesMap = {}, i
        }
        var n = t.prototype;
        return n.build = function(i, o, s) {
            var a, l = o.queryKey,
                u = (a = o.queryHash) != null ? a : yf(l, o),
                c = this.get(u);
            return c || (c = new Y6({
                cache: this,
                queryKey: l,
                queryHash: u,
                options: i.defaultQueryOptions(o),
                state: s,
                defaultOptions: i.getQueryDefaults(l),
                meta: o.meta
            }), this.add(c)), c
        }, n.add = function(i) {
            this.queriesMap[i.queryHash] || (this.queriesMap[i.queryHash] = i, this.queries.push(i), this.notify({
                type: "queryAdded",
                query: i
            }))
        }, n.remove = function(i) {
            var o = this.queriesMap[i.queryHash];
            o && (i.destroy(), this.queries = this.queries.filter(function(s) {
                return s !== i
            }), o === i && delete this.queriesMap[i.queryHash], this.notify({
                type: "queryRemoved",
                query: i
            }))
        }, n.clear = function() {
            var i = this;
            ye.batch(function() {
                i.queries.forEach(function(o) {
                    i.remove(o)
                })
            })
        }, n.get = function(i) {
            return this.queriesMap[i]
        }, n.getAll = function() {
            return this.queries
        }, n.find = function(i, o) {
            var s = nn(i, o),
                a = s[0];
            return typeof a.exact > "u" && (a.exact = !0), this.queries.find(function(l) {
                return Hh(a, l)
            })
        }, n.findAll = function(i, o) {
            var s = nn(i, o),
                a = s[0];
            return Object.keys(a).length > 0 ? this.queries.filter(function(l) {
                return Hh(a, l)
            }) : this.queries
        }, n.notify = function(i) {
            var o = this;
            ye.batch(function() {
                o.listeners.forEach(function(s) {
                    s(i)
                })
            })
        }, n.onFocus = function() {
            var i = this;
            ye.batch(function() {
                i.queries.forEach(function(o) {
                    o.onFocus()
                })
            })
        }, n.onOnline = function() {
            var i = this;
            ye.batch(function() {
                i.queries.forEach(function(o) {
                    o.onOnline()
                })
            })
        }, t
    }(zr),
    J6 = function() {
        function e(n) {
            this.options = W({}, n.defaultOptions, n.options), this.mutationId = n.mutationId, this.mutationCache = n.mutationCache, this.observers = [], this.state = n.state || u2(), this.meta = n.meta
        }
        var t = e.prototype;
        return t.setState = function(r) {
            this.dispatch({
                type: "setState",
                state: r
            })
        }, t.addObserver = function(r) {
            this.observers.indexOf(r) === -1 && this.observers.push(r)
        }, t.removeObserver = function(r) {
            this.observers = this.observers.filter(function(i) {
                return i !== r
            })
        }, t.cancel = function() {
            return this.retryer ? (this.retryer.cancel(), this.retryer.promise.then($e).catch($e)) : Promise.resolve()
        }, t.continue = function() {
            return this.retryer ? (this.retryer.continue(), this.retryer.promise) : this.execute()
        }, t.execute = function() {
            var r = this,
                i, o = this.state.status === "loading",
                s = Promise.resolve();
            return o || (this.dispatch({
                type: "loading",
                variables: this.options.variables
            }), s = s.then(function() {
                r.mutationCache.config.onMutate == null || r.mutationCache.config.onMutate(r.state.variables, r)
            }).then(function() {
                return r.options.onMutate == null ? void 0 : r.options.onMutate(r.state.variables)
            }).then(function(a) {
                a !== r.state.context && r.dispatch({
                    type: "loading",
                    context: a,
                    variables: r.state.variables
                })
            })), s.then(function() {
                return r.executeMutation()
            }).then(function(a) {
                i = a, r.mutationCache.config.onSuccess == null || r.mutationCache.config.onSuccess(i, r.state.variables, r.state.context, r)
            }).then(function() {
                return r.options.onSuccess == null ? void 0 : r.options.onSuccess(i, r.state.variables, r.state.context)
            }).then(function() {
                return r.options.onSettled == null ? void 0 : r.options.onSettled(i, null, r.state.variables, r.state.context)
            }).then(function() {
                return r.dispatch({
                    type: "success",
                    data: i
                }), i
            }).catch(function(a) {
                return r.mutationCache.config.onError == null || r.mutationCache.config.onError(a, r.state.variables, r.state.context, r), Vs().error(a), Promise.resolve().then(function() {
                    return r.options.onError == null ? void 0 : r.options.onError(a, r.state.variables, r.state.context)
                }).then(function() {
                    return r.options.onSettled == null ? void 0 : r.options.onSettled(void 0, a, r.state.variables, r.state.context)
                }).then(function() {
                    throw r.dispatch({
                        type: "error",
                        error: a
                    }), a
                })
            })
        }, t.executeMutation = function() {
            var r = this,
                i;
            return this.retryer = new a2({
                fn: function() {
                    return r.options.mutationFn ? r.options.mutationFn(r.state.variables) : Promise.reject("No mutationFn found")
                },
                onFail: function() {
                    r.dispatch({
                        type: "failed"
                    })
                },
                onPause: function() {
                    r.dispatch({
                        type: "pause"
                    })
                },
                onContinue: function() {
                    r.dispatch({
                        type: "continue"
                    })
                },
                retry: (i = this.options.retry) != null ? i : 0,
                retryDelay: this.options.retryDelay
            }), this.retryer.promise
        }, t.dispatch = function(r) {
            var i = this;
            this.state = e9(this.state, r), ye.batch(function() {
                i.observers.forEach(function(o) {
                    o.onMutationUpdate(r)
                }), i.mutationCache.notify(i)
            })
        }, e
    }();

function u2() {
    return {
        context: void 0,
        data: void 0,
        error: null,
        failureCount: 0,
        isPaused: !1,
        status: "idle",
        variables: void 0
    }
}

function e9(e, t) {
    switch (t.type) {
        case "failed":
            return W({}, e, {
                failureCount: e.failureCount + 1
            });
        case "pause":
            return W({}, e, {
                isPaused: !0
            });
        case "continue":
            return W({}, e, {
                isPaused: !1
            });
        case "loading":
            return W({}, e, {
                context: t.context,
                data: void 0,
                error: null,
                isPaused: !1,
                status: "loading",
                variables: t.variables
            });
        case "success":
            return W({}, e, {
                data: t.data,
                error: null,
                status: "success",
                isPaused: !1
            });
        case "error":
            return W({}, e, {
                data: void 0,
                error: t.error,
                failureCount: e.failureCount + 1,
                isPaused: !1,
                status: "error"
            });
        case "setState":
            return W({}, e, t.state);
        default:
            return e
    }
}
var t9 = function(e) {
    Zn(t, e);

    function t(r) {
        var i;
        return i = e.call(this) || this, i.config = r || {}, i.mutations = [], i.mutationId = 0, i
    }
    var n = t.prototype;
    return n.build = function(i, o, s) {
        var a = new J6({
            mutationCache: this,
            mutationId: ++this.mutationId,
            options: i.defaultMutationOptions(o),
            state: s,
            defaultOptions: o.mutationKey ? i.getMutationDefaults(o.mutationKey) : void 0,
            meta: o.meta
        });
        return this.add(a), a
    }, n.add = function(i) {
        this.mutations.push(i), this.notify(i)
    }, n.remove = function(i) {
        this.mutations = this.mutations.filter(function(o) {
            return o !== i
        }), i.cancel(), this.notify(i)
    }, n.clear = function() {
        var i = this;
        ye.batch(function() {
            i.mutations.forEach(function(o) {
                i.remove(o)
            })
        })
    }, n.getAll = function() {
        return this.mutations
    }, n.find = function(i) {
        return typeof i.exact > "u" && (i.exact = !0), this.mutations.find(function(o) {
            return Wh(i, o)
        })
    }, n.findAll = function(i) {
        return this.mutations.filter(function(o) {
            return Wh(i, o)
        })
    }, n.notify = function(i) {
        var o = this;
        ye.batch(function() {
            o.listeners.forEach(function(s) {
                s(i)
            })
        })
    }, n.onFocus = function() {
        this.resumePausedMutations()
    }, n.onOnline = function() {
        this.resumePausedMutations()
    }, n.resumePausedMutations = function() {
        var i = this.mutations.filter(function(o) {
            return o.state.isPaused
        });
        return ye.batch(function() {
            return i.reduce(function(o, s) {
                return o.then(function() {
                    return s.continue().catch($e)
                })
            }, Promise.resolve())
        })
    }, t
}(zr);

function n9() {
    return {
        onFetch: function(t) {
            t.fetchFn = function() {
                var n, r, i, o, s, a, l = (n = t.fetchOptions) == null || (r = n.meta) == null ? void 0 : r.refetchPage,
                    u = (i = t.fetchOptions) == null || (o = i.meta) == null ? void 0 : o.fetchMore,
                    c = u == null ? void 0 : u.pageParam,
                    f = (u == null ? void 0 : u.direction) === "forward",
                    d = (u == null ? void 0 : u.direction) === "backward",
                    p = ((s = t.state.data) == null ? void 0 : s.pages) || [],
                    y = ((a = t.state.data) == null ? void 0 : a.pageParams) || [],
                    g = o2(),
                    x = g == null ? void 0 : g.signal,
                    v = y,
                    h = !1,
                    m = t.options.queryFn || function() {
                        return Promise.reject("Missing queryFn")
                    },
                    C = function(H, Q, ie, ue) {
                        return v = ue ? [Q].concat(v) : [].concat(v, [Q]), ue ? [ie].concat(H) : [].concat(H, [ie])
                    },
                    S = function(H, Q, ie, ue) {
                        if (h) return Promise.reject("Cancelled");
                        if (typeof ie > "u" && !Q && H.length) return Promise.resolve(H);
                        var A = {
                                queryKey: t.queryKey,
                                signal: x,
                                pageParam: ie,
                                meta: t.meta
                            },
                            I = m(A),
                            N = Promise.resolve(I).then(function(M) {
                                return C(H, ie, M, ue)
                            });
                        if (Ds(I)) {
                            var $ = N;
                            $.cancel = I.cancel
                        }
                        return N
                    },
                    k;
                if (!p.length) k = S([]);
                else if (f) {
                    var T = typeof c < "u",
                        E = T ? c : Gh(t.options, p);
                    k = S(p, T, E)
                } else if (d) {
                    var _ = typeof c < "u",
                        D = _ ? c : r9(t.options, p);
                    k = S(p, _, D, !0)
                } else(function() {
                    v = [];
                    var J = typeof t.options.getNextPageParam > "u",
                        H = l && p[0] ? l(p[0], 0, p) : !0;
                    k = H ? S([], J, y[0]) : Promise.resolve(C([], y[0], p[0]));
                    for (var Q = function(A) {
                            k = k.then(function(I) {
                                var N = l && p[A] ? l(p[A], A, p) : !0;
                                if (N) {
                                    var $ = J ? y[A] : Gh(t.options, I);
                                    return S(I, J, $)
                                }
                                return Promise.resolve(C(I, y[A], p[A]))
                            })
                        }, ie = 1; ie < p.length; ie++) Q(ie)
                })();
                var ee = k.then(function(J) {
                        return {
                            pages: J,
                            pageParams: v
                        }
                    }),
                    Z = ee;
                return Z.cancel = function() {
                    h = !0, g == null || g.abort(), Ds(k) && k.cancel()
                }, ee
            }
        }
    }
}

function Gh(e, t) {
    return e.getNextPageParam == null ? void 0 : e.getNextPageParam(t[t.length - 1], t)
}

function r9(e, t) {
    return e.getPreviousPageParam == null ? void 0 : e.getPreviousPageParam(t[0], t)
}
var i9 = function() {
        function e(n) {
            n === void 0 && (n = {}), this.queryCache = n.queryCache || new X6, this.mutationCache = n.mutationCache || new t9, this.defaultOptions = n.defaultOptions || {}, this.queryDefaults = [], this.mutationDefaults = []
        }
        var t = e.prototype;
        return t.mount = function() {
            var r = this;
            this.unsubscribeFocus = wi.subscribe(function() {
                wi.isFocused() && Qo.isOnline() && (r.mutationCache.onFocus(), r.queryCache.onFocus())
            }), this.unsubscribeOnline = Qo.subscribe(function() {
                wi.isFocused() && Qo.isOnline() && (r.mutationCache.onOnline(), r.queryCache.onOnline())
            })
        }, t.unmount = function() {
            var r, i;
            (r = this.unsubscribeFocus) == null || r.call(this), (i = this.unsubscribeOnline) == null || i.call(this)
        }, t.isFetching = function(r, i) {
            var o = nn(r, i),
                s = o[0];
            return s.fetching = !0, this.queryCache.findAll(s).length
        }, t.isMutating = function(r) {
            return this.mutationCache.findAll(W({}, r, {
                fetching: !0
            })).length
        }, t.getQueryData = function(r, i) {
            var o;
            return (o = this.queryCache.find(r, i)) == null ? void 0 : o.state.data
        }, t.getQueriesData = function(r) {
            return this.getQueryCache().findAll(r).map(function(i) {
                var o = i.queryKey,
                    s = i.state,
                    a = s.data;
                return [o, a]
            })
        }, t.setQueryData = function(r, i, o) {
            var s = Uo(r),
                a = this.defaultQueryOptions(s);
            return this.queryCache.build(this, a).setData(i, o)
        }, t.setQueriesData = function(r, i, o) {
            var s = this;
            return ye.batch(function() {
                return s.getQueryCache().findAll(r).map(function(a) {
                    var l = a.queryKey;
                    return [l, s.setQueryData(l, i, o)]
                })
            })
        }, t.getQueryState = function(r, i) {
            var o;
            return (o = this.queryCache.find(r, i)) == null ? void 0 : o.state
        }, t.removeQueries = function(r, i) {
            var o = nn(r, i),
                s = o[0],
                a = this.queryCache;
            ye.batch(function() {
                a.findAll(s).forEach(function(l) {
                    a.remove(l)
                })
            })
        }, t.resetQueries = function(r, i, o) {
            var s = this,
                a = nn(r, i, o),
                l = a[0],
                u = a[1],
                c = this.queryCache,
                f = W({}, l, {
                    active: !0
                });
            return ye.batch(function() {
                return c.findAll(l).forEach(function(d) {
                    d.reset()
                }), s.refetchQueries(f, u)
            })
        }, t.cancelQueries = function(r, i, o) {
            var s = this,
                a = nn(r, i, o),
                l = a[0],
                u = a[1],
                c = u === void 0 ? {} : u;
            typeof c.revert > "u" && (c.revert = !0);
            var f = ye.batch(function() {
                return s.queryCache.findAll(l).map(function(d) {
                    return d.cancel(c)
                })
            });
            return Promise.all(f).then($e).catch($e)
        }, t.invalidateQueries = function(r, i, o) {
            var s, a, l, u = this,
                c = nn(r, i, o),
                f = c[0],
                d = c[1],
                p = W({}, f, {
                    active: (s = (a = f.refetchActive) != null ? a : f.active) != null ? s : !0,
                    inactive: (l = f.refetchInactive) != null ? l : !1
                });
            return ye.batch(function() {
                return u.queryCache.findAll(f).forEach(function(y) {
                    y.invalidate()
                }), u.refetchQueries(p, d)
            })
        }, t.refetchQueries = function(r, i, o) {
            var s = this,
                a = nn(r, i, o),
                l = a[0],
                u = a[1],
                c = ye.batch(function() {
                    return s.queryCache.findAll(l).map(function(d) {
                        return d.fetch(void 0, W({}, u, {
                            meta: {
                                refetchPage: l == null ? void 0 : l.refetchPage
                            }
                        }))
                    })
                }),
                f = Promise.all(c).then($e);
            return u != null && u.throwOnError || (f = f.catch($e)), f
        }, t.fetchQuery = function(r, i, o) {
            var s = Uo(r, i, o),
                a = this.defaultQueryOptions(s);
            typeof a.retry > "u" && (a.retry = !1);
            var l = this.queryCache.build(this, a);
            return l.isStaleByTime(a.staleTime) ? l.fetch(a) : Promise.resolve(l.state.data)
        }, t.prefetchQuery = function(r, i, o) {
            return this.fetchQuery(r, i, o).then($e).catch($e)
        }, t.fetchInfiniteQuery = function(r, i, o) {
            var s = Uo(r, i, o);
            return s.behavior = n9(), this.fetchQuery(s)
        }, t.prefetchInfiniteQuery = function(r, i, o) {
            return this.fetchInfiniteQuery(r, i, o).then($e).catch($e)
        }, t.cancelMutations = function() {
            var r = this,
                i = ye.batch(function() {
                    return r.mutationCache.getAll().map(function(o) {
                        return o.cancel()
                    })
                });
            return Promise.all(i).then($e).catch($e)
        }, t.resumePausedMutations = function() {
            return this.getMutationCache().resumePausedMutations()
        }, t.executeMutation = function(r) {
            return this.mutationCache.build(this, r).execute()
        }, t.getQueryCache = function() {
            return this.queryCache
        }, t.getMutationCache = function() {
            return this.mutationCache
        }, t.getDefaultOptions = function() {
            return this.defaultOptions
        }, t.setDefaultOptions = function(r) {
            this.defaultOptions = r
        }, t.setQueryDefaults = function(r, i) {
            var o = this.queryDefaults.find(function(s) {
                return _n(r) === _n(s.queryKey)
            });
            o ? o.defaultOptions = i : this.queryDefaults.push({
                queryKey: r,
                defaultOptions: i
            })
        }, t.getQueryDefaults = function(r) {
            var i;
            return r ? (i = this.queryDefaults.find(function(o) {
                return Ls(r, o.queryKey)
            })) == null ? void 0 : i.defaultOptions : void 0
        }, t.setMutationDefaults = function(r, i) {
            var o = this.mutationDefaults.find(function(s) {
                return _n(r) === _n(s.mutationKey)
            });
            o ? o.defaultOptions = i : this.mutationDefaults.push({
                mutationKey: r,
                defaultOptions: i
            })
        }, t.getMutationDefaults = function(r) {
            var i;
            return r ? (i = this.mutationDefaults.find(function(o) {
                return Ls(r, o.mutationKey)
            })) == null ? void 0 : i.defaultOptions : void 0
        }, t.defaultQueryOptions = function(r) {
            if (r != null && r._defaulted) return r;
            var i = W({}, this.defaultOptions.queries, this.getQueryDefaults(r == null ? void 0 : r.queryKey), r, {
                _defaulted: !0
            });
            return !i.queryHash && i.queryKey && (i.queryHash = yf(i.queryKey, i)), i
        }, t.defaultQueryObserverOptions = function(r) {
            return this.defaultQueryOptions(r)
        }, t.defaultMutationOptions = function(r) {
            return r != null && r._defaulted ? r : W({}, this.defaultOptions.mutations, this.getMutationDefaults(r == null ? void 0 : r.mutationKey), r, {
                _defaulted: !0
            })
        }, t.clear = function() {
            this.queryCache.clear(), this.mutationCache.clear()
        }, e
    }(),
    o9 = function(e) {
        Zn(t, e);

        function t(r, i) {
            var o;
            return o = e.call(this) || this, o.client = r, o.options = i, o.trackedProps = [], o.selectError = null, o.bindMethods(), o.setOptions(i), o
        }
        var n = t.prototype;
        return n.bindMethods = function() {
            this.remove = this.remove.bind(this), this.refetch = this.refetch.bind(this)
        }, n.onSubscribe = function() {
            this.listeners.length === 1 && (this.currentQuery.addObserver(this), Zh(this.currentQuery, this.options) && this.executeFetch(), this.updateTimers())
        }, n.onUnsubscribe = function() {
            this.listeners.length || this.destroy()
        }, n.shouldFetchOnReconnect = function() {
            return Nu(this.currentQuery, this.options, this.options.refetchOnReconnect)
        }, n.shouldFetchOnWindowFocus = function() {
            return Nu(this.currentQuery, this.options, this.options.refetchOnWindowFocus)
        }, n.destroy = function() {
            this.listeners = [], this.clearTimers(), this.currentQuery.removeObserver(this)
        }, n.setOptions = function(i, o) {
            var s = this.options,
                a = this.currentQuery;
            if (this.options = this.client.defaultQueryObserverOptions(i), typeof this.options.enabled < "u" && typeof this.options.enabled != "boolean") throw new Error("Expected enabled to be a boolean");
            this.options.queryKey || (this.options.queryKey = s.queryKey), this.updateQuery();
            var l = this.hasListeners();
            l && Yh(this.currentQuery, a, this.options, s) && this.executeFetch(), this.updateResult(o), l && (this.currentQuery !== a || this.options.enabled !== s.enabled || this.options.staleTime !== s.staleTime) && this.updateStaleTimeout();
            var u = this.computeRefetchInterval();
            l && (this.currentQuery !== a || this.options.enabled !== s.enabled || u !== this.currentRefetchInterval) && this.updateRefetchInterval(u)
        }, n.getOptimisticResult = function(i) {
            var o = this.client.defaultQueryObserverOptions(i),
                s = this.client.getQueryCache().build(this.client, o);
            return this.createResult(s, o)
        }, n.getCurrentResult = function() {
            return this.currentResult
        }, n.trackResult = function(i, o) {
            var s = this,
                a = {},
                l = function(c) {
                    s.trackedProps.includes(c) || s.trackedProps.push(c)
                };
            return Object.keys(i).forEach(function(u) {
                Object.defineProperty(a, u, {
                    configurable: !1,
                    enumerable: !0,
                    get: function() {
                        return l(u), i[u]
                    }
                })
            }), (o.useErrorBoundary || o.suspense) && l("error"), a
        }, n.getNextResult = function(i) {
            var o = this;
            return new Promise(function(s, a) {
                var l = o.subscribe(function(u) {
                    u.isFetching || (l(), u.isError && (i != null && i.throwOnError) ? a(u.error) : s(u))
                })
            })
        }, n.getCurrentQuery = function() {
            return this.currentQuery
        }, n.remove = function() {
            this.client.getQueryCache().remove(this.currentQuery)
        }, n.refetch = function(i) {
            return this.fetch(W({}, i, {
                meta: {
                    refetchPage: i == null ? void 0 : i.refetchPage
                }
            }))
        }, n.fetchOptimistic = function(i) {
            var o = this,
                s = this.client.defaultQueryObserverOptions(i),
                a = this.client.getQueryCache().build(this.client, s);
            return a.fetch().then(function() {
                return o.createResult(a, s)
            })
        }, n.fetch = function(i) {
            var o = this;
            return this.executeFetch(i).then(function() {
                return o.updateResult(), o.currentResult
            })
        }, n.executeFetch = function(i) {
            this.updateQuery();
            var o = this.currentQuery.fetch(this.options, i);
            return i != null && i.throwOnError || (o = o.catch($e)), o
        }, n.updateStaleTimeout = function() {
            var i = this;
            if (this.clearStaleTimeout(), !(Os || this.currentResult.isStale || !Iu(this.options.staleTime))) {
                var o = r2(this.currentResult.dataUpdatedAt, this.options.staleTime),
                    s = o + 1;
                this.staleTimeoutId = setTimeout(function() {
                    i.currentResult.isStale || i.updateResult()
                }, s)
            }
        }, n.computeRefetchInterval = function() {
            var i;
            return typeof this.options.refetchInterval == "function" ? this.options.refetchInterval(this.currentResult.data, this.currentQuery) : (i = this.options.refetchInterval) != null ? i : !1
        }, n.updateRefetchInterval = function(i) {
            var o = this;
            this.clearRefetchInterval(), this.currentRefetchInterval = i, !(Os || this.options.enabled === !1 || !Iu(this.currentRefetchInterval) || this.currentRefetchInterval === 0) && (this.refetchIntervalId = setInterval(function() {
                (o.options.refetchIntervalInBackground || wi.isFocused()) && o.executeFetch()
            }, this.currentRefetchInterval))
        }, n.updateTimers = function() {
            this.updateStaleTimeout(), this.updateRefetchInterval(this.computeRefetchInterval())
        }, n.clearTimers = function() {
            this.clearStaleTimeout(), this.clearRefetchInterval()
        }, n.clearStaleTimeout = function() {
            this.staleTimeoutId && (clearTimeout(this.staleTimeoutId), this.staleTimeoutId = void 0)
        }, n.clearRefetchInterval = function() {
            this.refetchIntervalId && (clearInterval(this.refetchIntervalId), this.refetchIntervalId = void 0)
        }, n.createResult = function(i, o) {
            var s = this.currentQuery,
                a = this.options,
                l = this.currentResult,
                u = this.currentResultState,
                c = this.currentResultOptions,
                f = i !== s,
                d = f ? i.state : this.currentQueryInitialState,
                p = f ? this.currentResult : this.previousQueryResult,
                y = i.state,
                g = y.dataUpdatedAt,
                x = y.error,
                v = y.errorUpdatedAt,
                h = y.isFetching,
                m = y.status,
                C = !1,
                S = !1,
                k;
            if (o.optimisticResults) {
                var T = this.hasListeners(),
                    E = !T && Zh(i, o),
                    _ = T && Yh(i, s, o, a);
                (E || _) && (h = !0, g || (m = "loading"))
            }
            if (o.keepPreviousData && !y.dataUpdateCount && (p != null && p.isSuccess) && m !== "error") k = p.data, g = p.dataUpdatedAt, m = p.status, C = !0;
            else if (o.select && typeof y.data < "u")
                if (l && y.data === (u == null ? void 0 : u.data) && o.select === this.selectFn) k = this.selectResult;
                else try {
                    this.selectFn = o.select, k = o.select(y.data), o.structuralSharing !== !1 && (k = bs(l == null ? void 0 : l.data, k)), this.selectResult = k, this.selectError = null
                } catch (Z) {
                    Vs().error(Z), this.selectError = Z
                } else k = y.data;
            if (typeof o.placeholderData < "u" && typeof k > "u" && (m === "loading" || m === "idle")) {
                var D;
                if (l != null && l.isPlaceholderData && o.placeholderData === (c == null ? void 0 : c.placeholderData)) D = l.data;
                else if (D = typeof o.placeholderData == "function" ? o.placeholderData() : o.placeholderData, o.select && typeof D < "u") try {
                    D = o.select(D), o.structuralSharing !== !1 && (D = bs(l == null ? void 0 : l.data, D)), this.selectError = null
                } catch (Z) {
                    Vs().error(Z), this.selectError = Z
                }
                typeof D < "u" && (m = "success", k = D, S = !0)
            }
            this.selectError && (x = this.selectError, k = this.selectResult, v = Date.now(), m = "error");
            var ee = {
                status: m,
                isLoading: m === "loading",
                isSuccess: m === "success",
                isError: m === "error",
                isIdle: m === "idle",
                data: k,
                dataUpdatedAt: g,
                error: x,
                errorUpdatedAt: v,
                failureCount: y.fetchFailureCount,
                errorUpdateCount: y.errorUpdateCount,
                isFetched: y.dataUpdateCount > 0 || y.errorUpdateCount > 0,
                isFetchedAfterMount: y.dataUpdateCount > d.dataUpdateCount || y.errorUpdateCount > d.errorUpdateCount,
                isFetching: h,
                isRefetching: h && m !== "loading",
                isLoadingError: m === "error" && y.dataUpdatedAt === 0,
                isPlaceholderData: S,
                isPreviousData: C,
                isRefetchError: m === "error" && y.dataUpdatedAt !== 0,
                isStale: vf(i, o),
                refetch: this.refetch,
                remove: this.remove
            };
            return ee
        }, n.shouldNotifyListeners = function(i, o) {
            if (!o) return !0;
            var s = this.options,
                a = s.notifyOnChangeProps,
                l = s.notifyOnChangePropsExclusions;
            if (!a && !l || a === "tracked" && !this.trackedProps.length) return !0;
            var u = a === "tracked" ? this.trackedProps : a;
            return Object.keys(i).some(function(c) {
                var f = c,
                    d = i[f] !== o[f],
                    p = u == null ? void 0 : u.some(function(g) {
                        return g === c
                    }),
                    y = l == null ? void 0 : l.some(function(g) {
                        return g === c
                    });
                return d && !y && (!u || p)
            })
        }, n.updateResult = function(i) {
            var o = this.currentResult;
            if (this.currentResult = this.createResult(this.currentQuery, this.options), this.currentResultState = this.currentQuery.state, this.currentResultOptions = this.options, !Q6(this.currentResult, o)) {
                var s = {
                    cache: !0
                };
                (i == null ? void 0 : i.listeners) !== !1 && this.shouldNotifyListeners(this.currentResult, o) && (s.listeners = !0), this.notify(W({}, s, i))
            }
        }, n.updateQuery = function() {
            var i = this.client.getQueryCache().build(this.client, this.options);
            if (i !== this.currentQuery) {
                var o = this.currentQuery;
                this.currentQuery = i, this.currentQueryInitialState = i.state, this.previousQueryResult = this.currentResult, this.hasListeners() && (o == null || o.removeObserver(this), i.addObserver(this))
            }
        }, n.onQueryUpdate = function(i) {
            var o = {};
            i.type === "success" ? o.onSuccess = !0 : i.type === "error" && !Ho(i.error) && (o.onError = !0), this.updateResult(o), this.hasListeners() && this.updateTimers()
        }, n.notify = function(i) {
            var o = this;
            ye.batch(function() {
                i.onSuccess ? (o.options.onSuccess == null || o.options.onSuccess(o.currentResult.data), o.options.onSettled == null || o.options.onSettled(o.currentResult.data, null)) : i.onError && (o.options.onError == null || o.options.onError(o.currentResult.error), o.options.onSettled == null || o.options.onSettled(void 0, o.currentResult.error)), i.listeners && o.listeners.forEach(function(s) {
                    s(o.currentResult)
                }), i.cache && o.client.getQueryCache().notify({
                    query: o.currentQuery,
                    type: "observerResultsUpdated"
                })
            })
        }, t
    }(zr);

function s9(e, t) {
    return t.enabled !== !1 && !e.state.dataUpdatedAt && !(e.state.status === "error" && t.retryOnMount === !1)
}

function Zh(e, t) {
    return s9(e, t) || e.state.dataUpdatedAt > 0 && Nu(e, t, t.refetchOnMount)
}

function Nu(e, t, n) {
    if (t.enabled !== !1) {
        var r = typeof n == "function" ? n(e) : n;
        return r === "always" || r !== !1 && vf(e, t)
    }
    return !1
}

function Yh(e, t, n, r) {
    return n.enabled !== !1 && (e !== t || r.enabled === !1) && (!n.suspense || e.state.status !== "error") && vf(e, n)
}

function vf(e, t) {
    return e.isStaleByTime(t.staleTime)
}
var a9 = function(e) {
        Zn(t, e);

        function t(r, i) {
            var o;
            return o = e.call(this) || this, o.client = r, o.setOptions(i), o.bindMethods(), o.updateResult(), o
        }
        var n = t.prototype;
        return n.bindMethods = function() {
            this.mutate = this.mutate.bind(this), this.reset = this.reset.bind(this)
        }, n.setOptions = function(i) {
            this.options = this.client.defaultMutationOptions(i)
        }, n.onUnsubscribe = function() {
            if (!this.listeners.length) {
                var i;
                (i = this.currentMutation) == null || i.removeObserver(this)
            }
        }, n.onMutationUpdate = function(i) {
            this.updateResult();
            var o = {
                listeners: !0
            };
            i.type === "success" ? o.onSuccess = !0 : i.type === "error" && (o.onError = !0), this.notify(o)
        }, n.getCurrentResult = function() {
            return this.currentResult
        }, n.reset = function() {
            this.currentMutation = void 0, this.updateResult(), this.notify({
                listeners: !0
            })
        }, n.mutate = function(i, o) {
            return this.mutateOptions = o, this.currentMutation && this.currentMutation.removeObserver(this), this.currentMutation = this.client.getMutationCache().build(this.client, W({}, this.options, {
                variables: typeof i < "u" ? i : this.options.variables
            })), this.currentMutation.addObserver(this), this.currentMutation.execute()
        }, n.updateResult = function() {
            var i = this.currentMutation ? this.currentMutation.state : u2(),
                o = W({}, i, {
                    isLoading: i.status === "loading",
                    isSuccess: i.status === "success",
                    isError: i.status === "error",
                    isIdle: i.status === "idle",
                    mutate: this.mutate,
                    reset: this.reset
                });
            this.currentResult = o
        }, n.notify = function(i) {
            var o = this;
            ye.batch(function() {
                o.mutateOptions && (i.onSuccess ? (o.mutateOptions.onSuccess == null || o.mutateOptions.onSuccess(o.currentResult.data, o.currentResult.variables, o.currentResult.context), o.mutateOptions.onSettled == null || o.mutateOptions.onSettled(o.currentResult.data, null, o.currentResult.variables, o.currentResult.context)) : i.onError && (o.mutateOptions.onError == null || o.mutateOptions.onError(o.currentResult.error, o.currentResult.variables, o.currentResult.context), o.mutateOptions.onSettled == null || o.mutateOptions.onSettled(void 0, o.currentResult.error, o.currentResult.variables, o.currentResult.context))), i.listeners && o.listeners.forEach(function(s) {
                    s(o.currentResult)
                })
            })
        }, t
    }(zr),
    l9 = y0.unstable_batchedUpdates;
ye.setBatchNotifyFunction(l9);
var u9 = console;
Z6(u9);
var Xh = ce.createContext(void 0),
    c2 = ce.createContext(!1);

function f2(e) {
    return e && typeof window < "u" ? (window.ReactQueryClientContext || (window.ReactQueryClientContext = Xh), window.ReactQueryClientContext) : Xh
}
var d2 = function() {
        var t = ce.useContext(f2(ce.useContext(c2)));
        if (!t) throw new Error("No QueryClient set, use QueryClientProvider to set one");
        return t
    },
    c9 = function(t) {
        var n = t.client,
            r = t.contextSharing,
            i = r === void 0 ? !1 : r,
            o = t.children;
        ce.useEffect(function() {
            return n.mount(),
                function() {
                    n.unmount()
                }
        }, [n]);
        var s = f2(i);
        return ce.createElement(c2.Provider, {
            value: i
        }, ce.createElement(s.Provider, {
            value: n
        }, o))
    };

function f9() {
    var e = !1;
    return {
        clearReset: function() {
            e = !1
        },
        reset: function() {
            e = !0
        },
        isReset: function() {
            return e
        }
    }
}
var d9 = ce.createContext(f9()),
    h9 = function() {
        return ce.useContext(d9)
    };

function h2(e, t, n) {
    return typeof t == "function" ? t.apply(void 0, n) : typeof t == "boolean" ? t : !!e
}

function Jh(e, t, n) {
    var r = ce.useRef(!1),
        i = ce.useState(0),
        o = i[1],
        s = z6(e, t, n),
        a = d2(),
        l = ce.useRef();
    l.current ? l.current.setOptions(s) : l.current = new a9(a, s);
    var u = l.current.getCurrentResult();
    ce.useEffect(function() {
        r.current = !0;
        var f = l.current.subscribe(ye.batchCalls(function() {
            r.current && o(function(d) {
                return d + 1
            })
        }));
        return function() {
            r.current = !1, f()
        }
    }, []);
    var c = ce.useCallback(function(f, d) {
        l.current.mutate(f, d).catch($e)
    }, []);
    if (u.error && h2(void 0, l.current.options.useErrorBoundary, [u.error])) throw u.error;
    return W({}, u, {
        mutate: c,
        mutateAsync: u.mutate
    })
}

function p9(e, t) {
    var n = ce.useRef(!1),
        r = ce.useState(0),
        i = r[1],
        o = d2(),
        s = h9(),
        a = o.defaultQueryObserverOptions(e);
    a.optimisticResults = !0, a.onError && (a.onError = ye.batchCalls(a.onError)), a.onSuccess && (a.onSuccess = ye.batchCalls(a.onSuccess)), a.onSettled && (a.onSettled = ye.batchCalls(a.onSettled)), a.suspense && (typeof a.staleTime != "number" && (a.staleTime = 1e3), a.cacheTime === 0 && (a.cacheTime = 1)), (a.suspense || a.useErrorBoundary) && (s.isReset() || (a.retryOnMount = !1));
    var l = ce.useState(function() {
            return new t(o, a)
        }),
        u = l[0],
        c = u.getOptimisticResult(a);
    if (ce.useEffect(function() {
            n.current = !0, s.clearReset();
            var f = u.subscribe(ye.batchCalls(function() {
                n.current && i(function(d) {
                    return d + 1
                })
            }));
            return u.updateResult(),
                function() {
                    n.current = !1, f()
                }
        }, [s, u]), ce.useEffect(function() {
            u.setOptions(a, {
                listeners: !1
            })
        }, [a, u]), a.suspense && c.isLoading) throw u.fetchOptimistic(a).then(function(f) {
        var d = f.data;
        a.onSuccess == null || a.onSuccess(d), a.onSettled == null || a.onSettled(d, null)
    }).catch(function(f) {
        s.clearReset(), a.onError == null || a.onError(f), a.onSettled == null || a.onSettled(void 0, f)
    });
    if (c.isError && !s.isReset() && !c.isFetching && h2(a.suspense, a.useErrorBoundary, [c.error, u.getCurrentQuery()])) throw c.error;
    return a.notifyOnChangeProps === "tracked" && (c = u.trackResult(c, a)), c
}

function e1(e, t, n) {
    var r = Uo(e, t, n);
    return p9(r, o9)
}
const t1 = () => O("svg", {
        xmlns: "http://www.w3.org/2000/svg",
        width: "0.8rem",
        height: "1rem",
        viewBox: "0 0 8 10",
        fill: "none",
        children: O("path", {
            d: "M6.75 3.35717C8.08333 4.12697 8.08333 6.05147 6.75 6.82127L3 8.98634C1.66667 9.75614 -8.20964e-07 8.79388 -7.53666e-07 7.25428L-5.6439e-07 2.92416C-4.97092e-07 1.38456 1.66667 0.422305 3 1.19211L6.75 3.35717Z",
            fill: "white"
        })
    }),
    m9 = q.div`
    width: 15.7rem;
    height: 3rem;
    border-radius: 0.5rem;
    background: #292929;
    margin: 0 1rem;
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;

    span {
        color: #FFF;
        font-size: 1.5rem;
        font-style: normal;
        font-weight: 500;
        line-height: 94%; 
    }

    ${e=>e.$selectedMenu&&Xi`
        opacity: .5;
        pointer-events: not-allowed;
    `}
`,
    p2 = q.div`
    position: absolute;
    top: 0;
    bottom: 0;
    display: flex;
    align-items: center;
    cursor: pointer;
    transition: opacity 0.2s ease-in-out;

    &:hover {
        opacity: .3;
    }

    &:active {
        opacity: 1;
    }
`;
Xi`
    opacity: 0.3;
    cursor: not-allowed;
`;
const y9 = q(p2)`
    left: 1rem;
    transform: rotate(-180deg);
`,
    v9 = q(p2)`
    right: 1rem;
`,
    ei = ["TODOS", "MOTOS", "CARROS", "SEDANS", "SUVS", "SPORTS"],
    g9 = ({
        onClassTypeSelect: e,
        selectedMenu: t
    }) => {
        const [n, r] = P.useState(0);
        P.useEffect(() => {
            const a = ei[n];
            e(a === "TODOS" ? "todos" : a.toLowerCase())
        }, [n, e]), P.useEffect(() => {
            const a = ei[n];
            e(t === "all" ? a === "CARROS" || a === "MOTOS" ? a.toLowerCase() : a : "todos")
        }, [n, e, t]), P.useEffect(() => {
            e("todos")
        }, [e]);
        const i = () => {
                t === "all" && r(n === 0 ? ei.length - 1 : n - 1)
            },
            o = () => {
                t === "all" && r(n === ei.length - 1 ? 0 : n + 1)
            },
            s = {
                hidden: {
                    opacity: 0
                },
                visible: {
                    opacity: 1
                }
            };
        return oe(m9, {
            $selectedMenu: t !== "all",
            children: [O(y9, {
                onClick: i,
                children: O(t1, {})
            }), O(of.span, {
                variants: s,
                initial: "hidden",
                animate: "visible",
                exit: "hidden",
                transition: {
                    duration: .5
                },
                children: ei[n]
            }, n), O(v9, {
                onClick: o,
                children: O(t1, {})
            })]
        })
    },
    C9 = () => O("svg", {
        xmlns: "http://www.w3.org/2000/svg",
        height: "1.8rem",
        viewBox: "0 0 17 19",
        fill: "none",
        children: O("path", {
            fillRule: "evenodd",
            clipRule: "evenodd",
            d: "M17 7.31178C17 11.3007 13.8508 14.5343 9.96612 14.5343C8.62299 14.5343 7.36779 14.1478 6.30028 13.4771L2.1832 17.7046C1.68376 18.2174 0.874014 18.2174 0.374578 17.7046C-0.124859 17.1918 -0.124859 16.3603 0.374578 15.8475L4.39403 11.7202C3.47746 10.5005 2.93223 8.97153 2.93223 7.31178C2.93223 3.32288 6.08141 0.0892334 9.96612 0.0892334C13.8508 0.0892334 17 3.32288 17 7.31178ZM14.4422 7.31178C14.4422 9.85017 12.4382 11.9079 9.96612 11.9079C7.49403 11.9079 5.49001 9.85017 5.49001 7.31178C5.49001 4.77339 7.49403 2.71561 9.96612 2.71561C12.4382 2.71561 14.4422 4.77339 14.4422 7.31178Z",
            fill: "#828282"
        })
    }),
    w9 = q.div`
    width: 42rem;
    height: 3.9rem;
    border-radius: 1rem;
    background: #1F1F1F;
    margin-left: 1rem;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
`,
    S9 = q.div`
    position: absolute;
    left: 1.4rem;
`,
    x9 = q.input`
    flex: 1;
    margin: 0 4rem;
    background-color: transparent;
    border: none;
    outline: none;
    text-align: center;
    color: #FFF;
    text-align: center;
    font-size: 1.5rem;
    font-style: normal;
    font-weight: 300;
    line-height: normal;
`,
    P9 = ({
        onSearch: e
    }) => oe(w9, {
        children: [O(S9, {
            children: O(C9, {})
        }), O(x9, {
            type: "text",
            id: "searchCar",
            placeholder: "Ex: Subaru",
            onChange: t => e(t.target.value)
        })]
    });

function k9(e) {
    if (e === void 0) throw new ReferenceError("this hasn't been initialised - super() hasn't been called");
    return e
}

function ju(e) {
    return ju = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function(n) {
        return n.__proto__ || Object.getPrototypeOf(n)
    }, ju(e)
}

function E9(e) {
    try {
        return Function.toString.call(e).indexOf("[native code]") !== -1
    } catch {
        return typeof e == "function"
    }
}

function T9() {
    if (typeof Reflect > "u" || !Reflect.construct || Reflect.construct.sham) return !1;
    if (typeof Proxy == "function") return !0;
    try {
        return Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {})), !0
    } catch {
        return !1
    }
}

function Wo(e, t, n) {
    return T9() ? Wo = Reflect.construct.bind() : Wo = function(i, o, s) {
        var a = [null];
        a.push.apply(a, o);
        var l = Function.bind.apply(i, a),
            u = new l;
        return s && Bi(u, s.prototype), u
    }, Wo.apply(null, arguments)
}

function zu(e) {
    var t = typeof Map == "function" ? new Map : void 0;
    return zu = function(r) {
        if (r === null || !E9(r)) return r;
        if (typeof r != "function") throw new TypeError("Super expression must either be null or a function");
        if (typeof t < "u") {
            if (t.has(r)) return t.get(r);
            t.set(r, i)
        }

        function i() {
            return Wo(r, arguments, ju(this).constructor)
        }
        return i.prototype = Object.create(r.prototype, {
            constructor: {
                value: i,
                enumerable: !1,
                writable: !0,
                configurable: !0
            }
        }), Bi(i, r)
    }, zu(e)
}
var vr = function(e) {
    Zn(t, e);

    function t(n) {
        var r;
        return r = e.call(this, "An error occurred. See https://github.com/styled-components/polished/blob/main/src/internalHelpers/errors.md#" + n + " for more information.") || this, k9(r)
    }
    return t
}(zu(Error));

function Cl(e) {
    return Math.round(e * 255)
}

function R9(e, t, n) {
    return Cl(e) + "," + Cl(t) + "," + Cl(n)
}

function n1(e, t, n, r) {
    if (r === void 0 && (r = R9), t === 0) return r(n, n, n);
    var i = (e % 360 + 360) % 360 / 60,
        o = (1 - Math.abs(2 * n - 1)) * t,
        s = o * (1 - Math.abs(i % 2 - 1)),
        a = 0,
        l = 0,
        u = 0;
    i >= 0 && i < 1 ? (a = o, l = s) : i >= 1 && i < 2 ? (a = s, l = o) : i >= 2 && i < 3 ? (l = o, u = s) : i >= 3 && i < 4 ? (l = s, u = o) : i >= 4 && i < 5 ? (a = s, u = o) : i >= 5 && i < 6 && (a = o, u = s);
    var c = n - o / 2,
        f = a + c,
        d = l + c,
        p = u + c;
    return r(f, d, p)
}
var r1 = {
    aliceblue: "f0f8ff",
    antiquewhite: "faebd7",
    aqua: "00ffff",
    aquamarine: "7fffd4",
    azure: "f0ffff",
    beige: "f5f5dc",
    bisque: "ffe4c4",
    black: "000",
    blanchedalmond: "ffebcd",
    blue: "0000ff",
    blueviolet: "8a2be2",
    brown: "a52a2a",
    burlywood: "deb887",
    cadetblue: "5f9ea0",
    chartreuse: "7fff00",
    chocolate: "d2691e",
    coral: "ff7f50",
    cornflowerblue: "6495ed",
    cornsilk: "fff8dc",
    crimson: "dc143c",
    cyan: "00ffff",
    darkblue: "00008b",
    darkcyan: "008b8b",
    darkgoldenrod: "b8860b",
    darkgray: "a9a9a9",
    darkgreen: "006400",
    darkgrey: "a9a9a9",
    darkkhaki: "bdb76b",
    darkmagenta: "8b008b",
    darkolivegreen: "556b2f",
    darkorange: "ff8c00",
    darkorchid: "9932cc",
    darkred: "8b0000",
    darksalmon: "e9967a",
    darkseagreen: "8fbc8f",
    darkslateblue: "483d8b",
    darkslategray: "2f4f4f",
    darkslategrey: "2f4f4f",
    darkturquoise: "00ced1",
    darkviolet: "9400d3",
    deeppink: "ff1493",
    deepskyblue: "00bfff",
    dimgray: "696969",
    dimgrey: "696969",
    dodgerblue: "1e90ff",
    firebrick: "b22222",
    floralwhite: "fffaf0",
    forestgreen: "228b22",
    fuchsia: "ff00ff",
    gainsboro: "dcdcdc",
    ghostwhite: "f8f8ff",
    gold: "ffd700",
    goldenrod: "daa520",
    gray: "808080",
    green: "008000",
    greenyellow: "adff2f",
    grey: "808080",
    honeydew: "f0fff0",
    hotpink: "ff69b4",
    indianred: "cd5c5c",
    indigo: "4b0082",
    ivory: "fffff0",
    khaki: "f0e68c",
    lavender: "e6e6fa",
    lavenderblush: "fff0f5",
    lawngreen: "7cfc00",
    lemonchiffon: "fffacd",
    lightblue: "add8e6",
    lightcoral: "f08080",
    lightcyan: "e0ffff",
    lightgoldenrodyellow: "fafad2",
    lightgray: "d3d3d3",
    lightgreen: "90ee90",
    lightgrey: "d3d3d3",
    lightpink: "ffb6c1",
    lightsalmon: "ffa07a",
    lightseagreen: "20b2aa",
    lightskyblue: "87cefa",
    lightslategray: "789",
    lightslategrey: "789",
    lightsteelblue: "b0c4de",
    lightyellow: "ffffe0",
    lime: "0f0",
    limegreen: "32cd32",
    linen: "faf0e6",
    magenta: "f0f",
    maroon: "800000",
    mediumaquamarine: "66cdaa",
    mediumblue: "0000cd",
    mediumorchid: "ba55d3",
    mediumpurple: "9370db",
    mediumseagreen: "3cb371",
    mediumslateblue: "7b68ee",
    mediumspringgreen: "00fa9a",
    mediumturquoise: "48d1cc",
    mediumvioletred: "c71585",
    midnightblue: "191970",
    mintcream: "f5fffa",
    mistyrose: "ffe4e1",
    moccasin: "ffe4b5",
    navajowhite: "ffdead",
    navy: "000080",
    oldlace: "fdf5e6",
    olive: "808000",
    olivedrab: "6b8e23",
    orange: "ffa500",
    orangered: "ff4500",
    orchid: "da70d6",
    palegoldenrod: "eee8aa",
    palegreen: "98fb98",
    paleturquoise: "afeeee",
    palevioletred: "db7093",
    papayawhip: "ffefd5",
    peachpuff: "ffdab9",
    peru: "cd853f",
    pink: "ffc0cb",
    plum: "dda0dd",
    powderblue: "b0e0e6",
    purple: "800080",
    rebeccapurple: "639",
    red: "f00",
    rosybrown: "bc8f8f",
    royalblue: "4169e1",
    saddlebrown: "8b4513",
    salmon: "fa8072",
    sandybrown: "f4a460",
    seagreen: "2e8b57",
    seashell: "fff5ee",
    sienna: "a0522d",
    silver: "c0c0c0",
    skyblue: "87ceeb",
    slateblue: "6a5acd",
    slategray: "708090",
    slategrey: "708090",
    snow: "fffafa",
    springgreen: "00ff7f",
    steelblue: "4682b4",
    tan: "d2b48c",
    teal: "008080",
    thistle: "d8bfd8",
    tomato: "ff6347",
    turquoise: "40e0d0",
    violet: "ee82ee",
    wheat: "f5deb3",
    white: "fff",
    whitesmoke: "f5f5f5",
    yellow: "ff0",
    yellowgreen: "9acd32"
};

function A9(e) {
    if (typeof e != "string") return e;
    var t = e.toLowerCase();
    return r1[t] ? "#" + r1[t] : e
}
var M9 = /^#[a-fA-F0-9]{6}$/,
    O9 = /^#[a-fA-F0-9]{8}$/,
    F9 = /^#[a-fA-F0-9]{3}$/,
    L9 = /^#[a-fA-F0-9]{4}$/,
    wl = /^rgb\(\s*(\d{1,3})\s*(?:,)?\s*(\d{1,3})\s*(?:,)?\s*(\d{1,3})\s*\)$/i,
    b9 = /^rgb(?:a)?\(\s*(\d{1,3})\s*(?:,)?\s*(\d{1,3})\s*(?:,)?\s*(\d{1,3})\s*(?:,|\/)\s*([-+]?\d*[.]?\d+[%]?)\s*\)$/i,
    D9 = /^hsl\(\s*(\d{0,3}[.]?[0-9]+(?:deg)?)\s*(?:,)?\s*(\d{1,3}[.]?[0-9]?)%\s*(?:,)?\s*(\d{1,3}[.]?[0-9]?)%\s*\)$/i,
    V9 = /^hsl(?:a)?\(\s*(\d{0,3}[.]?[0-9]+(?:deg)?)\s*(?:,)?\s*(\d{1,3}[.]?[0-9]?)%\s*(?:,)?\s*(\d{1,3}[.]?[0-9]?)%\s*(?:,|\/)\s*([-+]?\d*[.]?\d+[%]?)\s*\)$/i;

function m2(e) {
    if (typeof e != "string") throw new vr(3);
    var t = A9(e);
    if (t.match(M9)) return {
        red: parseInt("" + t[1] + t[2], 16),
        green: parseInt("" + t[3] + t[4], 16),
        blue: parseInt("" + t[5] + t[6], 16)
    };
    if (t.match(O9)) {
        var n = parseFloat((parseInt("" + t[7] + t[8], 16) / 255).toFixed(2));
        return {
            red: parseInt("" + t[1] + t[2], 16),
            green: parseInt("" + t[3] + t[4], 16),
            blue: parseInt("" + t[5] + t[6], 16),
            alpha: n
        }
    }
    if (t.match(F9)) return {
        red: parseInt("" + t[1] + t[1], 16),
        green: parseInt("" + t[2] + t[2], 16),
        blue: parseInt("" + t[3] + t[3], 16)
    };
    if (t.match(L9)) {
        var r = parseFloat((parseInt("" + t[4] + t[4], 16) / 255).toFixed(2));
        return {
            red: parseInt("" + t[1] + t[1], 16),
            green: parseInt("" + t[2] + t[2], 16),
            blue: parseInt("" + t[3] + t[3], 16),
            alpha: r
        }
    }
    var i = wl.exec(t);
    if (i) return {
        red: parseInt("" + i[1], 10),
        green: parseInt("" + i[2], 10),
        blue: parseInt("" + i[3], 10)
    };
    var o = b9.exec(t.substring(0, 50));
    if (o) return {
        red: parseInt("" + o[1], 10),
        green: parseInt("" + o[2], 10),
        blue: parseInt("" + o[3], 10),
        alpha: parseFloat("" + o[4]) > 1 ? parseFloat("" + o[4]) / 100 : parseFloat("" + o[4])
    };
    var s = D9.exec(t);
    if (s) {
        var a = parseInt("" + s[1], 10),
            l = parseInt("" + s[2], 10) / 100,
            u = parseInt("" + s[3], 10) / 100,
            c = "rgb(" + n1(a, l, u) + ")",
            f = wl.exec(c);
        if (!f) throw new vr(4, t, c);
        return {
            red: parseInt("" + f[1], 10),
            green: parseInt("" + f[2], 10),
            blue: parseInt("" + f[3], 10)
        }
    }
    var d = V9.exec(t.substring(0, 50));
    if (d) {
        var p = parseInt("" + d[1], 10),
            y = parseInt("" + d[2], 10) / 100,
            g = parseInt("" + d[3], 10) / 100,
            x = "rgb(" + n1(p, y, g) + ")",
            v = wl.exec(x);
        if (!v) throw new vr(4, t, x);
        return {
            red: parseInt("" + v[1], 10),
            green: parseInt("" + v[2], 10),
            blue: parseInt("" + v[3], 10),
            alpha: parseFloat("" + d[4]) > 1 ? parseFloat("" + d[4]) / 100 : parseFloat("" + d[4])
        }
    }
    throw new vr(5)
}
var _9 = function(t) {
        return t.length === 7 && t[1] === t[2] && t[3] === t[4] && t[5] === t[6] ? "#" + t[1] + t[3] + t[5] : t
    },
    i1 = _9;

function Xn(e) {
    var t = e.toString(16);
    return t.length === 1 ? "0" + t : t
}

function o1(e, t, n) {
    if (typeof e == "number" && typeof t == "number" && typeof n == "number") return i1("#" + Xn(e) + Xn(t) + Xn(n));
    if (typeof e == "object" && t === void 0 && n === void 0) return i1("#" + Xn(e.red) + Xn(e.green) + Xn(e.blue));
    throw new vr(6)
}

function I9(e, t, n, r) {
    if (typeof e == "string" && typeof t == "number") {
        var i = m2(e);
        return "rgba(" + i.red + "," + i.green + "," + i.blue + "," + t + ")"
    } else {
        if (typeof e == "number" && typeof t == "number" && typeof n == "number" && typeof r == "number") return r >= 1 ? o1(e, t, n) : "rgba(" + e + "," + t + "," + n + "," + r + ")";
        if (typeof e == "object" && t === void 0 && n === void 0 && r === void 0) return e.alpha >= 1 ? o1(e.red, e.green, e.blue) : "rgba(" + e.red + "," + e.green + "," + e.blue + "," + e.alpha + ")"
    }
    throw new vr(7)
}

function y2(e, t, n) {
    return function() {
        var i = n.concat(Array.prototype.slice.call(arguments));
        return i.length >= t ? e.apply(this, i) : y2(e, t, i)
    }
}

function $9(e) {
    return y2(e, e.length, [])
}

function N9(e, t, n) {
    return Math.max(e, Math.min(t, n))
}

function j9(e, t) {
    if (t === "transparent") return t;
    var n = m2(t),
        r = typeof n.alpha == "number" ? n.alpha : 1,
        i = W({}, n, {
            alpha: N9(0, 1, +(r * 100 - parseFloat(e) * 100).toFixed(2) / 100)
        });
    return I9(i)
}
var z9 = $9(j9),
    eo = z9;
const B9 = q.header`
    display: flex;
    align-items: center;
`,
    U9 = q.div`
    padding: 1rem;
    display: flex;
    align-items: center;
    border-radius: 1rem;
    background: ${({theme:e})=>e.colors.primary}; 
`,
    Q9 = q.nav`
    display: flex;
    align-items: center;
    gap: 1.5rem;
    margin-left: 3rem;
`,
    Sl = q.span`
    color: #525252;
    font-size: 1.5rem;
    font-weight: 500;
    cursor: pointer;
    transition: color ease-in-out 0.2s;

    &:hover {
        color: ${({theme:e})=>e.colors.primary};
    }

    &:active {
        color: ${({theme:e})=>eo(.4,e.colors.primary)};
    }

    ${({$isSelected:e,theme:t})=>e&&Xi`
color: $ {
    t.colors.primary
};
`}
`, H9 = () => O("svg", {
    xmlns: "http://www.w3.org/2000/svg",
    width: "5.6rem",
    height: "2.2rem",
    viewBox: "0 0 56 22",
    fill: "none",
    children: O("path", {
        fillRule: "evenodd",
        clipRule: "evenodd",
        d: "M1.26595 10.6285C1.10977 10.838 0.713349 11.3875 0.635161 11.6865L2.23047 11.5856C2.53245 11.023 2.96249 10.7062 3.67978 10.4572C4.52436 10.1639 4.85563 10.3147 5.08491 9.95415C5.17027 9.81992 5.2443 9.71337 5.23335 9.51382C5.0205 9.45339 2.35228 9.6633 2.06993 9.74669C1.84141 9.81427 1.4414 10.3932 1.26595 10.6285ZM11.0374 16.7194C10.9171 16.7194 10.8197 16.8165 10.8197 16.9365C10.8197 17.0564 10.9171 17.1535 11.0374 17.1535C11.1577 17.1535 11.2552 17.0564 11.2552 16.9365C11.2552 16.8165 11.1577 16.7194 11.0374 16.7194ZM10.7913 17.5681C10.671 17.5681 10.5736 17.6652 10.5736 17.7851C10.5736 17.905 10.671 18.0022 10.7913 18.0022C10.9116 18.0022 11.0091 17.905 11.0091 17.7851C11.0091 17.6652 10.9116 17.5681 10.7913 17.5681ZM9.84135 17.537C9.72105 17.537 9.6236 17.6341 9.6236 17.754C9.6236 17.874 9.72105 17.9711 9.84135 17.9711C9.96166 17.9711 10.0591 17.874 10.0591 17.754C10.0591 17.6341 9.96166 17.537 9.84135 17.537ZM9.61397 16.7107C9.49366 16.7107 9.39621 16.8079 9.39621 16.9278C9.39621 17.0477 9.49366 17.1449 9.61397 17.1449C9.73427 17.1449 9.83172 17.0477 9.83172 16.9278C9.83172 16.8079 9.73427 16.7107 9.61397 16.7107ZM10.3432 16.2279C10.2229 16.2279 10.1254 16.325 10.1254 16.4449C10.1254 16.5649 10.2229 16.662 10.3432 16.662C10.4635 16.662 10.5609 16.5649 10.5609 16.4449C10.5609 16.325 10.4635 16.2279 10.3432 16.2279ZM45.0026 16.7194C44.8823 16.7194 44.7849 16.8165 44.7849 16.9365C44.7849 17.0564 44.8823 17.1535 45.0026 17.1535C45.123 17.1535 45.2204 17.0564 45.2204 16.9365C45.2204 16.8165 45.123 16.7194 45.0026 16.7194ZM44.7566 17.5681C44.6363 17.5681 44.5388 17.6652 44.5388 17.7851C44.5388 17.905 44.6363 18.0022 44.7566 18.0022C44.8769 18.0022 44.9743 17.905 44.9743 17.7851C44.9743 17.6652 44.8769 17.5681 44.7566 17.5681ZM43.8066 17.537C43.6863 17.537 43.5888 17.6341 43.5888 17.754C43.5888 17.874 43.6863 17.9711 43.8066 17.9711C43.9269 17.9711 44.0244 17.874 44.0244 17.754C44.0244 17.6341 43.9269 17.537 43.8066 17.537ZM43.5792 16.7107C43.4589 16.7107 43.3615 16.8079 43.3615 16.9278C43.3615 17.0477 43.4589 17.1449 43.5792 17.1449C43.6995 17.1449 43.797 17.0477 43.797 16.9278C43.797 16.8079 43.6995 16.7107 43.5792 16.7107ZM44.3084 16.2279C44.1881 16.2279 44.0906 16.325 44.0906 16.4449C44.0906 16.5649 44.1881 16.662 44.3084 16.662C44.4287 16.662 44.5262 16.5649 44.5262 16.4449C44.5262 16.325 44.4287 16.2279 44.3084 16.2279ZM11.9209 19.8907C11.7893 19.7548 11.2589 19.0752 11.5927 18.8531C11.9636 18.6061 12.4565 19.4487 12.4767 19.498C12.332 19.6686 12.1056 19.8147 11.9209 19.8907ZM13.4643 16.4574C12.0599 16.9871 12.2463 16.1714 12.6556 16.0052C12.8102 15.9423 13.1141 15.8229 13.2722 15.7938C13.3525 15.9694 13.4514 16.2123 13.4643 16.4574ZM9.054 19.4193C8.95296 19.5726 8.83379 19.7821 8.71556 19.8913C8.52122 19.8214 8.3131 19.6599 8.16314 19.4978C8.29667 19.1746 8.65097 18.7441 9.06929 18.8403C9.18223 19.0385 9.17487 19.2362 9.054 19.4193ZM41.1272 16.4617L41.3473 15.7975C41.6317 15.8939 42.3182 15.9865 42.2562 16.3973C42.1892 16.8429 41.4307 16.5443 41.1272 16.4619V16.4617ZM47.458 16.4779C47.021 16.5332 46.6954 16.7992 46.3666 16.5146C46.3111 16.2019 46.3932 16.1057 46.6297 16.0108C46.8038 15.9408 47.0578 15.8352 47.2331 15.8004C47.3691 15.9824 47.4208 16.2322 47.458 16.4779ZM43.9533 13.9093L44.6264 13.8992C44.8757 15.2164 43.7582 15.4195 43.9533 13.9093ZM42.1444 19.4978C42.2154 19.3401 42.697 18.5739 43.0542 18.8678C43.3378 19.1012 42.8868 19.6473 42.7131 19.8956C42.5286 19.8344 42.2576 19.6264 42.1446 19.498L42.1444 19.4978ZM8.26305 16.5332C7.81828 16.7678 7.67475 16.5671 7.15633 16.4719C7.20789 16.2219 7.28116 15.9969 7.37106 15.7889C7.95445 15.9218 8.32424 16.0713 8.26305 16.5332ZM9.98187 13.9058L10.6552 13.8999C10.7114 14.2407 10.726 14.9594 10.3175 14.9598C9.92615 14.9602 9.93012 14.2375 9.98187 13.9058ZM45.8833 19.9047C45.8004 19.7576 45.1622 19.0249 45.5974 18.8282C45.9131 18.6855 46.1286 19.0479 46.3137 19.2823C46.4418 19.4446 46.3923 19.3256 46.4557 19.4976C46.3247 19.6516 46.0761 19.8241 45.8835 19.9045L45.8833 19.9047ZM9.91652 16.0965L9.54295 16.3678C8.88874 16.0788 8.13481 15.8694 7.91234 15.3472C7.72555 14.9086 8.0808 14.7748 8.32896 14.5754C8.63076 14.3331 8.81679 14.2589 9.18091 14.0872C9.9203 14.4555 9.75995 15.28 9.91633 16.0965H9.91652ZM9.4134 20.194C9.21207 18.9013 9.7779 19.0223 10.0417 18.1492L10.5273 18.1481C10.658 18.4515 10.8708 18.7798 11.0482 19.0829C11.3764 19.6445 11.2448 19.6573 11.1568 20.2375C10.5673 20.3139 10.0045 20.4284 9.4134 20.194ZM9.38318 17.591C8.63794 18.4056 8.52311 18.8689 7.56257 18.8467C7.38031 18.3071 7.08531 17.9946 7.09929 17.2303C7.65152 16.7017 8.49837 17.0381 9.23285 17.1857C9.29385 17.3021 9.35579 17.4862 9.38318 17.5912V17.591ZM13.5547 17.2559C13.5283 17.8455 13.3009 18.5069 13.007 18.8917C12.7638 18.9163 12.5281 18.8691 12.3307 18.7798C11.9519 18.6087 11.5016 17.8356 11.2266 17.7224L11.3766 17.2584C11.7645 17.1885 12.1507 17.0705 12.5353 17.0144C13.1936 16.9184 13.1406 17.1183 13.5549 17.2559H13.5547ZM44.5041 18.1351C44.6555 18.6528 45.3071 19.204 45.2197 19.854C45.1558 20.3292 44.9772 20.2972 44.4952 20.3292C44.0784 20.3566 43.7817 20.2838 43.3909 20.2228C43.3224 19.6426 43.2308 19.5377 43.5207 19.0455C43.6789 18.7768 43.9269 18.4314 44.0155 18.156L44.5041 18.1351ZM46.9747 18.8969C46.3468 18.9295 46.1734 18.6925 45.9109 18.4449L45.2121 17.7051L45.3507 17.262C45.7196 17.1906 46.0933 17.0889 46.4614 17.0246C46.9734 16.9351 47.1681 17.0216 47.4969 17.2817C47.5948 17.8293 47.2165 18.5571 46.9747 18.8969ZM43.8978 16.1627C43.7159 16.2074 43.6765 16.2785 43.5624 16.3659C43.301 16.3064 42.8795 16.0848 42.6064 15.9681C42.0387 15.7254 41.6245 15.2343 41.9401 14.895C42.0349 14.7932 42.1677 14.6831 42.2982 14.5784C42.5093 14.4094 42.854 14.1891 43.2004 14.0893C43.4285 14.3284 43.6563 14.4126 43.7518 14.8766C43.8257 15.2358 43.8468 15.7655 43.8976 16.1627H43.8978ZM43.3679 17.591C43.2387 17.7531 43.1779 17.8122 42.9977 18.0069C42.6094 18.4263 42.3964 18.887 41.5979 18.847C41.2866 18.4854 41.0628 17.8111 41.0802 17.2301C41.3412 16.9845 41.717 16.8888 42.134 16.9602C42.4617 17.0163 42.8874 17.1162 43.2277 17.1957L43.3677 17.591H43.3679ZM45.1137 16.4129C45.0249 16.3446 44.8627 16.2557 44.7649 16.1479C44.8414 15.1411 44.8032 14.4982 45.4756 14.1138C45.8999 14.2648 46.3551 14.5905 46.6765 14.9001C47.1001 15.3083 46.4216 15.8235 46.0506 16.0044C45.769 16.1417 45.4223 16.2828 45.1137 16.4127V16.4129ZM11.1458 16.4092C11.0089 16.3354 10.9779 16.2685 10.7908 16.1995C10.831 15.2567 10.8319 14.5031 11.5077 14.1183C11.8104 14.2154 13.0286 14.8357 12.7827 15.3516C12.6227 15.6874 12.4333 15.8448 12.0848 16.0025C11.7957 16.1334 11.4157 16.3086 11.1456 16.4092H11.1458ZM40.9518 17.6253C41.3654 20.7388 45.8074 21.6588 47.3271 18.6129C48.665 15.9316 46.1407 13.149 43.5069 13.8214C41.7731 14.2642 40.7144 15.8382 40.9518 17.6253ZM48.7672 17.5394C48.7325 18.0748 48.4686 18.8514 48.2346 19.2574C47.38 20.7397 45.7658 21.767 43.8714 21.5635C41.5304 21.312 39.5646 19.2806 39.836 16.6633C40.0791 14.3194 42.1178 12.4282 44.7371 12.6642C47.1825 12.8849 48.9323 14.9929 48.7672 17.5394ZM7.69042 14.9703C5.38651 17.9602 8.71329 21.7644 11.9045 20.0967C13.2242 19.4069 14.3413 17.5099 13.3338 15.5652C12.9781 14.8789 12.3475 14.2723 11.6104 13.9841C10.2561 13.4543 8.58997 13.8032 7.69042 14.9705V14.9703ZM14.7816 17.5394C14.5549 19.8305 12.4771 21.8608 9.85307 21.5585C8.03793 21.3493 6.63413 20.1622 6.09097 18.6087C4.71776 14.6808 8.93331 11.2264 12.4986 13.2C12.9033 13.424 13.4597 13.8406 13.7249 14.1953C14.0599 14.6433 14.3004 14.9372 14.5444 15.5987C14.7553 16.1706 14.848 16.8672 14.7816 17.5394ZM42.3835 8.60494L41.6326 8.63317C41.5881 8.5221 41.5144 8.42271 41.4192 8.34195C41.26 8.20659 41.0405 8.12282 40.7988 8.12282C40.5571 8.12282 40.3376 8.20659 40.1784 8.34195C40.0655 8.43795 39.9825 8.55994 39.9431 8.69661L39.6855 8.70622C39.5818 8.71017 39.5 8.7979 39.504 8.90125C39.5079 9.0046 39.596 9.08592 39.6996 9.08216L39.9461 9.07293C39.9867 9.20565 40.0683 9.32387 40.1784 9.41762C40.3376 9.55298 40.5571 9.63675 40.7988 9.63675C41.0405 9.63675 41.26 9.55298 41.4192 9.41762C41.5471 9.309 41.6362 9.16725 41.6678 9.00836L42.3977 8.98107C42.5014 8.97711 42.5832 8.88939 42.5792 8.78604C42.5752 8.68268 42.4872 8.60117 42.3835 8.60512V8.60494ZM41.5218 8.63732L40.053 8.69247C40.09 8.58837 40.1571 8.49518 40.2454 8.42007C40.3865 8.30015 40.5822 8.22598 40.7988 8.22598C41.0154 8.22598 41.2111 8.30015 41.3522 8.42007C41.4247 8.48182 41.4829 8.55542 41.5218 8.6375V8.63732ZM40.0536 9.06879L41.561 9.01232C41.5301 9.13845 41.4558 9.2514 41.3522 9.3395C41.2111 9.45942 41.0154 9.53359 40.7988 9.53359C40.5822 9.53359 40.3865 9.45942 40.2454 9.3395C40.1574 9.26476 40.0908 9.17214 40.0536 9.06898V9.06879ZM42.0674 8.69266C42.0037 8.69266 41.9522 8.74405 41.9522 8.8075C41.9522 8.87094 42.0037 8.92233 42.0674 8.92233C42.131 8.92233 42.1826 8.87094 42.1826 8.8075C42.1826 8.74405 42.131 8.69266 42.0674 8.69266ZM29.4874 9.33875C29.4237 9.33875 29.3722 9.39014 29.3722 9.45358C29.3722 9.51702 29.4237 9.56842 29.4874 9.56842C29.551 9.56842 29.6026 9.51702 29.6026 9.45358C29.6026 9.39014 29.551 9.33875 29.4874 9.33875ZM28.2188 8.76872C27.9771 8.76872 27.7576 8.85249 27.5984 8.98784C27.4855 9.08385 27.4026 9.20584 27.3631 9.34251L27.1055 9.35211C27.0018 9.35607 26.92 9.44379 26.924 9.54714C26.9279 9.65049 27.016 9.73182 27.1196 9.72806L27.3661 9.71883C27.4067 9.85155 27.4883 9.96977 27.5984 10.0635C27.7576 10.1989 27.9771 10.2826 28.2188 10.2826C28.4605 10.2826 28.68 10.1989 28.8392 10.0635C28.9671 9.9549 29.0562 9.81315 29.0878 9.65426L29.8177 9.62696C29.9214 9.62301 30.0032 9.53528 29.9992 9.43193C29.9952 9.32858 29.9072 9.24707 29.8035 9.25102L29.0526 9.27926C29.0081 9.16819 28.9344 9.06879 28.8392 8.98803C28.68 8.85268 28.4605 8.7689 28.2188 8.7689V8.76872ZM27.6654 9.06597C27.8065 8.94605 28.0022 8.87188 28.2188 8.87188C28.4354 8.87188 28.6311 8.94605 28.7722 9.06597C28.8447 9.12771 28.9029 9.20132 28.9418 9.2834L27.473 9.33856C27.51 9.23445 27.5771 9.14127 27.6654 9.06616V9.06597ZM28.981 9.6584C28.9501 9.78453 28.8759 9.89748 28.7722 9.98559C28.6311 10.1055 28.4354 10.1797 28.2188 10.1797C28.0022 10.1797 27.8065 10.1055 27.6654 9.98559C27.5774 9.91085 27.5108 9.81823 27.4736 9.71507L28.981 9.65859V9.6584ZM55.5212 9.31333C55.5339 9.09496 55.4636 7.2706 55.3456 7.07726C55.3301 7.05203 54.9624 6.73219 54.9074 6.69548C54.6961 6.55486 52.2358 6.72861 51.8394 6.77794C51.4541 6.82594 50.6849 6.9468 50.6505 7.24085C50.6016 7.65972 52.0691 7.74349 52.88 8.30222C53.3299 8.61228 53.3144 8.68174 53.4523 9.31785L55.521 9.31314L55.5212 9.31333ZM40.9676 6.24857C41.0432 4.61585 40.8698 3.80786 40.3633 2.27623C40.2362 1.89163 40.0692 1.83177 39.6352 1.82838L36.2206 1.83007C35.7897 1.82913 33.1341 1.75157 32.8429 1.90443C32.5864 2.03904 32.5839 2.44227 32.5426 2.74781C32.4514 3.42194 32.3843 4.09589 32.298 4.76909C32.2221 5.36152 32.0842 6.26118 32.0821 6.81615L40.9676 6.24876V6.24857ZM19.7713 5.33497C20.3163 5.48614 20.3339 6.04582 20.2321 6.60531C20.0768 7.45772 19.7766 7.41216 19.3692 7.49066L19.2022 7.54187C19.3539 7.59966 28.5229 7.07444 29.396 6.96299C29.5576 6.67327 30.2353 3.37432 30.3567 2.78489C30.3909 2.61904 30.4638 2.37469 30.4757 2.22239C30.5155 1.71336 29.9661 1.87074 28.9926 1.93681C26.6499 2.09589 24.9511 2.37507 22.8359 3.42853L19.5616 5.26626L19.7713 5.33535V5.33497ZM46.9198 5.84213C47.5251 5.74706 48.2618 5.49066 48.6509 5.19115C49.221 4.75214 48.6932 4.5477 48.1103 3.98765L46.797 2.92665C46.0637 2.36453 45.9419 2.21618 45.2527 2.13768C43.824 1.97484 42.3344 1.87864 40.8734 1.88919L42.454 6.12225L46.92 5.84213H46.9198ZM30.5518 15.9688C30.5597 16.1673 30.4921 16.7721 30.6885 16.8798C30.7707 16.7405 30.7095 16.0969 30.6982 15.8922C30.6793 15.5472 30.6664 15.2045 30.6464 14.8602C30.5507 13.2207 30.3894 10.047 30.4787 8.62357C30.5762 7.07349 30.7701 7.4099 30.8634 6.8474C30.9911 6.07839 31.7275 1.51418 31.6706 1.38071C31.5244 1.41742 31.6141 1.28113 31.5371 1.53132L30.9975 5.02003C30.914 5.5494 30.836 6.36867 30.7093 6.88355C30.6434 7.15124 30.5048 7.33197 30.4309 7.69605C30.1193 9.23107 30.4678 13.8967 30.5514 15.969L30.5518 15.9688ZM55.0483 6.04544C55.0642 6.2657 54.9905 6.29375 54.8946 6.40727C55.1131 6.66216 55.2104 6.73633 55.5564 6.87188C55.6321 7.46901 55.6306 8.32594 55.6801 8.97297C55.7503 9.89146 55.4187 10.7441 55.7224 12.0662C55.7939 12.3779 55.96 12.6196 55.997 12.8982C56.0213 13.0822 55.892 14.8002 55.8446 14.9376C55.4045 16.2106 55.1939 16.6927 53.3546 16.8907C51.9965 17.037 50.989 17.4647 49.5863 17.5775C49.7106 16.5603 49.8103 15.7721 49.4913 14.7693C49.2078 13.8777 48.8743 13.377 48.3865 12.8337C47.2552 11.5739 45.4782 11.2015 43.7824 11.4289C41.1756 11.7787 39.6194 13.3489 39.0469 15.8741C38.7805 17.05 39.0063 17.5131 39.0845 18.6306C38.1051 18.5888 36.9515 18.6226 35.9623 18.64C35.3294 18.6511 34.8954 18.7356 34.5413 18.4916C34.0266 18.1371 33.9775 18.246 33.2221 18.2469L23.9137 18.2904C23.0763 18.2885 23.3532 18.6443 22.7804 18.6526C22.2659 18.6599 21.7428 18.653 21.2272 18.6541C20.0595 18.6567 20.4986 18.6931 20.019 18.3316C19.7801 18.1514 18.9169 18.2386 18.5382 18.2337C17.7484 18.2236 17.8249 18.5878 17.3012 18.6014C16.9584 18.6102 16.1253 18.6147 15.8143 18.56L15.4639 15.762C15.3208 14.8988 15.0188 14.1411 14.6093 13.5183C13.2374 11.4323 9.99679 11.0503 7.72272 12.0151C7.29249 12.1978 7.03017 12.3307 6.72742 12.5699C5.31343 13.6872 4.84071 15.1076 4.86545 16.9724C4.8713 17.4165 4.99142 18.0001 4.96346 18.3858C4.69679 18.3263 4.52172 18.4304 4.27885 18.3614C4.13871 18.3214 4.02313 18.226 3.74947 18.1579C3.34871 18.0579 2.94398 17.9611 2.55172 17.86C-0.204702 17.1492 0.612687 16.9668 0.427982 16.527C-0.0296273 15.4372 0.361504 16.0007 0.183219 15.2727C0.0294868 14.645 -0.0851523 14.4135 0.0833113 13.9848C0.156023 13.8 0.127883 13.7781 0.112586 13.5605C-0.0670208 11.0035 0.337139 11.7642 0.833087 11.0737C0.973599 10.8781 1.09334 10.6283 1.2212 10.4325C1.47408 10.0454 1.59722 10.0332 1.68542 9.91461C1.69203 9.90577 1.70014 9.89278 1.70619 9.88336C2.49789 8.64277 5.79502 8.00968 7.13442 7.76627C8.32915 7.54921 9.72351 7.38882 10.9401 7.29996C11.5844 7.2529 12.2514 7.13562 12.896 7.06691C13.5625 6.99593 14.2424 6.99349 14.9206 6.97974C15.5816 6.96638 15.7959 6.75177 16.4379 6.32255C17.7797 5.42552 21.8393 3.05052 23.2112 2.40519C23.9262 2.06897 24.0423 1.92345 24.6322 1.65594C27.2025 0.490275 31.3475 0.673822 34.2544 0.602474C36.5003 0.547316 44.4213 0.66215 46.7149 0.991029C48.3544 1.22616 48.4322 1.5347 49.2971 1.6213C50.7967 1.77153 49.9327 1.79073 50.3176 2.20018C50.3563 2.24122 50.5508 2.37356 50.6371 2.44717C51.7499 3.39653 52.4116 3.89691 53.5325 4.97315C53.7399 5.17214 54.4553 5.8858 54.5669 6.11924C54.8391 6.07839 54.806 5.98407 55.0485 6.04544H55.0483Z",
        fill: "white"
    })
}), W9 = ({
    onSearch: e,
    onMenuSelect: t,
    onClassTypeSelect: n,
    selectedMenu: r
}) => {
    const i = o => {
        t(o)
    };
    return oe(B9, {
        children: [O(U9, {
            children: O(H9, {})
        }), oe(Q9, {
            children: [O(Sl, {
                $isSelected: r === "all",
                onClick: () => i("all"),
                children: "TODOS OS VEICULOS"
            }), O(Sl, {
                $isSelected: r === "vips",
                onClick: () => i("vips"),
                children: "VIPS"
            }), O(Sl, {
                $isSelected: r === "myVehicles",
                onClick: () => i("myVehicles"),
                children: "MEUS VEÍCULOS"
            })]
        }), O(g9, {
            onClassTypeSelect: n,
            selectedMenu: r
        }), O(P9, {
            onSearch: e
        })]
    })
}, K9 = ({
    color: e
}) => oe("svg", {
    xmlns: "http://www.w3.org/2000/svg",
    width: "3.8rem",
    height: "3.8rem",
    viewBox: "0 0 41 41",
    fill: "none",
    children: [O("path", {
        d: "M23.5318 28.5684C19.8869 28.5684 16.2405 28.5684 12.5956 28.5684C12.2272 28.5684 11.865 28.5438 11.5809 28.2706C11.2203 27.9237 11.0955 27.5093 11.2438 27.0319C11.3889 26.5653 11.7324 26.3258 12.2147 26.2737C13.6133 26.1202 15.0057 25.936 16.3669 25.5722C18.6178 24.9705 20.747 24.0956 22.7232 22.8677C24.9929 21.4571 26.9441 19.7073 28.6144 17.6428C29.6196 16.3995 30.4797 15.0733 31.1775 13.6428C32.0969 11.7564 32.74 9.78091 33.1272 7.72411C33.2755 6.93363 33.3566 6.13547 33.4737 5.34191C33.5596 4.75557 34.0091 4.37645 34.6101 4.37184C35.2158 4.36877 35.6856 4.76018 35.7793 5.33884C35.8043 5.49694 35.8105 5.65504 35.8105 5.81467C35.8105 12.9029 35.8105 19.9928 35.8105 27.081C35.8105 27.2913 35.8136 27.5031 35.7559 27.7073C35.6169 28.2 35.1861 28.5392 34.6632 28.5668C34.5726 28.5714 34.4821 28.5699 34.3916 28.5699C30.7716 28.5699 27.1517 28.5699 23.5334 28.5699L23.5318 28.5684Z",
        fill: e
    }), O("path", {
        d: "M4.1132 4.85227C3.61212 5.35573 3.14695 5.82388 2.67866 6.29203C2.48353 6.4885 2.25407 6.62511 1.96997 6.65734C1.43924 6.7172 0.974063 6.4839 0.752403 6.05105C0.518256 5.59518 0.602549 5.08098 0.980307 4.69571C1.21445 4.4578 1.45641 4.22603 1.69524 3.99118C2.585 3.11628 3.47476 2.24137 4.36452 1.368C4.98423 0.76017 5.64608 0.755565 6.26579 1.37107C7.37409 2.47161 8.50892 3.54759 9.59537 4.67115C9.91537 5.0027 10.0746 5.38029 9.9419 5.83923C9.71712 6.61743 8.754 6.93363 8.11399 6.42403C7.82365 6.19226 7.56921 5.91597 7.30541 5.65197C7.05253 5.40024 6.80745 5.1393 6.55926 4.88297C6.53896 4.89525 6.51867 4.90907 6.49838 4.92134V34.3182H36.4505C36.3568 34.2184 36.2897 34.1401 36.2164 34.0665C35.8043 33.6597 35.3859 33.2591 34.9785 32.8493C34.6335 32.5024 34.5508 32.0833 34.7053 31.6305C34.8567 31.19 35.1923 30.949 35.6544 30.8861C36.0977 30.8262 36.4411 31.0166 36.7455 31.3189C37.4152 31.9851 38.0927 32.6451 38.767 33.3082C39.1978 33.7318 39.6302 34.1555 40.0579 34.5807C40.6324 35.1532 40.6308 35.8147 40.0548 36.3827C38.9512 37.4709 37.8429 38.5546 36.7408 39.6428C36.4208 39.959 36.0571 40.1616 35.5935 40.0649C34.6647 39.8731 34.3151 38.8708 34.9473 38.1724C35.3984 37.672 35.8964 37.213 36.3725 36.7342C36.3927 36.7127 36.4318 36.705 36.4193 36.6589C36.3896 36.6144 36.3412 36.6298 36.2975 36.6298C26.0216 36.6298 15.7472 36.6298 5.47125 36.639C4.74696 36.639 4.12881 36.1969 4.12881 35.2591C4.1413 26.1616 4.13661 17.0657 4.13661 7.96817C4.13661 7.0687 4.13661 6.17077 4.13349 5.27131C4.13349 5.15465 4.17564 5.03493 4.1132 4.85074V4.85227Z",
        fill: e
    })]
}), q9 = ({
    color: e
}) => oe("svg", {
    xmlns: "http://www.w3.org/2000/svg",
    width: "3.8rem",
    height: "3.8rem",
    viewBox: "0 0 43 40",
    fill: "none",
    children: [O("path", {
        d: "M17.0995 38.879C17.1389 38.7741 17.2177 38.7515 17.2735 38.7063C18.2518 37.9333 19.286 37.233 20.2758 36.4778C20.6763 36.1728 21.0522 35.8485 21.2426 35.3611C21.5792 34.4946 21.3231 33.5038 20.5746 32.9374C20.0017 32.5033 19.414 32.0918 18.8329 31.6707C18.8132 31.6561 18.7952 31.6432 18.7853 31.5964C19.0316 31.619 19.2761 31.6432 19.5224 31.6642C21.9206 31.8691 24.1858 31.4318 26.3214 30.3329C28.503 29.2098 30.1953 27.5897 31.392 25.4854C32.1372 24.1751 32.6494 22.7664 32.8365 21.2673C33.1582 18.7016 32.7659 16.2585 31.5233 13.9525C30.0755 11.2657 27.8956 9.40679 25.0427 8.28045C24.5995 8.10617 24.153 7.94641 23.6868 7.83991C23.5128 7.79957 23.3585 7.71566 23.2124 7.61238C22.1077 6.82652 21.0325 6.00194 19.9508 5.18703C19.0857 4.5351 19.0595 3.53301 19.918 2.87463C20.9882 2.0565 22.0897 1.27709 23.1599 0.457348C23.4308 0.249184 23.6753 0.218524 23.9987 0.276616C28.2387 1.02213 31.868 2.90045 34.8539 5.94868C36.9813 8.12069 38.5735 10.63 39.5338 13.5023C39.9836 14.8513 40.2922 16.2375 40.4301 17.6559C40.5285 18.6725 40.5712 19.6875 40.5121 20.7057C40.3841 22.9536 39.8309 25.1014 38.9708 27.183C37.9744 29.5923 36.4691 31.6578 34.6175 33.4925C33.1221 34.9755 31.4101 36.1777 29.5141 37.1088C27.4902 38.1028 25.3464 38.7337 23.0943 39.0242C21.5824 39.2178 20.0755 39.2178 18.5637 39.0871C18.0779 39.0452 17.5969 38.95 17.0962 38.8773L17.0995 38.879Z",
        fill: e
    }), O("path", {
        d: "M13.4685 29.4922H3.42917C2.28834 27.6445 1.53818 25.6307 1.09497 23.5087C0.160963 19.0227 0.750259 14.7126 2.89076 10.6558C7.331 2.2453 15.9932 -0.472129 21.9042 0.0652249C21.6251 0.283071 21.3723 0.488008 21.1113 0.684876C20.5532 1.10282 19.9902 1.51592 19.4288 1.93063C18.8773 2.33728 18.4078 2.80202 18.2798 3.50558C18.1074 4.45442 18.3897 5.25803 19.1169 5.89382C19.5749 6.29401 20.0936 6.62159 20.5893 6.97821C20.7896 7.12183 20.98 7.28158 21.1721 7.4607C18.1566 7.33967 15.4777 8.22235 13.0926 10.0006C10.6879 11.7934 9.18589 14.1736 8.55884 17.0443C7.60021 21.4319 9.05785 26.2923 13.4702 29.4938L13.4685 29.4922Z",
        fill: e
    }), O("path", {
        d: "M8.97578 38.5998C6.90914 38.5998 4.8425 38.5998 2.77586 38.5998C2.14553 38.5998 1.72531 38.3206 1.60219 37.8075C1.56608 37.659 1.56116 37.5025 1.56116 37.3492C1.56116 35.4725 1.56444 33.5974 1.56116 31.7207C1.56116 31.2366 1.7368 30.8606 2.19313 30.6395C2.36056 30.5572 2.54441 30.5314 2.72826 30.5314C6.8402 30.5314 10.9538 30.5314 15.0657 30.5314C15.3957 30.5314 15.6698 30.6653 15.9259 30.8541C16.7482 31.4625 17.5706 32.0709 18.3947 32.676C18.8264 32.9923 19.2614 33.3037 19.6931 33.62C19.7916 33.6926 19.8884 33.7652 19.9787 33.8475C20.4121 34.2477 20.4383 34.827 20.046 35.2675C19.8835 35.4515 19.6865 35.5951 19.4895 35.7404C18.3881 36.5536 17.2784 37.354 16.1885 38.1818C15.7945 38.482 15.3792 38.6062 14.8851 38.603C12.9137 38.5901 10.9439 38.5982 8.97249 38.5982C8.97249 38.5982 8.97249 38.5998 8.97249 38.6014L8.97578 38.5998Z",
        fill: e
    }), O("path", {
        d: "M38.2042 30.9042C38.5735 31.164 38.9363 31.4109 39.2909 31.6691C40.1838 32.3178 41.0735 32.9713 41.9632 33.6248C42.1651 33.7733 42.3621 33.9266 42.4753 34.1606C42.6904 34.6043 42.6149 35.0174 42.2357 35.3369C42.019 35.5193 41.7843 35.6823 41.5561 35.8517C40.4826 36.6553 39.4255 37.4783 38.3355 38.2625C38.0121 38.4949 37.6707 38.6014 37.2718 38.5998C34.5305 38.5917 31.7892 38.5933 29.0479 38.5917C29.0168 38.5917 28.9839 38.5917 28.9396 38.5691C32.7594 36.8715 35.8454 34.3252 38.2009 30.9042H38.2042Z",
        fill: e
    })]
}), G9 = ({
    color: e
}) => oe("svg", {
    xmlns: "http://www.w3.org/2000/svg",
    width: "3.8rem",
    height: "3.8rem",
    viewBox: "0 0 40 40",
    fill: "none",
    children: [O("path", {
        d: "M16.5634 5.03983C16.5634 6.83999 16.5741 8.6386 16.5573 10.4388C16.5511 11.0823 17.0621 11.5339 17.5945 11.5815C18.2159 11.6384 18.8435 11.6322 19.4588 11.7535C21.4612 12.1468 23.2319 13.0008 24.731 14.4016C26.3912 15.9544 27.41 17.8636 27.8688 20.0785C27.99 20.6668 28.0207 21.2673 28.0406 21.8664C28.0606 22.4669 28.3767 22.9185 28.8892 23.0475C29.0748 23.0951 29.2682 23.0936 29.46 23.0951C31.1938 23.0951 32.9277 23.0982 34.6631 23.0997C34.7244 23.0997 34.7904 23.0813 34.8671 23.1397C34.8211 23.5252 34.7828 23.923 34.726 24.3193C34.4651 26.1502 33.9419 27.9012 33.1164 29.557C32.5517 30.6905 31.8597 31.7426 31.068 32.7318C30.5509 33.3754 29.974 33.959 29.3863 34.5366C28.8247 35.0864 28.2048 35.5687 27.5696 36.028C25.4061 37.5916 22.9802 38.5101 20.3625 38.9509C18.8895 39.1982 17.4073 39.252 15.9235 39.0723C13.9764 38.8357 12.106 38.3227 10.3476 37.4303C9.41006 36.9542 8.49556 36.4442 7.64397 35.8191C6.0436 34.6456 4.70101 33.2233 3.57323 31.5983C2.62191 30.2266 1.8409 28.7567 1.33762 27.1608C0.756086 25.3162 0.423123 23.4284 0.498309 21.4901C0.642541 17.7838 1.80561 14.4354 4.07498 11.4878C4.79614 10.5509 5.60476 9.68921 6.49931 8.91662C7.2573 8.26229 8.06439 7.66326 8.92672 7.15639C10.8616 6.01978 12.9392 5.26255 15.164 4.93078C15.6167 4.86319 16.0724 4.80636 16.5634 4.791V5.03983ZM17.6697 13.9147C13.6342 13.8148 9.64789 17.1586 9.68011 22.0476C9.70773 26.2654 13.0987 29.9686 17.7387 29.9855C22.1977 30.0024 25.7728 26.3022 25.7544 21.9293C25.736 17.4305 21.9997 13.8056 17.6682 13.9147H17.6697ZM9.55736 28.9088C8.85 28.9564 8.41117 29.4494 8.45413 30.1498C8.48942 30.7519 9.0372 31.2435 9.63561 31.2097C10.2724 31.1743 10.7787 30.6306 10.7419 30.0239C10.7005 29.3496 10.1865 28.8658 9.55736 28.9088ZM5.08767 21.9032C5.08767 22.5729 5.60016 23.0936 6.25228 23.0859C6.87064 23.0782 7.38159 22.5576 7.37392 21.9401C7.36778 21.2935 6.86143 20.7758 6.24461 20.782C5.58482 20.7897 5.08767 21.2704 5.08767 21.9032ZM25.8541 28.9057C25.1928 28.8996 24.6834 29.388 24.6803 30.0316C24.6773 30.6859 25.1851 31.2051 25.8342 31.2097C26.4418 31.2143 26.962 30.7013 26.9666 30.0961C26.9712 29.4218 26.494 28.9119 25.8541 28.9057ZM17.7265 32.2695C17.059 32.2726 16.5588 32.7625 16.5649 33.4061C16.5711 34.0666 17.0805 34.578 17.7265 34.5734C18.3433 34.5688 18.8558 34.0497 18.8527 33.4307C18.8481 32.7856 18.3448 32.2664 17.7265 32.2695ZM9.60953 14.9607C10.2279 14.956 10.7404 14.443 10.7419 13.824C10.7419 13.1943 10.2264 12.6598 9.61566 12.6613C8.95741 12.6613 8.45106 13.1574 8.45259 13.7964C8.45413 14.4584 8.95894 14.9653 9.60953 14.9607Z",
        fill: e
    }), O("path", {
        d: "M30.8133 20.3473C30.5141 17.2953 29.308 14.698 27.1568 12.5461C25.0133 10.4019 22.4294 9.18234 19.4035 8.88897C19.4035 8.68929 19.4035 8.5188 19.4035 8.34831C19.4035 6.02592 19.4035 3.70354 19.4035 1.38115C19.4035 0.995625 19.4603 0.633136 19.7503 0.342838C20.0342 0.058684 20.3733 -0.0488338 20.763 0.0202848C22.3373 0.298295 23.8978 0.6316 25.4153 1.14154C26.0551 1.35658 26.6873 1.59619 27.2995 1.87573C28.2831 2.32577 29.2528 2.79885 30.1688 3.38406C30.8087 3.79262 31.4347 4.21809 32.0285 4.68963C32.7988 5.30095 33.5153 5.97063 34.1843 6.691C36.3724 9.0441 37.8623 11.7935 38.786 14.8593C39.1604 16.1049 39.4258 17.3767 39.5977 18.6669C39.636 18.9557 39.722 19.2399 39.613 19.5348C39.4212 20.057 38.9977 20.3396 38.3548 20.3427C36.9647 20.3473 35.576 20.3427 34.1859 20.3458C33.121 20.3458 32.0561 20.3488 30.9928 20.3504C30.936 20.3504 30.8808 20.3504 30.8148 20.3504L30.8133 20.3473Z",
        fill: e
    }), O("path", {
        d: "M23.4267 21.9155C23.4191 24.8154 21.2019 27.4358 18.0257 27.6585C15.098 27.8643 12.1029 25.6264 11.9817 22.1259C11.8712 18.9511 14.3554 16.3169 17.5316 16.2186C20.8612 16.1157 23.4144 18.8036 23.4252 21.914L23.4267 21.9155ZM17.6866 25.3853C19.5953 25.4052 21.1451 23.8677 21.1466 21.9462C21.1466 19.8926 19.4388 18.4734 17.6635 18.4903C15.8714 18.5072 14.1375 20.0278 14.2603 22.172C14.3539 23.8048 15.7425 25.393 17.6866 25.3853Z",
        fill: e
    }), O("path", {
        d: "M17.7065 20.8065C18.3049 20.8096 18.8527 21.3503 18.8527 21.9416C18.8527 22.5637 18.3249 23.0875 17.7019 23.0813C17.082 23.0752 16.5619 22.5376 16.5634 21.9017C16.5634 21.3027 17.0851 20.8035 17.7065 20.8065Z",
        fill: e
    })]
}), Z9 = ({
    color: e
}) => oe("svg", {
    xmlns: "http://www.w3.org/2000/svg",
    width: "3.8rem",
    height: "3.8rem",
    viewBox: "0 0 43 38",
    fill: "none",
    children: [O("path", {
        d: "M17.3891 21.8227C17.474 20.2476 18.2383 19.0155 19.785 18.3312C21.2652 17.6769 22.9335 17.9932 24.0774 19.1721C25.3578 20.4907 26.3701 22.0225 27.394 23.5377C29.1306 26.1101 30.8189 28.7158 32.5388 31.2998C32.9568 31.9275 33.1915 32.5436 32.6121 33.1863C32.1376 33.7141 31.5215 33.6974 30.6657 33.1446C26.9178 30.7237 23.1516 28.3262 19.6002 25.6156C17.9752 24.3751 17.3825 23.3362 17.3891 21.8211V21.8227Z",
        fill: e
    }), O("path", {
        d: "M0.0399597 23.2047H7.78215C8.05687 23.5759 7.97695 24.0438 8.06187 24.4667C8.57468 27.0325 9.72352 29.2635 11.5067 31.175C12.3742 32.104 12.3675 32.6252 11.4917 33.5076C10.3795 34.6298 9.26732 35.752 8.14012 36.8576C7.44915 37.5352 6.75985 37.5502 6.10884 36.8875C2.47917 33.1846 0.471191 28.7324 0.0199798 23.5726C0.00998992 23.4677 0.0299698 23.3578 0.0399597 23.2063V23.2047Z",
        fill: e
    }), O("path", {
        d: "M35.4159 5.89212C33.5262 7.78521 31.708 9.60671 29.8449 11.4732C27.7786 9.78819 25.3528 8.79086 22.6072 8.48117V0.63076C27.5189 0.922132 31.7413 2.72698 35.4159 5.89212Z",
        fill: e
    }), O("path", {
        d: "M7.26933 5.84051C10.874 2.72698 15.0914 0.947107 20.0032 0.6241V8.47285C17.3275 8.79586 14.8833 9.74656 12.8487 11.4265C10.9906 9.56508 9.15909 7.73193 7.271 5.84051H7.26933Z",
        fill: e
    }), O("path", {
        d: "M0 20.6223C0.346317 15.7189 2.09622 11.4698 5.26136 7.85347C7.12115 9.71327 8.93765 11.5281 10.8241 13.4145C9.20072 15.4575 8.14678 17.89 7.88371 20.6223H0Z",
        fill: e
    }), O("path", {
        d: "M42.622 20.6223H34.7566C34.4353 17.9316 33.4729 15.4891 31.8146 13.4628C33.6727 11.603 35.4875 9.78653 37.3873 7.88511C40.5125 11.4465 42.2624 15.7039 42.622 20.6206V20.6223Z",
        fill: e
    }), O("path", {
        d: "M33.2814 35.8519C35.7623 33.9372 36.0603 32.1889 34.4952 29.7414C34.1239 29.1603 33.7576 28.5759 33.3747 27.9715C34.1256 26.4464 34.5435 24.848 34.7566 23.1997H42.6037C42.5005 25.4158 42.0343 27.5086 41.2634 29.5316C40.2327 32.2339 38.7076 34.6281 36.6946 36.7077C35.8405 37.5901 35.2395 37.5918 34.362 36.7527C34.0423 36.448 33.6827 36.1849 33.2831 35.8519H33.2814Z",
        fill: e
    })]
}), Y9 = q.div`
    flex: 1;
    padding: .5rem;
    border-radius: 1rem;
    background: #1F1F1F;

    input {
        width: 100%;
        height: 100%;
        border-radius: 0.5rem;
        background-color: transparent;
        border: none;
    }
`;

function X9(e) {
    if (e = e.replace(/^#/, ""), e.length === 3) e = e.split("").map(i => i + i).join("");
    else if (e.length !== 6) return null;
    const t = parseInt(e.slice(0, 2), 16),
        n = parseInt(e.slice(2, 4), 16),
        r = parseInt(e.slice(4, 6), 16);
    return {
        r: t,
        g: n,
        b: r
    }
}
const J9 = ({
        onColorChange: e
    }) => {
        const [t, n] = P.useState({
            hex: "#000000",
            rgb: null
        }), r = i => {
            const o = i.target.value,
                s = X9(o);
            n({
                hex: o,
                rgb: s
            }), e(s)
        };
        return O(Y9, {
            children: O("input", {
                type: "color",
                id: "colorPicker",
                value: t.hex,
                onChange: r
            })
        })
    },
    e7 = q(of.div)`
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0;
    background-color: rgba(0, 0, 0, .8);
    display: grid;
    place-items: center;
    z-index: 2;
`,
    t7 = q.div`
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0;
    z-index: 1;
`,
    n7 = q.div`
    padding: 2.4rem;
    border-radius: 0.8rem;
    background: rgba(17, 17, 17, 0.99);
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    z-index: 1;
`,
    r7 = ({
        children: e,
        onOpen: t,
        onClose: n
    }, r) => {
        const [i, o] = P.useState(!1), s = P.useCallback(u => {
            t && t(u), o(!0)
        }, [t]), a = P.useCallback(() => {
            o(!1), n && n()
        }, [n]);
        if (P.useImperativeHandle(r, () => ({
                openModal: s,
                closeModal: a
            })), !i) return null;
        const l = document.getElementById("app");
        return l ? y0.createPortal(oe(e7, {
            transition: {
                duration: .15
            },
            initial: {
                opacity: 0
            },
            animate: {
                opacity: 1
            },
            exit: {
                opacity: 0
            },
            children: [O(t7, {
                onClick: a
            }), O(n7, {
                children: e
            })]
        }), l) : null
    },
    i7 = P.forwardRef(r7),
    o7 = {
        Root: i7
    },
    s7 = q.div`
    width: 19.5rem;
    height: 100%;
    border-radius: 1rem;
    background: #1F1F1F;
    display: flex;
    align-items: center;
    gap: 1rem;
    padding: 0 1.5rem;
`,
    a7 = q.div`
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 0.5rem;

    span {
        color: #828282;
        font-size: 1.2rem;
        font-style: normal;
        font-weight: 500;
        line-height: 100%;
    }

    b {
        color: #FFF;
        font-size: 2rem;
        font-style: normal;
        font-weight: 800;
        line-height: 100%;
    }
`,
    l7 = e => e <= 30 ? "RUIM" : e > 30 && e <= 60 ? "MÉDIO" : e > 60 && e <= 80 ? "BOM" : "ÓTIMO",
    To = ({
        icon: e,
        label: t,
        value: n
    }) => {
        const r = i6(),
            i = l7(n);
        return oe(s7, {
            children: [O(e, {
                color: r.colors.primary
            }), oe(a7, {
                children: [O("span", {
                    children: t
                }), O("b", {
                    children: n ? i : "RUIM"
                })]
            })]
        })
    },
    u7 = "" + new URL("bg_showcase-54bd60b6.png", import.meta.url).href,
    c7 = q.section`
    width: 100%;
    margin-top: 1.5rem;
`,
    f7 = q.div`
    width: 100%;
    height: 28.6rem;
    border-radius: 1rem;
    border: 0.2rem solid ${({theme:e})=>e.colors.primary};
    background: url(${u7});
    background-size: 100% 100%;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
`,
    d7 = q.div`
    display: flex;
    align-items: center;
    gap: 1rem;
    left: 0;
    top: 0;
    margin: 2.4rem;
    position: absolute;

    b {
        color: ${({theme:e})=>e.colors.primary};
        font-size: 1.5rem;
        font-style: normal;
        font-weight: 400;
        text-transform: uppercase;
    }
`,
    h7 = q.div`
    width: max-content;
    height: 5rem;
    padding: 0 1.5rem;
    background-color: #FFF;
    border-radius: 1rem;
    display: flex;
    justify-content: center;
    align-items: center;

    span {
        color: ${({theme:e})=>e.colors.primary};
        font-size: 2.5rem;
        font-style: normal;
        font-weight: 900; 
        text-transform: uppercase;
    }
`,
    p7 = q.div`
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
    align-items: flex-start;
    gap: 1rem;
    position: absolute;
    left: 0;
    bottom: 0;
    margin: 2.4rem;
`,
    s1 = q.div`
    width: max-content;
    padding: 1.5rem;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
    align-items: flex-start;
    gap: 1rem;
    border-radius: 1rem;
    border: 0.1rem solid #525252;

    span {
        color: #828282;
        font-size: 15px;
        font-style: normal;
        font-weight: 300;
        line-height: 100%;
        text-transform: uppercase;
    }

    b {
        color: #FFF;
        font-size: 2rem;
        font-style: normal;
        font-weight: 900;
        line-height: 100%;
        text-transform: uppercase;
    }
`,
    m7 = q.img`
    height: 22.6rem;
`,
    Ro = q.button`
    padding: 0 2.5rem;
    height: 4.5rem  ;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 1rem;
    border: 0.2rem solid ${({theme:e})=>e.colors.primary};
    background-color: transparent;
    color: #FFF;
    font-size: 2rem;
    font-style: normal;
    font-weight: 500;
    transition: background 0.2s ease-in-out;

    &:hover {
        background: ${({theme:e})=>e.colors.primary};
    }

    &:active {
        background: ${({theme:e})=>eo(.4,e.colors.primary)};
    }
`,
    y7 = q.div`
    width: 100%;
    height: 7.8rem;
    margin-top: 1.5rem;
    display: flex;
    gap: 1rem;
`,
    v7 = q.span`
    color: #FFF;
    font-size: 1.8rem;
    font-style: normal;
    font-weight: 400;
    text-transform: uppercase;

    b {
        color: ${({theme:e})=>e.colors.primary};
    }
`,
    a1 = q.button`
    padding: 0 2.5rem;
    height: 4.5rem  ;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 1rem;
    border: 0.2rem solid ${({theme:e})=>e.colors.primary};
    background-color: transparent;
    color: #FFF;
    font-size: 2rem;
    font-style: normal;
    font-weight: 500;
    transition: background 0.2s ease-in-out;
    margin-top: 2.5rem;

    &:hover {
        background: ${({theme:e})=>e.colors.primary};
    }

    &:active {
        background: ${({theme:e})=>eo(.4,e.colors.primary)};
    }
`,
    g7 = q.div`
    display: flex;
    gap: 1rem;
`,
    l1 = q.div`
    display: flex;
    flex-direction: column;
    gap: 1rem;
    position: absolute;
    right: 0;
    bottom: 0;
    margin: 2.4rem;
`,
    C7 = ({
        selectedMenu: e
    }) => {
        const t = Aa(p => p.selectedVehicle),
            [n, r] = P.useState(null),
            {
                closeNUI: i
            } = n2(),
            o = P.useRef(null),
            a = Jh(async () => {
                const p = {
                    name: t.model,
                    color: n
                };
                return kr("comprarVeh", p)
            }, {
                onSuccess: () => {
                    i()
                },
                onError: () => {
                    console.log("Erro ao comprar veículo.")
                }
            }),
            u = Jh(async () => {
                const p = {
                    name: t.model
                };
                return kr("venderVeh", p)
            }, {
                onSuccess: () => {
                    i()
                },
                onError: () => {
                    console.log("Erro ao vender veículo.")
                }
            }),
            c = async () => {
                const p = {
                    name: t.model
                };
                return kr("testeDrive", p)
            }, f = p => {
                r(p)
            }, d = () => {
                e === "vips" ? window.invokeNative("openUrl", "https://luxuosarj.hydrus.gg/") : e === "all" ? a.mutate() : u.mutate()
            };
        return oe(H4, {
            children: [oe(c7, {
                children: [oe(f7, {
                    children: [oe(d7, {
                        children: [O(h7, {
                            children: O("span", {
                                children: t.name
                            })
                        }), O("b", {
                            children: t.classType
                        })]
                    }), oe(p7, {
                        children: [oe(s1, {
                            children: [O("span", {
                                children: "Estoque"
                            }), O("b", {
                                children: t.estoque || 0
                            })]
                        }), oe(s1, {
                            children: [O("span", {
                                children: "Valor"
                            }), oe("b", {
                                children: ["R$ ", t.preco.toLocaleString("pt-BR")]
                            })]
                        })]
                    }), O(m7, {
                        src: `http://189.127.165.210/carros/${t.model||"panto"}.png`
                    }), oe(l1, {
                        children: [e === "all" || e === "vips" ? O(Ro, {
                            onClick: () => {
                                var p;
                                return (p = o.current) == null ? void 0 : p.openModal()
                            },
                            children: "COMPRAR"
                        }) : null, e === "myVehicles" ? O(Ro, {
                            onClick: () => {
                                var p;
                                return (p = o.current) == null ? void 0 : p.openModal()
                            },
                            children: "VENDER"
                        }) : null, e !== "myVehicles" && O(Ro, {
                            onClick: c,
                            children: "TEST-DRIVE"
                        })]
                    }), e !== "vips" && O(l1, {
                        children: e !== "myVehicles" && O(Ro, {
                            onClick: c,
                            children: "TEST-DRIVE"
                        })
                    })]
                }), oe(y7, {
                    children: [O(To, {
                        icon: Z9,
                        label: "VELOCIDADE MAX.",
                        value: t.maxspeed * 100
                    }), O(To, {
                        icon: K9,
                        label: "ACELERAÇÃO",
                        value: t.acceleration * 100
                    }), O(To, {
                        icon: G9,
                        label: "FREIOS",
                        value: t.braking * 100
                    }), O(To, {
                        icon: q9,
                        label: "AGILIDADE",
                        value: t.agility * 100
                    }), O(J9, {
                        onColorChange: f
                    })]
                })]
            }), oe(o7.Root, {
                ref: o,
                children: [oe(v7, {
                    children: ["Você deseja ", e === "myVehicles" ? "vender" : "comprar", " o veículo ", O("b", {
                        children: t.name
                    }), " por ", oe("b", {
                        children: ["R$ ", t.preco.toLocaleString("pt-BR")]
                    }), "?"]
                }), oe(g7, {
                    children: [O(a1, {
                        onClick: () => {
                            var p;
                            return (p = o.current) == null ? void 0 : p.closeModal()
                        },
                        children: "CANCELAR"
                    }), O(a1, {
                        onClick: d,
                        children: "CONFIRMAR"
                    })]
                })]
            })]
        })
    },
    w7 = q.div`
    width: 16rem;
    height: 16.9rem;
    border-radius: 1rem;
    background: #1F1F1F;
    position: relative;
    display: flex;
    flex-direction: column;
    align-items: center;
    cursor: pointer;
    box-shadow: 0 0 0 0.2rem transparent; 
    transition: box-shadow 0.2s ease-in-out;

    &:hover {
        box-shadow: 0 0 0 0.2rem ${({theme:e})=>e.colors.primary};
    }

    &:active {
        box-shadow: 0 0 0 0.2rem ${({theme:e})=>eo(.5,e.colors.primary)};
    }

    ${({$isSelected:e,theme:t})=>e&&`
box - shadow: 0 0 0 0.2 rem $ {
    t.colors.primary
};
`}
`, S7 = q.div`
    width: 100%;
    height: 13rem;
    background: #292929;
    border-top-right-radius: 1rem;
    border-top-left-radius: 1rem;
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;

    img {
        height: 7rem;
    }
`, x7 = q.div`
    width: 14rem;
    height: 2rem;
    background-color: ${({theme:e})=>e.colors.primary};
    position: absolute;
    bottom: 0;
    transform: translateY(50%);
    border-radius: 0.5rem;
    display: flex;
    justify-content: center;
    align-items: center;

    span {
        color: #FFF;
        font-size: 1.5rem;
        font-style: normal;
        font-weight: 800;
        text-transform: uppercase;
    }
`, P7 = q.span`
    color: #858585;
    font-size: 1.3rem;
    font-style: normal;
    font-weight: 300;
    bottom: .5rem;
    position: absolute;
    text-transform: uppercase;
`, k7 = ({
    vehicle: e
}) => {
    const {
        selectedVehicle: t,
        setSelectedVehicle: n
    } = Aa(o => ({
        selectedVehicle: o.selectedVehicle,
        setSelectedVehicle: o.setSelectedVehicle
    })), r = () => {
        n(e)
    }, i = typeof e.name == "string" ? e.name : "Nome Indisponível";
    return oe(w7, {
        onClick: r,
        $isSelected: (t == null ? void 0 : t.model) === e.model,
        children: [oe(S7, {
            children: [O("img", {
                src: `http://189.127.165.210/carros/${e.model||"panto"}.png`
            }), O(x7, {
                children: O("span", {
                    children: i.length > 10 ? i.slice(0, 10) : i
                })
            })]
        }), O(P7, {
            children: O("span", {
                children: e.classType
            })
        })]
    })
}, E7 = P.memo(k7), T7 = mf(e => ({
    vehicles: [],
    tempo: 0,
    priceTest: 0,
    setVehicleData: t => e({
        ...t
    })
})), R7 = (e, t, n, r) => e.sort((i, o) => i.name.localeCompare(o.name)).filter(i => t === "vips" ? i.class === "vip" : r === "todos" ? i.class !== "vip" : ["CARROS", "MOTOS"].includes(r.toUpperCase()) ? i.class.toLowerCase() === r.toLowerCase() : ["SEDANS", "SUVS", "SPORTS", "TRUCKS"].includes(r.toUpperCase()) ? i.classType.toLowerCase() === r.toLowerCase() : !0).filter(i => i.name.toLowerCase().includes(n.toLowerCase())).sort((i, o) => i.name.localeCompare(o.name)), A7 = (e, t, n) => {
    const {
        data: r
    } = e1("requestConce", () => kr("requestConce")), {
        data: i
    } = e1("requestMyVehicles", () => kr("requestMeus"), {
        enabled: e === "myVehicles",
        onSuccess: o => {
            if (o && o.veiculos.length > 0) {
                const s = [...o.veiculos].sort((a, l) => a.name.localeCompare(l.name));
                t(s[0])
            }
        }
    });
    return P.useEffect(() => {
        const o = s => {
            const a = s.filter(l => l.class !== "vip");
            if (a.length > 0) {
                const l = a.sort((u, c) => u.name.localeCompare(c.name));
                t(l[0])
            }
        };
        r && r.veiculos && r.veiculos.length > 0 && e !== "myVehicles" && o(r.veiculos), i && i.veiculos && i.veiculos.length > 0 && e === "myVehicles" && o(i.veiculos)
    }, [r, i, t, e]), {
        vehicles: (r == null ? void 0 : r.veiculos) || [],
        myVehicles: (i == null ? void 0 : i.veiculos) || []
    }
}, M7 = () => {
    T7(d => d.setVehicleData);
    const {
        isVisible: e
    } = n2(), [t, n] = P.useState("all"), [r, i] = P.useState(""), [o, s] = P.useState("todos"), {
        setSelectedVehicle: a
    } = Aa(d => ({
        setSelectedVehicle: d.setSelectedVehicle
    })), {
        vehicles: l,
        myVehicles: u
    } = A7(t, a), c = P.useMemo(() => t === "myVehicles" ? u : l, [t, u, l]), f = P.useMemo(() => R7(c, t, r, o), [c, t, r, o]);
    return P.useEffect(() => {
        e || (n("all"), i(""))
    }, [o, e]), e ? O(r8, {
        children: O(o6, {
            transition: {
                duration: .15
            },
            initial: {
                opacity: 0
            },
            animate: {
                opacity: 1
            },
            exit: {
                opacity: 0
            },
            id: "app",
            children: oe(s6, {
                children: [O(W9, {
                    onSearch: i,
                    onMenuSelect: n,
                    selectedMenu: t,
                    onClassTypeSelect: s
                }), O(C7, {
                    selectedMenu: t
                }), O(a6, {}), O(l6, {
                    children: f.map(d => O(E7, {
                        vehicle: d
                    }, d.model))
                })]
            })
        })
    }) : null
}, O7 = r6`
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        -webkit-font-smoothing: antialiased;
        user-select: none;
        font-family: "Poppins", sans-serif;
    }

    html {
        font-size: 62.5%;
    }   

    body {
        width: 100vw;
        height: 100vh;
    }

    input[type=number]::-webkit-inner-spin-button { 
        -webkit-appearance: none;
    
    }

    input[type=number] { 
        -moz-appearance: textfield;
        appearance: textfield;
    }

    input[type="color"] {
        padding: 0;
        border: none;
    }

    input[type="color"]::-webkit-color-swatch {
        border: none;
        border-radius: 1rem;
    }

    button {
        cursor: pointer;
        border: none;
        outline: none;
    }

    img {
        -webkit-user-drag: none;
        -khtml-user-drag: none;
        -moz-user-drag: none;
        -o-user-drag: none;
        user-drag: none;
    }

    ::-webkit-scrollbar {
        width: 0.3rem;
    }

    ::-webkit-scrollbar-track {
        background: ${({theme:e})=>eo(.6,e.colors.primary)};
        border-radius: 0.5rem;
    }

    ::-webkit-scrollbar-thumb {
        background: ${({theme:e})=>e.colors.primary};
        border-radius: 0.5rem;
    }
    
    @media (max-width: 3840px) {
        html {
            font-size: 140%;
        }
    }

    @media (max-width: 3440px) {
        html {
            font-size: 100%;
        }
    }

    @media (max-width: 3200px) {
        html {
            font-size: 130%;
        }
    }

    @media (max-width: 2560px) {
        html {
            font-size: 85%;
        }
    }

    @media (max-width: 2160px) {
        html {
            font-size: 78%;
        }
    }

    @media (max-width: 1920px) {
        html {
            font-size: 62.5%;
        }
    }

    @media (max-width: 1600px) {
        html {
            font-size: 55%;
        }
    }

    @media (max-width: 1366px) {
        html {
            font-size: 50%;
        }
    }

    @media (max-width: 1280px) {
        html {
            font-size: 45%;
        }
    }

    @media (max-width: 850px) {
        html {
            font-size: 33%;
        }
    }
`, F7 = {
    colors: {
        primary: "#1e29fa"
    }
}, L7 = new i9, b7 = xl.createRoot(document.getElementById("root"));
b7.render(O(ce.StrictMode, {
    children: O(c9, {
        client: L7,
        children: oe(t6, {
            theme: F7,
            children: [O(O7, {}), O(M7, {})]
        })
    })
}));
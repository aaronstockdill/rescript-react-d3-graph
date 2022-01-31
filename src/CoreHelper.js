export const duplicate = o => {
    if (o === null) {
        return null
    }
    let p = {}
    for (const [key, value] of Object.entries(o)) {
        if (typeof value === "function") {
            p[key] = value;
        } else if (value === undefined) {
            p[key] = undefined;
        } else if (value === null) {
            p[key] = null;
        } else if (typeof value === "object") {
            p[key] = duplicate(value);
        } else {
            p[key] = JSON.parse(JSON.stringify(value));
        }
    }
    return p;
}

export const readKey = (o, k) => { return o[k]; }

export const setKey = (o, k, v) => {
    var p = duplicate(o);
    p[k] = v;
    return p;
}

export const dropUndefinedKeys = o => {
    var p = duplicate(o);
    Object.keys(p).forEach(key => {
        if (p[key] === undefined) {
            delete p[key];
        }
    });
    return p;
}

export const pack = (a, b) => {
    var x = duplicate(a);
    var y = duplicate(b);
    var c = {...x, ...y};
    return c;
}

export const readKey = (o, k) => { return o[k]; }

export const setKey = (o, k, v) => {
    var p = {...o};
    p[k] = v;
    return p;
}

export const dropUndefinedKeys = o => {
    var p = {...o};
    Object.keys(p).forEach(key => {
        if (p[key] === undefined) {
            delete p[key];
        }
    });
    return p;
}

export const pack = (a, b) => {
    var c = {...a, ...b};
    return c;
}

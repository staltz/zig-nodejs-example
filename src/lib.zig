const std = @import("std");
const assert = std.debug.assert;
const c = @import("c.zig");
const translate = @import("translate.zig");

export fn napi_register_module_v1(env: c.napi_env, exports: c.napi_value) c.napi_value {
    translate.register_function(env, exports, "greet", greet) catch return null;
    return exports;
}

fn greet(env: c.napi_env, info: c.napi_callback_info) callconv(.C) c.napi_value {
    _ = info;
    return translate.create_string(env, "world") catch return null;
}

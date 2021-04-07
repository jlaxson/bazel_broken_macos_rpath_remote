load("rule.bzl", "generator_rule")

cc_binary(
    name="libgenlib.so",
    srcs=["lib.c"],
    linkshared=True
)

cc_library(
    name="genlib_import",
    srcs=["libgenlib.so"]
)

cc_binary(
    name="generator",
    srcs=["gen.c"],
    deps=[":genlib_import"]
)

generator_rule(
    name="my_generated_thing",
    out="my_thing.c"
)

cc_binary(
    name="final_product",
    srcs=[":my_generated_thing"]
)



platform(
    name = "macos",
    constraint_values = [
        "@platforms//os:macos",
        "@platforms//cpu:x86_64",
    ],
    exec_properties = {
        "xcode-version": "11.3.1_11C505",
        "OSFamily": "Darwin"
    }
)

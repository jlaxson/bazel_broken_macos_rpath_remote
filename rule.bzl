def _generator_rule_impl(ctx):
    ctx.actions.run(
        outputs=[ctx.outputs.out],
        executable=ctx.executable._generator,
        mnemonic="GeneratingAThing",
        arguments=[
            ctx.outputs.out.path
        ]
    )
    return [DefaultInfo(files=depset([ctx.outputs.out]))]

generator_rule = rule(
    implementation = _generator_rule_impl,
    fragments = ["cpp"],
    attrs = {
        "_cc_toolchain": attr.label(default = Label("@bazel_tools//tools/cpp:current_cc_toolchain")),
        "_generator": attr.label(default = Label("//:generator"), executable=True, cfg="exec"),
        "out": attr.output(),
    },
    toolchains = ["@bazel_tools//tools/cpp:toolchain_type"],
    incompatible_use_toolchain_transition = True,
)

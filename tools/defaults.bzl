"""Re-export of some bazel rules with repository-wide defaults."""
load("@build_bazel_rules_typescript//:defs.bzl", _ts_library="ts_library")
load("@angular//:index.bzl", _ng_module="ng_module", _ng_package="ng_package")
load("@build_bazel_rules_nodejs//:defs.bzl",
     _jasmine_node_test="jasmine_node_test", _npm_package="npm_package")

DEFAULT_TSCONFIG = "//:tsconfig.json"
PKG_GROUP_REPLACEMENTS = {}


def ts_library(tsconfig=None, node_modules=None, **kwargs):
    if not tsconfig:
        tsconfig = DEFAULT_TSCONFIG
    _ts_library(tsconfig=tsconfig, **kwargs)


def ts_test_library(node_modules=None, **kwargs):
    ts_library(testonly=1, **kwargs)


def jasmine_node_test(node_modules=None, bootstrap=None, deps=[], **kwargs):
    if not bootstrap:
        bootstrap = [
            "angular_testing_library/tools/testing/bootstrap_node_tests.js"]
    _jasmine_node_test(
        bootstrap=bootstrap,
        deps=["//tools/testing:node"] + deps,
        **kwargs
    )


def npm_package(name, **kwargs):
    _npm_package(
        name=name,
        replacements=PKG_GROUP_REPLACEMENTS,
        **kwargs)

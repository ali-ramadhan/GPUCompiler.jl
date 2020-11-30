using GPUCompiler

include("test/definitions/native.jl")

foo() = 0

kernel() = foo()

bar() = 42
GPUCompiler.CI_CACHE.overrides[foo] = [bar]

function main()
    @show kernel()

    native_code_llvm(kernel, Tuple{}; debuginfo=:none)
end

isinteractive() || main()

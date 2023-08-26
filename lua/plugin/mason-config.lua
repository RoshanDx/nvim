local status, mason = pcall(require, "mason")
if (not status) then return end

mason.setup {
    ensure_installed = {
        "lua_ls",
        "jdtls",
        "java-test",
        "java-debug-adapter",
        "google-java-format"
    },
}

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        roslyn_ls = {
          capabilities = {
            -- Disabled since, in large solutions, it hangs due to large number of watchers (one for each file)
            workspace = { didChangeWatchedFiles = { dynamicRegistration = false } },
          },
          settings = {
            ["csharp|background_analysis"] = {
              dotnet_analyzer_diagnostics_scope = "openFiles",
              dotnet_compiler_diagnostics_scope = "openFiles",
            },
          },
        },
      },
    },
  },
}

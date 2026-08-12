require("remote-nvim").setup({
    remote = {
        copy_dirs = {
            config = {
                base = vim.fn.stdpath("config"),
                dirs = "*",
                compression = {
                    enabled = true,
                    additional_opts = {
                        "--exclude-vcs",
                        --"--exclude=./.git",
                        "--exclude=./bin",
                    },
                },
            },
        },
    },

    client_callback = function(port, _)
        vim.fn.jobstart({
            "wt.exe",
            "-w", "0",
            "new-tab",
            "wsl.exe",
            "-d", vim.env.WSL_DISTRO_NAME,
            "--",
            "env",
            "-u", "NVIM",
            "-u", "NVIM_LISTEN_ADDRESS",
            vim.v.progpath,
            "--server", ("localhost:%s"):format(port),
            "--remote-ui",
        }, {
            detach = true,
        })
    end,
})

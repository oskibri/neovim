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
    client_callback = function(port, workspace_config)
        local cmd = ("kitty -e nvim --server localhost:%s --remote-ui"):format(port)
        vim.fn.jobstart(cmd, {
            detach = true,
            on_exit = function(job_id, exit_code, event_type)
                print("Client", job_id, "exited with code", exit_code, "Event type:", event_type)
            end,
        })
    end,
})

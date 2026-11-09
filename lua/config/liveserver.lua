local live_server_job = nil

vim.keymap.set("n", "<leader>ls", function()
  if live_server_job and vim.fn.jobwait({ live_server_job }, 0)[1] == -1 then
    -- Stop server
    vim.fn.jobstop(live_server_job)
    live_server_job = nil
    print("Live Server stopped")
  else
    -- Start server
    vim.cmd("write")

    live_server_job = vim.fn.jobstart({ "live-server" }, {
      on_exit = function()
        live_server_job = nil
      end,
    })

    if live_server_job <= 0 then
      live_server_job = nil
      print("Failed to start Live Server")
    else
      print("Live Server started")
    end
  end
end, { desc = "Toggle Live Server" })

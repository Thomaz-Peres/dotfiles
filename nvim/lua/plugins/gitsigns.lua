return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    signs_staged = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local map = function(keys, fn, desc)
        vim.keymap.set("n", keys, fn, { buffer = bufnr, desc = desc })
      end

      map("]h", gs.next_hunk, "Next Hunk")
      map("[h", gs.prev_hunk, "Prev Hunk")
      map("<leader>ghs", gs.stage_hunk, "Stage Hunk")
      map("<leader>ghr", gs.reset_hunk, "Reset Hunk")
      map("<leader>ghS", gs.stage_buffer, "Stage Buffer")
      map("<leader>ghR", gs.reset_buffer, "Reset Buffer")
      map("<leader>ghp", gs.preview_hunk, "Preview Hunk")
      map("<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
      map("<leader>ghd", gs.diffthis, "Diff This")
    end,
  },
}

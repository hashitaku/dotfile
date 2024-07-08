local M = {}

---@param opts toggle_comment.Config
function M.setup(opts)
    require("toggle_comment.config").setup(opts)
    require("toggle_comment.command").setup()
end

return M

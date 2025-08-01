local config = import("micro/config")
local shell = import("micro/shell")

function init()
    linter.makeLinter("mdlinter", "markdown", "markdownlint", {"%f","-f"}, "%f:%l:%c: %m", {}, false, false)
end





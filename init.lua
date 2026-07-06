-- ==========================
-- settings
-- ==========================
local CORNER_SIZE = 5
local cornerActive = false
local function clickClaudeMenuBarIcon()
    local app = hs.application.get("Claude")
    if not app then
        hs.alert.show("Приложение Claude не запущено", 1.5)
        return false
    end

    local axApp = hs.axuielement.applicationElement(app)
    if not axApp then return false end

    local extrasMenuBar = axApp:attributeValue("AXExtrasMenuBar")
    if not extrasMenuBar then
        hs.alert.show("Не нашёл трей-иконку Claude", 1.5)
        return false
    end

    local children = extrasMenuBar:attributeValue("AXChildren")
    if not children or #children == 0 then return false end
    local icon = children[1]
    local ok = icon:performAction("AXPress")

    return ok
end
mouseWatcher = hs.eventtap.new({hs.eventtap.event.types.mouseMoved}, function(e)
    local pos = hs.mouse.absolutePosition()
    local screen = hs.screen.mainScreen():fullFrame()

    local inCorner = pos.x >= (screen.w - CORNER_SIZE) and pos.y <= CORNER_SIZE

    if inCorner and not cornerActive then
        cornerActive = true
        clickClaudeMenuBarIcon()
    elseif not inCorner then
        cornerActive = false
    end
end)

mouseWatcher:start()

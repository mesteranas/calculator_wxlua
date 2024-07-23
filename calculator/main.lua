wx = require("wx")

frame = wx.wxFrame(wx.NULL, wx.wxID_ANY, "Calculator")
panel = wx.wxPanel(frame, -1)


wx.wxStaticText(panel, -1, "Enter the:")

calc = wx.wxTextCtrl(panel, -1)

getResult = wx.wxButton(panel, -1, "Get Result")

getResult:Connect(wx.wxEVT_COMMAND_BUTTON_CLICKED, function(evt)
    local code = "return " .. calc:GetValue()
    
    local func, err = loadstring(code)
    
    if func then
        local success, result = pcall(func)
        if success then
            wx.wxMessageBox(tostring(result), "Info")
        else
            wx.wxMessageBox("Error executing code: " .. tostring(result), "Error")
        end
    else
        wx.wxMessageBox("", "Error")
    end
end)

frame:Show(true)

wx.wxGetApp():MainLoop()

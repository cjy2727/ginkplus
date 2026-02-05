local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_REGEN_DISABLED")
f:RegisterEvent("PLAYER_REGEN_ENABLED")

f:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_REGEN_DISABLED" then
        GinkPlus:ShowText("▶▶전투시작◀◀")
    elseif event == "PLAYER_REGEN_ENABLED" then
        GinkPlus:ShowText("▶▶전투종료◀◀", {0.3, 1, 0.3, 1})
    end
end)

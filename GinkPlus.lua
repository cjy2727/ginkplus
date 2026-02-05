-- GinkPlus 공통 함수 테이블
GinkPlus = GinkPlus or {}

-- 메시지 출력 (애드온 공통)
function GinkPlus:Print(msg)
    DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[GinkPlus]|r " .. tostring(msg))
end

-- RGB 색상 코드 변환
function GinkPlus:RGBToHex(r, g, b)
    return string.format("|cff%02x%02x%02x", r*255, g*255, b*255)
end

-- 전투/알림 텍스트 표시 (공통)
function GinkPlus:ShowText(msg, color, yOffset, fontSize, persistent, blink)
    if persistent then
        if not self._persistentFrame then
            self._persistentFrame = CreateFrame("Frame", nil, UIParent)
            self._persistentFrame:SetSize(400, 60)
            self._persistentFrame:SetPoint("CENTER", UIParent, "CENTER", 0, yOffset or 200)
            self._persistentFrame:Hide()
            self._persistentFrame:SetFrameStrata("HIGH")
            self._persistentText = self._persistentFrame:CreateFontString(nil, "OVERLAY")
            self._persistentText:SetFont(STANDARD_TEXT_FONT or "Fonts\\2002.TTF", fontSize or 22, "OUTLINE")
            self._persistentText:SetPoint("CENTER")
            self._persistentText:SetJustifyH("CENTER")
            self._persistentText:SetJustifyV("MIDDLE")
        end
        local frame = self._persistentFrame
        local text = self._persistentText
        text:SetFont(STANDARD_TEXT_FONT or "Fonts\\2002.TTF", fontSize or 22, "OUTLINE")
        text:SetText(msg)
        if color then
            text:SetTextColor(unpack(color))
        else
            text:SetTextColor(1, 0.01, 0.04, 1)
        end
        frame:Show()
        frame:ClearAllPoints()
        frame:SetPoint("CENTER", UIParent, "CENTER", 0, yOffset or 200)
        frame:SetAlpha(1)
        if blink then
            local blinkTime = 0
            frame:SetScript("OnUpdate", function(self, elapsed)
                blinkTime = blinkTime + elapsed
                local alpha = 0.5 + 0.5 * math.sin(blinkTime * 4)
                self:SetAlpha(alpha)
            end)
        else
            frame:SetScript("OnUpdate", nil)
        end
        return
    end
    if not self._notifyFrame then
        self._notifyFrame = CreateFrame("Frame", nil, UIParent)
        self._notifyFrame:SetSize(400, 60)
        self._notifyFrame:SetPoint("CENTER", UIParent, "CENTER", 0, yOffset or 200)
        self._notifyFrame:Hide()
        self._notifyFrame:SetFrameStrata("HIGH")
        self._notifyText = self._notifyFrame:CreateFontString(nil, "OVERLAY")
        self._notifyText:SetFont(STANDARD_TEXT_FONT or "Fonts\\2002.TTF", fontSize or 22, "OUTLINE")
        self._notifyText:SetPoint("CENTER")
        self._notifyText:SetJustifyH("CENTER")
        self._notifyText:SetJustifyV("MIDDLE")
    end
    local frame = self._notifyFrame
    local text = self._notifyText
    text:SetFont(STANDARD_TEXT_FONT or "Fonts\\2002.TTF", fontSize or 22, "OUTLINE")
    text:SetText(msg)
    if color then
        text:SetTextColor(unpack(color))
    else
        text:SetTextColor(1, 0.01, 0.04, 1)
    end
    frame:SetAlpha(0)
    frame:Show()
    frame:ClearAllPoints()
    frame:SetPoint("CENTER", UIParent, "CENTER", 0, yOffset or 200)
    local total = 0
    local duration = 1.0
    local startY = yOffset or 200
    local endY = yOffset or 200
    frame:SetScript("OnUpdate", function(self, elapsed)
        total = total + elapsed
        local progress = math.min(total / duration, 1)
        local y = startY + (endY - startY) * progress
        self:SetPoint("CENTER", UIParent, "CENTER", 0, y)
        self:SetAlpha(progress)
        if progress >= 1 then
            self:SetScript("OnUpdate", nil)
            C_Timer.After(0.7, function()
                local fadeTotal = 0
                local fadeDuration = 0.7
                frame:SetScript("OnUpdate", function(_, fadeElapsed)
                    fadeTotal = fadeTotal + fadeElapsed
                    local fadeProgress = math.min(fadeTotal / fadeDuration, 1)
                    frame:SetAlpha(1 - fadeProgress)
                    if fadeProgress >= 1 then
                        frame:SetScript("OnUpdate", nil)
                        frame:Hide()
                    end
                end)
            end)
        end
    end)
end

function GinkPlus:HideText()
    if self._persistentFrame then
        self._persistentFrame:Hide()
        self._persistentFrame:SetScript("OnUpdate", nil)
    end
end

-- 예시: GinkPlus:Print("테스트 메시지")

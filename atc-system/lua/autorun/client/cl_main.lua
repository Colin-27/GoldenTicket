net.Receive("MainATC", function()
    MainATCMenu()
end)
net.Receive("SendMenu", function()
    SendRequestMenu()
end)
net.Receive("RATCRegister", function()
    RATCRegisterMenu()
end)
net.Receive("RATCAnswerMenu", function()
    RATCAnswerMenu()
end)
net.Receive("SendCustomMessage", function()
    text = net.ReadString()
end)

net.Receive("HUDNotify", function (ply)
    ply:ChatPrint("[ATC] Eine Anfrage wurde eingereicht")
    ply:EmitSound("garrysmod/balloon_pop_cute.wav")
end)
-- Unnötiger Kommentar hinzugefügt
ply = LocalPlayer()

//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
                      ///  MAIN    ///                 
//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

function MainATCMenu()

    local frame = vgui.Create("XeninUI.Frame")
    frame:SetSize(600, 400)
    frame:Center()
    frame:SetTitle("ATC System")
    frame:SetVisible(true)
    frame:MakePopup()

    local button1 = vgui.Create("XeninUI.ButtonV2", frame)
    button1:SetSize(175, 100)
    button1:SetText("RATC")
    button1:SetPos(20, 50)
    button1:SetSolidColor(Color(40, 45, 45, 45))

    local button2 = vgui.Create("XeninUI.ButtonV2", frame)
    button2:SetSize(175, 100)
    button2:SetText("IATC")
    button2:SetPos(400, 50)
    button2:SetSolidColor(Color(40, 45, 45, 45))

    button1.DoClick = function()
        frame:Remove()
        timer.Simple(0.5, function()
            net.Start("RatcMainButton")
            net.SendToServer()
        end)
    end

    button2.DoClick = function()
        net.Start("IatcMainButton")
        net.SendToServer()
    end
end

function SendRequestMenu()
    local frame = vgui.Create("XeninUI.Frame")
    frame:SetSize(600, 400)
    frame:Center()
    frame:SetTitle("RATC Anfrage")
    frame:SetVisible(true)
    frame:MakePopup()

    local sendreq = vgui.Create("XeninUI.ButtonV2", frame)
    sendreq:SetSize(600, 50)
    sendreq:SetText("Anfrage Senden")
    sendreq:CenterVertical(0.9)
    sendreq:SetSolidColor(Color(0, 110, 255))

    local reason = vgui.Create("XeninUI.TextEntry", frame)
    reason:Center()
    reason:SetSize(300 , 30)
    reason:SetPos(150, 150)

    sendreq.DoClick = function()
    C = true
    local text = reason:GetText()
    net.Start("SendRequest")
    net.WriteString(text)
    net.SendToServer()
    end
end

//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
                      ///  RATC    ///                 
//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

function RATCRegisterMenu()

    local frame = vgui.Create("XeninUI.Frame")
    frame:SetSize(600, 400)
    frame:Center()
    frame:SetTitle("RATC Registrierung")
    frame:SetVisible(true)
    frame:MakePopup()

    local button = vgui.Create("XeninUI.ButtonV2", frame)
    button:SetSize(600, 50)
    button:CenterVertical(0.9)
    button:SetText("Registriere dich beim RATC")
    button:SetSolidColor(Color(0, 110, 255))

   -- local TABLE_REGRISTRY = {
     --   name = ply:Nick(),
     --   Rang = ply:GetRank(),
     --   steam = ply:SteamID64()
   -- }

    button.DoClick = function()
        net.Start("RATCRegisterServer")
        net.SendToServer()
    end

end

function RATCAnswerMenu()
    local frame = vgui.Create("XeninUI.Frame")
    frame:SetSize(600, 400)
    frame:SetPos(10 , 200)
    frame:SetTitle("RATC Kontrollpanel")
    frame:SetVisible(true)
    frame:MakePopup()

    local txt = vgui.Create("DLabel", frame)
    txt:CenterHorizontal(0.1)
    txt:CenterVertical(0.2)
    txt:SetColor(Color(255,255,255))
    txt:SetFont("XeninUI.Frame.Title")
    txt:SetText(text)
    txt:SizeToContents()

    local button = vgui.Create("XeninUI.ButtonV2", frame)
    button:SetSize(130 , 50)
    button:CenterHorizontal(0.67)
    button:CenterVertical(0.2)
    button:SetText("Akzeptieren")
    button:SetSolidColor(Color(81, 255, 0))

    local button2 = vgui.Create("XeninUI.ButtonV2", frame)
    button2:SetSize(130 , 50)
    button2:CenterHorizontal(0.89)
    button2:CenterVertical(0.2)
    button2:SetText("Ablehnen")
    button2:SetSolidColor(Color(255, 0, 0))
end


//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
                      ///  IATC    ///                 
//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

--[[ function IATCRegisterMenu()
    local frame = vgui.Create("XeninUI.Frame")
    frame:SetSize(600, 400)
    frame:Center()
    frame:SetTitle("IATC Registrierung")
    frame:SetVisible(true)
    frame:MakePopup()

    local button = vgui.Create("XeninUI.ButtonV2", frame)
    button:SetSize(600, 50)
    button:CenterVertical(0.9)
    button:SetText("Registriere dich beim IATC ")
    button:SetSolidColor(Color(0, 110, 255))

    button.DoClick = function()
    end

end

function IATCAnswerMenu()

    local frame = vgui.Create("XeninUI.Frame")
    frame:SetSize(600, 400)
    frame:Center()
    frame:SetTitle("IATC Registrierung")
    frame:SetVisible(true)
    frame:MakePopup()

    local button2 = vgui.Create("XeninUI.ButtonV2", frame)
    button2:SetSize(100, 50)
    button2:CenterHorizontal(0.8)
    button2:SetText("Akzeptieren")
    button2:SetSolidColor(Color(60, 255, 0))

    local button3 = vgui.Create("XeninUI.ButtonV2", frame)
    button3:SetSize(600, 50)
    button3:CenterHorizontal(0.9)
    button3:SetText("Ablehnen")
    button3:SetSolidColor(Color(255, 0, 0))
end ]]

--------HUD----------

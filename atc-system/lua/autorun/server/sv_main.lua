net.Receive("RatcMainButton", function(len, ply)
    net.Start("SendMenu")
    net.Send(ply)
end)

net.Receive("SendRequest", function(len)
    for k, v in pairs(ATC_SYS.Registry) do
        local ply = player.GetBySteamID64(k)

        if ply and IsValid(ply) then
            local RequestText = net.ReadString()
            net.Start("SendCustomMessage")
            net.WriteString(RequestText)
            net.Send(ply)
        end
    end

    ATC_SYS.Notify()
end)

net.Receive("RATCRegisterServer", function(len, ply)
    print("Registry Anfrage erhalten")

    if IsValid(ply) then
        --for i = 1, #ATC_SYS.Registry do
        if (ATC_SYS.Registry and ATC_SYS.Registry[ply:SteamID64()]) then
            --if table.HasValue(ATC_SYS.Registry.steamid, ply:SteamID64()) then
            ply:ChatPrint("Dieser Spieler existiert bereits!")

            return
        end

        --end
        ATC_SYS.Registry[ply:SteamID64()] = true
    end
end)

--PrintTable(ATC_SYS.Registry)
function ATC_SYS.Notify()
    for k, v in pairs(ATC_SYS.Registry) do
        local ply = player.GetBySteamID64(k)

        if ply and IsValid(ply) then
            net.Start("HUDNotify")
            net.Send(ply)
        end
    end
end
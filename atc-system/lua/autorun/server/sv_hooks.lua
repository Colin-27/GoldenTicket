hook.Add("PlayerSay", "t", function(ply, text, public)
    if (string.lower(text) == "!t") then
        net.Start("MainATC")
        net.Send(ply)

        return ""
    end
end)

hook.Add("PlayerSay", "z", function(ply, text, public)
    if (string.lower(text) == "!z") then
        //PrintTable(ATC_SYS.Registry)
        net.Start("RATCAnswerMenu")
        net.Send(ply)

        return ""
    end
end)

hook.Add( "PlayerDisconnected", "ATC_SYS_Playerleave", function(ply)
    if ATC_SYS.Registry[ply:SteamID64()] then
        ATC_SYS.Registry[ply:SteamID64()] = nil
    end
end )
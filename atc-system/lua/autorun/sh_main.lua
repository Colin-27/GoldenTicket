ATC_SYS = ATC_SYS or {}

ATC_SYS.Registry = ATC_SYS.Registry or {}

C = C or false

--ATC_SYS.Registry = {
  --  [1] = {
    --    name = "Colin"
    --    steamid = "67436432654"
    --    datum = "07.12.2021"
    --}
--}

hook.Add("loadCustomDarkRPItems", "GoldenTicket_setup_config", function()
    ATC_SYS.ALLOWLIST = ATC_SYS.ALLOWLIST or {}

    ATC_SYS.ALLOWLIST = {
        [TEAM_JEDIWACHE] = true,
        [TEAM_JEDIBASTILASHAN] = true
    }
end)

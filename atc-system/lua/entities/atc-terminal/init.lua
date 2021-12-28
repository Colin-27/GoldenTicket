AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    //self:SetModel("models/fyu/cedi/misc/v4/misc_8.mdl")
    self:SetModel("models/props_c17/FurnitureCupboard001a.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_NONE)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
end

function ENT:Use(activator, caller)

   if activator:IsValid() and activator:IsPlayer() and ATC_SYS.ALLOWLIST[activator:Team()] then
      net.Start("RATCRegister")
      net.Send(activator)
   else
      activator:ChatPrint("Du bist nicht befugt die RATC Kontrollen zu übernehmen!")
   end
end

function ENT:Think()
end

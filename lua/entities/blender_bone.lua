AddCSLuaFile()
ENT.Type			= "anim"
ENT.Base			= "base_anim"
ENT.PrintName	   	= "Blender Skull"
ENT.Category = "Let's Blend"

ENT.RenderGroup = RENDERGROUP_BOTH
ENT.Spawnable		= true

if SERVER then
    function ENT:Initialize()

        self:SetModel( 'models/gibs/hgibs.mdl' )
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        local phys = self:GetPhysicsObject()

        if !phys:IsValid() then 
            phys:Wake()
        end
    end
end
if CLIENT then
    function ENT:Draw()
        self:DrawModel()
    end
end

function ENT:Use( ply )
    ply:PickupObject( self )
end
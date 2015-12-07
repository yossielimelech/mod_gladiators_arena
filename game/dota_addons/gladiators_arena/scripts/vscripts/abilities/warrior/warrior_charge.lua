LinkLuaModifier("modifier_warrior_charge_travel", "abilities/warrior/modifiers/modifier_warrior_charge_travel", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_warrior_charge_stun", "abilities/warrior/modifiers/modifier_warrior_charge_stun", LUA_MODIFIER_MOTION_NONE)

warrior_charge = class({})

function warrior_charge:OnSpellStart()
	local ability = self
	local caster = ability:GetCaster()
	local target = ability:GetCursorTarget()

	local lookup_radius = ability:GetSpecialValueFor("lookup_radius")
	local stun_duratioin = ability:GetSpecialValueFor("stun_duration") 
	
	ApplyUnitModifier(caster,nil, 	"modifier_movespeed_cap", {})
	caster:AddNewModifier(caster, 	nil, "modifier_warrior_charge_travel",{})
	target:AddNewModifier(caster, nil, "modifier_warrior_charge_stun", {duration = stun_duratioin })
	caster:MoveToNPC(target)

	Timers:CreateTimer(0.03, function()
		local surrounding_units = FindUnitsInRadius( target:GetTeamNumber() , caster:GetAbsOrigin(), nil, lookup_radius ,DOTA_UNIT_TARGET_TEAM_FRIENDLY,  DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)

		for k,v in pairs(surrounding_units) do
			if v == target then
				caster:RemoveModifierByName("modifier_warrior_charge_travel")
				return nil
			end
		end    
		return 0.03
		end)
end


function warrior_charge:CastFilterResultTarget( hTarget )
	
	local ability = self
	local caster = ability:GetCaster()


	if caster:HasModifier("modifier_in_combat_flag") then
		print('yeay i found flag')
		return UF_FAIL_CUSTOM
	end

	return UF_SUCCESS
end

function warrior_charge:GetCustomCastErrorTarget( hTarget )
 	return "#dota_hud_error_cant_cast_while_in_combat"
end
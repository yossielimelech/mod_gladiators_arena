function WarriorChargeToTarget(event)
	LinkLuaModifier("modifier_movespeed_cap", "libraries/modifiers/modifier_movespeed_cap", LUA_MODIFIER_MOTION_NONE)
	local caster = event.caster
	local target = event.target
	local ability = event.ability
	local stun_radius = ability:GetLevelSpecialValueFor("stun_radius", 1)
	
	ability:ApplyDataDrivenModifier(caster,caster,"modifier_warrior_charge_travel",{})
	caster:AddNewModifier(caster,nil, "modifier_movespeed_cap", {})
	
	Timers:CreateTimer(0.03, function()
		caster:MoveToNPC(target)
	end)
	
	Timers:CreateTimer(0.03, function()
		print("[warrior_charge] inside timer")
		local units = FindUnitsInRadius( target:GetTeamNumber() , caster:GetAbsOrigin(), nil, stun_radius ,DOTA_UNIT_TARGET_TEAM_FRIENDLY,  DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)

		for k,v in pairs(units) do
			if v == target then
				print("found him!")
				caster:RemoveModifierByName("modifier_warrior_charge_travel")
				caster:RemoveModifierByName("modifier_movespeed_cap")
				ability:ApplyDataDrivenModifier(caster, target, "modifier_warrior_charge_stun", {})
				return nil
			end
		end


		return 0.03
		end)

	print("[warrior_charge] out of the function")

end
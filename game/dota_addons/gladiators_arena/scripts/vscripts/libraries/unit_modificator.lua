 LinkLuaModifier("modifier_in_combat_flag", "libraries/modifiers/modifier_in_combat_flag", LUA_MODIFIER_MOTION_NONE)
 LinkLuaModifier("modifier_movespeed_cap", "libraries/modifiers/modifier_movespeed_cap", LUA_MODIFIER_MOTION_NONE)




 function ApplyUnitModifier(caster, source, modifier, keys)
 	caster:AddNewModifier(caster, nil, modifier, keys)
 end

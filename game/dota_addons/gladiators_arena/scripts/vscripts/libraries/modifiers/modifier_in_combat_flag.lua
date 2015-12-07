modifier_in_combat_flag = class({})

function modifier_in_combat_flag:IsHidden()
    return true
end

function modifier_in_combat_flag:DestroyOnExpire()
	return true
end

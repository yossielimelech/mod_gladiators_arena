modifier_warrior_charge_travel = class({})

function modifier_warrior_charge_travel:DeclareFunctions()
  local funcs = {
  MODIFIER_PROPERTY_MOVESPEED_BASE_OVERRIDE
}

return funcs
end

function modifier_warrior_charge_travel:CheckState()
  local states = {[MODIFIER_STATE_COMMAND_RESTRICTED] = true,
  [MODIFIER_STATE_ATTACK_IMMUNE] = true,
  [MODIFIER_STATE_NO_UNIT_COLLISION] =true}

  return states
end



function modifier_warrior_charge_travel:IsHidden()
  return true
end

function modifier_warrior_charge_travel:GetStatusEffectName()
  return "particles/status_fx/status_effect_gods_strength.vpcf"
end


function modifier_warrior_charge_travel:StatusEffectPriority()
  return 1
end

function modifier_warrior_charge_travel:GetModifierMoveSpeedOverride( params)
  return 1550
end




-- "modifier_warrior_charge_stun"
-- {

--  "Duration" "%stun_duration"             

--  "OnCreated"
--  {
--  "AttachEffect"
--  {
--  "EffectName" "particles/generic_gameplay/generic_stunned.vpcf"
--  "EffectAttachType" "follow_overhead"
--  "Target"            "TARGET"
-- }
-- }

-- "States"
-- {
--   "MODIFIER_STATE_STUNNED" "MODIFIER_STATE_VALUE_ENABLED"
-- }

-- }
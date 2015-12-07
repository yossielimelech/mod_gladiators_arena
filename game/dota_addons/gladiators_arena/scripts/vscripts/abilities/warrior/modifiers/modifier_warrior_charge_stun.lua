modifier_warrior_charge_stun = class({})


function modifier_warrior_charge_stun:DeclareFunctions()
  local funcs = {
    MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
  }
 
  return funcs
end

function modifier_warrior_charge_stun:CheckState()
  local states = {[MODIFIER_STATE_STUNNED] = true}

  return states
end


function modifier_warrior_charge_stun:GetEffectName()
  return "particles/generic_gameplay/generic_stunned.vpcf"
end

function modifier_warrior_charge_stun:GetEffectAttachType()
  return PATTACH_OVERHEAD_FOLLOW
end
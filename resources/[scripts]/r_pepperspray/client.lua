local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1
L0_1 = math
L0_1 = L0_1.floor
L1_1 = pairs
L2_1 = GetPlayerPed
L3_1 = -1
L2_1 = L2_1(L3_1)
L3_1 = vector3
L4_1 = 0.0
L5_1 = 0.0
L6_1 = 0.0
L3_1 = L3_1(L4_1, L5_1, L6_1)
L4_1 = 0.0
L5_1 = false
L6_1 = 200
L7_1 = false
L8_1 = false
L9_1 = false
L10_1 = true
L11_1 = 0
L12_1 = false
L13_1 = false
L14_1 = 1
L15_1 = 0
L16_1 = 500
L17_1 = {}
L18_1 = {}
pepperUse = nil
gassed = nil
L19_1 = {}
sprayQuantity = L19_1
function L19_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = ClearPrints
  L1_2()
  L1_2 = SetTextEntry_2
  L2_2 = "STRING"
  L1_2(L2_2)
  L1_2 = AddTextComponentString
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = DrawSubtitleTimed
  L2_2 = 10
  L3_2 = 1
  L1_2(L2_2, L3_2)
end
function L20_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L1_2 = L1_1
  L2_2 = A0_2
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = GetEntityModel
    L8_2 = GetPlayerPed
    L9_2 = -1
    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L8_2(L9_2)
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
    if L7_2 == L5_2 then
      L7_2 = 1
      L8_2 = A0_2[L5_2]
      L8_2 = #L8_2
      L9_2 = 1
      for L10_2 = L7_2, L8_2, L9_2 do
        L11_2 = L1_1
        L12_2 = A0_2[L5_2]
        L12_2 = L12_2[L10_2]
        L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
        for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
          L17_2 = GetPedDrawableVariation
          L18_2 = L2_1
          L19_2 = L15_2
          L17_2 = L17_2(L18_2, L19_2)
          if L17_2 == L16_2 then
            L17_2 = true
            return L17_2
          end
        end
      end
    end
  end
  L1_2 = false
  return L1_2
end
function L21_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L2_2 = 0.13
  L3_2 = 0.01
  L4_2 = 0.038
  L5_2 = 0.012
  L6_2 = GetSafeZoneSize
  L6_2 = L6_2()
  L6_2 = L6_2 - L2_2
  L7_2 = L2_2 / 2
  L6_2 = L6_2 + L7_2
  L7_2 = GetSafeZoneSize
  L7_2 = L7_2()
  L7_2 = L7_2 - L4_2
  L8_2 = L4_2 / 2
  L7_2 = L7_2 + L8_2
  L8_2 = L4_2 + 0.005
  L8_2 = 1 * L8_2
  L7_2 = L7_2 - L8_2
  L8_2 = HasStreamedTextureDictLoaded
  L9_2 = "timerbars"
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    L8_2 = RequestStreamedTextureDict
    L9_2 = "timerbars"
    L10_2 = true
    L8_2(L9_2, L10_2)
    while true do
      L8_2 = HasStreamedTextureDictLoaded
      L9_2 = "timerbars"
      L8_2 = L8_2(L9_2)
      if L8_2 then
        break
      end
      L8_2 = Wait
      L9_2 = 0
      L8_2(L9_2)
    end
  else
    L8_2 = DrawSprite
    L9_2 = "timerbars"
    L10_2 = "all_black_bg"
    L11_2 = L6_2
    L12_2 = L7_2
    L13_2 = L2_2
    L14_2 = 0.038
    L15_2 = 0
    L16_2 = 0
    L17_2 = 0
    L18_2 = 0
    L19_2 = 128
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  end
  if "" == A0_2 then
    textSize = 0.0816
    rectSupply = 0.015
  else
    textSize = 0.0516
    rectSupply = 0.03
  end
  L8_2 = DrawText
  L9_2 = A0_2
  L10_2 = GetSafeZoneSize
  L10_2 = L10_2()
  L10_2 = L10_2 - L2_2
  L10_2 = L10_2 + L3_2
  L11_2 = L7_2 - L5_2
  L12_2 = 0.32
  L8_2(L9_2, L10_2, L11_2, L12_2)
  if A1_2 < 0 then
    A1_2 = 0
  end
  if A1_2 > 100 then
    A1_2 = 100
    L8_2 = 100
    L11_1 = L8_2
  end
  L8_2 = textSize
  L8_2 = L8_2 * A1_2
  L2_2 = L8_2 / 100
  L8_2 = DrawRect
  L9_2 = rectSupply
  L9_2 = L6_2 + L9_2
  L10_2 = L7_2
  L11_2 = textSize
  L12_2 = 0.0105
  L13_2 = 155
  L14_2 = 155
  L15_2 = 155
  L16_2 = 200
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L8_2 = DrawRect
  L9_2 = rectSupply
  L9_2 = L6_2 + L9_2
  L10_2 = textSize
  L10_2 = L10_2 / 2
  L9_2 = L9_2 - L10_2
  L10_2 = L2_2 / 2
  L9_2 = L9_2 + L10_2
  L10_2 = L7_2
  L11_2 = L2_2
  L12_2 = 0.0105
  L13_2 = Config
  L13_2 = L13_2.Design
  L13_2 = L13_2.ProgressBar
  L13_2 = L13_2.color
  L13_2 = L13_2[1]
  L14_2 = Config
  L14_2 = L14_2.Design
  L14_2 = L14_2.ProgressBar
  L14_2 = L14_2.color
  L14_2 = L14_2[2]
  L15_2 = Config
  L15_2 = L15_2.Design
  L15_2 = L15_2.ProgressBar
  L15_2 = L15_2.color
  L15_2 = L15_2[3]
  L16_2 = 255
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
end
DrawTimerBar = L21_1
function L21_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2
  L6_2 = SetTextFont
  L7_2 = 0
  L6_2(L7_2)
  L6_2 = SetTextScale
  L7_2 = A3_2
  L8_2 = A3_2
  L6_2(L7_2, L8_2)
  L6_2 = SetTextColour
  L7_2 = 254
  L8_2 = 254
  L9_2 = 254
  L10_2 = 255
  L6_2(L7_2, L8_2, L9_2, L10_2)
  if A4_2 then
    L6_2 = SetTextWrap
    L7_2 = A1_2 - A5_2
    L8_2 = A1_2
    L6_2(L7_2, L8_2)
    L6_2 = SetTextRightJustify
    L7_2 = true
    L6_2(L7_2)
  end
  L6_2 = BeginTextCommandDisplayText
  L7_2 = "STRING"
  L6_2(L7_2)
  L6_2 = AddTextComponentSubstringPlayerName
  L7_2 = A0_2
  L6_2(L7_2)
  L6_2 = EndTextCommandDisplayText
  L7_2 = A1_2
  L8_2 = A2_2
  L6_2(L7_2, L8_2)
end
DrawText = L21_1
function L21_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = IsEntityPlayingAnim
  L3_2 = L2_1
  L4_2 = A0_2
  L5_2 = A1_2
  L6_2 = 3
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  if not L2_2 then
    L2_2 = RequestAnimDict
    L3_2 = A0_2
    L2_2(L3_2)
    while true do
      L2_2 = HasAnimDictLoaded
      L3_2 = A0_2
      L2_2 = L2_2(L3_2)
      if L2_2 then
        break
      end
      L2_2 = Citizen
      L2_2 = L2_2.Wait
      L3_2 = 100
      L2_2(L3_2)
    end
    L2_2 = TaskPlayAnim
    L3_2 = L2_1
    L4_2 = A0_2
    L5_2 = A1_2
    L6_2 = 8.0
    L7_2 = -8
    L8_2 = -1
    L9_2 = 51
    L10_2 = 0
    L11_2 = 0
    L12_2 = 0
    L13_2 = 0
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  end
end
function L22_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = 1
  L2_2 = GetNumberOfVehicleDoors
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = GetPedInVehicleSeat
    L6_2 = A0_2
    L7_2 = L4_2 - 2
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = L2_1
    if L5_2 == L6_2 then
      L5_2 = GetVehicleDoorAngleRatio
      L6_2 = A0_2
      L7_2 = L4_2 - 1
      L5_2 = L5_2(L6_2, L7_2)
      if L5_2 > 0.0 then
        L5_2 = true
        return L5_2
      end
    end
  end
  L1_2 = false
  return L1_2
end
GetDoorIsOpen = L22_1
function L22_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = ClearPedTasks
  L1_2 = L2_1
  L0_2(L1_2)
  L0_2 = StopGameplayCamShaking
  L1_2 = false
  L0_2(L1_2)
  L0_2 = ClearTimecycleModifier
  L0_2()
  L0_2 = ClearExtraTimecycleModifier
  L0_2()
  L0_2 = 0
  L1_2 = false
  L2_2 = nil
  L3_2 = false
  L4_2 = 1
  L5_2 = false
  L8_1 = L5_2
  L14_1 = L4_2
  L13_1 = L3_2
  gassed = L2_2
  L12_1 = L1_2
  L11_1 = L0_2
end
resetGassedPed = L22_1
function L22_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = IsPedInAnyVehicle
  L3_2 = L2_1
  L4_2 = false
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    L2_2 = 1
    L3_2 = Config
    L3_2 = L3_2.PepperSpray
    L3_2 = L3_2[A1_2]
    L3_2 = L3_2.sprayRange
    L4_2 = 1
    for L5_2 = L2_2, L3_2, L4_2 do
      L6_2 = GetOffsetFromEntityInWorldCoords
      L7_2 = A0_2
      L8_2 = 0.0
      L9_2 = L5_2 + 0.0
      L10_2 = 0.0
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
      L7_2 = GetEntityCoords
      L8_2 = L2_1
      L7_2 = L7_2(L8_2)
      L6_2 = L6_2 - L7_2
      L6_2 = #L6_2
      L7_2 = 0.8
      if L6_2 < L7_2 then
        L6_2 = true
        return L6_2
      end
    end
  else
    L2_2 = GetOffsetFromEntityInWorldCoords
    L3_2 = A0_2
    L4_2 = 0.0
    L5_2 = 0.5
    L6_2 = 0.0
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
    L3_2 = GetEntityCoords
    L4_2 = L2_1
    L3_2 = L3_2(L4_2)
    L2_2 = L2_2 - L3_2
    L2_2 = #L2_2
    L3_2 = 2.2
    if L2_2 < L3_2 then
      L2_2 = true
      return L2_2
    end
  end
  L2_2 = false
  return L2_2
end
function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L11_1
  if L1_2 < 50 then
    A0_2 = 1.5
  end
  L1_2 = L11_1
  if L1_2 < 25 then
    A0_2 = 2.0
  end
  L1_2 = StopGameplayCamShaking
  L2_2 = false
  L1_2(L2_2)
  L1_2 = ClearTimecycleModifier
  L1_2()
  L1_2 = ClearExtraTimecycleModifier
  L1_2()
  L1_2 = Config
  L1_2 = L1_2.PepperSpray
  L2_2 = gassed
  L1_2 = L1_2[L2_2]
  L1_2 = L1_2.effect
  L1_2 = L1_2.shakeCamera
  L1_2 = L1_2.name
  if nil ~= L1_2 then
    L1_2 = ShakeGameplayCam
    L2_2 = Config
    L2_2 = L2_2.PepperSpray
    L3_2 = gassed
    L2_2 = L2_2[L3_2]
    L2_2 = L2_2.effect
    L2_2 = L2_2.shakeCamera
    L2_2 = L2_2.name
    L3_2 = Config
    L3_2 = L3_2.PepperSpray
    L4_2 = gassed
    L3_2 = L3_2[L4_2]
    L3_2 = L3_2.effect
    L3_2 = L3_2.shakeCamera
    L3_2 = L3_2.intensity
    L3_2 = L3_2 / A0_2
    L1_2(L2_2, L3_2)
  end
  L1_2 = Config
  L1_2 = L1_2.PepperSpray
  L2_2 = gassed
  L1_2 = L1_2[L2_2]
  L1_2 = L1_2.effect
  L1_2 = L1_2.timecycle
  L1_2 = L1_2[1]
  if nil ~= L1_2 then
    L1_2 = SetExtraTimecycleModifierStrength
    L2_2 = Config
    L2_2 = L2_2.PepperSpray
    L3_2 = gassed
    L2_2 = L2_2[L3_2]
    L2_2 = L2_2.effect
    L2_2 = L2_2.timecycle
    L2_2 = L2_2[1]
    L2_2 = L2_2.opacity
    L2_2 = L2_2 / A0_2
    L1_2(L2_2)
    L1_2 = SetExtraTimecycleModifier
    L2_2 = Config
    L2_2 = L2_2.PepperSpray
    L3_2 = gassed
    L2_2 = L2_2[L3_2]
    L2_2 = L2_2.effect
    L2_2 = L2_2.timecycle
    L2_2 = L2_2[1]
    L2_2 = L2_2.name
    L1_2(L2_2)
  end
  L1_2 = Config
  L1_2 = L1_2.PepperSpray
  L2_2 = gassed
  L1_2 = L1_2[L2_2]
  L1_2 = L1_2.effect
  L1_2 = L1_2.timecycle
  L1_2 = L1_2[2]
  if nil ~= L1_2 then
    L1_2 = SetTimecycleModifierStrength
    L2_2 = Config
    L2_2 = L2_2.PepperSpray
    L3_2 = gassed
    L2_2 = L2_2[L3_2]
    L2_2 = L2_2.effect
    L2_2 = L2_2.timecycle
    L2_2 = L2_2[2]
    L2_2 = L2_2.opacity
    L2_2 = L2_2 / A0_2
    L1_2(L2_2)
    L1_2 = SetTimecycleModifier
    L2_2 = Config
    L2_2 = L2_2.PepperSpray
    L3_2 = gassed
    L2_2 = L2_2[L3_2]
    L2_2 = L2_2.effect
    L2_2 = L2_2.timecycle
    L2_2 = L2_2[2]
    L2_2 = L2_2.name
    L1_2(L2_2)
  end
end
function L24_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = Config
  L1_2 = L1_2.PepperSpray
  L2_2 = gassed
  L1_2 = L1_2[L2_2]
  L1_2 = L1_2.rubbingEnabled
  if L1_2 then
    L1_2 = IsControlPressed
    L2_2 = 0
    L3_2 = Config
    L3_2 = L3_2.Keys
    L3_2 = L3_2.RubbingKey
    L1_2 = L1_2(L2_2, L3_2)
    if L1_2 then
      L1_2 = L21_1
      L2_2 = "switch@trevor@floyd_crying"
      L3_2 = "console_end_loop_floyd"
      L1_2(L2_2, L3_2)
      L1_2 = true
      L13_1 = L1_2
      L14_1 = A0_2
    else
      L1_2 = IsControlJustReleased
      L2_2 = 0
      L3_2 = Config
      L3_2 = L3_2.Keys
      L3_2 = L3_2.RubbingKey
      L1_2 = L1_2(L2_2, L3_2)
      if L1_2 then
        L1_2 = ClearPedTasks
        L2_2 = L2_1
        L1_2(L2_2)
        L1_2 = L21_1
        L2_2 = "anim@heists@ornate_bank@thermal_charge"
        L3_2 = "cover_eyes_loop"
        L1_2(L2_2, L3_2)
        L1_2 = false
        L13_1 = L1_2
        L1_2 = 1
        L14_1 = L1_2
      end
    end
  end
end
function L25_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L11_1
  if L1_2 < 100 then
    gassed = A0_2
    L1_2 = L11_1
    L2_2 = Config
    L2_2 = L2_2.PepperSpray
    L3_2 = gassed
    L2_2 = L2_2[L3_2]
    L2_2 = L2_2.sprayDamageMultiplier
    L2_2 = 25 * L2_2
    L1_2 = L1_2 + L2_2
    L11_1 = L1_2
    L1_2 = L21_1
    L2_2 = "anim@heists@ornate_bank@thermal_charge"
    L3_2 = "cover_eyes_loop"
    L1_2(L2_2, L3_2)
    L1_2 = L8_1
    if not L1_2 then
      L1_2 = Config
      L1_2 = L1_2.PepperSpray
      L1_2 = L1_2[A0_2]
      L1_2 = L1_2.effect
      L1_2 = L1_2.shakeCamera
      L1_2 = L1_2.name
      if nil ~= L1_2 then
        L1_2 = ShakeGameplayCam
        L2_2 = Config
        L2_2 = L2_2.PepperSpray
        L2_2 = L2_2[A0_2]
        L2_2 = L2_2.effect
        L2_2 = L2_2.shakeCamera
        L2_2 = L2_2.name
        L3_2 = Config
        L3_2 = L3_2.PepperSpray
        L3_2 = L3_2[A0_2]
        L3_2 = L3_2.effect
        L3_2 = L3_2.shakeCamera
        L3_2 = L3_2.intensity
        L1_2(L2_2, L3_2)
      end
      L1_2 = Config
      L1_2 = L1_2.PepperSpray
      L1_2 = L1_2[A0_2]
      L1_2 = L1_2.effect
      L1_2 = L1_2.timecycle
      L1_2 = L1_2[1]
      if nil ~= L1_2 then
        L1_2 = SetExtraTimecycleModifierStrength
        L2_2 = Config
        L2_2 = L2_2.PepperSpray
        L2_2 = L2_2[A0_2]
        L2_2 = L2_2.effect
        L2_2 = L2_2.timecycle
        L2_2 = L2_2[1]
        L2_2 = L2_2.opacity
        L1_2(L2_2)
        L1_2 = SetExtraTimecycleModifier
        L2_2 = Config
        L2_2 = L2_2.PepperSpray
        L2_2 = L2_2[A0_2]
        L2_2 = L2_2.effect
        L2_2 = L2_2.timecycle
        L2_2 = L2_2[1]
        L2_2 = L2_2.name
        L1_2(L2_2)
      end
      L1_2 = Config
      L1_2 = L1_2.PepperSpray
      L1_2 = L1_2[A0_2]
      L1_2 = L1_2.effect
      L1_2 = L1_2.timecycle
      L1_2 = L1_2[2]
      if nil ~= L1_2 then
        L1_2 = SetTimecycleModifierStrength
        L2_2 = Config
        L2_2 = L2_2.PepperSpray
        L2_2 = L2_2[A0_2]
        L2_2 = L2_2.effect
        L2_2 = L2_2.timecycle
        L2_2 = L2_2[2]
        L2_2 = L2_2.opacity
        L3_2 = L11_1
        L2_2 = L2_2 * L3_2
        L2_2 = L2_2 / 100
        L1_2(L2_2)
        L1_2 = SetTimecycleModifier
        L2_2 = Config
        L2_2 = L2_2.PepperSpray
        L2_2 = L2_2[A0_2]
        L2_2 = L2_2.effect
        L2_2 = L2_2.timecycle
        L2_2 = L2_2[2]
        L2_2 = L2_2.name
        L1_2(L2_2)
      end
      L1_2 = true
      L8_1 = L1_2
    end
  end
end
gassedPlayer = L25_1
L25_1 = Citizen
L25_1 = L25_1.CreateThread
function L26_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  while true do
    L0_2 = GetPlayerPed
    L1_2 = -1
    L0_2 = L0_2(L1_2)
    L2_1 = L0_2
    L0_2 = GetSelectedPedWeapon
    L1_2 = L2_1
    L0_2 = L0_2(L1_2)
    L5_1 = L0_2
    L0_2 = L1_1
    L1_2 = Config
    L1_2 = L1_2.RechargeCoords
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = GetEntityCoords
      L7_2 = L2_1
      L6_2 = L6_2(L7_2)
      L6_2 = L5_2 - L6_2
      L6_2 = #L6_2
      L7_2 = Config
      L7_2 = L7_2.RechargeRadius
      if L6_2 < L7_2 then
        L3_1 = L5_2
      end
    end
    L0_2 = gassed
    if nil ~= L0_2 then
      L0_2 = HasPedGotWeapon
      L1_2 = L2_1
      L2_2 = Config
      L2_2 = L2_2.Decontamination
      L2_2 = L2_2.weapon
      L0_2 = L0_2(L1_2, L2_2)
      autoDecontamination = L0_2
    end
    L0_2 = L3_1
    L1_2 = GetEntityCoords
    L2_2 = L2_1
    L1_2 = L1_2(L2_2)
    L0_2 = L0_2 - L1_2
    L0_2 = #L0_2
    L4_1 = L0_2
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 500
    L0_2(L1_2)
  end
end
L25_1(L26_1)
L25_1 = Citizen
L25_1 = L25_1.CreateThread
function L26_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = L1_1
  L1_2 = Config
  L1_2 = L1_2.PepperSpray
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = RequestNamedPtfxAsset
    L7_2 = Config
    L7_2 = L7_2.PepperSpray
    L7_2 = L7_2[L4_2]
    L7_2 = L7_2.particle
    L7_2 = L7_2.dict
    L6_2(L7_2)
    while true do
      L6_2 = HasNamedPtfxAssetLoaded
      L7_2 = Config
      L7_2 = L7_2.PepperSpray
      L7_2 = L7_2[L4_2]
      L7_2 = L7_2.particle
      L7_2 = L7_2.dict
      L6_2 = L6_2(L7_2)
      if L6_2 then
        break
      end
      L6_2 = Citizen
      L6_2 = L6_2.Wait
      L7_2 = 0
      L6_2(L7_2)
    end
  end
  L0_2 = RequestNamedPtfxAsset
  L1_2 = Config
  L1_2 = L1_2.Decontamination
  L1_2 = L1_2.particle
  L1_2 = L1_2.dict
  L0_2(L1_2)
  while true do
    L0_2 = L1_1
    L1_2 = Config
    L1_2 = L1_2.PepperSpray
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = L5_1
      L7_2 = L5_2.weapon
      if L6_2 == L7_2 then
        L6_2 = 5
        L16_1 = L6_2
        pepperUse = L4_2
        L6_2 = false
        L10_1 = L6_2
        L6_2 = sprayQuantity
        L7_2 = pepperUse
        L6_2 = L6_2[L7_2]
        if nil == L6_2 then
          L6_2 = sprayQuantity
          L7_2 = pepperUse
          L8_2 = Config
          L8_2 = L8_2.PepperSpray
          L9_2 = pepperUse
          L8_2 = L8_2[L9_2]
          L8_2 = L8_2.sprayQuantity
          L6_2[L7_2] = L8_2
        end
        L6_2 = L19_1
        L7_2 = Config
        L7_2 = L7_2.Languages
        L8_2 = Config
        L8_2 = L8_2.Language
        L7_2 = L7_2[L8_2]
        L7_2 = L7_2.quantity
        L8_2 = L7_2
        L7_2 = L7_2.gsub
        L9_2 = "{s}"
        L10_2 = math
        L10_2 = L10_2.floor
        L11_2 = sprayQuantity
        L12_2 = pepperUse
        L11_2 = L11_2[L12_2]
        L10_2, L11_2, L12_2 = L10_2(L11_2)
        L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
        L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
        L6_2 = DisableControlAction
        L7_2 = 0
        L8_2 = 24
        L9_2 = true
        L6_2(L7_2, L8_2, L9_2)
        L6_2 = DisablePlayerFiring
        L7_2 = L2_1
        L8_2 = true
        L6_2(L7_2, L8_2)
        L6_2 = DisableControlAction
        L7_2 = 0
        L8_2 = 142
        L9_2 = true
        L6_2(L7_2, L8_2, L9_2)
        L6_2 = gassed
        if nil == L6_2 then
          L6_2 = sprayQuantity
          L7_2 = pepperUse
          L6_2 = L6_2[L7_2]
          if L6_2 > 0 then
            L6_2 = IsControlJustPressed
            L7_2 = 0
            L8_2 = 92
            L6_2 = L6_2(L7_2, L8_2)
            if L6_2 then
              L6_2 = 5
              L6_1 = L6_2
              L6_2 = TriggerServerEvent
              L7_2 = "ryt:startPepperEffect"
              L8_2 = PedToNet
              L9_2 = L2_1
              L8_2 = L8_2(L9_2)
              L9_2 = pepperUse
              L6_2(L7_2, L8_2, L9_2)
              L6_2 = IsPlayerFreeAiming
              L7_2 = PlayerId
              L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2()
              L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
              if L6_2 then
                L6_2 = TriggerServerEvent
                L7_2 = "ryt:pepperInAction"
                L8_2 = PedToNet
                L9_2 = L2_1
                L8_2 = L8_2(L9_2)
                L9_2 = pepperUse
                L6_2(L7_2, L8_2, L9_2)
              end
            else
              L6_2 = IsControlJustReleased
              L7_2 = 0
              L8_2 = 92
              L6_2 = L6_2(L7_2, L8_2)
              if L6_2 then
                L6_2 = 200
                L6_1 = L6_2
                L6_2 = TriggerServerEvent
                L7_2 = "ryt:stopPepperEffect"
                L8_2 = PedToNet
                L9_2 = L2_1
                L8_2, L9_2, L10_2, L11_2, L12_2 = L8_2(L9_2)
                L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
              end
            end
          else
            L6_2 = L6_1
            if 5 == L6_2 then
              L6_2 = sprayQuantity
              L7_2 = pepperUse
              L6_2[L7_2] = 0
              L6_2 = 200
              L6_1 = L6_2
              L6_2 = TriggerServerEvent
              L7_2 = "ryt:stopPepperEffect"
              L8_2 = PedToNet
              L9_2 = L2_1
              L8_2, L9_2, L10_2, L11_2, L12_2 = L8_2(L9_2)
              L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
            end
          end
        end
        L6_2 = L4_1
        L7_2 = Config
        L7_2 = L7_2.RechargeRadius
        if L6_2 <= L7_2 then
          L6_2 = Hint
          L7_2 = Config
          L7_2 = L7_2.Languages
          L8_2 = Config
          L8_2 = L8_2.Language
          L7_2 = L7_2[L8_2]
          L7_2 = L7_2.replacepepperspray
          L6_2(L7_2)
          L6_2 = IsControlJustPressed
          L7_2 = 0
          L8_2 = Config
          L8_2 = L8_2.Keys
          L8_2 = L8_2.ReplaceKey
          L6_2 = L6_2(L7_2, L8_2)
          if L6_2 then
            L6_2 = sprayQuantity
            L7_2 = pepperUse
            L8_2 = Config
            L8_2 = L8_2.PepperSpray
            L9_2 = pepperUse
            L8_2 = L8_2[L9_2]
            L8_2 = L8_2.sprayQuantity
            L6_2[L7_2] = L8_2
          end
        end
      else
        L6_2 = L5_1
        L7_2 = Config
        L7_2 = L7_2.Decontamination
        L7_2 = L7_2.weapon
        if L6_2 == L7_2 then
          L6_2 = Config
          L6_2 = L6_2.Decontamination
          L6_2 = L6_2.command
          pepperUse = L6_2
          L6_2 = 5
          L16_1 = L6_2
          L6_2 = sprayQuantity
          L7_2 = pepperUse
          L6_2 = L6_2[L7_2]
          if nil == L6_2 then
            L6_2 = sprayQuantity
            L7_2 = pepperUse
            L8_2 = Config
            L8_2 = L8_2.Decontamination
            L8_2 = L8_2.decontaminationQuantity
            L6_2[L7_2] = L8_2
          end
          L6_2 = L19_1
          L7_2 = Config
          L7_2 = L7_2.Languages
          L8_2 = Config
          L8_2 = L8_2.Language
          L7_2 = L7_2[L8_2]
          L7_2 = L7_2.quantity
          L8_2 = L7_2
          L7_2 = L7_2.gsub
          L9_2 = "{s}"
          L10_2 = math
          L10_2 = L10_2.floor
          L11_2 = sprayQuantity
          L12_2 = pepperUse
          L11_2 = L11_2[L12_2]
          L10_2, L11_2, L12_2 = L10_2(L11_2)
          L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
          L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
          L6_2 = DisableControlAction
          L7_2 = 0
          L8_2 = 24
          L9_2 = true
          L6_2(L7_2, L8_2, L9_2)
          L6_2 = DisablePlayerFiring
          L7_2 = L2_1
          L8_2 = true
          L6_2(L7_2, L8_2)
          L6_2 = DisableControlAction
          L7_2 = 0
          L8_2 = 142
          L9_2 = true
          L6_2(L7_2, L8_2, L9_2)
          L6_2 = sprayQuantity
          L7_2 = pepperUse
          L6_2 = L6_2[L7_2]
          if L6_2 > 0 then
            L6_2 = IsControlJustPressed
            L7_2 = 0
            L8_2 = 92
            L6_2 = L6_2(L7_2, L8_2)
            if L6_2 then
              L6_2 = L9_1
              if not L6_2 then
                L6_2 = true
                L9_1 = L6_2
                L6_2 = sprayQuantity
                L7_2 = pepperUse
                L8_2 = sprayQuantity
                L9_2 = pepperUse
                L8_2 = L8_2[L9_2]
                L9_2 = Config
                L9_2 = L9_2.Decontamination
                L9_2 = L9_2.decontaminationDescent
                L8_2 = L8_2 - L9_2
                L6_2[L7_2] = L8_2
                L6_2 = TriggerServerEvent
                L7_2 = "ryt:syncSound"
                L8_2 = PedToNet
                L9_2 = L2_1
                L8_2 = L8_2(L9_2)
                L9_2 = "decontamination"
                L6_2(L7_2, L8_2, L9_2)
                L6_2 = TriggerServerEvent
                L7_2 = "ryt:startDecontaminationEffect"
                L8_2 = PedToNet
                L9_2 = L2_1
                L8_2, L9_2, L10_2, L11_2, L12_2 = L8_2(L9_2)
                L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
                L6_2 = gassed
                if nil == L6_2 then
                  L6_2 = IsPlayerFreeAiming
                  L7_2 = PlayerId
                  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2()
                  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
                  if L6_2 then
                    L6_2 = TriggerServerEvent
                    L7_2 = "ryt:decontaminationInAction"
                    L8_2 = PedToNet
                    L9_2 = L2_1
                    L8_2, L9_2, L10_2, L11_2, L12_2 = L8_2(L9_2)
                    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
                  end
                else
                  L6_2 = TriggerServerEvent
                  L7_2 = "ryt:decontaminationInAction"
                  L8_2 = PedToNet
                  L9_2 = L2_1
                  L8_2 = L8_2(L9_2)
                  L9_2 = true
                  L6_2(L7_2, L8_2, L9_2)
                end
                L6_2 = Citizen
                L6_2 = L6_2.SetTimeout
                L7_2 = Config
                L7_2 = L7_2.Decontamination
                L7_2 = L7_2.decontaminationTimeout
                function L8_2()
                  local L0_3, L1_3
                  L0_3 = false
                  L9_1 = L0_3
                end
                L6_2(L7_2, L8_2)
              end
            end
          else
            L6_2 = L6_1
            if 5 == L6_2 then
              L6_2 = sprayQuantity
              L7_2 = pepperUse
              L6_2[L7_2] = 0
            end
          end
          L6_2 = L4_1
          L7_2 = Config
          L7_2 = L7_2.RechargeRadius
          if L6_2 <= L7_2 then
            L6_2 = Hint
            L7_2 = Config
            L7_2 = L7_2.Languages
            L8_2 = Config
            L8_2 = L8_2.Language
            L7_2 = L7_2[L8_2]
            L7_2 = L7_2.replacedecontamination
            L6_2(L7_2)
            L6_2 = IsControlJustPressed
            L7_2 = 0
            L8_2 = Config
            L8_2 = L8_2.Keys
            L8_2 = L8_2.ReplaceKey
            L6_2 = L6_2(L7_2, L8_2)
            if L6_2 then
              L6_2 = sprayQuantity
              L7_2 = pepperUse
              L8_2 = Config
              L8_2 = L8_2.Decontamination
              L8_2 = L8_2.decontaminationQuantity
              L6_2[L7_2] = L8_2
            end
          end
        else
          L6_2 = L10_1
          if not L6_2 then
            L6_2 = true
            L10_1 = L6_2
            L6_2 = 200
            L6_1 = L6_2
            L6_2 = TriggerServerEvent
            L7_2 = "ryt:stopPepperEffect"
            L8_2 = PedToNet
            L9_2 = L2_1
            L8_2, L9_2, L10_2, L11_2, L12_2 = L8_2(L9_2)
            L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
          else
            L6_2 = 500
            L16_1 = L6_2
          end
        end
      end
    end
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = L16_1
    L0_2(L1_2)
  end
end
L25_1(L26_1)
L25_1 = Citizen
L25_1 = L25_1.CreateThread
function L26_1()
  local L0_2, L1_2, L2_2
  while true do
    L0_2 = gassed
    if nil ~= L0_2 then
      L0_2 = Config
      L0_2 = L0_2.PepperSpray
      L1_2 = gassed
      L0_2 = L0_2[L1_2]
      L0_2 = L0_2.effect
      L0_2 = L0_2.timecycle
      L0_2 = L0_2[2]
      L0_2 = L0_2.opacity
      L1_2 = L11_1
      L0_2 = L0_2 * L1_2
      L0_2 = L0_2 / 100
      L15_1 = L0_2
      L0_2 = L15_1
      if L0_2 < 0 then
        L0_2 = 0
        L15_1 = L0_2
      end
      L0_2 = ClearTimecycleModifier
      L0_2()
      L0_2 = Config
      L0_2 = L0_2.PepperSpray
      L1_2 = gassed
      L0_2 = L0_2[L1_2]
      L0_2 = L0_2.effect
      L0_2 = L0_2.timecycle
      L0_2 = L0_2[2]
      if nil ~= L0_2 then
        L0_2 = SetTimecycleModifierStrength
        L1_2 = L15_1
        L0_2(L1_2)
        L0_2 = SetTimecycleModifier
        L1_2 = Config
        L1_2 = L1_2.PepperSpray
        L2_2 = gassed
        L1_2 = L1_2[L2_2]
        L1_2 = L1_2.effect
        L1_2 = L1_2.timecycle
        L1_2 = L1_2[2]
        L1_2 = L1_2.name
        L0_2(L1_2)
      end
    end
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 500
    L0_2(L1_2)
  end
end
L25_1(L26_1)
L25_1 = Citizen
L25_1 = L25_1.CreateThread
function L26_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  while true do
    L0_2 = gassed
    if nil ~= L0_2 then
      sleepTime = 5
      L0_2 = Config
      L0_2 = L0_2.DisableSprintWhenGassed
      if L0_2 then
        L0_2 = DisableControlAction
        L1_2 = 0
        L2_2 = 21
        L3_2 = true
        L0_2(L1_2, L2_2, L3_2)
      end
      L0_2 = Config
      L0_2 = L0_2.DisableEnterVehicleWhenGassed
      if L0_2 then
        L0_2 = DisableControlAction
        L1_2 = 0
        L2_2 = 23
        L3_2 = true
        L0_2(L1_2, L2_2, L3_2)
      end
      L0_2 = L11_1
      if L0_2 > 0 then
        L0_2 = L12_1
        if not L0_2 then
          L0_2 = L13_1
          if not L0_2 then
            L0_2 = Config
            L0_2 = L0_2.PepperSpray
            L1_2 = gassed
            L0_2 = L0_2[L1_2]
            L0_2 = L0_2.splitEnabled
            if L0_2 then
              L0_2 = Config
              L0_2 = L0_2.PepperSpray
              L1_2 = gassed
              L0_2 = L0_2[L1_2]
              L0_2 = L0_2.rubbingEnabled
              if L0_2 then
                L0_2 = Hint
                L1_2 = Config
                L1_2 = L1_2.Languages
                L2_2 = Config
                L2_2 = L2_2.Language
                L1_2 = L1_2[L2_2]
                L1_2 = L1_2.rubbing
                L2_2 = "\n"
                L3_2 = Config
                L3_2 = L3_2.Languages
                L4_2 = Config
                L4_2 = L4_2.Language
                L3_2 = L3_2[L4_2]
                L3_2 = L3_2.split
                L1_2 = L1_2 .. L2_2 .. L3_2
                L0_2(L1_2)
            end
            else
              L0_2 = Config
              L0_2 = L0_2.PepperSpray
              L1_2 = gassed
              L0_2 = L0_2[L1_2]
              L0_2 = L0_2.splitEnabled
              if L0_2 then
                L0_2 = Hint
                L1_2 = Config
                L1_2 = L1_2.Languages
                L2_2 = Config
                L2_2 = L2_2.Language
                L1_2 = L1_2[L2_2]
                L1_2 = L1_2.split
                L0_2(L1_2)
              else
                L0_2 = Config
                L0_2 = L0_2.PepperSpray
                L1_2 = gassed
                L0_2 = L0_2[L1_2]
                L0_2 = L0_2.rubbingEnabled
                if L0_2 then
                  L0_2 = Hint
                  L1_2 = Config
                  L1_2 = L1_2.Languages
                  L2_2 = Config
                  L2_2 = L2_2.Language
                  L1_2 = L1_2[L2_2]
                  L1_2 = L1_2.rubbing
                  L0_2(L1_2)
                end
              end
            end
          else
            L0_2 = Config
            L0_2 = L0_2.PepperSpray
            L1_2 = gassed
            L0_2 = L0_2[L1_2]
            L0_2 = L0_2.splitEnabled
            if L0_2 then
              L0_2 = Hint
              L1_2 = Config
              L1_2 = L1_2.Languages
              L2_2 = Config
              L2_2 = L2_2.Language
              L1_2 = L1_2[L2_2]
              L1_2 = L1_2.split
              L0_2(L1_2)
            end
          end
          L0_2 = Config
          L0_2 = L0_2.PepperSpray
          L1_2 = gassed
          L0_2 = L0_2[L1_2]
          L0_2 = L0_2.splitEnabled
          if L0_2 then
            L0_2 = L13_1
            if not L0_2 then
              L0_2 = IsControlJustPressed
              L1_2 = 0
              L2_2 = Config
              L2_2 = L2_2.Keys
              L2_2 = L2_2.SplitKey
              L0_2 = L0_2(L1_2, L2_2)
              if L0_2 then
                L0_2 = TriggerServerEvent
                L1_2 = "ryt:splitAction"
                L2_2 = PedToNet
                L3_2 = L2_1
                L2_2 = L2_2(L3_2)
                L3_2 = GetOffsetFromEntityInWorldCoords
                L4_2 = L2_1
                L5_2 = 0.0
                L6_2 = 0.4
                L7_2 = -1.0
                L3_2, L4_2, L5_2, L6_2, L7_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
                L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
                L0_2 = L11_1
                L1_2 = Config
                L1_2 = L1_2.PepperSpray
                L2_2 = gassed
                L1_2 = L1_2[L2_2]
                L1_2 = L1_2.splitDescent
                L0_2 = L0_2 - L1_2
                L11_1 = L0_2
                L0_2 = true
                L12_1 = L0_2
                L0_2 = Citizen
                L0_2 = L0_2.SetTimeout
                L1_2 = Config
                L1_2 = L1_2.PepperSpray
                L2_2 = gassed
                L1_2 = L1_2[L2_2]
                L1_2 = L1_2.splitTimeout
                function L2_2()
                  local L0_3, L1_3
                  L0_3 = false
                  L12_1 = L0_3
                end
                L0_2(L1_2, L2_2)
              end
            end
          end
          L0_2 = L24_1
          L1_2 = Config
          L1_2 = L1_2.PepperSpray
          L2_2 = gassed
          L1_2 = L1_2[L2_2]
          L1_2 = L1_2.rubbingDescent
          L0_2(L1_2)
        else
          L0_2 = Config
          L0_2 = L0_2.PepperSpray
          L1_2 = gassed
          L0_2 = L0_2[L1_2]
          L0_2 = L0_2.rubbingEnabled
          if L0_2 then
            L0_2 = Hint
            L1_2 = Config
            L1_2 = L1_2.Languages
            L2_2 = Config
            L2_2 = L2_2.Language
            L1_2 = L1_2[L2_2]
            L1_2 = L1_2.rubbing
            L0_2(L1_2)
            L0_2 = L24_1
            L1_2 = Config
            L1_2 = L1_2.PepperSpray
            L2_2 = gassed
            L1_2 = L1_2[L2_2]
            L1_2 = L1_2.rubbingDescent
            L0_2(L1_2)
          end
        end
        L0_2 = DrawTimerBar
        L1_2 = Config
        L1_2 = L1_2.Design
        L1_2 = L1_2.ProgressBar
        L1_2 = L1_2.text
        L2_2 = L11_1
        L0_2(L1_2, L2_2)
        L0_2 = IsEntityDead
        L1_2 = L2_1
        L0_2 = L0_2(L1_2)
        if L0_2 then
          L0_2 = resetGassedPed
          L0_2()
        end
      end
    else
      sleepTime = 500
    end
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = sleepTime
    L0_2(L1_2)
  end
end
L25_1(L26_1)
L25_1 = Citizen
L25_1 = L25_1.CreateThread
function L26_1()
  local L0_2, L1_2, L2_2, L3_2
  while true do
    L0_2 = L6_1
    if 5 == L0_2 then
      L0_2 = L5_1
      L1_2 = Config
      L1_2 = L1_2.PepperSpray
      L2_2 = pepperUse
      L1_2 = L1_2[L2_2]
      L1_2 = L1_2.weapon
      if L0_2 == L1_2 then
        L0_2 = sprayQuantity
        L1_2 = pepperUse
        L2_2 = sprayQuantity
        L3_2 = pepperUse
        L2_2 = L2_2[L3_2]
        L2_2 = L2_2 - 1
        L0_2[L1_2] = L2_2
        L0_2 = Citizen
        L0_2 = L0_2.Wait
        L1_2 = Config
        L1_2 = L1_2.PepperSpray
        L2_2 = pepperUse
        L1_2 = L1_2[L2_2]
        L1_2 = L1_2.sprayDescent
        L0_2(L1_2)
      end
    end
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = L6_1
    L0_2(L1_2)
  end
end
L25_1(L26_1)
L25_1 = Citizen
L25_1 = L25_1.CreateThread
function L26_1()
  local L0_2, L1_2, L2_2, L3_2
  while true do
    L0_2 = L6_1
    if 5 == L0_2 then
      L0_2 = L5_1
      L1_2 = Config
      L1_2 = L1_2.PepperSpray
      L2_2 = pepperUse
      L1_2 = L1_2[L2_2]
      L1_2 = L1_2.weapon
      if L0_2 == L1_2 then
        L0_2 = IsPlayerFreeAiming
        L1_2 = PlayerId
        L1_2, L2_2, L3_2 = L1_2()
        L0_2 = L0_2(L1_2, L2_2, L3_2)
        if L0_2 then
          L0_2 = TriggerServerEvent
          L1_2 = "ryt:pepperInAction"
          L2_2 = PedToNet
          L3_2 = L2_1
          L2_2 = L2_2(L3_2)
          L3_2 = pepperUse
          L0_2(L1_2, L2_2, L3_2)
        end
      end
    end
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 500
    L0_2(L1_2)
  end
end
L25_1(L26_1)
L25_1 = Citizen
L25_1 = L25_1.CreateThread
function L26_1()
  local L0_2, L1_2, L2_2
  while true do
    L0_2 = gassed
    if nil ~= L0_2 then
      L0_2 = L11_1
      if L0_2 > 0 then
        L0_2 = L11_1
        L0_2 = L0_2 - 0.5
        L11_1 = L0_2
        L0_2 = Citizen
        L0_2 = L0_2.Wait
        L1_2 = Config
        L1_2 = L1_2.PepperSpray
        L2_2 = gassed
        L1_2 = L1_2[L2_2]
        L1_2 = L1_2.gasDescent
        L2_2 = L14_1
        L1_2 = L1_2 / L2_2
        L0_2(L1_2)
      else
        L0_2 = resetGassedPed
        L0_2()
      end
    else
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 200
      L0_2(L1_2)
    end
  end
end
L25_1(L26_1)
L25_1 = RegisterNetEvent
L26_1 = "ryt:startPepperEffect"
L25_1(L26_1)
L25_1 = AddEventHandler
L26_1 = "ryt:startPepperEffect"
function L27_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = GetEntityCoords
  L3_2 = NetToPed
  L4_2 = A0_2
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L3_2(L4_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  L3_2 = GetEntityCoords
  L4_2 = L2_1
  L3_2 = L3_2(L4_2)
  L2_2 = L2_2 - L3_2
  L2_2 = #L2_2
  if L2_2 < 100.0 then
    L2_2 = UseParticleFxAssetNextCall
    L3_2 = Config
    L3_2 = L3_2.PepperSpray
    L3_2 = L3_2[A1_2]
    L3_2 = L3_2.particle
    L3_2 = L3_2.dict
    L2_2(L3_2)
    L2_2 = NetToPed
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    L3_2 = L18_1
    L4_2 = StartParticleFxLoopedOnEntity
    L5_2 = Config
    L5_2 = L5_2.PepperSpray
    L5_2 = L5_2[A1_2]
    L5_2 = L5_2.particle
    L5_2 = L5_2.particle
    L6_2 = GetCurrentPedWeaponEntityIndex
    L7_2 = NetToPed
    L8_2 = A0_2
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2(L8_2)
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L7_2 = Config
    L7_2 = L7_2.PepperSpray
    L7_2 = L7_2[A1_2]
    L7_2 = L7_2.particle
    L7_2 = L7_2.particleCoords
    L8_2 = Config
    L8_2 = L8_2.PepperSpray
    L8_2 = L8_2[A1_2]
    L8_2 = L8_2.particle
    L8_2 = L8_2.particleRotation
    L9_2 = Config
    L9_2 = L9_2.PepperSpray
    L9_2 = L9_2[A1_2]
    L9_2 = L9_2.particle
    L9_2 = L9_2.particleSize
    L10_2 = false
    L11_2 = false
    L12_2 = false
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L3_2[L2_2] = L4_2
  end
end
L25_1(L26_1, L27_1)
L25_1 = RegisterNetEvent
L26_1 = "ryt:stopPepperEffect"
L25_1(L26_1)
L25_1 = AddEventHandler
L26_1 = "ryt:stopPepperEffect"
function L27_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = StopParticleFxLooped
  L2_2 = NetToPed
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = L18_1
  L2_2 = L3_2[L2_2]
  L3_2 = 0
  L1_2(L2_2, L3_2)
end
L25_1(L26_1, L27_1)
L25_1 = RegisterNetEvent
L26_1 = "ryt:startDecontaminationEffect"
L25_1(L26_1)
L25_1 = AddEventHandler
L26_1 = "ryt:startDecontaminationEffect"
function L27_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = GetEntityCoords
  L2_2 = NetToPed
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L2_2(L3_2)
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L2_2 = GetEntityCoords
  L3_2 = L2_1
  L2_2 = L2_2(L3_2)
  L1_2 = L1_2 - L2_2
  L1_2 = #L1_2
  if L1_2 < 100.0 then
    L1_2 = UseParticleFxAssetNextCall
    L2_2 = Config
    L2_2 = L2_2.Decontamination
    L2_2 = L2_2.particle
    L2_2 = L2_2.dict
    L1_2(L2_2)
    L1_2 = NetToPed
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    L2_2 = L17_1
    L3_2 = StartParticleFxLoopedOnEntity
    L4_2 = Config
    L4_2 = L4_2.Decontamination
    L4_2 = L4_2.particle
    L4_2 = L4_2.particle
    L5_2 = GetCurrentPedWeaponEntityIndex
    L6_2 = NetToPed
    L7_2 = A0_2
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L6_2(L7_2)
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    L6_2 = Config
    L6_2 = L6_2.Decontamination
    L6_2 = L6_2.particle
    L6_2 = L6_2.particleCoords
    L7_2 = Config
    L7_2 = L7_2.Decontamination
    L7_2 = L7_2.particle
    L7_2 = L7_2.particleRotation
    L8_2 = Config
    L8_2 = L8_2.Decontamination
    L8_2 = L8_2.particle
    L8_2 = L8_2.particleSize
    L9_2 = false
    L10_2 = false
    L11_2 = false
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    L2_2[L1_2] = L3_2
  end
end
L25_1(L26_1, L27_1)
L25_1 = RegisterNetEvent
L26_1 = "ryt:stopDecontaminationEffect"
L25_1(L26_1)
L25_1 = AddEventHandler
L26_1 = "ryt:stopDecontaminationEffect"
function L27_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = StopParticleFxLooped
  L2_2 = NetToPed
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = L17_1
  L2_2 = L3_2[L2_2]
  L3_2 = 0
  L1_2(L2_2, L3_2)
end
L25_1(L26_1, L27_1)
L25_1 = RegisterNetEvent
L26_1 = "ryt:pepperInAction"
L25_1(L26_1)
L25_1 = AddEventHandler
L26_1 = "ryt:pepperInAction"
function L27_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = NetToPed
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  byPed = L2_2
  L2_2 = L2_1
  L3_2 = byPed
  if L2_2 ~= L3_2 then
    L2_2 = L20_1
    L3_2 = Config
    L3_2 = L3_2.PepperSpray
    L3_2 = L3_2[A1_2]
    L3_2 = L3_2.gasMask
    L2_2 = L2_2(L3_2)
    if not L2_2 then
      L2_2 = L22_1
      L3_2 = byPed
      L4_2 = A1_2
      L2_2 = L2_2(L3_2, L4_2)
      if L2_2 then
        L2_2 = IsPedInAnyVehicle
        L3_2 = L2_1
        L4_2 = false
        L2_2 = L2_2(L3_2, L4_2)
        if L2_2 then
          L2_2 = GetVehiclePedIsIn
          L3_2 = L2_1
          L4_2 = false
          L2_2 = L2_2(L3_2, L4_2)
          L3_2 = GetDoorIsOpen
          L4_2 = L2_2
          L3_2 = L3_2(L4_2)
          if not L3_2 then
            L3_2 = IsPedOnAnyBike
            L4_2 = L2_1
            L3_2 = L3_2(L4_2)
          end
          if L3_2 then
            L3_2 = gassedPlayer
            L4_2 = A1_2
            L3_2(L4_2)
          end
        else
          L2_2 = gassedPlayer
          L3_2 = A1_2
          L2_2(L3_2)
        end
      end
    end
  end
end
L25_1(L26_1, L27_1)
L25_1 = RegisterNetEvent
L26_1 = "ryt:decontaminationInAction"
L25_1(L26_1)
L25_1 = AddEventHandler
L26_1 = "ryt:decontaminationInAction"
function L27_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = NetToPed
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  byPed = L2_2
  if A1_2 then
    L2_2 = L2_1
    L3_2 = byPed
    if L2_2 == L3_2 then
      L2_2 = L11_1
      L3_2 = Config
      L3_2 = L3_2.Decontamination
      L3_2 = L3_2.decreaseLevel
      L2_2 = L2_2 - L3_2
      L11_1 = L2_2
    end
  else
    L2_2 = L2_1
    L3_2 = byPed
    if L2_2 ~= L3_2 then
      L2_2 = gassed
      if nil ~= L2_2 then
        L2_2 = IsPedInAnyVehicle
        L3_2 = L2_1
        L4_2 = false
        L2_2 = L2_2(L3_2, L4_2)
        if not L2_2 then
          distance = 0.8
        else
          distance = 2.2
        end
        L2_2 = GetOffsetFromEntityInWorldCoords
        L3_2 = byPed
        L4_2 = 0.0
        L5_2 = 0.7
        L6_2 = 0.0
        L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
        L3_2 = GetEntityCoords
        L4_2 = L2_1
        L3_2 = L3_2(L4_2)
        L2_2 = L2_2 - L3_2
        L2_2 = #L2_2
        L3_2 = distance
        if L2_2 < L3_2 then
          L2_2 = IsPedInAnyVehicle
          L3_2 = L2_1
          L4_2 = false
          L2_2 = L2_2(L3_2, L4_2)
          if L2_2 then
            L2_2 = GetVehiclePedIsIn
            L3_2 = L2_1
            L4_2 = false
            L2_2 = L2_2(L3_2, L4_2)
            L3_2 = GetDoorIsOpen
            L4_2 = L2_2
            L3_2 = L3_2(L4_2)
            if not L3_2 then
              L3_2 = IsPedOnAnyBike
              L4_2 = L2_1
              L3_2 = L3_2(L4_2)
            end
            if L3_2 then
              L3_2 = L11_1
              L4_2 = Config
              L4_2 = L4_2.Decontamination
              L4_2 = L4_2.decreaseLevel
              L3_2 = L3_2 - L4_2
              L11_1 = L3_2
            end
          else
            L2_2 = L11_1
            L3_2 = Config
            L3_2 = L3_2.Decontamination
            L3_2 = L3_2.decreaseLevel
            L2_2 = L2_2 - L3_2
            L11_1 = L2_2
          end
        end
      end
    end
  end
end
L25_1(L26_1, L27_1)
L25_1 = RegisterNetEvent
L26_1 = "ryt:splitAction"
L25_1(L26_1)
L25_1 = AddEventHandler
L26_1 = "ryt:splitAction"
function L27_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L2_2 = GetEntityCoords
  L3_2 = NetToPed
  L4_2 = A0_2
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L3_2(L4_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  L3_2 = GetEntityCoords
  L4_2 = L2_1
  L3_2 = L3_2(L4_2)
  L2_2 = L2_2 - L3_2
  L2_2 = #L2_2
  if L2_2 < 100.0 then
    L2_2 = AddDecal
    L3_2 = 9000
    L4_2 = A1_2
    L5_2 = 0.0
    L6_2 = 0.0
    L7_2 = -1.0
    L8_2 = 0.0
    L9_2 = 1.0
    L10_2 = 0.0
    L11_2 = 0.25
    L12_2 = 0.25
    L13_2 = 0.0
    L14_2 = 0.0
    L15_2 = 0.0
    L16_2 = 1.0
    L17_2 = 60.0
    L18_2 = 0
    L19_2 = 0
    L20_2 = 0
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  end
end
L25_1(L26_1, L27_1)
L25_1 = RegisterNetEvent
L26_1 = "ryt:syncSound"
L25_1(L26_1)
L25_1 = AddEventHandler
L26_1 = "ryt:syncSound"
function L27_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = GetEntityCoords
  L4_2 = NetToPed
  L5_2 = A1_2
  L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2(L5_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  L4_2 = GetEntityCoords
  L5_2 = GetPlayerPed
  L6_2 = GetPlayerFromServerId
  L7_2 = NetToPed
  L8_2 = A1_2
  L7_2, L8_2 = L7_2(L8_2)
  L6_2, L7_2, L8_2 = L6_2(L7_2, L8_2)
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2, L7_2, L8_2)
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  L5_2 = L4_2 - L3_2
  L5_2 = #L5_2
  if L5_2 <= 5.0 then
    L5_2 = SendNUIMessage
    L6_2 = {}
    L6_2.command = "play"
    L6_2.file = A2_2
    L5_2(L6_2)
  end
end
L25_1(L26_1, L27_1)


//holographic signs and barriers

/obj/structure/holosign
	name = "holo sign"
	icon = 'icons/effects/effects.dmi'
	anchored = TRUE
	max_integrity = 1
	armor = ARMOR_VALUE_GENERIC_ITEM
	var/obj/item/holosign_creator/projector
	var/init_vis_overlay = TRUE
	rad_flags = RAD_NO_CONTAMINATE

/obj/structure/holosign/Initialize(mapload, source_projector)
	. = ..()
	if(source_projector)
		projector = source_projector
		projector.signs += src
	if(init_vis_overlay)
		SSvis_overlays.add_vis_overlay(src, icon, icon_state, ABOVE_MOB_LAYER, plane, dir, alpha, RESET_ALPHA) //you see mobs under it, but you hit them like they are above it
		alpha = 0

/obj/structure/holosign/Destroy()
	if(projector)
		projector.signs -= src
		projector = null
	return ..()

/obj/structure/holosign/on_attack_hand(mob/living/user, act_intent = user.a_intent, unarmed_attack_flags)
	. = ..()
	if(.)
		return
	user.do_attack_animation(src, ATTACK_EFFECT_PUNCH)
	user.DelayNextAction(CLICK_CD_MELEE)
	take_damage(5 , BRUTE, "melee", 1, attacked_by = user)

/obj/structure/holosign/play_attack_sound(damage_amount, damage_type = BRUTE, damage_flag = 0)
	switch(damage_type)
		if(BRUTE)
			playsound(loc, 'sound/weapons/egloves.ogg', 80, 1)
		if(BURN)
			playsound(loc, 'sound/weapons/egloves.ogg', 80, 1)

/obj/structure/holosign/wetsign
	name = "wet floor sign"
	desc = "The words flicker as if they mean nothing."
	icon = 'icons/effects/effects.dmi'
	icon_state = "holosign"

/obj/structure/holosign/barrier
	name = "holo barrier"
	desc = "A short holographic barrier which can only be passed by walking."
	icon_state = "holosign_sec"
	pass_flags = LETPASSTHROW
	pass_flags_self = PASSGLASS|PASSTABLE|PASSGRILLE
	density = TRUE
	max_integrity = 20
	var/allow_walk = 1 //can we pass through it on walk intent

/obj/structure/holosign/barrier/CanAllowThrough(atom/movable/mover, border_dir)
	..()
	if(!density)
		return 1
	if(mover.pass_flags & pass_flags_self)
		return 1
	if(iscarbon(mover))
		var/mob/living/carbon/C = mover
		if(allow_walk && C.m_intent == MOVE_INTENT_WALK)
			return 1

/obj/structure/holosign/barrier/engineering
	icon_state = "holosign_engi"
	rad_flags = RAD_PROTECT_CONTENTS | RAD_NO_CONTAMINATE
	rad_insulation = RAD_LIGHT_INSULATION

/obj/structure/holosign/barrier/atmos
	name = "holo fan"
	desc = "A holographic barrier resembling a tiny fan. Though it does not prevent solid objects from passing through, gas is kept out. Somehow."
	icon_state = "holo_fan"
	density = FALSE
	anchored = TRUE
	layer = ABOVE_NORMAL_TURF_LAYER
	CanAtmosPass = ATMOS_PASS_NO
	alpha = 150
	init_vis_overlay = FALSE

/obj/structure/holosign/barrier/atmos/Initialize()
	. = ..()
	air_update_turf(TRUE)

/obj/structure/holosign/barrier/firelock
	name = "holo firelock"
	desc = "A holographic barrier resembling a firelock. Though it does not prevent solid objects or gas from passing through, temperature changes are kept out."
	icon_state = "holo_firelock"
	density = FALSE
	anchored = TRUE
	alpha = 150
	resistance_flags = FIRE_PROOF

/obj/structure/holosign/barrier/firelock/BlockThermalConductivity()
	return TRUE

/obj/structure/holosign/barrier/combifan
	name = "holo combifan"
	desc = "A holographic barrier resembling a blue-accented tiny fan. Though it does not prevent solid objects from passing through, gas and temperature changes are kept out."
	icon_state = "holo_combifan"
	max_integrity = 30
	density = FALSE
	anchored = TRUE
	layer = ABOVE_NORMAL_TURF_LAYER
	alpha = 150
	init_vis_overlay = FALSE
	CanAtmosPass = ATMOS_PASS_NO
	resistance_flags = FIRE_PROOF

/obj/structure/holosign/barrier/combifan/BlockThermalConductivity()
	return TRUE

/obj/structure/holosign/barrier/combifan/Initialize()
	. = ..()
	air_update_turf(TRUE)

/obj/structure/holosign/barrier/cyborg
	name = "Energy Field"
	desc = "A fragile energy field that blocks movement. Excels at blocking lethal projectiles."
	density = TRUE
	max_integrity = 10
	allow_walk = 0

/obj/structure/holosign/barrier/cyborg/bullet_act(obj/item/projectile/P)
	take_damage((P.damage / 5) , BRUTE, "melee", 1, attacked_by = P.firer)	//Doesn't really matter what damage flag it is.
	if(istype(P, /obj/item/projectile/energy/electrode))
		take_damage(10, BRUTE, "melee", 1, attacked_by = P.firer)	//Tasers aren't harmful.
	if(istype(P, /obj/item/projectile/beam/disabler))
		take_damage(5, BRUTE, "melee", 1, attacked_by = P.firer)	//Disablers aren't harmful.
	return BULLET_ACT_HIT

/obj/structure/holosign/barrier/medical
	name = "\improper PENLITE holobarrier"
	desc = "A holobarrier that uses biometrics to detect human viruses. Denies passing to personnel with easily-detected, malicious viruses. Good for quarantines."
	icon_state = "holo_medical"
	alpha = 125 //lazy :)
	var/force_allaccess = FALSE
	var/buzzcd = 0

/obj/structure/holosign/barrier/medical/examine(mob/user)
	. = ..()
	. += span_notice("The biometric scanners are <b>[force_allaccess ? "off" : "on"]</b>.")

/obj/structure/holosign/barrier/medical/proc/CheckHuman(mob/living/carbon/human/sickboi)
	var/threat = sickboi.check_virus()
	if(get_disease_severity_value(threat) > get_disease_severity_value(DISEASE_SEVERITY_MINOR))
		return FALSE
	return TRUE

/obj/structure/holosign/barrier/medical/CanAllowThrough(atom/movable/mover, border_dir)
	. = ..()
	if(force_allaccess)
		return TRUE
	if(istype(mover, /obj/vehicle/ridden))
		for(var/M in mover.buckled_mobs)
			if(ishuman(M))
				if(!CheckHuman(M))
					return FALSE
	if(ishuman(mover))
		return CheckHuman(mover)
	return TRUE

/obj/structure/holosign/barrier/medical/on_attack_hand(mob/living/user, act_intent = user.a_intent, unarmed_attack_flags)
	if(CanPass(user) && user.a_intent == INTENT_HELP)
		force_allaccess = !force_allaccess
		to_chat(user, span_warning("I [force_allaccess ? "deactivate" : "activate"] the biometric scanners.")) //warning spans because you can make the station sick!
	else
		return ..()

/obj/structure/holosign/barrier/cyborg/hacked
	name = "Charged Energy Field"
	desc = "A powerful energy field that blocks movement. Energy arcs off it."
	max_integrity = 20
	var/shockcd = 0

/obj/structure/holosign/barrier/cyborg/hacked/bullet_act(obj/item/projectile/P)
	take_damage(P.damage, BRUTE, "melee", 1, attacked_by = P.firer)	//Yeah no this doesn't get projectile resistance.
	return BULLET_ACT_HIT

/obj/structure/holosign/barrier/cyborg/hacked/proc/cooldown()
	shockcd = FALSE

/obj/structure/holosign/barrier/cyborg/hacked/on_attack_hand(mob/living/user, act_intent = user.a_intent, unarmed_attack_flags)
	. = ..()
	if(.)
		return
	if(!shockcd)
		if(ismob(user))
			var/mob/living/M = user
			M.electrocute_act(15,"Energy Barrier", flags = SHOCK_NOGLOVES)
			shockcd = TRUE
			addtimer(CALLBACK(src,PROC_REF(cooldown)), 5)

/obj/structure/holosign/barrier/cyborg/hacked/Bumped(atom/movable/AM)
	if(shockcd)
		return

	if(!ismob(AM))
		return

	var/mob/living/M = AM
	M.electrocute_act(15,"Energy Barrier", flags = SHOCK_NOGLOVES)
	shockcd = TRUE
	addtimer(CALLBACK(src,PROC_REF(cooldown)), 5)

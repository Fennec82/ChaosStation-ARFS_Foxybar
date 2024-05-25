// dare you to find a better place for this

/datum/flirt
	var/key = "hi" // autogenerated from the path, dont touch cus it wont do anything
	var/flirtname = "Loveletter to Coderbus"
	var/flirtdesc = "I am a coderbus, and I love you!"
	/// What it looks like in ur hand
	var/flirticon = 'icons/mob/actions.dmi'
	var/flirticon_state = "velvet_chords"
	/// What it says when its put in ur hand
	var/give_message = "You get ready to flirt!"
	var/give_message_span = "love"
	/// displayed to the flirted self
	var/self_message = "You flirt with %TARGET%! How sweet."
	var/self_message_span = "love" // check them out in spans.dm!
	var/self_message_advice = "Remember to honor their OOC preferences and <span class='love'>maybe</span> give them a response?"
	/// displayed to the flirted target
	var/target_message = "You notice %FLIRTER% flirting with you! How sweet."
	var/target_message_span = "love"
	var/target_message_advice = "Maybe give them a little emote back?"
	/// displayed when you use the emote item in hand to broadcast a general flirt
	var/aoe_message
	var/aoe_message_span
	/// how far does it go?
	var/aoe_range = 2
	/// what category is this thing?
	var/list/categories = list("Misc")
	/// sound it makes to us bolth
	var/sound_to_do // = "sound/items/bikehorn.ogg"

	/// if the Flirt is expecting a greenlight action, have it have them autotarget u
	var/requests_reply = TRUE
	/// text sent to em when u use a Flort asking a request
	var/reply_request_text = span_notice("Use *flirt and use one of the options in the Accept or a Decline categories to accept or decline their advances!")

	var/keyid = 0 // autogenerated from the path, dont touch cus it wont do anything

	var/debug = FALSE

/datum/flirt/New()
	. = ..()
	if(debug && !SSchat.flirt_debug)
		return qdel(src)
	key = "[type]" // brilliant
	SSchat.flirts[key] = src
	SSchat.flirtsByNumbers += src // brilliant
	keyid = LAZYLEN(SSchat.flirtsByNumbers)
	flirtname = "#[keyid] - [flirtname]" // add in the number for easy reference
	SSchat.flirt_for_tgui |= list(format_for_tgui())
	SSchat.flirts_all_categories |= categories

/// turns this thing into a differentiated flort
/datum/flirt/proc/get_flirty(list/json_flirt)
	key = LAZYACCESS(json_flirt, "key") // LETS GET WARTY
	if(!key)
		return // LETS GET NORMAL
	flirtname = LAZYACCESS(json_flirt, "name") || "Loveletter to Coderbus"
	flirtdesc = LAZYACCESS(json_flirt, "desc") || "Send them a cute little letter asking if they'd like to file a bug report with you!"
	flirticon = LAZYACCESS(json_flirt, "icon") || "icons/mob/actions.dmi"
	flirticon_state = LAZYACCESS(json_flirt, "icon_state") || "velvet_chords"
	give_message = LAZYACCESS(json_flirt, "give_message") || "You get out your GitHub issues!"
	give_message_span = LAZYACCESS(json_flirt, "give_message_span") || "love"
	self_message = LAZYACCESS(json_flirt, "self_message") || "You ask %TARGET% if they'd like to file a bug report with you!"
	self_message_span = LAZYACCESS(json_flirt, "self_message_span") || "love"
	target_message = LAZYACCESS(json_flirt, "target_message") || "You notice %FLIRTER% asking if they'd like to file a bug report with you!"
	target_message_span = LAZYACCESS(json_flirt, "target_message_span") || "love"
	aoe_message = LAZYACCESS(json_flirt, "aoe_message") || "" // this one can be null and a-okay
	aoe_message_span = LAZYACCESS(json_flirt, "aoe_message_span") || "love"
	categories = LAZYACCESS(json_flirt, "category") || "I need a category!! uwu"
	sound_to_do = LAZYACCESS(json_flirt, "sound_to_do") || "" // this one can also be null and a-okay
	return TRUE

/datum/flirt/proc/flirt_directed(mob/living/flirter, mob/living/target)
	if(!flirter ||!target)
		return FALSE
	/// flirting for me~
	var/msg_to_me = format_directed_selfmessage(flirter.name || "Joe Joename", target.name || "Nobody")
	/// flirting for you~
	var/msg_to_you = format_directed_targetmessage(flirter.name || "Joe Joename", target.name || "Nobody")
	// I'll have a flirt, you have one too!

	/// dooesnt support pronouns cus idk
	to_chat(flirter, msg_to_me)
	to_chat(target, msg_to_you)
	do_sound_at(flirter)
	do_sound_at(target)
	SSchat.flirt_occurred(flirter, target)
	tell_ghosting_admins(flirter, target)
	return TRUE

/datum/flirt/proc/flirt_aoe(mob/living/flirter)
	if(!aoe_message)
		to_chat(flirter, span_warning("That flirt doesnt really work without a specific person in mind, try it on that cutie over there!"))
		return FALSE
	var/msg_to_everyone = format_aoemessage(flirter.name)
	flirter.visible_message(
		msg_to_everyone,
		blind_message = msg_to_everyone, // love is blind
	)
	tell_ghosting_admins(flirter, null)
	return TRUE

/datum/flirt/proc/format_directed_selfmessage(flirter, target)
	var/msg = "<span class='[self_message_span]'>[self_message]</span>"
	msg = replacetextEx(msg, "%TARGET%", "[target]")
	msg = replacetextEx(msg, "%FLIRTER%", "[flirter]")
	msg = "[msg] [self_message_advice]"
	return msg

/datum/flirt/proc/format_directed_targetmessage(flirter, target)
	var/msg = "<span class='[target_message_span]'>[target_message]</span>"
	msg = replacetextEx(msg, "%TARGET%", "[target]")
	msg = replacetextEx(msg, "%FLIRTER%", "[flirter]")
	msg = "[msg] [target_message_advice]"
	return msg

/datum/flirt/proc/format_aoemessage(flirter)
	if(!aoe_message)
		return "Nothing, cus this doesnt do the whole AoE thing."
	var/msg = "<span class='[aoe_message_span]'>[aoe_message]</span>"
	msg = replacetextEx(msg, "%FLIRTER%", "[flirter]")
	return msg

/datum/flirt/proc/give_flirter(mob/living/flirter)
	if(flirter.get_active_held_item() && flirter.get_inactive_held_item())
		to_chat(flirter, span_warning("Your hands are too full to flirt! Yes, you need your hands to flirt."))
		return

	var/obj/item/hand_item/flirter/hiya = new(flirter)
	if(!hiya.flirtify(src))
		to_chat(flirter, span_warning("Something went wrong! Try a different approach~"))
		return

	if(flirter.put_in_hands(hiya)) // NOTE: put_in_hand is MUCH different from put_in_hands - NOTE THE S
		to_chat(flirter, span_notice("[give_message]"))
		return TRUE
	else
		to_chat(flirter, span_warning("Something went wrong! Try a different approach~"))
		qdel(hiya)

/datum/flirt/proc/preview_flirt(mob/living/previewer)
	if(!previewer)
		return
	to_chat(previewer, span_notice("<br>"))
	to_chat(previewer, span_notice("Here is a preview for [flirtname]!"))
	to_chat(previewer, span_notice("When directed at someone, you will see:"))
	to_chat(previewer, "[format_directed_selfmessage(previewer.name, "Cutiepants")]")
	to_chat(previewer, span_notice("And they will see:"))
	to_chat(previewer, "[format_directed_targetmessage(previewer.name, "Cutiepants")]")
	if(aoe_message)
		to_chat(previewer, span_notice("When directed at everyone (use the flirt item in hand), everyone in [aoe_range] tiles will see:"))
		to_chat(previewer, "[format_aoemessage(previewer.name)]")
	else
		to_chat(previewer, span_notice("This flirt doesn't have a specific AoE message, so it will not do anything when directed at everyone."))
	if(sound_to_do)
		to_chat(previewer, span_notice("This flirt also makes a sound that'll be heard by just you and whoever you direct this at! Click the sound test button to hear it."))
	to_chat(previewer, span_notice("<br>"))
	return TRUE

/datum/flirt/proc/preview_sound(mob/living/previewer)
	if(!previewer)
		return
	if(!sound_to_do)
		to_chat(previewer, span_notice("This flirt doesn't have a sound to play, sorry!"))
		return
	do_sound_at(previewer)

/datum/flirt/proc/do_sound_at(mob/living/sounder)
	sounder.playsound_local(get_turf(sounder), sound_to_do, 100, FALSE, FALSE)

/datum/flirt/proc/tell_ghosting_admins(mob/living/flirter, mob/living/target)
	if(!flirter)
		return
	log_emote("[ADMIN_LOOKUPFLW(flirter)] used flirt [flirtname] to [target ? ADMIN_LOOKUPFLW(target) : "everyone around em"].")
	//broadcast to ghosts, if they have a client, are dead, arent in the lobby, allow ghostsight, and, if subtler, are admemes
	for(var/mob/ghost as anything in GLOB.dead_mob_list)
		if(QDELETED(ghost))
			continue
		if(!ghost.client || isnewplayer(ghost))
			continue
		if(!(ghost.client.prefs.chat_toggles & CHAT_GHOSTSIGHT))
			continue
		if(flirter.client && flirter.client.ckey && (flirter.client.ckey in ghost.client.prefs.aghost_squelches)) // We cannot assume they have a client.
			continue
		if(!check_rights_for(ghost.client, R_ADMIN))
			continue
		ghost.show_message(span_adminnotice("[ADMIN_LOOKUPFLW(flirter)] flirted '[flirtname]' at [target ? ADMIN_LOOKUPFLW(target) : "everyone around em"]"))

/datum/flirt/proc/format_for_tgui()
	var/list/data = list()
	data["FlirtKey"] = key
	data["FlirtName"] = flirtname
	data["FlirtDesc"] = flirtdesc
	data["FlirtCategories"] = categories
	var/msg_me = "<span class='[self_message_span]'>[self_message]</span>"
	msg_me = replacetextEx(msg_me, "%FLIRTER%", "YOU")
	msg_me = replacetextEx(msg_me, "%TARGET%", "THEM")
	data["FlirtMe"] = msg_me
	var/msg_you = "<span class='[target_message_span]'>[target_message]</span>"
	msg_you = replacetextEx(msg_you, "%FLIRTER%", "THEM")
	msg_you = replacetextEx(msg_you, "%TARGET%", "YOU")
	data["FlirtYou"] = msg_you
	var/msg_everyone = "<span class='[aoe_message_span]'>[aoe_message]</span>"
	msg_everyone = replacetextEx(msg_everyone, "%FLIRTER%", "THEM")
	data["FlirtEveryone"] = msg_everyone
	data["FlirtSound"] = !!sound_to_do // gives it a button to test the sound
	return data


///////////////////////////////////////////////////
//// FLIRT ITEM ///////////////////////////////////
/obj/item/hand_item/flirter
	name = "Flirtation Device" // in the event of a crash, your hand can be used as a flirtation device
	desc = "This thing is used to flirt with people! Or it would if it initialized properly. Oops."
	icon = 'icons/mob/actions.dmi'
	icon_state = "velvet_chords"
	max_reach = 30 // love knows no bounds
	var/flirtkey = "hi"

/obj/item/hand_item/flirter/proc/flirtify(datum/flirt/F) // Fs in chat
	if(!istype(F))
		qdel(src) // dies of illiteracy
		return
	flirtkey = F.key
	name = F.flirtname
	desc = F.flirtdesc
	icon = F.flirticon
	icon_state = F.flirticon_state
	return TRUE

/obj/item/hand_item/flirter/pre_attack(atom/A, mob/living/user, params, attackchain_flags, damage_multiplier)
	. = STOP_ATTACK_PROC_CHAIN // never let this thing hit anyone ever for any ever anytime
	if(!isliving(A))
		return
	if(!SSchat.run_directed_flirt(user, A, flirtkey))
		return
	qdel(src)

/obj/item/hand_item/flirter/attack_self(mob/user)
	. = STOP_ATTACK_PROC_CHAIN // never let this thing hit anyone ever for any ever anytime
	if(!isliving(user))
		return
	if(!SSchat.run_aoe_flirt(user, flirtkey))
		return
	qdel(src)

////////////////////////////////////////////////////////
//// FLIRT TARGETTER ///////////////////////////////////
/obj/item/hand_item/flirt_targetter
	name = "Flirtation Targetter" // in the event of a crash, your hand can be used as a flirtation device
	desc = "Click someone with this, and the next Flirt button you press will be directed at them! There's no range restriction, so, yeah!"
	icon = 'icons/mob/actions.dmi'
	icon_state = "velvet_chords"
	max_reach = 30 // love knows no bounds

/obj/item/hand_item/flirt_targetter/pre_attack(atom/A, mob/living/user, params, attackchain_flags, damage_multiplier)
	. = STOP_ATTACK_PROC_CHAIN // never let this thing hit anyone ever for any ever anytime
	if(!isliving(A))
		return
	if(!SSchat.add_flirt_target(user, A))
		return
	to_chat(user, span_notice("You'll now send a flirt to [A] when you press the next Flirt button. Happy flirting!"))
	qdel(src)




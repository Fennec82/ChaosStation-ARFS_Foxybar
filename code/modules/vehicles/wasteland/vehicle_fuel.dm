//Fallout 13 general fuel directory - Gas! Petrol! Guzzolene!

/obj/vehicle/ridden/fuel
	name = "vehicle"
	desc = "Something went wrong! Badmins spawned shit!"
	icon_state = ""

	var/fuel = 600
	var/max_fuel = 600
	var/obj/item/reagent_containers/fuel_tank/fuel_holder
	var/idle_wasting = 0.5
	var/move_wasting = 0.1

/obj/vehicle/ridden/fuel/New()
	..()
	fuel_holder = new(max_fuel, fuel)

/obj/vehicle/ridden/fuel/attackby(obj/item/weapon/W, mob/user, params) //Refueling
	if(istype(W, /obj/item/reagent_containers))
		fuel_holder.attackby(W, user, params)
		return 1
	return ..()

/obj/vehicle/ridden/fuel/Move(NewLoc,Dir=0,step_x=0,step_y=0)
	. = ..()
	if(engine_on && move_wasting)
		fuel_holder.reagents.remove_reagent("welding_fuel",move_wasting)

/obj/vehicle/ridden/fuel/process() //If process begining you can sure that engine is on
	var/fuel_wasting

	fuel_wasting += idle_wasting

//Health check
	var/health = (obj_integrity/max_integrity)
	if(health < 1)
		if(health < 0.5 && fuel > 100 && prob(10)) // If vehicle is broken it will burn
			visible_message(span_warning("[src] is badly damaged, the engine has burst into flames!"))
			fuel_wasting += 2
			PoolOrNew(/obj/effect/hotspot, get_turf(src))
			if(prob(50)) //MOAR FIRE
				dyn_explosion(epicenter = src, power = fuel_holder.reagents.get_reagent_amount("welding_fuel")/10, flash_range = 2, adminlog = 0, flame_range = 5 ,silent = 1)

	fuel_holder.reagents.remove_reagent("welding_fuel",fuel_wasting)

	if(fuel_holder.reagents.get_reagent_amount("welding_fuel") < 1)
		StopEngine()

/obj/vehicle/ridden/fuel/start_engine()
	if(fuel_holder.reagents.get_reagent_amount("welding_fuel") < 1)
		to_chat(usr, span_warning("[src] has run out of fuel!"))
		return
	..()
	START_PROCESSING(SSobj, src)

/obj/vehicle/ridden/fuel/stop_engine()
	..()
	STOP_PROCESSING(SSobj, src)

/obj/vehicle/ridden/fuel/verb/ToggleFuelTank()
	set name = "Toggle Fuel Tank"
	set category = "Object"
	set src in view(1)
	fuel_holder.inside = !fuel_holder.inside
	to_chat(usr, span_notice("I changed transfer type."))

/obj/vehicle/ridden/fuel/examine(mob/user)
	. = ..()
	if(fuel_holder)
		var/fuel_percent = fuel_holder.reagents.total_volume / fuel_holder.reagents.maximum_volume * 100
		switch(fuel_percent)
			if(95 to INFINITY)
				. += span_notice("Fuel meter shows 100% ! The fuel tank is full to the top. Let's ride!")
			if(60 to 95)
				. += span_notice("Fuel meter shows 75% ! Not so full, but it'll still last a while.")
			if(25 to 60)
				. += span_notice("Fuel meter shows 50% ! That should be just enough to find more fuel.")
			if(1 to 25)
				. += span_warning("Fuel meter shows 25% ! It's almost out of fuel!")
			else
				. += span_danger("Fuel meter shows 0% ! There is no fuel left!")



/obj/item/reagent_containers/fuel_tank
	name = "fuel tank"
	container_type = OPENCONTAINER
	amount_per_transfer_from_this = 25
	var/inside = 1

/obj/item/reagent_containers/fuel_tank/New(volume, fuel)
	src.volume = volume
	list_reagents = list(/datum/reagent/fuel = fuel)
	..()

/obj/item/reagent_containers/fuel_tank/attackby(obj/item/weapon/W, mob/user, params)
	if(W.is_open_container() && W.reagents)
		if(inside)
			if(!W.reagents.total_volume)
				to_chat(user, span_warning("[W] is empty!"))
				return

			if(src.reagents.total_volume >= src.reagents.maximum_volume)
				to_chat(user, span_notice("[src] is full."))
				return


			var/trans = W.reagents.trans_to(src, amount_per_transfer_from_this)
			to_chat(user, span_notice("I transfer [trans] units of the solution to [src]."))
		else
			if(!src.reagents.total_volume)
				to_chat(user, span_warning("[src] is empty!"))
				return

			if(W.reagents.total_volume >= W.reagents.maximum_volume)
				to_chat(user, span_notice("[W] is full."))
				return


			var/trans = src.reagents.trans_to(W, amount_per_transfer_from_this)
			to_chat(user, span_notice("I transfer [trans] units of the solution to [W]."))

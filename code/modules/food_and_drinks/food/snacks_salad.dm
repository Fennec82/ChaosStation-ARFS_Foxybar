//this category is very little but I think that it has great potential to grow
////////////////////////////////////////////SALAD////////////////////////////////////////////
/obj/item/reagent_containers/food/snacks/salad
	icon = 'icons/obj/food/soupsalad.dmi'
	bitesize = 3
	w_class = WEIGHT_CLASS_NORMAL
	list_reagents = list(/datum/reagent/consumable/nutriment = 7, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("leaves" = 1)
	foodtype = VEGETABLES

/obj/item/reagent_containers/food/snacks/salad/Initialize()
	. = ..()
	eatverb = pick("crunch","devour","nibble","gnaw","gobble","chomp") //who the fuck gnaws and devours on a salad

/obj/item/reagent_containers/food/snacks/salad/aesirsalad
	name = "\improper Aesir salad"
	desc = "Very rarely eaten by Caesar's Legion when nobody is around to comment on the terrible pun."
	icon_state = "aesirsalad"
	bonus_reagents = list(/datum/reagent/medicine/omnizine = 2, /datum/reagent/consumable/nutriment/vitamin = 6)
	list_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/medicine/omnizine = 8, /datum/reagent/consumable/nutriment/vitamin = 6)
	tastes = list("leaves" = 1)
	foodtype = VEGETABLES | ANTITOXIC

/obj/item/reagent_containers/food/snacks/salad/herbsalad
	name = "herb salad"
	desc = "A tasty salad with apples on top."
	icon_state = "herbsalad"
	bonus_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 4)
	list_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("leaves" = 1, "apple" = 1)
	foodtype = VEGETABLES | FRUIT

/obj/item/reagent_containers/food/snacks/salad/validsalad
	name = "potato salad"
	desc = "A herb salad with meatballs and fried potato slices."
	icon_state = "validsalad"
	bonus_reagents = list(/datum/reagent/consumable/doctor_delight = 5, /datum/reagent/consumable/nutriment/vitamin = 4)
	list_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/consumable/doctor_delight = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("leaves" = 1, "potato" = 1, "meat" = 1, "valids" = 1)
	foodtype = VEGETABLES | MEAT | FRIED | JUNKFOOD | FRUIT | ANTITOXIC

/obj/item/reagent_containers/food/snacks/salad/oatmeal
	name = "oatmeal"
	desc = "A nice bowl of oatmeal."
	icon_state = "oatmeal"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 4)
	list_reagents = list(/datum/reagent/consumable/nutriment = 7, /datum/reagent/consumable/milk = 10, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("oats" = 1, "milk" = 1)
	foodtype = DAIRY | GRAIN | BREAKFAST

/obj/item/reagent_containers/food/snacks/salad/fruit
	name = "fruit salad"
	desc = "My standard fruit salad."
	icon_state = "fruitsalad"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/vitamin = 4)
	tastes = list("fruit" = 1)
	foodtype = FRUIT | BREAKFAST

/obj/item/reagent_containers/food/snacks/salad/jungle
	name = "jungle salad"
	desc = "Exotic fruits in a bowl."
	icon_state = "junglesalad"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 4)
	list_reagents = list(/datum/reagent/consumable/nutriment = 7, /datum/reagent/consumable/banana = 5, /datum/reagent/consumable/nutriment/vitamin = 4)
	tastes = list("fruit" = 1, "the jungle" = 1)
	foodtype = FRUIT | BREAKFAST

/obj/item/reagent_containers/food/snacks/salad/citrusdelight
	name = "citrus delight"
	desc = "Citrus overload!"
	icon_state = "citrusdelight"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 4)
	list_reagents = list(/datum/reagent/consumable/nutriment = 7, /datum/reagent/consumable/nutriment/vitamin = 5)
	tastes = list("sourness" = 1, "leaves" = 1)
	foodtype = FRUIT | BREAKFAST

/obj/item/reagent_containers/food/snacks/salad/ricebowl
	name = "ricebowl"
	desc = "A bowl of raw rice."
	icon_state = "ricebowl"
	cooked_type = /obj/item/reagent_containers/food/snacks/salad/boiledrice
	list_reagents = list(/datum/reagent/consumable/nutriment = 4)
	tastes = list("rice" = 1)
	foodtype = GRAIN | RAW

/obj/item/reagent_containers/food/snacks/salad/boiledrice
	name = "boiled rice"
	desc = "A warm bowl of rice."
	icon_state = "boiledrice"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("rice" = 1)
	foodtype = GRAIN | BREAKFAST

/obj/item/reagent_containers/food/snacks/salad/ricepudding
	name = "rice pudding"
	desc = "Everybody loves rice pudding!"
	icon_state = "ricepudding"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("rice" = 1, "sweetness" = 1)
	foodtype = GRAIN | DAIRY

/obj/item/reagent_containers/food/snacks/salad/ricepork
	name = "rice and pork"
	desc = "Well, it looks like pork..."
	icon_state = "riceporkbowl"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 4)
	tastes = list("rice" = 1, "meat" = 1)
	foodtype = GRAIN | MEAT

/obj/item/reagent_containers/food/snacks/salad/eggbowl
	name = "egg bowl"
	desc = "A bowl of rice with a fried egg."
	icon_state = "eggbowl"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 4)
	tastes = list("rice" = 1, "egg" = 1)
	foodtype = GRAIN | MEAT //EGG = MEAT -NinjaNomNom 2017

/obj/item/reagent_containers/food/snacks/salad/caesar
	name = "caesar salad"
	desc = "I too?"
	icon_state = "ceasar_salad"
	trash = /obj/item/kitchen/knife
	bonus_reagents = list(/datum/reagent/medicine/earthsblood = 1, /datum/reagent/iron = 4)
	tastes = list("iron" = 1, "conspiracy" = 1)
	foodtype = VEGETABLES

/obj/item/reagent_containers/food/snacks/salad/edensalad
	name = "\improper Salad of Eden"
	desc = "A salad brimming with untapped potential."
	icon_state = "eden_salad"
	list_reagents = list(/datum/reagent/consumable/nutriment = 7, /datum/reagent/consumable/nutriment/vitamin = 5, /datum/reagent/medicine/earthsblood = 3, /datum/reagent/medicine/omnizine = 5, /datum/reagent/drug/happiness = 2)
	tastes = list("hope" = 1)
	foodtype = VEGETABLES | ANTITOXIC

/obj/item/reagent_containers/food/snacks/salad/gumbo
	name = "black eyed gumbo"
	desc = "A spicy and savory meat and rice dish."
	icon_state = "gumbo"
	list_reagents = list(/datum/reagent/consumable/capsaicin = 2, /datum/reagent/consumable/nutriment/vitamin = 3, /datum/reagent/consumable/nutriment = 5)
	tastes = list("building heat" = 2, "savory meat and vegtables" = 1)
	foodtype = GRAIN | MEAT | VEGETABLES

/obj/item/reagent_containers/food/snacks/salad/desertsalad
	name = "desert salad"
	desc = "A tasty cactus salad topped with brahamin bits and roasted nuts."
	icon_state = "Desert Salad"
	bonus_reagents = list(/datum/reagent/medicine/earthsblood = 1, /datum/reagent/iron = 4)
	list_reagents = list(/datum/reagent/consumable/capsaicin = 2, /datum/reagent/consumable/nutriment/vitamin = 3, /datum/reagent/consumable/nutriment = 5)
	tastes = list("tender meat" = 1, "acidic cactus" = 3, "crunchy nuts" = 1)
	foodtype = VEGETABLES | FRUIT | MEAT

/obj/item/reagent_containers/food/snacks/salad/kale_salad
	name = "kale salad"
	desc = "A healthy kale salad drizzled in oil, perfect for warm summer months."
	icon_state = "kale_salad"
	list_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 12, /datum/reagent/consumable/nutriment = 12)
	tastes = list("healthy greens" = 2, "olive dressing" = 1)
	foodtype = VEGETABLES

/obj/item/reagent_containers/food/snacks/salad/greek_salad
	name = "Greek salad"
	desc = "A popular salad made of tomatoes, onions, feta cheese, and olives all drizzled in olive oil. Though it feels like it's missing something..."
	icon_state = "greek_salad"
	list_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 12, /datum/reagent/consumable/nutriment = 12)
	tastes = list("healthy greens" = 2, "olive dressing" = 1, "feta cheese" = 1)
	foodtype = VEGETABLES | DAIRY

/obj/item/reagent_containers/food/snacks/salad/spring_salad
	name = "spring salad"
	desc = "A simple salad of carrots, lettuce and peas drizzled in oil with a pinch of salt."
	icon_state = "spring_salad"
	list_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 12, /datum/reagent/consumable/nutriment = 12)
	tastes = list("crisp greens" = 2, "olive dressing" = 2, "salt" = 1)
	foodtype = VEGETABLES

/obj/item/reagent_containers/food/snacks/salad/potato_salad
	name = "potato salad"
	desc = "A dish of boiled potatoes mixed with boiled eggs, onions, and mayonnaise. A staple of every self-respecting barbeque."
	icon_state = "potato_salad"
	list_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 12, /datum/reagent/consumable/nutriment = 12)
	tastes = list("creamy potatoes" = 2, "eggs" = 2, "mayonnaise" = 1, "onions" = 1)
	foodtype = VEGETABLES | BREAKFAST

/obj/item/reagent_containers/food/snacks/salad/spinach_fruit_salad
	name = "spinach fruit salad"
	desc = "A vibrant fruit salad made of spinach, berries, and pineapple chunks all drizzled in oil. Yummy!"
	icon_state = "spinach_fruit_salad"
	list_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 12, /datum/reagent/consumable/nutriment = 12)
	tastes = list("spinach" = 2, "berries" = 2, "pineapple" = 2, "dressing" = 1)
	foodtype = VEGETABLES | FRUIT

/obj/item/reagent_containers/food/snacks/salad/antipasto_salad
	name = "antipasto salad"
	desc = "A traditional Italian salad made of salami, mozzarella cheese, olives, and tomatoes. Often served as a first course meal."
	icon_state = "antipasto_salad"
	list_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 12, /datum/reagent/consumable/nutriment = 12)
	tastes = list("lettuce" = 2, "salami" = 2, "mozzarella cheese" = 2, "tomatoes" = 2, "dressing" = 1)
	foodtype = VEGETABLES | DAIRY | MEAT

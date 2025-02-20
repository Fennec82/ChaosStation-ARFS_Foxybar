/obj/item/reagent_containers/food/snacks/sandwich
	name = "sandwich"
	desc = "A grand creation of meat, cheese, bread, and several leaves of lettuce! Arthur Dent would be proud."
	icon = 'icons/obj/food/burgerbread.dmi'
	icon_state = "sandwich"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/nutriment/vitamin = 1)
	cooked_type = /obj/item/reagent_containers/food/snacks/toastedsandwich
	tastes = list("meat" = 2, "cheese" = 1, "bread" = 2, "lettuce" = 1)
	foodtype = GRAIN | VEGETABLES

/obj/item/reagent_containers/food/snacks/toastedsandwich
	name = "toasted sandwich"
	desc = "Now if you only had a pepper bar."
	icon = 'icons/obj/food/burgerbread.dmi'
	icon_state = "toastedsandwich"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/carbon = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/carbon = 2)
	tastes = list("toast" = 1)
	foodtype = GRAIN

/obj/item/reagent_containers/food/snacks/baconlettucetomato
	name = "blt sandwich"
	desc = "The classic bacon, lettuce tomato sandwich."
	icon = 'icons/obj/food/burgerbread.dmi'
	icon_state = "blt"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("bacon" = 1, "lettuce" = 1, "tomato" = 1, "mayo" = 1)
	foodtype = GRAIN | MEAT | VEGETABLES

/obj/item/reagent_containers/food/snacks/grilledcheese
	name = "grilled cheese sandwich"
	desc = "Goes great with Tomato soup!"
	icon = 'icons/obj/food/burgerbread.dmi'
	icon_state = "toastedsandwich"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 7, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("toast" = 1, "cheese" = 1)
	foodtype = GRAIN | DAIRY

/obj/item/reagent_containers/food/snacks/jellysandwich
	name = "jelly sandwich"
	desc = "I wish you had some peanut butter to go with this..."
	icon = 'icons/obj/food/burgerbread.dmi'
	icon_state = "jellysandwich"
	bitesize = 3
	tastes = list("bread" = 1, "jelly" = 1)
	foodtype = GRAIN

/obj/item/reagent_containers/food/snacks/jellysandwich/slime
	bonus_reagents = list(/datum/reagent/toxin/slimejelly = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/toxin/slimejelly = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	foodtype  = GRAIN | TOXIC

/obj/item/reagent_containers/food/snacks/jellysandwich/cherry
	bonus_reagents = list(/datum/reagent/consumable/cherryjelly = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/cherryjelly = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	foodtype = GRAIN | FRUIT

/obj/item/reagent_containers/food/snacks/jellysandwich/pbj
	name = "\improper PB & J sandwich"
	desc = "A grand creation of peanut butter, jelly and bread! An all-american classic."
	icon_state = "pbjsandwich"
	tastes = list("bread" = 1, "jelly" = 1, "peanuts" = 1)

/obj/item/reagent_containers/food/snacks/jellysandwich/pbj/cherry
	bonus_reagents = list(/datum/reagent/consumable/cherryjelly = 5, /datum/reagent/consumable/peanut_butter = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/cherryjelly = 5, /datum/reagent/consumable/peanut_butter = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	foodtype = GRAIN | FRUIT

/obj/item/reagent_containers/food/snacks/jellysandwich/pbj/slime
	bonus_reagents = list(/datum/reagent/toxin/slimejelly = 5, /datum/reagent/consumable/peanut_butter = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/toxin/slimejelly = 5, /datum/reagent/consumable/peanut_butter = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	foodtype  = GRAIN | TOXIC

/obj/item/reagent_containers/food/snacks/peanutbutter_sandwich
	name = "peanut butter sandwich"
	desc = "I wish you had some jelly to go with this..."
	icon = 'icons/obj/food/burgerbread.dmi'
	icon_state = "peanutbuttersandwich"
	bitesize = 3
	bonus_reagents = list(/datum/reagent/consumable/peanut_butter = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/peanut_butter = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	foodtype  = GRAIN

/obj/item/reagent_containers/food/snacks/notasandwich
	name = "not-a-sandwich"
	desc = "Something seems to be wrong with this, you can't quite figure what. Maybe it's his moustache."
	icon = 'icons/obj/food/burgerbread.dmi'
	icon_state = "notasandwich"
	bonus_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 6)
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/nutriment/vitamin = 6)
	tastes = list("nothing suspicious" = 1)
	foodtype = GRAIN | GROSS

/obj/item/reagent_containers/food/snacks/jelliedtoast
	name = "jellied toast"
	desc = "A slice of toast covered with delicious jam."
	icon = 'icons/obj/food/burgerbread.dmi'
	icon_state = "jellytoast"
	bitesize = 3
	tastes = list("toast" = 1, "jelly" = 1)
	foodtype = GRAIN

/obj/item/reagent_containers/food/snacks/jelliedtoast/cherry
	bonus_reagents = list(/datum/reagent/consumable/cherryjelly = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/cherryjelly = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	foodtype = GRAIN | FRUIT | SUGAR

/obj/item/reagent_containers/food/snacks/jelliedtoast/slime
	bonus_reagents = list(/datum/reagent/toxin/slimejelly = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/toxin/slimejelly = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	foodtype = GRAIN | TOXIC | SUGAR

/obj/item/reagent_containers/food/snacks/peanut_buttertoast
	name = "peanut butter toast"
	desc = "A slice of toast covered with delicious peanut butter."
	icon = 'icons/obj/food/burgerbread.dmi'
	icon_state = "peanutbuttertoast"
	bitesize = 3
	bonus_reagents = list(/datum/reagent/consumable/peanut_butter = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/peanut_butter = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("toast" = 1, "peanuts" = 1)
	foodtype = GRAIN


/obj/item/reagent_containers/food/snacks/twobread
	name = "two bread"
	desc = "This seems awfully bitter."
	icon = 'icons/obj/food/burgerbread.dmi'
	icon_state = "twobread"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("bread" = 2)
	foodtype = GRAIN

/obj/item/reagent_containers/food/snacks/tuna_sandwich
	name = "tuna sandwich"
	desc = "Both a salad and a sandwich in one."
	icon = 'icons/obj/food/burgerbread.dmi'
	icon_state = "tunasandwich"
	list_reagents = list(/datum/reagent/consumable/nutriment = 12, /datum/reagent/consumable/nutriment/vitamin = 4)
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 3)
	tastes = list("tuna" = 4, "mayonnaise" = 2, "bread" = 2)
	foodtype = GRAIN | MEAT

/obj/item/reagent_containers/food/snacks/meatballsub
	name = "meatball sub"
	desc = "At some point, you need to be the cheif sub."
	icon = 'icons/obj/food/food.dmi'
	icon_state = "meatballsub"
	list_reagents = list(/datum/reagent/consumable/nutriment = 12, /datum/reagent/consumable/nutriment/vitamin = 4)
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 3)
	tastes = list("meat" = 2, "toasted bread" = 1)
	foodtype = GRAIN | MEAT

/obj/item/reagent_containers/food/snacks/danish_hotdog
	name = "danish hotdog"
	desc = "Appetizing bun, with a sausage in the middle, covered with sauce, fried onion and pickles rings"
	icon = 'icons/obj/food/food.dmi'
	icon_state = "danish_hotdog"
	bitesize = 4
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/ketchup = 3, /datum/reagent/consumable/nutriment/vitamin = 7)
	tastes = list("bun" = 3, "meat" = 2, "fried onion" = 1, "pickles" = 1)
	foodtype = GRAIN | MEAT | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/reagent_containers/food/snacks/peanutbutterbanana
	name = "peanut butter and banana sandwich"
	desc = "Maybe not for everyone but man does it smell great."
	icon = 'icons/obj/food/burgerbread.dmi'
	icon_state = "peanut_butter_banana_sandwich"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 7, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("toast" = 1, "bananas" = 1, "peanut butter" = 1)
	foodtype = GRAIN | DAIRY

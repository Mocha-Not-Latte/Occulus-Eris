/obj/item/gun/projectile/automatic/ak47
	name = "Excelsior .30 AKMS"
	desc = "Weapon of the oppressed, oppressors, and extremists of all flavours. \
		 This is a copy of an ancient semi-automatic rifle chambered for .30 Rifle. If it won't fire, percussive maintenance should get it working again. \
		 It is known for its easy maintenance, and low price. This gun is not in active military service anymore, but has become ubiquitous among criminals and insurgents. \
		 This is a high-quality copy, which has an automatic fire mode."
	icon = 'icons/obj/guns/projectile/ak/excel.dmi'
	icon_state = "AK"
	item_state = "AK"
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_LRIFLE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_COVERT = 4)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	magazine_type = /obj/item/ammo_magazine/lrifle
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 3500
	fire_sound = 'sound/weapons/guns/fire/cal/30.ogg'
	unload_sound = 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cocked_sound = 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	recoil_buildup = 1.8
	one_hand_penalty = 15 //automatic rifle level
	spawn_blacklisted = TRUE
	gun_parts = list(/obj/item/part/gun = 3 ,/obj/item/stack/material/plasteel = 7)

	init_firemodes = list(
		FULL_AUTO_400,
		SEMI_AUTO_NODELAY,
		BURST_5_ROUND
		)

	var/folded = FALSE

/obj/item/gun/projectile/automatic/ak47/proc/can_interact(mob/user)
	if((!ishuman(user) && (loc != user)) || user.stat || user.restrained())
		return 1
	if(istype(loc, /obj/item/storage))
		return 2
	return 0

/obj/item/gun/projectile/automatic/ak47/on_update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"
		itemstring += "_full"

	if(wielded)
		itemstring += "_doble"

	if(folded)
		iconstring += "_f"
		itemstring += "_f"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/ak47/Initialize()
	. = ..()
	update_icon()

//////////////////////////////////////////SA//////////////////////////////////////////

/obj/item/gun/projectile/automatic/ak47/sa
	name = "SA Car .30 \"Krinkov\""					// US nickname for AKSu
	desc = "Weapon of the oppressed, oppressors, and extremists of all flavours. \
			This is a copy of an ancient semi-automatic rifle chambered for .30 Rifle. If it won't fire, percussive maintenance should get it working again. \
			It is known for its easy maintenance, and low price. This gun is not in active military service anymore, but has become ubiquitous among criminals and insurgents. \
			This shortened rifle was made specifically for boarding actions with a folding stock and short barrel."
	icon = 'icons/obj/guns/projectile/ak/krinkov.dmi'
	w_class = ITEM_SIZE_BULKY	//small rifle, also because it's basically an smg now
	recoil_buildup = 1.5
	damage_multiplier = 0.9 //Better control, worse damage
	penetration_multiplier = 1.2

	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10)

	price_tag = 3500

/obj/item/gun/projectile/automatic/ak47/sa/CtrlShiftClick(mob/user)
	. = ..()

	var/able = can_interact(user)

	if(able == 1)
		return

	if(able == 2)
		to_chat(user, SPAN_NOTICE("You cannot [folded ? "unfold" : "fold"] the stock while \the [src] is in a container."))
		return

	fold()


/obj/item/gun/projectile/automatic/ak47/sa/verb/quick_fold(mob/user)
	set name = "Fold or Unfold Stock"
	set category = "Object"
	set src in view(1)

	if(can_interact(user) == 1)
		return

	fold(user)

/obj/item/gun/projectile/automatic/ak47/sa/proc/fold(user)

	if(folded)
		to_chat(user, SPAN_NOTICE("You unfold the stock on \the [src]."))
		recoil_buildup = 1.5
		w_class = ITEM_SIZE_BULKY
		folded = FALSE
	else
		to_chat(user, SPAN_NOTICE("You fold the stock on \the [src]."))
		recoil_buildup = 1.8
		w_class = ITEM_SIZE_NORMAL
		folded = TRUE

	playsound(loc, 'sound/weapons/guns/interact/selector.ogg', 100, 1)
	update_icon()

//////////////////////////////////////////FS//////////////////////////////////////////

/obj/item/gun/projectile/automatic/ak47/fs
	name = "FS AR .30 \"Vipr\""						// Vipr like a play on Viper and Vepr
	desc = "Weapon of the oppressed, oppressors, and extremists of all flavours. \
			This is a copy of an ancient semi-automatic rifle chambered for .30 Rifle. If it won't fire, percussive maintenance should get it working again. \
			It is known for its easy maintenance, and low price. This gun is not in active military service anymore, but has become ubiquitous among criminals and insurgents. \
			This cheap copy has been made to look as least militaristic as possible to be sold to as many civilian populations as possible."
	icon = 'icons/obj/guns/projectile/ak/vipr.dmi'
	w_class = ITEM_SIZE_HUGE
	recoil_buildup = 1.5	//Heavy, semi-auto and burst only
	damage_multiplier = 1.1	//Long barrels help you get more out of a round.

	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 10)
	price_tag = 3000
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	init_firemodes = list(
	SEMI_AUTO_NODELAY,
	BURST_3_ROUND,
	BURST_5_ROUND
	)

	price_tag = 2000
	spawn_tags = SPAWN_TAG_FS_PROJECTILE
	spawn_blacklisted = FALSE



//////////////////////////////////////////IH//////////////////////////////////////////

/obj/item/gun/projectile/automatic/ak47/fs/ih
	name = "FS AR .30 \"Venger\""						// From a song
	desc = "Weapon of the oppressed, oppressors, and extremists of all flavours. \
			This is a copy of an ancient semi-automatic rifle chambered for .30 Rifle. If it won't fire, percussive maintenance should get it working again. \
			It is known for its easy maintenance, and low price. This gun is not in active military service anymore, but has become ubiquitous among criminals and insurgents. \
			This rifle is from the Frozen Star's Planetary Defence line. Painted in IH blue and black, with a folding stock so it can be stored compactly for years without use."
	icon = 'icons/obj/guns/projectile/ak/venger.dmi'
	spawn_blacklisted = TRUE
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10)

/obj/item/gun/projectile/automatic/ak47/fs/ih/CtrlShiftClick(mob/user)
	. = ..()

	var/able = can_interact(user)

	if(able == 1)
		return

	if(able == 2)
		to_chat(user, SPAN_NOTICE("The stock on \the [src] gets caught on the bag."))
		return

	fold()

/obj/item/gun/projectile/automatic/ak47/fs/ih/verb/quick_fold(mob/user)	//Easier to redo the proc than redo everything else
	set name = "Fold or Unfold Stock"
	set category = "Object"
	set src in view(1)

	if(can_interact(user) == 1)
		return
	fold(user)

/obj/item/gun/projectile/automatic/ak47/fs/ih/proc/fold(user)

	if(folded)
		to_chat(user, SPAN_NOTICE("You unfold the stock on \the [src]."))
		recoil_buildup = 1.5
		w_class = ITEM_SIZE_HUGE
		folded = FALSE
	else
		to_chat(user, SPAN_NOTICE("You fold the stock on \the [src]."))
		recoil_buildup = 1.8
		w_class = ITEM_SIZE_BULKY
		folded = TRUE

	playsound(loc, 'sound/weapons/guns/interact/selector.ogg', 100, 1)
	update_icon()

//////////////////////////////////////////Makeshift//////////////////////////////////////////

/obj/item/gun/projectile/automatic/ak47/makeshift
	name = "Makeshift AR .30 \"Kalash\""
	desc = "Weapon of the oppressed, oppressors, and extremists of all flavours. \
			This is a copy of an ancient semi-automatic rifle chambered for .30 Rifle. If it won't fire, percussive maintenance should get it working again. \
			It is known for its easy maintenance, and low price. This gun is not in active military service anymore, but has become ubiquitous among criminals and insurgents. \
			This crude copy shows just how forgiving the design can be."
	icon = 'icons/obj/guns/projectile/ak/kalash.dmi'
	w_class = ITEM_SIZE_HUGE
	recoil_buildup = 1.6	//Full size, but cheap

	origin_tech = list(TECH_COMBAT = 2)	//bad copies don't give good science
	matter = list(MATERIAL_STEEL = 20, MATERIAL_WOOD = 10)

	init_firemodes = list(
		SEMI_AUTO_NODELAY	//too poorly made for burst or automatic
	)

	price_tag = 500

/obj/item/gun/projectile/automatic/ak47/makeshift/attackby(obj/item/W, mob/user)
	if(QUALITY_SCREW_DRIVING in W.tool_qualities)
		to_chat(user, SPAN_NOTICE("You begin to rechamber \the [src]."))
		if(!ammo_magazine && W.use_tool(user, src, WORKTIME_NORMAL, QUALITY_SCREW_DRIVING, FAILCHANCE_NORMAL, required_stat = STAT_MEC))
			if(caliber == CAL_LRIFLE)
				caliber = CAL_SRIFLE
				to_chat(user, SPAN_WARNING("You successfully rechamber \the [src] to .20 Caliber."))
			else if(caliber == CAL_SRIFLE)
				caliber = CAL_CLRIFLE
				mag_well = MAG_WELL_IH
				to_chat(user, SPAN_WARNING("You successfully rechamber \the [src] to .25 Caseless."))
			else if(caliber == CAL_CLRIFLE)
				caliber = CAL_LRIFLE
				mag_well = MAG_WELL_RIFLE
				to_chat(user, SPAN_WARNING("You successfully rechamber \the [src] to .30 Caliber."))
		else
			to_chat(user, SPAN_WARNING("You cannot rechamber a loaded firearm!"))
			return
	..()

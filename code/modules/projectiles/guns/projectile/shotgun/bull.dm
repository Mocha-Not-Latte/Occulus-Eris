/obj/item/gun/projectile/shotgun/bull
	name = "FS SG \"Bull\""
	desc = "A \"Frozen Star\" double-barreled pump-action shotgun. Marvel of engineering, this gun is often used by Aegis tactical units. \
			Due to shorter than usual barrels, damage are somewhat lower and recoil kicks slightly harder, but possibility to fire two barrels at once overshadows all bad design flaws."
	icon = 'icons/obj/guns/projectile/bull.dmi'
	icon_state = "bull"
	item_state = "bull"
	load_method = SINGLE_CASING|SPEEDLOADER
	handle_casings = HOLD_CASINGS
	max_shells = 7
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	flags =  CONDUCT
	slot_flags = SLOT_BACK
	caliber = CAL_SHOTGUN
	var/reload = 1
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 4)
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 6)
	damage_multiplier = 0.75
	penetration_multiplier = 0.75
	one_hand_penalty = 10 //compact shotgun level
	burst_delay = null
	fire_delay = null
	bulletinsert_sound = 'sound/weapons/guns/interact/shotgun_insert.ogg'
	fire_sound = 'sound/weapons/guns/fire/cal/shotgun.ogg'
	move_delay = null
	init_firemodes = list(
		list(mode_name="fire one barrel at a time", burst=1, icon="semi"),
		list(mode_name="fire both barrels at once", burst=2, icon="burst"),
		)

	spawn_tags = SPANW_TAG_FS_SHOTGUN
	price_tag = 2000 //gives tactical advantage with beanbags, but consumes more ammo and hits less harder with lethal ammo, so Gladstone or Regulator would be better for lethal takedowns in general
	wield_delay = 0.9 SECOND
	wield_delay_factor = 0.2 // 40 vig

/obj/item/gun/projectile/shotgun/bull/proc/pump(mob/M as mob)
	var/turf/newloc = get_turf(src)
	playsound(M, 'sound/weapons/shotgunpump.ogg', 60, 1)
	if(chambered)
		if(!chambered.BB)
			chambered.forceMove(newloc) //Eject casing
			chambered = null
	if(!chambered)
		if(loaded.len)
			var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
			loaded -= AC //Remove casing from loaded list.
			chambered = AC
			if(chambered.BB != null)
				reload = 0
	update_icon()

/obj/item/gun/projectile/shotgun/bull/consume_next_projectile()
	if (chambered)
		return chambered.BB
	return null

/obj/item/gun/projectile/shotgun/bull/handle_post_fire()
	..()
	var/turf/newloc = get_turf(src)
	if(chambered)
		chambered.forceMove(newloc) //Eject casing
		chambered = null
		if(!reload)
			if(loaded.len)
				var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
				loaded -= AC //Remove casing from loaded list.
				chambered = AC
	reload = 1

/obj/item/gun/projectile/shotgun/bull/unload_ammo(user, allow_dump)
	var/turf/newloc = get_turf(src)
	if(chambered)
		chambered.forceMove(newloc) //Eject casing
		chambered = null
		reload = 1
	..(user, allow_dump=1)

/obj/item/gun/projectile/shotgun/bull/attack_self(mob/user as mob)
	if(reload)
		if(wielded)
			pump(user)
		else if (world.time >= recentpumpmsg + 5)
			to_chat(user, SPAN_WARNING("You need to wield this gun to pump it!"))
			recentpumpmsg = world.time
	else
		if(firemodes.len > 1)
			..()
		else
			unload_ammo(user)

/obj/item/gun/projectile/shotgun/bull/proc/update_charge()
	var/ratio = get_ammo() / (max_shells + 1)//1 in the chamber
	ratio = round(ratio, 0.25) * 100
	add_overlays("[ratio]_PW")

/obj/item/gun/projectile/shotgun/bull/on_update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(wielded)
		itemstring += "_doble"

	icon_state = iconstring
	set_item_state(itemstring)
	cut_overlays()
	update_charge()

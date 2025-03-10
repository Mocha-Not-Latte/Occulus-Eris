/obj/item/gun/energy/toxgun
	name = "Prototype: phoron pistol"
	desc = "A specialized firearm designed to fire lethal bolts of phoron."
	icon = 'icons/obj/guns/energy/toxgun.dmi'
	icon_state = "toxgun"
	fire_sound = 'sound/effects/stealthoff.ogg'
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 5, TECH_PHORON = 4)
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PHORON = 5)
	can_dual = 1
	price_tag = 2500
	projectile_type = /obj/item/projectile/energy/phoron
	wield_delay = 0.2 SECOND
	wield_delay_factor = 0.2 // 20 vig

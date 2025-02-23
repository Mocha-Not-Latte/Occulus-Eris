/obj/item/gun/energy/floragun
	name = "Prototype: floral somatoray"
	desc = "A tool that discharges controlled radiation which induces mutation in plant cells."
	icon = 'icons/obj/guns/energy/flora.dmi'
	icon_state = "floramut100"
	item_state = "floramut"
	fire_sound = 'sound/effects/stealthoff.ogg'
	charge_cost = 100
	projectile_type = /obj/item/projectile/energy/floramut
	origin_tech = list(TECH_MATERIAL = 2, TECH_BIO = 3, TECH_POWER = 3)
	modifystate = "floramut"
	self_recharge = 1
	matter = list(MATERIAL_STEEL = 20)
	price_tag = 1000
	spawn_tags = SPAWN_TAG_GUN_ENERGY_BOTANICAL
	init_firemodes = list(
		list(mode_name="induce mutations", projectile_type=/obj/item/projectile/energy/floramut, modifystate="floramut", item_modifystate="mut", icon="kill"),
		list(mode_name="increase yield", projectile_type=/obj/item/projectile/energy/florayield, modifystate="florayield", item_modifystate="yield", icon="stun"),
		)
	wield_delay = 1 SECOND
	wield_delay_factor = 0.2 // 20 vig

/obj/item/gun/energy/floragun/afterattack(obj/target, mob/user, adjacent_flag)
	//allow shooting into adjacent hydrotrays regardless of intent
	if(adjacent_flag && istype(target,/obj/machinery/portable_atmospherics/hydroponics))
		user.visible_message(SPAN_DANGER("\The [user] fires \the [src] into \the [target]!"))
		Fire(target,user)
		return
	..()

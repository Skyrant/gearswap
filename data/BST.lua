-------------------------------------------------------------------------------------------------------------------
-- F9 - Cycle Offense Mode (the offensive half of all 'hybrid' melee modes).
-- Ctrl-F9 - Cycle Hybrid Mode (the defensive half of all 'hybrid' melee modes).
-- Alt-F9 - Cycle Ranged Mode.
-- Win-F9 - Cycle Weaponskill Mode.
-- F10 - Activate emergency Physical Defense Mode. Replaces Magical Defense Mode, if that was active.
-- F11 - Activate emergency Magical Defense Mode. Replaces Physical Defense Mode, if that was active.
-- Ctrl-F10 - Cycle type of Physical Defense Mode in use.
-- Alt-F12 - Turns off any emergency defense mode.
-- Alt-F10 - Toggles Kiting Mode.
-- Ctrl-F11 - Cycle Casting Mode.
-- F12 - Update currently equipped gear, and report current status.
-- Ctrl-F12 - Cycle Idle Mode.
-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------

-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

	-- Load and initialize the include file.
	include('Mote-Include.lua')
end

function job_setup()
	get_combat_form()
end


function user_setup()
	-- Ctrl-F12 : Cycle Idle Mode.
	state.IdleMode:options('Normal', 'Reraise')
    -- F9 : Cycle Offense Mode (the offensive half of all 'hybrid' melee modes).
	state.OffenseMode:options('Normal', 'Acc', 'Atk', 'PetDT')
	-- Ctrl-F8 : Cycle Correlation Mode
	state.CorrelationMode = M{['description']='Correlation Mode', 'Neutral', 'HighAcc', 'MaxAcc',}
	send_command('bind ^f8 gs c cycle CorrelationMode')
	-- ALT-` :  Cycle Capacity Mode
	state.CapacityMode = M(false, 'Capacity Point Mantle')
	send_command('bind !` gs c toggle CapacityMode')
	
	---------------------------------------------------------------------------	
    -- Augmented Gear that is used often --------------------------------------
    ---------------------------------------------------------------------------

	LeftDarkRing  = {name="Dark Ring", augments={'Breath dmg. taken -5%','Phys. dmg. taken -4%','Magic dmg. taken -3%'}}  
	RightDarkRing = {name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -4%','Spell interruption rate down -3%'}}


	SkullrenderPD = { name="Skullrender", augments={'DMG:+15','Pet: Accuracy+20','Pet: Attack+20',}}
	SkullrenderMD = { name="Skullrender", augments={'DMG:+15','Pet: "Mag.Atk.Bns."+15','Pet: "Regen"+2',}}

	ValorousMaskPD  = { name="Valorous Mask", augments={'Pet: Attack+27 Pet: Rng.Atk.+27','Pet: "Dbl.Atk."+3 Pet: Crit.hit rate +3','Pet: VIT+2','Pet: Accuracy+11 Pet: Rng. Acc.+11',}}
	ValorousMailPD  = { name="Valorous Mail", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','Pet: "Dbl.Atk."+3 Pet: Crit.hit rate +3','Pet: DEX+15','Pet: Attack+8 Pet: Rng.Atk.+8',}}
	ValorousMittsPD = { name="Valorous Mitts", augments={'Pet: "Dbl.Atk."+2 Pet: Crit.hit rate +2','Pet: INT+10','Pet: Accuracy+13 Pet: Rng. Acc.+13','Pet: Attack+13 Pet: Rng.Atk.+13',}}
	ValorousHosePD  = { name="Valor. Hose", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl.Atk."+2 Pet: Crit.hit rate +2','Pet: VIT+4','Pet: Attack+14 Pet: Rng.Atk.+14',}}

	EmichoGauntletsACC = { name="Emicho Gauntlets", augments={'Accuracy+20','"Dual Wield"+5','Pet: Accuracy+20',}}
	EmichoHoseACC      = { name="Emicho Hose",      augments={'Pet: Accuracy+15','Pet: Attack+15','Pet: "Dbl. Atk."+3',}}
	EmichoGambierasACC = { name="Emicho Gambieras", augments={'Pet: Accuracy+15','Pet: Attack+15','Pet: "Dbl. Atk."+3',}}
	
	ValorousMaskMD  ={ name="Valorous Mask", augments={'Pet: "Mag.Atk.Bns."+28','Pet: "Subtle Blow"+5','Pet: STR+4','Pet: Accuracy+10 Pet: Rng. Acc.+10',}}
	ValorousHoseMD  ={ name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+30','Pet: "Dbl.Atk."+2 Pet: Crit.hit rate +2','Pet: Accuracy+5 Pet: Rng. Acc.+5','Pet: Attack+4 Pet: Rng.Atk.+4',}}
	ArtioMAB = { name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Haste+10',}}
	ArtioRend= { name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Haste+10',}}
	
	select_default_macro_book()

 end
     
-------------------------------------------------------------------------------
-- Complete list of Ready moves to use with Sic & Ready Recast Desultor Tassets
-------------------------------------------------------------------------------
ready_moves_to_check = S{'Sic','Whirl Claws','Dust Cloud','Foot Kick','Sheep Song','Sheep Charge','Lamb Chop',
	'Rage','Head Butt','Scream','Dream Flower','Wild Oats','Leaf Dagger','Claw Cyclone','Razor Fang','Roar',
	'Gloeosuccus','Palsy Pollen','Soporific','Cursed Sphere','Venom','Geist Wall','Toxic Spit','Numbing Noise',
	'Nimble Snap','Cyclotail','Spoil','Rhino Guard','Rhino Attack','Power Attack','Hi-Freq Field','Sandpit',
	'Sandblast','Venom Spray','Mandibular Bite','Metallic Body','Bubble Shower','Bubble Curtain','Scissor Guard',
	'Big Scissors','Grapple','Spinning Top','Double Claw','Filamented Hold','Frog Kick','Queasyshroom','Silence Gas',
	'Numbshroom','Spore','Dark Spore','Shakeshroom','Blockhead','Secretion','Fireball','Tail Blow','Plague Breath',
	'Brain Crush','Infrasonics','??? Needles','Needleshot','Chaotic Eye','Blaster','Scythe Tail','Ripper Fang',
	'Chomp Rush','Intimidate','Recoil Dive','Water Wall','Snow Cloud','Wild Carrot','Sudden Lunge','Spiral Spin',
	'Noisome Powder','Wing Slap','Beak Lunge','Suction','Drainkiss','Acid Mist','TP Drainkiss','Back Heel','Jettatura',
	'Choke Breath','Fantod','Charged Whisker','Purulent Ooze','Corrosive Ooze','Tortoise Stomp','Harden Shell',
	'Aqua Breath','Sensilla Blades','Tegmina Buffet','Molting Plumage','Swooping Frenzy','Pentapeck','Sweeping Gouge',
	'Zealous Snort','Somersault ','Tickling Tendrils','Stink Bomb','Nectarous Deluge','Nepenthic Plunge','Pecking Flurry',
	'Pestilent Plume','Foul Waters','Spider Web','Sickle Slash','Frogkick','Ripper Fang','Scythe Tail','Chomp Rush'}

-------------------------------------------------------------------------------
-- Magic Attack Bonus Ready Moves ---------------------------------------------
-------------------------------------------------------------------------------
mab_ready_moves = S{
	'Cursed Sphere','Venom','Toxic Spit','Venom Spray','Bubble Shower','Fireball','Plague Breath','Snow Cloud','Acid Spray',
	'Silence Gas','Dark Spore','Charged Whisker','Purulent Ooze','Aqua Breath','Stink Bomb','Nectarous Deluge',
	'Nepenthic Plunge','Foul Waters','Dust Cloud','Sheep Song','Scream','Dream Flower','Roar','Gloeosuccus','Palsy Pollen',
	'Soporific','Geist Wall','Numbing Noise','Spoil','Hi-Freq Field','Sandpit','Sandblast','Filamented Hold','Spore',
	'Infrasonics','Chaotic Eye','Blaster','Intimidate','Noisome Powder','TP Drainkiss','Jettatura','Spider Web',
	'Corrosive Ooze','Molting Plumage','Swooping Frenzy','Pestilent Plume',}

function file_unload()
	if binds_on_unload then
		binds_on_unload()
	end
	send_command('unbind !=')
	send_command('unbind ^=')
	send_command('unbind !f8')
	send_command('unbind ^f8')
	send_command('unbind @f8')
	send_command('unbind ^f11')
end

-------------------------------------------------------------------------------
-- Gearsets -------------------------------------------------------------------
-------------------------------------------------------------------------------
function init_gear_sets()
	
	---------------------------------------------------------------------------
	-- Special Sets -----------------------------------------------------------
	---------------------------------------------------------------------------
	sets.CapacityMantle = {back="Mecistopins Mantle"}
	sets.midcast.Pet.TPBonus = {hands="Nukumi Manoplas",}
	sets.midcast.Pet.ReadyRecast = {sub="Charmer's Merlin",legs="Desultor Tassets",}

	---------------------------------------------------------------------------
	-- PRECAST SETS -----------------------------------------------------------
    ---------------------------------------------------------------------------

  sets.precast.JA['Killer Instinct'] = {head="Ankusa Helm +1"}
	sets.precast.JA['Bestial Loyalty'] = {main="Arktoi",hands="Ankusa Gloves",body="Acro Surcoat",}
	sets.precast.JA['Call Beast'] 	   = {main="Arktoi",hands="Ankusa Gloves",body="Acro Surcoat",}
    
  sets.precast.JA.Familiar = {legs="Ankusa Trousers"}
	sets.precast.JA.Tame = {head="Totemic Helm +1",}
	sets.precast.JA.Spur = {back="Artio's Mantle",feet="Nukumi Ocreae +1"}
	
	---------------------------------------------------------------------------
	-- This is what will equip when you use Reward. --------------------------- 
	-- No need to manually equip Pet Food Theta. ------------------------------
	---------------------------------------------------------------------------
	sets.precast.JA.Reward = { ammo="Pet Food Theta",
		head="Khimaira Bonnet", --[[neck="Aife's Medal",]] ear1="Lifestorm Earring", --[[ear2="Neptune's Pearl",]]
		body="Ankusa Jackcoat +1",hands="Emicho Gauntlets", ring1="Aquasoul Ring",ring2="Aquasoul Ring",
		back="Artio's Mantle",waist="Crudelis Belt",legs="Ankusa Trousers +1",feet="Ankusa Gaiters"
	}
	
	---------------------------------------------------------------------------
	-- PET SIC & READY MOVES --------------------------------------------------
	-- This is your base Ready move set, activating for physical Ready moves. -
	-- Merlin/D.Tassets are accounted for already. ----------------------------
	---------------------------------------------------------------------------
	sets.midcast.Pet.WS = {	main="Arktoi",sub=SkullrenderPD,ammo="Demonry Core",
		head=ValorousMaskPD,neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Domesticator's Earring",
		body=ValorousMailPD,hands=EmichoGauntletsACC,ring1="Thurandaut Ring",ring2="Varar ring",
		back="Artio's Mantle",waist="Incarnation Sash",legs=ValorousHosePD,feet=EmichoGambierasACC,
	}
	sets.midcast.Pet.WS.Acc = {	main="Arktoi",sub=SkullrenderPD,ammo="Demonry Core",
		head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Domesticator's Earring",
		body="Tali'ah Manteel +2",hands="Tali'ah Gages +2",ring1="Thurandaut Ring",ring2="Varar ring",
		back="Artio's Mantle",waist="Incarnation Sash",legs="Tali'ah Seraweels +1",feet="Tali'ah Crackows +1",
	}
	sets.midcast.Pet.WS.Atk = {	main="Arktoi",sub=SkullrenderPD,ammo="Demonry Core",
		head=ValorousMaskPD,neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Domesticator's Earring",
		body="Tali'ah Manteel +2",hands=EmichoGauntletsACC,ring1="Thurandaut Ring",ring2="Varar ring",
		back="Artio's Mantle",waist="Incarnation Sash",legs=EmichoHoseACC,feet=EmichoGambierasACC,
	}
	
	---------------------------------------------------------------------------
	--This will equip for Magical Ready moves like Fireball -------------------
	---------------------------------------------------------------------------
	sets.midcast.Pet.MabReady = { main="Arktoi",sub=SkullrenderMD,ammo="Demonry Core",
		head=ValorousMaskMD,neck="Shulmanu Collar",left_ear="Enmerkar Earring",right_ear="Domes. Earring",
		body="Tali'ah Manteel +2",hands=ValorousMittsMD,left_ring="Varar Ring",right_ring="Thurandaut Ring",
		waist="Incarnation Sash",legs=ValorousHoseMD,feet="Tali'ah Crackows +1",
	}
	
	---------------------------------------------------------------------------
	-- STAY set to regenerate the pet -----------------------------------------
	---------------------------------------------------------------------------
	sets.precast.JA['Stay'] = set_combine(sets.idle, {
		neck="Shulmanu Collar",			-- Regen +1
		feet="Emicho Gambieras"			-- Regen +4
	})
	
	---------------------------------------------------------------------------
	-- Feet are handled by precast sets. --------------------------------------
	---------------------------------------------------------------------------
	sets.precast.JA['Heel'] = {feet="Skadi's Jambeaux +1"}
	
	---------------------------------------------------------------------------
	-- NORMAL Idle Set (when you do NOT have a pet out) -----------------------
	---------------------------------------------------------------------------
	sets.idle = { main="Aymur",sub="Arktoi",ammo="Demonry Core",
		head="Tali'ah Turban +2",neck="Loricate Torque +1",ear1="Infused Earring",ear2="Handler's Earring +1",
		body="Jumalik Mail",hands="Tali'ah Gages +2",ring1=LeftDarkRing,ring2=RightDarkRing,
		back="Solemnity Cape",waist="Flume Belt",legs="Tali'ah Seraweels +1",feet="Skadi's Jambeaux +1"
	}

	---------------------------------------------------------------------------
	-- IDLE SETS (TOGGLE between RERAISE and NORMAL with CTRL+F12) ------------
	---------------------------------------------------------------------------
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
	
	---------------------------------------------------------------------------
	-- Idle Set that equips when you have a pet out and not fighting an enemy -
	---------------------------------------------------------------------------
	sets.idle.Pet = { main="Arktoi",sub=SkullrenderPD,ammo="Demonry Core",
		head=ValorousMaskPD,neck="Shulmanu Collar",left_ear="Enmerkar Earring",right_ear="Domes. Earring",
		body="Tali'ah Manteel +2",hands="Regimen Mittens",left_ring="Varar Ring",right_ring="Thurandaut Ring",
		back="Artio's Mantle",waist="Hurch'lan Sash",legs=EmichoHoseACC,feet=EmichoGambierasACC
	}
	
	---------------------------------------------------------------------------
	-- Idle set that equips when you have a pet out and ARE fighting an enemy -
	---------------------------------------------------------------------------
	sets.idle.Pet.Engaged = set_combine(sets.idle.Pet, { main="Arktoi",sub=SkullrenderPD,ammo="Demonry Core",
		head=ValorousMaskPD,neck="Shulmanu Collar",left_ear="Enmerkar Earring",right_ear="Domes. Earring",
		body=ValorousMailPD, hands="Valorous Mitts",left_ring="Varar Ring",right_ring="Thurandaut Ring",
		back="Artio's Mantle",waist="Hurch'lan Sash",legs=EmichoHoseACC,feet=EmichoGambierasACC,
	})

	---------------------------------------------------------------------------
	-- MELEE (SINGLE-WIELD) SETS ----------------------------------------------
	---------------------------------------------------------------------------
	-- Haste Caps: Equipment: 25%, Magic: 43.75%, DW/JA: 25% -------------------
	---------------------------------------------------------------------------

	sets.engaged = {}

	sets.engaged.Acc = { main="Aymur",	sub="Arktoi",	ammo="Ginsen",
		head="Tali'ah Turban +2",	neck="Shulmanu Collar",	left_ear="Cessance Earring", right_ear="Sherida Earring",
		body="Tali'ah Manteel +2", hands="Tali'ah Gages +2", left_ring="Ramuh Ring +1", right_ring="Ilabrat Ring",
		back="Artio's Mantle", waist="Kentarch Belt", legs="Meghanada Chausses +2", feet="Tali'ah Crackows +1"
	}
	
	sets.engaged.PetDT = {
	-- aaaaaaaaand you're dead!
	}
	
	---------------------------------------------------------------------------
	-- MELEE (DUAL-WIELD) SETS FOR DNC AND NIN SUBJOB -------------------------
	---------------------------------------------------------------------------
	sets.engaged.DW = sets.engaged

	---------------------------------------------------------------------------
	-- Full Beastmaster Acc ---------------------------------------------------
	---------------------------------------------------------------------------
	sets.engaged.DW.Acc = sets.engaged.Acc
	
	sets.engaged.DW.PetDT = {
	-- aaaaaaaaaaaaand your pet is dead!
	}

	---------------------------------------------------------------------------
	-- WEAPONSKILLS -----------------------------------------------------------
	---------------------------------------------------------------------------
	sets.precast.WS = {
	}
	
	---------------------------------------------------------------------------
	-- Specific weaponskill sets. ---------------------------------------------
	---------------------------------------------------------------------------

	-- Rampage: 50% STR--------------------------------------------------------
	sets.precast.WS['Rampage'] = set_combine(sets.precast.WS, {
	})

	-- Calamity: 50% STR/VIT---------------------------------------------------
	sets.precast.WS['Calamity'] = set_combine(sets.precast.WS, {
	})

	-- Mistral Axe: 50% STR ---------------------------------------------------
	sets.precast.WS['Mistral Axe'] = set_combine(sets.precast.WS, {
	})

	-- Bora Axe: 100% DEX -----------------------------------------------------
	sets.precast.WS['Bora Axe'] = set_combine(sets.precast.WS, {
	})

	-- Ruinator: 85% STR (Merit) ----------------------------------------------
	sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {
	})
	
	-- Onslaught: 80% DEX (Relic) ---------------------------------------------
	sets.precast.WS['Onslaught'] = set_combine(sets.precast.WS, {
	}) 
	
	-- Primal Rend: 30% DEX 60% CHR (Mythic) ----------------------------------
	sets.precast.WS['Primal Rend'] = set_combine(sets.precast.WS, {
		ammo="Pemphredo Tathlum",
		head="Highwing Helm", neck="Sanctity Necklace", left_ear="Friomisi Earring", right_ear="Hecate's Earring",
		body="Jumalik Mail", hands="Meghanada Gloves +2", right_ring="Shiva Ring +1", left_ring="Ilabrat Ring",
		back=ArtioRend, waist="Eschan Stone", legs="Limbo Trousers", feet="Sombra Leggings"

	})

	-- Cloudsplitter: 40% STR 40% MND (Empyrean) ------------------------------
	sets.precast.WS['Cloudsplitter'] = set_combine(sets.precast.WS, {
	})

	---------------------------------------------------------------------------	
	-- Spells section for Mage subs -------------------------------------------
	---------------------------------------------------------------------------
	sets.precast.FC = {
	}

	sets.midcast.Stoneskin = {
	}

	---------------------------------------------------------------------------
	-- Cosmetic Sets ----------------------------------------------------------
	---------------------------------------------------------------------------
	--[[sets.idle.Town = { main="Arktoi", sub=SkullrenderPD,ammo="Demonry Core",
		head="Khimaira Bonnet",neck="Loricate Torque +1",left_ear="Infused Earring",right_ear="Handler's Earring +1",
		body="An. Jackcoat +1",hands="Ankusa Gloves",left_ring=LeftDarkRing,right_ring=RightDarkRing,
		back="Pastoralist's Mantle",waist="Isa Belt",legs="Ankusa Trousers +1",feet="Skd. Jambeaux +1"
	}
	sets.idle.Field = sets.idle.Town]]
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time. -----------------------
-------------------------------------------------------------------------------------------------------------------

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
	if pet.isvalid then
		if pet.status == 'Engaged' then
			idleSet = set_combine(idleSet, sets.idle.Pet.Engaged)
		else
			idleSet = set_combine(idleSet, sets.idle.Pet)
		end
	end
	return idleSet
end

function job_precast(spell, action, spellMap, eventArgs)
	cancel_conflicting_buffs(spell, action, spellMap, eventArgs)

	-- Define class for Sic and Ready moves.
	if ready_moves_to_check:contains(spell.name) and pet.status == 'Engaged' then
		classes.CustomClass = "WS"
		equip(sets.midcast.Pet.ReadyRecast)
	end
end

function job_pet_midcast(spell, action, spellMap, eventArgs)
	
end

-- Return true if we handled the aftercast work.  Otherwise it will fall back
-- to the general aftercast() code in Mote-Include.
function job_aftercast(spell, action, spellMap, eventArgs)
	if spell.type == "Monster" and not spell.interrupted then
		equip(set_combine(sets.midcast.Pet.WS, sets.midcast.Pet[state.CorrelationMode.value]))

		if mab_ready_moves:contains(spell.english) and pet.status == 'Engaged' then
			equip(sets.midcast.Pet.MabReady)
			equip(sets.midcast.Pet.TPBonus)
		end
	
		if buffactive['Unleash'] then
		end
		eventArgs.handled = true
	end
end

function job_state_change(stateField, newValue, oldValue)
	if stateField == 'Correlation Mode' then
		state.CorrelationMode:set(newValue)
	end
end

function get_combat_form()
	if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
		state.CombatForm:set('DW')
	else
	    state.CombatForm:reset()
	end
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.CapacityMode.value then
        meleeSet = set_combine(meleeSet, sets.CapacityMantle)
    end
-- Daytime Special Gear can be equipped here
    if world.time >= 6*60 or world.time <= 18*60 then
        if state.OffenseMode == 'Acc' then
            meleeSet = set_combine(meleeSet, {ammo="Tengu-No-Hane"})
            windower.add_to_chat(17,'Daytime: equipping Tengu-No-Hane')
        end
    end
    return meleeSet
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(3, 9)
    equip(sets.idle.Town)
    send_command('@input /lockstyle on')
end
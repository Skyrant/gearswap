-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
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
-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    -- Load and initialize the include file.
    include('Mote-Include.lua')
    -- include('organizer-lib')
end

-- Setup vars that are user-independent.
function job_setup()
    state.CapacityMode = M(false, 'Capacity Point Mantle')
    state.JumpMode = M(false, 'Critical Hit Damage')
    state.WeaponMode = M('Gungnir','Trishula')
end

-- Setup vars that are user-dependent. Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'STP')
    state.HybridMode:options('Normal', 'Reraise')
    state.PhysicalDefenseMode:options('Normal','PDT')
    state.MagicalDefenseMode:options('Normal','MDT')

    ---------------------------------------------------------------------------
    -- Augmented Gear ---------------------------------------------------------
    ---------------------------------------------------------------------------
    LeftDarkRing  = {name="Dark Ring", augments={'Breath dmg. taken -5%','Phys. dmg. taken -4%','Magic dmg. taken -3%'}}
    RightDarkRing = {name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -4%','Spell interruption rate down -3%'}}

    BrigantiaDEX = {name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10'}}
    BrigantiaSTR = {name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10'}}

    ---------------------------------------------------------------------------
    -- Weaponskill Definitions ------------------------------------------------
    ---------------------------------------------------------------------------
    SingleHit = S{"Double Thrust","Vorpal Thrust","Wheeling Thrust","Sonic Thrust","Geirskogul","Camlann's Torment" }
    MultiHit  = S{"Penta Thrust","Skewer","Impulse Drive","Stardiver","Drakesbane"}
    Magical   = S{"Thunder Thrust","Raiden Thrust"}

    BreathAttacks = S{"Flame Breath","Frost Breath","Sand Breath","Hydro Breath","Gust Breath","Lightning Breath"}
    BreathHeals   = S{"Healing Breath I","Healing Breath II","Healing Breath III","Healing Breath IV"}

    ---------------------------------------------------------------------------
    -- Additional local binds (! = alt, @ = windows, ^ = ctrl) ----------------
    ---------------------------------------------------------------------------
    send_command('bind ^` input /ja "Hasso" <me>')
    send_command('bind !` input /ja "Seigan" <me>')
    send_command('bind != gs c toggle CapacityMode')
    send_command('bind ^= gs c toggle JumpMode')
    send_command('bind !- gs c cycle WeaponMode')
    send_command('bind ^[ input /lockstyle on')
    send_command('bind ![ input /lockstyle off')

    select_default_macro_book()
end


-- Called when this job file is unloaded (eg: job change)
--- ! = alt, @ = windows, ^ = ctrl
function file_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind ^=')
    send_command('unbind !=')
    send_command('unbind ^[')
    send_command('unbind ![')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets -----------
    --------------------------------------
    sets.CapacityMantle = {back="Mecistopins Mantle"}

    ---------------------------------------------------------------------------
    -- Precast Sets -----------------------------------------------------------
    ---------------------------------------------------------------------------
    -- Job Abilities ----------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.precast.JA['Spirit Surge']   = { body="Pteroslaver Mail +3" }
    sets.precast.JA['Call Wyvern']    = { body="Pteroslaver Mail +3", neck="Dragoon's Collar", hands="Crusher Gauntlets", back="Updraft Mantle", legs="Vishap Brais +3", feet="Pteroslaver Greaves +3" }
    sets.precast.JA['Ancient Circle'] = { legs="Vishap Brais +3" }
    sets.precast.JA['Spirit Link']    = { head="Vishap Armet +3",
                                          hands="Peltast's Vambraces +1",
                                          feet="Pteroslaver Greaves +3" }
    sets.precast.JA['Deep Breathing'] = { head="Vishap Armet +3"}
    sets.precast.JA['Angon']          = { ammo="Angon", hands="Pteroslaver Finger Gauntlets +1"}
    sets.precast.JA['Dragon Breaker'] = { } --Currently no gear available
    sets.precast.JA['Fly High']       = { } --Currently no gear available

    ---------------------------------------------------------------------------
    -- Jump Sets --------------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.precast.JA.Jump = {
        ammo="Ginsen",
        head="Vishap Armet +3", neck="Dragoon's Collar +1", ear1="Bladeborn Earring", ear2="Steelflash Earring",
        body="Pteroslaver Mail +3", hands="Sulevia's Gauntlets +2", ring1="Regal Ring", ring2="Ramuh Ring +1",
        back=BrigantiaSTR, waist="Ioskeha Belt", legs="Vishap Brais +3", feet="Vishap Greaves +3"
    }

    sets.precast.JA['High Jump']   = sets.precast.JA.Jump
    sets.precast.JA['Soul Jump']   = sets.precast.JA.Jump
    sets.precast.JA['Spirit Jump'] = sets.precast.JA.Jump
    sets.precast.JA['Super Jump']  = sets.precast.JA.Jump

    ---------------------------------------------------------------------------
    -- Augment sets based on your Jump Mode setting ---------------------------
    ---------------------------------------------------------------------------
    sets.Jump = {}

    sets.Jump.HP = {
        body="Pteroslaver Mail +3",
        neck="Dragoon's Collar",
        hands="Vishap Finger Gauntlets +2",
        legs="Vishap Brais +3",
        feet="Pteroslaver Greaves +3"
    }

    sets.Jump.Crit = {
        legs="Peltast's Cuissots +1",
        feet="Valorous Greaves"
    }

    ---------------------------------------------------------------------------
    -- Breath -----------------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.HealingBreath = { ammo="Ginsen",
        head="Vishap Armet +3", neck="Lancer's Torque",
        body="Jumalik Mail", hands="Crusher Gauntlets",
        back="Updraft Mantle", legs="Vishap Brais +3"
    }

    sets.SmitingBreath  = {
        head="Vishap Armet +3",
        ear1="Enmerkar Earring",
        hands="Vishap Finger Gauntlets +2",
        neck="Lancer's Torque", -- neck="Adad Amulet",
        back=BrigantiaSTR
    }

    ---------------------------------------------------------------------------
    -- Weapon Skills ----------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.precast.WS = {
        ammo="Knobkierrie",
        head="Vishap Armet +3",
        neck="Fotia Gorget",
        ear1="Cessance Earring",
        ear2="Sherida Earring",
        ring1="Regal Ring",
        ring2="Niqmaddu Ring",
        back=BrigantiaSTR,
        waist="Fotia Belt",
        legs="Vishap Brais +3",
	}

    ---------------------------------------------------------------------------
    -- Selected by function job_precast based on ------------------------------
    -- the Weaponskills list defined in user_setup ----------------------------
    ---------------------------------------------------------------------------
    sets.precast.WS.MultiHit = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head="Flamma Zucchetto +2",
        neck="Dragoon's Collar +1",
        body="Sulevia's Platemail +2",
        hands="Sulevia's Gauntlets +2",
        legs="Sulevia's Cuisses +2",
        feet="Flamma Gambieras +2",
    })

    sets.precast.WS.SingleHit = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head="Vishap Armet +3",
        body="Sulevia's Platemail +2",
        hands="Sulevia's Gauntlets +2",
        legs="Vishap Brais +3",
        feet="Sulevia's Leggings +2"
    })

    sets.precast.WS.Magical = set_combine(sets.precast.WS, {
        ---------------------------------- Magic Attack Bonus -----------------
        ammo="Pemphredo Tathlum",       -- 04
        head="Highwing Helm",           -- 20
        neck="Sanctity Necklace",       -- 10
        ear1="Friomisi Earring",        -- 10
        ear2="Hecate's Earring",        -- 06
        body="Jumalik Mail",            -- 20
        hands="Leyline Gloves",         -- 15
        ring1="Shiuva Ring +1",         -- 03
        ring2="Shiva Ring",
        back="Toro Cape",               -- 10
        waist="Eschan Stone",           -- 07
        legs="Flamma Dirs +2",
        feet="Flamma Gambieras +2"
        --------------------------------- 105 MAB -----------------------------
    })

    ---------------------------------------------------------------------------
    -- Exceptiopns for specific Weaponskills ----------------------------------
    ---------------------------------------------------------------------------
    sets.precast.WS['Geirskogul'] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head="Vishap Armet +3",
        body="Flamma Korazin +2",
        hands="Flamma Manopolas +2",
        legs="Flamma Dirs +1",
        feet="Flamma Gambieras +2",
        back=BrigantiaDEX,
    })

    sets.precast.WS['Leg Sweep'] = set_combine(sets.precast.WS.Magical, {
        ---------------------------------- Magic Accuracy ---------------------
        ammo="Pemphredo Tathlum",       -- 08
        head="Flamma Zucchetto +2",     -- 44
        neck="Sanctity Necklace",       -- 10
        ear1="Lifestorm Earring",
        ear2="Psystorm Earring",        -- 12
        body="Flamma Korazin +2",       -- 46
        hands="Flamma Manopolas +2",    -- 43
        ring1="Niqmaddu Ring",
        ring2="Ramuh Ring +1",
        --back="Aput Mantle +1",        -- 11
        waist="Eschan Stone",           -- 07
        legs="Flamma Dirs +2",          -- 39
        feet="Flamma Gambieras +2"      -- 42
        --------------------------------- 262 M.Acc. --------------------------
    })

    ---------------------------------------------------------------------------
    -- Defensive Sets ---------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.defense.PDT = {
        ammo="Ginsen",
        head="Sulevia's Mask +2",
        neck="Loricate Torque +1",
        ear1="Bladeborn Earring",
        ear2="Steelflash Earring",
        body="Sulevia's Platemail +2",
        --hands="Crusher Gauntlets",
        hands="Sulevia's Gauntlets +2",
        ring1=LeftDarkRing,
        ring2=RightDarkRing,
        --back="Impassive Mantle",
        back="Solemnity Cape",
        waist="Flume Belt",
        legs="Sulevia's Cuisses +2",
        feet="Sulevia's Leggings +2"
    }

    sets.defense.Reraise = set_combine(sets.defense.PDT, {
        head="Twilight Helm",
        body="Twilight Mail"
    })

    sets.defense.MDT = set_combine(sets.defense.PDT, {
         head="Flamma Zucchetto +2",
         ear1="Etiolation Earring",
         body="Jumalik Mail",
         hands="Flamma Manopolas +2",
         --back="Impassive Mantle",
         legs="Flamma Dirs +1",
         feet="Flamma Gambieras +2"
    })

    sets.Kiting = {legs="Carmine Cuisses +1"}

    ---------------------------------------------------------------------------
    -- Engaged Sets -----------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.engaged = {
        --main="Trishula",
        sub="Utu Grip",
        ammo="Ginsen",
        head="Flamma Zucchetto +2",
        neck="Dragoon's Collar +1",
        ear1="Cessance Earring",
        ear2="Sherida Earring",
        body="Flamma Korazin +2",
        hands="Sulevia's Gauntlets +2",
        ring1="Niqmaddu Ring",
        ring2="Ramuh Ring +1",
        back=BrigantiaDEX,
        waist="Ioskeha Belt",
        legs="Sulevia's Cuisses +2",
        feet="Flamma Gambieras +2",
    }
    -- ACC: 1091, STP:46-51, Haste: 15%
    sets.engaged.STP = set_combine(sets.engaged, {
        sub="Bloodrain Strap",
        ammo="Ginsen",
        head="Sulevia's Mask +2",
        body="Flamma Korazin +2",
        hands="Flamma Manopolas +2",
        neck="Ainia Collar",
        ear1="Cessance Earring",
        ear2="Sherida Earring",
        ring1="Rajas Ring",
        ring2="Apate Ring", --Chirich Ring x 2
        back=BrigantiaDEX,
        waist="Kentarch Belt",
        legs="Flamma Dirs +1",
        feet="Flamma Gambieras +2"
    })

    sets.engaged.Acc = set_combine(sets.engaged.STP, {
        sub="Utu Grip",
        ammo="Ginsen",
        neck="Dragoon's Collar +1",
        ear1="Cessance Earring",
        ear2="Sherida Earring",
        ring1="Niqmaddu Ring",
        ring2="Ramuh Ring +1",
        waist="Ioskeha Belt",
        legs="Vishap Brais +3"
    })

    sets.engaged.PDT = set_combine(sets.engaged, {
        ammo="Ginsen",
        head="Sulevia's Mask +2",
        neck="Loricate Torque +1",
        ear1="Bladeborn Earring",
        ear2="Steelflash Earring",
        body="Sulevia's Platemail +2",
        hands="Crusher Gauntlets",
        ring1=LeftDarkRing,
        ring2=RightDarkRing,
        back=BrigantiaDex,
        waist="Flume Belt",
        legs="Sulevia's Cuisses +2",
        feet="Sulevia's Leggings +2"
    })

    ---------------------------------------------------------------------------
    -- NIN Sets ---------------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.engaged.NIN = set_combine(sets.engaged, {
        body = "Flamma Korazin +2",      -- 15%
        ring1 = "Rajas Ring",            --  5%
        ring2 = "Niqmaddu Ring",         --  5% II
        waist = "Sarissaphoroi Belt"    --  5%
    })

    ---------------------------------------------------------------------------
    -- DNC Sets, Waltz (CHR, VIT)----------------------------------------------
    ---------------------------------------------------------------------------
    sets.precast.Waltz = {}
    sets.precast.Waltz['Healing Waltz'] = {}

    ---------------------------------------------------------------------------
    -- Idle Sets --------------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.idle = {}
    sets.idle.Town = set_combine(sets.idle, {
        ammo="Ginsen",
        head="Twilight Helm",
        neck="Dragoon's Collar +1",
        ear1="Bladeborn Earring",
        ear2="Steelflash Earring",
        body="Twilight Mail",
        hands="Sulevia's Gauntlets +2",
        ring1="Rajas Ring",
        ring2="Ramuh Ring +1",
        back=BrigantiaDEX,
        waist="Ioskeha Belt",
        legs="Carmine Cuisses +1",
        feet="Sulevia's Leggings +2",
    })

    sets.idle.Field = set_combine(sets.idle.Town, {
        head="Sulevia's Mask +2",
        body="Sulevia's Platemail +2",
        hands="Sulevia's Gauntlets +2",
        legs="Carmine Cuisses +1",
        feet="Sulevia's Leggings +2"
    })

    sets.idle.Weak = set_combine(sets.idle.Field, {
        head="Twilight Helm",
        body="Twilight Mail",
    })

    ---------------------------------------------------------------------------
    -- Custom Idle Sets (customize_idle_set) ----------------------------------
    ---------------------------------------------------------------------------
    sets.idle.Regen = set_combine(sets.idle.Field, {
        head="Twilight Helm",
        neck="Sanctity Necklace",
        ear1="Infused Earring",
        ear2="Moonshade earring",
        body="Twilight Mail",
        ring1="Sheltered Ring",
        ring2=RightDarkRing,
        legs="Carmine Cuisses +1"
    })
    sets.idle.Reraise = set_combine(sets.idle.Field, sets.Reraise)

    ---------------------------------------------------------------------------
    -- Reraise (Twilight Set) -------------------------------------------------
    ---------------------------------------------------------------------------
    sets.Reraise = { head="Twilight Helm", body="Twilight Mail" }
    sets.engaged.Reraise = set_combine(sets.engaged, sets.Reraise)
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic target handling to be done.
function job_pretarget(spell, action, spellMap, eventArgs)
    -- If Wyvern is not present default to regular Jumps
    if spell.english == "Spirit Jump" then
        if not pet.isvalid then
            cancel_spell()
            send_command('Jump')
        end
    elseif spell.english == "Soul Jump" then
        if not pet.isvalid then
            cancel_spell()
            send_command("High Jump")
        end
    end
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if MultiHit:contains(spell.name) then
        equip(sets.precast.WS.MultiHit)
    elseif SingleHit:contains(spell.name) then
        equip(sets.precast.WS.SingleHit)
    elseif Magical:contains(spell.name) then
        equip(sets.precast.WS.Magical)
    end
end
-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.english:endswith("Jump") then
        if state.JumpMode.value then
            -- equip the Critical Hit Damage based items
            equip(sets.Jump.Crit)
        else
            -- equip the Maximum HP based items
            equip(sets.Jump.HP)
        end
    end
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
        equip(sets.midcast.FastRecast)
    end
end
-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
end
function job_pet_precast(spell, action, spellMap, eventArgs)
end
-- Runs when a pet initiates an action.
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_pet_midcast(spell, action, spellMap, eventArgs)
    if spell.english:startswith('Healing Breath') or spell.english == 'Restoring Breath' or spell.english == 'Steady Wing' then
        equip(sets.HealingBreath)
    elseif spell.english == 'Smiting Breath' or BreathAttacks:contains(spell.english) then
        equip(sets.SmitingBreath)
    end
end
-- Run after the default pet midcast() is done.
-- eventArgs is the same one used in job_pet_midcast, in case information needs to be persisted.
function job_pet_post_midcast(spell, action, spellMap, eventArgs)
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if player.hpp < 25 then
    classes.CustomClass = "Reraise"
    end
    if state.HybridMode.value == 'Reraise' or
    (state.HybridMode.value == 'Physical' and state.PhysicalDefenseMode.value == 'Reraise') then
        equip(sets.Reraise)
    end
end
-- Run after the default aftercast() is done.
-- eventArgs is the same one used in job_aftercast, in case information needs to be persisted.
function job_post_aftercast(spell, action, spellMap, eventArgs)
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_pet_aftercast(spell, action, spellMap, eventArgs)
end
-- Run after the default pet aftercast() is done.
-- eventArgs is the same one used in job_pet_aftercast, in case information needs to be persisted.
function job_pet_post_aftercast(spell, action, spellMap, eventArgs)
end

-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------
-- Called before the Include starts constructing melee/idle/resting sets.
-- Can customize state or custom melee class values at this point.
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_handle_equipping_gear(status, eventArgs)
end
-- Return a customized weaponskill mode to use for weaponskill sets.
-- Don't return anything if you're not overriding the default value.
function get_custom_wsmode(spell, action, spellMap)
end
-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    -- Equip Low Health Gear
    if player.hpp < 90 then
            idleSet = set_combine(idleSet, sets.idle.Regen)
    end
    -- Equip Critical Health Gear
    if player.hpp < 25 then
            idleSet = set_combine(idleSet, sets.Reraise)
    end
    return idleSet
end
-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    -- Equip Capacity Mantle
    if state.CapacityMode.value then
        meleeSet = set_combine(meleeSet, sets.CapacityMantle)
    end
    -- Equip Daytime Special Gear
    if world.time >= 6*60 or world.time <= 18*60 then
        meleeSet = set_combine( meleeSet, {ammo="Tengu-No-Hane"} )
        -- windower.add_to_chat( 17,'Daytime: equipping Tengu-No-Hane' )
    end
    -- Equip Critical Health Gear
    if player.hpp < 25 then
        meleeSet = set_combine( meleeSet, sets.Reraise )
    end
    return meleeSet
end

-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------
-- Called when the player's status changes.
function job_status_change(newStatus, oldStatus, eventArgs)
end
-- Called when the player's pet's status changes.
function job_pet_status_change(newStatus, oldStatus, eventArgs)
    windower.add_to_chat(17,"Pet Status:" .. oldStatus .. ">" .. newStatus )
end
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if string.lower(buff) == "sleep" and gain and player.hp > 200 then
        equip(sets.Berserker)
    elseif string.lower(buff) == "hasso" and gain == false then
        send_command('input /ja "Hasso" <me>')
    elseif string.lower(buff) == "Deep Breathing" and gain == false then
        send_command("Deep Breathing")
    else
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
end
-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------
-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
end
-- Job-specific toggles.
function job_toggle(field)
end
-- Handle auto-targetting based on local setup.
function job_auto_change_target(spell, action, spellMap, eventArgs)
end
-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
-- State buff checks that will equip buff gear and mark the event as handled.
function check_buff(buff_name, eventArgs)
    if state.Buff[buff_name] then
        equip(sets.buff[buff_name] or {})
        eventArgs.handled = true
    end
end
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'WAR' then
        set_macro_page(1, 8)
        windower.add_to_chat(16, 'Changing macros to Book: ' .. 8 .. ' and Page: ' .. 1 .. '.  Job Changed to DRG/' .. player.sub_job)
    elseif player.sub_job == 'SAM' then
        set_macro_page(2, 8)
        windower.add_to_chat(16, 'Changing macros to Book: ' .. 8 .. ' and Page: ' .. 2 .. '.  Job Changed to DRG/' .. player.sub_job)
    elseif player.sub_job == 'RDM' then
        set_macro_page(3, 8)
        windower.add_to_chat(16, 'Changing macros to Book: ' .. 8 .. ' and Page: ' .. 3 .. '.  Job Changed to DRG/' .. player.sub_job)
    elseif player.sub_job == 'WHM' then
        set_macro_page(3, 8)
        windower.add_to_chat(16, 'Changing macros to Book: ' .. 8 .. ' and Page: ' .. 3 .. '.  Job Changed to DRG/' .. player.sub_job)
    elseif player.sub_job == 'DNC' then
        set_macro_page(1, 8)
        windower.add_to_chat(16, 'Changing macros to Book: ' .. 8 .. ' and Page: ' .. 4 .. '.  Job Changed to DRG/' .. player.sub_job)
    else
        set_macro_page(1, 8)
        windower.add_to_chat(16, 'Changing macros to Book: ' .. 8 .. ' and Page: ' .. 1 .. '.  Job Changed to DRG/' .. player.sub_job)
    end
end

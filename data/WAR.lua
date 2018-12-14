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

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.CapacityMode = M(false, 'Capacity Point Mantle')
    state.Buff['Restraint'] = buffactive['restraint'] or false
end

-- Setup vars that are user-dependent. Can override this function in a sidecar file.
function user_setup()
    -- F9 - Cycle Offense Mode (the offensive half of all 'hybrid' melee modes).
    state.OffenseMode:options('GS', 'GA', 'Polearm','AxeShield', 'SwordShield', 'ClubShield', 'DualWield')
    -- Ctrl-F9 - Cycle Hybrid Mode.
    state.HybridMode:options('Normal', 'Accuracy', 'LightPDT', 'PDT')
    -- Ctrl-F10 - Cycle type of Physical Defense Mode in use.
    state.PhysicalDefenseMode:options('Normal','PDT')

    ---------------------------------------------------------------------------
    -- Additional local binds (! = alt, @ = windows, ^ = ctrl) ----------------
    ---------------------------------------------------------------------------
    send_command('bind ^` input /ja "Hasso" <me>')
    send_command('bind !` input /ja "Seigan" <me>')
    send_command('bind !- gs c cycle WeaponMode')
    send_command('bind != gs c toggle CapacityMode')
    send_command('bind ^[ input /lockstyle on')
    send_command('bind ![ input /lockstyle off')

    select_default_macro_book()
end

-- Called when this job file is unloaded (eg: job change)
--- ! = alt, @ = windows, ^ = ctrl
function file_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind !-')
    send_command('unbind ^[')
    send_command('unbind ![')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets -----------
    --------------------------------------

    ---------------------------------------------------------------------------
    -- Precast Sets -----------------------------------------------------------
    ---------------------------------------------------------------------------
    -- Job Abilities ----------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.precast.JA['Call Wyvern']    = { body="Pteroslaver Mail +3", neck="Dragoon's Collar", hands="Crusher Gauntlets", back="Updraft Mantle", legs="Vishap Brais +3", feet="Pteroslaver Greaves +3" }
    sets.precast.JA['Berserk'] = { legs='Lustratio Subligar' }

    ---------------------------------------------------------------------------
    -- Spells -----------------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.precast.FC = {}

    ---------------------------------------------------------------------------
    -- Midcast Sets -----------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.midcast['Blue Magic'] = { legs='Lustratio Subligar' }
    sets.midcast['Ninjutsu'] = { legs='Lustratio Subligar' }
    ---------------------------------------------------------------------------
    -- Weapon Skills (Default) ------------------------------------------------
    ---------------------------------------------------------------------------
    sets.precast.WS = {}

    ---------------------------------------------------------------------------
    -- Specific Weaponskills --------------------------------------------------
    ---------------------------------------------------------------------------
    sets.precast.WS['Geirskogul'] = {}

    ---------------------------------------------------------------------------
    -- Kiting Sets ------------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.Kiting = { legs="Hermes Sandals" }

    ---------------------------------------------------------------------------
    -- Engaged Sets -----------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.engaged = {
        ammo="Ginsen",
        head="Flam. Zucchetto +2",
        body={ name="Valorous Mail", augments={'Pet: Crit.hit rate +1','Pet: Phys. dmg. taken -3%','Quadruple Attack +3','Accuracy+19 Attack+19',}},
        hands="Sulev. Gauntlets +2",
        legs="Pumm. Cuisses +2",
        feet="Pumm. Calligae +2",
        neck="Lissome Necklace",
        waist="Ioskeha Belt",
        left_ear="Cessance Earring",
        right_ear="Brutal Earring",
        left_ring="Flamma Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
    }

    sets.engaged.GA = {}
    sets.engaged.GA.Accuracy = {}
    sets.engaged.GA.LightPDT = {}
    sets.engaged.GA.PDT = {}

    sets.engaged.GS = {}
    sets.engaged.Polearm = {}
    sets.engaged.AxeShield = {}
    sets.engaged.SwordShield = {}
    sets.engaged.ClubShield = {}
    sets.engaged.DualWield = {}

    ---------------------------------------------------------------------------
    -- Idle Sets --------------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.idle = {}
    sets.idle.Town = {}
    sets.idle.Field = {}

    sets.idle.Weak = set_combine(sets.idle.Field, {
        head="Twilight Helm",
        body="Twilight Mail",
    })

    ---------------------------------------------------------------------------
    -- Custom Idle Sets (customize_idle_set) ----------------------------------
    ---------------------------------------------------------------------------
    sets.idle.Regen = {}
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
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.

-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
end
-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
function job_post_precast(spell, action, spellMap, eventArgs)
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
end
-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
end
function job_pet_precast(spell, action, spellMap, eventArgs)
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
   eventArgs.handled = false
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
    -- Use restraint gloves
    if state.Buff['Restraint'] then
        meleeSet = set_combine( meleeSet, { hands = 'Leyline Gloves'})
    end
    windower.add_to_chat(16, 'Restraint: ' .. tostring(state.Buff['Restraint']))
    return meleeSet
end

-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------
-- Called when the player's status changes.
-- function job_status_change(newStatus, oldStatus, eventArgs)
    -- windower.add_to_chat(16, 'Restraint: ' .. tostring(state.Buff['Restraint']))
-- end
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if string.lower(buff) == "doom" then
        if player.status == 'Engaged' then
            equip(sets.engaged.Doom)
        else
            equip(sets.idle.Doom)
        end
    elseif string.lower(buff) == "terror" or string.lower(buff) == "stun" or string.lower(buff) == "sleep" then
        if player.status == 'Engaged' then
            equip(sets.engaged.DT)
        else
            equip(sets.idle.DT)
        end
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
    if player.sub_job == 'SAM' then
        set_macro_page(1, 8)
        windower.add_to_chat(16, 'Changing macros to Book: ' .. 8 .. ' and Page: ' .. 1 .. '.  Job Changed to WAR/' .. player.sub_job)
    else
        set_macro_page(1, 8)
        windower.add_to_chat(16, 'Changing macros to Book: ' .. 8 .. ' and Page: ' .. 1 .. '.  Job Changed to WAR/' .. player.sub_job)
    end
end

------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup variables for this job
-------------------------------------------------------------------------------------------------------------------
function user_setup()
    -------------------------------------------------------------------------------------------------------------------
    -- Initialization function that defines sets and variables to be used.
    -------------------------------------------------------------------------------------------------------------------
    -- F12 - Update currently equipped gear, and report current status.
    -- F10 - Activate emergency Physical Defense Mode. Replaces Magical Defense Mode, if that was active.
    -- F11 - Activate emergency Magical Defense Mode. Replaces Physical Defense Mode, if that was active.
    -- Alt-F12 - Turns off any emergency defense mode.
    -- Ctrl-F10 - Cycle type of Physical Defense Mode in use.
    -- Alt-F10 - Toggles Kiting Mode.
    -- F9 - Cycle Offense Mode (the offensive half of all 'hybrid' melee modes).

    -- Win-F9 - Cycle Weaponskill Mode.
    state.WeaponskillMode:options('None', 'Acc')
    -- Ctrl-F11 - Cycle Casting Mode.
    state.CastingMode:options('None', 'Resistant')
    -- Ctrl-F12 - Cycle Idle Mode.
    state.IdleMode:options('None', 'PDT')

    ---------------------------------------------------------------------------
    -- Augmented Gear Section -------------------------------------------------
    ---------------------------------------------------------------------------
    LeftDarkRing = {name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -4%','Spell interruption rate down -3%'}}
    RightDarkRing = {name="Dark Ring", augments={'Breath dmg. taken -5%','Phys. dmg. taken -4%','Magic dmg. taken -3'}}

    ---------------------------------------------------------------------------
    -- Select the default Macro book and page based on subjob -----------------
    ---------------------------------------------------------------------------
    select_default_macro_book()
end

function init_gear_sets()
    ---------------------------------------------------------------------------
    -- Precast Sets -----------------------------------------------------------
    ---------------------------------------------------------------------------
    -- Fast Cast Sets for all Spells ( Cap:80% - SCH:70% - RDM:65% ) ----------
    ---------------------------------------------------------------------------
    sets.precast.FC = {
        ammo="Sapience Orb",        -- 02%
        head="Vanya Hood",          -- 10%
        neck="Orunmila's Torque",   -- 05%
        ear1="Etiolation Earring",  -- 01%
        ear2="Loquacious Earring",  -- 02%
        body="Inyanga Jubbah +2",   -- 13%
        hands="Gendewitha Gages +1",-- 07%
        ring1="Prolix Ring",        -- 02%
        ring2="Kishar Ring",        -- 04%
        back="Swith Cape",          -- 03%
        waist="Witful Belt",        -- 03%/03% quick magic
        legs="Ayanmo Cosciales +2", -- 05%
        feet="Regal Pumps +1"       -- 04%
    --------------------------- Total: 61%-------------------------------------
    }

    ---------------------------------------------------------------------------
    -- Healing Magic Casting Time ---------------------------------------------
    ---------------------------------------------------------------------------
    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
        main="Vadose Rod",          -- 5%
        legs="Ebers Pantaloons +1", --13%
        back="Disperser's Cape"     -- 5%
    ------------------ Healing Magic: 23% - FastCast: 48% - Total: 71% --------
    })

    sets.precast.FC.RevivalMagic = sets.precast.FC['Healing Magic']
    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

    ---------------------------------------------------------------------------
    -- Cure Casting Time - ( Cap: 50% ) ---------------------------------------
    ---------------------------------------------------------------------------
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
        main="Queller Rod",             -- 07%
        head="Piety Cap",               -- 12%
        ear1="Mendicant Earring",       -- 05%
        ear2="Nourishing Earring +1",   -- 04%
        back="Pahtli Cape",             -- 08%
        legs="Doyen Pants",             -- 15%
        feet="Vanya Clogs"              -- 07%
    ------------------- Cure Casting Time: 58% - FastCast: 31% Total: 89% -----
    })

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    ---------------------------------------------------------------------------
    -- Enhancing Magic Casting Time--------------------------------------------
    ---------------------------------------------------------------------------
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        waist="Siegel Sash"
    })

    ---------------------------------------------------------------------------
    -- Stoneskin --------------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {
        head="Umuthi Hat", waist="Siegel Sash", legs="Doyen Pants"})

    ---------------------------------------------------------------------------
    -- Precast sets to enhance JAs --------------------------------------------
    ---------------------------------------------------------------------------
    sets.precast.JA['Benediction'] = {body="Piety Briault +1"}
    sets.precast.JA['Afflatus Solace'] = {body="Ebers Bliaud", back="Alaunus's Cape"}
    sets.precast.JA['Devotion'] = {head="Piety Cap"}

-------------------------------------------------------------------------------
-- Midcast Sets ---------------------------------------------------------------
-------------------------------------------------------------------------------

    ---------------------------------------------------------------------------
    -- Base midcast Conserve MP set. ( Caps: 100% - SCH,BLM: 75% - GEO: 69% ) -
    -- All other midcast sets will use this as a base set to make sure --------
    -- we are always casting at with as much conserver MP as possible ---------
    ---------------------------------------------------------------------------
    sets.midcast = {
        main="Rubicundity",         -- 07%
        sub="Thuellaic Ecu +1",     -- 04%
        ammo="Pemphredo Tathlum",   -- 04%
        head="Vanya Hood",          -- 06%
        neck="Reti Pendant",        -- 04%
        ear1="Mendicant's Earring", -- 02% (Magnetic Earring 05)
        ear2="Calamitous Earring",  -- 04%
        body="Witching Robe",       -- 05% (Kaykaus: 06, Chironic: 05, Vedic: 10)
        hands="Shrieker's Cuffs",   -- 07% (Thrift Gloves +1: 05, Kaykaus: 06)
        back="Solemnity Cape",      -- 05% (Fi Follet: 04, Aurist's: 1-5)
        waist="Luminary Sash",      -- 04% (Austerity Belt/+1: 08/09 )
        legs="Vanya Slops",         -- 12% (with augment C)
        --feet="Vanya Clogs",       -- 06% (with augment C, Kaykaus: 06)
    --------------------------- Total: 55% ------------------------------------
    }

    ---------------------------------------------------------------------------
    -- Cure Potency II Set ( Healing Magic Skill > MND ) ----------------------
    -- The Cap is 50% for Cure Potency II to take effect ----------------------
    ---------------------------------------------------------------------------
    sets.midcast.Cure = set_combine(sets.midcast, {
        main="Queller Rod",                 --10%/02%
        head="Ebers Cap",                   --13%
        neck="Nodens Gorget",               --05%
        left_ear="Mendicant's Earring",     --05%
        right_ear="Glorious Earring",       --00%/02%
        body="Theophany Briault +3",        --00%/06%
        hands="Theophany Mitts +2",         --00%/02%
        left_ring="Lebeche Ring",           --03%
        right_ring="Sirona's ring",
        back="Alaunus's Cape",              --10%
        legs="Ebers Pantaloons +1",
        feet="Vanya Clogs"                  --05%
    ----------------------------------- Cure: 51% - Cure II: 12% - Total: 51% -
    })

    ---------------------------------------------------------------------------
    -- Cure Set for Afflatus Solace -------------------------------------------
    ---------------------------------------------------------------------------
    sets.midcast.CureSolace = set_combine(sets.midcast.Cure, {
        back="Alaunus's Cape",
        --body="Ebers Bliaud"       not used because of Cure Potency II body --
    })

    ---------------------------------------------------------------------------
    -- Curaga Set (MND > Healing Magic Skill) ---------------------------------
    ---------------------------------------------------------------------------
    sets.midcast.Curaga = set_combine(sets.midcast, {
        main="Vadose Rod",
        sub="Ammurapi Shield",
        neck="Mizu. Kubikazari",
        ear1="Nourishing Earring +1",
        body="Shamash Robe",
        hands="Inyanga Dastanas +2",
        ring1="Persis Ring",
        ring2="Sirona's Ring",
        back="Alaunus's Cape",
        legs="Ebers Pantaloons +1",
        feet="Inyanga Crackows +2"
    })

    ---------------------------------------------------------------------------
    -- Cursna - ( Based on Healing Magic Skill ) ------------------------------
    ---------------------------------------------------------------------------
    sets.midcast.Cursna = set_combine(sets.midcast, {
        main="Queller Rod",
        head="Ebers Cap", --neck="Malison Medallion",
        body="Vanya Robe", hands="Inyanga Dastanas +2", --Fanatic Gloves (SR)
        ring2="Sirona's Ring",      -- Haoma's Ring, Ephedra Ring
        legs="Theophany Pantaloons +1",feet="Vanya Clogs" --Gende. Galosh. +1
    })

    sets.midcast.Erase = set_combine(sets.midcast, {head="Ebers Cap"})
    sets.midcast['Healing Magic'] = set_combine(sets.midcast, {head="Ebers Cap"})

    ---------------------------------------------------------------------------
    -- Enhancing Magic Set (Caps at 500)---------------------------------------
    ---------------------------------------------------------------------------
    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast, {
        main="Beneficus",
        sub="Ammurapi Shield",
        head="Befouled Crown",neck="Colossus's Torque", ear1="Andoaa Earring",
        body="Witching Robe", hands="Dynasty Mitts", --hands="Inyanga Dastanas +2",
        back="Fi Follet Cape",waist="Siegel Sash",legs="Piety Pantaloons",feet="Ebers Duckbills"
    })

    sets.midcast.BarElement = sets.midcast['Enhancing Magic']

    ---------------------------------------------------------------------------
    -- Aquaveil ---------------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {
        main="Vadose Rod",
    })

    ---------------------------------------------------------------------------
    -- Stoneskin --------------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        head="Umuthi Hat", neck="Nodens Gorget",
        body="Anhur Robe"
    })

    ---------------------------------------------------------------------------
    -- Auspice ----------------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {
        feet="Ebers Duckbills"
    })

    ---------------------------------------------------------------------------
    -- Refresh ----------------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'], {
        waist="Gishdubar Sash",feet="Inspirited Boots"
    })

    ---------------------------------------------------------------------------
    -- Regen - Potency: 58% - Duration: ---------------------------------------
    ---------------------------------------------------------------------------
    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
        main="Bolelabunga",
        head="Inyanga Tiara +2",body="Piety Briault +1",hands="Ebers Mitts",
        legs="Theophany Pantaloons +1"
    })

    ---------------------------------------------------------------------------
    -- Protect ----------------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {
        ring1="Sheltered Ring",feet="Piety Duckbills"
    })

    ---------------------------------------------------------------------------
    -- Shell ------------------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {
        ring1="Sheltered Ring",legs="Piety Pantaloons"
    })

    ---------------------------------------------------------------------------
    -- Divine Magic -----------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.midcast['Divine Magic'] = set_combine(sets.midcast, {
        hands="Piety Mitts",
        legs="Theophany Pantaloons +1",
    })

    ---------------------------------------------------------------------------
    -- Dark Magic -------------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.midcast['Dark Magic'] = set_combine(sets.midcast, {
    })

    ---------------------------------------------------------------------------
    -- Custom spell classes ---------------------------------------------------
    ---------------------------------------------------------------------------
    sets.midcast.MndEnfeebles = set_combine(sets.midcast, {
        main="Vadose Rod",sub="Ammurapi Shield",
        head="Befouled Crown",neck="Henic Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Vanya Robe",ring1="Persis Ring",ring2="Kishar Ring",
        waist="Tengu-no-Obi",legs="Vanya Slops",feet="Piety Duckbills +1"
    })

    sets.midcast.IntEnfeebles = set_combine(sets.midcast, {
        main="Vadose Rod",sub="Ammurapi Shield",
        head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Vanya Robe",ring1="Icesoul Ring",ring2="Kishar Ring",
        back="Refraction Cape",legs="Vanya Slops",feet="Piety Duckbills"
    })

    sets.buff['Divine Caress'] = {hands="Ebers Mitts",back="Mending Cape"}

    ---------------------------------------------------------------------------
    -- Idle sets --------------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.latent_refresh = {waist="Fucho-no-obi"}

    sets.idle = { main="Bolelabunga", sub="Genbu's Shield", ammo="Homiliary",
        head="Befouled Crown",neck="Sanctity Necklace",left_ear="Infused Earring",right_ear="Moonshade Earring",
        body="Shamash Robe", hands="Inyanga Dastanas +2",left_ring="Sheltered Ring",right_ring="Inyanga Ring",
        back="Solemnity Cape",waist="Witful Belt",legs="Assiduity Pants +1", feet="Inyanga Crackows +2",
    }

    sets.idle.PDT = {main="Bolelabunga", sub="Genbu's Shield",ammo="Homiliary",
        head="Ayanmo Zucchetto +1",neck="Loricate Torque +1",ear1="Handler's Earring",ear2="Handler's Earring +1",
        body="Shamash Robe",hands="Ayanmo Manopolas +2",ring1=LeftDarkRing, ring2=RightDarkRing,
        back="Solemnity Cape",legs="Ayanmo Cosciales +2",feet="Ayanmo Gambieras +1"
    }

    sets.AfflatusSolace = sets.idle
    sets.AfflatusMisery = sets.idle.PDT

    sets.idle.Town = sets.idle
    sets.idle.Weak = sets.idle.PDT
    sets.resting = sets.idle

    ---------------------------------------------------------------------------
    -- Defense sets -----------------------------------------------------------
    ---------------------------------------------------------------------------
    sets.defense.PDT = sets.idle.PDT
    sets.defense.MDT = sets.idle.PDT

    sets.Kiting = {feet="Herald's Gaiters"}

    ---------------------------------------------------------------------------
    -- Engaged sets -----------------------------------------------------------
    ---------------------------------------------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    ---------------------------------------------------------------------------
    -- Basic set for if no TP weapon is defined. ------------------------------
    ---------------------------------------------------------------------------
    sets.engaged = set_combine( sets.defense.PDT, {
        main="Queller Rod",
        ammo="Tengu-no-Hane",
        neck="Sanctity Necklace",
        ear1="Bladeborn Earring",
        ear2="Steelflash Earring",
        ring1="Ramuh Ring +1",
        ring2="Apate Ring",
        waist="Windbuffet Belt +1",
    })
    ---------------------------------------------------------------------------
    -- Weaponskill sets -------------------------------------------------------
    ---------------------------------------------------------------------------
    gear.default.weaponskill_neck  = "Fotia Gorget"
    gear.default.weaponskill_waist = "Fotia Belt"
    sets.precast.WS = sets.engaged
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.english == "Paralyna" and buffactive.Paralyzed then
        -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
        eventArgs.handled = true
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
end

function job_buff_change(name,gain)
    if name == "Afflatus Misery" and gain then
        send_command('gs c set IdleMode "PDT"')
    end
    if name == "Afflatus Solace" and gain then
        send_command('gs c set IdleMode "None"')
    end
end



-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
end

function job_handle_equipping_gear(playerStatus, eventArgs)
    if player.equipment.back == 'Mecisto. Mantle' then
        disable('back')
    else
        enable('back')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') and player.status == 'Engaged' then
            return "CureMelee"
        elseif default_spell_map == 'Cure' and state.Buff['Afflatus Solace'] then
            return "CureSolace"
        elseif spell.skill == "Enfeebling Magic" then
            if spell.type == "WhiteMagic" then
                return "MndEnfeebles"
            else
                return "IntEnfeebles"
            end
        end
    end
end


function customize_idle_set(idleSet)
    if buffactive['Afflatus Solace'] then
        idleSet = sets.AfflatusSolace
    elseif buffactive['Afflatus Misery'] then
        idleSet = sets.AfflatusMisery
    end
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not areas.Cities:contains(world.area) then
        local needsArts =
            player.sub_job:lower() == 'sch' and
            not buffactive['Light Arts'] and
            not buffactive['Addendum: White'] and
            not buffactive['Dark Arts'] and
            not buffactive['Addendum: Black']

        if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
            if needsArts then
                send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
            else
                send_command('@input /ja "Afflatus Solace" <me>')
            end
        end
    end
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'RDM' then
        set_macro_page(2, 3)    elseif player.sub_job == 'SCH' then
        set_macro_page(2, 3)
    else
        set_macro_page(2, 3)
    end
end

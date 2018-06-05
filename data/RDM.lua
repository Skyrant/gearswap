-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Saboteur = buffactive.saboteur or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT')

    gear.default.obi_waist = "Sekhmet Corset"
    
    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
     -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Chainspell'] = {body="Vitivation Tabard"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Atrophy Chapeau +1",
        body="Atrophy Tabard +1",hands="Yaoyotl Gloves",
        back="Refraction Cape",legs="Hagondes Pants",feet="Hagondes Sabots"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    -- 80% Fast Cast (including trait) for all spells, plus 5% quick cast
    -- No other FC sets necessary.
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
        body="Shango Robe",         -- 08%
        hands="Gendewitha Gages +1",-- 07% 
        ring1="Prolix Ring",        -- 02%
        ring2="Kishar Ring",        -- 04%
        back="Swith Cape",          -- 03%
        waist="Witful Belt",        -- 03%/03% quick magic
        legs="Gyve Trousers",       -- 05%
        feet="Regal Pumps +1"       -- 04%
    --------------------------- Total: 56% ------------------------------------
    }

    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Atrophy Chapeau +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Atrophy Tabard +1",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Atheling Mantle",waist="Caudata Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, 
        {neck="Soil Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
        ring1="Aquasoul Ring",ring2="Aquasoul Ring",waist="Soil Belt"})

    sets.precast.WS['Sanguine Blade'] = {ammo="Witchstone",
        head="Hagondes Hat",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Acumen Ring",
        back="Toro Cape",legs="Hagondes Pants",feet="Hagondes Sabots"}

    
    -- Midcast Sets
    
    --[[sets.midcast.FastRecast = {head="Atrophy Chapeau +1",ear2="Loquacious Earring",
        body="Vitivation Tabard",hands="Gendewitha Gages",ring1="Prolix Ring",
        back="Swith Cape",waist="Witful Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}]]

    sets.midcast.Cure = {
        head="Befouled Crown",neck="Colossus's Torque",ear1="Roundel Earring",ear2="Loquacious Earring",
        body="Telechine Chas.",hands="Telechine Gloves",ring1="Prolix Ring",ring2="Sirona's Ring",
        back="Pahtli Cape",waist="Witful Belt",legs="Telechine Braconi",feet="Lethargy Houseaux +1"}
        
    sets.midcast.Curaga = sets.midcast.Cure
    --[[sets.midcast.CureSelf = {ring1="Kunaji Ring",ring2="Asklepian Ring"}]]

    sets.midcast['Enhancing Magic'] = {
        neck="Colossus's Torque", head="Befouled Crown", ear1="Andoaa Earring",
        body="Manasa Chasuble",hands="Ayao's Gages", legs="Telchine Braconi", waist="Olympus Sash",
        legs="Portent Pants"}


    sets.midcast.Refresh = {legs="Crimson Cuisses",feet="Leth. Houseaux +1"}
    sets.midcast.Stoneskin = {head="Umuthi Hat", waist="Siegel Sash"}
    
    sets.midcast['Enfeebling Magic'] = {main="Grioavolr",sub="Enki Strap",range="Pemphredo Tathlum",
        head="Merlinic Hood",neck="Henic Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Omega Ring",ring2="Kishar Ring",
        back="Ogapepo Cape",waist="Rumination Sash",legs="Merlinic Shalwar",feet="Mallquis Clogs +1"}

    sets.midcast['Dia III']  = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitivation Chapeau"})
    sets.midcast['Slow II']  = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitivation Chapeau"})
    sets.midcast['Bio III']  = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitivation Tights"})
    sets.midcast['Blind II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitivation Tights"})
    sets.midcast['Paralyze II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitivation Boots"})
    
    sets.midcast['Elemental Magic'] = {main="Baqil Staff",sub="Benthos Grip",ammo="Clarus Stone",
        head="Helios Band",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Helios Jacket", hands="Helios Gloves",ring1="Omega Ring +1",ring2="Shiva Ring",
        back="Toro Cape",waist="Tengu-no-Obi",legs="Telchine Braconi", feet="Helios Boots"}
        
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    sets.midcast['Dark Magic'] = {main="Baqil Staff",sub="Benthos Grip",ammo="Clarus Stone",
        head="Helios Band",neck="Stoicheion Medal",neck="Aesir Torque",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body="Helios Cloak", hands="Helios Gloves",ring1="Prolix Ring",ring2="Shiva Ring",
        back="Toro Cape",waist="Tengu-no-Obi",legs="Telchine Braconi",feet="Helios Boots"}

    --sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {})

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {ring1="Excelsis Ring", waist="Fucho-no-Obi"})

    sets.midcast.Aspir = sets.midcast.Drain


    -- Sets for special buff conditions on spells.

    sets.midcast.EnhancingDuration = {hands="Atrophy Gloves +1",back="Ghostfyre Cape",feet="Estoqueur's Houseaux +2"}
        
    --[[sets.buff.ComposureOther = {head="Estoqueur's Chappel +2",
        body="Estoqueur's Sayon +2",hands="Estoqueur's Gantherots +2",
        legs="Estoqueur's Fuseau +2",feet="Estoqueur's Houseaux +2"}]]

    sets.buff.Saboteur = {hands="Estoqueur's Gantherots +2"}
    

    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {main="Bolelabunga",sub="Genbu's Shield",range="Aureole",
        head="Vitivation Chapeau +1",neck="Loricate Collar",ear1="Novia Earring",ear2="Loquacious Earring",
        hands="Serpentes Cuffs",ring1="Leviathan Ring +1",ring2="Prolix Ring",
        back="Umbra cape",waist="Fucho-no-Obi",legs="Crimson Cuisses",feet="Serpentes Sabots"}
    

    -- Idle sets
    sets.idle = {main="Bolelabunga",sub="Thuellaic ecu +1",ammo="Seraphic Ampulla",
        head="Befouled Crown", neck="Sanctity Necklace", ear1="Infused Earring", ear2="Moonshade Earring", 
        body="Witching Robe", hands="Wicce Gloves +1", ring1="Shiva Ring",ring2="Shiva Ring +1",
        back="Bane Cape", waist="Refoccilation Stone", legs="Assid. Pants +1", feet="Regal Pumps +1"}



    --[[sets.idle.Town = {main="Bolelabunga",sub="Genbu's Shield",range="Aureole",
        head="Vitivation Chapeau +1",neck="Loricate Collar",ear1="Novia Earring",ear2="Loquacious Earring",
        hands="Serpentes Cuffs",ring1="Leviathan Ring +1",ring2="Prolix Ring",
        back="Umbra cape",waist="Fucho-no-Obi",legs="Crimson Cuisses",feet="Serpentes Sabots"}
    
    sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",range="Aureole",
        head="Vitivation Chapeau +1",neck="Loricate Collar",ear1="Novia Earring",ear2="Loquacious Earring",
        hands="Serpentes Cuffs",ring1="Leviathan Ring +1",ring2="Prolix Ring",
        back="Umbra cape",waist="Fucho-no-Obi",legs="Crimson Cuisses",feet="Serpentes Sabots"}

    sets.idle.PDT = {main="Bolelabunga",sub="Genbu's Shield",range="Aureole",
        head="Vitivation Chapeau +1",neck="Loricate Collar",ear1="Novia Earring",ear2="Loquacious Earring",
        hands="Serpentes Cuffs",ring1="Leviathan Ring +1",ring2="Prolix Ring",
        back="Umbra cape",waist="Fucho-no-Obi",legs="Crimson Cuisses",feet="Serpentes Sabots"}

    sets.idle.MDT = {main="Bolelabunga",sub="Genbu's Shield",range="Aureole",
        head="Vitivation Chapeau +1",neck="Loricate Collar",ear1="Novia Earring",ear2="Loquacious Earring",
        hands="Serpentes Cuffs",ring1="Leviathan Ring +1",ring2="Prolix Ring",
        back="Umbra cape",waist="Fucho-no-Obi",legs="Crimson Cuisses",feet="Serpentes Sabots"}]]
    
    
    -- Defense sets
    --[[sets.defense.PDT = {main="Bolelabunga",sub="Genbu's Shield",range="Aureole",
        head="Vitivation Chapeau +1",neck="Loricate Collar",ear1="Novia Earring",ear2="Loquacious Earring",
        hands="Serpentes Cuffs",ring1="Leviathan Ring +1",ring2="Prolix Ring",
        back="Umbra cape",waist="Fucho-no-Obi",legs="Crimson Cuisses",feet="Serpentes Sabots"}

    sets.defense.MDT = {main="Bolelabunga",sub="Genbu's Shield",range="Aureole",
        head="Vitivation Chapeau +1",neck="Loricate Collar",ear1="Novia Earring",ear2="Loquacious Earring",
        hands="Serpentes Cuffs",ring1="Leviathan Ring +1",ring2="Prolix Ring",
        back="Umbra cape",waist="Fucho-no-Obi",legs="Crimson Cuisses",feet="Serpentes Sabots"}]]

    sets.Kiting = {legs="Crimson Cuisses"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
        head="Atrophy Chapeau +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Atrophy Tabard +1",hands="Atrophy Gloves +1",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Atheling Mantle",waist="Goading Belt",legs="Osmium Cuisses",feet="Atrophy Boots"}

    sets.engaged.Defense = {ammo="Demonry Stone",
        head="Atrophy Chapeau +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Atrophy Tabard +1",hands="Atrophy Gloves +1",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Kayapa Cape",waist="Goading Belt",legs="Osmium Cuisses",feet="Atrophy Boots"}


end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.english:startswith('Gain-') then
        send_command('@input /echo Spell Name: ' ..spell.english )
    end
    if spell.skill == 'Enfeebling Magic' and state.Buff.Saboteur then
        equip(sets.buff.Saboteur)
    elseif spell.skill == 'Enhancing Magic' then
        equip(sets.midcast.EnhancingDuration)
        if buffactive.composure and spell.target.type == 'PLAYER' then
            equip(sets.buff.ComposureOther)
        end
    elseif spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.midcast.CureSelf)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'None' then
            enable('main','sub','range')
        else
            disable('main','sub','range')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(2, 5)
    elseif player.sub_job == 'NIN' then
        set_macro_page(3, 5)
    elseif player.sub_job == 'THF' then
        set_macro_page(4, 5)
    else
        set_macro_page(1, 5)
    end
end


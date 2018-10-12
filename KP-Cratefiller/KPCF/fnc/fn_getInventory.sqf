/*
    Killah Potatoes Cratefiller

    Author: Dubjunk - https://github.com/KillahPotatoes
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Gets all inventory items of the active crate.

    Parameter(s):
    NONE

    Returns:
    NONE
*/

// Dialog controls
private _dialog = findDisplay 758067;

// Check if script runs on server
if (!hasInterface) exitWith {};

// Check if dialog is open
if (isNull _dialog) exitWith {};

// Check for an active storage
if (isNull KPCF_activeStorage) exitWith {
    hint localize "STR_KPCF_HINTSELECTION";
    [{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;
};

// Reset variables
KPCF_inventory = [];

// Get all cargo
private _item = getItemCargo KPCF_activeStorage;
private _weapon = getWeaponCargo KPCF_activeStorage;
private _magazine = getMagazineCargo KPCF_activeStorage;
private _cargo = _item;
(_cargo select 0) append (_weapon select 0);
(_cargo select 1) append (_weapon select 1);
(_cargo select 0) append (_magazine select 0);
(_cargo select 1) append (_magazine select 1);

// Count the variable index
private _count = count (_cargo select 0);

// Adapt the cargo into KPCF variable
for "_i" from 0 to (_count-1) do {
    KPCF_inventory pushBack [(_cargo select 0) select _i, (_cargo select 1) select _i];
};

call KPCF_fnc_showInventory;

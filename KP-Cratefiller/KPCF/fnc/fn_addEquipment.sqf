/*
    Killah Potatoes Cratefiller

    Author: Dubjunk - https://github.com/KillahPotatoes
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Adds the given amount of the selected item to the crate.

    Parameter(s):
    0 : SCALAR - Amount of the added item.

    Returns:
    NONE
*/

params [
    "_amount"
];

// Dialog controls
private _dialog = findDisplay 758067;
private _ctrlCrate = _dialog displayCtrl 75801;
private _ctrlCargo = _dialog displayCtrl 75802;
private _ctrlCat = _dialog displayCtrl 75810;
private _ctrlWeapon = _dialog displayCtrl 75811;
private _ctrlEquipment = _dialog displayCtrl 75812;
private _ctrlInventory = _dialog displayCtrl 75820;
private _ctrlInventoryAmount = _dialog displayCtrl 75821;

private _index = lbCurSel _ctrlEquipment;

// Check for empty selection
if (_index == -1) exitWith {};

// Item selection
private _item = (KPCF_activeCategory select _index);

// Add the given item
KPCF_activeCrate addItemCargoGlobal [_item, _amount];

call KPCF_fnc_getInventory;

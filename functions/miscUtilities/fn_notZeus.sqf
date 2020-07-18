/*
 * Author: Eric
 * Kicks players back to lobby if they try to access zeus without being zeus.
 *
 * Arguments:
 * 0: allowedUIDs <ARRAY OF STRINGS>
 *
 * Return Value:
 * None
 *
 * Example:
 * [["76561198065818848", "76064198065872865"]] call EMF_fnc_notZeus
 *
 * public: No
*/

params[["_allowedUIDs", "0"]];

// Check if params are set and is of correct type
if (isNil "_allowedUIDs") exitWith {  ['allowedUIDs is not set'] call BIS_fnc_error; 'allowedUIDs is not set' call BIS_fnc_log;};
if (typeName _allowedUIDs != "ARRAY") exitWith {  ['allowedUIDs must be type "ARRAY", type %1 supplied', (typeName _allowedUIDs)] call BIS_fnc_error; ['allowedUIDs must be type "ARRAY", type %1 supplied', (typeName _allowedUIDs)] call BIS_fnc_log;};

// If player has zeus assigned and does not have a UID mentioned in _allowedUIDs and is not admin, kick him back to lobby
if (!isNull (getAssignedCuratorLogic player) && !((getPlayerUID player) in _allowedUIDs)) then {
  	["wrongZeus", false, 0.01, false] call BIS_fnc_endMission;
}
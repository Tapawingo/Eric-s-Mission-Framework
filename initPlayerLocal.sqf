/*
 * Author: Bohemia Interactive, Eric
 * example local initialization, executed locally when player joins mission (includes both mission start and JIP).
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
*/

// For some reason arma thinks this is initPlayerServer and runs this for every client each time a new player initializes
if ((_this select 0) != player) exitWith {};

// Enable player FPS counter for zeus
call EMF_fnc_zeusFPS;

// Limit respawns to 4 for team 0
[4, 0] call EMF_fnc_limitedRespawns;
// Limit respawns to 2 for team 1
[2, 1] call EMF_fnc_limitedRespawns;

// Kick player back to lobby if they are zeus and not Eric, change "76561198065818848" to your steamID
[["76561198065818848"]] call EMF_fnc_notZeus;

// Load loadouts for 1 team
[["USA_EARLY90_RANGER_DESERT"]] call EMF_fnc_kosherArsenalLoad;
[false] call EMF_fnc_kosherArsenal;

// If player has role "SL" allow spawning rallypoints
["SL", 5] call EMF_fnc_rallypoint;

// Allow to Sling primary if has role:
["BREACHER", 5] call EMF_fnc_slingPrimary;

// Make enemy units within 300m to investigate shots
[] call EMF_fnc_unitInvestigate;

/*
 * Author: Eric
 * Sets role and team of supplied unit, is required for most of EMF functions.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Role <STRING>
 * 2: Team <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this, 5] call EMF_fnc_EMFRoleSet
 *
 * public: Yes
*/

params["_obj", "_role", ["_team", 0]];

//Set team variable
_obj setVariable ["unitTeamRole", _team, true];

//Check if _role exists and is valid
if (isNil "_role") then {
  (format['EMFRoleSet!Error [%1][UnitRole not set : default unit role to "RFL"]']) remoteExec ["hint", 0];
  //Set role variable to default
  _obj setVariable ["unitSquadRole", "RFL", true];
} else {
  if ((typeName _role) == "STRING") then {
    //Set role variable to _role
    _obj setVariable ["unitSquadRole", _role, true];
  } else {
    (format['EMFRoleSet!Error [%1][UnitRole not string : default unit role to "RFL"]']) remoteExec ["hint", 0];
    //Set role variable to default
    _obj setVariable ["unitSquadRole", "RFL", true];
  };
};

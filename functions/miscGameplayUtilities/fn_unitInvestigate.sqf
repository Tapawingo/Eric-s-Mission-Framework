/*
 * Author: Eric
 * Make AI within x radius investigate fired shots.
 *
 * Arguments:
 * 0: Investigation Radius <NUMBER>
 * 1: waypoint Radius <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [300, 15] call EMF_fnc_unitInvestigate
 *
 * public: False
*/

params[["_InvestigationRadius", 300], ["_waypointRadius", 15]];
EMF_uInvestigate_InvestigationRadius = _InvestigationRadius;
EMF_uInvestigate_waypointRadius = _waypointRadius;
publicVariable "EMF_uInvestigate_InvestigationRadius";
publicVariable "EMF_uInvestigate_waypointRadius";

player addEventHandler ["Fired", {
  // Make sure unit is not in airial or naval vehicle
  if (typeOf (vehicle (_this select 0)) != "Air" && typeOf (vehicle (_this select 0)) != "Ship") then {
    [(_this select 0)] spawn {
      params["_unit"];

      // Get an array of affected groups
      private _unitGroups = [];
      {
        if ((side _x) == east) then {
          _unitGroups pushBackUnique (group _x);
          sleep 0.01;
        };
      } forEach (nearestObjects [_unit, ["Man"], EMF_uInvestigate_InvestigationRadius]);


      {
        // Delete all previous group waypoints
        for "_i" from count waypoints _x - 1 to 0 step -1 do {
        	deleteWaypoint [_x, _i];
        };

        // Set a new waypoint within x radius of instigator
        if (_unit distance (waypointPosition [(currentWaypoint _x), _x]) > (EMF_uInvestigate_waypointRadius + 15)) then {
          private _newWP = _x addWaypoint [getPos _unit, EMF_uInvestigate_waypointRadius];
          _x setCurrentWaypoint _newWP;
        };
        sleep 0.01;
      } forEach _unitGroups;
    };
  };
}];

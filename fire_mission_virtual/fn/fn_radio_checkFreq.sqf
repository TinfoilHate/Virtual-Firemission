
_pre = param [0,1];
_ret = false;

_radioList = [] call acre_api_fnc_getCurrentRadioList;
{
	if (([_x, "ACRE_PRC148"] call acre_api_fnc_isKindOf || [_x, "ACRE_PRC152"] call acre_api_fnc_isKindOf || [_x, "ACRE_PRC117F"] call acre_api_fnc_isKindOf || [_x, "ACRE_PRC77"] call acre_api_fnc_isKindOf) && !_ret) then {

		if (!isNil "tin_var_artyFreq_west" || !isNil "tin_var_artyFreq_east" || !isNil "tin_var_artyFreq_independent" || !isNil "tin_var_artyFreq_civilian") then {
			switch (side player) do {
				case west: {
					_pre = tin_var_artyFreq_west;
				};
				case east: {
					_pre = tin_var_artyFreq_east;
				};
				case independent: {
					_pre = tin_var_artyFreq_independent;
				};
				case civilian: {
					_pre = tin_var_artyFreq_civilian;
				};
			};
		};

		if ([_x] call acre_api_fnc_getRadioChannel == _pre) then {
			_ret = true
		};
	};
} forEach _radioList;

_ret
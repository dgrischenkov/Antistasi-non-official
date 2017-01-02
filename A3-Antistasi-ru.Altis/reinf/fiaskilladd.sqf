if (player != Stavros) exitWith {hint localize "STR_ONLY_COMM_FOR_THIS_FUNC"};

_skillFIA = server getVariable "skillFIA";
if (_skillFIA > 19) exitWith {hint localize "STR_TROOPS_LEVEL_IS_MAX"};
_resourcesFIA = server getVariable "resourcesFIA";
_coste = 1000 + (1.5*(_skillFIA *750));
if (_resourcesFIA < _coste) exitWith {hint format [localize "STR_NOT_MONEY_FOR_TRAINING",_coste]};

_resourcesFIA = _resourcesFIA - _coste;
_skillFIA = _skillFIA + 1;
hint format [localize "STR_TRAINING_DONE_AND_CURRENT_LEVEL",_skillFIA];
server setVariable ["skillFIA",_skillFIA,true];
server setVariable ["resourcesFIA",_resourcesFIA,true];

{
_coste = server getVariable _x;
_coste = round (_coste + (_coste * (_skillFIA/280)));
server setVariable [_x,_coste,true];
} forEach soldadosFIA;

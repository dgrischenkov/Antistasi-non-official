if (player != Stavros) exitWith {hint "Only Commander Stavros has access to this function"};

_skillFIA = server getVariable "skillFIA";
if (_skillFIA > 19) exitWith {hint "Your troops have the maximum training"};
_resourcesFIA = server getVariable "resourcesFIA";
_coste = 1000 + (1.5*(_skillFIA *750));
if (_resourcesFIA < _coste) exitWith {hint format ["You do not have enough money to afford additional training. %1 € needed",_coste]};

_resourcesFIA = _resourcesFIA - _coste;
_skillFIA = _skillFIA + 1;
hint format ["FIA Skill Level has been Upgraded\nCurrent level is %1",_skillFIA];
server setVariable ["skillFIA",_skillFIA,true];
server setVariable ["resourcesFIA",_resourcesFIA,true];

{
_coste = server getVariable _x;
_coste = round (_coste + (_coste * (_skillFIA/280)));
server setVariable [_x,_coste,true];
} forEach soldadosFIA;

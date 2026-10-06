/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idGlouton0, idGlouton1, idGlouton2, idGlouton3

_global.Gloutonne = function()
{
    this.timeofeat;
    this.timetoeat = 2000;
    var _loc2_ = this._parent.trapennemis;
    var _loc3_;
    var _loc4_;
    if(this._parent.target.engine == 1)
    {
        _loc3_ = Math.floor(this._x / 640);
        _loc4_ = Math.floor((this._x + this._width) / 640);
    }
    else
    {
        _loc3_ = Math.floor(this._y / 480);
        _loc4_ = Math.floor((this._y + this._height) / 480);
    }
    if(!_loc2_[_loc3_])
    {
        _loc2_[_loc3_] = {};
    }
    _loc2_[_loc3_][this._name] = this;
    var _loc5_ = _loc4_;
    while(_loc5_ > _loc3_)
    {
        if(!_loc2_[_loc5_])
        {
            _loc2_[_loc5_] = {};
        }
        _loc2_[_loc5_][this._name] = this;
        _loc5_ -= 1;
    }
};
Gloutonne["extends"](MovieClip);
Object.registerClass("idGlouton0",Gloutonne);
Object.registerClass("idGlouton1",Gloutonne);
Object.registerClass("idGlouton2",Gloutonne);
Object.registerClass("idGlouton3",Gloutonne);
Gloutonne.prototype.eatMaxib = function()
{
    if(1311 - this.timeofeat > this.timetoeat)
    {
        this.onEnterFrame = null;
        this.onExit();
    }
};
Gloutonne.prototype.onExit = function()
{
    bench.debug = "stop";
    this.gotoAndStop("disabled");
};

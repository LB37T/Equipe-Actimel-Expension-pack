/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idMucus, idVilosites

_global.Mucus = function()
{
    var _loc2_ = this._parent.trap;
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
    lwall = this._parent.wall[_loc3_];
    for(var _loc6_ in lwall)
    {
        if(lwall[_loc6_].mcHit.hitTest(this))
        {
            this.status = lwall[_loc6_];
            this._y = this.status._y + 2;
        }
    }
    lplateforme = this._parent.plateforme[_loc3_];
    for(_loc6_ in lplateforme)
    {
        if(lplateforme[_loc6_].mcHit.hitTest(this))
        {
            this.status = lplateforme[_loc6_];
            this._y = this.status._y + 2;
        }
    }
};
Mucus["extends"](MovieClip);
Object.registerClass("idMucus",Mucus);
Object.registerClass("idVilosites",Mucus);
Mucus.prototype.onHit = function()
{
    bench.debug = "Mucus/Vilosite: " + this._name;
    this._parent.game.soundVilosite.start();
    this.gotoAndStop("enabled");
};
Mucus.prototype.onExit = function()
{
    bench.debug = "stop";
    this.gotoAndStop("disabled");
};

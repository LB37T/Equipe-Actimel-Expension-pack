/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idTranpoline11, idTranpoline12, idTranpoline21, idTranpoline22, idTranpoline31, idTranpoline32

_global.PlateformeTramp = function()
{
    this.mcHit._visible = false;
    var _loc2_ = this._parent.plateformetramp;
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
    this.expand = 13;
    this.damp = 12;
};
PlateformeTramp["extends"](MovieClip);
PlateformeTramp.prototype.elastic = function()
{
    this.mcHit._visible = false;
    this._parent.game.soundTrampoline.start();
    this.scale = this._xscale;
    this.onEnterFrame = function()
    {
        this._yscale = this.scale + this.expand;
        this.expand /= (- this.damp) / 10;
        if(Math.abs(this.expand) < 1)
        {
            delete this.onEnterFrame;
            this.expand = 12;
        }
    };
};
Object.registerClass("idTranpoline11",PlateformeTramp);
Object.registerClass("idTranpoline12",PlateformeTramp);
Object.registerClass("idTranpoline21",PlateformeTramp);
Object.registerClass("idTranpoline22",PlateformeTramp);
Object.registerClass("idTranpoline31",PlateformeTramp);
Object.registerClass("idTranpoline32",PlateformeTramp);

/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idMare

_global.Mare = function()
{
    var _loc2_ = this._parent.ennemis;
    this.status = null;
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
    this._visible = false;
    this.zone = _loc3_;
    this.piege = true;
};
Mare["extends"](MovieClip);
Object.registerClass("idMare",Mare);
Mare.prototype.onHit = function()
{
    this._parent.game.soundMarais.start();
    this._parent.target.hurt();
    this.gotoAndStop("enabled");
};
Mare.prototype.onExit = function()
{
    bench.debug = "stop";
    this.gotoAndStop("disabled");
};
Mare.prototype.go = function()
{
    if(this.status == null)
    {
        lwall = this._parent.wall[this.Zone];
        for(var _loc2_ in lwall)
        {
            if(lwall[_loc2_].mcHit.hitTest(this))
            {
                this.status = lwall[_loc2_];
                this.status.addEnnemi(this);
                this._y = this.status._y;
            }
        }
        lplateforme = this._parent.plateforme[this.Zone];
        for(_loc2_ in lplateforme)
        {
            if(lplateforme[_loc2_].mcHit.hitTest(this))
            {
                this.status = lplateforme[_loc2_];
                this.status.addEnnemi(this);
                this._y = this.status._y;
            }
        }
    }
    if(!this._visible)
    {
        this._visible = true;
        this.gotoAndStop("enabled");
    }
};
Mare.prototype.stop = function()
{
    this._visible = false;
    this.gotoAndStop("disabled");
};

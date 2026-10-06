/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idWeapon

_global.BonusWeapon = function()
{
    var _loc2_ = this._parent.bonus;
    var _loc3_ = this._parent.game.level;
    if(_loc3_ == 21)
    {
        this.gotoAndStop(1);
    }
    else if(_loc3_ == 22 || _loc3_ == 32)
    {
        this.gotoAndStop(2);
    }
    else
    {
        this.gotoAndStop(3);
    }
    var _loc4_;
    if(this._parent.target.engine == 1)
    {
        _loc4_ = Math.floor(this._x / 640);
    }
    else
    {
        _loc4_ = Math.floor(this._y / 480);
    }
    if(!_loc2_[_loc4_])
    {
        _loc2_[_loc4_] = {};
    }
    _loc2_[_loc4_][this._name] = this;
};
BonusWeapon["extends"](MovieClip);
Object.registerClass("idWeapon",BonusWeapon);
BonusWeapon.prototype.onHit = function()
{
    var _loc3_ = this._parent.target;
    var _loc4_ = this._parent.game;
    _loc4_.soundWeapon.start();
    if(!BonusWeapon.help)
    {
        _loc3_ = this._parent.target;
        _loc3_.bonus = "bonusweapon";
        delete _loc3_.onPopup;
        BonusWeapon.help = true;
    }
    else
    {
        _loc3_.munitions += _loc3_.maxmunition * ((4 - _loc4_.difficulty) / 3);
        _root.mcConsole.weapon = _loc3_.munitions;
    }
    this.remove();
};

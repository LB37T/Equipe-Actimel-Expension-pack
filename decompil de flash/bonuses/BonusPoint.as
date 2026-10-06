/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idActimel

_global.BonusPoint = function()
{
    var _loc2_ = this._parent.bonus;
    var _loc3_;
    if(this._parent.target.engine == 1)
    {
        _loc3_ = Math.floor(this._x / 640);
    }
    else
    {
        _loc3_ = Math.floor(this._y / 480);
    }
    if(!_loc2_[_loc3_])
    {
        _loc2_[_loc3_] = {};
    }
    _loc2_[_loc3_][this._name] = this;
};
BonusPoint["extends"](MovieClip);
Object.registerClass("idActimel",BonusPoint);
BonusPoint.prototype.onHit = function()
{
    var _loc3_ = this._parent.game;
    _loc3_.soundActimel.start();
    _root.mcConsole.actimel = ++_loc3_.actimel;
    this.play();
    var _loc4_;
    if(!BonusPoint.help)
    {
        _loc4_ = this._parent.target;
        _loc4_.bonus = "bonuspoint";
        delete _loc4_.onPopup;
        BonusPoint.help = true;
    }
    this.onHit = null;
};

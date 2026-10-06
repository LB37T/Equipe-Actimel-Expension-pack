/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idPack

_global.BonusPack = function()
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
BonusPack["extends"](MovieClip);
Object.registerClass("idPack",BonusPack);
BonusPack.prototype.onHit = function()
{
    var _loc2_ = this._parent.game;
    _loc2_.soundPack.start();
    _loc2_.pack++;
    this.play();
    var _loc3_;
    if(!BonusPack.help)
    {
        _loc3_ = this._parent.target;
        _loc3_.bonus = "bonuspack";
        delete _loc3_.onPopup;
        BonusPack.help = true;
    }
    this.onHit = null;
};

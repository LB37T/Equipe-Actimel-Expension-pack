/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idBouclier

_global.BonusShield = function()
{
    if(this._parent.game.difficulty > 1 && this._name.substring(2,3) == "1")
    {
        this.remove();
    }
    if(this._parent.game.difficulty > 2 && this._name.substring(2,3) == "2")
    {
        this.remove();
    }
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
BonusShield["extends"](MovieClip);
Object.registerClass("idBouclier",BonusShield);
BonusShield.prototype.onHit = function()
{
    this._parent.target.onShield();
    var _loc2_ = this._parent.game;
    _loc2_.soundShield.start();
    var _loc3_;
    if(!BonusShield.help)
    {
        _loc3_ = this._parent.target;
        _loc3_.bonus = "bonusshield";
        delete _loc3_.onPopup;
        BonusShield.help = true;
    }
    this.remove();
};

/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idVie

_global.BonusLife = function()
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
BonusLife["extends"](MovieClip);
Object.registerClass("idVie",BonusLife);
BonusLife.prototype.onHit = function()
{
    var _loc3_ = this._parent.game;
    _loc3_.soundLives.start();
    _loc3_.lives++;
    _root.mcConsole.lives++;
    this.play();
    var _loc4_;
    if(!BonusLife.help)
    {
        _loc4_ = this._parent.target;
        _loc4_.bonus = "bonuslife";
        delete _loc4_.onPopup;
        BonusLife.help = true;
    }
    this.onHit = null;
};

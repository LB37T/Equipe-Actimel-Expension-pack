/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idStart

_global.BonusStart = function()
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
BonusStart["extends"](MovieClip);
Object.registerClass("idStart",BonusStart);
BonusStart.prototype.onHit = function()
{
    var _loc3_ = this._parent.target;
    var _loc4_ = this._parent.game;
    _loc4_.soundStart.start();
    if(!BonusStart.help)
    {
        if(_loc4_.level % 10 == 3)
        {
            _loc3_.onFps = null;
            _loc3_.maxibeurk = null;
            _root.mcFond.scrolling = Zone3.scrolling = 0;
            _loc3_.onEnterFrame = null;
            _loc4_.speedTime = 0;
            _root.attachMovie("idBall","mcBall",_root.getMaxDepth(),{_x:_loc3_._x,_y:_loc3_._y,target:_loc3_,screen:"bonusstart",level:"lev" + _loc4_.level});
        }
        else
        {
            _loc3_.bonus = "bonusstart";
            delete _loc3_.onPopup;
        }
    }
    BonusStart.help = true;
    this.remove();
};

/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idEnd

_global.BonusEnd = function()
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
BonusEnd["extends"](MovieClip);
Object.registerClass("idEnd",BonusEnd);
BonusEnd.prototype.onHit = function()
{
    var _loc2_ = this._parent.game;
    var _loc3_ = this._parent.target;
    var _loc4_;
    var _loc5_;
    if(_loc2_.actimen < 7)
    {
        if(!BonusEnd.help)
        {
            _loc3_.bonus = "bonusend";
            delete _loc3_.onPopup;
            BonusEnd.help = true;
        }
    }
    else
    {
        if(_loc2_.level == 22)
        {
            _loc4_ = "Porte";
            this._parent.mcPorte.play();
        }
        else
        {
            _loc4_ = "";
        }
        _loc5_ = 1;
        while(_loc5_ < 8)
        {
            this._parent["mcActiman" + _loc5_].mcActiman.gotoAndStop("win" + lEndLabel);
            _loc5_ += 1;
        }
        _loc2_.speedTime = 0;
        _loc2_.completed = true;
        this.time = 3767;
        _loc3_.pause = null;
        this.onHit = null;
        _loc3_.hurt = null;
        _loc2_.soundEquipe.setVolume(20 * _loc2_.volume);
        _loc2_.soundEquipe.start();
        this.onEnterFrame = this.onEnd;
    }
};
BonusEnd.prototype.onEnd = function()
{
    if(6724 - this.time > 4000)
    {
        this.onEnterFrame = null;
        this._parent.game.replay("next");
    }
};

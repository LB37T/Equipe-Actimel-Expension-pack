/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idLettre2

_global.BonusLetter2 = function()
{
    this.stop();
};
BonusLetter2["extends"](MovieClip);
Object.registerClass("idLettre2",BonusLetter2);
BonusLetter2.prototype.onHit = function()
{
    var _loc3_ = this._parent.game;
    _loc3_.actimen++;
    if(_loc3_.actimen == 7)
    {
        _loc3_.completed = true;
    }
    _loc3_.soundLetter.start();
    var _loc4_;
    if(!_loc3_.completed)
    {
        _root.mcConsole["mcLettre" + _loc3_.actimen].play();
        this.onEnterFrame = function()
        {
            this._x += 60;
            if(this._x > 600)
            {
                this.remove();
            }
        };
    }
    else
    {
        _loc3_.speedTime = 0;
        this._parent.target.hurt = null;
        clearInterval(this._parent.target.onTime);
        _loc4_ = 1;
        while(_loc4_ < 8)
        {
            _root.mcConsole["mcLettre" + _loc4_].gotoAndPlay(2);
            _loc4_ += 1;
        }
        this.onEnterFrame = function()
        {
            this._x += 60;
            if(this._x > 600)
            {
                _root.attachMovie("idGroupeJets","mcGroupeJets",this._parent.target.getDepth() - 1,{_x:650,_y:240});
                this._parent.onTime = setInterval(this._parent.next,5000,this._parent);
                this._visible = false;
                this.onEnterFrame = null;
            }
        };
    }
    this.gotoAndStop("win");
    this.onHit = null;
};

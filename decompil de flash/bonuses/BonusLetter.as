/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idLettre, idLettre3

_global.BonusLetter = function()
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
    this.num = this._name.substring(9);
    this.gotoAndStop(this.num);
};
BonusLetter["extends"](MovieClip);
Object.registerClass("idLettre",BonusLetter);
Object.registerClass("idLettre3",BonusLetter);
BonusLetter.prototype.onHit = function()
{
    var _loc3_ = this._parent.game;
    this.onHit = null;
    if(_loc3_.level == 32)
    {
        this._parent.attachMovie("idCramz","mcCramz" + this.num,this._parent.getMaxDepth(),{_x:this._x,_y:this._y});
    }
    this._x = this._parent.mcEnd._x + (this.num - 1) * 30;
    this._y = this._parent.mcEnd._y;
    this.mcLettre._visible = false;
    var _loc4_ = _loc3_.level != 22 ? "" : "Porte";
    this.mcActiman.gotoAndStop("end" + _loc4_);
    _loc3_.actimen++;
    _loc3_.soundLetter.start();
    var _loc5_;
    if(_loc3_.actimen == 7)
    {
        _loc5_ = 1;
        while(_loc5_ < 8)
        {
            _root.mcConsole["mcLettre" + _loc5_].gotoAndPlay(2);
            _loc5_ += 1;
        }
    }
    else
    {
        _root.mcConsole["mcLettre" + this.num].play();
    }
    var _loc6_;
    if(!BonusLetter.help)
    {
        _loc6_ = this._parent.target;
        _loc6_.bonus = "bonusletter";
        delete _loc6_.onPopup;
        BonusLetter.help = true;
    }
};

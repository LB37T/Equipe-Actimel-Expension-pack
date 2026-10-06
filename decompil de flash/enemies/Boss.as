/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite du bloc Micelle dans le SWF décompilé.
 */
// Symboles Flash associés : idBoss

Boss = function()
{
    this.deltaX = 220;
    this.min = 320 - this.deltaX;
    this.max = 320 + this.deltaX;
    this.scroll = (this._parent.game.difficulty - 1) * 10;
    this.stability = 6;
    this.lives = 7;
    this.invincibility = 2000;
    this._xscale = Math.floor(Math.random() * 2) != 0 ? 100 : -100;
    this.speedX = this._xscale / 15;
    this.status = "walk";
    this.couronne = this._parent.game.level != 34 ? false : true;
    this.hurt = this.onHurt;
    this.onEnterFrame = this.move;
};
Boss["extends"](MovieClip);
Object.registerClass("idBoss",Boss);
Boss.prototype.move = function()
{
    this.gotoAndStop(this.status);
    this._x += this.speedX;
    bench.debug = this.status;
    if(this.status == "run")
    {
        this._parent._y += Math.random() * this.scroll - this.scroll / 2;
    }
else
{
    this._parent._y = this._parent.debY;
}
};
Boss.prototype.change = function()
{
    var _loc2_ = Math.floor(Math.random() * this.stability * 2);
    if(this._x > this.max && this._xscale > 0 || this._x < this.min && this._xscale < 0 || _loc2_ < 2 && this._x < this.max && this._x > this.min)
    {
        this.speedX = 0;
        this.status = "turn";
    }
else if(_loc2_ < 6 && this.status != "pause")
{
    this.status = this.status != "run" ? "run" : "walk";
    this.onChange();
}
};
Boss.prototype.turn = function()
{
    this._xscale = - this._xscale;
    this.status = Math.floor(Math.random() * this.stability) >= 1 ? "walk" : "run";
    this.onChange();
};
Boss.prototype.onChange = function()
{
    this.speedX = this.status != "run" ? this._xscale / 15 : this._xscale / 5;
    if(this.status == "run")
    {
        this._parent.game.soundBoss.start();
    }
};
Boss.prototype.onHurt = function()
{
    var _loc3_ = this._parent.game;
    var _loc4_ = this._parent.target;
    this.status = "pause";
    this.hurt = null;
    this.lives--;
    _loc3_.maxibeurk++;
    _loc3_.soundBossLost.start();
    _loc3_.soundLetter.start();
    var _loc5_;
    if(this.lives == 0)
    {
        delete _loc4_.onBossLost;
        _loc4_.hurt = null;
        _loc5_ = 1;
        while(_loc5_ < 8)
        {
            _root.mcConsole["mcLettre" + _loc5_].gotoAndPlay(2);
            _loc5_ += 1;
        }
}
else
{
    _root.mcConsole["mcLettre" + (7 - this.lives)].play();
}
this.speedX = 0;
this.createEmptyMovieClip("mcInvincibility",0);
this.mcInvincibility.blink = true;
this.invincibilityTime = 8097;
this.mcInvincibility.onEnterFrame = function()
{
    var _loc2_ = this._parent;
    if(6926 - _loc2_.invincibilityTime - _loc2_.invincibility > 0)
    {
        new Color(_loc2_).setTransform({ga:100,ba:100});
        if(_loc2_.lives == 0)
        {
            _loc2_._xscale = 100;
            _loc2_.change = null;
            if(_loc2_._parent.game.level != 34)
            {
                _loc2_.status = "walk";
                new Color(_loc2_).setTransform({ga:0,ba:0});
                _loc2_.speedX = _loc2_._xscale / 15;
                _loc2_.onTime = setInterval(_loc2_.onLost,4000,_loc2_);
            }
        else
        {
            _loc2_.status = "fall";
            new Color(_loc2_).setTransform({ga:100,ba:100});
            _loc2_.onTime = setInterval(_loc2_.onLost,6000,_loc2_);
        }
}
else
{
    _loc2_.status = "walk";
    _loc2_.speedX = _loc2_._xscale / 15;
    _loc2_.blinking = false;
    _loc2_.invincibility *= 1.1;
    _loc2_.hurt = _loc2_.onHurt;
}
this.remove();
}
else
{
    new Color(_loc2_).setTransform(!this.blinking ? {ga:100,ba:100} : {ga:0,ba:0});
    this.blinking = !this.blinking;
}
};
};
Boss.prototype.onLost = function(pThis)
{
    this = pThis;
    clearInterval(this.onTime);
    this._parent.game.replay("next");
};

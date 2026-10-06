/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idBall

_global.Popup = function()
{
    this.target.speedX = 0;
    this.target.speedY = 0;
    this.target.onEnterFrame = null;
    this.target.target.mcBoss.onEnterFrame = null;
    this.target.gotoAndStop("pause");
    this.onEnterFrame = this.move;
};
Popup["extends"](MovieClip);
Object.registerClass("idBall",Popup);
Popup.prototype.move = function()
{
    if(Key.isDown(Game.ACTION))
    {
        this.onClose();
    }
    this._x += (320 - this._x) / 3;
    this._y += (255 - this._y) / 3;
    if(Math.abs(320 - this._x) < 1)
    {
        this.onEnterFrame = function()
        {
            if(Key.isDown(Game.ACTION))
            {
                this.onClose();
            }
        };
        this._x = 320;
        this._y = 255;
        this.play();
    }
};
Popup.prototype.onStart = function()
{
    this.nextFrame();
    this.createEmptyMovieClip("mcConteneur",0);
    this.mcConteneur._x = -249;
    this.mcConteneur._y = -157;
    this.mcConteneur.loadMovie(this.screen + ".swf");
    this.onEnterFrame = this.onLoadScreen;
};
Popup.prototype.onLoadScreen = function()
{
    if(this.mcConteneur.getBytesTotal() && this.mcConteneur.getBytesLoaded() >= this.mcConteneur.getBytesTotal())
    {
        this.onEnterFrame = this.close;
        _quality = "HIGH";
        this.mcConteneur.nextFrame();
    }
};
Popup.prototype.close = function()
{
    if(Key.isDown(Game.ACTION))
    {
        _quality = Game.quality;
        this.onEnterFrame = null;
        this.mcConteneur.remove();
        this.mcBallCoins.play();
    }
    else if(Key.isDown(Game.PAUSE) && this.screen == "pause")
    {
        this.target.game.lives = 0;
        this.target.game.replay("lost");
    }
};
Popup.prototype.onClose = function()
{
    if(this.target.frameafterpause != null)
    {
        this.target.onEnterFrame = this.target.frameafterpause;
    }
    else
    {
        this.target.onEnterFrame = this.target.move;
    }
    this.target.frameafterpause = null;
    _root.newGame.speedTime = 1;
    var _loc3_;
    if(_root.newGame.level % 10 == 3)
    {
        if(_root.newGame.level != 13)
        {
            this.target.time = 10092;
            delete this.target.maxibeurk;
            for(var _loc4_ in _root)
            {
                if(_root[_loc4_] instanceof MaxibeurkVol || _root[_loc4_] instanceof MaxibeurkVolTir)
                {
                    _root[_loc4_].onEnterFrame = _root[_loc4_].move;
                }
            }
        }
        this.target.timeFps = 1392;
        delete this.target.onFps;
    }
    else
    {
        this.target.gotoAndStop("move");
        this.target.target.mcBoss.onEnterFrame = this.target.target.mcBoss.move;
        this.target.target.micellea.onEnterFrame = this.target.target.micellea.move;
        _loc3_ = this.target.current_zone - 1;
        while(_loc3_ < this.target.current_zone + 2)
        {
            lennemis = this.target.target.ennemis[lZone];
            for(_loc4_ in lennemis)
            {
                lennemis[_loc4_].restart();
            }
            lplatevert = this.target.target.plateformevert[lZone];
            for(_loc4_ in lplatevert)
            {
                lplatevert[_loc4_].restart();
            }
            lplatemove = this.target.target.plateformemove[lZone];
            for(_loc4_ in lplatemove)
            {
                lplatemove[_loc4_].restart();
            }
            _loc3_ += 1;
        }
        if(_root.newGame.level == 12 && this.target.current_Zone > 1)
        {
            this.target.startmicelle();
        }
    }
    this.remove();
};

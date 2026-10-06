/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idScreen

_global.Screen = function()
{
};
Screen["extends"](MovieClip);
Object.registerClass("idScreen",Screen);
Screen.prototype.loadGame = function()
{
    if(this.game.level == 35)
    {
        this.loadEnd();
    }
    else if(this.game.level % 10 == 1)
    {
        this.loadUnivers();
    }
    else
    {
        this.loadLevel();
    }
};
Screen.prototype.loadUnivers = function()
{
    _quality = "high";
    this.onEnterFrame = this.onLoadUnivers;
    this.createEmptyMovieClip("mcConteneur",0);
    this.mcConteneur.loadMovie("univers" + Math.floor(this.game.level / 10) + ".swf");
};
Screen.prototype.onLoadUnivers = function()
{
    if(this.mcConteneur.getBytesTotal() && this.mcConteneur.getBytesLoaded() >= this.mcConteneur.getBytesTotal())
    {
        this.keyb = {target:this};
        this.keyb.onKeyDown = function()
        {
            this.target.loadLevel(this.target);
        };
        Key.addListener(this.keyb);
        this.mcConteneur.play();
        this.game.soundMap.start(0,50);
        this.onEnterFrame = this.onMapEnd;
    }
};
Screen.prototype.onMapEnd = function()
{
    if(this.mcConteneur._currentframe == 71)
    {
        this.game.soundHalo.start();
    }
    if(this.mcConteneur._currentframe == this.mcConteneur._totalframes)
    {
        this.mcConteneur.stop();
        this.onEnterFrame = this.fadeOutMap;
        this.onTime = setInterval(this.loadLevel,3500,this);
    }
};
Screen.prototype.fadeOutMap = function()
{
    var _loc2_ = this.game.soundMap;
    if(_loc2_.getVolume() > 1)
    {
        _loc2_.setVolume(_loc2_.getVolume() - 1);
    }
};
Screen.prototype.loadLevel = function(pThis)
{
    _quality = "high";
    if(pThis)
    {
        this = pThis;
        clearInterval(this.onTime);
        delete this.onTime;
        Key.removeListener(this.keyb);
        delete this.keyb;
    }
    this.game.soundMap.stop();
    this.onEnterFrame = this.onLoadLevel;
    if(!this.mcConteneur)
    {
        this.createEmptyMovieClip("mcConteneur",0);
    }
    this.mcConteneur.loadMovie("level" + this.game.level + ".swf");
};
Screen.prototype.onLoadLevel = function()
{
    var _loc2_;
    if(this.mcConteneur.getBytesTotal() && this.mcConteneur.getBytesLoaded() >= this.mcConteneur.getBytesTotal())
    {
        this.onEnterFrame = null;
        this.mcConteneur.stop();
        this.game.soundFondVoix.start(0,10);
        _loc2_ = this.game["soundLevel" + this.game.level];
        _loc2_.setVolume(22 * this.game.volume);
        _loc2_.start();
        if(options)
        {
            _loc2_.onSoundComplete = function()
            {
                mcScreen.onEnterFrame = mcScreen.fadeOut;
            };
        }
        else
        {
            _quality = "high";
            this.onEnterFrame = this.onLevelEnd;
        }
    }
};
Screen.prototype.fadeOut = function()
{
    var _loc2_ = this.game.soundFondVoix;
    _loc2_.setVolume(_loc2_.getVolume() - 2);
    if(_loc2_.getVolume() < 1)
    {
        this.onEnterFrame = this.onLevelEnd;
    }
};
Screen.prototype.onLevelEnd = function()
{
    if(this.mcConteneur._currentframe == this.mcConteneur._totalframes)
    {
        this.onEnterFrame = null;
        this.mcConteneur.stop();
        this.game.onTime = setInterval(this.game.onReplay,500,this.game);
    }
};
Screen.prototype.loadEnd = function()
{
    _quality = "high";
    this.onEnterFrame = this.onLoadEnd;
    this.createEmptyMovieClip("mcConteneur",0);
    this.mcConteneur.loadMovie("fin.swf");
};
Screen.prototype.onLoadEnd = function()
{
    if(this.mcConteneur.getBytesTotal() && this.mcConteneur.getBytesLoaded() >= this.mcConteneur.getBytesTotal())
    {
        this.onEnterFrame = this.onEndEnd;
        this.soundEnd = new Sound(this.mcConteneur);
        this.soundEnd.setVolume(25 * this.game.volume);
        this.mcConteneur.play();
    }
};
Screen.prototype.onEndEnd = function()
{
    if(this.mcConteneur._currentframe == this.mcConteneur._totalframes)
    {
        this.onEnterFrame = null;
        this.onTime = setInterval(this.loadScore,20000,this);
    }
};
Screen.prototype.loadScore = function(pThis)
{
    if(pThis)
    {
        this = pThis;
        delete this.soundEnd;
        clearInterval(this.onTime);
        this.mcConteneur.remove();
    }
    _quality = "high";
    this.onEnterFrame = this.onLoadScore;
    this.createEmptyMovieClip("mcConteneur",0);
    this.mcConteneur.loadMovie("scoring.swf");
};
Screen.prototype.onLoadScore = function()
{
    if(this.mcConteneur.getBytesTotal() && this.mcConteneur.getBytesLoaded() >= this.mcConteneur.getBytesTotal())
    {
        delete this.onEnterFrame;
        this.game.setScore(this.mcConteneur);
    }
};

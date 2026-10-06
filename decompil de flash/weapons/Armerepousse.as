/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idFlash

_global.Armerepousse = function()
{
    this.speedX = 20;
    this.posX;
    this.maxX = 400;
    this.dir;
    this.zone = null;
};
Armerepousse.nbmaxmunitions = 15;
Armerepousse.prototype = new MovieClip();
Object.registerClass("idFlash",Armerepousse);
Armerepousse.prototype.move = function()
{
    this._x += this.speedX;
    this.zone = this.initzone();
    lwall = this._parent.wall[this.zone];
    for(var _loc2_ in lwall)
    {
        if(lwall[_loc2_].hitTest(this) && lwall[_loc2_] != this._parent.target.status)
        {
            this.remove();
        }
    }
    lennemis = this._parent.ennemis[this.zone];
    for(_loc2_ in lennemis)
    {
        if(lennemis[_loc2_].hitTest(this))
        {
            this._parent.game.soundMaxiKill.start();
            lennemis[_loc2_].shoot(this.dir);
            this.remove();
        }
    }
    if(Math.abs(this._x - this.posX) > this.MaxX)
    {
        this.remove();
    }
};
Armerepousse.prototype.initzone1 = function()
{
    return Math.floor(Math.floor(this._x / 640));
};
Armerepousse.prototype.initzone2 = function()
{
    return Math.floor(Math.floor(this._y / 480));
};
Armerepousse.prototype.go = function(pEngine, pdir)
{
    if(pEngine == 1)
    {
        this.initzone = this.initzone1;
    }
    else
    {
        this.initzone = this.initzone2;
    }
    this.dir = pdir;
    this.speedX *= pdir;
    this.posX = this._x;
    this.onEnterFrame = this.move;
};

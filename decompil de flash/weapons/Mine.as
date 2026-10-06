/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idmine

_global.Mine = function()
{
    this.shootMax = 100;
    this.amorc = null;
    this.timeboum = 5000;
    this.zone = null;
};
Mine.nbmaxmunitions = 15;
Mine.prototype = new MovieClip();
Object.registerClass("idmine",Mine);
Mine.prototype.sleep = function()
{
    if(6147 - this.amorc > this.timeboum)
    {
        this.time.text = "BOUM!!";
        this.boum();
        this.onEnterFrame = null;
    }
};
Mine.prototype.boum = function()
{
    lennemis = this._parent.ennemis[this.zone];
    this._parent.game.soundMine.start();
    for(var _loc2_ in lennemis)
    {
        if(Math.abs(lennemis[_loc2_]._x - this._x) < this.shootMax && Math.abs(lennemis[_loc2_]._y - this._y) < this.shootMax)
        {
            this._parent.game.soundMaxiKill.start();
            lennemis[_loc2_].onEnterFrame = null;
            lennemis[_loc2_].turn = null;
            lennemis[_loc2_].onshoot = null;
            lennemis[_loc2_].cantouch = false;
            lennemis[_loc2_].isDizzy = true;
            lennemis[_loc2_]._xscale = 100;
            lennemis[_loc2_].goToAndStop("hurt");
        }
    }
};
Mine.prototype.go = function(pZone)
{
    this.zone = pZone;
};

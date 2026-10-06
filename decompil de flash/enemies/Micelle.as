/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idMicelle, idBoss, idVaisseau1, idVaisseau2, idVaisseau3

_global.Micelle = function()
{
    this.posY = null;
    this.deplY = 10;
    this.deplX = 5;
    this.onEnterFrame = this.move;
    this.angle = 0;
    this.mcCol._visible = false;
};
Micelle.prototype = new MovieClip();
Object.registerClass("idMicelle",Micelle);
Micelle.prototype.onHit = function()
{
    if(this._parent.target.hurt != null)
    {
        bench.debug = "Micelle: " + this._name;
        this._parent.game.soundMicelle.start();
        this._parent.target.goToAndStop("micelle");
        this._parent.target.speedY = this.deplY;
        this._parent.target.onEnterFrame = this._parent.target.onMicelle;
        this.remove();
    }
};
Micelle.prototype.onEclate = function()
{
};
Micelle.prototype.move = function()
{
    this._x += this.deplX * Math.sin(this.angle);
    this._y -= this.deplY;
    if(Math.floor(this._y / 480) < this._parent.target.current_zone - 1)
    {
        this.remove();
    }
    if(this._parent.target.hitTest(this))
    {
        this.onHit();
    }
    this.angle += 0.2;
};

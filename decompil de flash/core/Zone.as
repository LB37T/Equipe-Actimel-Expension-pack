/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idZone11, idZone12, idZone21, idZone22, idZone24, idZone31, idZone32, idZone34

_global.Zone = function()
{
    this.bonus = [];
    this.trap = [];
    this.plateforme = [];
    this.plateformetramp = [];
    this.plateformemove = [];
    this.plateformevert = [];
    this.ennemis = [];
    this.wall = [];
    this.trapennemis = [];
    if(BonusStart.help)
    {
        this.mcMission.remove();
    }
};
Zone["extends"](MovieClip);
Object.registerClass("idZone11",Zone);
Object.registerClass("idZone12",Zone);
Object.registerClass("idZone21",Zone);
Object.registerClass("idZone22",Zone);
Object.registerClass("idZone24",Zone);
Object.registerClass("idZone31",Zone);
Object.registerClass("idZone32",Zone);
Object.registerClass("idZone34",Zone);
Zone.prototype.init = function()
{
    this.debX = this.posX + this.target.posX;
    this.debY = this.posY + this.target.posY;
    this.move();
};
Zone.prototype.move = function()
{
    this._x = this.debX - this.target.x;
    this._y = this.debY - this.target.y;
};

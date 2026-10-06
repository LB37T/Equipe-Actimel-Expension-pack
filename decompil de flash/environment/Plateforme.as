/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idPlateforme11_0, idPlateforme11_1, idPlateforme11_2, idPlateforme11_3, idButte11_0, idButte11_1, idButte11_2, idButte11_3, idPlateforme12_0, idPlateforme12_1, idPlateforme12_2, idPlateforme12_3, idButte12_0, idButte12_1, idButte12_2, idButte12_3, idPlateforme21_0, idPlateforme21_1, idPlateforme21_2, idPlateforme21_3, idButte21_0, idButte21_1, idButte21_2, idButte21_3, idButte21_4, idPlateforme22_0, idPlateforme22_1, idPlateforme22_2, idPlateforme22_3, idButte22_0, idButte22_1, idButte22_2, idButte22_3, idPlateforme31_0, idPlateforme31_1, idPlateforme31_2, idPlateforme31_3, idPlateforme31_4, idPlateforme31_5, idPlateforme31_6, idButte31_0, idButte31_1, idButte31_2, idButte31_3, idButte31_4, idButte31_5, idButte31_6, idButte31_7, idButte31_8, idButte31_9, idPlateforme32_0, idPlateforme32_1, idPlateforme32_2, idPlateforme32_3, idPlateforme32_4, idPlateforme32_5, idPlateforme32_6, idButte32_0, idButte32_1, idButte32_2, idButte32_3, idButte32_4, idButte32_5, idButte32_6, idButte32_7, idButte32_8, idButte32_9

_global.Plateforme = function()
{
    this.mcHit._visible = false;
    if(this._parent.game.difficulty > 1 && this._name.substring(2,3) == "1")
    {
        this.remove();
    }
    this.ennemis = new Object();
    this.zonebegin;
    this.zoneend;
    var _loc2_ = this._parent.plateforme;
    var _loc3_;
    var _loc4_;
    if(this._parent.target.engine == 1)
    {
        _loc3_ = Math.floor(this._x / 640);
        _loc4_ = Math.floor((this._x + this._width) / 640);
    }
    else
    {
        _loc3_ = Math.floor(this._y / 480);
        _loc4_ = Math.floor((this._y + this._height) / 480);
    }
    this.zonebegin = _loc3_;
    this.zoneend = _loc4_;
    if(!_loc2_[_loc3_])
    {
        _loc2_[_loc3_] = {};
    }
    _loc2_[_loc3_][this._name] = this;
    var _loc5_ = _loc4_;
    while(_loc5_ > _loc3_)
    {
        if(!_loc2_[_loc5_])
        {
            _loc2_[_loc5_] = {};
        }
        _loc2_[_loc5_][this._name] = this;
        _loc5_ -= 1;
    }
};
Plateforme["extends"](MovieClip);
Object.registerClass("idPlateforme11_0",Plateforme);
Object.registerClass("idPlateforme11_1",Plateforme);
Object.registerClass("idPlateforme11_2",Plateforme);
Object.registerClass("idPlateforme11_3",Plateforme);
Object.registerClass("idButte11_0",Plateforme);
Object.registerClass("idButte11_1",Plateforme);
Object.registerClass("idButte11_2",Plateforme);
Object.registerClass("idButte11_3",Plateforme);
Object.registerClass("idPlateforme12_0",Plateforme);
Object.registerClass("idPlateforme12_1",Plateforme);
Object.registerClass("idPlateforme12_2",Plateforme);
Object.registerClass("idPlateforme12_3",Plateforme);
Object.registerClass("idButte12_0",Plateforme);
Object.registerClass("idButte12_1",Plateforme);
Object.registerClass("idButte12_2",Plateforme);
Object.registerClass("idButte12_3",Plateforme);
Object.registerClass("idPlateforme21_0",Plateforme);
Object.registerClass("idPlateforme21_1",Plateforme);
Object.registerClass("idPlateforme21_2",Plateforme);
Object.registerClass("idPlateforme21_3",Plateforme);
Object.registerClass("idButte21_0",Plateforme);
Object.registerClass("idButte21_1",Plateforme);
Object.registerClass("idButte21_2",Plateforme);
Object.registerClass("idButte21_3",Plateforme);
Object.registerClass("idButte21_4",Plateforme);
Object.registerClass("idPlateforme22_0",Plateforme);
Object.registerClass("idPlateforme22_1",Plateforme);
Object.registerClass("idPlateforme22_2",Plateforme);
Object.registerClass("idPlateforme22_3",Plateforme);
Object.registerClass("idButte22_0",Plateforme);
Object.registerClass("idButte22_1",Plateforme);
Object.registerClass("idButte22_2",Plateforme);
Object.registerClass("idButte22_3",Plateforme);
Object.registerClass("idPlateforme31_0",Plateforme);
Object.registerClass("idPlateforme31_1",Plateforme);
Object.registerClass("idPlateforme31_2",Plateforme);
Object.registerClass("idPlateforme31_3",Plateforme);
Object.registerClass("idPlateforme31_4",Plateforme);
Object.registerClass("idPlateforme31_5",Plateforme);
Object.registerClass("idPlateforme31_6",Plateforme);
Object.registerClass("idButte31_0",Plateforme);
Object.registerClass("idButte31_1",Plateforme);
Object.registerClass("idButte31_2",Plateforme);
Object.registerClass("idButte31_3",Plateforme);
Object.registerClass("idButte31_4",Plateforme);
Object.registerClass("idButte31_5",Plateforme);
Object.registerClass("idButte31_6",Plateforme);
Object.registerClass("idButte31_7",Plateforme);
Object.registerClass("idButte31_8",Plateforme);
Object.registerClass("idButte31_9",Plateforme);
Object.registerClass("idPlateforme32_0",Plateforme);
Object.registerClass("idPlateforme32_1",Plateforme);
Object.registerClass("idPlateforme32_2",Plateforme);
Object.registerClass("idPlateforme32_3",Plateforme);
Object.registerClass("idPlateforme32_4",Plateforme);
Object.registerClass("idPlateforme32_5",Plateforme);
Object.registerClass("idPlateforme32_6",Plateforme);
Object.registerClass("idButte32_0",Plateforme);
Object.registerClass("idButte32_1",Plateforme);
Object.registerClass("idButte32_2",Plateforme);
Object.registerClass("idButte32_3",Plateforme);
Object.registerClass("idButte32_4",Plateforme);
Object.registerClass("idButte32_5",Plateforme);
Object.registerClass("idButte32_6",Plateforme);
Object.registerClass("idButte32_7",Plateforme);
Object.registerClass("idButte32_8",Plateforme);
Object.registerClass("idButte32_9",Plateforme);
PlateForme.prototype.callMega = function()
{
    lennemis = this.ennemis;
    for(var _loc2_ in lennemis)
    {
        lennemis[_loc2_].beginsearch();
    }
};
PlateForme.prototype.stopMega = function()
{
    lennemis = this.ennemis;
    for(var _loc2_ in lennemis)
    {
        lennemis[_loc2_].stopsearch();
    }
};
PlateForme.prototype.addEnnemi = function(pEnnemi)
{
    this.ennemis[pEnnemi] = pEnnemi;
};
PlateForme.prototype.deleteEnnemi = function(pEnnemi)
{
    delete this.ennemis[pEnnemi];
};

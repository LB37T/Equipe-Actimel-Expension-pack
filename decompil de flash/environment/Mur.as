/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idBloc11_0, idBloc11_1, idBloc11_2, idBloc11_3, idBloc12_0, idBloc12_1, idBloc12_2, idBloc12_3, idBloc21_0, idBloc21_1, idBloc21_2, idBloc22_0, idBloc22_1, idBloc22_2, idBloc22_3, idBloc24_boss, idBloc31_0, idBloc31_1, idBloc31_2, idBloc31_3, idBloc31_4, idBloc32_0, idBloc32_1, idBloc32_2, idBloc32_3, idBloc32_4, idBloc34_boss

_global.Mur = function()
{
    this.mcHit._visible = false;
    var _loc2_ = this._parent.wall;
    this.ennemis = new Object();
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
Mur["extends"](MovieClip);
Object.registerClass("idBloc11_0",Mur);
Object.registerClass("idBloc11_1",Mur);
Object.registerClass("idBloc11_2",Mur);
Object.registerClass("idBloc11_3",Mur);
Object.registerClass("idBloc12_0",Mur);
Object.registerClass("idBloc12_1",Mur);
Object.registerClass("idBloc12_2",Mur);
Object.registerClass("idBloc12_3",Mur);
Object.registerClass("idBloc21_0",Mur);
Object.registerClass("idBloc21_1",Mur);
Object.registerClass("idBloc21_2",Mur);
Object.registerClass("idBloc22_0",Mur);
Object.registerClass("idBloc22_1",Mur);
Object.registerClass("idBloc22_2",Mur);
Object.registerClass("idBloc22_3",Mur);
Object.registerClass("idBloc24_boss",Mur);
Object.registerClass("idBloc31_0",Mur);
Object.registerClass("idBloc31_1",Mur);
Object.registerClass("idBloc31_2",Mur);
Object.registerClass("idBloc31_3",Mur);
Object.registerClass("idBloc31_4",Mur);
Object.registerClass("idBloc32_0",Mur);
Object.registerClass("idBloc32_1",Mur);
Object.registerClass("idBloc32_2",Mur);
Object.registerClass("idBloc32_3",Mur);
Object.registerClass("idBloc32_4",Mur);
Object.registerClass("idBloc34_boss",Mur);
Mur.prototype.callMega = function()
{
    lennemis = this.ennemis;
    for(var _loc2_ in lennemis)
    {
        lennemis[_loc2_].beginsearch();
    }
};
Mur.prototype.stopMega = function()
{
    lennemis = this.ennemis;
    for(var _loc2_ in lennemis)
    {
        lennemis[_loc2_].stopsearch();
    }
};
Mur.prototype.addEnnemi = function(pEnnemi)
{
    this.ennemis[pEnnemi] = pEnnemi;
};
Mur.prototype.deleteEnnemi = function(pEnnemi)
{
    delete this.ennemis[pEnnemi];
};

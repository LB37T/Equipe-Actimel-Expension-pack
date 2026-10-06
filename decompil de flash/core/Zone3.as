/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idZone13, idZone23, idZone33

_global.Zone3 = function()
{
    this.debNum = this.num;
    this.enabled = true;
    if(this.num == 0)
    {
        this.createZone();
    }
};
Zone3["extends"](MovieClip);
Object.registerClass("idZone13",Zone3);
Object.registerClass("idZone23",Zone3);
Object.registerClass("idZone33",Zone3);
Zone3.scrollingMax = 20;
Zone3.scrollingMin = 10;
Zone3.level13 = [[null,"idBloc13_9",null,"idBloc13_1",null,"idStart"],["idBloc13_8",null,"idBloc13_6","","idBloc13_3","idActimel"],[null,"idBloc13_8","idActimel",null,"idForce",null],["idBloc13_6",null,"idBloc13_9","idActimel","idBloc13_3",null],[null,null,"idBloc13_6","idBloc13_6",null,"idForce"],[null,null,"idBloc13_9","idBloc13_3","idActimel","idBloc13_6"],[null,"idBloc13_8","idPack","idBloc13_3",null,"idBloc13_3"],["idBloc13_8",null,"idBloc13_6",null,"idLettre2",null],[null,null,"idBloc13_9",null,"idBloc13_5","idBloc13_3"],["idBouclier","idBloc13_7",null,null,"idBloc13_6","idBloc13_3"],["idActimel",null,null,null,"idBloc13_6",null],["idBloc13_8",null,null,null,"idBloc13_3","idBloc13_2"],[null,null,"idBloc13_8","idBloc13_3","idForce",null],[null,"idActimel",null,"","idBloc13_6","idBloc13_5"],["idActimel","idBloc13_8",null,null,"idActimel",null],[null,"idActimel","idBloc13_9","idBloc13_6",null,"idActimel"],["idBloc13_8","idActimel",null,null,"idBloc13_2",null],[null,"idForce","idBloc13_6","idBloc13_0","idPack","idBloc13_3"],["idActimel","idBloc13_7","idLettre2",null,"idBloc13_6","idBloc13_5"],[null,null,"idBloc13_9",null,"idBouclier",null],["idBloc13_6",null,null,null,null,"idBloc13_6"],["idForce",null,null,"idBloc13_5","idBloc13_6","idBloc13_3"],["idBloc13_9",null,null,null,"idBloc13_5",null],["idBloc13_8","idActimel",null,"idBloc13_3","idPack","idBloc13_2"],["idActimel","idBloc13_6",null,null,null,null],[null,"idBloc13_8","idBloc13_7","idBloc13_5","idBloc13_3",null],["idBloc13_9",null,"idForce","idActimel","idBloc13_6",null],["idBloc13_8","idActimel",null,null,"idPack","idBloc13_2"],["idBloc13_6",null,"idBloc13_8",null,"idPack",null],[null,"idBloc13_6","idForce",null,null,"idBloc13_3"],["idBloc13_8","idActimel","idBloc13_6","idBloc13_0","",null],[null,"idLettre2",null,"idBloc13_1",null,"idBloc13_6"]];
Zone3.level23 = [[null,null,"idBloc23_9",null,"idBloc23_3","idStart"],[null,"idBloc23_9",null,null,"idActimel","idBloc23_3"],["idBloc23_9","idActimel","idForce",null,null,"idBloc23_3"],["idBloc23_9",null,"idBloc23_7",null,null,null],[null,null,"idBloc23_8","idBloc23_3","idActimel",null],[null,null,null,null,"idBloc23_3",null],["idBloc23_9","idActimel","idBloc23_9",null,null,"idBouclier"],[null,null,"idBloc23_8","idBloc23_3",null,null],[null,null,null,null,"idBloc23_3",null],["idActimel",null,"idBloc23_9","idBloc23_5",null,null],["idBloc23_8","idBloc23_9",null,"idPack",null,null],[null,"idActimel","idBloc23_9","idBloc23_3",null,null],[null,null,"idBloc23_8",null,"idBloc23_1",null],[null,null,null,"idLettre2",null,"idBloc23_3"],[null,null,"idActimel",null,"idBloc23_5",null],[null,"idBloc23_8",null,"idBloc23_1",null,null],[null,"idBloc23_7",null,null,"idBouclier",null],[null,"idBloc23_8",null,"idBloc23_1",null,"idActimel"],[null,"idBloc23_9","idActimel",null,null,"idBloc23_1"],[null,null,null,null,"idBloc23_2",null],[null,null,"idBloc23_9",null,"idBloc23_1","idActimel"],[null,null,null,null,"idBloc23_3","idPack"],[null,"idBloc23_9","idForce",null,"idBloc23_3",null],[null,"idBloc23_7",null,null,null,null],[null,null,"idBloc23_9","idBloc23_3",null,null],[null,"idBloc23_9",null,null,"idActimel",null],[null,"idActimel",null,"idBloc23_2",null,null],["idBloc23_9","idLettre2",null,null,null,"idBloc23_3"],[null,null,"idBloc23_7","idVie",null,null],[null,"idActimel",null,null,"idBloc23_3",null],[null,"idBloc23_7",null,"idBouclier",null,null],["idActimel",null,null,"idBloc23_3",null,null]];
Zone3.level33 = [[null,null,"idBloc33_9",null,null,"idStart"],[null,null,null,"idActimel",null,"idBloc33_3"],[null,"idBloc33_9",null,null,"idPack",null],[null,"idForce",null,null,"idBloc33_9",null],[null,null,null,null,null,"idBloc33_3"],[null,"idForce",null,"idBloc33_2","idActimel","idBloc33_3"],[null,null,null,null,"idActimel",null],["idBloc33_8",null,null,null,"idBouclier",null],[null,"idPack","idBloc33_9",null,null,"idBloc33_3"],[null,null,null,null,null,null],["idBloc33_9",null,null,"idForce",null,"idBloc33_3"],["idLettre2",null,"idBloc33_9",null,null,null],[null,null,null,"idBloc33_2",null,null],["idBloc33_9","idActimel",null,null,"idForce",null],[null,null,"idBloc33_8","idBloc33_3",null,null],[null,null,null,"idBouclier","idBloc33_1",null],[null,"idBloc33_8",null,null,null,null],[null,"idForce","idBloc33_7",null,null,null],[null,null,null,null,"idBloc33_2","idPack"],[null,"idBloc33_9",null,null,null,"idActimel"],[null,"idBloc33_8",null,null,"idActimel",null],[null,null,null,null,"idBloc33_3",null],[null,null,"idBloc33_7","idActimel",null,"idForce"],[null,null,null,null,"idBloc33_3","idBloc33_2"],[null,null,"idBloc33_9","idLettre2",null,null],[null,"idForce",null,null,"idBloc33_3",null],[null,"idBloc33_9",null,"idActimel",null,"idBouclier"],["idBloc33_9","idPack",null,null,null,"idForce"],[null,"idBloc33_7",null,null,null,null],[null,"idForce",null,null,"idBloc33_2",null],[null,"idBloc33_9",null,"idPack",null,null],["idActimel",null,null,"idBloc33_3","idVie",null]];
Zone3.prototype.createZone = function()
{
    var _loc2_ = this.leveldes[this.num % this.leveldes.length];
    var _loc3_ = 0;
    var _loc4_;
    while(_loc3_ < _loc2_.length)
    {
        if(this.game.completed)
        {
            _loc2_[_loc3_] = null;
        }
        else if(_loc2_[_loc3_] == "idStart" && BonusStart.help)
        {
            _loc2_[_loc3_] = null;
        }
        else if(this.game.difficulty == 3 && (_loc2_[_loc3_] == "idVie" || _loc2_[_loc3_] == "idBouclier"))
        {
            _loc2_[_loc3_] = null;
        }
        else if(this.game.difficulty == 2 && _loc2_[_loc3_] == "idVie")
        {
            _loc2_[_loc3_] = null;
        }
        if(_loc2_[_loc3_] != null)
        {
            _loc4_ = {};
            if(_loc3_ < 3)
            {
                if(_loc2_[_loc3_].substring(0,6) == "idBloc")
                {
                    _loc4_ = {_yscale:-100,_x:_loc3_ * 250};
                }
                else
                {
                    _loc4_ = {_x:_loc3_ * 250 + 30 + Math.random() * 100,_y:100 + Math.random() * 100};
                }
            }
            else if(_loc2_[_loc3_].substring(0,6) == "idBloc")
            {
                _loc4_ = {_y:440,_x:(_loc3_ - 3) * 250};
            }
            else
            {
                _loc4_ = {_x:(_loc3_ - 3) * 250 + 30 + Math.random() * 100,_y:380 - Math.random() * 100};
            }
            this.attachMovie(_loc2_[_loc3_],"mcBloc" + _loc3_,_loc3_,_loc4_);
        }
        else
        {
            this["mcBloc" + _loc3_].removeMovieClip();
        }
        _loc3_ += 1;
    }
    this.num += 2;
    this.enabled = false;
    this._parent["mcZone" + Math.abs(this.debNum - 1)].enabled = true;
};
Zone3.prototype.next = function(pThis)
{
    this = pThis;
    clearInterval(this.onTime);
    this.game.replay("next");
};

/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idPlateformeMH11_0, idPlateformeMH11_1, idPlateformeMH12_0, idPlateformeMH12_1, idPlateformeMH21_0, idPlateformeMH21_1, idPlateformeMH22_0, idPlateformeMH22_1, idPlateformeMH31_0, idPlateformeMH31_1, idPlateformeMH32_0, idPlateformeMH32_1

_global.PlateformeMove = function()
{
    this.mcHit._visible = false;
    this._visible = false;
    var _loc2_ = this._parent.plateformemove;
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
    this.posX = this._x;
    if(Math.Random < 0.5)
    {
        this.moveHor = 5;
    }
    else
    {
        this.moveHor = -5;
    }
    this.largeur = this._width * 2;
};
PlateformeMove["extends"](MovieClip);
Object.registerClass("idPlateformeMH11_0",PlateformeMove);
Object.registerClass("idPlateformeMH11_1",PlateformeMove);
Object.registerClass("idPlateformeMH12_0",PlateformeMove);
Object.registerClass("idPlateformeMH12_1",PlateformeMove);
Object.registerClass("idPlateformeMH21_0",PlateformeMove);
Object.registerClass("idPlateformeMH21_1",PlateformeMove);
Object.registerClass("idPlateformeMH22_0",PlateformeMove);
Object.registerClass("idPlateformeMH22_1",PlateformeMove);
Object.registerClass("idPlateformeMH31_0",PlateformeMove);
Object.registerClass("idPlateformeMH31_1",PlateformeMove);
Object.registerClass("idPlateformeMH32_0",PlateformeMove);
Object.registerClass("idPlateformeMH32_1",PlateformeMove);
PlateformeMove.prototype.move = function()
{
    if(this._x > this.posX + this.largeur)
    {
        this.moveHor = -5;
    }
    else if(this._x < this.posX)
    {
        this.moveHor = 5;
    }
    this._x += this.moveHor;
};
PlateFormeMove.prototype.go = function()
{
    if(!this._visible)
    {
        this._visible = true;
        this.onEnterFrame = this.move;
    }
};
PlateFormeMove.prototype.pause = function()
{
    this.onEnterFrame = null;
};
PlateFormeMove.prototype.restart = function()
{
    this.onEnterFrame = this.move;
};
PlateFormeMove.prototype.stop = function()
{
    this._visible = false;
    this.onEnterFrame = null;
};

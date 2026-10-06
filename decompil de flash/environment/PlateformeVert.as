/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idPlateformeMV11_0, idPlateformeMV11_1, idPlateformeMV12_0, idPlateformeMV12_1, idPlateformeMV21_0, idPlateformeMV21_1, idPlateformeMV22_0, idPlateformeMV22_1, idPlateformeMV31_0, idPlateformeMV31_1, idPlateformeMV32_0, idPlateformeMV32_1

_global.PlateformeVert = function()
{
    this.mcHit._visible = false;
    this._visible = false;
    var _loc2_ = this._parent.plateformevert;
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
    this.posY = this._y;
    if(this._name.substr(0,2) == "UP")
    {
        this.hauteur = -100;
        this.moveVer = -5;
        this.up = true;
    }
    else
    {
        this.moveVer = 5;
        this.hauteur = 100;
    }
};
PlateformeVert["extends"](MovieClip);
Object.registerClass("idPlateformeMV11_0",PlateformeVert);
Object.registerClass("idPlateformeMV11_1",PlateformeVert);
Object.registerClass("idPlateformeMV12_0",PlateformeVert);
Object.registerClass("idPlateformeMV12_1",PlateformeVert);
Object.registerClass("idPlateformeMV21_0",PlateformeVert);
Object.registerClass("idPlateformeMV21_1",PlateformeVert);
Object.registerClass("idPlateformeMV22_0",PlateformeVert);
Object.registerClass("idPlateformeMV22_1",PlateformeVert);
Object.registerClass("idPlateformeMV31_0",PlateformeVert);
Object.registerClass("idPlateformeMV31_1",PlateformeVert);
Object.registerClass("idPlateformeMV32_0",PlateformeVert);
Object.registerClass("idPlateformeMV32_1",PlateformeVert);
PlateformeVert.prototype.move = function()
{
    if(this.up)
    {
        if(this._y <= this.posY + this.hauteur)
        {
            this.moveVer = 5;
        }
        else if(this._y >= this.posY)
        {
            this.moveVer = -5;
        }
    }
    else if(this._y >= this.posY + this.hauteur)
    {
        this.moveVer = -5;
    }
    else if(this._y <= this.posY)
    {
        this.moveVer = 5;
    }
    this._y += this.moveVer;
};
PlateFormeVert.prototype.go = function()
{
    if(!this._visible)
    {
        this._visible = true;
        this.onEnterFrame = this.move;
    }
};
PlateFormeVert.prototype.stop = function()
{
    this._visible = false;
    this.onEnterFrame = null;
};
PlateFormeVert.prototype.pause = function()
{
    this.onEnterFrame = null;
};
PlateFormeVert.prototype.restart = function()
{
    this.onEnterFrame = this.move;
};

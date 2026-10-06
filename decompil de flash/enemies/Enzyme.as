/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idEnzyme

_global.Enzyme = function()
{
    if(this._parent.game.difficulty < 3 && this._name.substring(2,3) == "3")
    {
        this.remove();
    }
    if(this._parent.game.difficulty < 2 && this._name.substring(2,3) == "2")
    {
        this.remove();
    }
    this.notbad = true;
    this.lastcomp = null;
    this._visible = false;
    this.deplX = 1;
    this.deplY = 10;
    this.angle = 0;
    this.retourn = false;
    this.status = null;
    this._xmax = null;
    this._xmin = null;
    this.conteneur = this._parent.ennemis;
    if(this._parent.target.engine == 1)
    {
        this.initzone = this.initzone1;
    }
    else
    {
        this.initzone = this.initzone2;
    }
    this.zone = this.initzone();
    if(!this.conteneur[this.zone])
    {
        this.conteneur[this.zone] = new Object();
    }
    this.conteneur[this.zone][this._name] = this;
};
Enzyme["extends"](MovieClip);
Enzyme.prototype.move = function()
{
    this.searchZone();
    if(this._x <= this._xmin + 20)
    {
        this._x = this._xmin + 30;
        this.goToAndStop("turn");
        this.deplX = 0;
    }
    else if(this._x >= this._xmax - 20)
    {
        this._x = this._xmax - 30;
        this.goToAndStop("turn");
        this.deplX = 0;
    }
    if(this.retourn)
    {
        this._x -= this.deplX;
    }
    else
    {
        this._x += this.deplX;
    }
    this._y = this.posY + this.deplY * Math.sin(this.angle);
    this.angle += 0.2;
};
Enzyme.prototype.searchZone = function()
{
    var _loc2_ = this.initZone();
    if(_loc2_ != this.zone)
    {
        if(!this.conteneur[_loc2_])
        {
            this.conteneur[_loc2_] = new Object();
        }
        this.conteneur[_loc2_][this._name] = this;
        this.zone = _loc2_;
    }
};
Enzyme.prototype.fall = function()
{
    this._y += this._height / 2;
    lwall = this._parent.wall[this.zone];
    for(var _loc2_ in lwall)
    {
        if(lwall[_loc2_].mcHit.hitTest(this))
        {
            this.status = lwall[_loc2_];
            this.status.addEnnemi(this);
            this._y = this.status._y;
            this.PosY = this._y;
            this._xmin = this.status._x;
            this._xmax = this._xmin + this.status.mchit._width * (this.status._xscale / 100);
            this.goToAndStop("walk");
            this.onEnterFrame = this.move;
            return true;
        }
    }
    lplateforme = this._parent.plateforme[this.zone];
    for(_loc2_ in lplateforme)
    {
        if(lplateforme[_loc2_].mcHit.hitTest(this))
        {
            this.status = lplateforme[_loc2_];
            this.status.addEnnemi(this);
            this._y = this.status._y;
            this.PosY = this._y;
            this._xmin = this.status._x;
            this._xmax = this._xmin + this.status.mchit._width * (this.status._xscale / 100);
            this.goToAndStop("walk");
            this.onEnterFrame = this.move;
            return true;
        }
    }
};
Enzyme.prototype.turn = function()
{
    if(this.retourn == true)
    {
        this._xscale = 100;
        this.goToAndStop("walk");
        this.deplX = 1;
    }
    else
    {
        this._xscale = -100;
        this.goToAndStop("walk");
        this.deplX = 1;
    }
    this.retourn = !this.retourn;
};
Enzyme.prototype.onDizzy = function()
{
    if(2209 - this.timeofshoot > 5000)
    {
        this.isDizzy = false;
        this.deplX = 1;
        this.goToAndStop("walk");
        this.onEnterFrame = this.move;
    }
};
Enzyme.prototype.initzone1 = function()
{
    return Math.floor(this._x / 640);
};
Enzyme.prototype.initzone2 = function()
{
    return Math.floor(this._y / 480);
};
Enzyme.prototype.go = function()
{
    if(!this._visible)
    {
        this._visible = true;
        if(this.status == null)
        {
            this.onEnterFrame = this.fall;
        }
        else
        {
            this.isDizzy = false;
            this.deplX = 1;
            this.goToAndStop("walk");
            this.onEnterFrame = this.move;
        }
    }
};
Enzyme.prototype.stop = function()
{
    this._visible = false;
    this.onEnterFrame = null;
};
Enzyme.prototype.restart = function()
{
    if(this.lastcomp != null)
    {
        if(this.isDizzy)
        {
            this.timeofshoot = 3325;
        }
        else
        {
            this.depl = 1;
        }
        this.onEnterFrame = this.lastcomp;
        this.lastcomp = null;
    }
};
Enzyme.prototype.pause = function()
{
    this.lastComp = this.onEnterFrame;
    this.onEnterFrame = null;
};
Object.registerClass("idEnzyme",Enzyme);

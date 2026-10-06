/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idMaxibeurk

_global.MaxiBeurk = function()
{
    if(this._parent.game.difficulty < 3 && this._name.substring(2,3) == "3")
    {
        this.remove();
    }
    if(this._parent.game.difficulty < 2 && this._name.substring(2,3) == "2")
    {
        this.remove();
    }
    this._visible = false;
    this.isDizzy = false;
    this.cantouch = true;
    this.lastcomp = null;
    this.depl = 1;
    this.searchrapdity = 4;
    this.retourn = false;
    this.status = null;
    this._xmax = null;
    this._xmin = null;
    this.perso = this._parent.target;
    this._shoot = 200;
    this.delayofdizzy = 6000 / this._parent.game.difficulty;
    this.timeofshoot = null;
    this.conteneur = this._parent.ennemis;
    this.engine = this._parent.target.engine;
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
    this.deplshoot = 0;
};
MaxiBeurk["extends"](MovieClip);
Object.registerClass("idMaxibeurk",MaxiBeurk);
MaxiBeurk.prototype.searchZone = function()
{
    var _loc2_ = this.initZone();
    if(_loc2_ != this.zone)
    {
        if(!this.conteneur[_loc2_])
        {
            this.conteneur[_loc2_] = new Object();
        }
        this.conteneur[_loc2_][this._name] = this;
        delete this.conteneur[this.zone][this._name];
        this.zone = _loc2_;
    }
};
MaxiBeurk.prototype.searchBloc = function()
{
    lwall = this._parent.wall[this.zone];
    for(var _loc2_ in lwall)
    {
        if(lwall[_loc2_] != this.status && lwall[_loc2_].hitTest(this))
        {
            if(this._x > lwall[_loc2_]._x)
            {
                this._xmin = lwall[_loc2_]._x + lwall[_loc2_]._width;
            }
            else
            {
                this._xmax = lwall[_loc2_]._x;
            }
        }
    }
};
MaxiBeurk.prototype.move = function()
{
    this.searchZone();
    if(this._x <= this._xmin + 20)
    {
        this._x = this._xmin + 30;
        this.goToAndStop("turn");
        this.depl = 0;
    }
    else if(this._x >= this._xmax - 20)
    {
        this._x = this._xmax - 30;
        this.goToAndStop("turn");
        this.depl = 0;
    }
    if(this.retourn)
    {
        this._x -= this.depl;
    }
    else
    {
        this._x += this.depl;
    }
};
MaxiBeurk.prototype.search = function()
{
    this.searchZone();
    if(this._x <= this._xmin + 20)
    {
        this._x += 10;
        this.goToAndStop("turn");
        this.depl = 0;
    }
    else if(this._x >= this._xmax - 20)
    {
        this._x -= 10;
        this.goToAndStop("turn");
        this.depl = 0;
    }
    if(this._x < - this.perso.PosX - this._parent.PosX + this.perso._x + this.perso.x)
    {
        if(this._xscale < 0)
        {
            this.goToAndStop("turn");
            this.depl = 0;
        }
        this._x += this.depl * this.searchrapdity;
    }
    else
    {
        if(this._xscale > 0)
        {
            this.goToAndStop("turn");
            this.depl = 0;
        }
        this._x -= this.depl * this.searchrapdity;
    }
};
MaxiBeurk.prototype.turn = function()
{
    if(this.retourn == true)
    {
        this._xscale = 100;
        if(!this.mustsearch)
        {
            this.goToAndStop("walk");
        }
        else
        {
            this.goToAndStop("run");
        }
        this.depl = 1;
    }
    else
    {
        this._xscale = -100;
        if(!this.mustsearch)
        {
            this.goToAndStop("walk");
        }
        else
        {
            this.goToAndStop("run");
        }
        this.depl = 1;
    }
    this.retourn = !this.retourn;
};
MaxiBeurk.prototype.shoot = function(pDir)
{
    this.isDizzy = true;
    this.timeofshoot = 6434;
    this.cantouch = false;
    this.deplshoot = 0;
    if(this._x < - this.perso.PosX - this._parent.PosX + this.perso._x + this.perso.x)
    {
        this.depl = (- this._shoot) / 10;
        this._xscale = 100;
        this.retourn = false;
    }
    else
    {
        this.depl = this._shoot / 10;
        this._xscale = -100;
        this.retourn = true;
    }
    this.goToAndStop("push");
    this.onEnterFrame = this.onShoot;
};
MaxiBeurk.prototype.onShoot = function()
{
    this.searchZone();
    var _loc2_ = this.initZone();
    this._x += this.depl;
    if(this.engine == 2)
    {
        if(this._x >= 645)
        {
            this._x = this._xmax;
            this.timeofshoot = 1364;
            this.goToAndStop("dizzy");
            this.onEnterFrame = this.onDizzy;
        }
        else if(this._x <= 0)
        {
            this._x = this._xmin;
            this.timeofshoot = 5838;
            this.goToAndStop("dizzy");
            this.onEnterFrame = this.onDizzy;
        }
    }
    if(this._x > this._xmax || this._x < this._xmin)
    {
        this.cantouch = true;
        this.mustsearch = false;
        this.onEnterFrame = this.fall;
    }
    else if(this.deplshoot == 10)
    {
        this.cantouch = true;
        this.onEnterFrame = this.onDizzy;
        this.goToAndStop("dizzy");
    }
    lwall = this._parent.wall[_loc2_];
    for(var _loc3_ in lwall)
    {
        if(lwall[_loc3_].hitTest(this) && this.status != lwall[_loc3_])
        {
            if(this._x > lwall[_loc3_]._x + lwall[_loc3_]._width / 2)
            {
                this._x = this._xmin + 20;
            }
            else
            {
                this._x = this._xmax - 20;
            }
            this.cantouch = false;
            this.timeofshoot = 8909;
            this.goToAndStop("dizzy");
            this.onEnterFrame = this.onDizzy;
        }
    }
    for(_loc3_ in this.status.ennemis)
    {
        if(this.hitTest(this.status.ennemis[_loc3_]) && this.status.ennemis[_loc3_].cantouch && this != this.status.ennemis[_loc3_] && this.status.ennemis[_loc3_].ennemicoll != this)
        {
            this.ennemicoll = this.status.ennemis[_loc3_];
            this.cantouch = false;
            this.onEnterFrame = this.onDizzy;
            this.goToAndStop("dizzy");
            this.status.ennemis[_loc3_].shoot(1);
        }
    }
    lpieges = this._parent.trapennemis[_loc2_];
    for(_loc3_ in lpieges)
    {
        if(lpieges[_loc3_].hitTest(this))
        {
            this.onEnterFrame = null;
            this.cantouch = false;
            this._parent.game.soundMaxiKill.start();
            this._parent.game.soundGlouton.start();
            lpieges[_loc3_].timeofeat = 2917;
            lpieges[_loc3_].gotoAndStop("enabled");
            lpieges[_loc3_].onEnterFrame = lpieges[_loc3_].eatMaxib;
            this._xscale = 100;
            this.goToAndStop("gloutiz");
        }
    }
    this.deplshoot++;
};
MaxiBeurk.prototype.fall = function()
{
    this._y += this._height;
    if((this.perso.engine == 1 || this._parent.game.level == 34) && this._y > 480)
    {
        this._parent.game.soundMaxiKill.start();
        this.onKill();
    }
    var _loc2_ = this.initZone();
    lpieges = this._parent.trapennemis[_loc2_];
    for(var _loc3_ in lpieges)
    {
        if(lpieges[_loc3_].hitTest(this))
        {
            this.onEnterFrame = null;
            this.cantouch = false;
            this._parent.game.soundGlouton.start();
            this._parent.game.soundMaxiKill.start();
            lpieges[_loc3_].timeofeat = 6218;
            lpieges[_loc3_].gotoAndStop("enabled");
            lpieges[_loc3_].onEnterFrame = lpieges[_loc3_].eatMaxib;
            this._xscale = 100;
            this.goToAndStop("gloutiz");
        }
    }
    lwall = this._parent.wall[_loc2_];
    for(_loc3_ in lwall)
    {
        if(lwall[_loc3_].mcHit.hitTest(this) && this.status != lwall[_loc3_])
        {
            this.status.deleteEnnemi(this);
            this.status = lwall[_loc3_];
            this.status.addEnnemi(this);
            this._y = this.status._y;
            this.searchZone();
            this._xmin = this.status._x;
            this._xmax = this._xmin + this.status.mchit._width * (this.status._xscale / 100);
            this.goToAndStop("dizzy");
            this.firstframe = true;
            this.onEnterFrame = this.onDizzy;
            this.firstplf();
            return true;
        }
        if(this.firstframe && lwall[_loc3_].hitTest(this) && this.status != lwall[_loc3_])
        {
            this._y = this.status._y;
            this.firstframe = true;
            if(this._x > lwall[_loc3_]._x + lwall[_loc3_]._width / 2)
            {
                this._x = this._xmin;
            }
            else
            {
                this._x = this._xmax;
            }
            this.cantouch = false;
            this.timeofshoot = 4269;
            this.goToAndStop("dizzy");
            this.firstframe = true;
            this.onEnterFrame = this.onDizzy;
            this.firstplf();
            return true;
        }
        this.firstframe = false;
    }
    lplateforme = this._parent.plateforme[_loc2_];
    for(_loc3_ in lplateforme)
    {
        if(lplateforme[_loc3_].mcHit.hitTest(this) && this.status != lplateforme[_loc3_])
        {
            this.status.deleteEnnemi(this);
            this.status = lplateforme[_loc3_];
            this.status.addEnnemi(this);
            this._y = this.status._y;
            this.searchZone();
            this._xmin = this.status._x;
            this._xmax = this._xmin + this.status.mchit._width * (this.status._xscale / 100);
            this.goToAndStop("dizzy");
            this.firstframe = true;
            this.onEnterFrame = this.onDizzy;
            this.firstplf();
            return true;
        }
    }
};
MaxiBeurk.prototype.onKill = function()
{
    this._parent.game.MaxiBeurk++;
    this.onEnterFrame = null;
    this.remove();
};
MaxiBeurk.prototype.firstplf = function()
{
    this.goToAndStop("walk");
    this.onEnterFrame = this.move;
    this.firstplf = null;
};
MaxiBeurk.prototype.onDizzy = function()
{
    if(8361 - this.timeofshoot > 1000)
    {
        this.cantouch = true;
    }
    if(2787 - this.timeofshoot > this.delayofdizzy)
    {
        this.isDizzy = false;
        this.depl = 1;
        if(!this.mustsearch)
        {
            this.goToAndStop("walk");
            this.onEnterFrame = this.move;
        }
        else
        {
            this.goToAndStop("run");
            this.onEnterFrame = this.search;
        }
    }
};
Maxibeurk.prototype.initzone1 = function()
{
    return Math.floor(this._x / 640);
};
Maxibeurk.prototype.initzone2 = function()
{
    return Math.floor(this._y / 480);
};
MaxiBeurk.prototype.beginsearch = function()
{
    this.mustsearch = true;
    if(!this.isDizzy)
    {
        this.goToAndStop("run");
        this.onEnterFrame = this.search;
    }
};
MaxiBeurk.prototype.stopsearch = function()
{
    this.mustsearch = false;
    if(!this.isDizzy)
    {
        this.depl = 1;
        this.goToAndStop("walk");
        this.onEnterFrame = this.move;
    }
};
MaxiBeurk.prototype.go = function()
{
    if(!this._visible)
    {
        this._visible = true;
        this.goToAndStop("walk");
        if(this.status == null)
        {
            this.onEnterFrame = this.fall;
        }
        else
        {
            this.onEnterFrame = this.move;
        }
    }
};
MaxiBeurk.prototype.restart = function()
{
    if(this.lastcomp != null)
    {
        if(this.isDizzy)
        {
            this.timeofshoot = 7490;
        }
        else
        {
            this.depl = 1;
        }
        this.onEnterFrame = this.lastcomp;
        this.lastcomp = null;
    }
};
MaxiBeurk.prototype.pause = function()
{
    this.lastComp = this.onEnterFrame;
    this.onEnterFrame = null;
};
MaxiBeurk.prototype.stop = function()
{
    this._visible = false;
    this.onEnterFrame = null;
};
MaxiBeurk.prototype.moveWithWall = function()
{
    if(!this.status.mcPlat.hitTest(this._x,this._y))
    {
        this.retourn = !this.retourn;
    }
    else
    {
        for(var _loc2_ in this.status.lesmurs)
        {
            if(this.hitTest(this.status.lesmurs[_loc2_]))
            {
                this.retourn = !this.retourn;
            }
        }
    }
    this.retourn != true ? this._x++ : this._x--;
    if(this == _level0.instance11)
    {
        benchOut();
    }
};
MaxiBeurk.prototype.timeOfUntouch = function()
{
    if(9390 - this.timeofshoot > 2000)
    {
        this.mort = true;
        this.untouch = false;
        this.onEnterFrame = this.stop;
    }
};

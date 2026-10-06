/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idMaxibeurkVol, idTirMaxi

_global.MaxibeurkVol = function()
{
    this.direction = 1;
    this.amplitudeMax = 80;
    if(_root.mcPerso.game.level == 33)
    {
        this.fireTime = 1457;
        this.fireTempo = Math.floor(Math.random() * 3000);
    }
    else
    {
        this.shoot = null;
    }
    this.onEnterFrame = this.move;
};
MaxibeurkVol["extends"](MovieClip);
Object.registerClass("idMaxibeurkVol",MaxibeurkVol);
MaxibeurkVol.prototype.move = function()
{
    this.shoot();
    if(Math.abs(this.rotation) > this.amplitude)
    {
        this.direction = - this.direction;
        this.amplitude += this.amplitude <= this.amplitudeMax ? this.stability : 0;
    }
    this.rotation += this.rotate * this.direction;
    this._x -= this.speed * Math.cos(3.141592653589793 * this.rotation / 180);
    this._y -= this.speed * Math.sin(3.141592653589793 * this.rotation / 180);
    if(this.hitTest(_root.mcPerso) && !this.shooted)
    {
        _root.mcPerso.hurt();
    }
    if(this._x < -200)
    {
        if(_root.mcPerso.game.level == 33 && !this.back)
        {
            this.shoot = false;
            this.back = true;
            this.speed = (- this.speed) * 1.5;
            this._xscale = - this._xscale;
            this.amplitude /= 2;
        }
        else if(_root.mcPerso.game.level != 33)
        {
            delete _root.mcPerso.ennemis[this._name];
            this.remove();
        }
    }
    if(_root.mcPerso.force <= 0 || Game.completed || this.back && this._x > 680)
    {
        delete _root.mcPerso.ennemis[this._name];
        this.remove();
    }
};
MaxibeurkVol.prototype.shoot = function()
{
    if(6086 - this.fireTime > this.fireTempo)
    {
        this.fireTime = 1989;
        this.shoot = null;
        _root.attachMovie("idtirMaxi",this._name + "Tir",_root.getMaxDepth(),{_x:this._x,_y:this._y});
    }
};
MaxiBeurkVolTir = function()
{
    this.tir = 15 + Math.floor(Math.random() * 5);
    this.onEnterFrame = this.move;
};
MaxibeurkVolTir["extends"](MovieClip);
Object.registerClass("idTirMaxi",MaxibeurkVolTir);
MaxibeurkVolTir.prototype.move = function()
{
    this._x -= this.tir;
    if(this._x < 0)
    {
        this.remove();
    }
    if(this.hitTest(_root.mcPerso))
    {
        _root.mcPerso.hurt();
        this.remove();
    }
};
if(!_global.$extendLib)
{
    Button.prototype.remove = function()
    {
        if(this.getDepth() < 0)
        {
            _root.swapDepths.call(this,1048575);
        }
        _root.removeMovieClip.call(this);
    };
    ASSetPropFlags(Button.prototype,"remove",1);
    Button.prototype.swapDepths = function(pDepth)
    {
        _root.swapDepths.call(this,pDepth);
    };
    ASSetPropFlags(Button.prototype,"swapDepths",1);
    Function.prototype["extends"] = function(pSuperclass)
    {
        this.prototype.__proto__ = pSuperclass.prototype;
        this.prototype.__constructor__ = pSuperclass;
        ASSetPropFlags(this.prototype,"__constructor__",1);
    };
    MovieClip.prototype.getMaxDepth = function(pMax)
    {
        if(!pMax)
        {
            pMax = 0;
        }
        for(_loc3_ in this)
        {
            if(typeof this[_loc3_] == "movieclip" || this[_loc3_] instanceof TextField || this[_loc3_] instanceof Button || this[_loc3_] instanceof Video)
            {
                return pMax <= this[_loc3_].getDepth() + 1 ? this[_loc3_].getDepth() + 1 : pMax;
            }
        }
        return undefined;
    };
    ASSetPropFlags(MovieClip.prototype,"getMaxDepth",1);
    MovieClip.prototype.getMinDepth = function(pMin)
    {
        var _loc3_ = 1.7976931348623157e+308;
        if(!pMin)
        {
            pMin = 0;
        }
        for(var _loc4_ in this)
        {
            if(typeof this[_loc4_] == "movieclip" || this[_loc4_] instanceof TextField || this[_loc4_] instanceof Button || this[_loc4_] instanceof Video)
            {
                if(this[_loc4_].getDepth() < pMin)
                {
                }
                _loc3_ -= this[_loc4_].getDepth();
                if(_loc3_ > 1)
                {
                    lDepth = this[_loc4_].getDepth();
                }
                _loc3_ = this[_loc4_].getDepth();
            }
        }
        return lDepth <= -16384 ? undefined : lDepth + 1;
    };
    ASSetPropFlags(MovieClip.prototype,"getMinDepth",1);
    MovieClip.prototype.remove = function()
    {
        if(this.getDepth() < 0)
        {
            this.swapDepths(1048575);
        }
        this.removeMovieClip();
    };
    ASSetPropFlags(MovieClip.prototype,"remove",1);
    TextField.prototype.remove = function()
    {
        if(this.getDepth() < 0)
        {
            _root.swapDepths.call(this,1048575);
        }
        this.removeTextField();
    };
    ASSetPropFlags(TextField.prototype,"remove",1);
    TextField.prototype.swapDepths = function(pDepth)
    {
        _root.swapDepths.call(this,pDepth);
    };
    ASSetPropFlags(TextField.prototype,"swapDepths",1);
    TextFormat.prototype.getTextExtent2 = TextFormat.prototype.getTextExtent;
    TextFormat.prototype.getTextExtent = function(text)
    {
        var _loc3_ = this.getTextExtent2(text);
        if(getVersion().substr(0,3) == "MAC")
        {
            _loc3_.height = Math.floor(_loc3_.height / 20);
            _loc3_.width = Math.floor(_loc3_.width / 20);
        }
        return _loc3_;
    };
    ASSetPropFlags(TextFormat.prototype,"getTextExtent2,getTextExtent",1);
    Video.prototype.remove = function()
    {
        if(_root.getDepth.call(this) < 0)
        {
            _root.swapDepths.call(this,1048575);
        }
        _root.removeMovieClip.call(this);
    };
    ASSetPropFlags(Video.prototype,"remove",1);
    Video.prototype.swapDepths = function(pDepth)
    {
        _root.swapDepths.call(this,pDepth);
    };
    ASSetPropFlags(Video.prototype,"swapDepths",1);
    _global.$extendLib = true;
}

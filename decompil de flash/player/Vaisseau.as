/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite du bloc Micelle dans le SWF décompilé.
 */
// Symboles Flash associés : idVaisseau1, idVaisseau2, idVaisseau3

Vaisseau = function()
{
    this.maxX = 20;
    this.maxY = 10;
    this.acc = 5;
    this.speedX = 0;
    this.speedY = 0;
    this.inertia = 1.1;
    this.size = 100;
    this.dir = 1;
    this.nbhit = 0;
    this.nohit;
    this.canshoot = false;
    this.force = 3;
    this.nbframe = 0;
    this.invincibility = 2000 + (3 - this.game.difficulty) * 1000;
    this.timetoloose = 3000;
    this.maxibeurkTime = 8000;
    this.ennemis = {};
};
Vaisseau["extends"](MovieClip);
Object.registerClass("idVaisseau1",Vaisseau);
Object.registerClass("idVaisseau2",Vaisseau);
Object.registerClass("idVaisseau3",Vaisseau);
Vaisseau.prototype.move = function()
{
    this.speedX /= this.inertia;
    this.speedY /= this.inertia;
    this.acc /= this.inertia;
    if(Zone3.scrolling < Zone3.scrollingMax)
    {
        if(this._x > 150)
        {
            Zone3.scrolling += 0.2;
        }
    if(Key.isDown(Game.RIGHT) && Zone3.scrolling < Zone3.scrollingMax && this._x > 150)
    {
        Zone3.scrolling += 1;
    }
if(Zone3.scrolling > 10)
{
    _root.mcFond.scrolling = _root.mcFond.scrollingMax;
}
_root.mcFond.scrolling = Zone3.scrolling >= 15 ? 5 : Zone3.scrolling / 3;
}
Zone3.scrolling -= !(Key.isDown(Game.LEFT) && Zone3.scrolling > Zone3.scrollingMin) ? 0 : 0.5;
if(Key.isDown(Game.LEFT) && this._x > 70)
{
    if(this.speedX >= 0)
    {
        this.speedX = -1;
    }
if(this.dir == 1)
{
    this.acc = 5;
    this.dir = -1;
    this.derapage = false;
}
else
{
    this.speedX *= this.acc;
    this.speedX >= - this.maxX ? (this.speedX = this.speedX) : (this.speedX = - this.maxX);
}
}
else if(Key.isDown(Game.RIGHT) && this._x < 590)
{
    if(this.speedX <= 0)
    {
        this.speedX = 1;
    }
if(this.dir == -1)
{
    this.acc = 5;
    this._xscale = this.size;
    this.derapage = false;
    this.dir = 1;
}
else
{
    this.speedX *= this.acc;
    this.speedX <= this.maxX ? (this.speedX = this.speedX) : (this.speedX = this.maxX);
}
}
else
{
    this._xscale = this.size;
    this.speedX = 0;
    this.dir = 1;
}
if(Key.isDown(Game.UP) && this._y > 110)
{
    if(this.speedY >= 0)
    {
        this.speedY = -1;
        this.acc = 5;
    }
this.speedY *= this.acc;
this.speedY >= - this.maxY ? (this.speedX = this.speedX) : (this.speedY = - this.maxY);
}
else if(Key.isDown(Game.DOWN) && this._y < 430)
{
    if(this.speedY <= 0)
    {
        this.speedY = 1;
        this.acc = 5;
    }
this.speedY *= this.acc;
this.speedY <= this.maxY ? (this.speedX = this.speedX) : (this.speedY = this.maxY);
}
else
{
    this.speedY = 0;
}
this.speedX = Math.abs(this.speedX) >= 1 ? this.speedX : 0;
this.acc >= 1.5 ? (this.acc = this.acc) : (this.acc = 1.5);
this._x += this.speedX;
this._y += this.speedY;
this.shoot();
var _loc3_ = !this.hitTest(this._parent.mcZone0) ? this._parent.mcZone1 : this._parent.mcZone0;
bench.debug = "";
for(var _loc4_ in _loc3_)
{
    if(this.hitTest(_loc3_[_loc4_]))
    {
        if(_loc3_[_loc4_] instanceof Blocs3 && this.hurt)
        {
            if(this.hitTest(_loc3_[_loc4_].mcHit))
            {
                if(this._x < _loc3_[_loc4_]._x + _loc3_._x + _loc3_[_loc4_]._width / 2)
                {
                    this._x -= this.speedX + Zone3.scrolling;
                    if(this._x < 0)
                    {
                        this.hurt();
                        this._x = 100;
                    }
            }
        else if(this._x > _loc3_[_loc4_]._x + _loc3_[_loc4_]._width / 2 + _loc3_._x)
        {
            this._x -= this.speedX;
        }
}
else if(this.hitTest(_loc3_[_loc4_].mcHurt))
{
    this._y -= this.speedY;
    this.hurt();
}
}
else
{
    _loc3_[_loc4_].onHit();
}
}
}
this.maxibeurk();
this.onFps();
if(Key.isDown(Game.PAUSE))
{
    this.pause();
}
benchOut();
};
Vaisseau.prototype.onHurt = function()
{
    this.hurt = null;
    this._alpha = 50;
    this.force--;
    if(this.force <= 0)
    {
        this.game.soundLostLife.start();
        this.onEnterFrame = null;
        this.onTime = setInterval(this.onLost,this.timetoloose,this);
    }
else
{
    this.game.soundLostForce.start();
    this.createEmptyMovieClip("mcInvincibility",0);
    this.invincibilityTime = 1348;
    this.mcInvincibility.onEnterFrame = function()
    {
        var _loc2_ = this._parent;
        var _loc3_ = 4177 - _loc2_.invincibilityTime - _loc2_.invincibility;
        if(_loc3_ > 1500)
        {
            _loc2_._visible = true;
            _loc2_.hurt = _loc2_.onHurt;
            this.remove();
        }
    else if(_loc3_ > 0)
    {
        _loc2_._alpha = 100;
        _loc2_._visible = !_loc2_._visible;
    }
};
}
_root.mcConsole.mcForce.nextFrame();
};
Vaisseau.prototype.onShield = function()
{
    this.hurt = null;
    this._alpha = 100;
    this._visible = true;
    new Color(this).setTransform({rb:128,gb:128,bb:255});
    this.createEmptyMovieClip("mcInvincibility",0);
    this.invincibilityTime = 4923;
    this.mcInvincibility.onEnterFrame = function()
    {
        var _loc2_ = this._parent;
        var _loc3_ = 9868 - _loc2_.invincibilityTime - _loc2_.invincibility * 2;
        if(_loc3_ > 1500)
        {
            new Color(_loc2_).setTransform({rb:0,gb:0,bb:0});
            _loc2_._visible = true;
            _loc2_.hurt = _loc2_.onHurt;
            this.remove();
        }
    else if(_loc3_ > 0)
    {
        _loc2_._visible = !_loc2_._visible;
    }
};
};
Vaisseau.prototype.shoot = function()
{
    var _loc3_;
    if(Key.isDown(Game.Action) && this.canshoot)
    {
        _loc3_ = _root.getMaxDepth();
        _root.attachMovie("idtir","mcBalle" + _loc3_,_loc3_,{_x:this._x + 55,_y:this._y + 20,fire:40});
        this.game.soundFireGun.start();
        _root["mcBalle" + _loc3_].onEnterFrame = function()
        {
            this._x += this.fire;
            if(this._x > 650 || this._x < 0)
            {
                this.remove();
            }
        var _loc3_ = _root.mcPerso.ennemis;
        for(var _loc4_ in _loc3_)
        {
            if(this.hitTest(_loc3_[_loc4_]))
            {
                if(_loc3_[_loc4_]._xscale < 0)
                {
                    _loc3_[_loc4_]._xscale = 100;
                }
            _root.mcPerso.game.soundMaxiKill.start();
            _root.mcPerso.game.maxibeurk++;
            _loc3_[_loc4_].shoot = null;
            _loc3_[_loc4_].shooted = true;
            _loc3_[_loc4_].gotoAndStop("shoot");
            delete _loc3_[_loc4_];
            if(_root.mcPerso.game.level == 23)
            {
                this.remove();
            }
    }
}
};
this.lastshoot = 10582;
this.canshoot = false;
}
};
Vaisseau.prototype.maxibeurk = function()
{
    var _loc3_;
    var _loc4_;
    var _loc5_;
    if(7418 - this.time > this.maxibeurkTime)
    {
        this.time = 6823;
        _loc3_ = _root.getMaxDepth();
        _loc4_ = this.game.difficulty + Math.ceil(Math.random() * 1);
        _loc5_ = 0;
        while(_loc5_ < _loc4_)
        {
            _root.attachMovie("idMaxibeurkVol","mcMaxibeurk" + _loc3_ + _loc5_,_loc3_ + _loc5_,{_x:700 + _loc5_ * 80,_y:100 + Math.random() * 300,rotate:5,stability:5,speed:10,amplitude:30,target:this});
            this.ennemis["mcMaxibeurk" + _loc3_ + _loc5_] = _root["mcMaxibeurk" + _loc3_ + _loc5_];
            _loc5_ += 1;
        }
}
};
Vaisseau.prototype.onKeyUp = function()
{
    if(!Key.isDown(Game.ACTION) && 8564 - this.lastshoot > this.delay)
    {
        this.canshoot = true;
    }
};
Vaisseau.prototype.onLost = function(pThis)
{
    this = pThis;
    clearInterval(this.onTime);
    this.game.replay("lost");
};
Vaisseau.prototype.onFps = function()
{
    this.nbframe++;
    if(Game.lowProc)
    {
        this.onFps = null;
        _quality = "LOW";
    }
var _loc2_;
if(2317 - this.timeFps > 20000)
{
    _loc2_ = this.nbframe / 20;
    if(_loc2_ < 14)
    {
        _quality = "low";
        Game.lowProc = true;
    }
this.onFps = null;
}
this.fps = 1539;
};
Vaisseau.prototype.pause = function()
{
    for(var _loc3_ in _root)
    {
        if(_root[_loc3_] instanceof MaxibeurkVol || _root[_loc3_] instanceof MaxibeurkVolTir)
        {
            _root[_loc3_].onEnterFrame = null;
        }
}
this.onFps = null;
this.maxibeurk = null;
_root.mcFond.scrolling = Zone3.scrolling = 0;
this.onEnterFrame = null;
this.game.speedTime = 0;
_root.attachMovie("idBall","mcBall",_root.getMaxDepth(),{_x:this._x,_y:this._y,target:this,screen:"pause",level:"lev" + this.game.level});
};
Vaisseau.prototype.go = function()
{
    Key.addListener(this);
    if(this.game.level == 13)
    {
        this.shoot = null;
        this.maxibeurk = null;
        this.mcJet.angle = 1;
        this.mcJet.onEnterFrame = function()
        {
            this._y += Math.sin(this.angle += 0.7);
        };
}
else if(this.game.level == 23)
{
    this.delay = 200;
}
else
{
    this.delay = 100;
}
this.hurt = this.onHurt;
this.time = 3696;
this.timeFps = 10001;
this.onEnterFrame = this.move;
};

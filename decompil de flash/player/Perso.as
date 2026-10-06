/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */
// Symboles Flash associés : idActiman

_global.Perso = function()
{
    this.maxX = 10;
    this.maxY = 6;
    this.acc = 5;
    this.speedX = 0;
    this.speedY = 0;
    this.easeX = 1;
    this.easeY = 1.02;
    this.changeX = 1;
    this.jumpSpeed = 6;
    this.inertia = 1.15;
    this.fallMax = 100;
    this.size = 100;
    this.timeatloose = null;
    this.timetoloose = 3000;
    this.hurt = this.onHurt;
    this.ontouchstatus = null;
    this.status = null;
    this.current_zone = null;
    this.lastpiege = null;
    this.speedFall = 0.5;
    this.dir = 1;
    this.nohit;
    this.canjump = true;
    this.oldmoveHor = null;
    this.frameafterpause = null;
    this.canshoot = true;
    this.delay = 500;
    this.munitions = 0;
    this.maxmunition;
    this.derapage = false;
    this.onPiege = false;
    this.posX = this._x;
    this.posY = this._y;
    this.deltaX = 200;
    this.scrollingX = false;
    this.scrollingX = false;
    this.deltaY = 50;
    this.fallY = 0;
    this.force = 3;
    this.canrigth = true;
    this.canleft = true;
    this.mcPied._visible = false;
    this.mcCol._visible = false;
};
Perso["extends"](MovieClip);
Object.registerClass("idActiman",Perso);
Perso.prototype.move = function()
{
    this.fallY = 0;
    var _loc2_ = this.initZone();
    this.sens = this._xscale;
    this.speedX /= 1.4;
    if(this.speedX != 0)
    {
        this.acc /= this.inertia;
    }
    if(this.acc < 1.7)
    {
        this.acc = 1.7;
    }
    this.CollWallMove(_loc2_);
    this.CollPiegeMove(_loc2_);
    if(!this.testPolio())
    {
        if(Key.isDown(Game.LEFT) && this.canleft)
        {
            if(this.speedX == 0)
            {
                this.speedX = -1 * this.acc;
                if(this._xscale == 100)
                {
                    this.speedX = -1;
                    this._xscale = -100;
                    this.dir = -1;
                }
                if(!this.onPiege)
                {
                    this.gotoAndStop("run");
                }
            }
            else if(this.dir == 1 && this.canrigth)
            {
                this.speedX /= 1.5;
                this.derapage = true;
                if(this.speedX < 1)
                {
                    this.acc = 5;
                    this._xscale = - this.size;
                    this.dir = -1;
                    this.derapage = false;
                    this.gotoAndStop("run");
                }
                else
                {
                    this.gotoAndStop("slide");
                }
            }
            else
            {
                if(!this.canrigth)
                {
                    this._xscale = - this.size;
                }
                this.speedX *= this.acc;
                this.speedX >= - this.maxX ? (this.speedX = this.speedX) : (this.speedX = - this.maxX);
                if(!this.onPiege)
                {
                    this.gotoAndStop("run");
                }
            }
        }
        else if(Key.isDown(Game.RIGHT) && this.canrigth)
        {
            if(this.speedX == 0)
            {
                this.speedX = 1 * this.acc;
                if(this._xscale == -100)
                {
                    this.speedX = 1;
                    this._xscale = 100;
                    this.dir = 1;
                }
                if(!this.onPiege)
                {
                    this.gotoAndStop("run");
                }
            }
            else if(this.dir == -1 && this.canleft)
            {
                this.speedX /= 1.5;
                this.derapage = true;
                if(this.speedX > -1)
                {
                    this.acc = 5;
                    this._xscale = this.size;
                    this.derapage = false;
                    this.dir = 1;
                    this.gotoAndStop("run");
                }
                else
                {
                    this.gotoAndStop("slide");
                }
            }
            else
            {
                if(!this.canleft)
                {
                    this._xscale = this.size;
                }
                this.speedX *= this.acc;
                this.speedX <= this.maxX ? (this.speedX = this.speedX) : (this.speedX = this.maxX);
                if(!this.onPiege)
                {
                    this.gotoAndStop("run");
                }
            }
        }
    }
    if(!this.status.mcHit.hitTest(this.mcPied))
    {
        this.gotoAndStop("jump");
        this.onEnterFrame = this.fall;
    }
    if(Math.abs(this.speedX) < 1)
    {
        this.speedX = 0;
        this.acc = 5;
        if(this.derapage == true)
        {
            this._xscale = - this._xscale;
            this.derapage = false;
            this.dir = - this.dir;
        }
        if(!this.onPiege)
        {
            this.gotoAndStop("pause");
        }
    }
    if(Key.isDown(Game.UP))
    {
        if(this.canjump)
        {
            this.gotoAndStop("jump");
            this.speedX *= 1.5;
            this.speedY = this.maxY;
            this.onEnterFrame = this.jump;
            this.canjump = false;
        }
    }
    else
    {
        this.canjump = true;
    }
    if(Key.isDown(Game.Action) && this.canshoot && this.munitions > 0)
    {
        this.shoot();
        return true;
    }
    if(3478 - this.lastshoot > this.delay && !Key.isDown(Game.Action))
    {
        this.canshoot = true;
    }
    this.CollEnnemiMove();
    this.CollBossMove();
    this.scrollY();
    this.scrollMove();
    this.scrollYUp();
    if(Key.isDown(Game.PAUSE))
    {
        this.pause();
    }
    this.CollBonus(_loc2_);
    this.onPopup();
    this.onBossLost();
};
Perso.prototype.moveonPfMove = function()
{
    var _loc2_ = false;
    if(this.oldMovHor != this.status.moveHor)
    {
        if(this.oldMovHor != null)
        {
            _loc2_ = true;
        }
        this.oldMovHor = this.status.moveHor;
    }
    this.fallY = 0;
    this.speedX = 0;
    var _loc3_ = this.initZone();
    this.sens = this._xscale;
    this.speedX /= this.inertia;
    this.acc /= this.inertia;
    this.CollBossMove();
    if(Key.isDown(Game.LEFT))
    {
        if(this.speedX == 0)
        {
            this.speedX = -1;
        }
        if(this.dir == 1)
        {
            this.speedX /= this.acc;
            this._xscale = - this.size;
            this.dir = -1;
        }
        else
        {
            this.speedX = - this.maxX;
            this.gotoAndStop("run");
        }
    }
    else if(Key.isDown(Game.RIGHT))
    {
        if(this.speedX == 0)
        {
            this.speedX = 1;
        }
        if(this.dir == -1)
        {
            this.dir = 1;
            this.speedX /= this.acc;
            this._xscale = this.size;
        }
        else
        {
            this.speedX = this.maxX;
            this.gotoAndStop("run");
        }
    }
    this.testPolio();
    if(Key.isDown(Game.Action) && this.canshoot && this.munitions > 0)
    {
        this.shoot();
    }
    else if(8142 - this.lastshoot > this.delay && !Key.isDown(Game.Action))
    {
        this.canshoot = true;
    }
    if(!this.status.mcHit.hitTest(this.mcPied))
    {
        this.gotoAndStop("jump");
        this.onEnterFrame = this.fall;
    }
    if(Math.abs(this.speedX) < 1)
    {
        this.speedX = this.status.moveHor;
        this.gotoAndStop("pause");
    }
    if(this.acc < 1.5)
    {
        this.acc = 1.5;
    }
    if(!this.status.mcHit.hitTest(this.mcPied))
    {
        this.gotoAndStop("jump");
        this.oldMoveHor = null;
        this.onEnterFrame = this.fall;
    }
    this.scrollY();
    this.scrollYUp();
    if(this.engine == 1)
    {
        if(_loc2_)
        {
            this.x += this.status.moveHor;
            this._x += this.status.moveHor;
            this.target.move();
        }
        else
        {
            this.scrollMove();
        }
    }
    else
    {
        this.scrollMove();
    }
    if(Key.isDown(Game.UP))
    {
        if(this.canjump)
        {
            this.gotoAndStop("jump");
            this.speedX *= 1.5;
            this.speedY = this.maxY;
            this.onEnterFrame = this.jump;
        }
        this.canjump = false;
    }
    else
    {
        this.canjump = true;
    }
    if(Key.isDown(Game.PAUSE))
    {
        this.pause();
    }
    this.CollBonus(_loc3_);
    this.onPopup();
};
Perso.prototype.moveonPfVert = function()
{
    this.fallY = 0;
    var _loc2_ = this.initZone();
    this.sens = this._xscale;
    this.speedX /= 1.4;
    if(this.speedX != 0)
    {
        this.acc /= this.inertia;
    }
    if(this.acc < 1.7)
    {
        this.acc = 1.7;
    }
    this.CollBossMove();
    if(Key.isDown(Game.LEFT))
    {
        if(this.speedX == 0)
        {
            this.speedX = -1;
        }
        if(this.dir == 1)
        {
            this.speedX /= 1.5;
            this.derapage = true;
            if(this.speedX < 1)
            {
                this.acc = 5;
                this._xscale = - this.size;
                this.dir = -1;
                this.canleft = true;
                this.derapage = false;
                this.gotoAndStop("run");
            }
            else
            {
                this.gotoAndStop("slide");
            }
        }
        else
        {
            this._xscale = - this.size;
            this.speedX *= this.acc;
            this.speedX >= - this.maxX ? (this.speedX = this.speedX) : (this.speedX = - this.maxX);
            this.gotoAndStop("run");
        }
    }
    else if(Key.isDown(Game.RIGHT))
    {
        if(this.speedX == 0)
        {
            this.speedX = 1;
        }
        if(this.dir == -1)
        {
            this.speedX /= 1.5;
            this.derapage = true;
            if(this.speedX > -1)
            {
                this.acc = 5;
                this._xscale = this.size;
                this.canrigth = false;
                this.derapage = false;
                this.dir = 1;
                this.gotoAndStop("run");
            }
            else
            {
                this.gotoAndStop("slide");
            }
        }
        else
        {
            this._xscale = this.size;
            this.speedX *= this.acc;
            this.speedX <= this.maxX ? (this.speedX = this.speedX) : (this.speedX = this.maxX);
            this.gotoAndStop("run");
        }
    }
    this.testPolio();
    if(Math.abs(this.speedX) < 1)
    {
        this.speedX = 0;
        this.acc = 5;
        if(this.derapage == true)
        {
            this._xscale = - this._xscale;
            this.derapage = false;
            this.dir = - this.dir;
        }
        this.gotoAndStop("pause");
    }
    if(Key.isDown(Game.Action) && this.canshoot && this.munitions > 0)
    {
        this.shoot();
    }
    else if(7209 - this.lastshoot > this.delay && !Key.isDown(Game.Action))
    {
        this.canshoot = true;
    }
    this.scrollY();
    this.scrollMove();
    this.scrollYUp();
    if(this.engine == 2)
    {
        this.y += this.status.moveVer;
        this.target.move();
    }
    this._y = - this.y + this.posY + this.target.posY + this.status._y;
    if(!this.status.mcHit.hitTest(this.mcPied))
    {
        this.gotoAndStop("jump");
        this.onEnterFrame = this.fall;
    }
    if(Key.isDown(Game.UP))
    {
        if(this.canjump)
        {
            this.gotoAndStop("jump");
            this.speedX *= 1.5;
            this.speedY = this.maxY;
            this.onEnterFrame = this.jump;
            this.canjump = false;
        }
    }
    else
    {
        this.canjump = true;
    }
    if(Key.isDown(Game.PAUSE))
    {
        this.pause();
    }
    this.CollBonus(_loc2_);
    this.onPopup();
};
Perso.prototype.onTouch = function()
{
    this.fallY = 0;
    var _loc2_ = this.initZone();
    this.speedX /= this.inertia;
    this.CollWallMove(_loc2_);
    if(Math.abs(this.speedX) < 4)
    {
        this.gotoAndStop("pause");
    }
    if(Math.abs(this.speedX) < 1)
    {
        this.speedX = - this.speedX;
        this.onEnterFrame = this.move;
    }
    this.scrollMove();
    this.scrollY();
    if(!this.status.mcHit.hitTest(this.mcPied))
    {
        this.ontouchstatus = this.status;
        this.onEnterFrame = this.fall;
    }
    if(Key.isDown(Game.PAUSE))
    {
        this.pause();
    }
    if(!Key.isDown(Game.UP))
    {
        this.canjump = true;
    }
};
Perso.prototype.jump = function()
{
    if(Math.abs(this.speedX) > this.maxX)
    {
        this.speedX = this.maxX * this.dir;
    }
    var _loc2_ = this.initZone();
    this._y -= this.speedY * this.jumpSpeed;
    this.speedY -= this.easeY;
    this.speedX /= this.easeX;
    if(Key.isDown(Game.LEFT))
    {
        this._xscale = - this.size;
        this.dir = -1;
        if(this.speedX > 0)
        {
            this.speedX = -1;
        }
        else
        {
            if(this.speedX == 0)
            {
                this.speedX = -1;
            }
            this.speedX *= this.acc;
            this.speedX >= - this.maxX ? (this.speedX = this.speedX) : (this.speedX = - this.maxX);
        }
    }
    else if(Key.isDown(Game.RIGHT))
    {
        this._xscale = this.size;
        this.dir = 1;
        if(this.speedX < 0)
        {
            this.speedX = 1;
        }
        else
        {
            if(this.speedX == 0)
            {
                this.speedX = 1;
            }
            this.speedX *= this.acc;
            this.speedX <= this.maxX ? (this.speedX = this.speedX) : (this.speedX = this.maxX);
        }
    }
    if(!Key.isDown(Game.UP))
    {
        this.canjump = true;
        this.speedY -= this.easeY;
        this.speedX /= this.easeX;
    }
    this.CollWallJump(_loc2_);
    if(this.speedY < 1)
    {
        this.speedY = 1;
        this.onEnterFrame = this.fall;
    }
    this.scrollMove();
    this.scrollJump();
    this.CollBonus(_loc2_);
    this.CollBossJump();
};
Perso.prototype.onMicelle = function()
{
    var _loc2_ = this.initZone();
    this._x += (5 + Math.abs(this.speedX)) * Math.sin(this.angle);
    this._y -= 10;
    this.speedX /= 1.08;
    if(this.y + this._y - this.target.posY - this.posY < 0)
    {
        this.speedY = 0;
        this.speedX = 0;
    }
    if(this.CollWallJump(_loc2_))
    {
        this.game.soundMicelle.start();
    }
    this._y += this.speedY;
    this.y -= this.speedY;
    this.target.move();
    this.angle += 0.5;
    if(this.speedY < 1)
    {
        this.speedY = 1;
        this.fallY = 0;
        this.goToAndStop("jump");
        this.onEnterFrame = this.fall;
    }
    if(!Key.isDown(Game.UP))
    {
        this.canjump = true;
    }
};
Perso.prototype.fall = function()
{
    var _loc2_ = this.initZone();
    this.speedX /= this.easeX;
    this.mcPied._height = this.speedY * this.jumpSpeed;
    this.mcCol._height = this.speedY * this.jumpSpeed;
    if(!Key.isDown(Game.UP))
    {
        this.canjump = true;
    }
    if(Key.isDown(Game.LEFT))
    {
        this._xscale = - this.size;
        this.dir = -1;
        if(this.speedX > 0)
        {
            this.speedX = -1;
        }
        else
        {
            this.speedX != 0 ? (this.speedX = this.speedX) : (this.speedX = -1);
            this.speedX *= this.acc;
            this.speedX >= - this.maxX ? (this.speedX = this.speedX) : (this.speedX = - this.maxX);
        }
    }
    else if(Key.isDown(Game.RIGHT))
    {
        this._xscale = this.size;
        this.dir = 1;
        if(this.speedX < 0)
        {
            this.speedX = 1;
        }
        else
        {
            this.speedX != 0 ? (this.speedX = this.speedX) : (this.speedX = 1);
            this.speedX *= this.acc;
            if(this.speedX > this.maxX)
            {
                this.speedX = this.maxX;
            }
        }
    }
    this.CollPlFormeFall(_loc2_);
    this.CollPlFormeTrampFall(_loc2_);
    this.CollPlFormeMoveFall(_loc2_);
    this.CollPlFormeVertFall(_loc2_);
    this.CollWallFall(_loc2_);
    this.CollEnnemiFall(_loc2_);
    this.CollBossFall();
    this.scrollMove();
    this.scrollFall();
    this.CollBonus(_loc2_);
    this.speedY = this.speedY <= this.fallMax ? this.speedY + this.easeY : this.fallMax;
};
Perso.prototype.onHurt = function()
{
    this.hurt = null;
    this._alpha = 50;
    this.force--;
    this.gotoAndStop("perd");
    if(this.force <= 0)
    {
        this.game.speedTime = 0;
        this.game.soundLostLife.start();
        this.timeatloose = 5422;
        this.posYloose = this._y;
        this.onEnterFrame = this.lostUp;
    }
    else
    {
        if(this.onTouch != null)
        {
            this.onEnterFrame = this.onTouch;
        }
        this.game.soundLostForce.start();
        this.createEmptyMovieClip("mcInvincibility",0);
        this.invincibilityTime = 10618;
        this.mcInvincibility.onEnterFrame = function()
        {
            var _loc2_ = this._parent;
            var _loc3_ = 10155 - _loc2_.invincibilityTime - _loc2_.invincibility;
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
Perso.prototype.onShield = function()
{
    this.hurt = null;
    this._alpha = 100;
    this._visible = true;
    new Color(this).setTransform({rb:128,gb:128,bb:255});
    this.createEmptyMovieClip("mcInvincibility",0);
    this.invincibilityTime = 10949;
    this.mcInvincibility.onEnterFrame = function()
    {
        var _loc2_ = this._parent;
        var _loc3_ = 8531 - _loc2_.invincibilityTime - _loc2_.invincibility * 4;
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
Perso.prototype.lostUp = function()
{
    if(this._y > this.posYloose - this._height)
    {
        this._y -= 15;
    }
    else
    {
        this.onEnterFrame = this.lostDown;
    }
};
Perso.prototype.lostDown = function()
{
    this._y += 10;
    if(10346 - this.timeatloose > this.timetoloose)
    {
        this.onEnterFrame = null;
        this.game.replay("lost");
    }
};
Perso.prototype.testloose = function()
{
    if(this.timeatloose != null)
    {
        this.onEnterFrame = null;
        this._visible = true;
        this.invincibility = false;
        this.posYloose = this._y;
        this.onEnterFrame = this.lostUp;
        this.gotoAndStop("perd");
    }
};
Perso.prototype.CollBonus = function(pZone)
{
    var _loc3_ = this.target.bonus[pZone];
    for(var _loc4_ in _loc3_)
    {
        if(_loc3_[_loc4_].hitTest(this))
        {
            _loc3_[_loc4_].onHit();
        }
    }
};
Perso.prototype.CollWallMove = function(pZone)
{
    var _loc3_ = false;
    var _loc4_ = this.target.wall[pZone];
    var _loc5_ = null;
    for(var _loc6_ in _loc4_)
    {
        if(_loc4_[_loc6_] != this.status && _loc4_[_loc6_].hitTest(this._x,this._y))
        {
            _loc5_ = _loc4_[_loc6_];
            _loc3_ = true;
            this.acc = 5;
            this.speedX = 0;
            if(_loc5_._x + _loc5_._width / 2 + this.posX + this.target.posX - this.x < this._x)
            {
                this.canleft = false;
            }
            else
            {
                this.canrigth = false;
            }
        }
    }
    if(!_loc3_)
    {
        this.canleft = true;
        this.canrigth = true;
    }
    else
    {
        this.canshoot = false;
    }
};
Perso.prototype.CollPiegeMove = function(pZone)
{
    var _loc3_ = false;
    var _loc4_ = this.target.trap[pZone];
    for(var _loc5_ in _loc4_)
    {
        if(_loc4_[_loc5_].hitTest(this._x,this._y))
        {
            _loc4_[_loc5_].onHit();
            if(this.lastpiege != _loc4_[_loc5_])
            {
                this.lastpiege.onExit();
                this.lastpiege = _loc4_[_loc5_];
            }
            this.acc = 1.5;
            this.speedX = this.dir * Math.floor(Math.abs(this.speedX) / 1.5);
            _loc3_ = true;
            ltouched = true;
        }
    }
    this.onPiege = _loc3_;
    if(!_loc3_)
    {
        if(this.lastpiege != null)
        {
            this.lastpiege.onExit();
            this.lastpiege = null;
        }
    }
    else
    {
        this.gotoAndStop("turbo");
    }
};
Perso.prototype.CollBossMove = function()
{
    if(this.hitTest(this.target.mcBoss.mcHurt) && this.target.mcBoss.hurt && this.hurt != null)
    {
        this.hurt();
    }
};
Perso.prototype.CollMaxiBeurkMove = function()
{
    var _loc2_ = this.status.ennemis;
    for(_loc3_ in _loc2_)
    {
        if(this.hitTest(_loc2_[_loc3_]) && !_loc2_[_loc3_].isDizzy && this.hurt != null)
        {
            if(_loc2_[_loc3_]._x + this.posX + this.target.posX - this.x < this._x)
            {
                this.speedX = this.maxX;
            }
            else
            {
                this.speedX = - this.maxX;
            }
            if(this.speedX * this._xscale > 0)
            {
                this._xscale = - this._xscale;
                this.dir = - this.dir;
            }
            this.hurt();
            return true;
        }
    }
};
Perso.prototype.CollEnzymeMove = function()
{
    var _loc2_ = this.status.ennemis;
    if(this.hurt != null)
    {
        for(_loc3_ in _loc2_)
        {
            if(this.hitTest(_loc2_[_loc3_]) && !_loc2_[_loc3_].isDizzy)
            {
                if(_loc2_[_loc3_]._x + this.posX + this.target.posX - this.x <= this._x)
                {
                    this.speedX = this.maxX;
                    this._x = _loc2_[_loc3_]._x + this.posX + this.target.posX - this.x + 20;
                }
                else
                {
                    this.speedX = - this.maxX;
                    this._x = _loc2_[_loc3_]._x + this.posX + this.target.posX - this.x - 20;
                }
                if(this.speedX * this._xscale > 0)
                {
                    this._xscale = - this._xscale;
                    this.dir = - this.dir;
                }
                this.gotoAndStop("perd");
                if(_loc2_[_loc3_].piege)
                {
                    this.hurt();
                    this.game.soundMarais.start();
                }
                else
                {
                    this.onEnterFrame = this.onTouch;
                }
                return true;
            }
        }
    }
};
Perso.prototype.CollWallJump = function(pZone)
{
    var _loc3_ = this.target.wall[pZone];
    for(var _loc4_ in _loc3_)
    {
        if(this.hitTest(_loc3_[_loc4_]))
        {
            if(_loc3_[_loc4_].hitTest(this._x,this._y - this._height))
            {
                this.speedY = 0;
                this.speedX = 0;
                return true;
            }
        }
    }
};
Perso.prototype.CollBossJump = function()
{
    if(this.hitTest(this.target.mcBoss.mcHurt) && this.target.mcBoss.hurt)
    {
        this.hurt();
    }
};
Perso.prototype.CollEnnemisJump = function(pZone)
{
};
Perso.prototype.CollWallFall = function(pZone)
{
    var _loc3_ = this.target.wall[pZone];
    var _loc4_;
    for(var _loc5_ in _loc3_)
    {
        if(this.mcPied.hitTest(_loc3_[_loc5_].mcHit) && _loc3_[_loc5_] != this.ontouchstatus)
        {
            this.ontouchstatus = null;
            this.mcPied._height = 0;
            this.mcCol._height = 0;
            this.acc = 5;
            this.speedX *= this.speedFall;
            this.speedX != 0 ? this.speedX : 1;
            if(this.speedX * this._xscale < 0)
            {
                this.speedX = 0;
                this.dir = - this.dir;
            }
            this._y = - this.y + this.posY + this.target.posY + lWall[_loc5_]._y;
            if(this.status != lWall[_loc5_])
            {
                this.status.stopMega();
                this.status = lWall[_loc5_];
                this.status.callMega();
            }
            this.status = _loc3_[_loc5_];
            this.speedY = 0;
            this.onEnterFrame = this.move;
            this.gotoAndStop("run");
            return true;
        }
        if(this.hitTest(_loc3_[_loc5_]))
        {
            _loc4_ = _loc3_[_loc5_];
            if(_loc4_._x + _loc4_._width / 2 + this.posX + this.target.posX - this.x < this._x && this.speedX <= 0)
            {
                this.speedX = 0;
            }
            else if(_loc4_._x + _loc4_._width / 2 + this.posX + this.target.posX - this.x > this._x && this.speedX >= 0)
            {
                this.speedX = 0;
            }
        }
    }
};
Perso.prototype.CollPlFormeFall = function(pZone)
{
    var _loc3_ = this.target.plateforme[pZone];
    for(_loc4_ in _loc3_)
    {
        if(this.mcPied.hitTest(_loc3_[_loc4_].mcHit) && _loc3_[_loc4_] != this.ontouchstatus)
        {
            this.ontouchstatus = null;
            this.speedX *= this.speedFall;
            this.mcPied._height = 0;
            this.mcCol._height = 0;
            this.acc = 5;
            this._y = - this.y + this.posY + this.target.posY + lPlateforme[_loc4_]._y;
            if(this.status != _loc3_[_loc4_])
            {
                this.status.stopMega();
                this.status = _loc3_[_loc4_];
                this.status.callMega();
            }
            this.speedX != 0 ? this.speedX : 1;
            if(this.speedX * this._xscale < 0)
            {
                this.speedX = 0;
                this.dir = - this.dir;
            }
            this.speedY = 0;
            this.onEnterFrame = this.move;
            this.gotoAndStop("run");
            return true;
        }
    }
};
Perso.prototype.CollPlFormeTrampFall = function(pZone)
{
    var _loc3_ = this.target.plateformetramp[pZone];
    for(var _loc4_ in _loc3_)
    {
        if(this.mcPied.hitTest(_loc3_[_loc4_].mcHit))
        {
            if(this.speedX == 0)
            {
                this.speedX = 1;
            }
            if(this.speedX * this._xscale < 0)
            {
                this.speedX = 0;
                this.dir = - this.dir;
            }
            this.fallY = 0;
            _loc3_[_loc4_].elastic();
            this._y = - this.y + this.posY + this.target.posY + _loc3_[_loc4_]._y - 50;
            this.mcPied._height = 0;
            this.mcCol._height = 0;
            this.speedX = 2 * this.speedX;
            this.gotoAndStop("jump");
            this.speedY = 1.1 * this.maxY;
            this.onEnterFrame = this.jump;
            return true;
        }
    }
};
Perso.prototype.CollPlFormeMoveFall = function(pZone)
{
    var _loc3_ = this.target.plateformemove[pZone];
    for(var _loc4_ in _loc3_)
    {
        if(this.mcPied.hitTest(_loc3_[_loc4_].mcHit))
        {
            this.mcPied._height = 0;
            this.mcCol._height = 0;
            this._y = - this.y + this.posY + this.target.posY + _loc3_[_loc4_]._y;
            if(this.status != lplateforme[_loc4_])
            {
                this.status.stopMega();
                this.status = _loc3_[_loc4_];
            }
            this.speedX != 0 ? this.speedX : 1;
            if(this.speedX * this._xscale < 0)
            {
                this.speedX = 0;
                this.dir = - this.dir;
            }
            this.speedY = 0;
            this.onEnterFrame = this.moveonPfmove;
            this.gotoAndStop("run");
            return true;
        }
    }
};
Perso.prototype.CollPlFormeVertFall = function(pZone)
{
    var _loc3_ = this.target.plateformevert[pZone];
    for(var _loc4_ in _loc3_)
    {
        if(this.mcPied.hitTest(_loc3_[_loc4_].mcHit))
        {
            this.speedX *= this.speedFall;
            this.mcPied._height = 0;
            this.mcCol._height = 0;
            this._y = - this.y + this.posY + this.target.posY + _loc3_[_loc4_]._y;
            if(this.status != _loc3_[_loc4_])
            {
                this.status.stopMega();
                this.status = _loc3_[_loc4_];
            }
            this.speedX != 0 ? this.speedX : 1;
            if(this.speedX * this._xscale < 0)
            {
                this.speedX = 0;
                this.dir = - this.dir;
            }
            this.speedY = 0;
            this.onEnterFrame = this.moveonPfvert;
            this.gotoAndStop("run");
            return true;
        }
    }
};
Perso.prototype.CollEnnemiFall = function(pZone)
{
    var _loc3_;
    if(this._xscale * this.dir > 0)
    {
        _loc3_ = this.target.ennemis[pZone];
        for(_loc4_ in _loc3_)
        {
            if(this.mcCol.hitTest(_loc3_[_loc4_]) && _loc3_[_loc4_].piege != true)
            {
                if(!_loc3_[_loc4_].isDizzy)
                {
                    this.game.soundDizzy.start();
                    _loc3_[_loc4_].isdizzy = true;
                    _loc3_[_loc4_].timeofshoot = 7582;
                    _loc3_[_loc4_].cantouch = false;
                    _loc3_[_loc4_].gotoAndStop("dizzy");
                    _loc3_[_loc4_].onEnterFrame = _loc3_[_loc4_].onDizzy;
                    this.mcPied._height = 0;
                    this.mcCol._height = 0;
                    this.gotoAndStop("jump");
                    this.speedY = this.maxY / 1.5;
                    this.onEnterFrame = this.jump;
                }
                else if(_loc3_[_loc4_].cantouch)
                {
                    _loc3_[_loc4_].shoot(this.dir);
                    this.gotoAndStop("jump");
                    this.speedY = this.maxY / 2;
                    this.onEnterFrame = this.jump;
                }
                return true;
            }
        }
    }
};
Perso.prototype.CollEnzymeJump = function(pZone)
{
    var _loc3_;
    if(this.speedX * this.dir > 0)
    {
        _loc3_ = this.target.ennemis[pZone];
        for(var _loc4_ in _loc3_)
        {
            if(this.hitTest(_loc3_[_loc4_]) && !_loc3_[_loc4_].isDizzy)
            {
                this.speedX = (- this.dir) * this.maxX / 2;
            }
        }
    }
};
Perso.prototype.CollBossFall = function()
{
    if(this.mccol.hitTest(this.target.mcBoss.mcHit) && this.target.mcBoss.hurt)
    {
        this.target.mcBoss.hurt();
        this.gotoAndStop("jump");
        this.speedY = this.maxY;
        this.onEnterFrame = this.jump;
        this.canjump = false;
    }
    else if(this.hitTest(this.target.mcBoss.mcHurt) && this.target.mcBoss.hurt)
    {
        this.hurt();
    }
};
Perso.prototype.scrollXMove = function()
{
    if(this.scrollingX)
    {
        this.x += this.speedX;
        this.target.move();
        this.scrollX();
        if(this._xscale != this.sens)
        {
            this.scrollingX = false;
            this.scrollX = null;
        }
    }
    else
    {
        this._x += this.speedX;
        if(Math.abs(this._x - this.posX) > this.deltaX)
        {
            this.scrollingX = true;
            this.scrollX = this.onScrollingX;
        }
        else
        {
            this.scrollingX = false;
            this.scrollX = null;
        }
    }
};
Perso.prototype.scrollYMove = function()
{
    this._x += this.speedX;
    if(this._x < 10)
    {
        this._x = 10;
        this.speedX = 0;
    }
    else if(this._x > 630)
    {
        this._x = 630;
        this.speedX = 0;
    }
    this.target.move();
};
Perso.prototype.scrollXFall = function()
{
    this._y += this.speedY * this.jumpSpeed;
    this.target.move();
    if(this._y > 650 && !this.onTime && !this.game.completed)
    {
        this.fall = null;
        this.game.speedTime = 0;
        this.game.soundLostLife.start();
        this.onTime = setInterval(this.onFall,this.timetoloose,this);
    }
};
Perso.prototype.scrollYJump = function()
{
    if(this._y < 100)
    {
        this._y += this.speedY * 6;
        this.y -= this.speedY * 6;
        this.target.move();
    }
};
Perso.prototype.scrollYFall = function()
{
    if((this.fallY += this.speedY) > this.deltaY)
    {
        this.scrollingY = false;
    }
    if(this.scrollingY)
    {
        this.y += this.speedY * this.jumpSpeed;
        this.target.move();
        this.scrollY();
    }
    else
    {
        this._y += this.speedY * this.jumpSpeed;
        if(this._y > 400)
        {
            this.scrollingY = true;
            this.scrollY = this.onScrollingY;
        }
        else
        {
            this.scrollingY = false;
            this.scrollY = null;
        }
    }
    if(this._y > 640 && !this.onTime && !this.game.completed)
    {
        this._visible = false;
        this.game.soundLostLife.start();
        clearInterval(this.intervalmicelle);
        this.scrollingY = false;
        this.scrollYFall = null;
        this.onScrollingY = null;
        this.scrollY = null;
        this.game.soundLostLife.start();
        this.CollBonus = null;
        this.move = null;
        this.hurt = null;
        this.onTime = setInterval(this.onFall,this.timetoloose,this);
    }
};
Perso.prototype.onFall = function(pThis)
{
    this = pThis;
    clearInterval(this.onTime);
    this.game.replay("lost");
};
Perso.prototype.onScrollingX = function()
{
    if(this.speedX * this._xscale > 0)
    {
        if(this._x - this.posX > - this.deltaX + 10 && this._xscale > 0 || this._x - this.posX < this.deltaX - 10 && this._xscale < 0)
        {
            if(Math.abs(this.speedX) < 3)
            {
                lMove = this.speedX * 3;
            }
            else if(this.speedX < 0)
            {
                lMove = -9;
            }
            else if(this.speedX > 0)
            {
                lMove = 9;
            }
            this._x -= lMove;
            this.x += lMove;
            this.target.move();
        }
        else
        {
            this.scrollingX = false;
            this.scrollX = null;
        }
    }
};
Perso.prototype.onScrollingY = function()
{
    if(this._y > 150)
    {
        if(this.speedY > 2)
        {
            this.y += this.speedY * 10;
            this._y -= this.speedY * 10;
        }
        else
        {
            this.y += 20;
            this._y -= 20;
        }
        this.target.move();
    }
    else
    {
        this.scrollingY = false;
        this.scrollY = null;
    }
};
Perso.prototype.onScrollingYUp = function()
{
    if(this._y < 100)
    {
        this.y -= 20;
        this._y += 20;
        this.target.move();
    }
};
Perso.prototype.initZone1 = function()
{
    var _loc2_ = Math.floor((this._x + this.x - this.posX - this.target.posX) / 640);
    if(_loc2_ != this.current_zone)
    {
        this.current_zone = _loc2_;
        lennemis = this.target.ennemis[_loc2_ - 2];
        for(var _loc3_ in lennemis)
        {
            lennemis[_loc3_].stop();
        }
        lplatevert = this.target.plateformevert[_loc2_ - 2];
        for(_loc3_ in lplatevert)
        {
            lplatevert[_loc3_].stop();
        }
        lplatemove = this.target.plateformemove[_loc2_ - 2];
        for(_loc3_ in lplatemove)
        {
            lplatemove[_loc3_].stop();
        }
        lennemis = this.target.ennemis[_loc2_ + 2];
        for(_loc3_ in lennemis)
        {
            lennemis[_loc3_].stop();
        }
        lplatevert = this.target.plateformevert[_loc2_ + 2];
        for(_loc3_ in lplatevert)
        {
            lplatevert[_loc3_].stop();
        }
        lplatemove = this.target.plateformemove[_loc2_ + 2];
        for(_loc3_ in lplatemove)
        {
            lplatemove[_loc3_].stop();
        }
        lennemis = this.target.ennemis[_loc2_ + 1];
        for(_loc3_ in lennemis)
        {
            lennemis[_loc3_].go();
        }
        lplatevert = this.target.plateformevert[_loc2_ + 1];
        for(_loc3_ in lplatevert)
        {
            lplatevert[_loc3_].go();
        }
        lplatemove = this.target.plateformemove[_loc2_ + 1];
        for(_loc3_ in lplatemove)
        {
            lplatemove[_loc3_].go();
        }
        lennemis = this.target.ennemis[_loc2_ - 1];
        for(_loc3_ in lennemis)
        {
            lennemis[_loc3_].go();
        }
        lplatevert = this.target.plateformevert[_loc2_ - 1];
        for(_loc3_ in lplatevert)
        {
            lplatevert[_loc3_].go();
        }
        lplatemove = this.target.plateformemove[_loc2_ - 1];
        for(_loc3_ in lplatemove)
        {
            lplatemove[_loc3_].go();
        }
    }
    return _loc2_;
};
Perso.prototype.initZone2 = function()
{
    var _loc2_ = Math.floor((this._y + this.y - this.posY - this.target.posY) / 480);
    if(_loc2_ != this.current_zone)
    {
        if(_loc2_ == 1)
        {
            this.startMicelle();
        }
        this.current_zone = _loc2_;
        lennemis = this.target.ennemis[_loc2_ - 2];
        for(var _loc3_ in lennemis)
        {
            lennemis[_loc3_].stop();
        }
        lplatevert = this.target.plateformevert[_loc2_ - 2];
        for(_loc3_ in lplatevert)
        {
            lplatevert[_loc3_].stop();
        }
        lplatemove = this.target.plateformemove[_loc2_ - 2];
        for(_loc3_ in lplatemove)
        {
            lplatemove[_loc3_].stop();
        }
        lennemis = this.target.ennemis[_loc2_ + 2];
        for(_loc3_ in lennemis)
        {
            lennemis[_loc3_].stop();
        }
        lplatevert = this.target.plateformevert[_loc2_ + 2];
        for(_loc3_ in lplatevert)
        {
            lplatevert[_loc3_].stop();
        }
        lplatemove = this.target.plateformemove[_loc2_ + 2];
        for(_loc3_ in lplatemove)
        {
            lplatemove[_loc3_].stop();
        }
        lennemis = this.target.ennemis[_loc2_ + 1];
        for(_loc3_ in lennemis)
        {
            lennemis[_loc3_].go();
        }
        lplatevert = this.target.plateformevert[_loc2_ + 1];
        for(_loc3_ in lplatevert)
        {
            lplatevert[_loc3_].go();
        }
        lplatemove = this.target.plateformemove[_loc2_ + 1];
        for(_loc3_ in lplatemove)
        {
            lplatemove[_loc3_].go();
        }
        lennemis = this.target.ennemis[_loc2_ - 1];
        for(_loc3_ in lennemis)
        {
            lennemis[_loc3_].go();
        }
        lplatevert = this.target.plateformevert[_loc2_ - 1];
        for(_loc3_ in lplatevert)
        {
            lplatevert[_loc3_].go();
        }
        lplatemove = this.target.plateformemove[_loc2_ - 1];
        for(_loc3_ in lplatemove)
        {
            lplatemove[_loc3_].go();
        }
    }
    return _loc2_;
};
Perso.prototype.shootWithGunHor = function()
{
    Arme.nbproject++;
    this.munitions -= 1;
    _root.mcConsole.weapon = this.munitions;
    this.target.attachMovie("idtir","balle" + Arme.nbproject,Arme.nbproject);
    this.game.soundFireGun.start();
    this.target["balle" + Arme.nbproject]._x = - this.target.PosX + this.x + this._x - this.posX + this.dir * this._width / 2;
    this.target["balle" + Arme.nbproject]._y = this.y + this._y - this.target.posY - this.posY - this._height / 2;
    this.target["balle" + Arme.nbproject]._xscale = this._xscale;
    this.target["balle" + Arme.nbproject].go(1,this._xscale / 100);
    this.lastshoot = 6505;
    this.canshoot = false;
    this.gotoAndStop("gun");
    if(this.speedX == 0)
    {
        this.speedX = this.dir * this.maxX / 2;
    }
    this.nextentframe = this.onEnterFrame;
    this.onEnterFrame = this.fire;
};
Perso.prototype.shootWithGunVert = function()
{
    Arme.nbproject++;
    this.munitions -= 1;
    _root.mcConsole.weapon = this.munitions;
    this.target.attachMovie("idtir","balle" + Arme.nbproject,Arme.nbproject);
    this.game.soundFireGun.start();
    this.target["balle" + Arme.nbproject]._x = - this.target.PosX + this.x + this._x - this.posX + this.dir * this._width / 2;
    this.target["balle" + Arme.nbproject]._y = this.y + this._y - this.target.posY - this.posY - this._height / 2;
    this.target["balle" + Arme.nbproject]._xscale = this._xscale;
    this.target["balle" + Arme.nbproject].go(2,this._xscale / 100);
    this.lastshoot = 3538;
    this.canshoot = false;
    this.gotoAndStop("gun");
    if(this.speedX == 0)
    {
        this.speedX = this.dir * this.maxX / 2;
    }
    this.nextentframe = this.onEnterFrame;
    this.onEnterFrame = this.fire;
};
Perso.prototype.shootWithRepHor = function()
{
    Arme.nbproject++;
    this.munitions -= 1;
    _root.mcConsole.weapon = this.munitions;
    this.target.attachMovie("idFlash","rep" + Arme.nbproject,Arme.nbproject);
    this.game.soundFireFlash.start();
    this.target["rep" + Arme.nbproject]._x = - this.target.PosX + this.x + this._x - this.posX + this.dir * this._width / 2;
    this.target["rep" + Arme.nbproject]._y = this.y + this._y - this.target.posY - this.posY - this._height / 2;
    this.target["rep" + Arme.nbproject]._xscale = this._xscale;
    this.target["rep" + Arme.nbproject].go(1,this._xscale / 100);
    this.lastshoot = 5416;
    this.canshoot = false;
    if(this.speedX == 0)
    {
        this.speedX = this.dir * this.maxX / 2;
    }
    this.gotoAndStop("gun");
    this.nextentframe = this.onEnterFrame;
    this.onEnterFrame = this.fire;
};
Perso.prototype.shootWithRepVert = function()
{
    Arme.nbproject++;
    this.munitions -= 1;
    _root.mcConsole.weapon = this.munitions;
    this.target.attachMovie("idFlash","rep" + Arme.nbproject,Arme.nbproject);
    this.game.soundFireFlash.start();
    this.target["rep" + Arme.nbproject]._x = - this.target.PosX + this.x + this._x - this.posX + this.dir * this._width / 2;
    this.target["rep" + Arme.nbproject]._y = this.y + this._y - this.target.posY - this.posY - this._height / 2;
    this.target["rep" + Arme.nbproject]._xscale = this._xscale;
    this.target["rep" + Arme.nbproject].go(2,this._xscale / 10);
    this.lastshoot = 8171;
    this.canshoot = false;
    this.gotoAndStop("gun");
    if(this.speedX == 0)
    {
        this.speedX = this.dir * this.maxX / 4;
    }
    this.nextentframe = this.onEnterFrame;
    this.onEnterFrame = this.fire;
};
Perso.prototype.putMine = function()
{
    if(this.target.mines == undefined && this.status.moveHor == undefined && this.status.moveVer == undefined)
    {
        this.timeofmine = 10459;
        this.munitions -= 1;
        _root.mcConsole.weapon = this.munitions;
        this.target.attachMovie("idmine","mines",100);
        this.game.soundPutMine.start();
        this.target.mines._x = - this.target.PosX + this.x + this._x - this.posX;
        this.target.mines._y = this.status._y;
        this.target.mines.go(this.initZone());
        this.gotoAndStop("mine");
        this.onEnterFrame = this.onPutMine;
    }
};
Perso.prototype.fire = function()
{
    this.fallY = 0;
    var _loc2_ = this.initZone();
    this.sens = this._xscale;
    this.speedX /= this.acc;
    var _loc3_ = false;
    var _loc4_ = this.target.wall[_loc2_];
    var _loc5_ = null;
    for(var _loc6_ in _loc4_)
    {
        if(_loc4_[_loc6_] != this.status && _loc4_[_loc6_].hitTest(this._x,this._y))
        {
            _loc5_ = _loc4_[_loc6_];
            _loc3_ = true;
            this.acc = 5;
            this.speedX = 0;
            this.onEnterFrame = this.move;
        }
    }
    if(this.nextentframe == this.moveonPfMove && this.engine == 1)
    {
        this.x += this.status.moveHor;
        this.target.move();
    }
    else
    {
        if(this.nextentframe == this.moveonPfVert)
        {
            this._y = - this.y + this.posY + this.target.posY + this.status._y;
        }
        if(Math.abs(this.speedX) > 4)
        {
            this.scrollMove();
            this.scrollY();
        }
    }
    if(!this.status.mcHit.hitTest(this.mcPied))
    {
        this.gotoAndStop("jump");
        this.onEnterFrame = this.fall;
    }
    if(Math.abs(this.speedX) < 1)
    {
        this.onEnterFrame = this.nextentframe;
    }
};
Perso.prototype.onPutMine = function()
{
    this.fallY = 0;
    this.speedX = 0;
    var _loc2_ = this.initZone();
    this.sens = this._xscale;
    if(1050 - this.timeofmine > 400)
    {
        this.gotoAndStop("pause");
        this.onEnterFrame = this.move;
    }
};
Perso.prototype.testPolio = function()
{
    if(Key.isDown(Game.LEFT) && Key.isDown(Game.RIGHT))
    {
        return true;
    }
};
Perso.prototype.startMicelle = function()
{
    this.createEmptyMovieClip("mcmicelle",1);
    this.delaymicelle = 2000;
    this.newMicelle = 2633;
    this.mcmicelle.onEnterFrame = function()
    {
        var _loc2_ = this._parent;
        var _loc3_;
        if(10217 - _loc2_.newMicelle > _loc2_.delaymicelle && _loc2_.target.micellea == undefined && _loc2_.onEnterFrame == _loc2_.move)
        {
            _loc2_.newMicelle = 7814;
            _loc3_ = Math.ceil(Math.random() * 2.5);
            _loc2_.target.attachMovie("idMicelle","micellea",200);
            _loc2_.target.micellea._x = _loc2_.target.PosX + 640 / _loc3_;
            _loc2_.target.micellea._y = _loc2_.y + _loc2_._y - _loc2_.target.posY - _loc2_.posY + 480;
            _loc2_.target.micellea.posY = _loc2_.target.micellea._y;
        }
    };
    this.startmicelle = null;
};
Perso.prototype.createMicelle = function()
{
    var _loc2_ = this._parent;
    var _loc3_;
    if(6141 - _loc2_.newMicelle > _loc2_.delaymicelle && _loc2_.target.micellea == undefined && _loc2_.onEnterFrame == _loc2_.move)
    {
        _loc2_.newMicelle = 5064;
        _loc3_ = Math.ceil(Math.random() * 2.5);
        _loc2_.target.attachMovie("idMicelle","micellea",200);
        _loc2_.target.micellea._x = _loc2_.target.PosX + 640 / _loc3_;
        _loc2_.target.micellea._y = _loc2_.y + _loc2_._y - _loc2_.target.posY - _loc2_.posY + 480;
        _loc2_.target.micellea.posY = _loc2_.target.micellea._y;
    }
};
Perso.prototype.onPopup = function()
{
    this.onPopup = null;
    this.game.speedTime = 0;
    _root.attachMovie("idBall","mcBall",_root.getMaxDepth(),{_x:this._x,_y:this._y,target:this,screen:this.bonus,level:"lev" + this.game.level});
    this.acc = 5;
};
Perso.prototype.onBossLost = function()
{
    this.onBossLost = null;
    this.game.speedTime = 0;
    this.acc = 5;
    this.gotoAndStop("win");
    this.onEnterFrame = null;
};
Perso.prototype.pause = function()
{
    this.bonus = "pause";
    delete this.onPopup;
    this.status.pause();
    this.frameafterpause = this.onEnterFrame;
    var _loc2_ = this.current_zone - 1;
    while(_loc2_ < this.current_zone + 2)
    {
        lennemis = this.target.ennemis[lZone];
        for(var _loc3_ in lennemis)
        {
            lennemis[_loc3_].pause();
        }
        lplatevert = this.target.plateformevert[lZone];
        for(_loc3_ in lplatevert)
        {
            lplatevert[_loc3_].pause();
        }
        lplatemove = this.target.plateformemove[lZone];
        for(_loc3_ in lplatemove)
        {
            lplatemove[_loc3_].pause();
        }
        _loc2_ += 1;
    }
    if(this.game.level == 12)
    {
        delete this.startmicelle;
        this.target.micellea.onEnterFrame = null;
    }
    this.mcmicelle.removeMovieClip();
};
Perso.prototype.go = function()
{
    this.onPopup = null;
    this.onBossLost = null;
    this.invincibility = 2000 + (3 - this.game.difficulty) * 1000;
    lennemis = this.target.ennemis[0];
    for(var _loc2_ in lennemis)
    {
        lennemis[_loc2_].go();
    }
    lplatevert = this.target.plateformevert[0];
    for(_loc2_ in lplatevert)
    {
        lplatevert[_loc2_].go();
    }
    lplatemove = this.target.plateformemove[0];
    for(_loc2_ in lplatemove)
    {
        lplatemove.go();
    }
    if(this.engine == 1)
    {
        this.scrollMove = this.scrollXMove;
        this.scrollFall = this.scrollXFall;
        this.scrollJump = null;
        this.initZone = this.initZone1;
    }
    else if(this.engine == 2)
    {
        this.scrollMove = this.scrollYMove;
        this.scrollFall = this.scrollYFall;
        this.scrollJump = this.scrollYJump;
        this.scrollYUp = this.onScrollingYUp;
        this.initZone = this.initZone2;
    }
    else
    {
        this.scrollMove = this.scrollYMove;
        this.scrollFall = this.scrollXFall;
        this.scrollJump = this.scrollXJump;
        this.initZone = this.initZone2;
        this.target.move = null;
    }
    switch(this.game.level)
    {
        case 11:
        this.shoot = null;
        this.maxmunition = Arme.nbmaxmunitions;
        this.CollBossMove = null;
        this.CollBossJump = null;
        this.CollBossFall = null;
        this.CollPiegeMove = null;
        this.CollPiegeFall = null;
        this.CollEnnemiMove = this.CollEnzymeMove;
        this.CollEnnemiJump = this.CollEnzymeJump;
        break;
        case 12:
        this.CollBossMove = null;
        this.CollBossJump = null;
        this.CollBossFall = null;
        this.CollEnnemiMove = this.CollEnzymeMove;
        this.CollEnnemiJump = this.CollEnzymeJump;
        break;
        case 21:
        this.shoot = this.shootWithGunHor;
        this.maxmunition = Arme.nbmaxmunitions;
        this.CollBossMove = null;
        this.CollBossJump = null;
        this.CollBossFall = null;
        this.CollEnnemiMove = this.CollMaxibeurkMove;
        break;
        case 22:
        this.startMicelle = null;
        this.shoot = this.putMine;
        this.maxmunition = Mine.nbmaxmunitions;
        this.CollBossMove = null;
        this.CollBossJump = null;
        this.CollBossFall = null;
        this.CollEnnemiMove = this.CollMaxibeurkMove;
        break;
        case 24:
        this.startMicelle = null;
        this.CollEnnemiMove = this.CollMaxibeurkMove;
        this.onTouch = null;
        break;
        case 31:
        this.shoot = this.shootWithRepHor;
        this.maxmunition = Armerepousse.nbmaxmunitions;
        this.CollBossMove = null;
        this.CollBossJump = null;
        this.CollBossFall = null;
        this.CollEnnemiMove = this.CollMaxibeurkMove;
        break;
        case 32:
        this.startMicelle = null;
        this.shoot = this.putMine;
        this.maxmunition = Mine.nbmaxmunitions;
        this.CollBossMove = null;
        this.CollBossJump = null;
        this.CollBossFall = null;
        this.CollEnnemiMove = this.CollMaxibeurkMove;
        break;
        case 34:
        this.startMicelle = null;
        this.CollEnnemiMove = this.CollMaxibeurkMove;
        this.onTouch = null;
        break;
        default:
        this.shoot = null;
    }
    this.mcHead._height = 0;
    this.speedY = 1;
    this.status = this.target.mcStart;
    this.onEnterFrame = this.move;
};

/*
 * Équipe Actimel contre les Mégakrasses — décompilation nettoyée
 * Classe extraite de engine.swf.
 *
 * ATTENTION : ce fichier est une version lisible du code décompilé.
 * Les noms _locN_ sont conservés lorsque le décompilateur a perdu les noms
 * originaux, afin de ne pas inventer de comportement.
 */

_global.Game = function()
{
    this.speedTime = 1;
    this.soundMap = new Sound(_level10);
    this.soundMap.attachSound("idSound_map");
    this.soundHalo = new Sound(_level10);
    this.soundHalo.attachSound("idSound_halo");
    this.soundBackground = new Sound(_level10);
    this.soundBackgroundSpeed = new Sound(_level10);
    this.soundTime = new Sound(_level10);
    this.soundTime.attachSound("idSound_time");
    this.soundLetter = new Sound(_level10);
    this.soundLetter.attachSound("idSound_lettre");
    this.soundActimel = new Sound(_level10);
    this.soundActimel.attachSound("idSound_Actimel");
    this.soundPack = new Sound(_level10);
    this.soundPack.attachSound("idSound_Pack");
    this.soundLives = new Sound(_level10);
    this.soundLives.attachSound("idSound_Lives");
    this.soundStart = new Sound(_level10);
    this.soundStart.attachSound("idSound_start");
    this.soundForce = new Sound(_level10);
    this.soundForce.attachSound("idSound_force");
    this.soundShield = new Sound(_level10);
    this.soundShield.attachSound("idSound_shield");
    this.soundWeapon = new Sound(_level10);
    this.soundWeapon.attachSound("idSound_weapon");
    this.soundLostForce = new Sound(_level10);
    this.soundLostForce.attachSound("idSound_lostForce");
    this.soundLostLife = new Sound(_level10);
    this.soundLostLife.attachSound("idSound_lostLife");
    this.soundFireGun = new Sound(_level10);
    this.soundFireGun.attachSound("idSound_fireGun");
    this.soundFireFlash = new Sound(_level10);
    this.soundFireFlash.attachSound("idSound_fireFlash");
    this.soundPutMine = new Sound(_level10);
    this.soundPutMine.attachSound("idSound_putMine");
    this.soundMine = new Sound(_level10);
    this.soundMine.attachSound("idSound_mine");
    this.soundTrampoline = new Sound(_level10);
    this.soundTrampoline.attachSound("idSound_trampoline");
    this.soundVilosite = new Sound(_level10);
    this.soundVilosite.attachSound("idSound_vilosite");
    this.soundMarais = new Sound(_level10);
    this.soundMarais.attachSound("idSound_marais");
    this.soundGeiser = new Sound(_level10);
    this.soundGeiser.attachSound("idSound_geiser");
    this.soundGlouton = new Sound(_level10);
    this.soundGlouton.attachSound("idSound_glouton");
    this.soundMicelle = new Sound(_level10);
    this.soundMicelle.attachSound("idSound_micelle");
    this.soundDizzy = new Sound(_level10);
    this.soundDizzy.attachSound("idSound_dizzy");
    this.soundMaxiKill = new Sound(_level10);
    this.soundMaxiKill.attachSound("idSound_maxiKill");
    this.soundBoss = new Sound(_level10);
    this.soundBoss.attachSound("idSound_boss");
    this.soundBossLost = new Sound(_level10);
    this.soundBossLost.attachSound("idSound_bossLost");
    this.soundEquipe = new Sound(_level10);
    this.soundEquipe.attachSound("idSound_Equipe");
    this.soundFondVoix = new Sound(_level10);
    this.soundFondVoix.attachSound("idSound_fondvoix");
    this.soundLevel11 = new Sound(_level10);
    this.soundLevel11.attachSound("idSound_level11");
    this.soundLevel12 = new Sound(_level10);
    this.soundLevel12.attachSound("idSound_level12");
    this.soundLevel13 = new Sound(_level10);
    this.soundLevel13.attachSound("idSound_level13");
    this.soundLevel21 = new Sound(_level10);
    this.soundLevel21.attachSound("idSound_level21");
    this.soundLevel22 = new Sound(_level10);
    this.soundLevel22.attachSound("idSound_level22");
    this.soundLevel23 = new Sound(_level10);
    this.soundLevel23.attachSound("idSound_level23");
    this.soundLevel24 = new Sound(_level10);
    this.soundLevel24.attachSound("idSound_level24");
    this.soundLevel31 = new Sound(_level10);
    this.soundLevel31.attachSound("idSound_level31");
    this.soundLevel32 = new Sound(_level10);
    this.soundLevel32.attachSound("idSound_level32");
    this.soundLevel33 = new Sound(_level10);
    this.soundLevel33.attachSound("idSound_level33");
    this.soundLevel34 = new Sound(_level10);
    this.soundLevel34.attachSound("idSound_level34");
    if(options)
    {
        if(cheatcode.join("") == "89657765717913")
        {
            this.cheat();
        }
        else
        {
            options.initGame(this);
        }
    }
    else
    {
        stop();
    }
    Game.quality = this.quality;
    if(this.difficulty == 1)
    {
        this.totalTime = 360;
    }
    else if(this.difficulty == 2)
    {
        this.totalTime = 300;
    }
    else
    {
        this.totalTime = 240;
    }
};
Game.UP = 38;
Game.LEFT = 37;
Game.RIGHT = 39;
Game.DOWN = 40;
Game.ACTION = 32;
Game.PAUSE = 27;
Game.CHEATKEY = 35;
Game.prototype.startGame = function()
{
    mcScreen.remove();
    this.help();
    _root.attachMovie("idScreen","mcScreen",_root.getMaxDepth(),{game:this,level:this.level});
    mcScreen.loadGame();
};
Game.prototype.start = function()
{
    this.time = this.totalTime * 20;
    this.chrono = setInterval(this.onChrono,1000,this);
    this.speedTime = 1;
    this.actimel = 0;
    this.pack = 0;
    this.maxibeurk = 0;
    this.actimen = 0;
    BonusEnd.help = false;
    this.completed = false;
    _root.attachMovie("idConsole","mcConsole",104,{_x:3,_y:1,univers:Math.floor(this.level / 10),lives:this.lives,time:Math.floor(this.time / 20)});
    this.soundBackground.attachSound("idSound_back" + Math.floor(this.level / 10));
    this.soundBackgroundSpeed.attachSound("idSound_speed" + Math.floor(this.level / 10));
    this.soundBackground.setVolume(25 * this.volume);
    this.soundBackgroundSpeed.setVolume(25 * this.volume);
    _root.attachMovie("idCadreHB","mcCadreHaut",100,{_x:0,_y:22,_yscale:-100});
    _root.attachMovie("idCadreHB","mcCadreBas",101,{_x:0,_y:490});
    _root.attachMovie("idCadreGD","mcCadreGauche",102,{_x:0,_y:47});
    _root.attachMovie("idCadreGD","mcCadreDroit",103,{_x:641.6,_y:47});
    mcFps.swapDepths(200);
    bench.swapDepths(201);
    _root.createEmptyMovieClip("mcFond",0);
    switch(this.level)
    {
        case 11:
        case 21:
        case 31:
        this.loadGame(320,455,-450,60);
        return undefined;
        case 12:
        case 22:
        case 32:
        this.loadGame(100,100,-100,-130);
        return undefined;
        case 13:
        case 23:
        case 33:
        this.loadGame(320,240,0,33);
        return undefined;
        case 24:
        case 34:
        this.loadGame(100,100,-100,-100);
        return undefined;
        default:
        _root.attachMovie("idTemp","mcScreen",_root.getMaxDepth());
        this.onTime = setInterval(this.onGameOver,1000,this);
        return undefined;
    }
};
Game.prototype.initStart = function()
{
    if(mcFond.getBytesLoaded() >= mcFond.getBytesTotal() && mcFond.getBytesTotal())
    {
        newGame.soundBackground.start(0,500);
        if(mcPerso.engine == 1)
        {
            mcFond.scrolling = 5;
            mcFond.onEnterFrame = function()
            {
                newGame.time -= newGame.speedTime;
                benchIn();
                this._x = (- mcPerso.x) / this.scrolling;
            };
            mcZone.init();
            mcPerso.target = mcZone;
        }
        else if(mcPerso.engine == 2)
        {
            mcFond.scrolling = 5;
            mcFond.onEnterFrame = function()
            {
                newGame.time -= newGame.speedTime;
                benchIn();
                this._y = (- mcPerso.y) / this.scrolling;
            };
            mcZone.init();
            mcPerso.target = mcZone;
        }
        else if(mcPerso.engine == 3)
        {
            mcFond._y = 32;
            mcFond.scrollingMax = 5;
            mcFond.scrolling = 0;
            mcFond.onEnterFrame = function()
            {
                benchIn();
                newGame.time -= newGame.speedTime;
                if(this._x < -1290)
                {
                    this._x = - this.scrolling;
                }
                this._x -= this.scrolling;
                mcZone0._x -= Zone3.scrolling;
                mcZone1._x -= Zone3.scrolling;
                if(mcZone1._x < 0)
                {
                    mcZone0._x = mcZone1._width + mcZone1._x;
                    if(mcZone0.enabled)
                    {
                        mcZone0.createZone();
                    }
                }
                if(mcZone0._x < 0)
                {
                    mcZone1._x = mcZone0._width + mcZone0._x;
                    if(mcZone1.enabled)
                    {
                        mcZone1.createZone();
                    }
                }
            };
        }
        else
        {
            mcFond.onEnterFrame = function()
            {
                newGame.time -= newGame.speedTime;
                benchIn();
            };
            mcZone.init();
            mcPerso.target = mcZone;
        }
    }
    mcPerso.game = newGame;
    _quality = Game.quality;
    mcPerso.go();
    mcScreen.removeMovieClip();
    delete _root.onEnterFrame;
};
Game.prototype.replay = function(pType)
{
    clearInterval(this.chrono);
    this.soundBackground.stop();
    this.soundBackgroundSpeed.stop();
    _quality = "high";
    switch(pType)
    {
        case "lost":
        case "cheat":
        this.lives--;
        if(this.lives > 0)
        {
            _root.attachMovie("idLost","mcScreen",_root.getMaxDepth(),{game:this});
            break;
        }
        _root.attachMovie("idGameOver","mcScreen",_root.getMaxDepth());
        break;
        case "next":
        this.completed = true;
        BonusStart.help = false;
        _root.attachMovie("idScreen","mcScreen",_root.getMaxDepth(),{game:this,level:this.level});
        if(this.level != 34 || this.level == 34 && this.lives <= 0)
        {
            mcScreen.loadScore();
            break;
        }
        mcScreen.loadEnd();
    }
    mcConsole.remove();
    mcCadreGauche.remove();
    mcCadreDroit.remove();
    mcCadreHaut.remove();
    mcCadreBas.remove();
    mcPerso.remove();
    mcZone.remove();
    mcZone0.remove();
    mcZone1.remove();
    mcGroupeJets.remove();
    mcFond.remove();
    if(pType == "lost")
    {
        if(this.lives > 0)
        {
            this.onTime = setInterval(this.onReplay,2000,this);
        }
        else
        {
            this.onTime = setInterval(this.onGameOver,2000,this);
        }
    }
    if(pType == "cheat")
    {
        this.cheat();
    }
};
Game.prototype.cheat = function()
{
    this.quality = "medium";
    this.volume = 4;
    mcScreen.remove();
    BonusStart.help = false;
    _quality = "high";
    _root.attachMovie("idCheat","mcScreen",_root.getMaxDepth());
};
Game.prototype.loadGame = function(pActimanX, pActimanY, pZoneX, pZoneY)
{
    if(this.level % 10 != 3)
    {
        _root.attachMovie("idActiman","mcPerso",50,{_x:pActimanX,_y:pActimanY,engine:this.level % 10});
        _root.attachMovie("idZone" + this.level,"mcZone",10,{posX:pZoneX,posY:pZoneY,target:mcPerso,game:this});
    }
    else
    {
        _root.attachMovie("idVaisseau" + Math.floor(this.level / 10),"mcPerso",50,{_x:pActimanX,_y:pActimanY,engine:this.level % 10,game:this});
        _root.attachMovie("idZone" + this.level,"mcZone0",10,{_y:pZoneY,game:this,target:mcPerso,num:0,leveldes:Zone3["level" + this.level]});
        _root.attachMovie("idZone" + this.level,"mcZone1",11,{_x:mcZone0._width,_y:pZoneY,game:this,target:mcPerso,num:1,leveldes:Zone3["level" + this.level]});
    }
    mcFond.loadMovie("fond" + this.level + ".swf");
    _root.onEnterFrame = this.initStart;
};
Game.prototype.onReplay = function(pThis)
{
    this = pThis;
    clearInterval(this.onTime);
    this.soundFondVoix.stop();
    this.start();
};
Game.prototype.onGameOver = function(pThis)
{
    this = pThis;
    clearInterval(this.onTime);
    mcScreen.remove();
    _root.attachMovie("idScreen","mcScreen",_root.getMaxDepth(),{game:this,level:this.level});
    mcScreen.loadScore();
};
Game.prototype.onChrono = function(pThis)
{
    this = pThis;
    _root.mcConsole.time = Math.floor(this.time / 20);
    if(this.time < 1200)
    {
        if(_root.mcConsole.time == 59)
        {
            new Color(_root.mcConsole.mcTime).setRGB(16711680);
            _root.mcConsole.mcWatch.gotoAndPlay("hurry");
            this.soundBackground.stop();
            this.soundBackgroundSpeed.start(0,500);
            this.soundTime.start();
        }
        else if(_root.mcConsole.time == 0)
        {
            clearInterval(this.chrono);
            _root.mcPerso.force = 0;
            _root.mcPerso.onHurt();
        }
    }
};
Game.prototype.next = function()
{
    this.actimel = 0;
    this.pack = 0;
    this.maxibeurk = 0;
    if(this.level == 13)
    {
        this.level = 21;
    }
    else if(this.level == 24)
    {
        this.level = 31;
    }
    else
    {
        this.level++;
    }
    this.startGame();
};
Game.prototype.setScore = function(pScreen)
{
    pScreen.univers = Math.floor(this.level / 10);
    pScreen.level = this.level % 10;
    pScreen.nb_actimel = this.actimel;
    pScreen.nb_pack = this.pack;
    pScreen.nb_maxi = this.maxibeurk;
    pScreen.nb_time = Math.ceil(this.time / 20);
    pScreen.nb_letter = this.actimen;
    pScreen.completed = this.completed;
    pScreen.difficulty = this.difficulty;
    pScreen.lives = this.lives;
    pScreen.pGame = this;
    pScreen.play();
};
Game.prototype.help = function()
{
    if(this.level > 11)
    {
        BonusPoint.help = true;
        BonusPack.help = true;
        BonusForce.help = true;
        BonusLife.help = true;
        BonusLetter.help = true;
        BonusWeapon.help = true;
        BonusShield.help = true;
        this.help = null;
    }
};

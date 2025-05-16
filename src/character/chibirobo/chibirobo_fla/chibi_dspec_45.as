// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.chibi_dspec_45

package chibirobo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.display.*;
    import flash.media.*;
    import flash.geom.*;
    import flash.events.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.globalization.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class chibi_dspec_45 extends MovieClip 
    {

        public var counterBox:MovieClip;
        public var hitBox:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var proj:*;
        public var projLinkage:*;
        public var frameLabel:*;
        public var xScale:*;
        public var yScale:*;

        public function chibi_dspec_45()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 10, this.frame11, 11, this.frame12, 20, this.frame21, 21, this.frame22, 22, this.frame23, 23, this.frame24, 24, this.frame25, 25, this.frame26, 26, this.frame27, 27, this.frame28, 32, this.frame33, 34, this.frame35, 36, this.frame37);
        }

        public function getChibiProjectile(_arg_1:*):void
        {
            this.proj = _arg_1.data.receiver;
            if ((((((((((((((((((((((((((((((((((((((SSF2API.getObjectType(this.proj) == "Projectile") && (!(this.proj.getProjectileStat("linkage_id") == "gigarobo"))) && (!(this.proj.getProjectileStat("linkage_id") == "Peach_FinalSmash"))) && (!(this.proj.getProjectileStat("linkage_id") == "ness_pkflashproj"))) && (!(this.proj.getProjectileStat("linkage_id") == "dsmashfullleft"))) && (!(this.proj.getProjectileStat("linkage_id") == "dsmashfullright"))) && (!(this.proj.getProjectileStat("linkage_id") == "thunder"))) && (!(this.proj.getProjectileStat("linkage_id") == "NSpecBomb"))) && (!(this.proj.getProjectileStat("linkage_id") == "bm_flare"))) && (!(this.proj.getProjectileStat("linkage_id") == "bm_dair_death"))) && (!(this.proj.getProjectileStat("linkage_id") == "bm_bthrowrock"))) && (!(this.proj.getProjectileStat("linkage_id") == "donkeykong_arcadebarrel"))) && (!(this.proj.getProjectileStat("linkage_id") == "landmasterLaser"))) && (!(this.proj.getProjectileStat("linkage_id") == "spiritbomb"))) && (!(this.proj.getProjectileStat("linkage_id") == "pika_fs"))) && (!(this.proj.getProjectileStat("linkage_id") == "mario_finale_projectile"))) && (!(this.proj.getProjectileStat("linkage_id") == "starstormeteor"))) && (!(this.proj.getProjectileStat("linkage_id") == "samus_zero_laser"))) && (!(this.proj.getProjectileStat("linkage_id") == "tails_plane_shot"))) && (!(this.proj.getProjectileStat("linkage_id") == "tails_plane_bomb"))) && (!(this.proj.getProjectileStat("linkage_id") == "yoshi_fireball"))) && (!(this.proj.getProjectileStat("linkage_id") == "Yoshi_fireball"))) && (!(this.proj.getProjectileStat("linkage_id") == "light_arrow"))) && (!(this.proj.getProjectileStat("linkage_id") == "p1"))) && (!(this.proj.getProjectileStat("linkage_id") == "p15"))) && (!(this.proj.getProjectileStat("linkage_id") == "p2"))) && (!(this.proj.getProjectileStat("linkage_id") == "dragon"))) && (!(this.proj.getProjectileStat("linkage_id") == "blackgetsuga1"))) && (!(this.proj.getProjectileStat("linkage_id") == "blackgetsuga2"))) && (!(this.proj.getProjectileStat("linkage_id") == "megaman_rushbullet"))) && (!(this.proj.getProjectileStat("linkage_id") == "naruto_rasenganexplosionground_red"))) && (!(this.proj.getProjectileStat("linkage_id") == "naruto_redrasengan"))) && (!(this.proj.getProjectileStat("linkage_id") == "naruto_kyuubiblast"))) && (!(this.proj.getProjectileStat("linkage_id") == "super_sonic_dspecial_projectile1"))) && (!(this.proj.getProjectileStat("linkage_id") == "warioman_bomb"))) && (!(this.proj.getProjectileStat("linkage_id") == "HUGEBOOM"))) && (!(this.proj.getID() == -1))))
            {
                if (this.proj.getID() != this.self.getID())
                {
                    SSF2API.removeEventListener(this.self, SSF2Event.CHAR_COUNTER, this.getChibiProjectile);
                    SSF2API.print("Got it!");
                    gotoAndPlay("store");
                };
            };
        }

        public function animateProj():void
        {
            if (this.self.getHitBox("touchBox") != null)
            {
                this.proj.setX((this.self.getX() + this.self.getHitBox("touchBox").x));
                this.proj.setY((this.self.getY() + this.self.getHitBox("touchBox").y));
            };
        }

        public function dinBoom(_arg_1:*):*
        {
            if (_arg_1.data.opponent != null)
            {
                if (_arg_1.data.opponent != this.self)
                {
                    this.proj.getStanceMC().gotoAndPlay("continue");
                    this.proj.removeEventListener(SSF2Event.GROUND_TOUCH, this.dinBoom);
                    this.proj.removeEventListener(SSF2Event.PROJ_COLLIDE, this.dinBoom);
                };
            }
            else
            {
                this.proj.getStanceMC().gotoAndPlay("continue");
                this.proj.removeEventListener(SSF2Event.GROUND_TOUCH, this.dinBoom);
                this.proj.removeEventListener(SSF2Event.PROJ_COLLIDE, this.dinBoom);
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.proj = null;
            this.projLinkage = null;
            this.frameLabel = null;
            this.xScale = 1;
            this.yScale = 1;
            if (((this.self) && (SSF2API.isReady())))
            {
                if (this.self.getGlobalVariable("chibiProjGlobal") != null)
                {
                    this.gotoAndPlay("fire");
                };
            };
        }

        internal function frame2():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame3():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.CHAR_COUNTER, this.getChibiProjectile);
        }

        internal function frame11():*
        {
            this.self.endAttack();
        }

        internal function frame12():*
        {
            this.self.playAttackSound(1);
            this.proj.updateProjectileStats({"suspend":true});
            this.projLinkage = this.proj.getProjectileStat("linkage_id");
            if (((((((((this.projLinkage == "goku_kame1") || (this.projLinkage == "goku_kame2")) || (this.projLinkage == "goku_kame3")) || (this.projLinkage == "goku_kame4")) || (this.projLinkage == "ssgoku_kame1")) || (this.projLinkage == "ssgoku_kame2")) || (this.projLinkage == "ssgoku_kame3")) || (this.projLinkage == "ssgoku_dragon")))
            {
                this.proj.destroy();
            }
            else
            {
                SSF2API.createTimer(this.self, 1, 0, this.animateProj);
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_HURT, this.proj.destroy);
            };
        }

        internal function frame21():*
        {
            this.self.setGlobalVariable("chibiProjGlobal", this.proj.exportStats());
            this.self.getGlobalVariable("telly").getStanceMC().hasProjectile = true;
            if (this.proj.getProjectileStat("linkage_id") == "samus_chargeshot")
            {
                this.self.setGlobalVariable("projCharge", this.proj.getCurrentCharge());
            };
            this.xScale = this.proj.getXScale();
            this.yScale = this.proj.getYScale();
            this.self.setGlobalVariable("xScale", this.xScale);
            this.self.setGlobalVariable("yScale", this.yScale);
        }

        internal function frame22():*
        {
            this.proj.setScale((this.xScale * 0.5), (this.yScale * 0.5));
        }

        internal function frame23():*
        {
            this.proj.setScale((this.xScale * 0.25), (this.yScale * 0.25));
        }

        internal function frame24():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.CHAR_HURT, this.proj.destroy);
            this.proj.destroy();
        }

        internal function frame25():*
        {
            this.self.endAttack();
        }

        internal function frame26():*
        {
            if (this.self.getGlobalVariable("chibiProjGlobal").linkage_id == "samus_chargeshot")
            {
                this.self.fireProjectile(this.self.getGlobalVariable("chibiProjGlobal"), 0, 0, false, {
                    "chargetime":this.self.getGlobalVariable("projCharge"),
                    "chargetime_max":60
                });
            }
            else
            {
                this.self.fireProjectile(this.self.getGlobalVariable("chibiProjGlobal"));
            };
            this.proj = this.self.getCurrentProjectile();
            this.xScale = this.self.getGlobalVariable("xScale");
            this.yScale = this.self.getGlobalVariable("yScale");
            this.self.getGlobalVariable("telly").getStanceMC().hasProjectile = false;
            SSF2API.print("Successfully threw projectile back.");
            this.self.setGlobalVariable("chibiProjGlobal", null);
            this.proj = this.self.getCurrentProjectile();
            this.proj.setScale((this.xScale * 0.5), (this.yScale * 0.5));
            this.proj.updateProjectileStats({"suspend":true});
            SSF2API.addEventListener(this.self, SSF2Event.CHAR_HURT, this.proj.destroy);
            if (!this.proj)
            {
                gotoAndPlay("search");
            };
            this.proj.updateProjectileStats({"suspend":true});
            SSF2API.createTimer(this.self, 1, 0, this.animateProj);
        }

        internal function frame27():*
        {
            this.proj.setScale((this.xScale * 0.75), (this.yScale * 0.75));
        }

        internal function frame28():*
        {
            this.proj.setScale((this.xScale * 1), (this.yScale * 1));
        }

        internal function frame33():*
        {
            this.self.playAttackSound(3);
        }

        internal function frame35():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.CHAR_HURT, this.proj.destroy);
            SSF2API.destroyTimer(this.self, this.animateProj);
            this.proj.updateProjectileStats({
                "rotate":true,
                "suspend":false
            });
            if (this.self.isFacingRight())
            {
                this.proj.angleControl(this.proj.exportStats().xspeed, 10);
            }
            else
            {
                this.proj.angleControl(this.proj.exportStats().xspeed, 170);
            };
            this.projLinkage = this.proj.getProjectileStat("linkage_id");
            if (this.projLinkage == "dins_fire")
            {
                this.proj.updateProjectileStats({
                    "xdecay":0,
                    "xspeed":4,
                    "influenceYMovement":0,
                    "influenceYFactor":0,
                    "gravity":0.5,
                    "maxgravity":5
                });
                this.proj.addEventListener(SSF2Event.GROUND_TOUCH, this.dinBoom);
                this.proj.addEventListener(SSF2Event.PROJ_COLLIDE, this.dinBoom);
                this.proj.addEventListener(SSF2Event.HIT_WALL, this.dinBoom);
                if (this.self.isFacingRight())
                {
                    this.proj.angleControl(this.proj.exportStats().xspeed, 60);
                }
                else
                {
                    this.proj.angleControl(this.proj.exportStats().xspeed, 120);
                };
            };
            if (this.projLinkage == "BMfsmashfull")
            {
                if (this.self.isFacingRight())
                {
                    this.proj.angleControl(this.proj.exportStats().xspeed, 0);
                }
                else
                {
                    this.proj.angleControl(this.proj.exportStats().xspeed, 180);
                };
            };
            if (((this.projLinkage == "bmmeteorprojectile") || (this.projLinkage == "bmmeteorprojectileair")))
            {
                this.frameLabel = "burn";
                SSF2API.playSound("bmfire");
                this.proj.updateProjectileStats({
                    "xdecay":0,
                    "xspeed":4,
                    "yspeed":0,
                    "gravity":0.5,
                    "maxgravity":5
                });
                if (this.self.isFacingRight())
                {
                    this.proj.angleControl(9, 60);
                }
                else
                {
                    this.proj.angleControl(9, 120);
                };
            };
            if (this.projLinkage == "samus_bomb")
            {
                if (this.self.isFacingRight())
                {
                    this.proj.angleControl(9, 20);
                }
                else
                {
                    this.proj.angleControl(9, 160);
                };
            };
            if ((((this.projLinkage == "NSpecBomb1Dropped") || (this.projLinkage == "NSpecBomb2Dropped")) || (this.projLinkage == "NSpecBomb3Dropped")))
            {
                this.proj.addEventListener(SSF2Event.GROUND_TOUCH, this.dinBoom);
                this.proj.addEventListener(SSF2Event.PROJ_COLLIDE, this.dinBoom);
                this.proj.addEventListener(SSF2Event.HIT_WALL, this.dinBoom);
                if (this.self.isFacingRight())
                {
                    this.proj.angleControl(9, 40);
                }
                else
                {
                    this.proj.angleControl(9, 140);
                };
            };
            if (this.projLinkage == "eggBomb")
            {
                if (this.self.isFacingRight())
                {
                    this.proj.angleControl(9, 60);
                }
                else
                {
                    this.proj.angleControl(9, 120);
                };
            };
            if (this.projLinkage == "naruto_clone2")
            {
                this.proj.angleControl(80, 270);
            };
            if (this.frameLabel)
            {
                this.proj.getStanceMC().gotoAndPlay(this.frameLabel);
            };
        }

        internal function frame37():*
        {
            this.self.endAttack();
        }


    }
}//package chibirobo_fla


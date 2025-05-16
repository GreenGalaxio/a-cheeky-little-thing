// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmmeteor_85

package blackmage_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
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

    public dynamic class bmmeteor_85 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var controls:Object;
        public var xframe:String;
        public var projectile:*;
        public var sizeRatio:Number;
        public var meteorStatus:*;
        public var meteor:*;

        public function bmmeteor_85()
        {
            addFrameScript(0, this.frame1, 10, this.frame11, 11, this.frame12, 14, this.frame15, 15, this.frame16, 22, this.frame23, 28, this.frame29, 34, this.frame35, 35, this.frame36, 54, this.frame55);
        }

        public function projectileHit(_arg_1:*):*
        {
            SSF2API.removeEventListener(this.projectile, SSF2Event.PROJ_DESTROYED, this.projectileHit);
        }

        public function killProjectile(_arg_1:*):*
        {
            this.self.getCurrentProjectile().destroy();
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.killProjectile);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (((parent) && (SSF2API.isReady())))
            {
                this.controls = this.self.getControls();
                this.xframe = null;
                this.projectile = null;
                this.sizeRatio = 1;
                this.meteorStatus = null;
                this.self.updateAttackStats({"allowControl":false});
                this.self.setGlobalVariable("Boost", 0);
                this.meteorStatus = this.self.getGlobalVariable("meteorFrame");
                if (this.meteorStatus == null)
                {
                    SSF2API.playSound("bm_FS_spellcast");
                }
                else
                {
                    if (this.meteorStatus == "a")
                    {
                        this.gotoAndPlay("a");
                    }
                    else
                    {
                        if (this.meteorStatus == "b")
                        {
                            this.gotoAndPlay("b");
                        }
                        else
                        {
                            if (this.meteorStatus == "c")
                            {
                                this.gotoAndPlay("c");
                            };
                        };
                    };
                };
                this.self.setGlobalVariable("meteorFrame", null);
            };
        }

        internal function frame11():*
        {
            this.self.fireProjectile("meteor");
            this.projectile = this.self.getCurrentProjectile();
            this.self.setGlobalVariable("meteor", this.projectile);
            SSF2API.addEventListener(this.projectile, SSF2Event.PROJ_DESTROYED, this.projectileHit);
        }

        internal function frame12():*
        {
            this.xframe = "charging";
            if (((this.self.getGlobalVariable("meteor") == null) && (!(this.self.getGlobalVariable("meteor").isDead()))))
            {
                this.gotoAndPlay("broken");
            };
            this.self.updateAttackStats({"allowControl":false});
            this.projectile = this.self.getGlobalVariable("meteor");
        }

        internal function frame15():*
        {
            if (this.projectile != null)
            {
                this.sizeRatio = (this.sizeRatio + 0.1);
                this.projectile.getMC().scaleX = this.sizeRatio;
                this.projectile.getMC().scaleY = this.sizeRatio;
                this.projectile.updateAttackBoxStats(1, {"damage":(this.projectile.getAttackBoxStat(1, "damage") + 1)});
            };
            this.gotoAndPlay("charging");
        }

        internal function frame16():*
        {
            this.self.updateAttackStats({"allowControl":false});
            SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT, this.killProjectile);
            if (((this.self.getGlobalVariable("meteor") == null) && (!(this.self.getGlobalVariable("meteor").isDead()))))
            {
                this.gotoAndPlay("broken");
            }
            else
            {
                this.self.getGlobalVariable("meteor").setYSpeed(0);
            };
            if (this.self.getGlobalVariable("meteorFrame") != null)
            {
                gotoAndPlay(this.self.getGlobalVariable("meteorFrame"));
            };
        }

        internal function frame23():*
        {
            this.xframe = "attack";
            this.self.updateAttackStats({"allowControl":false});
            SSF2API.removeEventListener(this.projectile, SSF2Event.PROJ_DESTROYED, this.projectileHit);
        }

        internal function frame29():*
        {
            this.xframe = "attack";
            if (((!(this.self.getGlobalVariable("meteor") == null)) && (!(this.self.getGlobalVariable("meteor").isDead()))))
            {
                this.meteor = this.self.getGlobalVariable("meteor");
                SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.killProjectile);
                this.meteor.updateProjectileStats({
                    "time_max":210,
                    "ghost":false,
                    "maxgravity":9
                });
                this.meteor.refreshAttackID();
                this.meteor.getStanceMC().gotoAndPlay("burn");
                this.controls = this.self.getControls();
                if (this.self.isFacingRight())
                {
                    if (this.controls.LEFT)
                    {
                        this.meteor.angleControl(9, 295);
                    }
                    else
                    {
                        if (this.controls.RIGHT)
                        {
                            this.meteor.angleControl(9, 335);
                        }
                        else
                        {
                            this.meteor.angleControl(9, 315);
                        };
                    };
                }
                else
                {
                    if (this.controls.RIGHT)
                    {
                        this.meteor.angleControl(9, 245);
                    }
                    else
                    {
                        if (this.controls.LEFT)
                        {
                            this.meteor.angleControl(9, 205);
                        }
                        else
                        {
                            this.meteor.angleControl(9, 225);
                        };
                    };
                };
            }
            else
            {
                this.gotoAndPlay("broken");
            };
            if (this.self.getGlobalVariable("meteor") != null)
            {
                SSF2API.playSound("bmfire");
            };
            this.self.setGlobalVariable("meteorFrame", null);
        }

        internal function frame35():*
        {
            this.self.endAttack();
        }

        internal function frame36():*
        {
            this.xframe = "attack";
            this.self.updateAttackStats({"allowControl":false});
        }

        internal function frame55():*
        {
            this.self.endAttack();
        }


    }
}//package blackmage_fla


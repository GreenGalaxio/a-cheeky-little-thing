// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.ness_pkthunderair_45

package ness_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.system.*;
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
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class ness_pkthunderair_45 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var controls:Object;
        public var xframe:String;
        public var projectile:*;

        public function ness_pkthunderair_45()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 26, this.frame27, 27, this.frame28, 28, this.frame29, 30, this.frame31, 35, this.frame36, 40, this.frame41, 43, this.frame44, 56, this.frame57);
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.updateAttackStats({"allowControl":false});
            gotoAndPlay("continue");
        }

        public function goldDust():void
        {
            this.self.attachEffect("dustTrail");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = this.self.getControls();
                this.xframe = null;
                if (((this.self.isCPU()) && (!(this.self.isOnGround()))))
                {
                    if (this.self.inLowerLeftWarningBounds())
                    {
                        this.self.importCPUControls([6209, 4, 6145, 4, 4609, 1, 5633, 1, 5121, 2, 5633, 1, 5121, 7, 5377, 6, 4353, 4, 6401, 9, 4353, 2, 4097, 16]);
                    }
                    else
                    {
                        if (this.self.inLowerRightWarningBounds())
                        {
                            this.self.importCPUControls([6209, 7, 4353, 1, 5377, 2, 5121, 8, 5633, 5, 4609, 5, 6657, 15, 4609, 1, 4097, 10]);
                        };
                    };
                };
            };
        }

        internal function frame2():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame9():*
        {
            this.self.playAttackSound(1);
            this.self.fireProjectile("ness_pkthunder");
        }

        internal function frame10():*
        {
            this.projectile = this.self.getCurrentProjectile();
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
            this.xframe = "loop";
        }

        internal function frame11():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
        }

        internal function frame12():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
        }

        internal function frame13():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
        }

        internal function frame14():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
        }

        internal function frame15():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
        }

        internal function frame16():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
        }

        internal function frame17():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
        }

        internal function frame18():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
        }

        internal function frame19():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
        }

        internal function frame20():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
        }

        internal function frame21():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
            gotoAndPlay("loop");
        }

        internal function frame22():*
        {
            if (((this.projectile) && (!(this.projectile.isDead()))))
            {
                this.projectile.endControl();
                this.projectile.removeFromCamera();
            };
            this.self.updateAttackStats({"linkFrames":false});
        }

        internal function frame27():*
        {
            this.self.endAttack();
        }

        internal function frame28():*
        {
            this.self.updateAttackStats({
                "cancelWhenAirborne":false,
                "air_ease":-1,
                "linkFrames":false,
                "xSpeedDecay":-0.15
            });
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            SSF2API.playSound("Ness_005");
            this.self.playVoiceSound(2);
            this.self.attachEffect("effect_firehit1", {
                "scaleX":2,
                "scaleY":2
            });
            SSF2API.shakeCamera(20);
        }

        internal function frame29():*
        {
            this.self.updateAttackStats({"air_ease":-1});
            SSF2API.createTimer(this.self, 3, -1, this.goldDust);
        }

        internal function frame31():*
        {
            this.self.updateAttackBoxStats(1, {"power":58});
        }

        internal function frame36():*
        {
            this.self.updateAttackStats({"air_ease":2});
            SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
        }

        internal function frame41():*
        {
            this.self.updateAttackStats({"air_ease":2});
        }

        internal function frame44():*
        {
            this.self.updateAttackStats({
                "air_ease":-1,
                "rocket":false,
                "allowControl":true
            });
            this.self.resetRotation();
            this.self.createTimer(1, 0, this.self.toLand, {"condition":this.self.isOnGround});
            SSF2API.destroyTimer(this.self, this.goldDust);
        }

        internal function frame57():*
        {
            this.self.resetRotation();
            this.self.endAttack();
        }


    }
}//package ness_fla


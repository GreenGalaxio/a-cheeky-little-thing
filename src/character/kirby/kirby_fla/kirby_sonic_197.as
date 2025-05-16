// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_sonic_197

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
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
    import flash.xml.*;

    public dynamic class kirby_sonic_197 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var homing:MovieClip;
        public var self:*;
        public var ableToHome:*;
        public var hasTarget:*;
        public var controls:*;
        public var canRelease:*;
        public var count:int;

        public function kirby_sonic_197()
        {
            addFrameScript(0, this.frame1, 30, this.frame31, 31, this.frame32, 35, this.frame36, 36, this.frame37, 48, this.frame49, 49, this.frame50, 57, this.frame58, 62, this.frame63, 63, this.frame64, 66, this.frame67, 81, this.frame82);
        }

        public function attackHit(_arg_1:*=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.attackHit);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.groundTouch);
            this.gotoAndStop("afterHit");
        }

        public function groundTouch(_arg_1:*=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.attackHit);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.groundTouch);
            this.gotoAndStop("continue");
        }

        public function homingRise():void
        {
            this.controls = this.self.getControls();
            this.self.setYSpeed(-5);
            if (this.currentFrame > 11)
            {
                this.canRelease = true;
            };
            if (((this.canRelease) && (!(this.controls.BUTTON1))))
            {
                this.ableToHome = true;
            };
            if (this.ableToHome)
            {
                this.self.homeTowardsTarget(20, this.self.getHomingTarget());
                this.gotoAndPlay("homing");
                SSF2API.destroyTimer(this.self, this.homingRise);
            };
        }

        public function startHoming(_arg_1:*=null):*
        {
            this.hasTarget = true;
            SSF2API.removeEventListener(this.self, SSF2Event.HOMING_TARGET, this.startHoming);
        }

        public function afterImage():void
        {
            this.self.attachEffect("sonic_afterimage1");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.ableToHome = false;
            this.hasTarget = false;
            this.controls = null;
            this.canRelease = false;
            if (((this.self) && (SSF2API.isReady())))
            {
                this.controls = this.self.getControls();
                SSF2API.addEventListener(this.self, SSF2Event.HOMING_TARGET, this.startHoming);
                this.self.playAttackSound(1);
                this.self.setXSpeed((this.self.getXSpeed() * 0.25));
                this.self.setYSpeed(-1);
                this.self.unnattachFromGround();
                SSF2API.createTimer(this.self, 1, 30, this.homingRise);
            };
        }

        internal function frame31():*
        {
            this.self.resetMovement();
            if (!this.hasTarget)
            {
                this.self.playAttackSound(2);
                this.self.playVoiceSound(1);
                gotoAndPlay("fail");
            };
            this.canRelease = true;
            this.ableToHome = true;
        }

        internal function frame32():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.HOMING_TARGET, this.startHoming);
            this.count = 0;
            this.ableToHome = true;
            this.self.playAttackSound(2);
            this.self.playVoiceSound(1);
            this.self.updateAttackStats({"air_ease":-1});
            SSF2API.destroyTimer(this.self, this.homingRise);
            SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT, this.attackHit);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.groundTouch);
            SSF2API.createTimer(this.self, 1, -1, this.afterImage);
        }

        internal function frame36():*
        {
            this.count++;
            if ((((!(this.self.getXSpeed() == 0)) && (!(this.self.getYSpeed() == 0))) && (this.count < 4)))
            {
                gotoAndPlay("loop");
            }
            else
            {
                if (!this.hasTarget)
                {
                    gotoAndPlay("fail");
                }
                else
                {
                    gotoAndPlay("failfromhome");
                };
            };
        }

        internal function frame37():*
        {
            SSF2API.destroyTimer(this.self, this.afterImage);
            this.self.resetMovement();
            this.self.setYSpeed(-15);
            this.self.setXSpeed(5, false);
            this.self.updateAttackStats({
                "air_ease":-1,
                "allowControl":true
            });
        }

        internal function frame49():*
        {
            this.self.endAttack();
        }

        internal function frame50():*
        {
            this.self.resetMovement();
            SSF2API.destroyTimer(this.self, this.homingRise);
            this.self.setXSpeed(15, false);
            this.self.setYSpeed(5);
            this.self.updateAttackStats({"air_ease":-1});
        }

        internal function frame58():*
        {
            SSF2API.destroyTimer(this.self, this.afterImage);
        }

        internal function frame63():*
        {
            this.self.setYSpeed(0);
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            this.self.setXSpeed(0);
            this.self.setAttackEnabled(false, "kirby_sonic");
            this.self.endAttack();
        }

        internal function frame64():*
        {
            this.self.resetMovement();
            SSF2API.playSound("new_sonic_stompland");
            SSF2API.destroyTimer(this.self, this.afterImage);
        }

        internal function frame67():*
        {
            this.self.unnattachFromGround();
            this.self.setYSpeed(-15);
            this.self.setXSpeed(5, false);
            this.self.updateAttackStats({
                "air_ease":0,
                "allowControl":true
            });
        }

        internal function frame82():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla


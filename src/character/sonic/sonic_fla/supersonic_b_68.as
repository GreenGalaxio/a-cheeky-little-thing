// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.supersonic_b_68

package sonic_fla
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

    public dynamic class supersonic_b_68 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var homing:MovieClip;
        public var self:*;
        public var ableToHome:*;
        public var hasTarget:*;
        public var controls:*;
        public var canRelease:*;
        public var effect:*;
        public var count:int;

        public function supersonic_b_68()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 16, this.frame17, 17, this.frame18, 21, this.frame22, 23, this.frame24, 30, this.frame31);
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
            this.self.endAttack();
        }

        public function startHoming(_arg_1:*=null):*
        {
            this.hasTarget = true;
            SSF2API.removeEventListener(this.self, SSF2Event.HOMING_TARGET, this.startHoming);
        }

        public function afterImage():void
        {
            this.effect = this.self.attachEffect("super_sonic_afterimage");
            this.self.applyPalette(this.effect);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.ableToHome = false;
            this.hasTarget = false;
            this.controls = null;
            this.canRelease = false;
            this.effect = null;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = this.self.getControls();
                SSF2API.addEventListener(this.self, SSF2Event.HOMING_TARGET, this.startHoming);
                this.self.setXSpeed((this.self.getXSpeed() * 0.25));
                this.self.setYSpeed(-1);
            };
        }

        internal function frame2():*
        {
            this.self.playAttackSound(2);
            this.self.homeTowardsTarget(30, this.self.getHomingTarget());
            this.gotoAndPlay("homing");
        }

        internal function frame17():*
        {
            this.self.endAttack();
        }

        internal function frame18():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.HOMING_TARGET, this.startHoming);
            this.count = 0;
            this.self.playAttackSound(2);
            SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT, this.attackHit);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.groundTouch);
            SSF2API.createTimer(this.self, 1, -1, this.afterImage);
        }

        internal function frame22():*
        {
            this.count++;
            if ((((!(this.self.getXSpeed() == 0)) && (!(this.self.getYSpeed() == 0))) && (this.count < 4)))
            {
                gotoAndPlay("loop");
            };
        }

        internal function frame24():*
        {
            SSF2API.destroyTimer(this.self, this.afterImage);
        }

        internal function frame31():*
        {
            this.self.endAttack();
        }


    }
}//package sonic_fla


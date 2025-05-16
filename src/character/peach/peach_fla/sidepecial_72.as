// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//peach_fla.sidepecial_72

package peach_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
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

    public dynamic class sidepecial_72 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var handBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var hasHit:Boolean;
        public var newStats:Object;
        public var ungrounded:Boolean;

        public function sidepecial_72()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 4, this.frame5, 11, this.frame12, 13, this.frame14, 23, this.frame24, 27, this.frame28, 34, this.frame35, 35, this.frame36, 36, this.frame37, 37, this.frame38, 44, this.frame45, 45, this.frame46, 50, this.frame51);
        }

        public function jumpToAfterHit(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.jumpToAfterHit);
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.jumpToAfterHit);
            this.self.updateAttackStats({
                "allowControl":false,
                "xSpeedDecay":0,
                "xSpeedDecayAir":0
            });
            this.gotoAndStop("afterHit");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.hasHit = false;
                this.self.playVoiceSound(1);
                this.self.setAttackEnabled(false, "b_forward");
                this.self.setAttackEnabled(false, "b_forward_air");
            };
        }

        internal function frame3():*
        {
            this.newStats = {
                "xSpeedDecay":-2.45,
                "xSpeedDecayAir":-2.45
            };
            this.self.updateAttackStats(this.newStats);
            this.self.setXSpeed(-8, false);
            this.self.setYSpeed(-8);
        }

        internal function frame5():*
        {
            this.newStats = {"air_ease":2};
            this.self.updateAttackStats(this.newStats);
        }

        internal function frame12():*
        {
            this.newStats = {"air_ease":0};
            this.self.updateAttackStats(this.newStats);
            this.self.playVoiceSound(2);
            this.self.playAttackSound(2);
            SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT, this.jumpToAfterHit);
            SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.jumpToAfterHit);
        }

        internal function frame14():*
        {
            this.newStats = {
                "xSpeedDecay":-2.45,
                "xSpeedDecayAir":-2.45
            };
            this.self.updateAttackStats(this.newStats);
            this.self.setXSpeed(23, false);
        }

        internal function frame24():*
        {
            this.ungrounded = false;
            this.ungrounded = this.self.isOnGround();
            if (!this.ungrounded)
            {
                gotoAndPlay("airslow");
            };
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.jumpToAfterHit);
        }

        internal function frame28():*
        {
            this.self.setXSpeed(0, false);
        }

        internal function frame35():*
        {
            this.self.endAttack();
        }

        internal function frame36():*
        {
            this.hasHit = true;
            this.self.setXSpeed(-6, false);
            this.self.playAttackSound(1);
            this.self.unnattachFromGround();
            if (this.self.isFacingRight())
            {
                this.self.attachEffect("newheart", {"x":30});
            }
            else
            {
                this.self.attachEffect("newheart", {"x":-30});
            };
        }

        internal function frame37():*
        {
            this.self.setXSpeed(-3, false);
        }

        internal function frame38():*
        {
            this.newStats = {
                "allowControl":true,
                "allowFastFall":true
            };
            this.self.updateAttackStats(this.newStats);
            this.self.setXSpeed(-3, false);
        }

        internal function frame45():*
        {
            this.self.endAttack();
        }

        internal function frame46():*
        {
            this.newStats = {"air_ease":-1};
            this.self.updateAttackStats(this.newStats);
        }

        internal function frame51():*
        {
            this.self.endAttack();
        }


    }
}//package peach_fla


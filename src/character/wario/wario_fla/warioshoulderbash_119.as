// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.warioshoulderbash_119

package wario_fla
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

    public dynamic class warioshoulderbash_119 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var self:*;
        public var hasHit:*;
        public var controls:Object;
        public var isOnGround:*;
        public var startOnGround:*;
        public var loopCount:*;
        public var newStats:*;

        public function warioshoulderbash_119()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6, 8, this.frame9, 12, this.frame13, 16, this.frame17, 20, this.frame21, 24, this.frame25, 28, this.frame29, 32, this.frame33, 36, this.frame37, 40, this.frame41, 41, this.frame42, 47, this.frame48, 48, this.frame49, 59, this.frame60);
        }

        public function setXSpeedConstant():void
        {
            if (this.startOnGround)
            {
                this.self.setXSpeed(7, false);
            }
            else
            {
                this.self.setXSpeed(12, false);
            };
        }

        public function jumpToAfterHit(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.jumpToAfterHit);
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.jumpToAfterHit);
            gotoAndPlay("afterHit");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.hasHit = false;
            this.loopCount = 0;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.startOnGround = this.self.isOnGround();
                this.isOnGround = this.self.isOnGround();
                this.self.playVoiceSound(1);
                this.controls = this.self.getControls();
            };
        }

        internal function frame5():*
        {
            this.self.setXSpeed(15, false);
            SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.jumpToAfterHit);
            SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.jumpToAfterHit);
        }

        internal function frame6():*
        {
            this.self.updateAttackStats({"allowJump":true});
        }

        internal function frame9():*
        {
            this.newStats = {
                "direction":37,
                "power":15,
                "damage":10,
                "kbConstant":80
            };
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame13():*
        {
            this.newStats = {
                "direction":37,
                "power":25,
                "damage":12,
                "kbConstant":80
            };
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame17():*
        {
            this.newStats = {
                "direction":37,
                "power":30,
                "damage":14,
                "kbConstant":80
            };
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame21():*
        {
            this.newStats = {
                "direction":37,
                "power":35,
                "damage":16,
                "kbConstant":80
            };
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame25():*
        {
            this.newStats = {
                "direction":37,
                "power":40,
                "damage":18,
                "kbConstant":80
            };
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame29():*
        {
            this.newStats = {
                "direction":37,
                "power":45,
                "damage":20,
                "kbConstant":80
            };
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame33():*
        {
            this.newStats = {
                "direction":37,
                "power":50,
                "damage":22,
                "kbConstant":80
            };
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame37():*
        {
            this.newStats = {
                "direction":37,
                "power":55,
                "damage":24,
                "kbConstant":80
            };
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame41():*
        {
            gotoAndPlay("end");
        }

        internal function frame42():*
        {
            this.isOnGround = this.self.isOnGround();
            SSF2API.destroyTimer(this.self, this.setXSpeedConstant);
            this.self.setXSpeed(-5, false);
            if (!this.isOnGround)
            {
                this.self.setYSpeed(-7);
            };
            this.self.updateAttackStats({"allowJump":false});
            this.hasHit = true;
        }

        internal function frame48():*
        {
            this.self.setAttackEnabled(false, "b_forward");
            this.self.setAttackEnabled(false, "b_forward_air");
            this.self.endAttack();
        }

        internal function frame49():*
        {
            this.isOnGround = this.self.isOnGround();
            this.self.updateAttackStats({"allowJump":false});
            if (this.isOnGround == false)
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            };
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.jumpToAfterHit);
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.jumpToAfterHit);
        }

        internal function frame60():*
        {
            this.self.endAttack();
        }


    }
}//package wario_fla


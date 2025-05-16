// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.dspec_ground_ichigo_158

package ichigo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.geom.*;
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

    public dynamic class dspec_ground_ichigo_158 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var controls:Object;
        public var hasHit:Boolean;
        public var dashCount:Number;

        public function dspec_ground_ichigo_158()
        {
            addFrameScript(0, this.frame1, 10, this.frame11, 13, this.frame14, 15, this.frame16, 16, this.frame17, 18, this.frame19, 20, this.frame21, 23, this.frame24, 27, this.frame28, 33, this.frame34);
        }

        public function toAfterHit(_arg_1:Event=null):void
        {
            this.self.removeEventListener(SSF2Event.ATTACK_CONNECT, this.toAfterHit);
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.updateAttackStats({"allowControl":false});
            gotoAndPlay("continue");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = this.self.getControls();
                this.hasHit = false;
                this.dashCount = 20;
                this.self.addEventListener(SSF2Event.ATTACK_CONNECT, this.toAfterHit);
            };
        }

        internal function frame11():*
        {
            this.self.unnattachFromGround();
            this.self.playAttackSound(3);
            this.self.updateAttackStats({"air_ease":0});
        }

        internal function frame14():*
        {
            this.controls = this.self.getControls();
            this.dashCount++;
            if (this.dashCount > 26)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame16():*
        {
            if (this.controls.BUTTON1)
            {
                gotoAndPlay("up");
            }
            else
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame17():*
        {
            this.self.resetMovement();
            this.self.updateAttackStats({"air_ease":-1});
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.toAfterHit);
            this.self.setYSpeed((this.dashCount * -1.6));
        }

        internal function frame19():*
        {
            this.self.setYSpeed(30);
            this.self.playAttackSound(1);
            this.self.playVoiceSound(1);
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "damage":6,
                "priority":4,
                "hitStun":4,
                "selfHitStun":3,
                "effect_id":"effect_heavyHit",
                "direction":270,
                "power":40,
                "kbConstant":95,
                "effectSound":"kick"
            });
        }

        internal function frame21():*
        {
            this.self.updateAttackStats({"allowControl":true});
        }

        internal function frame24():*
        {
            gotoAndPlay("falling");
        }

        internal function frame28():*
        {
            this.self.playAttackSound(2);
            this.self.updateAttackStats({"allowControl":false});
        }

        internal function frame34():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla


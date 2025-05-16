// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_bdownair_153

package sonic_fla
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

    public dynamic class sonic_bdownair_153 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var self:*;
        public var effect:*;
        public var hasHit:*;

        public function sonic_bdownair_153()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 14, this.frame15, 75, this.frame76, 76, this.frame77, 77, this.frame78, 80, this.frame81, 83, this.frame84, 84, this.frame85, 87, this.frame88, 94, this.frame95);
        }

        public function afterImage():void
        {
            this.effect = this.self.attachEffect("bounceAfterImage");
            this.self.applyPalette(this.effect);
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.jumpToAfterHit);
            this.self.updateAttackStats({"allowControl":false});
            gotoAndPlay("continue");
        }

        public function jumpToAfterHit(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.jumpToAfterHit);
            this.self.updateAttackStats({"allowControl":false});
            gotoAndPlay("afterHit");
        }

        public function yConstant():void
        {
            this.self.setYSpeed(25);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.effect = null;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.hasHit = false;
                this.self.playVoiceSound(1);
                this.self.setYSpeed(-6);
            };
        }

        internal function frame6():*
        {
            this.self.playAttackSound(2);
            SSF2API.createTimer(this.self, 1, 999, this.afterImage);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.jumpToAfterHit);
        }

        internal function frame15():*
        {
            SSF2API.createTimer(this.self, 1, 0, this.yConstant);
        }

        internal function frame76():*
        {
            gotoAndPlay("redo");
        }

        internal function frame77():*
        {
            SSF2API.destroyTimer(this.self, this.afterImage);
            this.self.unnattachFromGround();
            SSF2API.playSound("new_sonic_stompland");
            SSF2API.destroyTimer(this.self, this.yConstant);
        }

        internal function frame78():*
        {
            this.self.unnattachFromGround();
            this.self.setYSpeed(-12);
        }

        internal function frame81():*
        {
            this.self.updateAttackStats({"airCancel":true});
        }

        internal function frame84():*
        {
            this.self.endAttack();
        }

        internal function frame85():*
        {
            this.hasHit = true;
            SSF2API.destroyTimer(this.self, this.yConstant);
        }

        internal function frame88():*
        {
            this.self.updateAttackStats({"airCancel":true});
        }

        internal function frame95():*
        {
            this.self.endAttack();
        }


    }
}//package sonic_fla


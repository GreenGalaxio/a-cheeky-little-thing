// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.wariodair_127

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

    public dynamic class wariodair_127 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;
        public var hasHit:*;

        public function wariodair_127()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 6, this.frame7, 9, this.frame10, 18, this.frame19, 19, this.frame20, 33, this.frame34, 34, this.frame35, 43, this.frame44);
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.updateAttackStats({"allowControl":false});
            gotoAndPlay("continue");
        }

        public function jumpToAfterHit(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.jumpToAfterHit);
            this.self.updateAttackStats({"allowControl":false});
            gotoAndPlay("afterHit");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
            this.hasHit = false;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            };
        }

        internal function frame6():*
        {
            this.self.setXSpeed(0);
            this.self.playAttackSound(1);
            this.self.updateAttackStats({
                "air_ease":-1,
                "allowControl":true
            });
        }

        internal function frame7():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
        }

        internal function frame10():*
        {
            if ((((this.playsound > 0.2) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
            {
                this.self.playVoiceSound(1);
                this.self.setGlobalVariable("audio", 1);
            };
            if ((((this.playsound > 0.4) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
            {
                this.self.playVoiceSound(2);
                this.self.setGlobalVariable("audio", 2);
            };
            if ((((this.playsound > 0.6) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
            {
                this.self.playVoiceSound(3);
                this.self.setGlobalVariable("audio", 3);
            };
            if ((((this.playsound > 0.8) && (this.playsound <= 1)) && (!(this.audio == 4))))
            {
                this.self.playVoiceSound(4);
                this.self.setGlobalVariable("audio", 4);
            };
            this.self.setXSpeed(0);
            this.self.updateAttackStats({
                "allowControl":true,
                "air_ease":-1
            });
            this.self.setYSpeed(15);
            SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.jumpToAfterHit);
        }

        internal function frame19():*
        {
            this.gotoAndPlay("again");
        }

        internal function frame20():*
        {
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            SSF2API.shakeCamera(10);
            SSF2API.playSound("brawl_kick_m");
            this.self.updateAttackStats({"cancelWhenAirborne":true});
        }

        internal function frame34():*
        {
            this.self.endAttack();
        }

        internal function frame35():*
        {
            this.hasHit = true;
            this.self.setXSpeed(0);
            this.self.updateAttackStats({"air_ease":-1});
            this.self.setYSpeed(-9);
            this.self.updateAttackStats({"allowControl":true});
        }

        internal function frame44():*
        {
            this.self.endAttack();
        }


    }
}//package wario_fla


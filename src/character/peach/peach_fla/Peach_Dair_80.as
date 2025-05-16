// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//peach_fla.Peach_Dair_80

package peach_fla
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

    public dynamic class Peach_Dair_80 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;
        public var newStats:Object;

        public function Peach_Dair_80()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 5, this.frame6, 9, this.frame10, 14, this.frame15, 16, this.frame17, 20, this.frame21, 27, this.frame28);
        }

        public function jumpToContinue(_arg_1:*=null):void
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.updateAttackStats({
                "allowControl":false,
                "cancelWhenAirborne":true
            });
            this.gotoAndPlay("continue");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
        }

        internal function frame2():*
        {
            this.self.playAttackSound(1);
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
        }

        internal function frame6():*
        {
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame10():*
        {
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame15():*
        {
            this.newStats = {
                "damage":5,
                "direction":85,
                "kbConstant":15,
                "power":90,
                "hitStun":1,
                "hitLag":-1.1,
                "selfHitStun":1,
                "effectSound":"brawl_kick_m"
            };
            this.self.updateAttackBoxStats(1, this.newStats);
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame17():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame21():*
        {
            this.self.endAttack();
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }


    }
}//package peach_fla


// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.goku_down_air_407

package goku_fla
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

    public dynamic class goku_down_air_407 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var attackBox3:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var hitBox7:MovieClip;
        public var hitBox8:MovieClip;
        public var hitBox9:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;
        public var slideDist:Number;
        public var newStats:Object;

        public function goku_down_air_407()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 18, this.frame19, 19, this.frame20, 20, this.frame21, 29, this.frame30);
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
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.slideDist = 18;
                this.self.setYSpeed(-8);
            };
            if (((SSF2API.isReady()) && (this.self)))
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            };
        }

        internal function frame6():*
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
            this.self.setYSpeed(10);
            this.self.setXSpeed(8, false);
            this.self.playAttackSound(1);
            this.self.playAttackSound(2);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
        }

        internal function frame9():*
        {
            this.slideDist--;
            this.slideDist--;
        }

        internal function frame10():*
        {
            this.slideDist--;
            this.slideDist--;
        }

        internal function frame11():*
        {
            this.slideDist--;
        }

        internal function frame12():*
        {
            this.slideDist--;
        }

        internal function frame13():*
        {
            this.slideDist--;
        }

        internal function frame14():*
        {
            this.slideDist--;
        }

        internal function frame15():*
        {
            this.slideDist--;
        }

        internal function frame16():*
        {
            this.slideDist--;
            this.slideDist--;
        }

        internal function frame17():*
        {
            this.slideDist--;
        }

        internal function frame19():*
        {
            this.self.endAttack();
        }

        internal function frame20():*
        {
            this.self.resetMovement();
            this.self.setYSpeed(0);
            this.newStats = {
                "direction":45,
                "damage":3,
                "hitStun":1,
                "selfHitStun":1
            };
            this.self.updateAttackBoxStats(1, this.newStats);
            this.self.setXSpeed(this.slideDist, false);
            this.self.playAttackSound(3);
        }

        internal function frame21():*
        {
            this.self.attachEffectOverlay("goku_dairEffect");
            this.self.refreshAttackID();
        }

        internal function frame30():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla


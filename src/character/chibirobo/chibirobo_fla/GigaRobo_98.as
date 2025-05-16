// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.GigaRobo_98

package chibirobo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.display.*;
    import flash.media.*;
    import flash.geom.*;
    import flash.events.*;
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

    public dynamic class GigaRobo_98 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var camBox:MovieClip;
        public var loop:*;
        public var self:*;
        public var audio:Number;
        public var playsound:Number;
        public var character:*;

        public function GigaRobo_98()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 24, this.frame25, 36, this.frame37, 50, this.frame51, 51, this.frame52, 65, this.frame66);
        }

        public function toLand(_arg_1:*=null):void
        {
            this.gotoAndPlay("land");
        }

        public function gigaVoice():void
        {
            this.playsound = SSF2API.random();
            if ((((this.playsound > 0) && (this.playsound <= 0.14)) && (!(this.audio == 1))))
            {
                SSF2API.playSound("giga_voice1", true);
                this.audio = 1;
            };
            if ((((this.playsound > 0.14) && (this.playsound <= 0.28)) && (!(this.audio == 2))))
            {
                SSF2API.playSound("giga_voice2", true);
                this.audio = 2;
            };
            if ((((this.playsound > 0.28) && (this.playsound <= 0.42)) && (!(this.audio == 3))))
            {
                SSF2API.playSound("giga_voice3", true);
                this.audio = 3;
            };
            if ((((this.playsound > 0.42) && (this.playsound <= 56)) && (!(this.audio == 4))))
            {
                SSF2API.playSound("giga_voice4", true);
                this.audio = 4;
            };
            if ((((this.playsound > 0.56) && (this.playsound <= 70)) && (!(this.audio == 5))))
            {
                SSF2API.playSound("giga_voice5", true);
                this.audio = 5;
            };
            if ((((this.playsound > 0.7) && (this.playsound <= 84)) && (!(this.audio == 6))))
            {
                SSF2API.playSound("giga_voice6", true);
                this.audio = 6;
            };
            if ((((this.playsound > 0.84) && (this.playsound <= 1)) && (!(this.audio == 7))))
            {
                SSF2API.playSound("giga_voice7", true);
                this.audio = 7;
            };
        }

        public function up(_arg_1:*=null):void
        {
            this.self.setYSpeed((this.self.getYSpeed() * 2));
        }

        internal function frame1():*
        {
            this.loop = 0;
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toLand);
                this.self.addToCamera();
            };
        }

        internal function frame3():*
        {
            this.gotoAndPlay("fall");
        }

        internal function frame4():*
        {
            SSF2API.playSound("giga_step");
        }

        internal function frame25():*
        {
            this.gigaVoice();
        }

        internal function frame37():*
        {
            this.self.refreshAttackID();
            this.self.createTimer(2, 5, function ():*
            {
                SSF2API.shakeCamera(10);
            });
            SSF2API.playSound("giga_step");
        }

        internal function frame51():*
        {
            if (this.loop < 10)
            {
                this.loop++;
                this.gotoAndPlay("idle");
            };
        }

        internal function frame52():*
        {
            this.self.setYSpeed(-5);
            SSF2API.createTimer(this.self, 1, -1, this.up);
            this.self.removeFromCamera();
            SSF2API.playSound("giga_exit");
        }

        internal function frame66():*
        {
            this.self.destroy();
        }


    }
}//package chibirobo_fla


// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.ness_forwardthrow_64

package ness_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.system.*;
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
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class ness_forwardthrow_64 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var playsound:Number;
        public var audio:Number;

        public function ness_forwardthrow_64()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 6, this.frame7, 9, this.frame10, 15, this.frame16, 16, this.frame17, 28, this.frame29);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
                this.self.playAttackSound(1);
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
        }

        internal function frame3():*
        {
            this.self.playVoiceSound(5);
        }

        internal function frame4():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame7():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame10():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame16():*
        {
            SSF2API.shakeCamera(9);
        }

        internal function frame17():*
        {
            this.xframe = "attack";
            this.self.playAttackSound(2);
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

        internal function frame29():*
        {
            this.self.endAttack();
        }


    }
}//package ness_fla


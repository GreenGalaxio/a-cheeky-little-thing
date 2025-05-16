// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//pikachu_fla.pika_FThrow_45

package pikachu_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
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

    public dynamic class pika_FThrow_45 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;

        public function pika_FThrow_45()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 7, this.frame8, 11, this.frame12, 16, this.frame17, 20, this.frame21, 25, this.frame26);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
        }

        internal function frame7():*
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
        }

        internal function frame8():*
        {
            this.self.playAttackSound(1);
            this.self.playAttackSound(2);
            SSF2API.shakeCamera(9);
        }

        internal function frame12():*
        {
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
            this.self.playAttackSound(2);
        }

        internal function frame17():*
        {
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
            this.self.playAttackSound(2);
        }

        internal function frame21():*
        {
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
            this.self.playAttackSound(2);
            this.self.updateAttackBoxStats(1, {"hasEffect":true});
            SSF2API.shakeCamera(9);
        }

        internal function frame26():*
        {
            this.self.endAttack();
        }


    }
}//package pikachu_fla


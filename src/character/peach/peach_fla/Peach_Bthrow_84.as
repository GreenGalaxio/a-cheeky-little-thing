// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//peach_fla.Peach_Bthrow_84

package peach_fla
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

    public dynamic class Peach_Bthrow_84 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;
        public var newStats:Object;

        public function Peach_Bthrow_84()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 10, this.frame11, 17, this.frame18, 18, this.frame19);
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

        internal function frame8():*
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

        internal function frame11():*
        {
            this.newStats = {
                "bypassNonGrabbed":true,
                "hasEffect":true,
                "direction":140,
                "damage":9,
                "power":70,
                "kbConstant":40,
                "effect_id":"effect_hit2",
                "effectSound":"brawl_kick_m"
            };
            this.self.updateAttackBoxStats(1, this.newStats);
            SSF2API.shakeCamera(8);
            this.self.refreshAttackID();
        }

        internal function frame18():*
        {
            this.self.flip();
        }

        internal function frame19():*
        {
            this.self.endAttack();
        }


    }
}//package peach_fla


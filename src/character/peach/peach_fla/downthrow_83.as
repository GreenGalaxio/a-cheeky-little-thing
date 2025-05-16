// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//peach_fla.downthrow_83

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

    public dynamic class downthrow_83 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;
        public var newStats:Object;

        public function downthrow_83()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6, 14, this.frame15, 20, this.frame21, 27, this.frame28);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playAttackSound(1);
                this.self.swapDepthsWithGrabbedOpponent(false);
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
        }

        internal function frame5():*
        {
            this.self.swapDepthsWithGrabbedOpponent(true);
        }

        internal function frame6():*
        {
        }

        internal function frame15():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame21():*
        {
            this.newStats = {
                "bypassNonGrabbed":true,
                "hasEffect":true,
                "direction":118,
                "damage":7,
                "power":80,
                "kbConstant":50,
                "weightKB":0,
                "effect_id":"effect_heavyHit",
                "effectSound":"brawl_kick_m"
            };
            this.self.updateAttackBoxStats(1, this.newStats);
            SSF2API.shakeCamera(8);
            this.self.refreshAttackID();
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }


    }
}//package peach_fla


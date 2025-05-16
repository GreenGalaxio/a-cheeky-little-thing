// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//peach_fla.Peach_Fthrow_82

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

    public dynamic class Peach_Fthrow_82 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;
        public var newStats:Object;

        public function Peach_Fthrow_82()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 7, this.frame8, 11, this.frame12);
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

        internal function frame4():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame8():*
        {
            this.newStats = {
                "bypassNonGrabbed":true,
                "hasEffect":true,
                "direction":45,
                "damage":8,
                "power":41,
                "kbConstant":140,
                "effect_id":"effect_hit2",
                "effectSound":"peach_slap"
            };
            this.self.updateAttackBoxStats(1, this.newStats);
            this.self.refreshAttackID();
            SSF2API.shakeCamera(5);
        }

        internal function frame12():*
        {
            this.self.endAttack();
        }


    }
}//package peach_fla


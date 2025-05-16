// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.firemarioftilt_53

package mario_fla
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

    public dynamic class firemarioftilt_53 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;

        public function firemarioftilt_53()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 7, this.frame8, 21, this.frame22);
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

        internal function frame2():*
        {
            SSF2API.playSound("mario_heeyah");
        }

        internal function frame8():*
        {
            SSF2API.playSound("brawl_swing_l");
        }

        internal function frame22():*
        {
            this.self.endAttack();
        }


    }
}//package mario_fla


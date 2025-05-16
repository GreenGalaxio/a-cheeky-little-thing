// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmwalk_18

package blackmage_fla
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

    public dynamic class bmwalk_18 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var speed:Number;

        public function bmwalk_18()
        {
            addFrameScript(0, this.frame1, 9, this.frame10, 21, this.frame22, 24, this.frame25);
        }

        public function boostCheck():void
        {
            if (this.speed > 3.5)
            {
                this.self.setGlobalVariable("Boost", (this.speed - 0.5));
                this.speed = this.self.getGlobalVariable("Boost");
                this.self.setXSpeed(this.speed, false);
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((parent) && (SSF2API.isReady())))
            {
                this.speed = this.self.getGlobalVariable("Boost");
                SSF2API.createTimer(this.self, 1, 0, this.boostCheck);
            };
        }

        internal function frame10():*
        {
            SSF2API.playSound("bm_footstep");
        }

        internal function frame22():*
        {
            SSF2API.playSound("bm_footstep");
        }

        internal function frame25():*
        {
            gotoAndPlay("loop");
        }


    }
}//package blackmage_fla


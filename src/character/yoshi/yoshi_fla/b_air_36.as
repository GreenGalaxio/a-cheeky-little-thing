// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//yoshi_fla.b_air_36

package yoshi_fla
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

    public dynamic class b_air_36 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var grabBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var continuePlaying:Boolean;

        public function b_air_36()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 18, this.frame19, 19, this.frame20, 22, this.frame23, 33, this.frame34, 34, this.frame35);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((this.self) && (SSF2API.isReady())))
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.continuePlaying = false;
            };
        }

        internal function frame5():*
        {
            if (this.self.getGrabbedOpponent())
            {
                gotoAndPlay("grabbed");
            };
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame6():*
        {
            if (this.self.getGrabbedOpponent())
            {
                gotoAndPlay("grabbed");
            };
        }

        internal function frame7():*
        {
            if (this.self.getGrabbedOpponent())
            {
                gotoAndPlay("grabbed");
            };
        }

        internal function frame8():*
        {
            if (this.self.getGrabbedOpponent())
            {
                gotoAndPlay("grabbed");
            };
        }

        internal function frame9():*
        {
            if (this.self.getGrabbedOpponent())
            {
                gotoAndPlay("grabbed");
            };
        }

        internal function frame19():*
        {
            this.self.endAttack();
        }

        internal function frame20():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            this.self.swapDepthsWithGrabbedOpponent(true);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
        }

        internal function frame23():*
        {
            this.self.playAttackSound(2);
            this.self.getGrabbedOpponent().getMC().visible = false;
        }

        internal function frame34():*
        {
        }

        internal function frame35():*
        {
            this.self.endAttack();
        }


    }
}//package yoshi_fla


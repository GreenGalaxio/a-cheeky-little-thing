// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_yoshi_208

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
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
    import flash.xml.*;

    public dynamic class kirby_yoshi_208 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var grabBox:MovieClip;
        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var continuePlaying:*;

        public function kirby_yoshi_208()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 19, this.frame20, 20, this.frame21, 23, this.frame24, 32, this.frame33, 34, this.frame35, 35, this.frame36);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.continuePlaying = false;
            };
        }

        internal function frame6():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
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

        internal function frame10():*
        {
            if (this.self.getGrabbedOpponent())
            {
                gotoAndPlay("grabbed");
            };
        }

        internal function frame20():*
        {
            this.self.endAttack();
        }

        internal function frame21():*
        {
            this.self.swapDepthsWithGrabbedOpponent(true);
        }

        internal function frame24():*
        {
            this.self.playAttackSound(2);
            this.self.getGrabbedOpponent().getMC().visible = false;
        }

        internal function frame33():*
        {
            this.self.playVoiceSound(2);
        }

        internal function frame35():*
        {
        }

        internal function frame36():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla


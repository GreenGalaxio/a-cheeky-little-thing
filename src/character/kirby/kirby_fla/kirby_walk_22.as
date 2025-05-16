// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_walk_22

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

    public dynamic class kirby_walk_22 extends MovieClip 
    {

        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var normalwalk:*;

        public function kirby_walk_22()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 18, this.frame19, 29, this.frame30, 30, this.frame31, 36, this.frame37, 51, this.frame52, 59, this.frame60);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.normalwalk = true;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("kirbyPeachUsed", false);
            };
        }

        internal function frame4():*
        {
            SSF2API.playSound("kirby_footstep");
        }

        internal function frame19():*
        {
            SSF2API.playSound("kirby_footstep");
        }

        internal function frame30():*
        {
            gotoAndPlay("startwalk");
        }

        internal function frame31():*
        {
            this.normalwalk = false;
        }

        internal function frame37():*
        {
            SSF2API.playSound("kirby_footstep");
        }

        internal function frame52():*
        {
            SSF2API.playSound("kirby_footstep");
        }

        internal function frame60():*
        {
            gotoAndPlay("startwalk2");
        }


    }
}//package kirby_fla


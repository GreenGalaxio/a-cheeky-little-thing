// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.Bomberman_BThrow_49

package bomberman_fla
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

    public dynamic class Bomberman_BThrow_49 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;

        public function Bomberman_BThrow_49()
        {
            addFrameScript(0, this.frame1, 8, this.frame9, 11, this.frame12, 18, this.frame19, 31, this.frame32);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.swapDepthsWithGrabbedOpponent(true);
            };
        }

        internal function frame9():*
        {
            this.self.swapDepthsWithGrabbedOpponent(false);
        }

        internal function frame12():*
        {
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.swapDepthsWithGrabbedOpponent(true);
            };
        }

        internal function frame19():*
        {
            this.self.swapDepthsWithGrabbedOpponent(false);
        }

        internal function frame32():*
        {
            this.self.endAttack();
        }


    }
}//package bomberman_fla


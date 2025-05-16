// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_dead_special_119

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

    public dynamic class mario_dead_special_119 extends MovieClip 
    {

        public var itemBox:MovieClip;
        public var hitBox:MovieClip;
        public var hand:MovieClip;
        public var self:*;
        public var ready:*;

        public function mario_dead_special_119()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 5, this.frame6, 13, this.frame14, 17, this.frame18);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.ready = false;
        }

        internal function frame4():*
        {
            stop();
            this.ready = true;
        }

        internal function frame5():*
        {
            gotoAndStop("dead");
        }

        internal function frame6():*
        {
            if (!this.self.isForcedCrash())
            {
                this.self.setIntangibility(true);
            };
        }

        internal function frame14():*
        {
            if (!this.self.isForcedCrash())
            {
                this.self.setIntangibility(false);
            };
        }

        internal function frame18():*
        {
            this.self.endAttack();
        }


    }
}//package mario_fla


// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.MegaDead_gif_97

package megaman_fla
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

    public dynamic class MegaDead_gif_97 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var ready:*;

        public function MegaDead_gif_97()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6, 6, this.frame7, 17, this.frame18, 20, this.frame21);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.ready = false;
        }

        internal function frame5():*
        {
            stop();
            this.ready = true;
        }

        internal function frame6():*
        {
            gotoAndStop("dead");
        }

        internal function frame7():*
        {
            if (!this.self.isForcedCrash())
            {
                this.self.setIntangibility(true);
            };
        }

        internal function frame18():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame21():*
        {
            this.self.endAttack();
        }


    }
}//package megaman_fla


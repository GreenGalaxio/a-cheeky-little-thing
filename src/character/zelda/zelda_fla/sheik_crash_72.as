// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zelda_fla.sheik_crash_72

package zelda_fla
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

    public dynamic class sheik_crash_72 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var hitBox7:MovieClip;
        public var hitBox8:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var ready:*;

        public function sheik_crash_72()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 5, this.frame6, 6, this.frame7, 7, this.frame8, 17, this.frame18, 21, this.frame22);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame2():*
        {
            this.ready = false;
        }

        internal function frame6():*
        {
            stop();
            this.ready = true;
        }

        internal function frame7():*
        {
            gotoAndStop("dead");
        }

        internal function frame8():*
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

        internal function frame22():*
        {
            this.self.endAttack();
        }


    }
}//package zelda_fla


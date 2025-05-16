// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_standing_12

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

    public dynamic class kirby_standing_12 extends MovieClip 
    {

        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var fatstand:*;
        public var idle_repeat:*;

        public function kirby_standing_12()
        {
            addFrameScript(0, this.frame1, 29, this.frame30, 87, this.frame88, 88, this.frame89, 100, this.frame101);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.fatstand = false;
            this.idle_repeat = 0;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("kirbyPeachUsed", false);
            };
        }

        internal function frame30():*
        {
            if (this.idle_repeat == 3)
            {
                this.idle_repeat = 0;
                gotoAndPlay("fallover");
            }
            else
            {
                this.idle_repeat++;
                gotoAndPlay("repeat");
            };
        }

        internal function frame88():*
        {
            gotoAndPlay("repeat");
        }

        internal function frame89():*
        {
            this.fatstand = true;
        }

        internal function frame101():*
        {
            gotoAndPlay("fatstand_loop");
        }


    }
}//package kirby_fla


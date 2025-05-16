// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_jump_fly__24

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

    public dynamic class kirby_jump_fly__24 extends MovieClip 
    {

        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var done:*;
        public var fatjump:*;

        public function kirby_jump_fly__24()
        {
            addFrameScript(0, this.frame1, 22, this.frame23, 23, this.frame24, 33, this.frame34);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.done = false;
                this.fatjump = false;
                this.self.setGlobalVariable("kirbyPeachUsed", false);
            };
        }

        internal function frame23():*
        {
            this.done = true;
            this.gotoAndPlay("again");
        }

        internal function frame24():*
        {
            this.fatjump = true;
        }

        internal function frame34():*
        {
            this.done = true;
            stop();
        }


    }
}//package kirby_fla


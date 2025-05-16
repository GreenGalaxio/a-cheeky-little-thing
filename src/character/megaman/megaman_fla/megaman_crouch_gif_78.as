// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.megaman_crouch_gif_78

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

    public dynamic class megaman_crouch_gif_78 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function megaman_crouch_gif_78()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                SSF2API.print(this.self.getGlobalVariable("crashBomb"));
            };
        }

        internal function frame3():*
        {
            stop();
        }

        internal function frame4():*
        {
            this.gotoAndStop("stopped");
        }


    }
}//package megaman_fla


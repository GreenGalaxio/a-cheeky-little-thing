// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//bm_wolf

package 
{
    import flash.display.MovieClip;
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

    public dynamic class bm_wolf extends MovieClip 
    {

        public var stance:MovieClip;

        public function bm_wolf()
        {
            addFrameScript(0, this.frame1, 1, this.frame2);
        }

        internal function frame1():*
        {
            this.xframe = "walk";
            stop();
        }

        internal function frame2():*
        {
            this.xframe = "hurt";
            stop();
        }


    }
}//package 


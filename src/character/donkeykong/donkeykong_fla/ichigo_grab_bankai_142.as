// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.ichigo_grab_bankai_142

package donkeykong_fla
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

    public dynamic class ichigo_grab_bankai_142 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var grabBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var touchBox:MovieClip;
        public var xframe:String;

        public function ichigo_grab_bankai_142()
        {
            addFrameScript(0, this.frame1, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 27, this.frame28);
        }

        internal function frame1():*
        {
            this.xframe = "grab";
        }

        internal function frame18():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).endAttack();
            };
        }

        internal function frame19():*
        {
            this.xframe = "grab";
            stop();
        }

        internal function frame20():*
        {
            gotoAndStop("grabbed");
        }

        internal function frame21():*
        {
            this.xframe = "attack";
        }

        internal function frame28():*
        {
            this.gotoAndStop("grabbed");
        }


    }
}//package donkeykong_fla


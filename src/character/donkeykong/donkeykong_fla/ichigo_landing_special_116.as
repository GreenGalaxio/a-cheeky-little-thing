// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.ichigo_landing_special_116

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

    public dynamic class ichigo_landing_special_116 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;

        public function ichigo_landing_special_116()
        {
            addFrameScript(11, this.frame12);
        }

        internal function frame12():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).endAttack();
            };
        }


    }
}//package donkeykong_fla


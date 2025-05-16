// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_taunt_241

package sonic_fla
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

    public dynamic class sonic_taunt_241 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;

        public function sonic_taunt_241()
        {
            addFrameScript(2, this.frame3, 6, this.frame7, 10, this.frame11, 14, this.frame15, 18, this.frame19, 43, this.frame44);
        }

        internal function frame3():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).playGlobalSound("whoosh4");
            };
        }

        internal function frame7():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).playGlobalSound("whoosh4");
            };
        }

        internal function frame11():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).playGlobalSound("whoosh4");
            };
        }

        internal function frame15():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).playGlobalSound("whoosh4");
            };
        }

        internal function frame19():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).playGlobalSound("whoosh4");
            };
        }

        internal function frame44():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).endAttack();
            };
        }


    }
}//package sonic_fla


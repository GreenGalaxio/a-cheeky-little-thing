// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.supersonic_duck_attack__261

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

    public dynamic class supersonic_duck_attack__261 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;

        public function supersonic_duck_attack__261()
        {
            addFrameScript(0, this.frame1, 14, this.frame15);
        }

        internal function frame1():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).playVoiceSound(1);
            };
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).playAttackSound(1);
            };
        }

        internal function frame15():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                MovieClip(root).stageData.getPlayer(MovieClip(parent).player_id).endAttack();
            };
        }


    }
}//package sonic_fla


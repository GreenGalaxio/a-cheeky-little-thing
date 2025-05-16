// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_entrance_123

package sonic_fla
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

    public dynamic class sonic_entrance_123 extends MovieClip 
    {

        public function sonic_entrance_123()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 19, this.frame20, 27, this.frame28, 36, this.frame37);
        }

        internal function frame1():*
        {
        }

        internal function frame2():*
        {
            SSF2API.playSound("sonic_entrance");
        }

        internal function frame20():*
        {
            SSF2API.playSound("sonic_entrance_sfx");
        }

        internal function frame28():*
        {
            SSF2API.playSound("new_Sonic_intro");
        }

        internal function frame37():*
        {
            SSF2API.getCharacter(this).endAttack();
        }


    }
}//package sonic_fla


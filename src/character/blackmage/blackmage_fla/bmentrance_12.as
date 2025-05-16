// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmentrance_12

package blackmage_fla
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

    public dynamic class bmentrance_12 extends MovieClip 
    {

        public function bmentrance_12()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 6, this.frame7, 9, this.frame10, 12, this.frame13, 15, this.frame16, 18, this.frame19, 53, this.frame54);
        }

        internal function frame1():*
        {
        }

        internal function frame4():*
        {
            SSF2API.playSound("menumove");
        }

        internal function frame7():*
        {
            SSF2API.playSound("menumove");
        }

        internal function frame10():*
        {
            SSF2API.playSound("menumove");
        }

        internal function frame13():*
        {
            SSF2API.playSound("menumove");
        }

        internal function frame16():*
        {
            SSF2API.playSound("menumove");
        }

        internal function frame19():*
        {
            SSF2API.playSound("bm_Entrance_last");
        }

        internal function frame54():*
        {
            SSF2API.getCharacter(this).endAttack();
        }


    }
}//package blackmage_fla


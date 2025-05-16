// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.warioentrance_93

package wario_fla
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

    public dynamic class warioentrance_93 extends MovieClip 
    {

        public function warioentrance_93()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 31, this.frame32);
        }

        internal function frame1():*
        {
        }

        internal function frame2():*
        {
            SSF2API.playSound("wario_entrancesfx");
            SSF2API.playSound("wario_entrance");
        }

        internal function frame32():*
        {
            SSF2API.getCharacter(this).endAttack();
        }


    }
}//package wario_fla


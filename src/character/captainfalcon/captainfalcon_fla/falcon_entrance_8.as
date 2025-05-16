// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//captainfalcon_fla.falcon_entrance_8

package captainfalcon_fla
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

    public dynamic class falcon_entrance_8 extends MovieClip 
    {

        public var stance:MovieClip;

        public function falcon_entrance_8()
        {
            addFrameScript(11, this.frame12, 16, this.frame17, 26, this.frame27, 34, this.frame35, 46, this.frame47);
        }

        internal function frame12():*
        {
            SSF2API.playSound("entranceOpen");
        }

        internal function frame17():*
        {
            SSF2API.playSound("falcon_jumpS1");
        }

        internal function frame27():*
        {
            SSF2API.playSound("entranceClose");
        }

        internal function frame35():*
        {
            SSF2API.playSound("entranceLeave");
        }

        internal function frame47():*
        {
            SSF2API.getCharacter(this).endAttack();
        }


    }
}//package captainfalcon_fla


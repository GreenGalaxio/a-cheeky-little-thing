// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//yoshi_fla.Yoshi_entrance_12

package yoshi_fla
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

    public dynamic class Yoshi_entrance_12 extends MovieClip 
    {

        public var self:*;

        public function Yoshi_entrance_12()
        {
            addFrameScript(0, this.frame1, 12, this.frame13, 31, this.frame32);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame13():*
        {
            SSF2API.playSound("Yoshi_egg_hit");
        }

        internal function frame32():*
        {
            this.self.endAttack();
        }


    }
}//package yoshi_fla


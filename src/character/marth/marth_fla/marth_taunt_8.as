// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//marth_fla.marth_taunt_8

package marth_fla
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

    public dynamic class marth_taunt_8 extends MovieClip 
    {

        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;

        public function marth_taunt_8()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 3, this.frame4, 12, this.frame13, 20, this.frame21, 33, this.frame34, 42, this.frame43);
        }

        internal function frame1():*
        {
        }

        internal function frame2():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame4():*
        {
            SSF2API.playSound("marth_taunt", true);
        }

        internal function frame13():*
        {
            SSF2API.playSound("marth_sword_swing4");
        }

        internal function frame21():*
        {
            SSF2API.playSound("marth_sword_swing4");
        }

        internal function frame34():*
        {
            SSF2API.playSound("marth_sword_swing1");
        }

        internal function frame43():*
        {
            SSF2API.getCharacter(this).endAttack();
        }


    }
}//package marth_fla

